### Project: Sending Welcome Emails

Setting up a mailer is a relatively straightforward task. It's very similar to building a new controller and views.  Once you've made a couple, it should come naturally.

### Assignment

You'll be dusting off your [Flight Booker project](/courses/ruby-on-rails/lessons/building-advanced-forms) (or one of the other projects that has users registering) and having it send out a "You have booked your ticket" email to all Passengers when they are created as part of the booking process.

<div class="lesson-content__panel" markdown="1">
1. Locate and load up the project file.
2. Do some pushups and jumping jacks.  You've been spending a bit too much time at the computer lately.
3. Generate your new mailer with `$ rails generate mailer PassengerMailer`.
4. Install the [`letter_opener` gem (see docs here)](https://github.com/ryanb/letter_opener) to open your emails in the browser instead of sending them in the development environment.
5. Follow through the steps listed in the [Rails Guide](http://guides.rubyonrails.org/action_mailer_basics.html) to create the action to send the "thank you" email.
6. Build both a `.html.erb` and `.text.erb` version of your thank you ticket email.
7. Test that the email sends by creating a new flight booking (`letter_opener` should open it in the browser for you if you've set it up properly).
8. Try out one other trick -- call the mailer directly from the Rails Console using something like:

   ~~~ruby
   > PassengerMailer.thank_you_email(Passenger.first).deliver_now!
   ~~~
9. Extra Credit: Deploy it to Heroku and try it out.  If you deploy to Heroku, there will be a bit of additional setup to get the [SendGrid add-on (see docs)](https://devcenter.heroku.com/articles/sendgrid) and make sure your configuration is set up properly.  The docs describe how to get that up and going.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [`letter_opener` docs](https://github.com/ryanb/letter_opener)
* [Setting up email: Rails, Heroku, SendGrid, Figaro](http://howilearnedrails.wordpress.com/2014/02/25/setting-up-email-in-a-rails-4-app-with-action-mailer-in-development-and-sendgrid-in-production-using-heroku/comment-page-1/#comment-79)
