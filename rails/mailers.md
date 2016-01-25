# Mailers

## Introduction

Email is underappreciated in its complexity on many levels.  I certainly didn't think about it much until I needed to actually bake it into my apps.  But what goes on behind the scenes, especially after hitting "send", is pretty impressive... lots of bouncing around the architecture of the internet, bypassing firewalls, and navigating SPAM filters.  Luckily all this can be handled by some specialty Heroku add-ons or other third parties.

The actual production of the email is what we'll cover here... i.e. how do you make that special "thanks for signing up, userX" email.  Creating and sending email is actually conceptually similar to rendering views and shipping them to the web browser, at least from your point of view as a Rails dev.  In this lesson we'll cover that process and you'll get a chance to send your own emails in the projects.

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* What is a mailer?
* How do you set up a new mailer from the command line?
* How are mailers similar to controllers?  To models?
* How do you pass instance variables from the mailer to the mailer view?
* Why do you need both a text and HTML version of your mails?
* How do you send an email directly from the Rails console?
* How can you take advantage of add-ons and third-party programs to send email?
* What is the `letter_opener` gem good for?
* Why can't you use `*_path` link helpers in mailer views?
* How do you style up a pretty looking HTML email?

## Brief Overview

To send email, Rails uses the `ActionMailer` gem (one of the 7 core gems that make it up).  A mailer acts similar to a model and controller baked into one.  You will create a new mailer just like you would with a new controller (`$ rails generate mailer SomeName`).  You'll then set up methods for each email that you might want it to send (e.g. welcome email, followup email, thanks for purchasing email...).  Sounds a lot like controller actions, eh?  

In each method, you need to identify the key fields and any variables that will be used in the text of the email (like the user's name).  The actual email itself is just a view.  They live in the `app/views` folder along with the rest of them, though in a sub-folder named after the mailer.

One distinction between mailer views and "normal" views is that emails typically have two separate formats -- HTML and text. Most people will view the HTML version but some will have HTML disabled and so they will need the text version in order to see your email.  Having the two versions also helps you bypass SPAM filters.  You'll quickly find that many things you do regarding email have to do with getting past the dreaded SPAM filter.  

So you set up one view called, for instance, `app/views/user_mailer/welcome_email.html.erb` and another called `app/views/user_mailer/welcome_email.text.erb`.  It is kind of annoying having to manage two different versions of the same email but such is the cost of accessibility and SPAM fighting.  Another thing you'll notice is that you can use ERB (or HAML etc) preprocessing on your emails too.  Just like any other view, it allows you to dynamically create content that includes things like your user's name or non-sensitive account information.  This is all based on which variables you pass the view from your mailer, just like passing a controller action's instance variables to a normal view.

Mailers are actually a two-step process -- first you build the email itself and then you call the `#deliver` (or `#deliver!`) method to actually send it.  One way that mailers are different from controllers is that you call them directly instead of working through the router.  When you want to call the welcome email, you will write `UserMailer.welcome_email(@user)`, which returns the email object.  Deliver it by calling the `#deliver` method on that object, for a total chain of: `UserMailer.welcome_email(@user).deliver`.

*Hint #deliver will be removed in Rails 5 and replaced with #deliver_now to deliver immediately or `#deliver_later` to deliver through Active Job.*

As long as your view files (the HTML and text) are named the same as your mailer methods, Rails will find everything okay and will send the email (with both the HTML and text parts) using whichever addon you've chosen to use for sending it.  The Rails Guide reading does a good job walking through the process, so you'll get a chance to see it in action there.

## Callbacks

Mailers allow you to use callbacks just like a normal controller, for instance the `after_action` callback.  They will run after the email is *generated*, not after it is *sent*, so you'll be able to modify parts of the email if you need to.  You get access to the instance variables of the mail instance, so you can use the `@user` variable as a part of your logic.

## Email Addons

In the reading you'll see how to send mail using your Gmail account, but if you're building a real application you'll obviously want something a bit more robust.  There are several leading players in the space of sending your email for you.  Their whole job is to handle getting your mail delivered and opened so you can focus on building your application.  They are usually available as add-ons to Heroku (like New Relic was, which we saw in the lesson on deployment), so all you need to do is properly configure them.

[SendGrid](https://addons.heroku.com/sendgrid#1500000) is the add-on used with this website for delivering welcome emails and the like and it's pretty straightforward.  See the [documentation here](https://devcenter.heroku.com/articles/sendgrid), which includes instructions for how you should set up your `config/environment.rb` file to get ActionMailer to interface with them.  You will need to use environment variables (or the `figaro` gem) again to avoid hard coding your password and username.

Pricing for this, as most things, is free up until a certain usage tier.  While you're building toy apps, it will do just fine.  Other options out there include [MailGun](https://addons.heroku.com/mailgun) and [PostMark](https://addons.heroku.com/postmark), all available in the email section of the [Heroku Addon Store](https://addons.heroku.com/#email-sms).

You'll get a chance to play with mailers and addons in the projects.

## Letter Opener

One key thing to note is that you don't want to fire off a bunch of emails when you're testing your app in the development environment.  That's not just bad practice, it can make your users pretty unhappy and get you put on SPAM lists.  No bueno.  But you do want to make sure the email function is working properly.  Luckily, there's a simple solution which is quite useful.

The [Letter Opener gem (see docs)](https://github.com/ryanb/letter_opener), put in your `development` group of the Gemfile, will take your emails and display them in the web browser for you whenever they would otherwise be sent.  You just switch a config setting in your `config/environments/development.rb` file and you're good to go.  Sweet.

## Email Wisdom

* Email is SLOW! It can take 1-2 seconds per email to send, so don't make your main application do it when you're serving a whole bunch of them because then anyone trying to access it will be shut out.  
* Make sure you use full URLs in any links in your mailer (so `_url` not `_path` helper methods), since the user will be opening the email and clicking the link at an external source.  In your `config/environments/production.rb` file you'll want to make sure to specify your website's host name using something like `config.action_mailer.default_url_options = { :host => 'yourapp.com' }`.  If it's not set, you may get an error message about your host or your links may look funny.
* The `#deliver!` method will throw an error on delivery failure whereas `#deliver` will return false (failing silently).
* When styling your email HTML, you won't have access to any stylesheets so you'll need to do all the styling either inline or using `<style>` tags.
* Attaching images to emails (like using logos in the HTML version) can be a bit of a pain.  See the reading.

## Your Assignment

1. Read the [Rails Guide on ActionMailer](http://guides.rubyonrails.org/action_mailer_basics.html) chapters 1 and 2.  
2. Skim the brief chapter 3 on receiving emails.  You'll be able to refer back to it if you need to.
3. Read chapter 4 and 5 to learn about callbacks and helpers.
4. Read chapter 6, which covers sending mail with your Gmail.  
5. Skim chapters 7-8 on testing and intercepting emails.

## Conclusion

Sending email is just a slightly different way of using the same patterns you've already been using for controllers and views, so it should be pretty straightforward to pick up.  You'll have to navigate the usual batch of errors when trying out new things (often related to the configuration or naming your files properly), but it'll come to you quickly.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* 
