app.component('membershipChartComponent', {
  templateUrl: 'components/analytics/charts/membershipChart/_membershipChart.html',
  controller: membershipChartController,
  controllerAs: "membershipChartCtrl",
  bindings: {
    transactions: '<'
  }
});

var CHART_OPTIONS = {
  netDollars: {
    title: "Total Monthly Membership Dues",
    xLabel: "Month",
    yLabel: "Net $"
  },
  averageDollars: {
    title: "Average Monthly Membership Dues",
    xLabel: "Month",
    yLabel: "Average $"
  },
  totalCount: {
    title: "Total Number Membership Dues",
    xLabel: "Month",
    yLabel: "Total"
  },
};

function membershipChartController() {
  var membershipChartCtrl = this;
  membershipChartCtrl.$onInit = function() {
    membershipChartCtrl.netDollarsData = [[]];
    membershipChartCtrl.averageDollarsData = [[]];
    membershipChartCtrl.countData = [[]];
    membershipChartCtrl.chartLabels = [];
    membershipChartCtrl.selectedIndex = 0;

    membershipChartCtrl.parseTransactions(membershipChartCtrl.transactions);
  };

  membershipChartCtrl.$onChanges = function () {
    membershipChartCtrl.parseTransactions(membershipChartCtrl.transactions);
  };

  membershipChartCtrl.parseTransactions = function (groupedTransactions) {
    membershipChartCtrl.chartLabels = Object.keys(groupedTransactions);

    Object.values(groupedTransactions).map(function (transactions) {
      var transactionCount = transactions.length;
      var netDollars = transactions.reduce(function (accumulator, transaction) {
        accumulator = accumulator + (transaction.debit_amt - transaction.credit_amt);
        return accumulator;
      }, 0);
      var averageDollars = netDollars / transactionCount;
      membershipChartCtrl.netDollarsData[0].push(netDollars);
      membershipChartCtrl.countData[0].push(transactionCount);
      membershipChartCtrl.averageDollarsData[0].push(averageDollars);
    });
  };

  membershipChartCtrl.setOptions = function () {
    var targetChartKey = Object.keys(CHART_OPTIONS)[membershipChartCtrl.selectedIndex];
    var targetChart = CHART_OPTIONS[targetChartKey];
    membershipChartCtrl.options = {
      title: {
        display: true,
        text: targetChart.title,
        fontSize: 16
      },
      scales: {
        yAxes: [{
          scaleLabel: {
            display: true,
            labelString: targetChart.yLabel
          }
        }],
        xAxes: [{
          scaleLabel: {
            display: true,
            labelString: targetChart.xLabel
          }
        }]
      }
    };
  };
}
