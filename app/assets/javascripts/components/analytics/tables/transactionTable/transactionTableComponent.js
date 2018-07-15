app.component('transactionTableComponent', {
  templateUrl: 'components/analytics/tables/transactionTable/_transactionTable.html',
  controller: transactionTableController,
  controllerAs: "transactionTableCtrl",
  bindings: {
  }
});

function transactionTableController(analyticsService) {
  var transactionTableCtrl = this;
  transactionTableCtrl.$onInit = function() {
    analyticsService.getTransactions().then(function (transactions) {
      transactionTableCtrl.transactions = transactions;
    });
    transactionTableCtrl.sortBy = "transaction_date";
    transactionTableCtrl.reverseSort = true;
    transactionTableCtrl.filter = {};
    transactionTableCtrl.columns = [
      {
        header: "Date",
        key: "date",
        sort: transactionTableCtrl.changeSort,
        body: (row) => row.transaction_date
      },
      {
        header: "Description",
        key: "description",
        sort: transactionTableCtrl.changeSort,
        body: (row) => row.description
      },
      {
        header: "Category",
        key: "category_name",
        sort: transactionTableCtrl.changeSort,
        body: (row) => row.category_name
      },
      {
        header: "Account",
        key: "account_name",
        sort: transactionTableCtrl.changeSort,
        body: (row) => null
      },
      {
        header: "Amount",
        key: "net_amt",
        sort: transactionTableCtrl.changeSort,
        body: (row) => `$${row.net_amt}`
      }
    ]
  };

  transactionTableCtrl.changeSort = function (column) {
    transactionTableCtrl.sortBy = column.key;
  };
}
