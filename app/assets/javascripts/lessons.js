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