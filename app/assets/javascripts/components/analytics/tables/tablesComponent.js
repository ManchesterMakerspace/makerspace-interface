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

  };

  tablesCtrl.getTransactions = function () {
    analyticsService.getTransactionTable().then(function (transactions) {
      tablesCtrl.transactions = transactions;
    });
  };
}
