$(function() {

    $("#newbie-path-link").click(function() {toggle_paths($(this))});
    $("#adv-beginner-path-link").click(function() {toggle_paths($(this))});
    $("#engineer-path-link").click(function() {toggle_paths($(this))});
    $("#nontechnical-path-link").click(function() {toggle_paths($(this))});

    var toggle_paths = function(pathLink) {
        $.scrollTo(pathLink.offset().top - 50, 400); //50px is navbar ht. Use CSS property from devise instead? BW
        pathLink.text(pathLink.text() == "More" ? "Less" : "More" )
    };

});