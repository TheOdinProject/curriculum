$(function () {

  $('.admin-flash .close').click(function() {
    var message_id = $(this).data('id');
    var message_exp = $(this).data('expire');

    setAdminFlashCookie(message_id, 'disabled', message_exp);
  });
});

function setAdminFlashCookie(name, value, date) {
  var cookieDate = convertToCookieDate(date)
  document.cookie = "admin_flash_"+name+"="+value+"; "+cookieDate+"; path=/";
}

// Takes a SQL formatted date and converts it to cookie format
function convertToCookieDate(date) {
  var parts = date.split('-');
  var day = parts[2].split(' ');
  var jsDate = new Date(parts[0], parts[1]-1, day[0]);
  var cookieDate = jsDate.toUTCString();
}
