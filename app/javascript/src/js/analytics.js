/* eslint-disable */

// NOTE: These won't get fired off unless they're in the
// production environment -- see app/views/shared/_ga.html.erb
// for the code doing that.
// format: ('_trackEvent', category, action, label, value)

// Turbolinks magic happens here...
document.addEventListener('turbolinks:load', () => {
  $(() => {
    // Fire a custom analytics event whenever any link is clicked
    $('a').on('click', (e) => {
      const $target = $(e.target);
      let href = $target.attr('href');

      // manually set href for elements wrapped in anchor tags
      // this is because the click event target is actually the
      // internal element, e.g. an <h3> tag wrapped in <a> tags
      // will register a click target of <h3> not <a> so the
      // 'href' property will be undefined and we must check its
      // parents to acquire the href.
      if (!href) {
        href = $target.parents('a').attr('href');
      }

      // Send separate events for internal and external link clicks
      const regexp = /^https?:/;
      if (regexp.test(href)) {
        _gaq.push(['_trackEvent', 'external_link', 'click', href, 1]);
      } else {
        _gaq.push(['_trackEvent', 'internal_link', 'click', href, 1]);
      }
    });

    // Fire an event whenever a user marks a lesson completed on the lessons index page
    // else whenever a student marks a lesson not completed on the lessons index page
    $('[id^=section-lessons__]').on('click', function (e) {
      if ($(this).children(':first').data('method') === 'post') {
        _gaq.push(['_trackEvent', 'lesson_completion', 'mark_completed', $(this).children(':first')[0].href, 1]);
      } else if (($(this).children(':first').data('method') === 'delete')) {
        _gaq.push(['_trackEvent', 'lesson_completion', 'mark_not_completed', $(this).children(':first')[0].href, 1]);
      }
    });

    // see_lesson_buttons.html.erb for lesson button analytics

    // Fire an event when a user clicks on the Discord chat link in the individual lesson page
    $("a:contains('Open Discord')").on('click', (e) => {
      _gaq.push(['_trackEvent', 'discord_chat', 'click_discord_chat_link', 'lesson_page', 1]);
    });

    // Fire an event when a user clicks on the floating chat button
    $('.chat-floating-btn').click((e) => {
      _gaq.push(['_trackEvent', 'discord_chat', 'click_discord_chat_floating_button', 'global', 1]);
    });

    // Fire an event when a user clicks on the Discord chat link in the navbar
    $('.discord-chat-link').on('click', (e) => {
      _gaq.push(['_trackEvent', 'discord_chat', 'click_discord_chat_link', 'navbar', 1]);
    });

    // Fire an event whenever someone tries to sign in the standard way
    $('[value="Login"]').on('click', (e) => {
      _gaq.push(['_trackEvent', 'signin_buttons', 'click_normal_signin_button', 'signin_button', 1]);
    });

    // Fire an event whenever someone tries to sign up else sign in with Github by clicking the Github button
    $('.button--github').on('click', (e) => {
      if (window.location.pathname === '/sign_up') {
        _gaq.push(['_trackEvent', 'signup_buttons', 'click_github_signup button', 'github_signup_button', 1]);
      } else if (window.location.pathname === '/login') {
        _gaq.push(['_trackEvent', 'signin_buttons', 'click_github_signin_button', 'github_signin_button', 1]);
      }
    });

    // Fire an event whenever someone tries to sign up else sign in with Google by clicking the Google button
    $('.button--google').on('click', (e) => {
      if (window.location.pathname === '/sign_up') {
        _gaq.push(['_trackEvent', 'signup_buttons', 'click_google_signup button', 'google_signup_button', 1]);
      } else if (window.location.pathname === '/login') {
        _gaq.push(['_trackEvent', 'signin_buttons', 'click_google_signin_button', 'google_signin_button', 1]);
      }
    });

    // Fire an event whenever someone clicks the normal sign up button (e.g. not step 2 of the github flow)
    $('[value="Sign up"]').on('click', (e) => {
      _gaq.push(['_trackEvent', 'signup_buttons', 'sign_up', 'main_signup_button', 1]);
    });

    // Fire an event whenever an ad is clicked
    $('.ad').on('click', (e) => {
      adId = $(e.target).parents('.ad').data('ad-id');
      _gaq.push(['_trackEvent', 'ad', 'click', adId, 1]);
    });

    $('[title="Mark lesson complete"]').on('click', (e) => {
      _gaq.push(['_trackEvent', 'lesson_completion', 'mark_completed', window.location.href, 1]);
    });

    // Fire an event whenever a user marks a lesson  uncompleted on the individual lesson page
    $('[title="Mark lesson incomplete"]').on('click', (e) => {
      _gaq.push(['_trackEvent', 'lesson_completion', 'mark_not_completed', window.location.href, 1]);
    });

    // Fire an event when a user clicks on the next lesson navigation link in the individual lesson page
    $('[title^="Move on to"]').on('click', (e) => {
      _gaq.push(['_trackEvent', 'lesson_navigation', 'click_next_lesson_link', 'lesson_page', 1]);
    });
  });
});
