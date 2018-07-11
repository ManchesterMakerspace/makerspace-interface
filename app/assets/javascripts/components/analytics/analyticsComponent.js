app.component('analyticsComponent', {
  templateUrl: 'components/analytics/_analytics.html',
  controller: analyticsController,
  controllerAs: "analyticsCtrl",
  bindings: {
  }
});

var DATA_MAP = {
  members: {
    categoryName: "Membership Dues - Program Income",
    key: "member",
    type: "Income"
  },
  rentals: {
    categoryName: "Plot Rental - Program Service Fees",
    key: "rentals",
    type: "Income"
  },
  classes: {
    categoryName: "Classes - Program Service Dues",
    key: "classes",
    type: "Income"
  },
  income: {
    categoryName: "All Income",
    key: "income",
    type: "Income"
  },
  utilities: {
    categoryName: "Utilities",
    key: "utilities",
    type: "Expense"
  },
  shops: {
    categoryName: "Shop Expense",
    key: "shops",
    type: "Expense"
  },
  expense: {
    categoryName: "All Expense",
    key: "expense",
    type: "Expense"
  },
  iKCAD: {
    categoryName: "In-Kind Current Asset Donation",
    key: "iKCAD",
    type: "Income"
  },
};

var GROUP_TRANSACTIONS_BY = {
  year: {
    key: "year",
    label: "Per year",
  },
  quarter: {
    key: "quarter",
    label: "Per quarter",
  },
  month: {
    key: "month",
    label: "Per month",
  },
  week: {
    key: "week",
    label: "Per week",
  },
  day: {
    key: "day",
    label: "Per day",
  },
  hour: {
    key: "hour",
    label: "Per hour"
}};

function analyticsController(analyticsService) {
  var analyticsCtrl = this;
  analyticsCtrl.$onInit = function() {
    analyticsCtrl.groupTransactionsBy = Object.keys(GROUP_TRANSACTIONS_BY).map(function (key) {
      return GROUP_TRANSACTIONS_BY[key];
    });
    analyticsCtrl.datasetOptions = Object.keys(DATA_MAP).map(function (key) {
      return { key: key, label: DATA_MAP[key].categoryName };
    });
    analyticsCtrl.charts = ["members"];
    analyticsCtrl.income = {
      members: {
        isRequesting: false,
        errors: "",
        data: []
      },
      rentals: {
        isRequesting: false,
        errors: "",
        data: []
      },
      classes: {
        isRequesting: false,
        errors: "",
        data: []
      },
      income: {
        isRequesting: false,
        errors: "",
        data: []
      },
    };
    analyticsCtrl.expense = {
      utilities: {
        isRequesting: false,
        data: [],
        errors: "",
      },
      shops: {
        isRequesting: false,
        data: [],
        errors: "",
      },
      expense:{
        isRequesting: false,
        data: [],
        errors: "",
      },
    };
    analyticsCtrl.selectedIndex = 0;
  };

  analyticsCtrl.getTransactions = function (transaction_category, grouping, startDate, endDate) {
    analyticsCtrl.setData(transaction_category, [], true);
    return analyticsService.getTransactions(
      DATA_MAP[transaction_category].categoryName,
      grouping,
      startDate,
      endDate
    ).then(function (groupedTransactions) {
      analyticsCtrl.setData(transaction_category, angular.copy(groupedTransactions), false);
    }).catch(function (e) {
      analyticsCtrl.setData(transaction_category, [], false, e);
    });
  };

  analyticsCtrl.getCategories = function (type, grouping, startDate, endDate) {
    analyticsCtrl.setData(type, [], true);
    return analyticsService.getCategories(
      type,
      grouping,
      startDate,
      endDate
    ).then(function (transactions) {
      analyticsCtrl.setData(type, angular.copy(transactions), false);
    }).catch(function (e) {
      analyticsCtrl.setData(type, [], false, e);
    });
  };

  analyticsCtrl.reloadData = function (source, params) {
    var grouping = GROUP_TRANSACTIONS_BY[params.grouping];
    if (source === 'transactions') {
      analyticsCtrl.getTransactions(params.type, grouping, params.startDate, params.endDate);
    } else if (source === 'categories') {
      analyticsCtrl.getCategories(params.type, grouping, params.startDate, params.endDate);
    }
    if (params.type !== 'income' && params.type !== 'expense') {
      analyticsCtrl.updateChart(params);
    }
  };

  analyticsCtrl.updateChart = function (params) {
    var existingChartIndex = analyticsCtrl.charts.findIndex(function (chartName) {
      return chartName === params.type;
    });
    if (existingChartIndex > -1) {
      analyticsCtrl.selectedIndex = existingChartIndex;
    } else {
      analyticsCtrl.charts.push(params.type);
      analyticsCtrl.selectedIndex = analyticsCtrl.charts.length - 1;
    }
  };

  analyticsCtrl.setData = function (dataset, data, isRequesting, error = "") {
    var desiredOutput = {
      data: data,
      isRequesting: isRequesting,
      error: error
    };
    var dataMap = DATA_MAP[dataset];
    var dataType = dataMap && dataMap.type.toLowerCase();
    if (dataType === 'income') {
      analyticsCtrl.income[dataset] = angular.copy(desiredOutput);
    } else if (dataType === 'expense') {
      analyticsCtrl.expense[dataset] = desiredOutput;
    }
  };
}
