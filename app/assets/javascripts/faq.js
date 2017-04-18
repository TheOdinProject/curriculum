function setup() {
  $('#faq-accordion').on('show.bs.collapse', function (event) {
    var openedCardSelector = getOpenedCardSelector(event.target);
    $(openedCardSelector + ' .expander').hide();
    $(openedCardSelector + ' .minimizer').show();
  });

  $('#faq-accordion').on('hide.bs.collapse', function (event) {
    var openedCardSelector = getOpenedCardSelector(event.target);
    $(openedCardSelector + ' .minimizer').hide();
    $(openedCardSelector + ' .expander').show();
  });
}

function getOpenedCardSelector(element) {
  var openedCardId = $(element).attr('id');
  return '.faq-card a[href="#' + openedCardId + '"]';
}

$(document).on('turbolinks:load', setup);
