# Project: Ruby on Rails Mailers
<!-- *Estimated Time: 1-2 hrs* -->

*Don't forget to use Git to save your projects!*

## Project: Sending Welcome Emails

Setting up a mailer is a relatively straightforward task. It's very similar to building a new controller and views.  Once you've made a couple, it should come naturally.

### Your Task

You'll be dusting off your [Flight Booker project](/ruby-on-rails/building-advanced-forms) (or one of the other projects that has users registering) and having it send out a "You have booked your ticket" email to all Passengers when they are created as part of the booking process.

1. Locate and load up the project file.  
2. Do some pushups and jumping jacks.  You've been spending a bit too much time at the computer lately.
2. Generate your new mailer with `$ rails generate mailer PassengerMailer`
3. Install the [`letter_opener` gem (see docs here)](https://github.com/ryanb/letter_opener) to open your emails in the browser instead of sending them in the development environment.
3. Follow through the steps listed in the [Rails Guide](http://guides.rubyonrails.org/action_mailer_basics.html) to create the action to send the "thank you" email.
4. Build both a `.html.erb` and `.text.erb` version of your thank you ticket email.
5. Test that the email sends by creating a new flight booking (`letter_opener` should open it in the browser for you if you've set it up properly)
6. Try out one other trick -- call the mailer directly from the Rails Console using something like `> PassengerMailer.thank_you_email(Passenger.first).deliver!`.
7. Extra Credit: Deploy it to Heroku and try it out.  If you deploy to Heroku, there will be a bit of additional setup to get the [SendGrid add-on (see docs)](https://devcenter.heroku.com/articles/sendgrid) and make sure your configuration is set up properly.  The docs describe how to get that up and going.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [jamie's solution](https://github.com/Jberczel/Flight_Booker) | [View in browser](http://flight-booker.herokuapp.com/)
* [Donald's solution](https://github.com/donaldali/odin-flight-booker) | [View in browser](http://dna-flight-booker.herokuapp.com/)
* [Marina Sergeyeva's solution](https://github.com/imousterian/FlightBooker) | [View in browser](https://one-way-ticket.herokuapp.com/)
* [Aleksandar's solution](https://github.com/Rodic/private-events)
* [Dominik Stodolny's solution](https://github.com/dstodolny/odin-flight-booker)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/flight_booker) | [View in browser](https://odin-booker.herokuapp.com/)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_flight_booker) 
* Add your solution above this line!

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* [`letter_opener` docs](https://github.com/ryanb/letter_opener)
* [Creating a Mailer in Rails 3](http://railscasts.com/episodes/206-action-mailer-in-rails-3) (should still work in Rails 4).
* [Setting up email: Rails, Heroku, SendGrid, Figaro](http://howilearnedrails.wordpress.com/2014/02/25/setting-up-email-in-a-rails-4-app-with-action-mailer-in-development-and-sendgrid-in-production-using-heroku/comment-page-1/#comment-79)

