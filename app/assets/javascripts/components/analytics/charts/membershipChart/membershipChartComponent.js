app.component('membershipChartComponent', {
  templateUrl: 'components/analytics/charts/membershipChart/_membershipChart.html',
  controller: membershipChartController,
  controllerAs: "membershipChartCtrl",
  bindings: {
    chartData: '<',
    reloadData: '&',
    groupDataOptions: '<',
    datasetOptions: '<',
    datasetKey: '<',
  }
});

function membershipChartController() {
  var membershipChartCtrl = this;
  membershipChartCtrl.$onInit = function() {
    membershipChartCtrl.dataSource = 'transactions';
    membershipChartCtrl.groupBy = 'month';
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

    membershipChartCtrl.loadAndParseData();
  };

  membershipChartCtrl.$onChanges = function (changes) {
    if (changes.chartData.isFirstChange()) { return; } // Make onInit fire first
    membershipChartCtrl.loadAndParseData();
  };

  membershipChartCtrl.getDataParams = function (){
    return {
      source: membershipChartCtrl.dataSource,
      params: {
        type: membershipChartCtrl.datasetKey,
        grouping: membershipChartCtrl.groupBy,
        startDate: membershipChartCtrl.startDate,
        endDate: membershipChartCtrl.endDate
      }
    };
  };

  membershipChartCtrl.loadAndParseData = function () {
    if (!membershipChartCtrl.chartData.isRequesting) {
      var incomingData = membershipChartCtrl.chartData.data;
      if (!incomingData || angular.equals(incomingData, membershipChartCtrl.currentData)) {
        return;
      }
      membershipChartCtrl.currentData = incomingData;

      membershipChartCtrl.parseData();
    }
  };

  membershipChartCtrl.parseData = function () {
    membershipChartCtrl.displayedTransactions = angular.copy(membershipChartCtrl.chartData.data);
    var netData = [];
    var countData = [];
    var averageData = [];

    membershipChartCtrl.chartLabels = Object.keys(membershipChartCtrl.displayedTransactions);

    Object.values(membershipChartCtrl.displayedTransactions).map(function (transactions) {
      var transactionCount = transactions.length;
      var netDollars = transactions.reduce(function (accumulator, transaction) {
        accumulator = accumulator + (transaction.net_amt);
        return accumulator;
      }, 0);
      var averageDollars = netDollars / transactionCount;
      netData.push(netDollars);
      countData.push(transactionCount);
      averageData.push(averageDollars);
    });
    membershipChartCtrl.netDollarsData = [netData];
    membershipChartCtrl.countData = [countData];
    membershipChartCtrl.averageDollarsData = [averageData];
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
