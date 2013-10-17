== Welcome to The Odin Project v0.0.7

It's game on.

*********************************************************************
**************************  DEPLOYMENT NOTES: ***********************
*********************************************************************

< none >

*********************************************************************
****************************  OTHER NOTES: **************************
*********************************************************************
< none >

*********************************************************************
**************************  Major Roadmap  **************************
*********************************************************************

0.0.?: Curriculum navigation redesign
* Improve the visual heirarchy
0.0.?: Feedback mechanism
0.0.?: Progress tracking
* Signup current/next design
0.0.?: Realtime broadcast and collaboration prompting
* Allow flash messages to go out to all users on the curriculum
* Allow users to see when other users are at the same section and have the collaborate / chat popup occur
* Allow users to see when other users are nearby to them for the same functionality
* Allow users to see when other users have scheduled availability for a project ahead of time (e.g. I'm on Ruby Project 1 and get a notification that User 2 will be available to work on it together on Thursday)

*********************************************************************
**********************  Current Dev Version TODOs *******************
*********************************************************************

v0.0.8: Bug fixes, Curriculum UI / Navigation improvements, 

* Set up new curriculum data models
* Set up associations
* Populate data
* Write basic views
* Rewrite controller method for github api calls

* Refactor to Remove all legacy splash stuff (mailers, views, controller actions, routes...)
* Remove annoying in-content CTAs to contribute.
* Set up cookie to send user back to last viewed curriculum spot... note that there will be annoying redirect loop issues if not careful.
* Add Alpha signup code field to signup form
* Fix code inside `pre` blocks to not display formatted
* Make home page more signup-oriented
* Create nice looking signup confirmation email w/ bcc
* Make more obvious that you can select multiple projects on prefs
* Make more obvious the loading icon when waiting for scheduler data
* Paginate students
* Make links in curriculum point externally
* Set up welcome page for students post-signup
* Link GA goal to that page.
* Update failing tests
* Write basic tests for curriculum section
DONE Add Alpha tag to front page
DONE Remove "private" from alpha release warning


BUGS:
* TESTS: Why do some tests only fail intermittantly???
* Bug: when getting referred directly to /scheduler?cb=12345 (e.g. http://www.theodinproject.com/scheduler?cb=3), then immediately clicking into Preferences and removing that project, the redirect from Preferences takes you back to the same referral URL so the project is immediately added back on ... an infinite process.  Need to clear the query string or something to prevent this.
* 



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
