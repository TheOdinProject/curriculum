### Project: Sending Welcome Emails

Setting up a mailer is a relatively straightforward task. It's very similar to building a new controller and views.  Once you've made a couple, it should come naturally.

### Assignment

You'll be dusting off your [Flight Booker project](/courses/ruby-on-rails/lessons/building-advanced-forms) (or one of the other projects that has users registering) and having it send out a "You have booked your ticket" email to all Passengers when they are created as part of the booking process.

<div class="lesson-content__panel" markdown="1">
1. Locate and load up the project file.
2. Do some pushups and jumping jacks.  You've been spending a bit too much time at the computer lately.
3. Generate your new mailer with `$ rails generate mailer PassengerMailer`
4. Install the [`letter_opener` gem (see docs here)](https://github.com/ryanb/letter_opener) to open your emails in the browser instead of sending them in the development environment.
5. Follow through the steps listed in the [Rails Guide](http://guides.rubyonrails.org/action_mailer_basics.html) to create the action to send the "thank you" email.
6. Build both a `.html.erb` and `.text.erb` version of your thank you ticket email.
7. Test that the email sends by creating a new flight booking (`letter_opener` should open it in the browser for you if you've set it up properly)
8. Try out one other trick -- call the mailer directly from the Rails Console using something like:

   ~~~ruby
   > PassengerMailer.thank_you_email(Passenger.first).deliver_now!
   ~~~
9. Extra Credit: Deploy it to Heroku and try it out.  If you deploy to Heroku, there will be a bit of additional setup to get the [SendGrid add-on (see docs)](https://devcenter.heroku.com/articles/sendgrid) and make sure your configuration is set up properly.  The docs describe how to get that up and going.
</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

* Add your solution below this line!
* [Jonathan Yiv's solution](https://github.com/JonathanYiv/flight-booker) - [View in Browser](https://fast-gorge-36383.herokuapp.com)
* [mindovermiles262's Solution](https://github.com/mindovermiles262/flight-booker)
* [leosoaivan's solution](https://github.com/leosoaivan/TOP_ror_flight_tracker) - [View in browser](https://immense-lowlands-59487.herokuapp.com/)
* [holdercp's solution](https://github.com/holdercp/odin-flight-booker) - [View in browser](https://damp-stream-21164.herokuapp.com/)
* [jfonz412's solution](https://github.com/jfonz412/flight-booker)
* [Orlando's solution](https://github.com/orlandodan14/Ruby-on-Rails/tree/master/Flight_booker)
* [Austin's solution](https://github.com/CouchofTomato/flight-booker)
* [jamie's solution](https://github.com/Jberczel/Flight_Booker) - [View in browser](http://flight-booker.herokuapp.com/)
* [Donald's solution](https://github.com/donaldali/odin-flight-booker) - [View in browser](http://dna-flight-booker.herokuapp.com/)
* [Marina Sergeyeva's solution](https://github.com/imousterian/FlightBooker) - [View in browser](https://one-way-ticket.herokuapp.com/)
* [Aleksandar's solution](https://github.com/rodic/private-events)
* [Dominik Stodolny's solution](https://github.com/dstodolny/odin-flight-booker)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/flight_booker) - [View in browser](https://odin-booker.herokuapp.com/)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_flight_booker)
* [Andrej Dragojevic's solution](https://github.com/antrix1/flight-booker) - [View in browser](https://blooming-mountain-4761.herokuapp.com/)
* [dchen71's solution](https://github.com/dchen71/odin-flight-booker) - [View in browser](http://true-syrup-4655.herokuapp.com/)
* [Matias Pan's solution](https://github.com/kriox26/flight-booker)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/flight-booker)
* [Hassan Mahmoud's solution](https://github.com/HassanTC/Flight-Booker)
* [Radi Totev's solution](https://github.com/raditotev/flight_booker)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/flight-booker)
* [Luke Walker's solution](https://github.com/ubershibs/odin-flight-booker) - [View in browser](https://secure-sands-80209.herokuapp.com)
* [srashidi's solution](https://github.com/srashidi/Advanced_Forms/tree/master/odin-flight-booker)
* [Scott Bobbitt's solution](https://github.com/sco-bo/flight-booker) - [View in Browser](https://radiant-fortress-17197.herokuapp.com/)
* [James Brooks's solution](https://github.com/jhbrooks/flight-booker) - [View in browser](https://rocky-earth-72202.herokuapp.com/)
* [Miguel Herrera's solution](https://github.com/migueloherrera/odin-flight-booker)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project12--sending-welcome-mails/odin-flight-booker)
* [Top's solution](https://github.com/TopOneOfTopOne/flight-booker) - [View in browser](https://flightbooker69.herokuapp.com/)
* [Matt Velez's solution](https://github.com/Timecrash/rails-projects/tree/master/flight-booker)
* [Fabricio Carrara's solution](https://github.com/fcarrara/flight-booker)
* [Norman Chan's solution](https://github.com/slowmanchan/Planner)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/odin_booker) - [View in Browser](https://guarded-atoll-24378.herokuapp.com/)
* [Amrr Bakry's solution](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/odin_flight_booker) - [View in Browser](https://shrouded-earth-72460.herokuapp.com/)
* [Oscar Y.'s solution](https://github.com/mysteryihs/odin-flight-booker)
* [Dylan's Solution](https://github.com/resputin/the_odin_project/tree/master/Rails/odin-flight-booker)
* [DV's Solution](https://github.com/dvislearning/odin-flight-booker)
* [Sophia Wu's Solution](https://github.com/SophiaLWu/flight-booker) - [View in Browser](https://infinite-fortress-13459.herokuapp.com/)
* [Daniel Aguilar's Solution](https://github.com/danaguilar/odin-flight-booker)

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [`letter_opener` docs](https://github.com/ryanb/letter_opener)
* [Setting up email: Rails, Heroku, SendGrid, Figaro](http://howilearnedrails.wordpress.com/2014/02/25/setting-up-email-in-a-rails-4-app-with-action-mailer-in-development-and-sendgrid-in-production-using-heroku/comment-page-1/#comment-79)
