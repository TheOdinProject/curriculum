== Welcome to The Odin Project v0.0.5

It's game on.

Note to self:  You can't call any custom stylesheets or heroku will shit the bed.  The assets get precompiled so NO WAY can you call custom stylesheets at runtime.

**************************  DEPLOYMENT NOTES: **********************
*** MIGRATION! Added columns to User for profile.


********************************************************************

>> Optimize Google Analytics
>> Set up viral feedback looping like launchrock -- give each signup a unique referral code and make links between them so you see downstream who refers most.  
>> Add social buttons to the splash process


**************************  Major Roadmap  **************************

0.0.5:  Profile Links from Scheduler
0.0.6:  Anonymize email reach-outs
0.0.?:  Anonymize scheduler results
0.0.?:  Scheduling back-end
0.0.?:  Feedback mechanism

> Build mailer button in the event profiles
>> Select which project too if multiple!
> Fix up suggestion mailer to include username/email and proper referral link
> Add user prefs filters as well

**********************  Current Version Sandbox  ********************

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
* Link from modal to user profile page (and pull info from it for quick reference)
* Set up users index page to list all users and their projects, last login

BUG LIST:

TESTS:
* Events also have an event project list sent
* signup is hidden from splash page
* Fix tests for cal_events and login links
* That profile page actually shows up
* profile page displays at least one link, an about, and a project
* profile page edit button only for logged in user
* only logged in user can get to edit link
* Only logged in user can access profile or edit pages
* only current user can access edit page
* edit page shows editable options
* Update method works for user profile page
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
