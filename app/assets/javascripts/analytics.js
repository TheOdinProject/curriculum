$(function(){

  // Fire a custom analytics event whenever any link is clicked
  $("a").on("click",function(e){
    var $target = $(e.target);
    var href = $target.attr("href");

    // manually set href for elements wrapped in anchor tags
    // this is because the click event target is actually the
    // internal element, e.g. an <h3> tag wrapped in <a> tags
    // will register a click target of <h3> not <a> so the
    // "href" property will be undefined and we must check its
    // parents to acquire the href.
    if(!href){
      href = $target.parents("a").attr("href");
    }

    // Send separate events for internal and external link clicks
    var regexp = /^http:/;
    if(regexp.test(href)){
      _gaq.push(['_trackEvent','external_link','click',href,1]);
    }else{
      _gaq.push(['_trackEvent','internal_link','click',href,1]);
    }
  });
});
