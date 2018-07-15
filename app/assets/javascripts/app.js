var app = angular.module('app', [
  'ui.router',
  'ui.bootstrap',
  'templates',
  'Devise',
  'ngAnimate',
  'ngMaterial',
  'ngMessages',
  'signature',
  'ipCookie',
  "chart.js"
]).run(function($transitions, $state, Auth, alertService){
  $transitions.onStart({}, function(trans){
    var toState = trans.to();
    if (/root/.test(toState.name)) {
      Auth.currentUser().catch(function(){
        if (toState.name !== 'root.members') {
          alertService.addAlert("Please log in");
          return $state.go("login");
        }
      });
    } else if (toState.name === 'login' || toState.name === 'register') {
      Auth.currentUser().then(function(){
          alertService.addAlert("Logged In", 'success');
          return $state.go("root.members");
      }).catch(function(){
          return;
      });
    }
  });
}).config(function($stateProvider, $urlRouterProvider, $locationProvider, AuthProvider, ChartJsProvider){
  // Configure all charts
  ChartJsProvider.setOptions({
    responsive: false
  });

  $locationProvider.hashPrefix('');

  AuthProvider.resourceName('member');
  AuthProvider.registerPath('api/members.json');
  AuthProvider.loginPath('api/members/sign_in.json');
  AuthProvider.logoutPath('api/members/sign_out.json');
  AuthProvider.sendResetPasswordInstructionsPath('api/members/password.json');
  AuthProvider.resetPasswordPath('api/members/password.json');

  $urlRouterProvider.otherwise('/members');
  $stateProvider
    .state('login', {
      url: '/login',
      component: 'loginComponent'
    })
    .state('register', {
      url: '/register/:id/:token',
      component: 'registerComponent',
      params: {
        token: null
      },
      resolve: {
        groups: function(groupService){
          return groupService.getAllGroups();
        },
        token: function(tokenService, $stateParams, $q, $state, alertService){
          return tokenService.validate($stateParams.id, $stateParams.token).then(function(email){
            return {
              token: $stateParams.token,
              id: $stateParams.id,
              email: email
            };
          }).catch(function(err){
            $state.go('login');
            alertService.addAlert(err.data.msg, "danger");
            return $q.reject();
          });
        }
      }
    })
    .state('passwordReset', {
      url: '/resetPassword',
      component: 'passwordComponent'
    })
    .state('passwordResetConfirm', {
      url: '/resetPassword/:token',
      component: 'passwordComponent',
      params: {
        token: null
      }
    })
    .state('root', {
      abstract: true,
      component: 'rootComponent',
      resolve: {
        currentUser: function(Auth, $q){
          return Auth.currentUser().then(function(response){
            return response;
          }).catch(function(){
            $q.resolve();
          });
        }
      }
    })
    .state('root.admin', {
      abstract: true,
      resolve: {
        auth: function(currentUser, $q, alertService, $state){
          var deferred = $q.defer();
          if(currentUser.role !== 'admin'){
            $state.go('root.members');
            alertService.addAlert('Unauthorized', 'danger');
            deferred.reject('Not Authorized');
          } else {
            deferred.resolve();
          }
          return deferred.promise;
        }
      }
    })
    .state('root.admin.memberEdit', {
      url: '/members/:id',
      component: 'memberEditComponent',
      resolve: {
        member: function($stateParams, memberService) {
          return memberService.getById($stateParams.id);
        },
        cards: function(member, cardService) {
          return cardService.getMemberCards(member.id);
        },
        groups: function(groupService){
          return groupService.getAllGroups();
        }
      }
    })
    .state('root.admin.memberships', {
      url: '/memberships',
      component: 'membershipsComponent',
      abstract: true
    })
    .state('root.admin.memberships.new', {
      url: '/new',
      component: 'newMemberComponent',
      resolve: {
        card: function(cardService){
          return cardService.getLatestRejection();
        },
        groups: function(groupService){
          return groupService.getAllGroups();
        }
      }
    })
    .state('root.admin.memberships.renew', {
      url: '/renew',
      component: 'renewMemberComponent',
      resolve: {
        members: function(memberService){
          return memberService.getAllMembers();
        }
      }
    })
    .state('root.admin.memberships.renewId', {
      url: '/renew/:id',
      component: 'renewMemberComponent',
      resolve: {
        members: function(memberService){
          return memberService.getAllMembers();
        }
      }
    })
    .state('root.admin.memberships.invite', {
      url: '/invite/{email:string}',
      component: 'inviteComponent',
      params: {
        email: null
      }
    })
    .state('root.members', {
      url: '/members',
      component: 'membersIndexComponent',
      resolve: {
        members: function(memberService){
          return memberService.getAllMembers();
        }
      }
    })
    .state('root.rentals', {
      url: '/rentals',
      component: 'rentalsComponent',
      resolve: {
        rentals: function(rentalsService) {
          return rentalsService.getAllRentals();
        }
      }
    })
    .state('root.admin.rentals', {
      url: "/rentals",
      component: 'rentalsComponent',
      abstract: true,
      resolve: {
        rentals: function(rentalsService) {
          return rentalsService.getAllRentals();
        },
        members: function(memberService){
          return memberService.getAllMembers();
        }
      }
    })
    .state('root.admin.rentals.edit', {
      url: '/:id',
      component: 'rentalFormComponent',
      resolve: {
        rental: function(rentalsService, $stateParams) {
          return rentalsService.getByID($stateParams.id).then(function(response){
            return response;
          });
        }
      }
    })
    .state('root.admin.rentals.new', {
      url: '/new',
      component: 'rentalFormComponent'
    })
    .state('root.admin.analytics', {
      url: '/analytics',
      component: 'analyticsComponent'
    })
    .state('root.admin.analytics.charts', {
      url: '/charts',
      component: 'chartsComponent'
    })
    .state('root.admin.analytics.tables', {
      url: '/tables',
      component: 'tablesComponent'
    });
});
