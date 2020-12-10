/* eslint-disable */

$(() => {
  $('.admin-flash .close').click(function () {
    const message_id = $(this).data('id');
    const message_exp = $(this).data('expire');

    setAdminFlashCookie(message_id, 'disabled', message_exp);
  });
});

function setAdminFlashCookie(name, value, date) {
  const cookieDate = convertToCookieDate(date);
  document.cookie = `admin_flash_${name}=${value}; ${cookieDate}; path=/`;
}

// Takes a SQL formatted date and converts it to cookie format
function convertToCookieDate(date) {
  const parts = date.split('-');
  const day = parts[2].split(' ');
  const jsDate = new Date(parts[0], parts[1] - 1, day[0]);
  const cookieDate = jsDate.toUTCString();
}
