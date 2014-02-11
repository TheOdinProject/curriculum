// This file contains scripts associated with the lessons pages
// They haven't really been properly namespaced yet.  Sorry...
// Possible case for refactoring: Namespace this then call it from
// some sort of master router module that detects when you're on
// a lesson page.  Crazy?  Maybe.  But you like that, don't you?

$(function(){
  // Add listeners as long as it's NOT in the disabled state
  if(!$(".checkbox-container").hasClass("lc-disabled")){        
    $(".checkbox-container").on("click", function(e){
      e.preventDefault();
      checkboxContainer = $(".checkbox-container");
      
      // Switch to AJAX waiting state, since it will be overwritten by the
      // refresh from the unobtrusive javascript   
      checkboxContainer.addClass("lc-waiting");
      
      // submit the form
      $(e.target).parents("form").submit();
    });
    
    // Set up hover listener (separate mouseenter and mouseleave)
    // Don't enable if it's a disabled class
    $(".checkbox-container").on("mouseenter",function(e){
      $(".checkbox-container").addClass("lc-hover");
    });
    $(".checkbox-container").on("mouseleave",function(e){
      $(".checkbox-container").removeClass("lc-hover");
    });                                            
  }
})