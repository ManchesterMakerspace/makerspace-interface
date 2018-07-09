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
    analyticsCtrl.incomeData = [];
    analyticsCtrl.expenseData = [];
    analyticsCtrl.selectedIncomeIndex = 0;
    analyticsCtrl.getTransactions("members");
  };

  analyticsCtrl.getTransactions = function (transaction_category) {
    var data_map = DATA_MAP[transaction_category];

    if (data_map.type === "Income") {
      analyticsCtrl.incomeDataSet = transaction_category;
      analyticsCtrl.incomeData = [];
    } else {
      analyticsCtrl.expenseDataSet = transaction_category;
      analyticsCtrl.expenseData = [];
    }

    return analyticsService.getTransactions(DATA_MAP[transaction_category].categoryName).then(function (groupedTransactions) {
      if (data_map.type === "Income") {
        analyticsCtrl.incomeData = angular.copy(groupedTransactions);
      } else {
        analyticsCtrl.expenseData = angular.copy(groupedTransactions);
      }
    });
  };

  analyticsCtrl.getCategories = function (type) {
    analyticsCtrl.incomeDataSet = type
    return analyticsService.getCategories(type).then(function (transactions) {
      if (type === "income") {
        analyticsCtrl.incomeData = angular.copy(transactions);
      } else {
        analyticsCtrl.expenseData = angular.copy(transactions);
      }
    });
  };
}
