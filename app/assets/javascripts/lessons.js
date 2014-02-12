// This file contains scripts associated with the lessons pages
// They haven't really been properly namespaced yet.  Sorry...
// Possible case for refactoring: Namespace this then call it from
// some sort of master router module that detects when you're on
// a lesson page.  Crazy?  Maybe.  But you like that, don't you?

$(function(){
  
  // Delegate listeners to the wrapper so they stick around when new forms
  // and checkboxes are created.  This is an example of "event delegation".
  $(".completion-wrapper").on("click", ".checkbox-container", function(e){
    if(!$(".checkbox-container").hasClass("lc-disabled")){        
      e.preventDefault();
      checkboxContainer = $(".checkbox-container");
      
      // Switch to AJAX waiting state, since it will be overwritten by the
      // refresh from the unobtrusive javascript   
      checkboxContainer.addClass("lc-waiting");
      
      // submit the form
      $(e.target).parents("form").submit();
    }
  });
    
  // Delegate a hover listener (separate mouseenter and mouseleave) to completion wrapper
  // Don't enable if it's a disabled class
  $(".completion-wrapper").on("mouseenter", ".checkbox-container",function(e){
    if(!$(".checkbox-container").hasClass("lc-disabled")){  
      $(".checkbox-container").addClass("lc-hover");
    }
  });
  $(".completion-wrapper").on("mouseleave", ".checkbox-container",function(e){
    if(!$(".checkbox-container").hasClass("lc-disabled")){  
      $(".checkbox-container").removeClass("lc-hover");
    }
  });                                            
  
  // Delegate an event listener to the completion wrapper for if the user clicks
  // the "mark this lesson NOT completed" link
  $(".completion-wrapper").on("click", ".lc-uncomplete-link", function(e){
    e.preventDefault();
    // submit the form
    $(e.target).parents("form").submit();
  });
})