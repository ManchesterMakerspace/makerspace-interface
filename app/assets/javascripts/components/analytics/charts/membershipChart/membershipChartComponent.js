app.component('membershipChartComponent', {
  templateUrl: 'components/analytics/charts/membershipChart/_membershipChart.html',
  controller: membershipChartController,
  controllerAs: "membershipChartCtrl",
  bindings: {
    transactions: '<'
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
        title: "Total Number Membership Payments",
        xLabel: "Month",
        yLabel: "Total"
      },
    };

    if (!membershipChartCtrl.transactions.isRequesting) {
      membershipChartCtrl.parseTransactions();
    }
  };

  membershipChartCtrl.$onChanges = function () {
    if (!membershipChartCtrl.transactions.isRequesting) {
      membershipChartCtrl.parseTransactions();
    }
  };

  membershipChartCtrl.parseTransactions = function () {
    if (angular.equals(membershipChartCtrl.transactions.data, membershipChartCtrl.displayedTransactions)) {
      return;
    }
    membershipChartCtrl.displayedTransactions = angular.copy(membershipChartCtrl.transactions.data);
    var filteredTransactions = {};
    var startDate = Date.parse(membershipChartCtrl.startDate);
    var endDate = Date.parse(membershipChartCtrl.endDate);

    for (var dateStr in membershipChartCtrl.displayedTransactions) {
      var date = Date.parse(dateStr);
      var skip = false;
      if (startDate && date < startDate) {
        skip = true;
      }
      if (endDate && date > endDate) {
        skip = true;
      }
      if (!skip) {
        filteredTransactions[date] = membershipChartCtrl.displayedTransactions[dateStr];
      }
    }

    membershipChartCtrl.chartLabels = Object.keys(filteredTransactions).map(function (date) {
      return new Date(parseInt(date)).toDateString();
    });

    Object.values(filteredTransactions).map(function (transactions) {
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
