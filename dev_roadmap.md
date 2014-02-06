# Obsolete Dev Roadmap

Our [Pivotal Tracker](https://www.pivotaltracker.com/s/projects/979092) will contain all updated feature queues.

Release notes will (for now) continue to be provided below.

It's game on.

*********************************************************************
**************************  DEPLOYMENT NOTES: ***********************
*********************************************************************

< none >

*********************************************************************
**************************  Major Roadmap  **************************
*********************************************************************

## User Stories (Obsolete!)

* As a site owner, I want to send a flash message to site users so I can notify them of important events like office hours. (with selectivity and click to close)
* As a user, I want to know if other users are working on the same material as I am now so I can reach out to work with them
* As a user, I want to be able to reach out to other users so we can work together on the material
* As a user, I want to track my progress through the curriculum so I can see how far I've come and how far I still need to go.
* As a user who might collaborate with another user, I want to know if that user is good to work with so I can decide whether to collaborate with him/her.
* Allow users to see when other users have scheduled availability for a project ahead of time (e.g. I'm on Ruby Project 1 and get a notification that User 2 will be available to work on it together on Thursday)

## Design Issues

* Signup current/next design
* Change the top navbar from being fixed to collapsing into a sleek progress bar (right now it takes up too much real estate when the user is scrolling through a lesson)

*********************************************************************
**********************  Current Dev Version TODOs *******************
*********************************************************************

**v0.1.2: Bug Fixes**

* Unfix the navbar and/or collapse it into a slim and awesome fixed nav that follows you down the screen.
DONE Add sitemap

Bugs and Miscellanea
* Set up cookie and link to send user back to last viewed curriculum spot... note that there will be annoying redirect loop issues if not careful.
* KILL BOOTSTRAP!?!  Only needed for: Navbar dropdown, button styles...
* Figure out why the logo image can't be found for attachment to the welcome email
* Someday finish the controller testing for LessonsController and CoursesController with the non-restful routes.
* Bug: when getting referred directly to /scheduler?cb=12345 (e.g. http://www.theodinproject.com/scheduler?cb=3), then immediately clicking into Preferences and removing that project, the redirect from Preferences takes you back to the same referral URL so the project is immediately added back on ... an infinite process.  Need to clear the query string or something to prevent this.




*********************************************************************
**********************  General Sandbox  ****************************
*********************************************************************

>> WRITE JAVASCRIPT TESTS
>>>> calendar basic display, calendar population, event creation

> USERS
>> Make a dynamic route matcher to show the user profiles so you can just go to the /users/foobar link instead of /users/1 (hide the IDs)


---- Issues and Gotchas ----
>> handle all-day events (midnight to midnight-1)?  But what about min-time constraints?  erb... sensing bug that will come up if someone wants to book 1 hour from an all dayer @ 11pm...
>> Currently allows you to write overlapping calendar events

---- Future stuff ----


http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html
https://gist.github.com/zhengjia/428105


********************************************************************
***********************  Version Archive  **************************
********************************************************************

************
v0.1.1:  Home Page Redesign 3.0, bug fixes

DONE Make more obvious the loading icon when waiting for scheduler data
DONE Make more obvious that you can select multiple projects on prefs
DONE Make the site better on small screens
DONE Darken navbar and footer and resize bars appropriately
DONE Paginate students
DECLINED Build "next"-style buttons next to the headers on the courses page
DONE space out buttons a bit better on main topbox
DONE Add some real specs for basic display stuff
DONE Write basic tests for curriculum section
SOMEHOW WENT AWAY Why do some tests only fail intermittantly???
SORTA DONE Refactor to Remove all legacy splash stuff (mailers, views, controller actions, routes...)
DONE Fix basic specs to run (need to create courses/sections etc or remove welcome email somehow from them)
DONE Clean up old homepage so it's out of the way and not a redirect to homepage2 or whatever
DONE Fix navbar on home page for already-logged-in-users to show logout link
DONE Set up redirect for students post-signup for GA to hook onto.
DONE Fix devise forms to deal with footer sizing
DONE Add content_for titles to the lesson pages
DONE Fine tune spacings
DONE Add headline images
DONE Add in graphics
DONE Fix body top padding issue
DONE Create nice looking signup confirmation email w/ bcc
DONE Review mockups
DONE Build out structure
DONE Fill in spacings and copy
DENIED Add Alpha signup code field to signup form
DONE Add static pages like About and Why Odin and FAQ
DONE Change links as necessary on blog
DONE Create footer with Blog and About and Why Odin links
DONE Move scheduler and community and students links under dropdown
DONE Review intended user flows and objectives
DONE Fix "How do we Pair" link on Scheduler Page

************
v0.1.0: Bug fixes, Curriculum UI / Navigation improvements,

Curriculum Redesign:
DONE Add this rake-to-update-curriculum feature to the docs
DONE Add the new seed-to-populate curriculum workflow to docs as well
DONE Set up the controller to run from the db instead of hitting github (note: just removed the Lesson.rb method, else it wasn't any change because the method was called `content`!)
DONE populate using a rake task that runs through all lessons and grabs their content if anything is returned
DONE Add :content text column to lessons to store the md files
DONE Initial deploy
IGNORED deploy backwards compatible with old structure
DONE Set up routing for /curriculum to redirect to /courses
DONE Make sure all external links open in a new tab
DONE Apply styling to project pages based on a `project` class.
DONE Put quotes around next button text and links
DONE Fix formatting of p's inside li's (less margin)
DONE Code inside pre tags shouldn't have borders
DONE Fix bug with next / prev courses
SORTA Revisit and tighten up copy and message (a journey!)
SORTA Revisit the UX flows and overall design consistency -- Fonts!
DONE Rebuild and remap the curriculum directory and lesson structure
DONE setup seeds to populate real data
DONE Write copy for curriculum pieces
DONE Fix bug with display order of sections
DONE Fix breakpoints for nav to not get in the way of the main navbar
DONE Serve the fonts myself... waiting for google fonts sucks. NO: just reduced the total download payload.  Serving myself may not be a better solution here.  Each font weight/style is like 200kb!
DONE Link the main courses page better!
DONE Set up divs to link to for sections
DONE Create some sort of nav / header in lesson show
DONE basicc Courses index view
DONE Basic Lessons Index view
DONE Basic Lesson view
DONE Set up linkages between lessons
DONE Set up actual data heirarchy!
DONE Rewrite controller method for github api calls into model method
DONE Routing: /courses/:course_name/lessons/:lesson_name
DONE Populate sample data
DONE Set up new curriculum data models
DONE Set up associations
DONE Add Alpha tag to front page
DONE Remove "private" from alpha release warning



************
v0.0.7: Curriculum inclusion, Bug fixes, tweaks, and Open Source contribution tools

DONE Fix gravatar bug with changing profile photo
DONE docs: how to set it up locally (pg)
DONE Clean up README to allow easier OSS contributions
DONE Load social buttons last so they don't trainwreck the page!
DONE Set up warning to gh-pages about obsolete-ness (use header)
DONE Set up github authentication to avoid early rate limiting issues
DONE Set up same-as-before view templates
DONE Import images (like odin logo, octocat)
DONE Set up new tree heirarchy (on master branch of curriculum!)
DONE Clean up templating leftovers... or handle them??
Done Use Github API to pull in curriculum dynamically
DONE set up simple API call
DONE Set up dynamic api call to handle directory structure
DONE Set up error handling for calls (see docs) 
DONE Set up smart handling to look for index.html/.md if not specified
Done Set up markdown rendering
DONE Fix suggestions form to include current URL
DONE change shading of navbar to flatten it out (remove shadow)
DONE Build mailer button in the event profiles
DONE remove email addresses from profiles
DONE add notification for users to login to post to the forum


************
v0.0.6: Forums and Bug Fixes

DONE Add Moot.it
DONE Add moot single signin feature

DONE Fix linkages to profiles to actually how the correct URL links to that program and their account on it.
DONE Fix language for editing contact info -- not always a URL!
DONE Remove the "github account unavailable" thing from index
DONE Make gravatar containers fixed size on index page
DONE Fix display of students index page to not collapse so quickly on resize
DONE Fix navbar upon narrow window to not get pushed lower due to body top padding (media query)
DONE Set up default Gravatar
DONE Put logo image into logo text
DONE Put logo image into favicon
DONE Display timezone that calendar is currently in!
DONE Check timezone compatability
DONE AJAX Loading icon

**********
v0.0.5: Profile Links from Scheduler
DONE set calendar display to start on today's weekday and to not show the allday option.
AVOIDED BUG: Creating multiple all-day events then deleting one will result in the others being turned into 12-1am events. Very odd.
DONE Set up the event modal dialogs to show which project(s) that person wants to pair on when clicked.
DONE Create Login link on splash page but hide signup
DONE Hide login from navbar if on login pages... so just hide it always!
DONE Change event title returned to be creator's username
DONE Fix link to user root after account update
DONE Set up user profile page that includes github and best ways to contact
DONE Set up user profile page editing functions
DONE Add link to profile page on navbar
DONE Add cancel link to edit page
DONE Add edit picture on Gravatar link
DONE Add links to G+ and Skype and Screenhero
DONE Link from modal to user profile page (and pull info from it for quick reference)
DONE Set up users index page to list all users and their projects, last login
DONE Set up students link on navbar
DONE Redo hiding signup stuff so option is required to show it
DONE Bundle update gems

BUG LIST:

TESTS:
DONE Fix tests for cal_events and login links
DONE User unit tests
DONE Events also have an event creator project list sent
DONE signup is hidden from splash page
DONE That profile page actually shows up
DONE profile page displays at least one link, an about, and a project
DONE profile page edit button only for logged in user
DONE only logged in user can get to edit link
DONE Only logged in user can access profile or edit pages
DONE only current user can access edit page
DONE edit page shows editable options
DONE Update method works for user profile page
DONE navbar has profile link
DONE navbar has students (index) link
DONE users index shows users
DONE each indexed user has a username

DEPLOYMENT NOTES:
*** MIGRATION! Added columns to User for profile.
*** BUNDLE UPDATE AGAIN!
Fail! missing "fontawesome.less"
Attempts to fix:
* run $ bundle exec rake assets:precompile
* Fail! same error. hmm.
* Removed the public/assets folder that created.
* Downgrading the bootstrap gem to v 2.2.6 from 2.2.7
* bundle install, try again
* It worked! ...why...? How can I use this correctly in the future.
* Ran the migration, success.
* 

**********
v0.0.4:  Mobile Friendly Splash
DONE Reduce image size
DONE hard size background
DENIED Media query stylesheet
PARTIAL ems not px for splash fonts
DONE kill the signed-in-successfully flash message
**********
v0.0.3: Referral Links
DONE * Create a URL catcher that plants a cookie in the browser for ?cb= anything (and can be expanded into others) 1 day cookie
DONE * Check the cookie when the Scheduler page is reached, then do whatever comes next
DONE If no prev events, park on scheduler page with that content bucket already set, kill cookie
DONE If prev events, go to preferences page and add a new-but-unsaved event (just a select?), kill cookie either way, put message saying what's up
DONE Have "Update" button go back to scheduler page.  Need to set up a referrer query string for this... can we autopopulate it or do we manually need to figure it out?
DONE Improve spacing of the box to handle bigger project names
DONE Alpha privacy disclaimer (your info will be public for a while)
DONE Link the pairing instructions to the github curriculum
DONE signed in user goes to scheduler by default not splash
* test:
FAIL cookie setting >> testing cookies is murderously painful.
FAIL cookie expiration >> IBID
FAIL cookie clearing after operations >> IBID
FAIL cookie can only be valid content bucket >> IBID
DONE will add new content bucket if alone
PENDING/FAIL will add new content bucket with message only if it doesn't already exist >> since signin redirects to scheduler prematurely currently
DONE won't accept an invalid content bucket
DONE signed in user goes to sched by default
DONE session will return user after form submit if referred
