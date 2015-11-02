// This file contains scripts associated with the lessons pages
// They haven't really been properly namespaced yet.  Sorry...
// Possible case for refactoring: Namespace this then call it from
// some sort of master router module that detects when you're on
// a lesson page.  Crazy?  Maybe.  But you like that, don't you?

$(function(){
  
  // LESSONS INDEX PAGES
  
  // Delegate listeners to the lesson so they stick around when new forms
  // and checkboxes are created.  This is an example of "event delegation".
  // This code will work for both checked and unchecked boxes
  $(".lesson").on("click", ".lc-checkbox", function(e){     
      e.preventDefault();
      checkbox = $(e.target).parents(".lesson").find(".lc-checkbox");
    
      // Switch to AJAX waiting state regardless of prior state
      // since it will be overwritten anyway
      // by the refresh from the unobtrusive javascript   
      checkbox.removeClass("lc-unchecked");
      checkbox.removeClass("lc-checked");
      checkbox.addClass("lc-waiting");
    
      // submit the form
      checkbox.parents("form").submit();
  });
  
  // Delegate a hover listener (separate mouseenter and mouseleave) 
  // to completion wrapper and don't enable if it's a disabled class
  $(".lesson").on("mouseenter", ".lc-checkbox",function(e){
    checkbox = $(e.target).parents(".lesson").find(".lc-checkbox");
    
    if(!checkbox.hasClass("lc-disabled")){  
      checkbox.addClass("lc-hover");
    }
  });
  $(".lesson").on("mouseleave", ".lc-checkbox",function(e){
    checkbox = $(e.target).parents(".lesson").find(".lc-checkbox");
    
    if(!checkbox.hasClass("lc-disabled")){  
      checkbox.removeClass("lc-hover");
    }
  });   


  
  
  // INDIVIDUAL LESSON SHOW PAGES
  
  // Delegate listeners to the wrapper so they stick around when new forms
  // and checkboxes are created.  This is an example of "event delegation".
  $(".lc-end-wrapper").on("click", ".checkbox-container", function(e){
    if( !$(".checkbox-container").hasClass("lc-disabled") &&
        !$(".checkbox-container").hasClass("lc-checked") ){        
      e.preventDefault();
      checkboxContainer = $(".checkbox-container");
      
      // Switch to AJAX waiting state regardless of prior state
      // since it will be overwritten anyway
      // by the refresh from the unobtrusive javascript  
      checkboxContainer.addClass("lc-waiting");
      
      // submit the form
      $(e.target).parents("form").submit();
    }
  });
    
  // Delegate a hover listener (separate mouseenter and mouseleave) to completion wrapper
  // Don't enable if it's a disabled class
  $(".lc-end-wrapper").on("mouseenter", ".checkbox-container",function(e){
    if(!$(".checkbox-container").hasClass("lc-disabled")){  
      $(".checkbox-container").addClass("lc-hover");
    }
  });
  $(".lc-end-wrapper").on("mouseleave", ".checkbox-container",function(e){
    if(!$(".checkbox-container").hasClass("lc-disabled")){  
      $(".checkbox-container").removeClass("lc-hover");
    }
  });                                            
  
  // Delegate an event listener to the completion wrapper for if the user clicks
  // the "mark this lesson NOT completed" link
  $(".lc-end-wrapper").on("click", ".lc-uncomplete-link", function(e){
    e.preventDefault();

    // Switch to AJAX waiting state, since it will be overwritten by the
    // refresh from the unobtrusive javascript   
    $(".checkbox-container").addClass("lc-waiting");
    
    // submit the form
    $(e.target).parents("form").submit();
  });
})



/*
 * Handlers for Octocat and the contributions links;
 *    Clicking Octocat triggers a bootstrap popover with links to the lessons page in the Github repo, 
 *    and a link to the live site's Contributing page.
 *    See also the lessons show.html.erb file and the partial _contribution_links.html.erb.
 */
$(function () {
    
    // Cache jquery reference to the cat, since its referenced everytime there is a click anywhere on the page.
    var $octocat = $(".contribution-links");               
    
  
    // If the Octocat is clicked, put up bootstrap popover
    $octocat.popover({
        html: true, 
        title: 'Want to improve something in this lesson?' 
    });
  
    
    // If popover is activated and user clicks somewhere other than popover itself or kitty, then hide popover.
    //    Implementation Note: Popular solutions to catch off-element clicks to hide element that include call to
    //    event.stopPropagation() will fail if that element outside Octokitty clicked-upon itself has stopPropagation!
    //    The implementation below doesn't have that prob: 
    $(document).click(function(event) {
        // If click is not on popover container or anything inside it, but click IS on ancestor of OctoKitty container 
        if (     ! ( $(event.target).is(".popover") ||        // (need these 2 cases cuz popover is also an ancestor of octokitty!)
                     $(event.target).parents().is(".popover") )  &&
                     $(event.target).parents().index($octocat) === -1 )    
            { 
                if ( $(".popover").is(":visible") ) {         // only hide if popover is visible
                    $octocat.popover( 'hide' );
                }
            }        
    }); 
  
});

