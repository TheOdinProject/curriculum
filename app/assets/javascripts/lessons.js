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
  $('.lesson').on('click', '.lc-checkbox', function(e){
      e.preventDefault();
      checkbox = $(e.target).parents('.lesson').find('.lc-checkbox');
    
      // Switch to AJAX waiting state regardless of prior state
      // since it will be overwritten anyway
      // by the refresh from the unobtrusive javascript
      checkbox.removeClass('lc-unchecked');
      checkbox.removeClass('lc-checked');
      checkbox.addClass('lc-waiting');
    
      // submit the form
      checkbox.parents('form').submit();
  });

  // Delegate a hover listener (separate mouseenter and mouseleave)
  // to completion wrapper and don't enable if it's a disabled class
  $('.lesson').on('mouseenter', '.lc-checkbox',function(e){
    checkbox = $(e.target).parents('.lesson').find('.lc-checkbox');
    
    if(!checkbox.hasClass('lc-disabled')){
      checkbox.addClass('lc-hover');
    }
  });
  $('.lesson').on('mouseleave', '.lc-checkbox',function(e){
    checkbox = $(e.target).parents('.lesson').find('.lc-checkbox');
    
    if(!checkbox.hasClass('lc-disabled')){
      checkbox.removeClass('lc-hover');
    }
  });

  // INDIVIDUAL LESSON SHOW PAGES

  // Delegate listeners to the wrapper so they stick around when new forms
  // and checkboxes are created.  This is an example of "event delegation".
  $('.lc-end-wrapper').on('click', '.checkbox-container', function(e){
    if( !$('.checkbox-container').hasClass('lc-disabled') &&
        !$('.checkbox-container').hasClass('lc-checked') ){
      e.preventDefault();
      checkboxContainer = $('.checkbox-container');
      
      // Switch to AJAX waiting state regardless of prior state
      // since it will be overwritten anyway
      // by the refresh from the unobtrusive javascript
      checkboxContainer.addClass('lc-waiting');
      
      // submit the form
      $(e.target).parents('form').submit();
    }
  });
    
  // Delegate a hover listener (separate mouseenter and mouseleave) to completion wrapper
  // Don't enable if it's a disabled class
  $('.lc-end-wrapper').on('mouseenter', '.checkbox-container',function(e){
    if(!$('.checkbox-container').hasClass('lc-disabled')){
      $('.checkbox-container').addClass('lc-hover');
    }
  });
  $('.lc-end-wrapper').on('mouseleave', '.checkbox-container',function(e){
    if(!$('.checkbox-container').hasClass('lc-disabled')){
      $('.checkbox-container').removeClass('lc-hover');
    }
  });
  
  // Delegate an event listener to the completion wrapper for if the user clicks
  // the "mark this lesson NOT completed" link
  $('.lc-end-wrapper').on('click', '.lc-uncomplete-link', function(e){
    e.preventDefault();

    // Switch to AJAX waiting state, since it will be overwritten by the
    // refresh from the unobtrusive javascript
    $('.checkbox-container').addClass('lc-waiting');
    
    // submit the form
    $(e.target).parents('form').submit();
  });

  /*
   * Handlers for Octocat and the contributions links;
   *    Clicking Octocat triggers a bootstrap popover with links to the lessons page in the Github repo,
   *    and a link to the live site's Contributing page.
   *    See also the lessons show.html.erb file and the partial _contribution_links.html.erb.
  */
  // Cache jquery reference to the cat, since its referenced everytime there is a click anywhere on the page.
  var $octocat = $('.contribution-links');

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
    if (!($(event.target).is('.popover') ||  // (need these 2 cases cuz popover is also an ancestor of octokitty!)
          $(event.target).parents().is('.popover') )  &&
          $(event.target).parents().index($octocat) === -1 ) {
      if ($('.popover').is(':visible'))       // only hide if popover is visible
        $octocat.popover('hide');
    }
  });

  // Project submission
  var projectFormContainer = $('.project-form-container');

  if (projectFormContainer) {
    var projectForm = projectFormContainer.find('form'),
        projectSubmitBtn = $('#project-submit-btn'),
        repoUrlErrorMsg =  'Repo URL must start with https://github.com/';

    var checkValidRepoURL = function (repoUrl, validRepoUrlRegex) {
      if (!validRepoUrlRegex.test(repoUrl)) {
        showNotification(repoUrlErrorMsg, 'error');
        return false;
      }
      return true;
    };

    var appendProjectDeleteButton = function(lessonSlug, projectId) {
      var deleteProjectBtnHtml =
        '<a class="btn btn-danger btn-block" ' +
            'id="project-delete-btn" ' +
            'rel="nofollow" ' +
            'href="/lessons/' + lessonSlug + '/projects/' + projectId + '">' +
          '<i class="fa fa-trash"></i>' +
          '&nbsp;Destroy submission' +
         '</a>';

      var deleteProjectBtn = $(deleteProjectBtnHtml).hide();
      projectFormContainer.append(deleteProjectBtn);
      deleteProjectBtn.fadeIn(2000);
    };

    var showNotification = function(message, status) {
      var notificationMessage = $('.notification-message'),
          icon = $('.notification-message .fa');
          delay = 1000;

      if (status == 'success') {
        icon.attr('class','fa fa-check');
        notificationMessage.css('background', '#3498db');
      } else {
        icon.attr('class','fa fa-times');
        notificationMessage.css('background', '#bd362f');
        delay*= 2;
      }

      $('.message').html(message);
      notificationMessage.show();

      // hide the notification after a delay
      setTimeout(function() {
        notificationMessage.hide();
      }, delay);
    };


    var submitForm = function(submitUrl, formData) {
      var newSubmission = /projects$/.test(submitUrl),
          method = newSubmission ? 'POST' : 'PATCH',
          lessonSlug = submitUrl.match(/lessons\/([a-z-0-9]+)\//)[1];

      $.ajax({
        url: submitUrl,
        method: method,
        data: formData,
        dataType: 'json',
        beforeSend: beforeCallback,
        success: successCallback,
        error: errorCallback,
        complete: completeCallback
      });

      function successCallback(data, status) {
        var projectId = data.id;

        $(projectForm).attr('class', 'edit_project');
        $(projectForm).attr('id', 'edit_project_' + projectId);

        var currentAction = $('form').attr('action');
        $(projectForm).attr('action', currentAction + '/'  + projectId);

        if (method == 'POST') {
          projectSubmitBtn.val('Update submission');
          showNotification('Project saved!', status);
          appendProjectDeleteButton(lessonSlug, projectId);
        } else {
          showNotification('Project updated!', status);
        }
      }

      function errorCallback(data, status) {
        showNotification(repoUrlErrorMsg, status);
      }
    };

    // The following functions are hoisted, moved to the top along with their
    // body. For more, read the following blog
    // http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html

    function beforeCallback() {
      $('.loader').css('opacity', 1);
    }

    function completeCallback() {
      $('.loader').css('opacity', 0);
    }

    function deleteSuccessCallback(data, status) {
      var newProject = 'new_project',
          currentAction = projectForm.attr('action');

      $('#project-delete-btn').detach();
      projectSubmitBtn.val('Upload project');

      projectForm.attr('class', newProject);
      projectForm.attr('id', newProject);
      projectForm.attr('action', currentAction.replace(/\/\d+$/, ''));

      $('#project_repo_url').val('');
      $('#project_live_preview').val('');

      showNotification('Project submission deleted', status);
    }

    function deleteErrorCallback(data, status) {
      showNotification('Couldn\'t delete. Something\'s wrong', status);
    }

    var createOrUpdateProject = function(event) {
      var repoUrl = $('#project_repo_url').val();
      var livePreviewUrl = $('#project_live_preview').val();
      var validRepoUrlRegex = /^https?:\/\/github.com\//;

      var valid = checkValidRepoURL(repoUrl, validRepoUrlRegex);
      if (!valid) return false; // stop form from submitting

      event.preventDefault();

      var submitUrl = projectForm.attr('action');
      var formData = {
        project: {
          repo_url: repoUrl,
          live_preview: livePreviewUrl
        }
      };
      submitForm(submitUrl, formData);
    };

    var deleteProject = function(event) {
      event.preventDefault();
      var deleteUrl = this.pathname;

      if (confirm('Are you sure?'))
        $.ajax({
          url: deleteUrl,
          method: 'POST',
          data: {
            _method: 'delete'
          },
          beforeSend: beforeCallback,
          success: deleteSuccessCallback,
          error: deleteErrorCallback,
          complete: completeCallback
        });
    };

    // Event listeners
    projectSubmitBtn.click(createOrUpdateProject);
    // Since the projectDeleteBtn is dynamically appended to the page,
    // we have to use `on` method on a parent element to register
    // an event listener
    projectFormContainer.on('click', '#project-delete-btn', deleteProject);
  }

});