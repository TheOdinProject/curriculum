### Project: Flight Booker

In this project, you'll get a chance to tackle some more advanced forms.  This is the kind of thing you'll have to work with when handling user orders for anything more complicated than an e-book.  In this case, we'll build the first three steps of a typical checkout process for booking a one-way flight:

A typical airline booking flow:

1.  Enter desired dates / airports and click "Search"
2.  Choose from among a list of available flights
3.  Enter passenger information for all passengers
4.  Enter billing information

Step 4 would be done via integration of something like [Paypal](http://coding.smashingmagazine.com/2011/09/05/getting-started-with-the-paypal-api/), via [a gem](https://github.com/nov/paypal-express) or [an SDK](https://www.tommyblue.it/2013/07/02/paypal-express-checkout-with-ruby-on-rails-and-paypal-sdk-merchant/) or [Stripe](https://stripe.com/docs/checkout/guides/rails).

### Assignment

We'll be creating a one-way flight booker.  You'll get lots of practice populating and building dropdown menus, radio buttons, and nested submissions.  Let the fun begin!

This project will require you to seed your database, so use your `db/seeds.rb` file to write the code necessary to populate Airports and Flights.  One trick for toy apps like this (don't do it for production!) is to make your seeds file `::delete_all` items from each table in your database and then completely repopulate them.  That way, when you create a new model or change how you want your sample data set up, you can just update the `seeds.rb` file and rerun `$ rake db:seed`.

<div class="lesson-content__panel" markdown="1">
#### Setup

1.  Think through the data architecture required to bring this to life.
2.  Create a new Rails app, e.g. `odin-flight-booker`, and a new Git repo
3.  Modify the README to explain what you're doing and link back to the project here.

#### Screen 1: Search

For the first screen, you will be creating 4 dropdown menus that will allow users to search for available flights -  departure airport, arrival airport, date, and number of passengers. This requires relatively vanilla forms that happen to be prepopulated with collections of data.  Working with dates will cover a bit of new ground for you.

1.  Create an Airport model (which basically just needs an airport code like "SFO" or "NYC") and use the `db/seeds.rb` file to create several airports.
2.  Create a Flight model (with the departure and arrival airport `id`s, start datetime and flight duration).
3.  Set up associations so you can ask `Flight.first.departure_airport`, `Flight.first.arrival_airport` and get back Airport objects. Same for `Airport.first.departing_flights` and `Airport.first.arriving_flights`, which should return a list of Flight objects.
4.  Seed your database with flights.
5.  You will search and view results in the same page.  Set up your FlightsController and routes to make the Index page (`/flights`) the root route.
6.  Create your search form on the `/flights` index page to submit using a GET (not POST) request back to the same URL.
7.  Add the four dropdown menus -- a list of departure airports, arrival airports, number of passengers (1-4), and a date dropdown for the flight date. The date dropdown should only include dates that have existing flights. Don't worry about restricting the contents of the airport dropdowns -- you'd normally use JavaScript -- so just allow the user to select any airport. See [this SO post on formatting date in dropdown lists](http://stackoverflow.com/questions/15720940/rails-format-date-in-drop-down-list-in-view), [this quickie SO post on selecting months/years](http://stackoverflow.com/questions/13001904/rails-drop-down-select-month-year) and the Rails [DateHelper API Docs](http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html) for some help with creating Date selects.

#### Screen 2: Pick a Flight

Once search results are returned, the user just needs to choose from among the available flights.

1.  Once the user has submitted the form, your controller should detect the additional query parameters (e.g. from `/flights?departure_code=SFO&arrival_code=NYC&date=20131215&num_tickets=2`) and should pull the flights which match that criteria from your database through smart querying model methods.
2.  Send those flights back to your `app/views/flights/index.html.erb` view.  Make it so that the view will display the results below (if present).
3.  Don't get rid of the search dropdowns -- keep the search form active at the top so the user can try running a new search.
4.  The search results will need to be in their own form -- this time for selecting which of the flights the user would like to choose.  Each returned flight should render with a radio button next to it.  The user will select which flight to submit and move onto the next step.  The form should submit to the `#new` action of the BookingsController you're about to create using another GET method.  You'll need to include a hidden field that contains the number of passengers.

#### Screen 3: Passenger Information

Once the user has submitted their chosen flight, it's time to take their booking information.  You'll need a form to submit the Booking and also create a Passenger object for each passenger who needs a ticket.  Don't worry about creating a separate "Ticket" object, we'll assume the airline will issue those once the booking is verified.

1.  Create and migrate the Booking model.
2.  Create and migrate the Passenger model (just keep the information simple -- name and email only).
3.  Set up associations between Bookings, Passengers, and Flights.
4.  Create a BookingsController and appropriate routes.
5.  Set up your `#new` action, which should have received the flight ID and passenger number parameters, and use it to help render a form for a new booking which displays the currently chosen date, airports, flight ID and a set of fields to enter personal information for each passenger.  You'll want to create a new blank Passenger object in your controller for each passenger, and then use `#fields_for` in the view to set up the sub-forms.
6.  Try submitting the form and check out the parameters in your server.
7.  You'll need your `#create` action to create a new Booking (linking it to the appropriate Flight) but it will also need to accept the nested attributes for each of the Passenger objects and create a new Passenger from them.  Be mindful of allowing the nested parameters as well.
8.  Go to the Booking model and implement the `#accepts_nested_attributes_for` method.  See the [Rails API](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html) for examples and [this SO post](http://stackoverflow.com/questions/18540679/rails-4-accepts-nested-attributes-for-and-mass-assignment) for another.
9.  Once your form is successfully submitted, render the booking's `#show` page which displays the booking information (flight and passenger information).
10.  Make sure your ticketing flow is working properly.  Good work!

</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

-   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
