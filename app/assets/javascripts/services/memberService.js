app.factory('memberService', function($http){

  var getAllMembers = function(){
    return $http.get('/api/members').then(function(response){
      var members = response.data.map(function(member){
        member.allowedWorkshops = member.allowed_workshops.map(function(shop){
          return shop.name;
        }).join(", ");
        delete member.allowed_workshops;
        member.expirationTime = new Date(member.expirationTime);
        return member;
      });
      return members;
    });
  };

  var getById = function(id){
    return $http.get('/api/members/' + id).then(function(response){
      console.log(response);
      return response.data;
    });
  };

  var createMember = function(memberData){
    return $http.post('/api/admin/members', {member: memberData}).then(function(response){
      return response.data;
    });
  };

  var renewMemberByPayment = function(paymentData){
    var member = paymentData.member;
    member.renewal = {
      months: paymentData.months
    };
    return $http.put('/api/admin/members/' + paymentData.member.id, {member: member});
  };

  var updateMember = function(memberData) {
    return $http.put('/api/admin/members/' + memberData.id, {member: memberData}).then(function(response){
      return response.data;
    });
  };

  var introMember = function(formData){
    return $http.post('/api/admin/members/intro', formData);
  };

  return {
    getAllMembers: getAllMembers,
    getById: getById,
    createMember: createMember,
    renewMemberByPayment: renewMemberByPayment,
    updateMember: updateMember,
    introMember: introMember
  };
});
