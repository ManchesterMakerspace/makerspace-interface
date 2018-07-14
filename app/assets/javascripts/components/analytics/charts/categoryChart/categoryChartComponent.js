app.component('categoryChartComponent', {
  templateUrl: 'components/analytics/charts/categoryChart/_categoryChart.html',
  controller: categoryChartController,
  controllerAs: "categoryChartCtrl",
  bindings: {
    chartData: '<',
    reloadData: '&'
  }
});

function categoryChartController() {
  var categoryChartCtrl = this;
  categoryChartCtrl.$onInit = function() {
    categoryChartCtrl.datasetKey = 'income';
    categoryChartCtrl.dataSource = 'categories';
    categoryChartCtrl.netDollarsData = [];
    categoryChartCtrl.averageDollarsData = [[]];
    categoryChartCtrl.chartLabels = [];
    categoryChartCtrl.includedLabels = [];
    categoryChartCtrl.allLabels = [];
    categoryChartCtrl.selectedIndex = 0;
    categoryChartCtrl.chartOptions = {
      netDollars: {
        title: "Total Monthly Income by Source",
      },
      averageDollars: {
        title: "Average Monthly Income by Source",
      },
    };
    categoryChartCtrl.loadAndParseCategories();
  };

  categoryChartCtrl.$onChanges = function (changes) {
    if (changes.chartData.isFirstChange()) { return; } // Make onInit fire first
    categoryChartCtrl.loadAndParseCategories();
  };

  categoryChartCtrl.getCategoryParams = function (){
    return {
      source: categoryChartCtrl.dataSource,
      params: {
        type: categoryChartCtrl.datasetKey,
        startDate: categoryChartCtrl.startDate,
        endDate: categoryChartCtrl.endDate
      }
    };
  };

  categoryChartCtrl.loadAndParseCategories = function () {
    if (!categoryChartCtrl.chartData.isRequesting) {
      var incomingData = categoryChartCtrl.chartData.data;
      if (!incomingData || angular.equals(incomingData, categoryChartCtrl.currentData)) {
        return;
      }
      categoryChartCtrl.currentData = incomingData;
      categoryChartCtrl.sortCategories();
      categoryChartCtrl.allLabels = categoryChartCtrl.getLabels(categoryChartCtrl.chartData.data);

      categoryChartCtrl.parseCategories();
    }
  };

  categoryChartCtrl.getLabels = function (inputData) {
    return inputData.map(function (c) {
      return categoryChartCtrl.getLabel(c);
    });
  };

  categoryChartCtrl.getLabel = function (category) {
    return category.name;
  };

  categoryChartCtrl.sortCategories = function () {
    categoryChartCtrl.chartData.data.sort(function (a, b) {
      return b.calculated_net - a.calculated_net;
    });
  };

  categoryChartCtrl.parseCategories = function () {
    categoryChartCtrl.displayedCategories = angular.copy(categoryChartCtrl.chartData.data);
    if (categoryChartCtrl.includedLabels.length) {
      categoryChartCtrl.displayedCategories = categoryChartCtrl.displayedCategories.filter(function (c) {
        return categoryChartCtrl.includeLabel(categoryChartCtrl.getLabel(c));
      });
    }
    if (Array.isArray(categoryChartCtrl.displayedCategories)) {
      categoryChartCtrl.chartLabels = categoryChartCtrl.getLabels(categoryChartCtrl.displayedCategories);
      categoryChartCtrl.includedLabels = angular.copy(categoryChartCtrl.chartLabels);
      categoryChartCtrl.netDollarsData = categoryChartCtrl.displayedCategories.map(function (category) {
        return category.calculated_net;
      });
    }
  };

  categoryChartCtrl.updateLabels = function (label) {
    if (categoryChartCtrl.includedLabels.includes(label)) {
      categoryChartCtrl.includedLabels = categoryChartCtrl.includedLabels.filter((function (l) { return l !== label; }));
    } else {
      categoryChartCtrl.includedLabels.push(label);
    }
    categoryChartCtrl.parseCategories();
  };

  categoryChartCtrl.includeLabel = function (label) {
    return categoryChartCtrl.includedLabels.includes(label);
  };

  categoryChartCtrl.setOptions = function () {
    var targetChartKey = Object.keys(categoryChartCtrl.chartOptions)[categoryChartCtrl.selectedIndex];
    var targetChart = categoryChartCtrl.chartOptions[targetChartKey];
    categoryChartCtrl.options = {
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
