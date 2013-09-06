== Welcome to The Odin Project v0.0.7

It's game on.

Note to self:  You can't call any custom stylesheets or heroku will shit the bed.  The assets get precompiled so NO WAY can you call custom stylesheets at runtime.

**************************  DEPLOYMENT NOTES: **********************
< none >
********************************************************************

>> Optimize Google Analytics
>> Set up viral feedback looping like launchrock -- give each signup a unique referral code and make links between them so you see downstream who refers most.  
>> Add social buttons to the splash process


**************************  Major Roadmap  **************************

v0.0.7: Bug fixes, tweaks, and Open Source contribution tools

> Add OSS contribution and tracking tools like a mailing list
v0.0.7:  Anonymize email reach-outs, add mailer conf to accounts

0.0.?:  Make user logins carry over to the curriculum as well, which allows integration of commenting as well with each of the curriculum subsections.

0.0.?:  Anonymize scheduler results
0.0.?:  Scheduling back-end
0.0.?:  Feedback mechanism

> Build mailer button in the event profiles
>> Select which project too if multiple!
> Fix up suggestion mailer to include username/email and proper referral link
> Add user prefs filters as well

**********************  Current Version Sandbox  ********************

* Bug: when getting referred directly to /scheduler?cb=12345 (e.g. http://www.theodinproject.com/scheduler?cb=3), then immediately clicking into Preferences and removing that project, the redirect from Preferences takes you back to the same referral URL so the project is immediately added back on ... an infinite process.  Need to clear the query string or something to prevent this.
* 


**********************  General Sandbox  ****************************

>> WRITE JAVASCRIPT TESTS
>>>> calendar basic display, calendar population, event creation

> CALENDAR UI
>> Default event details based on user profile info?? esp username and details with their contact info
>> ?Make the click action bring up the "you need to update your profile" box if that's the case before allowing addition of new events?

> USERS
>> Make a dynamic route matcher to show the user profiles so you can just go to the /users/foobar link instead of /users/1 (hide the IDs)
>> Make the gravatar default image the odin logo
* ? HTML safe my inputs?

>> Build "contact" button in event to mail them with your contact info (and have an alert for okaying it)


---- Issues and Gotchas ----
>> handle all-day events (midnight to midnight-1)?  But what about min-time constraints?  erb... sensing bug that will come up if someone wants to book 1 hour from an all dayer @ 11pm...
>> Currently allows you to write overlapping calendar events

>> Look and feel???
>> ??? Front end frameworks ???

---- Future stuff ----
>> Users not signed in can access scheduler but see only grayed out, no-info bars?  May just be too randomly complex for no reason.


---- Devise ----
>> Haven't done any of the suggested config.action_mailer.default_url_options stuff or setting the precompile assets for heroku stuff.


Eventually:
>> Turn on add-ons like pgbackups

http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html
https://gist.github.com/zhengjia/428105


***********************  Version Archive  **************************

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
