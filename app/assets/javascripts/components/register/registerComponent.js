app.component('registerComponent', {
  templateUrl: 'components/register/_register.html',
  controller: registerController,
  controllerAs: "registerCtrl",
  bindings: {
    groups: '<',
    token: '<',
    contract: '<'
  }
});

function registerController(Auth, $state, slackService, alertService, $timeout) {
  var registerCtrl = this;
  registerCtrl.$onInit = function() {
    registerCtrl.signedContact = false;
    registerCtrl.completedForm = false;
    registerCtrl.registerForm = {
      email: registerCtrl.token.email
    };
  };

  registerCtrl.registerMember = function(){
    registerCtrl.registerForm.token = registerCtrl.token.token;
    registerCtrl.registerForm.token_id = registerCtrl.token.id;
    registerCtrl.registerForm.role = registerCtrl.token.role;
    Auth.register(registerCtrl.registerForm). then(function(){
      slackService.connect();
      return $timeout(function(){
        slackService.invite(registerCtrl.registerForm.email, registerCtrl.registerForm.fullname);
        slackService.disconnect();
      }, 500).then(function(){
        alertService.addAlert('Registration Complete!', 'success');
        $state.go('root.members');
      }).catch(function(err){
        console.log(err);
        alertService.addAlert("Error inviting to Slack!", "danger");
      });
    }).catch(function(err){
      console.log(err);
      alertService.addAlert('Error registering. Please contact board@manchestermakerspace.org!', 'danger');
    });
  };

  registerCtrl.signContract = function(signature){
    if(signature.dataUrl) {
      registerCtrl.registerForm.signature = signature.dataUrl;
      registerCtrl.registerMember();
    }
  };

  registerCtrl.submitForm = function(form){
    if(!form) {return;}
    registerCtrl.completedForm = true;
  };
}
