/* eslint-disable */

function setup() {
  $('#faq-accordion').on('show.bs.collapse', (event) => {
    const openedCardSelector = getOpenedCardSelector(event.target);
    $(`${openedCardSelector} .expander`).hide();
    $(`${openedCardSelector} .minimizer`).show();
  });

  $('#faq-accordion').on('hide.bs.collapse', (event) => {
    const openedCardSelector = getOpenedCardSelector(event.target);
    $(`${openedCardSelector} .minimizer`).hide();
    $(`${openedCardSelector} .expander`).show();
  });
}

function getOpenedCardSelector(element) {
  const openedCardId = $(element).attr('id');
  return `.faq-card a[href="#${openedCardId}"]`;
}

$(document).on('DOMContentLoaded', setup);
