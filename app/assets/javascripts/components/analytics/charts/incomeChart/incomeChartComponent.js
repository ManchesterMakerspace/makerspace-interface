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
    incomeChartCtrl.netDollarsData = [];
    incomeChartCtrl.averageDollarsData = [[]];
    incomeChartCtrl.chartLabels = [];
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
      incomeChartCtrl.parseCategories(incomeChartCtrl.income.data);
    }
  };

  incomeChartCtrl.$onChanges = function () {
    if (!incomeChartCtrl.income.isRequesting) {
      incomeChartCtrl.parseCategories(incomeChartCtrl.income.data);
    }
  };

  incomeChartCtrl.parseCategories = function (categories) {
    categories = categories.sort(function (a, b) {
      return b.total_credit - a.total_credit;
    });
    if (Array.isArray(categories)) {
      incomeChartCtrl.chartLabels = categories.map(function (categories) {
        return categories.name;
      });

      incomeChartCtrl.netDollarsData = categories.map(function (category) {
        return category.total_credit;
      });
    }
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
