# Building and Integrating APIs

## Introduction

Working with APIs is awesome and frustrating at the same time.  On the one hand, interfacing with other applications out there can greatly improve the reach and "cool factor" of your own app.  On the other, it involves lots of reading through documentation, figuring out authentication strategies, and parsing bad (or nonexistant) error messages.

Backing up, if you're still unclear on what an API (Application Programming Interface) basically is, [read the Skillcrush explanation](http://skillcrush.com/2012/07/04/api-2/) and then [read the first bit of this article](http://money.howstuffworks.com/business-communications/how-to-leverage-an-api-for-conferencing1.htm) to catch up. 

"API" is an incredibly broad concept -- any time your application talks to another application, that's via some sort of API.  The components within your own application, e.g. the different pieces of Rails, also talk to each other via APIs... they are more or less independent sub-applications that pass along the data they each need to complete their particular task.  Everything's an API in application-land!

When you build applications that have more dynamic front-end functionality (as complicated as single page Javascript applications or as simple as individual AJAX calls), they will talk to your Rails backend via your own APIs... which is really just an extra line or two of code to tell your controllers how to spit out JSON or XML instead of HTML.  

In this lesson, we'll cover both types of APIs -- the simple ones you'll build yourself and how to interface with the APIs of other applications.  It's meant to give you a good onramp to learning this stuff but couldn't possibly cover all the cases.  Much of working with APIs is learning to read their documentation and figure out what they want.

## API Basics

Your Rails application is basically already an API, though you may not think of it that way.  The web browser your user is running is also a program, so it is effectively making an API request to your Rails app whenever you request a new page.  It just so happens that rendering HTML payloads is so common that we just bake that into things as the default response type and consider everything else special.  

Often, though, you want to make a request that doesn't need to go through all the headache of using a web browser.  You may not care how the page is structured (HTML), but instead just want to get straight to the data.  Say you want to get a list of all users.  You could go to something like `http://yourapplication.com/users` which will probably run the `#index` action and render a list of all the application's users.  

But why bother with all that extra stuff if all you want is the user list?  The easiest thing to do would be to submit a request to that same URL asking for a JSON or XML response instead.  If you set up your Rails controller properly, you will get back a simple JSON array object containing all the users.  Sweet!

The same principal applies if you're talking to external APIs... say your want to grab a user's recent tweets from Twitter.  You just need to tell your Rails app how to talk to Twitter's API (e.g. authenticate yourself), submit the request, and handle the bunch of tweets that get returned.  

## Building APIs

You might want to make your Rails application entirely into an API backend for a front end webpage or you might just want to learn how to send out JSON when your front end requests it.  This section won't cover how to build a full featured RESTful API with authentication features... it is a gentle introduction to treating your application as an API.

### The Basics

If you want your Rails app to return JSON instead of HTML, you need to tell your controller to do so.  The cool thing is that the same controller action can return different things depending on whether your user is making a normal request from a browser or an API call from the command line.  It determines which type of request is being made based on the extension of the file asked for, e.g. `example.xml` or `example.json`.  

You can see which file type Rails thinks you want by checking your server log:

    Started GET "/posts/new" for 127.0.0.1 at 2013-12-02 15:21:08 -0800
    Processing by PostsController#new as HTML

The first line tells you which URL was requested and the second tells you where it's going and how Rails is processing it.  If you use a `.json` extension, it looks like:

    Started GET "/posts.json" for 127.0.0.1 at 2013-12-04 12:02:01 -0800
    Processing by PostsController#index as JSON

If you've got a sample application running, try going to different URLs.  If your controller isn't ready for them, you may get an error, but you should be able to see what Rails thinks you're asking for.

### Rendering JSON or XML

Once you've decided that you want to respond to a request for JSON or XML, you need to tell your controller to render JSON or XML instead of HTML.  The way to do so is by using the `#respond_to` method:

    class UsersController < ApplicationController
      def index
        @users = User.all
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @users }
          format.json { render :json => @users }
        end
      end
    end

In this case, `respond_to` passes the block a format object, to which you can attach the appropriate rendering call.  If you do nothing, html will render using the default Rails template as normal (in this case, `app/views/index.html.erb`).

The `render` function is smart enough to know how to render a wide range of formats.  When you pass it the key `:json`, it will call `#to_json` on the value, in this case `@users`.  That will make your Ruby object(s) into JSON strings, which can be transmitted to the requesting application.

And just like that, you've got yourself an API.  Of course, things can get a bit more complicated if you want to do unusual things, but that's the basics.

#### Specifying Attributes to Return

Let's say you want to make sure you don't return the user's email address with the User object.  In this case, you'll want to edit which User attributes get returned by modifying what the `#to_json` method does.  

In the old days, you'd just overwrite your own version of `#to_json` but these days you don't need to do that -- you will actually overwrite the `#as_json` method instead.  The `#as_json` method is used by `#to_json`, so modifying it will implicitly change the output of `#to_json`, but in a very specific way.  

`#to_json` does two things -- it runs `#as_json` and gets back a hash of attributes which will need to be rendered as JSON.  Then it will actually perform the rendering into JSON using `ActiveSupport::json.encode`.  So by modifying `#as_json`, you're more specifically targeting the part of the `#to_json` method that you actually want to change.

In our case, we'll do this by modifying `#as_json` in our model to return only the attributes we want:

    # app/models/user.rb
    class User < ActiveRecord::Base

      # Option 1: Purely overriding the #as_json method
      def as_json(options={})
        { :name => self.name }  # NOT including the email field
      end

      # Option 2: Working with the default #as_json method
      def as_json(options={})
        super(:only => [:name])
      end
    end

In our controller, we then just need to render JSON as normal (in this case, we'll just always return JSON, whether it's an HTML request or not):

    # app/controllers/users_controller.rb
    class UsersController < ApplicationController

      def index
        render :json => User.all
      end
    end

Note that you don't need to call `#to_json` yourself when using `#render`... it will do it for you.

See the [as_json documentation](http://apidock.com/rails/ActiveModel/Serializers/JSON/as_json) for details and more, like how to include associations.

#### Rendering Nothing or Errors

Sometimes you just want to send out an HTTP error code without any response body.  The web is conflicted about the best practices for doing so (see [This older blog](http://www.intridea.com/blog/2008/7/23/using-http-status-codes-for-rails-ajax-error-handling) for one approach or [this SO answer](http://stackoverflow.com/questions/9130191/how-to-return-correct-http-error-codes-from-ruby-on-rails-application) for another set of answers) .  Here's a simple example (again just rendering the error for all formats):

    # app/controllers/users_controller.rb
    class UsersController < ApplicationController.rb
      def index
        render :nothing => true, :status => 404
      end
    end


#### Creating Dynamic Error Pages

You can create your own error pages, see [this blog post](http://wearestac.com/blog/dynamic-error-pages-in-rails).

Sometimes Heroku can require additional steps to properly display your error pages.  See [their error page docs here](https://devcenter.heroku.com/articles/error-pages).  You might need to delete the static pages in the `app/public` directory.

### External Facing Security

Let's say you want to only allow an API call if your user is logged in.  Your existing controller authentication will work to cover this as well -- just make sure you've got the right `#before_action` set up (e.g. `before_action :require_login`).  This might be the case if both logged in and non-logged-in users will be viewing the page but each should see different data.  You don't want your not-logged-in-users to be able to make API requests for sensitive data just like you wouldn't want them to be able to visit an unauthorized HTML page.

### Next Steps

Right now you've got the ability to use your Rails app to serve up not just HTML but also whatever formats you want.  If you'd like to take this further and allow other developers to build on your platform (so they'll be making programmatic requests instead of logging in as users), you'll need to make your API system more robust.  We won't cover it all here, but check out the following: 

* [Building Awesome Rails APIs](http://collectiveidea.com/blog/archives/2013/06/13/building-awesome-rails-apis-part-1/) has a lot of best practices for moving beyond a toy API and into a production-ready app.

## Interfacing with APIs

It's pretty easy to turn your application into an API, but what about grabbing data from other APIs across the internet?  That's where things usually get a bit more challenging because they're all different and you've got to authenticate yourself.

Most popular services offer APIs so developers can interface with them (and thereby spread their brand of course).  Facebook, Twitter, Instagram, Flickr, Dropbox, AirBnB... They've all got APIs.  Just Google "companyX API" and you'll get to their developers section.

If you go to the documentation for an API, it can sometimes be a bit overwhelming because much of the material sort of assumes that you know what you're doing, but some are definitely better than others.  There are also elements that are common across almost all of them.

You will need to register yourself and your application with the API provider.  They will track and monitor your usage this way.  Typically, there is a free tier of usage and it will cost you if you're going over your limits, whether they are expressed in terms of total MB downloaded, number of requests, or number of transactions (for instance).  Usually, even if you're a user of their service, you will need to separately go to their developer portal.

You will need to get an **API key** from the API provider, which often is the last part of registration.  This key will uniquely identify your application to the API provider and you will send it along with every request.  It's sort of like a user on your site automatically submitting their session cookie with each request so you know they're logged in.  

You'll typically also get a "secret key" or similarly named code.  Whereas the API key is usually public, the secret key is an added layer of security that's required for the more secure APIs and you will use it to generate a cryptographic token that authenticates any requests you make.  You will need to make sure you don't include this secret key in your Git repo!  Use the `figaro` gem or environment variables to put the key on the server instead of hard coding it.

### API Rates and Security Tokens

Most APIs require a different type of "security clearance" for different requests:  

1. You can usually make innocuous requests like asking for Tweets with straightforward and unauthenticated GET requests.  You can make these from any command line or a browser tool like [Chrome's Rest Client](https://chrome.google.com/webstore/detail/postman-rest-client). These types of API requests are usually severely rate limited to incentivize you to sign up.  
2. The next layer is making requests that include your API key. These are still usually fairly innocuous things (like getting public data) and limited by the API's pricing tiers.
3. More sensitive requests like asking for specific user data or submitting/modifying/deleting data will likely require you to use an authentication process involving your secret token.  We'll cover the basics of this in the project.  Rates for these requests are subject to the API pricing tiers.
4. Oftentimes, you actually want to make requests on behalf of a user.  For instance, showing a user a dashboard of all his tweets and Facebook posts together would require asking Twitter for that user's tweets and Facebook for that user's posts.  This can involve a LOT of requests over a large user base, but luckily you're actually able to make them on the user's behalf by asking for the user's permission.  We'll cover this as well later, but basically you send the user to the API provider's site to sign in, then the API provider will give you a user-specific token to use when making requests on their behalf in the future.  Rates for this are usually more advantageous because they are covered in a by-user bucket.  We typically use the OAuth protocol for this, as described below.

### Versions

Tech companies, especially if they've been around for a while, typically have several versions of their API.  Usually, they built a first draft version when they were a startup and then had to build a real one later, but still have to support the original since so many other applications are likely to be using it.  

Just go for the latest version unless you have a compelling reason not to (it's usually got a separate section of documentation for each API).  Pay attention to which version's docs you're looking at... nothing like the frustration of realizing you've been looking at the v1 API instead of the v2 API docs.

### RESTful APIs

Just like your routes should ideally be set up in a RESTful way, so too should APIs.  These days, most APIs are RESTful, meaning the usual batch of GET/PUT/PATCH/DELETE requests will retrieve resources as expected.  The good part about setting up your application routes RESTfully is that your API will be the same way.

Working with RESTful APIs at least takes a lot of the headache out of the process since you can usually sort of guess what you should be doing, then can head over to the docs to figure out how exactly and what format you'll get the results back in.

### Oauth and Login via API

You've seen sites where their homepage lets you log in using Facebook or Twitter or LinkedIn.  Then you magically have a new account with them but don't need to give them a new password.

OAuth is usually behind this.  It solves the very real problem of user data privacy and access control.  The idea is that the user shouldn't need to give you their password in order for you to make requests on their behalf.  So OAuth allows Facebook to act as a sort of intermediary when dealing with the user.

This has two great use cases -- logging in the user with an external site like Facebook and making requests for or submissions of data on the User's behalf.

In the first case, instead of getting the user's Facebook password, they go to Facebook's website and sign in, authorizing you to use some of their data (which you must request for them).  Facebook then calls you back (by sending a request to a URL of your choosing with the proper data) and gives you a special access token for that user and any additional data that the user has authorized you to access (like their name and email address).  Now you can create a new user in your database with that data and everyone's relatively happy.

From the user's perspective, they only need to remember their Facebook password to log into your site so it's easy for them.  They also don't need to trust you with their password.  As long as they trust Facebook, they can use your site.  Also, if your site is doing bad things with their data (like when SocialCam spammed the hell out of everyone's Facebook timeline for a while), they can tell Facebook to stop allowing you to use their data and Facebook will turn off access for the token they gave you.  

From Facebook's perspective, they retain majority ownership of the user and nestle deeper into everyone's lives (for better or for worse).

Once you have the user token, you are allowed to make requests or submissions based on whatever permissions Facebook (and the user) authorized you to.  That could involve asking who their friends are, posting on their timeline, or "liking" something.  You just need to include the token as a part of your authentication process for the request.

#### Restrictions

Every site, in addition to rate limiting their API, will have terms of use.  This usually covers what you're allowed to do with the data you gather.  For instance, they probably aren't going to allow you to store a whole bunch of their data in your own database (harvesting).  They also probably won't allow you to do anything SPAMmy or which will hurt their user's experience.  Common sense should be your initial guide, but consult the TOU documentation for specifics.  Basically, if you'll be hurting their user's experience or taking their precious data, you can't do it.

It should be noted that any time you develop using someone else's API, you're putting yourself at their mercy.  If you're using it to the point where you pay for data, they'll love you.  If you get too successful and become competitive with them, they've got you by the neck and will cut you off or demand exorbitant fees.  Just be cognizant of those risks.

#### OAuth 2.0 Basics

OAuth 2.0 is actually pretty complicated, so I'll just cover the basic process.  You don't really need to care how exactly it works behind the scenes until you start really developing with it or trying to create your own API that uses it.  You will need to understand the steps involved in the user experience because you'll be  Basically:

1. User tries to access a page on your app and you ask the user to login
2. User chooses the "Login With Facebook" option
3. User is redirected to a Facebook page asking them to review the permissions you are asking for and telling them to sign in.  The URI will contain parameters that tell Facebook who your application is and possibly which URI they should submit their response to (or maybe you specified this as a part of your API registration process with them).
4. User decides you're allowed to see their email address and post to their timeline so he signs in.  Facebook creates an authorization code back to your application's callback URI. 
5. The user waits while your application takes that authorization code and uses it to ask Facebook for the real good stuff.  Facebook makes sure your application is the same one the user authorized, then POSTs back to you a unique authentication token for the user (which likely expires in 90 days) and any data you asked for up front (like email address).
5. You store the user's unique token in your database and use it, along with your application key(s), to make any subsequent requests on the user's behalf.

See [this brief overview of OAuth 2.0](http://tutorials.jenkov.com/oauth2/overview.html) for an overview.  Then check out [this more substantive explanation from tutsplus.com](http://net.tutsplus.com/tutorials/oauth-2-0-the-good-the-bad-the-ugly/).

#### Implementing OAuth 2.0 in Rails -- Use Omniauth!

This sounds horribly complicated! Someone must have made a gem for it...

Luckily someone has.  Many someones, actually.  There is a generic OAuth gem called `omniauth` (docs available [on Github](https://github.com/intridea/omniauth)) and then a separate gem which provides a specific authentication strategy for every major API (see the list [HERE](https://github.com/intridea/omniauth/wiki/List-of-Strategies)).  Once you've gone through things with one of them, you'll become comfortable with all of them.

I'll leave it to the projects to walk through using Omniauth since it's much easier to learn by doing than reading a bunch of bullet points.

### SDKs

In addition to or instead of API access, many companies provide SDKs (software development kits).  Usually these are Javascript libraries that contain all the code necessary to access their API.  This can be useful because you're then able to access the API with simple Javascript methods instead of doing backflips on your own backend.  It comes with the downside, however, of expanding your code base and forcing you to use their conventions for everything.  

We won't cover SDKs explicitly in this course but they should be well within reach to pick up by reading the documentation.

## Service Oriented Architecture (SOA)

This is a good time to introduce an architectural concept called "Service Oriented Architecture".  The basic idea is that your application will likely have many different services within it, for instance the payments processing, user registration, recommendation engine, etc.  Instead of building all of these under the same master application, you break them out into fully independent pieces and have them talk to each other using internally facing APIs.  

This is good for many reasons.  Because each piece of your application doesn't care the other pieces work and it only knows how to ask for data via their APIs, it allows you to make major changes to the code within a service and the rest of your application works just the same.  You can compeletely substitute one service for another and, as long as it communicates using the same API methods, it's easy.  You can use an external API for a part of your app (like payments) instead of an internal one.  You can have a PHP app talking to a Python app talking to a Rails app and no one cares since they're all communicating using APIs

It's usually a good idea to strive to keep independent pieces of your application as independent as possible anyway.  Formalizing this under the umbrella of SOA forces you to think in terms of exactly which methods you want to expose to the other parts of your application and it will make your code better along the way.  An added benefit is that, when you assume that each major component of your application is independent, you can also isolate issues much easier and will be forced to handle errors in a reasonable way.  They would have happened anyway, but this architectural decision cleans things up markedly.


Using an SOA architecure for your whole application is sort of like breaking up a giant and complicated Ruby script into nice neat classes and methods, just on a broader scale. 

One of the best known cases of switching to a service-oriented architecture was Amazon.com.  Sometime in 2002, Jeff Bezos basically dictated that every group would switch to SOA or be fired.  An [infamous blog post](https://plus.google.com/+RipRowan/posts/eVeouesvaVX) from a Google Employee, accidentally released to the public instead of staying internal to the company, talked about Amazon's strength with SOA.  It's a great read so check it out, but the basics of Bezos' email are, as quoted from the post:

    1) All teams will henceforth expose their data and functionality through service interfaces.

    2) Teams must communicate with each other through these interfaces.

    3) There will be no other form of interprocess communication allowed: no direct linking, no direct reads of another team's data store, no shared-memory model, no back-doors whatsoever. The only communication allowed is via service interface calls over the network.

    4) It doesn't matter what technology they use. HTTP, Corba, Pubsub, custom protocols -- doesn't matter. Bezos doesn't care.

    5) All service interfaces, without exception, must be designed from the ground up to be externalizable. That is to say, the team must plan and design to be able to expose the interface to developers in the outside world. No exceptions.

    6) Anyone who doesn't do this will be fired.

SOA is a big deal.  There are certainly a lot of issues that crop up when you're using it -- see [this post on Amazon's "lessons learned"](http://apievangelist.com/2012/01/12/the-secret-to-amazons-success-internal-apis/) -- but it ultimately has a lot of benefit.

You probably won't be worrying too much about SOA while building "toy" applications for yourself but it will certainly come up if you find yourself working at a tech company and it's a good principle to become familiar with.

## Your Assignment

1. Read the [Rails Guide on Controllers](http://guides.rubyonrails.org/action_controller_overview.html) section 7 to learn about rendering JSON and XML.
2. 

## Conclusion

APIs are fundamental to making rich web applications and they're also a lot of fun -- it makes your app feel a lot more "real" when you're able to let your users log in using Facebook or can display information from different sources across the web.  There's no question that working with APIs involves reading a lot of documentation and head scratching to figure out authentication strategies, but once you've got the gist of how it all works, you'll be able to interface with pretty much anyone's API or create your own.

We'll get more into using your application as an API during the course on Javascript.  In that course, you'll build some full stack apps that use Javascript AJAX calls to smooth out the user experience, which basically involves asking your Rails app for some XML or JSON data instead of a full HTML page.  Then you'll get to build some single page Javascript apps which rely on the API provided by your Rails app for all the necessary database data but otherwise completely run the show on the front end.

The best way to really figure out APIs is to build them and interface with them, so we'll focus on that in the projects. 

## Additional Resources

* [Building a public-facing API using view templates instead of `#to_json`](http://engineering.gomiso.com/2011/05/16/if-youre-using-to_json-youre-doing-it-wrong/)
* [`to_json` or `as_json` by Jonathan Julian](http://jonathanjulian.com/2010/04/rails-to_json-or-as_json/) gives specific examples of digging into the `as_json` method.