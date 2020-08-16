### Introduction

You've had a good overview of how your browser will be interacting with your web application but how do you actually get your application onto the web?  Up until now, you've built everything in the local environment, perhaps accessing the application server in your browser via `http://localhost:3000` or something similar.  That's not nearly as fun as seeing the application live on the Internet, so in this lesson we'll cover that final push to deploy your apps to [Heroku](http://heroku.com).  Deployment can sometimes be a frustrating process because the errors can be a pain to diagnose and fix, but there are a lot of Stack Overflow posts out there which will help you find your way if you get stuck.

We won't be digging into the advanced issues of deployment in this lesson... that's well outside the scope of this course.  The point here is to familiarize you with the basic deployment process and help you get your apps online in the first place.  Adding bells and whistles or speed optimizing your application will be left to your own curiosity.  You'll likely read through this now, get a sense for what's coming in the future, and then refer back to it when it's time to actually deploy some of your apps later on.

### Heroku Overview

It should be noted that Heroku is far from the only place to deploy, it just happens to be the most straightforward for a beginner.  You could also deploy directly to EC2.

Heroku is great for beginners because it's a free and "simple" push-to-deploy system.  Their system is actually built on EC2 but it saves you a lot of hassle.  Because of this, when you DO get to the paid tiers, it will be more expensive than EC2 but should be worth it for a while.  The best part is that you get free high quality hosting for any number of new apps.

#### Instances and Traffic

Heroku works by giving you virtual "Dynos" which run your app.  Basically, one dyno means one instance of your application running at one time.  That's sort of like having a single computer run your app, like you do on Localhost.  Multiple dynos is like having several copies of your app running simultaneously, which allows you to handle more traffic.  The cool thing about Rails is that you can always fire up more instances of your application if you start getting too much traffic and users start having to wait for their requests to be filled.

For most of your apps, one dyno is plenty enough.  You can support a lot of traffic using just a single dyno, and Heroku gives you your first one for free. Unfortunately, if you don't visit your app for a while, Heroku will "shut down" the dyno and basically stop running your app continuously.  They don't want to waste resources supporting the thousands of apps that no one visits.

This means that, the first time someone visits your site in a while, it will take 30-40 seconds to "fire up" a dyno with your app on it.  There are a couple solutions to this -- you can pay for an additional dyno, in which case Heroku will never idle any of your dynos, or you can set up another service to periodically ping your application (e.g. NewRelic, see below).

Heroku lets you do your application management either from the command line (using the "Heroku CLI" set of commands) or by going to their website and clicking around.  Pretty much all the functions are available in both places, which is handy.

#### Domains and Naming

Heroku will give you a random application name when you first deploy, something zen like "afternoon-falls-4209".  If you want to visit the app, you can either type `$ heroku open` on the command line or just go directly to `http://afternoon-falls-4209.herokuapp.com`.  You can change that name to whatever you want, e.g. "my-cool-app", which becomes `http://my-cool-app.herokuapp.com`.

*Note: If you change your app's name on Heroku, you'll probably need to manually update your Git remote so Git knows where to send your local application when you deploy to Heroku.*

That domain name will always be yours on Heroku.  Obviously, in the real world, you want to link it to a custom domain of your own, e.g. `http://my_cool_domain.com`.  First you'll obviously need to purchase the domain from a registrar like GoDaddy or IWantMyName.  Try using [Domainr](http://domai.nr) to find new domains, it's great.

Once you have your own domain, you will need to go in and point it to your `herokuapp.com` subdomain by changing the appropriate entry in your CNAME file.  Where does `mail.yourapp.com` or `www.yourapp.com` or `calendar.yourapp.com` go? That file, which lives at your Registrar, basically defines where incoming requests should go.  These settings are relatively easy to change but take several hours to take effect.

You'll also need to tell Heroku that you'd like to point your app to a custom domain.  See the [Heroku Custom Domains Help File](https://devcenter.heroku.com/articles/custom-domains) for detailed instructions.

#### Addons

Another great feature of Heroku is add-ons.  These are third party applications which have been designed to seamlessly add onto your own.  You can view the ones you have via the command line using `$ heroku addons` or add a new one using something like `$ heroku addons:create newrelic:standard`.  You can also work from the web interface.

[This article on Heroku Help](https://devcenter.heroku.com/articles/managing-add-ons) talks about how to work with addons.

Some of the most useful ones to you will be:

1. [New Relic](https://devcenter.heroku.com/articles/newrelic) -- It is an application monitoring and analytics service, so you know when your application has gone down or where your bottlenecks are.  They have a free plan which is useful for analytics.
2. [PGBackups](https://devcenter.heroku.com/articles/pgbackups) -- this add-on lets you make backups of your database.  There's nothing worse than losing data, and so this app will make your life a lot easier.  The free tier lets you manually download backups or set up rake tasks to do the same.
3. [SendGrid](https://devcenter.heroku.com/articles/sendgrid) is an email service, which we'll cover more later.  You can't send email without help and it's actually incredibly complex behind the scenes.  This add-on makes your life a lot easier by doing most of it for you.
4. Visit [Heroku Addons Center](https://addons.heroku.com/) for more information on available addons.

Note that you'll probably be prompted for your billing information when installing add-ons (or possibly before) because they need to be able to charge for overages.

### Deploying to Heroku

If you haven't deployed to Heroku before and this is your first time, feel free to just skim this section.  It's meant to be a handy reference for later.

We'll do a quick overview of how it will work. It's not meant to be a step-by-step guide... for that, please check out [Heroku's "Getting Started with Rails 5.x" guide](https://devcenter.heroku.com/articles/getting-started-with-rails5).  A typical convention with Heroku commands is that they're prefixed with either `$ heroku run` or just `$heroku`, so running a database migration on Heroku is `$ heroku run rails db:migrate` and using the console is `$ heroku run console`.

* Download and install the Heroku CLI.  You'll likely need to set up the proper SSL configuration so your computer is able to securely move files to and from Heroku.
* Install Heroku's special gems -- in Rails 4, there were some changes that broke Heroku so they made a really simple gem that you'll need to add to your application
* Install the correct database gem -- if you've been using SQLite3 as your development database, you'll need to set up PostgreSQL for production since it's the only database Heroku uses.  This will mean adding the `pg` gem to your gemfile and putting the correct fields into your `database.yml` file.
* Create a new Heroku application from the command line using `$ heroku create`.  This will also add a new remote to your Git setup so that Git knows where to push your app (so you don't need to worry about that).
* Ready? Push using the command `$ git push heroku master`.
* But wait, there's more!  The last step you'll need to do is manually set up your database.  Any time you run migrations or otherwise alter your database, you will need to remember to also run them on Heroku.  If it's your first database, you'll likely do something like `$ heroku run rails db:migrate`.  If you've set up seeds, you can also run them now.

#### What's Going On?

There's no magic here... When you created the new Heroku app, you also automatically set up the "heroku" remote to point to your application on Heroku.  When you execute `$ git push heroku master`, Git will just ship your code up to Heroku.

From there, Heroku more or less does what you do for your own localhost.  First, it will take the "slug" of code and files that you uploaded, identify your Ruby version, and run a `$ bundle install`.  It sets up your database connection and then runs the asset pipeline.

In development, Rails only partially executes the asset pipeline -- it runs all the preprocessors but serves asset files like stylesheets and javascripts individually (check your local server logs to see it serving dozens of individual files).  In production, Heroku will finish the job by not only running the preprocessors but also mashing your assets into those single files with the timestamp names (check out the source code of this page for an example -- as I type the stylesheet is called `assets/application-1fc71ddbb281c144b2ee4af31cf0e308.js`).

So it doesn't have to run this part of the asset pipeline (which won't actually change at all from one visit to the next) every single time a new HTTP request is served, Heroku will "precompile" the assets up front and serve them from the cache.

Once precompilation is complete, Heroku will fire up a dyno with your application on it and you should be able to visit it within 30 seconds or so by running `$ heroku open` or just navigating directly to the application's address.

#### Essential Heroku Commands

A brief list of Heroku commands you should know:

* `$ heroku run rails db:migrate`
* `$ heroku run console` gives you a Rails console, though in Production (so don't mess around with things, this is real data!)
* `$ heroku logs -t` shows you your server logs (like you're used to when running `$ rails server`) on a streaming basis (which is the result of the `-t`, or "tail" flag).  See [this Heroku post](https://devcenter.heroku.com/articles/logging) for more information on logging.
* `$ heroku restart` -- for if your application has failed and won't start up.  See [this SO post](http://stackoverflow.com/questions/14612695/heroku-how-can-i-restart-my-rails-server) for more.

### Learning to Love Heroku: Errors

You will have errors.  The two main places where errors pop up are during the deployment process and when you try to actually run your app (e.g. by getting a 500 server error).  The key is, as usual, not to panic and to follow a calm, step-by-step debugging process.  Especially when you're first starting out, it's probably a simple problem so if you check the logs or error output you can usually figure it out directly or Google the message to find a helpful Stack Overflow post.

If you're several deployments deep and something broke, backtrack to the last working deploy and figure out what you changed before running around willy-nilly and changing config files based on Internet advice.  Sometimes it's unavoidable, but not knowing *why* something broke can come back to bite you later.

We'll cover a few common cases below, but see [Heroku's brief guide on diagnosing errors](https://devcenter.heroku.com/articles/error-pages) for a good way to start.  It also talks about creating your own error messages for Heroku to use.

### On Deployment

Your very first few times, you'll probably run into relatively straightforward errors.  Some may have to do with setting up Heroku properly, which should be obvious if the error messages are something to the effect of "we can't actually find this command that you typed" or "you're not authorized to do this".

Another common early mistake is forgetting to include a gem (or forgetting to put it in the correct section of your gemfile -- remember we're in the `production` section, not the `development` section).

Once the early errors are bypassed, another really common class of errors is related to the asset pipeline.  I'm not going to claim to understand where all these come from -- I've had asset pipeline issues dozens of times before and you can probably expect them as well.  For some reason, some gems and configurations seem to mess with Heroku's ability to precompile assets.  You may encounter an asset error when the deployment fails or if your application seems to be unable to locate stylesheets or images (this should be apparent if you've got errors in your browser's console).

Deployment errors, including those with asset precompilation, are often solved by modifying your Rails configuration files.  The two main files you'll probably find yourself needing to edit are `config/environments/production.rb` (most common) and `config/initializers/some_gem.rb` (if a gem needs to be configured). Often the stuff you read on Stack Overflow will tell you to add or edit one of the options, e.g. `config.assets.compile = false`.  Bear with it.

For fixing a precompilation issue, you may also be prompted to manually precompile the assets yourself and then just pass Heroku the resulting file.  Sometimes this works... it's not a magic bullet and it gets to be a pain when you need to re-run the compilation command yourself every time you deploy changes to assets.

### 500's While Running the Application

No one likes getting that bland "We're sorry but something went wrong" message from Heroku.  They serve up a 500 error regardless of which error your application threw, which makes it doubly frustrating to diagnose them.  You'll want to open up the Heroku logs (`$ heroku logs -t`) to check out the server output.

If this is your first deployment and your very first page served up a 500, did you remember to migrate your database?  That's a common one.

Other 500 errors will just have to be tracked down using the logs.  It should incentivize you to build useful error messages into [your application logs](https://devcenter.heroku.com/articles/logging)!

Another common class of errors is related to switching from an SQLite3 database in development to the PostgreSQL one in production (another reason you should wean yourself off SQLite3 and use PG in development as soon as possible).  There are just some little things, especially if you're using direct SQL code or `true`/`false` in your ActiveRecord queries (in PG it's `t`/`f`).  Postgres errors can be annoying to diagnose so it's usually best to get them over with in development (when you can operate much faster) than to combine them with any errors you may have in deployment.

Remember Environment Variables (aka "Config vars")?  If you've got any gems or add-ons which require special tokens or API codes that you shouldn't hardcode into your application, you will need to tell Heroku what those variables are.  This is another tricky one to diagnose because often times these gems will fail silently and you'll be left wondering why they didn't work.  We'll get into this a bit more in the lesson on working with APIs.

To get your environment variables to Heroku, you can either manage them using a gem like `figaro` (see [docs here](https://github.com/laserlemon/figaro)) or [directly upload them](https://devcenter.heroku.com/articles/config-vars) with a command like `$ heroku config:set YOUR_VARIABLE=some_value`.  This will make that variable available to all instances of your application running on Heroku (you won't need to reset it each time either).


#### Localhost Tricks and Tips

Dialing things back to the local environment, here are a few useful things to know to help you work more efficiently in development:

* Use `$ rails server -p 3001` to create a Rails server on a different port (in the example, port 3001).  This way you can run multiple Rails apps at the same time.  Just go to http://localhost:3001 now to access the new app.

## Assignment

We won't have too much reading here because many of the links are interspersed with the sections above and, **if you're a complete beginner, you can safely skip this until later**.  The important thing is to understand conceptually how the deployment process works and have the confidence to locate the documents you need to diagnose issues.  The project will have you actually do it.

<div class="lesson-content__panel" markdown="1">
  1. Read the [Heroku Deployment Guide](https://devcenter.heroku.com/articles/getting-started-with-rails5) for a step-by-step guide to deploying.
  2. Read [How Heroku Works](https://devcenter.heroku.com/articles/how-heroku-works) for a better understanding of the tool you're using.
</div>

### Conclusion

Deployment is one of the most satisfying parts of building an application... once you get it actually working!  Now you can show your friends what you've built or get your business online.  Pretty cool stuff.  You just need to accept that you'll probably run into various errors during the process and you're not the first person to do so.

Best of all, once you can deploy an app to the interwebs, you're officially free to go into the world and build applications of your own.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.


* [Heroku Custom Domains](https://devcenter.heroku.com/articles/custom-domains) help file
* [Converting from PostgreSQL to SQLite3](http://manuel.manuelles.nl/blog/2012/01/18/convert-postgresql-to-sqlite/)
* [Webinar on Using Heroku in Production](https://blog.heroku.com/archives/2013/7/11/running-production-apps-on-heroku)
