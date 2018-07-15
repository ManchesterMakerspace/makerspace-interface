app.component('tablesComponent', {
  templateUrl: 'components/analytics/tables/_tables.html',
  controller: tablesController,
  controllerAs: "tablesCtrl",
  bindings: {
  }
});

function tablesController(analyticsService) {
  var tablesCtrl = this;
  tablesCtrl.$onInit = function() {
    tablesCtrl.getTransactions();
    tablesCtrl.getCategories();
    tablesCtrl.getAccounts();
  };

  tablesCtrl.getTransactions = function () {
    analyticsService.getTransactions().then(function (transactions) {
      tablesCtrl.transactions = transactions;
    });
  };

  tablesCtrl.getCategories = function () {
    analyticsService.getCategories().then(function (categories) {
      tablesCtrl.categories = categories;
    });
  };

  tablesCtrl.getAccounts = function () {
    analyticsService.getAccounts().then(function (accounts) {
      tablesCtrl.accounts = accounts;
    });
  };
}
