This lesson is a small one, but is _incredibly important_. Now that we are dealing with Authentication, sessions, cookies and user passwords it is crucial that we do everything we can that our authentication system or database is not compromised.

Essentially, in addition to using encryption to secure user passwords we need to make sure that important sensitive information such as our express.sessions secret, our mongoDB url (especially if it includes your username and password!) and any API keys that you might be using stay hidden. Details such as these should never get committed to a git repo or otherwise published.

Hiding secrets is easily accomplished and there are a handful of ways to do it. One of the most common is using an npm package called [dotenv](https://github.com/motdotla/dotenv#readme).  It's usage is simple.  Simply create a file called `.env` in your project directory and fill it with variables that represent things you need to keep secret. **Important note:** you need to add this file to your `gitignore` so that it does not get committed to git!

A more robust option is the package [nconf](https://github.com/indexzero/nconf). It can be used in place of, or alongside dotenv. Basically it allows you to define configuration files in multiple ways for ultimate flexibility.  For example you could have a config.js file that kept all of your secrets, but also add the ability to override one of those secrets with a command-line argument. 

Digging into this package can be useful when creating bigger projects where app configuration needs to be a little more involved. This package makes it easy to configure things such as separate production and development databases, logging and debugging options or anything else.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. The main important takeaway here is to KEEP YOUR SECRETS SECRET by never accidentally publishing them.
2. Read through the documentation for [dotenv](https://github.com/motdotla/dotenv#readme) and [nconf](https://github.com/indexzero/nconf). There are other ways to go about hiding your secrets, but these two projects are popular and widely used.
3. Go back to your earlier projects and SECURE THEM!
</div>



