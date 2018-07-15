app.component('transactionTableComponent', {
  templateUrl: 'components/analytics/tables/transactionTable/_transactionTable.html',
  controller: transactionTableController,
  controllerAs: "transactionTableCtrl",
  bindings: {
    transactions: '<',
    accounts: '<',
    categories: '<',
  }
});

function transactionTableController() {
  var transactionTableCtrl = this;
  transactionTableCtrl.$onInit = function() {
    transactionTableCtrl.sortedColumn = "transaction_date";
    transactionTableCtrl.reverseSort = false;
    transactionTableCtrl.filter = {};
    transactionTableCtrl.columns = [
      {
        header: "Date",
        key: "transaction_date",
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
    if (transactionTableCtrl.sortedColumn === column.key) {
      transactionTableCtrl.reverseSort = !transactionTableCtrl.reverseSort;
    } else {
      transactionTableCtrl.sortedColumn = column.key;
      transactionTableCtrl.reverseSort = false;
    }
  };

  transactionTableCtrl.sortBy = function (transaction) {
    if (transactionTableCtrl.sortedColumn === "transaction_date") {
      return new Date(transaction[transactionTableCtrl.sortedColumn]).getTime();
    } else {
      return transaction[transactionTableCtrl.sortedColumn];
    }
  };
}
