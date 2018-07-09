app.factory('analyticsService', function($http){
  var getTransactions = function (category) {
    return $http.get('/api/admin/virtual_accountant/transactions?category=' + category).then(function (response) {
      return response.data;
    });
  };

  var getCategories = function (type) {
    return $http.get('/api/admin/virtual_accountant/categories?type=' + type).then(function (response) {
      return response.data;
    });
  };

  return {
    getTransactions: getTransactions,
    getCategories: getCategories
  };
});
