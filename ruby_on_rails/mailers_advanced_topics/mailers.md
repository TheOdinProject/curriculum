### Introduction

Email is under-appreciated in its complexity on many levels. You certainly won't think about it much until you need to actually bake it into your apps.  But what goes on behind the scenes, especially after hitting "send", is pretty impressive... lots of bouncing around the architecture of the internet, bypassing firewalls, and navigating SPAM filters.  Luckily all this can be handled by some specialty third party email providers.

The actual production of the email is what we'll cover here... i.e. how do you make that special "thanks for signing up, userX" email.  Creating and sending email is actually conceptually similar to rendering views and shipping them to the web browser, at least from your point of view as a Rails dev.  In this lesson we'll cover that process and you'll get a chance to send your own emails in the projects.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- What a mailer is.
- How mailers are similar to controllers or to models.
- Why you need both a text and an HTML version of your mailers.
- What an email provider is used for.
- What the `letter_opener` gem is used for.

### Brief Overview

To send email, Rails uses the `ActionMailer` gem (one of the 7 core gems that make it up).  A mailer acts similar to a model and controller baked into one.  You will create a new mailer just like you would with a new controller (`$ rails generate mailer SomeName`).  You'll then set up methods for each email that you might want it to send (e.g. welcome email, followup email, thanks for purchasing email...).  Sounds a lot like controller actions, eh?

In each method, you need to identify the key fields and any variables that will be used in the text of the email (like the user's name).  The actual email itself is just a view.  They live in the `app/views` folder along with the rest of them, though in a sub-folder named after the mailer.

One distinction between mailer views and "normal" views is that emails typically have two separate formats -- HTML and text. Most people will view the HTML version but some will have HTML disabled and so they will need the text version in order to see your email.  Having the two versions also helps you bypass SPAM filters.  You'll quickly find that many things you do regarding email have to do with getting past the dreaded SPAM filter.

So you set up one view called, for instance, `app/views/user_mailer/welcome_email.html.erb` and another called `app/views/user_mailer/welcome_email.text.erb`.  It is kind of annoying having to manage two different versions of the same email but such is the cost of accessibility and SPAM fighting.  Another thing you'll notice is that you can use ERB (or HAML etc) preprocessing on your emails too.  Just like any other view, it allows you to dynamically create content that includes things like your user's name or non-sensitive account information.  This is all based on which variables you pass the view from your mailer, just like passing a controller action's instance variables to a normal view.

Mailers are actually a two-step process -- first you build the email itself and then you call the `#deliver_now` (or `#deliver_now!`) method to actually send it.  One way that mailers are different from controllers is that you call them directly instead of working through the router.  When you want to call the welcome email, you will write `UserMailer.welcome_email(@user)`, which returns the email object.  Deliver it by calling the `#deliver_now` method on that object, for a total chain of: `UserMailer.welcome_email(@user).deliver_now`.

As long as your view files (the HTML and text) are named the same as your mailer methods, Rails will find everything okay and will send the email (with both the HTML and text parts) using whichever email provider you've chosen to use for sending it. The Rails Guide reading does a good job walking through the process, so you'll get a chance to see it in action there.

### Callbacks

Mailers allow you to use callbacks just like a normal controller, for instance the `after_action` callback.  They will run after the email is *generated*, not after it is *sent*, so you'll be able to modify parts of the email if you need to.  You get access to the instance variables of the mail instance, so you can use the `@user` variable as a part of your logic.

### Email Providers

In the reading you'll see how to send mail using your Gmail account, but if you're building a real application you'll obviously want something a bit more robust. There are several leading players in the space of sending your email for you. Their whole job is to handle getting your mail delivered and opened so you can focus on building your application.

[SendGrid](https://addons.heroku.com/sendgrid#1500000) is the provider used with this website for delivering welcome emails and the like and it's pretty straightforward on Heroku. See the [documentation here](https://devcenter.heroku.com/articles/sendgrid), as well as [SendGrid's own documentation](https://docs.sendgrid.com/for-developers/sending-email/rubyonrails), which includes instructions for how you should set up your `config/environment.rb` file to get ActionMailer to interface with them.  You will need to use environment variables (or the `figaro` gem) again to avoid hard coding your password and username.

Pricing for this, as most things, is free up until a certain usage tier. While you're building toy apps, it will do just fine. Other options are out there like [MailGun](https://www.mailgun.com/), [Mailchimp](https://mailchimp.com/) and [Postmark](https://postmarkapp.com/).

You'll get a chance to play with mailers in the projects.

### Letter Opener

One key thing to note is that you don't want to fire off a bunch of emails when you're testing your app in the development environment.  That's not just bad practice, it can make your users pretty unhappy and get you put on SPAM lists.  No bueno.  But you do want to make sure the email function is working properly.  Luckily, there's a simple solution which is quite useful.

The [Letter Opener gem (see docs)](https://github.com/ryanb/letter_opener), put in your `development` group of the Gemfile, will take your emails and display them in the web browser for you whenever they would otherwise be sent.  You just switch a config setting in your `config/environments/development.rb` file and you're good to go.  Sweet.

### Email Wisdom

* Email is SLOW! It can take 1-2 seconds per email to send, so don't make your main application do it when you're serving a whole bunch of them because then anyone trying to access it will be shut out.
* Make sure you use full URLs in any links in your mailer (so `_url` not `_path` helper methods), since the user will be opening the email and clicking the link at an external source.  In your `config/environments/production.rb` file you'll want to make sure to specify your website's host name using something like `config.action_mailer.default_url_options = { :host => 'yourapp.com' }`.  If it's not set, you may get an error message about your host or your links may look funny.
* The `#deliver!` method will throw an error on delivery failure whereas `#deliver` will return false (failing silently).
* When styling your email HTML, you won't have access to any stylesheets so you'll need to do all the styling either inline or using `<style>` tags.
* Attaching images to emails (like using logos in the HTML version) can be a bit of a pain.  See the reading.

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Read sections 1 and 2 of the [Rails Guide on ActionMailer](http://guides.rubyonrails.org/action_mailer_basics.html).
  2. Read [sections 3 and 4](https://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-callbacks) to learn about callbacks and helpers.
  3. Read [section 5.2](https://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-configuration-for-gmail), which covers sending mail with your Gmail.
  4. Skim [sections 6 and 7](https://guides.rubyonrails.org/action_mailer_basics.html#mailer-testing) on testing and intercepting emails.
</div>

### Conclusion

Sending email is just a slightly different way of using the same patterns you've already been using for controllers and views, so it should be pretty straightforward to pick up.  You'll have to navigate the usual batch of errors when trying out new things (often related to the configuration or naming your files properly), but it'll come to you quickly.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* [How to Create, Preview, and Send Email From Your Rails App](https://www.youtube.com/watch?v=9eFXEzOPRNs)

### Knowledge Check

* <a class='knowledge-check-link' href='#brief-overview'>How do you create a new mailer from the command line?</a>
* <a class='knowledge-check-link' href='#brief-overview'>Where do you store the actual email in your application?</a>
* <a class='knowledge-check-link' href='#brief-overview'>How do you send an email directly from the Rails console?</a>
* <a class='knowledge-check-link' href='#callbacks'>How do you use callbacks with mailers?</a>
* <a class='knowledge-check-link' href='#email-wisdom'>How do you write links in mailer views?</a>
* <a class='knowledge-check-link' href='#email-wisdom'>How do you style an HTML email?</a>
