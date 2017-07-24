$(document).on('turbolinks:load', setup);

function setup() {
  $('a[rel=popover]').popover();
  $('.tooltip, a[rel=tooltip], [data-toggle=tooltip]').tooltip();
}
