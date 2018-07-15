app.component('chartsComponent', {
  templateUrl: 'components/analytics/charts/_charts.html',
  controller: chartsController,
  controllerAs: "chartsCtrl",
  bindings: {
  }
});

var DATA_MAP = {
  members: {
    displayName: "Membership Dues",
    categoryName: "Membership Dues - Program Income",
    key: "members",
    type: "income"
  },
  rentals: {
    displayName: "Rentals",
    categoryName: "Plot Rental - Program Service Fees",
    key: "rentals",
    type: "income"
  },
  classes: {
    displayName: "Classes",
    categoryName: "Classes - Program Service Dues",
    key: "classes",
    type: "income"
  },
  income: {
    displayName: "All Incomes",
    categoryName: "All Income",
    key: "income",
    type: "income"
  },
  utilities: {
    displayName: "Utilities",
    categoryName: "Utilities",
    key: "utilities",
    type: "expense"
  },
  shops: {
    displayName: "Shop Expenses",
    categoryName: "Shop Expense",
    key: "shops",
    type: "expense"
  },
  expense: {
    displayName: "All Expenses",
    categoryName: "All Expense",
    key: "expense",
    type: "expense"
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

function chartsController(analyticsService) {
  var chartsCtrl = this;
  chartsCtrl.$onInit = function() {
    chartsCtrl.groupTransactionsBy = Object.keys(GROUP_TRANSACTIONS_BY).map(function (key) {
      return GROUP_TRANSACTIONS_BY[key];
    });
    chartsCtrl.datasetOptions = Object.values(DATA_MAP);
    chartsCtrl.charts = [DATA_MAP.members];
    chartsCtrl.income = {
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
    chartsCtrl.expense = {
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
    chartsCtrl.selectedIndex = 0;
  };

  chartsCtrl.getTransactions = function (transaction_category, grouping, startDate, endDate) {
    chartsCtrl.setData(transaction_category, [], true);
    return analyticsService.getTransactions(
      DATA_MAP[transaction_category].categoryName,
      grouping || 'month',
      startDate,
      endDate
    ).then(function (groupedTransactions) {
      chartsCtrl.setData(transaction_category, angular.copy(groupedTransactions), false);
    }).catch(function (e) {
      chartsCtrl.setData(transaction_category, [], false, e);
    });
  };

  chartsCtrl.getCategories = function (type, grouping, startDate, endDate) {
    chartsCtrl.setData(type, [], true);
    return analyticsService.getCategories(
      type,
      grouping,
      startDate,
      endDate
    ).then(function (transactions) {
      chartsCtrl.setData(type, angular.copy(transactions), false);
    }).catch(function (e) {
      chartsCtrl.setData(type, [], false, e);
    });
  };

  chartsCtrl.reloadData = function (source, params) {
    var grouping = GROUP_TRANSACTIONS_BY[params.grouping];
    if (source === 'transactions') {
      chartsCtrl.getTransactions(params.type, grouping, params.startDate, params.endDate);
    } else if (source === 'categories') {
      chartsCtrl.getCategories(params.type, grouping, params.startDate, params.endDate);
    }
    if (params.type !== 'income' && params.type !== 'expense') {
      chartsCtrl.updateChart(params);
    }
  };

  chartsCtrl.updateChart = function (params) {
    var existingChartIndex = chartsCtrl.charts.findIndex(function (chart) {
      return chart.key === params.type;
    });
    if (existingChartIndex > -1) {
      chartsCtrl.selectedIndex = existingChartIndex;
    } else {
      chartsCtrl.charts.push(DATA_MAP[params.type]);
      chartsCtrl.selectedIndex = chartsCtrl.charts.length - 1;
    }
  };

  chartsCtrl.setData = function (dataset, data, isRequesting, error = "") {
    var desiredOutput = {
      data: data,
      isRequesting: isRequesting,
      error: error
    };
    var dataMap = DATA_MAP[dataset];
    var dataType = dataMap && dataMap.type.toLowerCase();
    if (dataType === 'income') {
      chartsCtrl.income[dataset] = angular.copy(desiredOutput);
    } else if (dataType === 'expense') {
      chartsCtrl.expense[dataset] = desiredOutput;
    }
  };
}
