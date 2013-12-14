# Project: Ruby on Rails Mailers
*Estimated Time: 1-2 hrs*

*Don't forget to use Git to save your projects!*

## Project: Sending Welcome Emails

Mailers are relatively straightforward tasks. It's very similar to building a new controller and views.  Once you've made a couple, it should come naturally.

### Your Task

1. Dust off your Flight Booker project (or one of the other projects that has users registering) and have it send out a "You have booked your ticket" email to all Passengers when they are created as part of the booking process.
2. Generate your new mailer with `$ rails generate mailer PassengerMailer`
3. Install the [`letter_opener` gem (see docs here)](https://github.com/ryanb/letter_opener) to open your emails in the browser instead of sending them in the development environment.
3. Follow through the steps listed in the [Rails Guide](http://guides.rubyonrails.org/action_mailer_basics.html) to create the action to send the thank you email.
4. Build both a `.html.erb` and `.text.erb` version of your thank you ticket email.
5. Test that the email sends by creating a new flight booking (`letter_opener` should open it in the browser for you if you've set it up properly)
6. Try out one other trick -- call the mailer directly from the Rails Console using something like `> PassengerMailer.thank_you_email(Passenger.first).deliver!`.
7. If you deploy to Heroku, there will be a bit of additional setup to get the [SendGrid add-on (see docs)](https://devcenter.heroku.com/articles/sendgrid) and make sure your configuration is set up properly.  The docs describe how to get that up and going.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* *Your Solution Here!*
* 

## Additional Resources

* [`letter_opener` docs](https://github.com/ryanb/letter_opener)
* [Creating a Mailer in Rails 3](http://railscasts.com/episodes/206-action-mailer-in-rails-3) (should still work in Rails 4).
* 

