app.factory('analyticsService', function($http){
  var categoriesPath = "/api/admin/virtual_accountant/categories";
  var transactionsPath = "/api/admin/virtual_accountant/transactions";
  var accountsPath = "/api/admin/virtual_accountant/accounts";

  var assembleGetParams = function (params) {
    if (!params) { return ""; }
    var url = "";
    if (Object.keys(params)) {
      url += "?";
    }
    for (var key in params) {
      if (params[key] === undefined) {continue;}
      if (url.last !== "?") {
        url += "&";
      }
      url += key + "=" + params[key];
    }
    return url;
  };

  var getTransactions = function (urlParams) {
    var url = transactionsPath + assembleGetParams(urlParams);
    return $http.get(url).then(function (response) {
      return response.data;
    });
  };

  var getCategories = function (urlParams) {
    var url = categoriesPath + assembleGetParams(urlParams);
    return $http.get(url).then(function (response) {
      return response.data;
    });
  };

  var getAccounts = function (urlParams) {
    var url = accountsPath + assembleGetParams(urlParams);
    return $http.get(url).then(function (response) {
      return response.data;
    });
  };

  return {
    getTransactions: getTransactions,
    getCategories: getCategories,
    getAccounts: getAccounts,
  };
});
