app.component('membershipChartComponent', {
  templateUrl: 'components/analytics/charts/membershipChart/_membershipChart.html',
  controller: membershipChartController,
  controllerAs: "membershipChartCtrl",
  bindings: {
    income: '<'
  }
});

function membershipChartController() {
  var membershipChartCtrl = this;
  membershipChartCtrl.$onInit = function() {
    membershipChartCtrl.netDollarsData = [[]];
    membershipChartCtrl.averageDollarsData = [[]];
    membershipChartCtrl.countData = [[]];
    membershipChartCtrl.chartLabels = [];
    membershipChartCtrl.selectedIndex = 0;
    membershipChartCtrl.chartOptions = {
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

    if (!membershipChartCtrl.income.isRequesting) {
      membershipChartCtrl.parseTransactions(membershipChartCtrl.income.data);
    }
  };

  membershipChartCtrl.$onChanges = function () {
    if (!membershipChartCtrl.income.isRequesting) {
      membershipChartCtrl.parseTransactions(membershipChartCtrl.income.data);
    }
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
    var targetChartKey = Object.keys(membershipChartCtrl.chartOptions)[membershipChartCtrl.selectedIndex];
    var targetChart = membershipChartCtrl.chartOptions[targetChartKey];
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
