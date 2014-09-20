/* 
 * Swiftype search for Odin - Here you'll find event handlers for 
 *   - initiating the search via hitting Enter with your search term(s),
 *   - taking care of biz when the modal is shown, and hidden; details below.
 *
 * NOTE: Make sure to replace Swiftype.key below with your own.
 */

$(function () {
    var Swiftype = window.Swiftype || {};
    Swiftype.key = "hnrKV2q8t65YYTgSyoqy";
  
    // Cache the jquery selections of modal elements (since they'll be referred to continuously ).
    var $searchInput = $('#st-search-input');                // the search box
    var $searchResultsModal = $("#search-results-modal");    // the modal  
    var $searchResultsDiv = $('#st-results-container');      // inside the modal

    var re = /^\s*$/;            // Regular expression - match a line with nothing but whitespace. 
 
    // Catch key press events, pop up modal after an 'Enter' 
    $searchInput.keydown( function(e) {
      var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;    // the key that was pressed
      
      // Only activate modal if...
      if( key === 13 &&                                           // ...enter key was hit, and
          !$searchInput.val().match(re) &&                        // contents of search box is non-whitespace, and
          ( $('.autocomplete ul li.active').length === 0 ) ) {    // 'active' css class isn't set on a .autocomplete listing.
              $searchResultsDiv.empty();          // Immediately empty search results (inside the modal), in case it was filled from previous invocation.
              $searchResultsModal.modal('show');  // Tell search results modal to show itself.
              history.pushState("", document.title, window.location.pathname);       // Get rid of stuff after # in url
       }
    }); 

  
    // Once the search results modal is shown, catch the Enter key event and make it close the dialog,
    // else we have a bug where the modal empties out (and I don't know why!).
    $searchResultsModal.on('shown', function () {
        $searchResultsModal.keydown( function(e) {
          console.log("Inside shown, keypress: " + e.keyCode);
          if ( e.keyCode === 13 ) {
              $searchResultsModal.modal('hide');
          }
        });
    });
  
  
    // On modal getting closed, empty the search box.
    $searchResultsModal.on('hide', function () {
        $searchInput.val('');
        // Set the url to what it was before the search (Take out the #stq=lessons&stp=1 stuff added by swiftype after search)
        history.pushState("", document.title, window.location.pathname);   // this fixes bug where searching for the same thing twice resulted in blank modal     
    });

});  
