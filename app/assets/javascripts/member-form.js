var foundMemberId,token, test;

$(document).ready(function(){
  role();
  if (window.location.pathname === '/admin/renew'){
    $('.renew').show();
    loadMember();
  }
  else if (window.location.pathname === '/admin/members/new'){
    $('.new').show();
    showNewMembers();
    scan();
  }
  else{
    trainMember();
    makeExpert();
  }
});

function trainMember() {
  $('a.train').on('click', function(event){
    event.preventDefault();
    var trainButton = $(this);
    var c = confirm("Would you like to fully approve this member to use this workshop?");
    if (c == true) {
      var shopID = $('.train').attr('id');
      var memberID = $('.memberPage').attr('id');
      $.ajax({
        url: '/workshops/' + shopID + '/train.json',
        type: 'POST',
        data: { member_id: memberID },
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        success: function(){
          trainButton.text("MAKE EXPERT");
          trainButton.off('click');
          trainButton.removeClass('train').addClass('expert')
          makeExpert();
         }
       });
     } else {
       var url = trainButton.attr('href');
       var memberID = $('.memberPage').attr('id');
       window.location.href = url;
     }
  });
}

function makeExpert() {
  $('a.expert').on('click', function(event){
    event.preventDefault();
    var expertButton = $(this);
    var c = confirm("Make this member an expert in this shop? This will give full training permissions to this member.");
    if (c == true) {
       const shopID = expertButton.attr('id');
       const memberID = $('.memberPage').attr('id');
       $.ajax({
         url: '/workshops/' + shopID + '/expert.json',
         type: 'POST',
         data: { member_id: memberID },
         beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
         success: function(data){
           expertButton.hide();
         }
       });
     }
  });
}

function scan() {
  if (typeof io != 'undefined'){
    var socket = io.connect('http://192.168.1.3:3000');
    socket.on('regMember', function (data) {
      $('#member_cardID').val(data.cardID);
    });
  }
  else {
  console.log('error');
}
}

function role() {
  $('.role').on('change', function() {
    var role = $('#member_role').val();
    //require new login credentials if new member role is admin or officer
    if (role === 'admin' || role === 'officer'){
      $('.login').show();
    } else {
      $('.login').hide();
    }
  })
};

function clearForm(form) {
  // iterate over all of the inputs for the form element that was passed in
  $(':input', form).each(function() {
    var type = this.type;
    var tag = this.tagName.toLowerCase(); // normalize case
    // it's ok to reset the value attr of text inputs, password inputs, and textareas
    if (type == 'text' || type == 'password' || tag == 'textarea')
      this.value = "";
    // checkboxes and radios need to have their checked state cleared but should *not* have their 'value' changed
    else if (type == 'checkbox' || type == 'radio')
      this.checked = false;
    // select elements need to have their 'selectedIndex' property set to 0
    else if (tag == 'select')
      this.selectedIndex = 0;
  });
};

function loadMember() {
  $('.member').on('change', function(){
    var member_fullname = $('#member_fullname').val();
    var token = $('input[name=authenticity_token]').val();
		//post to members#search_by to retrieve member info
    $.post('/members/search_by.json', { field: 'fullname', value: member_fullname, authenticity_token: token }, function(data){
      if (data.length === 1){
        var renewMember = new Member(data[0])
        $('.member-name').text('Member Name: ' + renewMember.fullname);
        $('.member-expTime').text('Membership expires on ' + renewMember.formatExpTime());
        showRenewals(renewMember);
      }
      else if (data.length > 1){
        alert('Multiple members found')
      }
    });
  });
}

//update member on submit and append updated member to bottom of page.
function showRenewals(member) {
  var renewMember = member;
	$('input[type="submit"][value="Renew Member"]').click(function(event){
    event.preventDefault();
		if (typeof renewMember.id != 'undefined'){
      const token = $('input[name=authenticity_token]').val();
			const months = $('input[name="member[expirationTime]"]').val();
			$.ajax({
				url: '/admin/members/' + renewMember.id + '.json',
				type: 'PUT',
				data: {member: {expirationTime: {expTime: months}}, authenticity_token: token },
				success: function(data) {
					renewMember.expirationTime.expTime = data["expirationTime"]
					alert(renewMember.fullname + ' updated. New expiration: ' + renewMember.formatExpTime());
					$('.renewedMembers').show();
          $('.renewedMembers').append(renewMember.newTableRow(months));
					//reset form after renewMember
					clearForm($('.renew'));
					$('.member-name').text('');
					$('.member-expTime').text('');
				}
			});
		}
		else {
			alert("You must select a member first")
		}
	});
}

function showNewMembers() {
  $('input[type="submit"][value="Create Member"]').click(function(event) {
    event.preventDefault();
    var attributes = {
        _id: {$oid: 'noID' },
        fullname: $('#member_fullname').val(),
        cardID: $('#member_cardID').val(),
        role: $('#member_role').val(),
        expirationTime: $('#member_expirationTime').val(),
        startDate: $('#member_startDate').val()
      };
    token = $('input[name=authenticity_token]').val();
    var member = new Member(attributes);
    $.ajax({
      url: '/admin/members.json',
      type: 'POST',
      data: {member: member, authenticity_token: token },
      success: function(data){
        member.id = data._id.$oid;
        member.expirationTime = data.expirationTime;
        $('.newMembers').show();
        $('.newMembers').append(member.newMemberTableRow())
        clearForm($('.new'));
      }
    });
  });
}
