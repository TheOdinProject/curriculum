### Introduction

Working with APIs is awesome and frustrating at the same time.  On the one hand, interfacing with other applications out there can greatly improve the reach and "cool factor" of your own app.  On the other, it involves lots of reading through documentation, figuring out authentication strategies, and parsing bad (or nonexistent) error messages.

Backing up, if you're still unclear on what an API (Application Programming Interface) basically is, [read the Skillcrush explanation](http://skillcrush.com/2012/07/04/api-2/) and then [read the first bit of this article](http://money.howstuffworks.com/business-communications/how-to-leverage-an-api-for-conferencing1.htm) to catch up.

"API" is an incredibly broad concept -- any time your application talks to another application, that's via some sort of API.  The components within your own application, e.g. the different pieces of Rails, also talk to each other via APIs... they are more or less independent sub-applications that pass along the data they each need to complete their particular task.  Everything's an API in application-land!

When you build applications that have more dynamic front-end functionality (as complicated as single page Javascript applications or as simple as individual AJAX calls), they will talk to your Rails backend via your own APIs... which is really just an extra line or two of code to tell your controllers how to spit out JSON or XML instead of HTML.  

In this lesson, we'll cover how to build your own API.  In the following lesson, we'll cover how to interface with the APIs of other applications.  The lessons are meant to give you a good onramp to learning this stuff but couldn't possibly cover all the cases.  Much of working with APIs is learning to read their documentation and figure out what they want.

### Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* How Rails knows which type of file you are expecting back when you make an HTTP request.
* What is the purpose of the `#respond_to` method?
* How do you return a User object but specify that you don't want to include certain attributes (i.e. you can't just return `User.first`)?
* What are the two steps performed behind the scenes by the `#to_json` method?
* How do you tell a controller action to render nothing but an error message?
* How do you build your own custom error messages?
* Why can't you use session-based controller authentication methods if you want people to access your API programmatically?
* What is "Service Oriented Architecture?"

### API Basics

Your Rails application is basically already an API, though you may not think of it that way.  The web browser your user is running is also a program, so it is effectively making an API request to your Rails app whenever you request a new page.  It just so happens that rendering HTML payloads is so common that we just bake that into our server-side programs as the default response type and consider everything else special.  

Often, though, you want to make a request that doesn't need to go through all the headache of using a web browser.  You may not care how the page is structured (HTML), but instead just want to get straight to the data.  Say you want to get a list of all users.  You could go to something like `http://yourapplication.com/users` which will probably run the `#index` action and render a list of all the application's users.  

But why bother with all that extra stuff if all you want is the user list?  The easiest thing to do would be to submit a request to that same URL asking for a JSON or XML response instead.  If you set up your Rails controller properly, you will get back a simple JSON array object containing all the users.  Sweet!

The same principle applies if you're talking to external APIs... say you want to grab a user's recent tweets from Twitter.  You just need to tell your Rails app how to talk to Twitter's API (e.g. authenticate yourself), submit the request, and handle the bunch of tweets that get returned.  

### Building APIs

You might want to make your Rails application entirely into an API backend for a front end webpage or you might just want to learn how to send out JSON when your front end requests it.  This section won't cover how to build a full featured RESTful API with authentication features... it is a gentle introduction to treating your application as an API.

#### The Basics

If you want your Rails app to return JSON instead of HTML, you need to tell your controller to do so.  The cool thing is that the same controller action can return different things depending on whether your user is making a normal request from a browser or an API call from the command line.  It determines which type of request is being made based on the extension of the file asked for, e.g. `example.xml` or `example.json`.  

You can see which file type Rails thinks you want by checking your server log:

```language-bash
  Started GET "/posts/new" for 127.0.0.1 at 2013-12-02 15:21:08 -0800
  Processing by PostsController#new as HTML
```

The first line tells you which URL was requested and the second tells you where it's going and how Rails is processing it.  If you use a `.json` extension, it looks like:

```language-bash
  Started GET "/posts.json" for 127.0.0.1 at 2013-12-04 12:02:01 -0800
  Processing by PostsController#index as JSON
```

If you've got a sample application running, try going to different URLs.  If your controller isn't ready for them, you may get an error, but you should be able to see what Rails thinks you're asking for.

#### Rendering JSON or XML

Once you've decided that you want to respond to a request for JSON or XML, you need to tell your controller to render JSON or XML instead of HTML.  The way to do so is by using the `#respond_to` method:

```language-ruby
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
```

In this case, `#respond_to` passes the block a format object, to which you can attach the appropriate rendering call.  If you do nothing, html will render using the default Rails template as normal (in this case, `app/views/index.html.erb`).

The `#render` function is smart enough to know how to render a wide range of formats.  When you pass it the key `:json`, it will call `#to_json` on the value, in this case `@users`.  That will make your Ruby object(s) into JSON strings, which can be transmitted to the requesting application.

And just like that, you've got yourself an API.  Of course, things can get a bit more complicated if you want to do unusual things, but that's the basics.

#### Specifying Attributes to Return

Let's say you want to make sure you don't return the user's email address with the User object.  In this case, you'll want to edit which User attributes get returned by modifying what the `#to_json` method does.  

In the old days, you'd just overwrite your own version of `#to_json` but these days you don't need to do that -- you will actually overwrite the `#as_json` method instead.  The `#as_json` method is used by `#to_json`, so modifying it will implicitly change the output of `#to_json`, but in a very specific way.  

`#to_json` does two things -- it runs `#as_json` and gets back a hash of attributes which will need to be rendered as JSON.  Then it will actually perform the rendering into JSON using `ActiveSupport::json.encode`.  So by modifying `#as_json`, you're more specifically targeting the part of the `#to_json` method that you actually want to change.

In our case, we'll do this by modifying `#as_json` in our model to return only the attributes we want:

```language-ruby
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
```

In our controller, we then just need to render JSON as normal (in the example below, it will just always return JSON, whether it's an HTML request or not):

```language-ruby
    # app/controllers/users_controller.rb
    class UsersController < ApplicationController

      def index
        render :json => User.all
      end
    end
```

Note that you don't need to call `#to_json` yourself when using `#render`... it will do it for you.

See the [as_json documentation](http://apidock.com/rails/ActiveModel/Serializers/JSON/as_json) for details and more, like how to include associations.

#### Rendering Nothing or Errors

Sometimes you just want to send out an HTTP error code without any response body.  The web is conflicted about the best practices for doing so (see [This older blog](http://www.intridea.com/blog/2008/7/23/using-http-status-codes-for-rails-ajax-error-handling) for one approach or [this SO answer](http://stackoverflow.com/questions/9130191/how-to-return-correct-http-error-codes-from-ruby-on-rails-application) for another set of answers) .  Here's a simple example (again we are just rendering the error in all cases):

```language-ruby
    # app/controllers/users_controller.rb
    class UsersController < ApplicationController
      def index
        render :nothing => true, :status => 404
      end
    end
```


#### Creating Dynamic Error Pages

You can create your own error pages. See [this blog post](http://wearestac.com/blog/dynamic-error-pages-in-rails).

Sometimes Heroku can require additional steps to properly display your error pages.  See [their error page docs here](https://devcenter.heroku.com/articles/error-pages).  You might need to delete the static pages in the `app/public` directory first.

#### External Facing Security

Let's say you want to only allow an API call if your user is logged in.  Your existing controller authentication will work to cover this as well -- just make sure you've got the right `#before_action` set up (e.g. `before_action :require_login`).  This might be the case if both logged in and non-logged-in users will be viewing the page but each should see different data.  You don't want your not-logged-in-users to be able to make API requests for sensitive data just like you wouldn't want them to be able to visit an unauthorized HTML page.

If you want to handle requests from an application that isn't a web browser (e.g. the command line), you can't rely on browser cookies to authenticate you.  That's why most APIs issue custom tokens to each authorized user which must be sent along with the request as part of the authentication process.  We'll talk a bit more about tokens in the next lesson.

#### Next Steps

Right now you've got the ability to use your Rails app to serve up not just HTML but also whatever formats you want.  If you'd like to take this further and allow other developers to build on your platform (so they'll be making programmatic requests instead of logging in as users), you'll need to make your API system far more robust.  We won't cover it all here, but check out the following:

* [Building Awesome Rails APIs](http://collectiveidea.com/blog/archives/2013/06/13/building-awesome-rails-apis-part-1/) has a lot of best practices for moving beyond a toy API and into a production-ready app.

### Service Oriented Architecture (SOA)

This is a good time to introduce an architectural concept called "Service Oriented Architecture".  The basic idea is that your application will likely have many different services within it, for instance the payments processing, user registration, recommendation engine, etc.  Instead of building all of these under the same master application, you break them out into fully independent pieces and have them talk to each other using internally facing APIs.  

This is good for many reasons.  Because each piece of your application doesn't care how the other pieces work and it only knows how to ask for data via their APIs, it allows you to make major changes to the code within a service and the rest of your application works just the same.  You can completely substitute one service for another and, as long as it communicates using the same API methods, it's easy.  You can use an external API for a part of your app (like payments) instead of an internal one.  You can have a PHP app talking to a Python app talking to a Rails app and no one cares since they're all communicating using APIs

It's usually a good idea to strive to keep independent pieces of your application as independent as possible anyway.  Formalizing this under the umbrella of SOA forces you to think in terms of exactly which methods you want to expose to the other parts of your application and it will make your code better along the way.  An added benefit is that, when you assume that each major component of your application is independent, you can also isolate issues much easier and will be forced to handle errors in a reasonable way.  

Using an SOA architecure for your whole application is sort of like breaking up a giant and complicated Ruby script into nice neat classes and methods, just on a broader scale.

One of the best known cases of switching to a service-oriented architecture was Amazon.com.  Sometime in 2002, Jeff Bezos basically dictated that every group would switch to SOA or be fired.  An [infamous blog post](https://plus.google.com/+RipRowan/posts/eVeouesvaVX) from a Google Employee, accidentally released to the public instead of staying internal to the company, talked about Amazon's strength with SOA.  It's a great read so check it out, but the basics of Bezos' email are, as quoted from the post:

> 1) All teams will henceforth expose their data and functionality through service interfaces.

> 2) Teams must communicate with each other through these interfaces.

> 3) There will be no other form of interprocess communication allowed: no direct linking, no direct reads of another team's data store, no shared-memory model, no back-doors whatsoever. The only communication allowed is via service interface calls over the network.

> 4) It doesn't matter what technology they use. HTTP, Corba, Pubsub, custom protocols -- doesn't matter. Bezos doesn't care.

> 5) All service interfaces, without exception, must be designed from the ground up to be externalizable. That is to say, the team must plan and design to be able to expose the interface to developers in the outside world. No exceptions.

> 6) Anyone who doesn't do this will be fired.

SOA is a big deal.  There are certainly a lot of issues that crop up when you're using it -- see [this post on Amazon's "lessons learned"](http://apievangelist.com/2012/01/12/the-secret-to-amazons-success-internal-apis/) -- but it ultimately has a lot of benefit.

You probably won't be worrying too much about SOA while building "toy" applications for yourself but it will certainly come up if you find yourself working at a tech company and it's a good principle to become familiar with.

### Your Assignment

1. Read the [Rails Guide on Controllers](http://guides.rubyonrails.org/action_controller_overview.html) section 7 to learn about rendering JSON and XML.
2. They are not required viewing (because they get a bit deeper than we're scoped for), but if you're interested, go check out the Railscasts in the Additional Resources section at the bottom of this lesson for more API goodness.

### Conclusion

We'll get more into using your application as an API during the course on Javascript.  In that course, you'll build some full stack apps that use Javascript AJAX calls to smooth out the user experience, which basically involves asking your Rails app for some XML or JSON data instead of a full HTML page.  Then you'll get to build some single page Javascript apps which rely on the API provided by your Rails app for all the necessary database data but otherwise completely run the show on the front end.

The best way to really figure out APIs is to build them and interface with them, so we'll focus on that in the projects.

In the next lesson, we'll cover working with other people's APIs, which can add all kinds of firepower to your own application.

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* Watch [this free Railscast on making your App into an API](http://railscasts.com/episodes/348-the-rails-api-gem)
* Watch [this free Railscast on securing your API](http://railscasts.com/episodes/352-securing-an-api)
* Watch [this free Railscast on versioning your API](http://railscasts.com/episodes/350-rest-api-versioning)
* [GoRails #162 Our First API](https://www.gorails.com/episodes/our-first-api)
* [Building a public-facing API using view templates instead of `#to_json`](http://blog.codepath.com/2011/05/16/if-youre-using-to_json-youre-doing-it-wrong/)
* [`to_json` or `as_json` by Jonathan Julian](http://jonathanjulian.com/2010/04/rails-to_json-or-as_json/) gives specific examples of digging into the `as_json` method.
* [Service Oriented Architecture Explained](https://www.youtube.com/watch?v=7s_S5Hkm7z0)
