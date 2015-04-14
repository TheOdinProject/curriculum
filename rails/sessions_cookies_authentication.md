# Sessions, Cookies and Authentication

## Introduction

"Sessions" are the idea that your user's state is somehow preserved when he/she clicks from one page to the next.  Rememeber, HTTP is stateless, so it's up to either the browser or your application to "remember" what needs to be remembered.  

In this lesson you'll learn about sessions, browser cookies, and how authentication is built in Rails.  We'll cover both home-grown authentication and the most commonly used authentication gem, Devise.

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* What is a session?
* How is the `session` "hash" different from the `cookies` "hash"?
* What is the `flash` "hash" used for?
* When would you need to use `flash.now` instead of `flash`?
* What are controller filters and why are they useful?
* How do you run a controller filter for just a specific few actions?
* What's the difference between authentication and authorization?
* Why is `#has_secure_password` a handy method?
* What is the basic overview of how to authenticate a user with that method?
* What additional steps (on a high level) are needed to actually "remember" a user after they've closed the browser?
* What is the Devise gem and why is it useful?

## Cookies, Sessions, and Flashes

Cookies, Sessions and Flashes are three special objects that Rails 4 gives you which each behave a lot like hashes. They are used to persist data between requests, whether until just the next request, until the browser is closed, or until a specified expiration has been reached.  In addition to different temporal concerns, they each solve slightly different use cases, covered below.

### Cookies

Cookies are key-value data pairs that are stored in the user's browser until they reach their specified expiration date.  They can be used for pretty much anything, most commonly to "bookmark" the user's place in a web page if she gets disconnected or to store simple site display preferences.  You could also store shopping cart information or even passwords but that would be a bad idea -- you shouldn't store anything in regular browser cookies that needs to either be secure or persisted across browser sessions.  It's too easy for users to clear their cache and/or steal/manipulate unsecured cookies.

To work with cookies, Rails gives you access to a special hash called `cookies`, where each key-value pair is stored as a separate cookie on the user's browser.  If you were to save `cookies[:hair-color] = "blonde"`, you'd be able to pull up your browser's developer tools and see a cookie on the user's browser that has a key of `hair-color` and a value of `blonde`.  Delete it using `cookies.delete(:hair-color)`.  

With each new request to your server, the browser will send along all the cookies and you can access them in your controllers and views like a normal hash.  You can also set their expiration dates, for example using syntax like `cookies[:name] = { value: "cookies YUM", expires: Time.now + 3600}`.  

### Sessions

Think about how websites keep track of how a user is logged in when the page reloads.  HTTP requests are stateless so how can you tell that a given request actually came from that particular user who is logged in?  This is why cookies are important -- they allow you to keep track of your user from one request to another until the cookie expires.

A special case is when you want to keep track of data in the user's "session", which represents all the stuff your user does while you've chosen to "remember" her, typically until the browser window is closed.  In that case, every page she visits until the browser is closed will be part of the same session.

To identify a user's session information, Rails stores a special secure and tamper-proof cookie on the user's browser that contains their entire session hash (look for it in your developer tools, usually under the "Resources" section) and it expires when the browser is closed.  Whenever the user makes a request to your application, that request will also automatically include that session cookie (along with the other cookies) and you can use it to keep track of her logged-in state. This may all seem abstract now, but you'll get a chance to see it in action shortly.

Rails gives you access to the `session` hash in an almost identical way to the above-mentioned `cookies` hash.  Use the `session` variable in your views or controllers like so:

```language-ruby
    # app/controllers/users_controller.rb
    ...
    # Set a session value
    session[:current_user_id] = user.id

    # Access a session value
    some_other_variable_value = session[:other_variable_key]

    # Reset a session key
    session[:key_to_be_reset] = nil

    # Reset the entire session
    reset_session
    ...
```

Why would you need both cookies and sessions?  They are similar but not the same.  `session` is an entire hash that gets put in the secure session cookie that expires when the user closes the browser.  If you look in your developer tools, the "expiration" of that cookie is "session".  Each value in the `cookies` hash gets stored as an individual cookie.

So cookies and sessions are sort of like temporary free database tables for you to use that are unique to a given user and will last until you either manually delete them, they have reached their expiration date, or the session is ended (depending on what you specified).  

**A Few Additional Notes on Sessions and Cookies**

* `session` and `cookies` aren't really hashes, Rails just pretends they are so it's easy for you to work with them.  You can still consider them as hashes just because they act very similarly to hashes.
* You are size-limited in terms of how much you can store inside a session hash or browser cookie (~4kb).  It is sufficient for any "normal" usage, but don't go pretending either of these are actually substitutes for a database.

### Flashes

You've already seen and used the `flash` hash by now, but we'll cover it again from the perspective of understanding sessions.  `flash` is a special hash (okay, a method that acts like a hash) that persists only from one request to the next.  You can think of it as a `session` hash that self destructs after it's opened.  It's commonly used to send messages from the controller to the view so the user can see success and failure messages after submitting forms.  

If you want to pop up "Thanks for signing up!" on the user's browser after running the `#create` action (which usually uses `redirect_to` to send the user to a totally new page when successful), how do you send that success message?  You can't use an instance variable because the redirect caused the browser to issue a brand new HTTP request and so all instance variables were lost.  

The flash is there to save the day!  Just store `flash[:success]` (or whatever you'd like it called) and it will be available to your view on the next new request.  As soon as the view accesses the hash, Rails erases the data so you don't have it show up every time the user hits a new page.  So clean, so convenient.

What about cases where the user can't sign up because of failed validations?  In this case, the typical `#create` action would just `render` the `#new` action using the existing instance variables.  Since it's not a totally new request, you'll want to have your error message available immediately.  That's why there's the handy `flash.now` hash, e.g. `flash.now[:error] = "Fix your submission!"`.  Just like the regular flash, this one self destructs automatically after opening.

You still have to write view code to display the flash messages.  It's common to write a short view helper that will pin any available flash message(s) to the top of the browser.  You might also add a class to the message which will allow you to write some custom CSS, for instance turning `:success` messages green and `:error` messages red.

```language-ruby
    # app/views/layouts/application.html.erb
    ...
    <% flash.each do |name, message| %>
      <div class="<%= name %>"><%= message %></div>
    <% end %>
```

## Controller Filters

Before we talk about authentication, we need to cover controller filters.  The idea of these filters is to run some code in your controller at very specific times, for instance before any other code has been run.  That's important because, if a user is requesting to run an action they haven't been authorized for, you need to nip that request in the bud and send back the appropriate error/redirect before they're able to do anything else.  You're basically "filtering out" unauthorized requests.

We do this through the use of a "before filter", which takes the name of the method we want to run:

```language-ruby
    # app/controllers/users_controller
    before_action :require_login
    ...
    private
    def require_login
      # do stuff to check if user is logged in
    end
```

The `before_action` method takes the symbol of the method to run before anything else gets run in the controller.  If it returns `false` or `nil`, the request will not succeed.

You can specify to only apply the filter for specific actions by specifying the `only` option, e.g. `before_action :require_login, only: [:edit, :update]`.  The opposite applies by using the `:except` option... it will run for all actions except those specified.  

You'll want to hide your filter methods behind the `private` designation so they can only be used by that controller.

Finally, filters are inherited so if you'd like a filter to apply to absolutely every controller action, put it in your `app/controllers/application_controller.rb` file.

## Authentication

The whole point of authentication is to make sure that whoever is requesting to run an action is actually allowed to do so.  The standard way of managing this is through logging in your user via a sign in form.  Once the user is logged in, you keep track of that user using the session until the user logs out.

A related concept is authorization.  Yes, you may be signed in, but are you actually authorized to access what you're trying to access?  The typical example is the difference between a regular user and an admin user.  They both authenticate with the system but only the admin is authorized to make changes to certain things.

Authentication and authorization go hand in hand -- you first authenticate someone so you know who they are and can check if they're authorized to view a page or perform an action.  When you build your app, you'll have a system of authentication to get the user signed in and to verify the user is who he says he is.  You authorize the user to do certain things (like delete stuff) based on which methods are protected by controller filters that require signin or elevated permissions (e.g. admin status).

### Basic and Digest Authentication

If you're looking for a very casual and insecure way of authenticating people, HTTP Basic authentication can be used.  We won't cover the details here, but it basically involves submitting a username and password to a simple form and sending it (unencrypted) across the network.  You use the `#http_basic_authenticate_with` method to do so (see the reading for examples) and to restrict access to certain controllers without it.

For a slightly more secure (over HTTP) authentication system, use HTTP Digest Authentication.  We'll again not cover it here.  It relies on a `#before_action` running a method which calls upon `#authenticate_or_request_with_http_digest`, which takes a block that should return the "correct" password that should have been provided.

The problem with both of these is that they hard code user names and passwords in your controller (or somewhere), so it's really just a band-aid solution.

### Rolling Your Own Auth

If you want user logins, you'll need to go through a few extra steps.  We won't cover them explicitly here because you'll get a chance to do them in the project.  A few principles are useful to know going in, though.  The following stuff may seem a bit abrupt and devoid of examples, but it's really just a preview of what you'll be doing shortly in the project.

First, we don't store passwords in plain text in the database.  That's just asking for trouble (how many news stories have you seen about major sites getting hacked and passwords being exposed in plain text?).  Instead, you'll store an encrypted "password digest" version of the password.  

When a user submits their password via the login form, instead of comparing it directly with a plaintext version of that password, you actually convert the submitted password into digest form.  You'll then compare that new digest with the digest you'd previously stored from the user. If they match, you've got yourself a logged in user.

This is much better because, if you remember from the previous [lesson on security in Web Development 101](/web-development-101/security-ssl-and-best-practices), digests are one-way encryption.  You can easily create a digest from a password string, but it's extremely difficult to decrypt the digest and retrieve the original password.  The most effective way to crack a bunch of digests is just to make a giant list of possible passwords, turn them into digests, and see if those digests match the one you're trying to crack (i.e. guess-and-check on a massive scale).  

Rails doesn't make you do everything yourself.  It has a method called `#has_secure_password` which you just drop into your User model and it will add a lot of the functionality you're looking for.  To work with that handy method, you basically set up your User model to handle accepting `password` and `password_confirmation` attributes but you won't actually persist those to the database.  `has_secure_password` intercepts those values and converts them into the password digest for you.

To initialize a new user session (when your user signs in), you'll need to create a new controller (usually `sessions_controller.rb`) and the corresponding routes for `:new`, `:create` and `:destroy`.  If the user passes the correct credentials (which we can check using the `#authenticate` method), you'll use the `session` variable to store their ID, which you can use to validate that they are who they say they are.  This is a simple way of authenticating the user that uses Rails' existing session infrastructure, but only lasts as long as the session does.

If your user wants to be "remembered" (you've probably seen the "remember me" checkbox plenty of times on login forms), you need a way to remember them for longer than just the length of the browser session.  To do this, you'll need to create another column in your Users table for an encrypted `remember_token` (or whatever you'd like to call it).  You'll use that to store a random string for that user that will be used in the future to identify him/her.  

You will drop the unencrypted token as a permanent cookie (using `cookies.permanent[:remember_token]`) into the user's browser.  That cookie will be submitted with each new request, so you can check with the encrypted version in the database to see who that user is whenever they make a request.  This is basically a more explicit and permanent version of what Rails is doing with sessions.  It's best practice to reset the token on each new signin if the user signs out.

It's usually good to make some helper methods for yourself to cover common behavior like signing in a user, checking if a user is signed in, and comparing the currently signed in user with another user (useful if the current user is looking at another user's page and shouldn't see links to "edit" it).  These things will make your life much easier since you can reuse them in your controller filters or your views or even your tests.

A generic step-by-step overview:

1. Add a column to your Users table to contain the user's `password_digest`.
2. When the user signs up, turn the password they submitted into digest form and then store THAT in the new database column by adding the `has_secure_password` method to your User model.
4. Don't forget any necessary validations for password and password confirmation length.
6. Build a sessions controller (and corresponding routes) and use the `#authenticate` method to sign in the user when the user has submitted the proper credentials using the signin form.
6. Allow the user to be remembered by creating a `remember_token` column in the Users table and saving that token as a permanent cookie in the user's browser.  Reset on each new signin.
7. On each page load that requires authentication (and using a `#before_action` in the appropriate controller(s)), first check the user's cookie `remember_token` against the database to see if he's already signed in.  If not, redirect to the signin page.
8. Make helper methods as necessary to let you do things like easily determine if a user is signed in or compare another user to the currently signed in user.
3. Profit.


## Devise

Devise is a gem which has been built to handle all this stuff for you.  It may be tempting to immediately dive into it, but that's not a good idea for beginners.  It's first of all quite important to understand the basic steps of authentication.  Devise can also get fairly complex if you start running into problems or nonstandard use cases.  It's more useful for intermediate+ users of Rails than beginners.

That said, you'll end up using it on most of your projects once you've mastered rolling your own authentication.  It's ultimately better than rolling your own auth because they've covered a lot of the edge cases and security loopholes that you might not think about.  Devise lets you interface with more advanced authentication systems for talking to APIs like OAuth.  So it's quite useful down the road.

In a short word, Devise prepackages for you a bunch of signin and signup forms and methods to help implement them.  It's made up of 10 modules (and you can choose which ones you want to use).  You install the `devise` gem and run the installer to drop their files into your application.  You'll also need to run a database migration to add their additional fields to your Users table.

Configuration will be dependent on your use case.  Do you want to make the user confirm their signup using an email (the `Confirmable` module)?  Do you want to allow the user to reset his password (the `Recoverable` module)?  

It's beyond the scope of this lesson to teach Devise but you'll certainly be using it by the end of the course.  The trick is to read the documentation.  They've got a fairly impressive set of docs available [on Github](https://github.com/plataformatec/devise).  The point of showing it here is for you to see it, read it, and keep it in the back of your head until you actually use it.

## Your Assignment

1. Read [Rails Guides on Controllers](http://guides.rubyonrails.org/action_controller_overview.html) chapters 5-6.  Don't worry too much about the details of `session_store` configurations in 5.1 right now.
2. Read [Rails Guides on Controllers](http://guides.rubyonrails.org/action_controller_overview.html#filters) chapter 8 to understand controller filters.
3. Read [Rails guides on Controllers](http://guides.rubyonrails.org/action_controller_overview.html#http-authentications) chapter 11 to understand more about authentication.
4. Glance over the [Devise Documentation](https://github.com/plataformatec/devise).  Read about how to install it in your Rails App and what the different modules do.  You don't need to use Devise just yet, so this is more of a reconnaissance mission for later.

## Conclusion

Authentication can appear to be a fairly complicated topic -- there are a lot of moving parts.  At it's core, though, you're just checking whether the person making a request is actually a signed in user who has the permissions to do so, all by using browser cookies in some form or another.  

This lesson should have given you some appreciation for how complicated login systems can potentially get but it should also have removed the veil from the websites you've visited countless times.  Auth isn't rocket science and you'll shortly be building it into your own applications.


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* Authentication in Rails 3.1 from [Railscasts](http://railscasts.com/episodes/270-authentication-in-rails-3-1)... better than I can explain it.
* [Cookies and Sessions in Rails 4 from pothibo.com](http://pothibo.com/2013/09/sessions-and-cookies-in-ruby-on-rails/)
* [All About Cookies (.org)](http://www.allaboutcookies.org/)
