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
    type: "Income"
  },
  rentals: {
    categoryName: "Plot Rental - Program Service Fees",
    type: "Income"
  },
  classes: {
    categoryName: "Classes - Program Service Fees",
    type: "Income"
  },
  income: {
    categoryName: "All Income",
    type: "Income"
  },
  utilities: {
    categoryName: "Utilities",
    type: "Expense"
  },
  shops: {
    categoryName: "Shop Expense",
    type: "Expense"
  },
  expense: {
    categoryName: "All Expense",
    type: "Expense"
  }
};

function analyticsController(analyticsService) {
  var analyticsCtrl = this;
  analyticsCtrl.$onInit = function() {
    analyticsCtrl.income = {
      data: {
        members: [],
        rentals: [],
        classes: [],
        income: []
      },
      isRequesting: false,
      errors: "",
      dataset: null
    };
    analyticsCtrl.expense = {
      data: {
        utilities: [],
        shops: [],
        expense: []
      },
      isRequesting: false,
      errors: "",
      dataset: null
    };
    analyticsCtrl.selectedIncomeIndex = 0;
  };

  analyticsCtrl.getTransactions = function (transaction_category) {
    analyticsCtrl.setData(transaction_category, [], true);
    return analyticsService.getTransactions(DATA_MAP[transaction_category].categoryName).then(function (groupedTransactions) {
      analyticsCtrl.setData(transaction_category, angular.copy(groupedTransactions), false);
    }).catch(function (e) {
      analyticsCtrl.setData(transaction_category, [], false, e);
    });
  };

  analyticsCtrl.getCategories = function (type) {
    analyticsCtrl.setData(type, [], true);
    return analyticsService.getCategories(type).then(function (transactions) {
      analyticsCtrl.setData(type, angular.copy(transactions), false);
    }).catch(function (e) {
      analyticsCtrl.setData(type, [], false, e);
    });
  };

  analyticsCtrl.setData = function (dataset, data, isRequesting, error = "") {
    var desiredOutput = {
      dataset: dataset,
      isRequesting: isRequesting,
      error: error
    };
    var dataMap = DATA_MAP[dataset];
    var dataType = dataMap && dataMap.type.toLowerCase();
    if (dataType === 'income') {
      desiredOutput.data = angular.copy(analyticsCtrl.income.data);
      desiredOutput.data[dataset] = data;
      analyticsCtrl.income = desiredOutput;
    } else if (dataType === 'expense') {
      desiredOutput.data = angular.copy(analyticsCtrl.expense.data);
      desiredOutput.data[dataset] = data;
      analyticsCtrl.expense = desiredOutput;
    }
  };
}
