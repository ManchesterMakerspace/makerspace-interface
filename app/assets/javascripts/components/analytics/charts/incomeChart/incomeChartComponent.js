app.component('incomeChartComponent', {
  templateUrl: 'components/analytics/charts/incomeChart/_incomeChart.html',
  controller: incomeChartController,
  controllerAs: "incomeChartCtrl",
  bindings: {
    chartData: '<',
    reloadData: '&'
  }
});

function incomeChartController() {
  var incomeChartCtrl = this;
  incomeChartCtrl.$onInit = function() {
    incomeChartCtrl.datasetKey = 'income';
    incomeChartCtrl.dataSource = 'categories';
    incomeChartCtrl.netDollarsData = [];
    incomeChartCtrl.averageDollarsData = [[]];
    incomeChartCtrl.chartLabels = [];
    incomeChartCtrl.includedLabels = [];
    incomeChartCtrl.allLabels = [];
    incomeChartCtrl.selectedIndex = 0;
    incomeChartCtrl.chartOptions = {
      netDollars: {
        title: "Total Monthly Income by Source",
      },
      averageDollars: {
        title: "Average Monthly Income by Source",
      },
    };
    incomeChartCtrl.loadAndParseCategories();
  };

  incomeChartCtrl.$onChanges = function (changes) {
    if (changes.chartData.isFirstChange()) { return; } // Make onInit fire first
    incomeChartCtrl.loadAndParseCategories();
  };

  incomeChartCtrl.getCategoryParams = function (){
    return {
      source: incomeChartCtrl.dataSource,
      params: {
        type: incomeChartCtrl.datasetKey,
        startDate: incomeChartCtrl.startDate,
        endDate: incomeChartCtrl.endDate
      }
    };
  };

  incomeChartCtrl.loadAndParseCategories = function () {
    if (!incomeChartCtrl.chartData.isRequesting) {
      var incomingData = incomeChartCtrl.chartData.data;
      if (!incomingData || angular.equals(incomingData, incomeChartCtrl.currentData)) {
        return;
      }
      incomeChartCtrl.currentData = incomingData;
      incomeChartCtrl.sortCategories();
      incomeChartCtrl.allLabels = incomeChartCtrl.getLabels(incomeChartCtrl.chartData.data);

      incomeChartCtrl.parseCategories();
    }
  };

  incomeChartCtrl.getLabels = function (inputData) {
    return inputData.map(function (c) {
      return incomeChartCtrl.getLabel(c);
    });
  };

  incomeChartCtrl.getLabel = function (category) {
    return category.name;
  };

  incomeChartCtrl.sortCategories = function () {
    incomeChartCtrl.chartData.data.sort(function (a, b) {
      return b.calculated_net - a.calculated_net;
    });
  };

  incomeChartCtrl.parseCategories = function () {
    incomeChartCtrl.displayedCategories = angular.copy(incomeChartCtrl.chartData.data);
    if (incomeChartCtrl.includedLabels.length) {
      incomeChartCtrl.displayedCategories = incomeChartCtrl.displayedCategories.filter(function (c) {
        return incomeChartCtrl.includeLabel(incomeChartCtrl.getLabel(c));
      });
    }
    if (Array.isArray(incomeChartCtrl.displayedCategories)) {
      incomeChartCtrl.chartLabels = incomeChartCtrl.getLabels(incomeChartCtrl.displayedCategories);
      incomeChartCtrl.includedLabels = angular.copy(incomeChartCtrl.chartLabels);
      incomeChartCtrl.netDollarsData = incomeChartCtrl.displayedCategories.map(function (category) {
        return category.calculated_net;
      });
    }
  };

  incomeChartCtrl.updateLabels = function (label) {
    if (incomeChartCtrl.includedLabels.includes(label)) {
      incomeChartCtrl.includedLabels = incomeChartCtrl.includedLabels.filter((function (l) { return l !== label; }));
    } else {
      incomeChartCtrl.includedLabels.push(label);
    }
    incomeChartCtrl.parseCategories();
  };

  incomeChartCtrl.includeLabel = function (label) {
    return incomeChartCtrl.includedLabels.includes(label);
  };

  incomeChartCtrl.setOptions = function () {
    var targetChartKey = Object.keys(incomeChartCtrl.chartOptions)[incomeChartCtrl.selectedIndex];
    var targetChart = incomeChartCtrl.chartOptions[targetChartKey];
    incomeChartCtrl.options = {
      title: {
        display: true,
        text: targetChart.title,
        fontSize: 16
      },
      legend: {
        display: true,
        position: "right"
      }
    };
  };
}
