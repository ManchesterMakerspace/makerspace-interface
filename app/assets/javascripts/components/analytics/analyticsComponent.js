app.component('analyticsComponent', {
  templateUrl: 'components/analytics/_analytics.html',
  controller: analyticsController,
  controllerAs: "analyticsCtrl",
  bindings: {
  }
});

function analyticsController() {
  var analyticsCtrl = this;
  analyticsCtrl.$onInit = function() {

  };
}
