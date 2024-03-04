### Project: Sending confirmation emails

Setting up a mailer is a relatively straightforward task. It's very similar to building a new controller and views.  Once you've made a couple, it should come naturally.

### Assignment

You'll be dusting off your [Flight Booker project](/lessons/ruby-on-rails-flight-booker) and having it send out a "You have booked your ticket" confirmation email to all Passengers when they are created as part of the booking process. Make sure to send out one email to each Passenger in the Booking, not just one for the whole Booking. (Alternatively, you can use one of your other projects, as long as it has users registering.)

<div class="lesson-content__panel" markdown="1">
1. Locate and load up the project file.
2. Do some pushups and jumping jacks.  You've been spending a bit too much time at the computer lately.
3. Generate your new mailer with `$ rails generate mailer PassengerMailer`.
4. Install the [`letter_opener` gem (see docs here)](https://github.com/ryanb/letter_opener) to open your emails in the browser instead of sending them in the development environment.
5. Follow through the steps listed in the [Rails Guide](http://guides.rubyonrails.org/action_mailer_basics.html) to create the action to send the confirmation email.
6. Build both an `.html.erb` and `.text.erb` version of your ticket confirmation email.
7. Test that the email sends by creating a new flight booking (`letter_opener` should open it in the browser for you if you've set it up properly).
8. Try out one other trick -- call the mailer directly from the Rails Console using something like:

   ~~~ruby
   > PassengerMailer.confirmation_email(Passenger.first).deliver_now!
   ~~~
9. Extra Credit: Deploy it to a hosting provider and try it out. There will be a bit of additional setup to get something an email provider like [SendGrid](https://sendgrid.com/) working and sending emails in production for you.

(One heads up: in order to use an email provider you will probably have to give your credit card information, they do this to deter spammers. You don't have to pay for the service, but you do have to give your information.)
</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [`letter_opener` docs](https://github.com/ryanb/letter_opener)
- [Setting up email: Rails, Heroku, SendGrid, Figaro](http://howilearnedrails.wordpress.com/2014/02/25/setting-up-email-in-a-rails-4-app-with-action-mailer-in-development-and-sendgrid-in-production-using-heroku/comment-page-1/#comment-79)
