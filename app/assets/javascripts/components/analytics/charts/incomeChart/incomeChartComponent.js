app.component('incomeChartComponent', {
  templateUrl: 'components/analytics/charts/incomeChart/_incomeChart.html',
  controller: incomeChartController,
  controllerAs: "incomeChartCtrl",
  bindings: {
    income: '<'
  }
});

function incomeChartController() {
  var incomeChartCtrl = this;
  incomeChartCtrl.$onInit = function() {
    incomeChartCtrl.dataSetKey = "income";
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

    if (!incomeChartCtrl.income.isRequesting) {
      var incomingData = incomeChartCtrl.income.data[incomeChartCtrl.dataSetKey];
      if (!incomingData || angular.equals(incomingData, incomeChartCtrl.currentData)) {
        return;
      }
      incomeChartCtrl.sortCategories();
      incomeChartCtrl.allLabels = incomeChartCtrl.getLabels(incomeChartCtrl.income.data[incomeChartCtrl.dataSetKey]);
      incomeChartCtrl.parseCategories();
    }
  };

  incomeChartCtrl.$onChanges = function () {
    if (!incomeChartCtrl.income.isRequesting) {
      var incomingData = incomeChartCtrl.income.data[incomeChartCtrl.dataSetKey];
      if (!incomingData || angular.equals(incomingData, incomeChartCtrl.currentData)) {
        return;
      }
      incomeChartCtrl.currentData = incomingData;
      incomeChartCtrl.sortCategories();
      incomeChartCtrl.allLabels = incomeChartCtrl.getLabels(incomeChartCtrl.income.data[incomeChartCtrl.dataSetKey]);
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
    incomeChartCtrl.income.data[incomeChartCtrl.dataSetKey].sort(function (a, b) {
      return b.total_credit - a.total_credit;
    });
  };

  incomeChartCtrl.parseCategories = function () {
    incomeChartCtrl.displayedCategories = angular.copy(incomeChartCtrl.income.data[incomeChartCtrl.dataSetKey]);
    if (incomeChartCtrl.includedLabels.length) {
      incomeChartCtrl.displayedCategories = incomeChartCtrl.displayedCategories.filter(function (c) {
        return incomeChartCtrl.includeLabel(incomeChartCtrl.getLabel(c));
      });
    }
    if (Array.isArray(incomeChartCtrl.displayedCategories)) {
      incomeChartCtrl.chartLabels = incomeChartCtrl.getLabels(incomeChartCtrl.displayedCategories);
      incomeChartCtrl.includedLabels = angular.copy(incomeChartCtrl.chartLabels);
      incomeChartCtrl.netDollarsData = incomeChartCtrl.displayedCategories.map(function (category) {
        return category.total_credit;
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
