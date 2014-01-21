$(function () {

  $('.close').click(function() {
    var message_id = $(this).data('id');
    var message_exp = $(this).data('exp');
    // slide up button's parent div
    $(this).closest(".admin-flash-message").slideUp("slow");
    
    setCookie(message_id, 'disabled', message_exp);
  });
  
});  

function setCookie(name, value, date) {
  var parts = date.split('-');
  var day = parts[2].split(' ');
  var jsDate = new Date(parts[0], parts[1]-1, day[0]);
  var cookieDate = jsDate.toUTCString();
  document.cookie = "admin_flash_"+name+"="+value+"; "+cookieDate+"; path=/";
  
}
// Wed, 22 Jan 2014 08:00:00 GMT
// Wed Jan 22 2014 00:00:00 GMT-0800 (PST)
// 2014-01-22 03:39:03 UTC
// document.cookie = 'name=testcookie; expires=Thu, 2 Aug 2001 20:47:11 UTC; path=/' 