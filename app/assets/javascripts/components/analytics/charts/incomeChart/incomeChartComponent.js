app.component('incomeChartComponent', {
  templateUrl: 'components/analytics/charts/incomeChart/_incomeChart.html',
  controller: incomeChartController,
  controllerAs: "incomeChartCtrl",
  bindings: {
    categories: '<'
  }
});

var CHART_OPTIONS = {
  netDollars: {
    title: "Total Monthly Income by Source",
  },
  averageDollars: {
    title: "Average Monthly Income by Source",
  },
};

function incomeChartController() {
  var incomeChartCtrl = this;
  incomeChartCtrl.$onInit = function() {
    incomeChartCtrl.netDollarsData = [];
    incomeChartCtrl.averageDollarsData = [[]];
    incomeChartCtrl.chartLabels = [];
    incomeChartCtrl.selectedIndex = 0;

    incomeChartCtrl.parseCategories(incomeChartCtrl.categories);
  };

  incomeChartCtrl.$onChanges = function () {
    incomeChartCtrl.parseCategories(incomeChartCtrl.categories);
  };

  incomeChartCtrl.parseCategories = function (categories) {
    if (Array.isArray(categories)) {
      incomeChartCtrl.chartLabels = categories.map(function (categories) {
        return categories.name;
      });

      categories.map(function (category) {
        // var transactionCount = category.transactions.length;
        incomeChartCtrl.netDollarsData.push(category.total_credit);
        // var averageDollars = category.reported_net / transactionCount;
        // incomeChartCtrl.averageDollarsData[0].push(averageDollars);
      });
      console.log(incomeChartCtrl.netDollarsData);
    }
  };

  incomeChartCtrl.setOptions = function () {
    var targetChartKey = Object.keys(CHART_OPTIONS)[incomeChartCtrl.selectedIndex];
    var targetChart = CHART_OPTIONS[targetChartKey];
    incomeChartCtrl.options = {
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
