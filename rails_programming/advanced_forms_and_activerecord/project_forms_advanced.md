### Project: Flight Booker

In this project, you'll get a chance to tackle some more advanced forms.  This is the kind of thing you'll have to work with when handling user orders for anything more complicated than an e-book.  In this case, we'll build the first three steps of a typical checkout process for booking a one-way flight:

A typical airline booking flow:

1. Enter desired dates / airports and click "Search"
2. Choose from among a list of eligible flights
3. Enter passenger information for all passengers
4. Enter billing information

Step 4 would be done via integration of something like [Paypal](http://coding.smashingmagazine.com/2011/09/05/getting-started-with-the-paypal-api/), via [a gem](https://github.com/nov/paypal-express) or [an SDK](http://www.tommyblue.it/2013/07/03/paypal-express-checkout-with-ruby-on-rails-and-paypal-sdk-merchant) or [Stripe](https://stripe.com/docs/checkout/guides/rails).

### Assignment

We'll be creating a one-way flight booker.  You'll get lots of practice populating and building dropdown menus, radio buttons, and nested submissions.  Let the fun begin!

This project will require you to seed your database, so use your `db/seeds.rb` file to write the code necessary to populate Airports and Flights.  One trick for toy apps like this (don't do it for production!) is to make your seeds file `::delete_all` items from each table in your database and then completely repopulate them.  That way, when you create a new model or change how you want your sample data set up, you can just update the `seeds.rb` file and rerun `$ rake db:seed`.

<div class="lesson-content__panel" markdown="1">
#### Setup

1. Think through the data architecture required to bring this to life.
2. Create a new Rails app, e.g. `odin-flight-booker`, and a new Git repo
3. Modify the README to explain what you're doing and link back to the project here.

#### Screen 1: Search

For the first screen, you'll need a dropdown that lists a possible "From" airport and a possible "To" airport. just assume all flights fly between SFO and NYC.  You'll need to set up a dropdown menu that contains all eligible flights.

This requires relatively vanilla forms that happen to be prepopulated with collections of data.  Working with dates will cover a bit of new ground for you.

1. Create an Airport model (which basically just needs an airport code like "SFO" or "NYC") and use the `db/seeds.rb` file to create several of them.
2. Create a Flight model (with the start and finish airport `id`s, start datetime, and flight duration).
3. Set up associations so you can ask `Flight.first.from_airport`, `Flight.first.to_airport` and get back Airport objects.  Same for `Airport.first.departing_flights` and `Airport.first.arriving_flights`, which should return a list of flight objects.
4. Seed your database with flights.
5. You will search and view results in the same page.  Set up your FlightsController and routes to make the Index page (`/flights`) the root route.
6. Create your search form on the `/flights` index page to submit using a GET (not POST) request back to the same URL.
7. The home page should contain four dropdown menus -- a list of FROM and TO airports, number of passengers (1-4), and a DATE dropdown for the flight date.  The DATE dropdown should only include dates that have existing flights.  Don't worry about restricting the contents of the FROM/TO dropdowns -- you'd normally use Javascript -- so just allow the user to select any airport.  See [this SO post on formatting date in dropdown lists](http://stackoverflow.com/questions/15720940/rails-format-date-in-drop-down-list-in-view), [this quickie SO post on selecting months/years](http://stackoverflow.com/questions/13001904/rails-drop-down-select-month-year), and the Rails [DateHelper API Docs](http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html) for some help with creating Date selects.

#### Screen 2: Pick a Flight

Once search results are returned, the user just needs to choose from among the eligible flights.

1. Once the user has submitted the form, your controller should detect the additional query parameters (e.g. from `/flights?from_code=SFO&to_code=NYC&date=20131215&num_tickets=2`) and should pull the flights which match that criteria from your database through smart querying model methods.
2. Send those flights back to your `app/views/flights/index.html.erb` view.  Make it so that the view will display the results below (if present).
3. Don't get rid of the search dropdowns -- keep the search form active at the top so the user can try running a new search.
4. The search results will need to be in their own form -- this time for selecting which of the flights the user would like to choose.  Each returned flight should render with a radio button next to it.  The user will select which flight to submit and move onto the next step.  The form should submit to the `#new` action of the BookingsController you're about to create using another GET method.  You'll need to include a hidden field that contains the number of passengers.

#### Screen 3: Passenger Information

Once the user has submitted their chosen flight, it's time to take their booking information.  You'll need a form to submit the Booking and also create a Passenger object for each passenger who needs a ticket.  Don't worry about creating a separate "Ticket" object, we'll assume the airline will issue those once the booking is verified.

1. Create and migrate the Booking model
2. Create and migrate the Passenger model (just keep the information simple -- name and email only)
3. Set up associations between Bookings, Passengers, and Flights.
4. Create a BookingsController and appropriate routes.
5. Set up your `#new` action, which should have received the flight ID and passenger number parameters, and use it to help render a form for a new booking which displays the currently chosen date, airports, flight ID and a set of fields to enter personal information for each passenger.  You'll want to create a new blank Passenger object in your controller for each passenger, and then use `#fields_for` in the view to set up the sub-forms.
6. Try submitting the form and check out the parameters in your server.
7. You'll need your `#create` action to create a new Booking (linking it to the appropriate Flight) but it will also need to accept the nested attributes for each of the Passenger objects and create a new Passenger from them.  Be mindful of whitelisting the nested parameters as well.
8. Go to the Booking model and implement the `#accepts_nested_attributes_for` method.  See the [Rails API](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html) for examples and [this SO post](http://stackoverflow.com/questions/18540679/rails-4-accepts-nested-attributes-for-and-mass-assignment) for another.
9. Once your form is successfully submitted, render the booking's `#show` page which displays the booking information (flight and passenger information).
10. Make sure your ticketing flow is working properly.  Good work!

</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

* Add your solution below this line!
* [amundskm's Solution](https://github.com/amundskm/odin-flight-booker)
* [Jason McKee's solution](https://github.com/jttmckee/odin-flight-booker) | [Live](https://safe-peak-87499.herokuapp.com)
* [Max Garber's solution](https://github.com/bubblebooy/odin-flight-booker)
* [Javier Machin's solution](https://github.com/Javier-Machin/flight-booker) - [Live](https://easy-flight.herokuapp.com/)
* [nmac's solution](https://github.com/nmacawile/fly-me-there) - [Heroku](http://protected-castle-72511.herokuapp.com)
* [brxck's solution](https://github.com/brxck/flight-booker) - [View in Browser](https://nameless-sierra-62923.herokuapp.com/)
* [Jmooree30's solution](https://github.com/jmooree30/flight-booker.git) - [View in Browser](https://powerful-wildwood-98145.herokuapp.com/)
* [theghall's solution](https://github.com/theghall/odin-flight-booker.git)
* [Clayton Sweeten's solution](https://github.com/cjsweeten101/odin-flight-booker)
* [Jonathan Yiv's solution](https://github.com/JonathanYiv/flight-booker) - [View in Browser](https://fast-gorge-36383.herokuapp.com)
* [mindovermiles262's solution](https://github.com/mindovermiles262/flight-booker) - [View in Browser](https://flight-booker-ad.herokuapp.com/)
* [leosoaivan's solution](https://github.com/leosoaivan/TOP_ror_flight_tracker) - [View in Browser](https://immense-lowlands-59487.herokuapp.com/)
* [yilmazgunalp`s solution](https://github.com/yilmazgunalp/flight_booker) - [View in Browser](https://sheltered-lowlands-87484.herokuapp.com/)
* [Joshua Wootonn`s solution](https://github.com/jose56wonton/flight-booker) - [View in Browser](https://flight-booker-jw.herokuapp.com/)
* [holdercp's solution](https://github.com/holdercp/odin-flight-booker) - [Live site](https://flight-booker-odin.herokuapp.com/)
* [Jfonz412's solution](https://github.com/jfonz412/flight-booker)
* [Orlando's solution](https://github.com/orlandodan14/Ruby-on-Rails/tree/master/Flight_booker)
* [CloudTemplar_'s solution](https://github.com/cloudtemplar/flight-booker) - [Live on Heroku!](https://protected-escarpment-37952.herokuapp.com/)
* [Jib's solution](https://github.com/NuclearMachine/odin_rails/tree/master/odin-flight-booker) - [Live website](https://sleepy-oasis-66283.herokuapp.com)
* [Sic's solution](https://github.com/sic-f/flight-booker) - [View in browser](http://flyt-booker.herokuapp.com)
* [Austin's solution](https://github.com/CouchofTomato/flight-booker)
* [spierer's solution](https://github.com/spierer/odin-advanced-forms)
* [jamie's solution](https://github.com/Jberczel/Flight_Booker) - [View in browser](http://flight-booker.herokuapp.com)
* [Donald's solution](https://github.com/donaldali/odin-flight-booker) - [View in browser](http://dna-flight-booker.herokuapp.com/)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/flight-booking-app) - [View in browser](http://flight-booking-app.herokuapp.com/)
* [Marina Sergeyeva's solution](https://github.com/imousterian/FlightBooker) - [View in browser](https://one-way-ticket.herokuapp.com/)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/flight-booker)
* [Vidul's solution](https://github.com/viparthasarathy/odin-flight-booker) - [View in browser](https://intense-retreat-7685.herokuapp.com/)
* [Dominik Stodolny's solution](https://github.com/dstodolny/odin-flight-booker)
* [Alex's solution](https://github.com/alexgh123/odin-flight-booker)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/flight_booker) - [view in browser](https://odin-booker.herokuapp.com/)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_flight_booker)
* [Andrej Dragojevic's solution](https://github.com/antrix1/flight-booker) - [View in browser](https://blooming-mountain-4761.herokuapp.com/)
* [dchen71's solution](https://github.com/dchen71/odin-flight-booker) - [View in browser](http://true-syrup-4655.herokuapp.com/)
* [Matias Pan's solution](https://github.com/kriox26/flight-booker) - [View in browser](https://vast-ridge-2462.herokuapp.com/)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/flight-booker)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/tom-flight-booker)
* [Hassan Mahmoud's solution](https://github.com/HassanTC/Flight-Booker)
* [Radi Totev's solution](https://github.com/raditotev/flight_booker)
* [Patrick Mallee's solution](https://github.com/patmallee/flight-booker)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/flight-booker)
* [Luke Walker's solution](https://github.com/ubershibs/rails_course/tree/master/odin-flight-booker)
* [srashidi's solution](https://github.com/srashidi/Advanced_Forms/tree/master/odin-flight-booker)
* [Scott Bobbitt's solution](https://github.com/sco-bo/flight-booker) - [View in Browser](https://radiant-fortress-17197.herokuapp.com/)
* [James Brooks's solution](https://github.com/jhbrooks/flight-booker) - [View in browser](https://rocky-earth-72202.herokuapp.com/)
* [Miguel Herrera's solution](https://github.com/migueloherrera/odin-flight-booker)
* [Matt Velez's solution](https://github.com/Timecrash/rails-projects/tree/master/flight-booker)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project10--odin-flight-booker/odin-flight-booker)
* [Stefan (Cyprium)'s solution](https://github.com/dev-cyprium/odin-flight-booker) - [View in browser](https://flight-booker-stefan.herokuapp.com/)
* [Fabricio Carrara's solution](https://github.com/fcarrara/flight-booker) - [View in browser](https://flight-booker-rails.herokuapp.com)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/odin_booker) - [View in browser](https://guarded-atoll-24378.herokuapp.com/)
* [Frank V's solution](https://github.com/fv42wid/flight)
* [chrisnorwood's solution](https://github.com/chrisnorwood/odin-flight-booker) - [View in browser](http://top-flight-booker.herokuapp.com/)
* [Oscar Y.'s solution](https://github.com/mysteryihs/odin-flight-booker)
* [Amrr Bakry's solution](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/odin_flight_booker) - [View in browser](https://shrouded-earth-72460.herokuapp.com/)
* [Cody Loyd's Solution](https://github.com/codyloyd/flight_booker) - [View in Browser](https://intense-peak-10624.herokuapp.com/)
* [Rhys B.'s Solution](https://github.com/105ron/flight_booker) - [View in Browser](https://secure-depths-25814.herokuapp.com)
* [David Chapman's Solution](https://github.com/davidchappy/flight_booker)
* [Dylan's Solution](https://github.com/resputin/the_odin_project/tree/master/Rails/odin-flight-booker)
* [Marcus' solution](https://github.com/nestcx/odin-flight-booker)
* [DV's Solution](https://github.com/dvislearning/odin-flight-booker) - [View in Browser](https://powerful-sierra-48857.herokuapp.com/)
* [Peter Mester's solution](https://github.com/peter665/FlightBooker) - [View in Browser](http://flight-booker-mester.herokuapp.com/)
* [Francisco Carlos's solution](https://github.com/fcarlosdev/the_odin_project/tree/master/odin-flight-booker)
* [Punnadittr's solution](https://github.com/punnadittr/flight-booker) - [View in Browser](https://frozen-everglades-39378.herokuapp.com/)
* [Areeba's solution](https://github.com/AREEBAISHTIAQ/flight-booker)
* [Agon's solution](https://github.com/AgonIdrizi/flight-booker) - [View in Browser](https://flight-booker-agon.herokuapp.com/)
* [Malaika's Solution](https://github.com/malaikaMI/AirFly)
* [Jamesredux's Solution](https://github.com/Jamesredux/flight-booker) - [View in Browser](https://redux-flights.herokuapp.com/)
* [bchalman's Solution](https://github.com/bchalman/odin-flight-booker)

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Rails API for nested attributes](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html)
