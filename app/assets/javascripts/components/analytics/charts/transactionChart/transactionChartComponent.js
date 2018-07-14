app.component('transactionChartComponent', {
  templateUrl: 'components/analytics/charts/transactionChart/_transactionChart.html',
  controller: transactionChartController,
  controllerAs: "transactionChartCtrl",
  bindings: {
    chartData: '<',
    reloadData: '&',
    groupDataOptions: '<',
    datasetOptions: '<',
    datasetKey: '<',
  }
});

function transactionChartController() {
  var transactionChartCtrl = this;
  transactionChartCtrl.$onInit = function() {
    transactionChartCtrl.dataSource = 'transactions';
    transactionChartCtrl.groupBy = 'month';
    transactionChartCtrl.netDollarsData = [[]];
    transactionChartCtrl.averageDollarsData = [[]];
    transactionChartCtrl.countData = [[]];
    transactionChartCtrl.chartLabels = [];
    transactionChartCtrl.selectedIndex = 0;
    transactionChartCtrl.chartOptions = {
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

    transactionChartCtrl.loadAndParseData();
  };

  transactionChartCtrl.$onChanges = function (changes) {
    if (changes.chartData.isFirstChange()) { return; } // Make onInit fire first
    transactionChartCtrl.loadAndParseData();
  };

  transactionChartCtrl.getDataParams = function (){
    return {
      source: transactionChartCtrl.dataSource,
      params: {
        type: transactionChartCtrl.datasetKey,
        grouping: transactionChartCtrl.groupBy,
        startDate: transactionChartCtrl.startDate,
        endDate: transactionChartCtrl.endDate
      }
    };
  };

  transactionChartCtrl.loadAndParseData = function () {
    if (!transactionChartCtrl.chartData.isRequesting) {
      var incomingData = transactionChartCtrl.chartData.data;
      if (!incomingData || angular.equals(incomingData, transactionChartCtrl.currentData)) {
        return;
      }
      transactionChartCtrl.currentData = incomingData;
      var activeDataset = transactionChartCtrl.datasetOptions.find(function (option) {
        return option.key === transactionChartCtrl.datasetKey;
      });
      transactionChartCtrl.currentChartTitle = activeDataset && activeDataset.displayName;
      transactionChartCtrl.parseData();
      transactionChartCtrl.setOptions();
    }
  };

  transactionChartCtrl.parseData = function () {
    transactionChartCtrl.displayedTransactions = angular.copy(transactionChartCtrl.chartData.data);
    var netData = [];
    var countData = [];
    var averageData = [];

    transactionChartCtrl.chartLabels = Object.keys(transactionChartCtrl.displayedTransactions);

    Object.values(transactionChartCtrl.displayedTransactions).map(function (transactions) {
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
    transactionChartCtrl.netDollarsData = [netData];
    transactionChartCtrl.countData = [countData];
    transactionChartCtrl.averageDollarsData = [averageData];
  };

  transactionChartCtrl.setOptions = function () {
    var targetChartKey = Object.keys(transactionChartCtrl.chartOptions)[transactionChartCtrl.selectedIndex];
    var targetChart = transactionChartCtrl.chartOptions[targetChartKey];
    var chartTitle = targetChart.title + (transactionChartCtrl.currentChartTitle ? transactionChartCtrl.currentChartTitle : "");
    transactionChartCtrl.options = {
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
