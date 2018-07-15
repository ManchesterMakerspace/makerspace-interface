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
    transactionTableCtrl.sortedColumn = "transaction_date";
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
        body: (row) => row.account_name
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
    transactionTableCtrl.sortedColumn = column.key;
  };

  transactionTableCtrl.sortBy = function (a, b) {
    if (transactionTableCtrl.sortedColumn === "date") {
      return new Date(a[transactionTableCtrl.sortedColumn]).getTime() - new Date(b[transactionTableCtrl.sortedColumn]).getTime();
    } else {
      return a[transactionTableCtrl.sortedColumn] - b[transactionTableCtrl.sortedColumn];
    }
  };
}
