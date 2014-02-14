$(function () {

  $('.admin-flash-message .close').click(function() {
    var message_id = $(this).data('id');
    var message_exp = $(this).data('exp');
    // slide up button's parent div
    $(this).closest(".admin-flash-message").slideUp("slow");
    
    setAdminFlashCookie(message_id, 'disabled', message_exp);
  
    // Fire a Google Analytics custom event to identify when people close the flash message 
    _gaq.push(['_trackEvent','admin_flash','close_message','admin_flash',1]);
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