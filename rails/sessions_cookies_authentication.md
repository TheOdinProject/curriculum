# Sessions, Cookies and Authentication

## Introduction

"Sessions" are the idea that your user's state is somehow preserved when he/she clicks from one page to the next.  Rememeber, HTTP is stateless, so it's up to either the browser or your application to "remember" what needs to be remembered.  

In this lesson you'll learn about sessions, browser cookies, and how authentication is built in Rails.  We'll cover both home-grown authentication and the most commonly used authentication gem, Devise.

## Sessions and Cookies

The most common use for sessions is to manage logins.  You don't want a user to have to login on every page!  So you need some way to test whether the user who made the latest request is actually logged in or not.  If this seems a bit abstract, it will fall into place when you actually implement some authentication of your own.

A "Session" represents all the stuff your user does while you've chosen to "remember" him.  So every page he visits while you choose to remember him (e.g. all day today) will be part of the same session.  The key question is, if HTTP requests are stateless, how do you match a given request to a specific user?  Rails commonly uses a cookie to help achieve this.

Cookies are key-value data pairs that are stored in the user's browser.  They can be used for pretty much anything... you could store shopping cart information, user preferences, even passwords for verification.  The only problem is that all of these are terrible ideas.  You shouldn't store anything in the browser that needs to either be secure or persisted across browser sessions.  It's too easy for users to clear their cache and/or steal/manipulate cookies.  But they are commonly used to identify your session.

Rails will store a unique cookie value on the user's browser that represents their session token.  Whenever the user makes a request to your application, that request will also automatically include their session token.  Your application checks that token against an internal database of tokens to match the request up with your user.  Now you know it's Admin Andy trying to make the request and not Hacker Hugo so you can set permissions accordingly.

Rails gives you access to both a `session` hash and a `cookies` hash.  These are similar but not the same.  `session` is a hash that gets kept on the **server** side by Rails, sort of like a free database table for you to use that's unique to a given user.  You can store all kinds of stuff in session, and Rails will do the work of matching that stored data with the request's user.  Sessions don't need to come from users who are actually "signed up" for your service... anyone who visits your site will be given the special session token and you'll be able to store things for them.  

Access the `session` variable in your views or controllers like a hash:

    # app/controllers/users_controller.rb
    ...
    session[:current_user_id] = user.id
    ...

You can now access that variable in any other controller actions that user might trigger as if it were a normal hash, by doing `session[:current_user_id]`.  Reset the session by setting the key to `nil` or reset the whole session for that user with `reset_session`.  

`cookies` are a **client side** store of information.  You use `cookies` the same way as the `session` variable, but know that it's much less secure because the entire batch of cookie data is being sent from the browser by the user (instead of sessions, which only rely on a single encrypted token being sent by the user).

Note that you are size-limited in terms of how much you can store inside a session hash or browser cookie.  It is sufficient for any "normal" usage, but don't go pretending either of these are substitues for a database.

### Flash

You've already seen and used the `flash` hash by now, but we'll cover it again from the perspective of understanding sessions.  `flash` a special hash (okay, a method that acts like a hash) that persists only from one request to the next.  You can think of it as a `session` hash that self destructs after it's opened.  It's commonly used from the controller to show things like success and failure messages.  

If you want to pop up "Thanks for signing up!" on the user's browser after running the `#create` action (which usually uses `redirect_to` to send the user to a totally new page), how do you send that success message?  You can't use an instance variable because the redirect caused the browser to issue a brand new HTTP request and so all instance variables were lost.  

The flash is there to save the day!  Just store `flash[:success]` (or whatever you'd like it called) and it will be available to your view on the next new request.  As soon as the view accesses the hash, Rails erases the data so you don't have it show up every time the user hits a new page.  So clean, so convenient.

What about cases where the user can't sign up because of failed validations?  In this case, the typicall `#create` action would just `render` the `#new` action using the existing instance variables.  Since it's not a totally new request, you'll want to have your error message available immediately.  That's why there's the handy `flash.now` hash, e.g. `flash.now[:error] = "Fix your submission!"`.  Just like the regular flash, this one self destructs automatically after opening.

You still have to write view code to display the flash messages.  It's common to write a short view helper that will pin any available flash message(s) to the top of the browser.  You might also add a class to the message which will allow you to write some custom CSS, for instance turning `:success` messages green and `:error` messages red.

    # app/views/layouts/application.html.erb
    ...
    <% flash.each do |name, message| %>
      <div class="<%= name %>"><%= message %></div>
    <% end %>

## Controller Filters

before, application controller vs individual ones, custom filters, protecting

## Authentication

very basic roll-your-own authentication (covered by Hartl!)

## Devise

very basic devise usage (read the gem docs)

## Your Assignment

1. Read [Rails Guides on Controllers](http://guides.rubyonrails.org/action_controller_overview.html) chapters 5-6.  Don't worry too much about the details of `session_store` configurations in 5.1 right now.

## Conclusion

## Additional Resources