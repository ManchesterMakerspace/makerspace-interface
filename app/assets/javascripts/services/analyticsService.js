app.factory('analyticsService', function($http){
  var categoriesPath = "/api/admin/virtual_accountant/categories";
  var transactionsPath = "/api/admin/virtual_accountant/transactions";
  var assembleGetParams = function (params) {
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

  var getTransactions = function (category, grouping, startDate, endDate) {
    var urlParams = {
      category: category,
      startDate: startDate && startDate.toISOString() || undefined,
      endDate: endDate && endDate.toISOString() || undefined,
      grouping: grouping,
    };
    var url = transactionsPath + assembleGetParams(urlParams);
    return $http.get(url).then(function (response) {
      return response.data;
    });
  };

  var getCategories = function (type, grouping, startDate, endDate) {
    var urlParams = {
      type: type,
      startDate: startDate && startDate.toISOString() || undefined,
      endDate: endDate && endDate.toISOString() || undefined,
      grouping: grouping,
    };
    var url = categoriesPath + assembleGetParams(urlParams);
    return $http.get(url).then(function (response) {
      return response.data;
    });
  };

  return {
    getTransactions: getTransactions,
    getCategories: getCategories
  };
});
