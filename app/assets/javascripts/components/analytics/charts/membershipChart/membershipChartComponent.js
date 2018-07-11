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
    membershipChartCtrl.initDatasetKey = angular.copy(membershipChartCtrl.datasetKey);
    membershipChartCtrl.dataSource = 'transactions';
    membershipChartCtrl.groupBy = 'month';
    membershipChartCtrl.netDollarsData = [[]];
    membershipChartCtrl.averageDollarsData = [[]];
    membershipChartCtrl.countData = [[]];
    membershipChartCtrl.chartLabels = [];
    membershipChartCtrl.selectedIndex = 0;
    membershipChartCtrl.chartOptions = {
      netDollars: {
        title: "Total Monthly ",
        xLabel: "Month",
        yLabel: "Net $",
        tooltipFunction: function (tooltipItem) {
          return " $" + tooltipItem.yLabel.toFixed(2);
        }
      },
      averageDollars: {
        title: "Average Monthly ",
        xLabel: "Month",
        yLabel: "Average $",
        tooltipFunction: function (tooltipItem) {
          return " $" + tooltipItem.yLabel.toFixed(2);
        }
      },
      totalCount: {
        title: "Total Number Transactions - ",
        xLabel: "Month",
        yLabel: "Total",
        tooltipFunction: function (tooltipItem) {
          return " " + tooltipItem.yLabel;
        }
      },
    };

    membershipChartCtrl.loadAndParseData();
  };

  membershipChartCtrl.$onChanges = function (changes) {
    if (changes.chartData.isFirstChange()) { return; } // Make onInit fire first
    membershipChartCtrl.loadAndParseData();
  };

  membershipChartCtrl.getDataParams = function (){
    var params = {
      source: membershipChartCtrl.dataSource,
      params: {
        type: membershipChartCtrl.datasetKey,
        grouping: membershipChartCtrl.groupBy,
        startDate: membershipChartCtrl.startDate,
        endDate: membershipChartCtrl.endDate
      }
    };
    membershipChartCtrl.datasetKey = membershipChartCtrl.initDatasetKey;
    return params;
  };

  membershipChartCtrl.loadAndParseData = function () {
    if (!membershipChartCtrl.chartData.isRequesting) {
      var incomingData = membershipChartCtrl.chartData.data;
      if (!incomingData || angular.equals(incomingData, membershipChartCtrl.currentData)) {
        return;
      }
      membershipChartCtrl.currentData = incomingData;
      var activeDataset = membershipChartCtrl.datasetOptions.find(function (option) {
        return option.key === membershipChartCtrl.datasetKey;
      });
      membershipChartCtrl.currentChartTitle = activeDataset && activeDataset.displayName;
      membershipChartCtrl.parseData();
      membershipChartCtrl.setOptions();
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
    var chartTitle = targetChart.title + (membershipChartCtrl.currentChartTitle ? membershipChartCtrl.currentChartTitle : "");
    membershipChartCtrl.options = {
      title: {
        display: true,
        text: chartTitle,
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
      },
      tooltips: {
        callbacks: {
          label: (tooltipItem) => {
            return targetChart.tooltipFunction(tooltipItem);
          }
        }
      }
    };
  };
}
