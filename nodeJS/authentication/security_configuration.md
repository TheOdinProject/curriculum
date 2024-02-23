### Introduction
This lesson is a small one, but it is _incredibly important_. Now that we are dealing with Authentication, sessions, cookies and user passwords, it is crucial that we do everything we can so that our authentication system or databases are not compromised.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Access environment variables using the [process](https://nodejs.org/api/process.html#process_process_env) object in node.
- Use dotenv to store and make environment variables available to your application globally.
- Describe how environment variables are handled in version control.
- Have familiarity with `nconf`'s hierarchical configuration.

### Keep it secret, keep it safe

Essentially, in addition to using encryption to secure user passwords we need to make sure that important sensitive information such as our Express sessions secret, our MongoDB url (especially if it includes your username and password!) and any API keys that you might be using stay hidden. Details such as these should never get committed to a git repo or otherwise published.

Hiding secrets is easily accomplished and there are a handful of ways to do it. One of the most common is using an npm package called [dotenv](https://github.com/motdotla/dotenv#readme). Create a file called `.env` in your project directory and fill it with variables that represent things you need to keep secret using the syntax `[key]=[value]`, for example, `SECRET_KEY="something hard to guess"`. **Important note:** you need to add this file to your `gitignore` so that it does not get committed to git!

A more robust option is the package [nconf](https://github.com/indexzero/nconf). It can be used in place of or alongside of dotenv. Basically, it allows you to define configuration files in multiple ways for ultimate flexibility. For example, you could have a config.js file that kept all of your secrets, but also add the ability to override one of those secrets with a command-line argument.

Digging into this package can be useful when creating bigger projects where app configuration needs to be a little more involved. This package makes it easy to configure things such as separate production and development databases, logging and debugging options, or anything else.

### Secrets and PaaS

If you add secrets to a deployed project or a project that you plan on deploying, you'll have to research how to import environment variables to the PaaS you choose to use or else your deployment will fail.  For instance, when using Fly.io, you need to run `fly secrets import < .env` from the command line.


### Assignment

<div class="lesson-content__panel" markdown="1">

1. The main important takeaway here is to KEEP YOUR SECRETS SECRET by never accidentally publishing them.
2. Read through the documentation for [dotenv](https://github.com/motdotla/dotenv#readme) and [nconf](https://github.com/indexzero/nconf). There are other ways to go about hiding your secrets, but these two packages are popular and widely used.
3. Go back to your earlier projects and SECURE THEM!

</div>

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- If you still want to know more about environment variables [this](https://www.twilio.com/blog/working-with-environment-variables-in-node-js-html) article digs deeper into variations you might encounter moving forward.

### Knowledge check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [What special kind of variable can be used on a server to store secrets?](#keep-it-secret-keep-it-safe)
- [What are two widely used packages that can be used to store and import these variables?](#keep-it-secret-keep-it-safe)
- [What is the name of the file `dotenv` looks for when injecting these variables into our app?](#keep-it-secret-keep-it-safe)
