### Introduction

In these projects, you'll finally really get to dive into ActiveRecord's associations, one of the best features it offers.

### Warmup: Thinking Data First

Lay out the data architecture you'd need to implement to build the following scenarios:

1. A site for pet-sitting (watching someone's pet while they're gone). People can babysit for multiple pets and pets can have multiple petsitters.
2. You like hosting people for dinner so you want to build a dinner party invitation site. A user can create parties, invite people to a party, and accept an invitation to someone else's party.
3. Extra credit (tricky): You and your friends just love posting things and following each other. How would you set up the models so a user can follow another user?

### Project: Private Events

You want to build a site similar to a private [Eventbrite](http://www.eventbrite.com) which allows users to create events and then manage user signups. Users can create events and send invitations and parties (sound familiar?). Events take place at a specific date and at a location (which you can just store as a string, like "Andy's House").

A user can create events. A user can attend many events. An event can be attended by many users. This will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won't be able to just rely on Rails' defaults like you have before).

### Your Task

We've gotten quite far here, so these tasks will only lay out the high level overview of what you're meant to build. You'll need to implement the details yourself. As usual, it's not meant to look pretty, just work. Design is all extra credit.

<div class="lesson-content__panel" markdown="1">
#### Setup and Sign In

1. Model the data for your application, including the necessary tables.
2. Create a new Rails application and Git repo called `private-events`.
3. Update your README to be descriptive and link to this project.
4. Build and migrate your User model. Don't worry about validations.
5. Create a simple Users controller and corresponding routes for `#new`, `#create`, and `#show` actions. You'll need to make a form where you can sign up a new user and a simple `#show` page. You should be getting better and faster at this type of vanilla controller/form/view building.
6. Create a simple sign in function that doesn't require a password -- just enter the ID or name of the user you'd like to "sign in" as and click Okay. You can then save the ID of the "signed in" user in either the `session` hash or the `cookies` hash and retrieve it when necessary. It may be helpful to always display the name of the "signed in" user at the top.

#### Basic Events

1. Build and migrate your Event model without any foreign keys. Don't worry about validations. Include the event's date in your model but don't worry about doing anything special with it yet.
2. Add the association between the event creator (a User) and the event. Call this user the "creator". Add the foreign key to the Events model as necessary. You'll need to specify your association properties carefully (e.g. `:foreign_key`, `:class_name`, and `:source`).
3. Modify your User's Show page to list all the events a user has created.
4. Create an EventsController and corresponding routes to allow you to create an event (don't worry about editing or deleting events), show a single event, and list all events.
5. The form for creating an event should just contain a `:description` field.
6. The `#create` action should use the `#build` method of the association to create the new event with the user's ID prepopulated. You could easily also just use Event's `::new` method and manually enter the ID but... don't.
7. The event's Show page should just display the creator of the event for now.
8. Create the Event Index page to display all events.

#### Event Attendance

1. Now add the association between the event attendee (also a User) and the event. Call this user the "attendee". Call the event the "attended_event". You'll again need to juggle specially named foreign keys and classes and sources.
2. Create and migrate all necessary tables and foreign keys. This will require a "through" table since an Event can have many Attendees and a single User (Attendee) can attend many Events... many-to-many.
3. Now make an Event's Show page display a list of attendees.
4. Make a User's Show page display a list of events they are attending.
5. Modify the User's Show page to separate those events which have occurred in the past ("Previously attended events") from those which are occurring in the future ("Upcoming events"). You could do this by putting logic in your view. Don't. Have your controller call separate model methods to retrieve each, e.g. `@upcoming_events = current_user.upcoming_events` and `@prev_events = current_user.previous_events`. You'll get some practice with working with dates as well as building some queries.
6. Modify the Event Index page to list all events, separated into Past and Upcoming categories. Use a class method on Event (e.g. `Event.past`).
7. Refactor the "upcoming" and "past" methods into simple scopes (remember scopes??).
8. Put navigation links across the top to help you jump around.
9. Extra Credit: Allow users to invite other users to events. Only allow invited users to attend an event.
10. Push to Github.

</div>

### Student Solutions

Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md). Please include your partner's github handle somewhere in the description if they would like attribution.

<details markdown="block">
  <summary> Show Student Solutions </summary>

- Add your solution below this line!
- [Saul-Good-Homie's Solution](https://github.com/Saul-Good-Homie/private_events)
- [pudu87's Solution](https://github.com/pudu87/private-events) 
- [irlgabriel's Solution](https://github.com/irlgabriel/private-events) 
- [Christian Páez's Solution](https://github.com/christian1894/odin-project-private-events) - [View in Browser](https://ruby-on-rails-private-events.herokuapp.com)
- [Christian's Solution](https://github.com/rueeazy/private-events)
- [Grant Cottle's Solution](https://github.com/grantmaster89/private_events) - [View in Browser](https://mighty-brook-58273.herokuapp.com/events)
- [Jason Thompson's Solution](https://github.com/jasont01/private-events) - [View in Browser](https://secret-coast-99413.herokuapp.com/)
- [Olugbade Olalekan's Solution](https://github.com/gbadesimple/private-events-project) - [View in Browser](https://immense-brushlands-08618.herokuapp.com/)
- [Learnsometing's solution](https://github.com/learnsometing/rails-private_events)
- [Simon Tharby's solution](https://github.com/jinjagit/social_light) - [View in browser](https://social-light-simontharby.herokuapp.com/)
- [prw001's solution](https://github.com/prw001/private_events)
- [Max Garber's solution](https://github.com/bubblebooy/private-events)
- [Austin Fisher's solution](https://thawing-everglades-63943.herokuapp.com/)
- [Javier Machin's solution](https://github.com/Javier-Machin/private-events) - [View in Browser](https://social-boost-app.herokuapp.com/)
- [0zra's solution](https://github.com/0zra/event-planner)
- [Raiko's solution](https://github.com/Cypher0/private-events) - [View in Browser](https://radiant-brook-28646.herokuapp.com/)
- [Jmooree30's solution](https://github.com/jmooree30/private-events.git) - [View in Broswer](https://sleepy-wildwood-90425.herokuapp.com/)
- [theghall's solution](https://github.com/theghall/odin-private-events.git)
- [Clayton Sweeten's solution](https://github.com/cjsweeten101/private-events)
- [Jonathan Yiv's solution](https://github.com/JonathanYiv/private-events) - [View in Browser](https://shielded-waters-45439.herokuapp.com)
- [nmac's solution](https://github.com/nmacawile/Events)
- [ToTenMilan's solution](https://github.com/ToTenMilan/the_odin_project/tree/master/rails/associations/private-events) - [View in browser](http://iventbrite.herokuapp.com/)
- [mindovermiles262's solution](https://github.com/mindovermiles262/odin-events)
- [holdercp's solution](https://github.com/holdercp/private-events) - [View in browser](https://aqueous-shore-53729.herokuapp.com/)
- [jfonz412's solution](https://github.com/jfonz412/private-events)
- [yilmazgunalp's solution](github.com/yilmazgunalp/private-events) - [Live version](https://my-private-events.herokuapp.com/)
- [CloudTemplar\_'s solution](https://github.com/cloudtemplar/private-events) - [Live version](https://shielded-falls-83468.herokuapp.com/)
- [LPSV's solution](https://github.com/leosoaivan/TOP_ror_private_events)
- [Jib's solution](https://github.com/NuclearMachine/odin_rails/tree/master/private_events) - [Live version](https://sheltered-crag-16269.herokuapp.com/)
- [Austin's solution](https://github.com/CouchofTomato/private_events)
- [Jamie's solution](https://github.com/Jberczel/private_events) - [View in browser](http://privent.herokuapp.com/)
- [Donald's solution](https://github.com/donaldali/odin-rails/tree/master/private-events)
- [TomTom's solution](https://github.com/tim5046/projectOdin/tree/master/Rails/private-events/private-events)
- [Erithair's solution](https://github.com/N19270/private-events) - [View in browser](http://private-events.herokuapp.com/)
- [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project3_EventBrite/private-events)
- [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/private_events)
- [Tommy Noe's solution](https://github.com/thomasjnoe/private-events)
- [Vidul's solution](https://github.com/viparthasarathy/private-events)
- [Aleksandar's solution](https://github.com/rodic/private-events)
- [Vidul's solution](https://github.com/viparthasarathy/private-events) - [View in browser](https://fierce-headland-7201.herokuapp.com/)
- [Jason Matthews' solution](https://github.com/fo0man/private-events)
- [Dominik Stodolny's solution](https://github.com/dstodolny/private-events)
- [Kevin Mulhern's solution](https://github.com/KevinMulhern/private_events) - [View in browser](https://privateevents.herokuapp.com/)
- [AtActionPark's solution](https://github.com/AtActionPark/odin_private_event) - [View in browser](https://afternoon-citadel-2578.herokuapp.com/)
- [Andrej Dragojevic's solution](https://github.com/antrix1/PrivateEvents) - [View in browser](https://calm-refuge-3455.herokuapp.com/)
- [dchen71's solution](https://github.com/dchen71/private-events) - [View in browser](http://ronchon-moliere-6251.herokuapp.com/)
- [Matias Pan's solution](https://github.com/kriox26/private-events) - [View in browser](https://polar-refuge-9964.herokuapp.com/)
- [Tomislav Mikulin's solution](https://github.com/MrKindle85/private-events)
- [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/private-events)
- [Radi Totev's solution](https://github.com/raditotev/private-events)
- [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/private-events)
- [Luke Walker's solution](https://github.com/ubershibs/rails_course/tree/master/private-events)
- [Scott Bobbitt's solution](https://github.com/sco-bo/private-events)
- [srashidi's solution](https://github.com/srashidi/Active_Record_Associations/tree/master/private-events)
- [Max Gallant's solution](https://github.com/mcgalcode/private-events) - [View in browser](https://secret-gorge-95812.herokuapp.com/)
- [Hassan Mahmoud's solution](https://github.com/HassanTC/private-events)
- [Miguel Herrera's solution](https://github.com/migueloherrera/private-events)
- [James Brooks's solution](https://github.com/jhbrooks/private-events) - [View in browser](https://polar-caverns-15299.herokuapp.com/)
- [Matt Velez's solution](https://github.com/Timecrash/rails-projects/tree/master/private-events)
- [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project9--private-events/private-events)
- [Mateo Mejia's solution](https://github.com/mateomgj/private-events) - [View in browser](https://fierce-brushlands-63385.herokuapp.com/)
- [Fabricio Carrara's solution](https://github.com/fcarrara/private-events) - [View in browser](https://private-events-rails.herokuapp.com)
- [Akshay Bharwani's solution](https://github.com/akshaybharwani/private-events)
- [Martin Safer's solution](https://github.com/mtsafer/private-events) - [View in browser](https://aqueous-woodland-15720.herokuapp.com/)
- [Shala Qweghen's solution](https://github.com/ShalaQweghen/private_events) - [View in browser](http://cryptic-mesa-97521.herokuapp.com/)
- [John's solution](https://github.com/johnTheDudeMan/private_events)
- [Oscar Y.'s solution](https://github.com/mysteryihs/private-events)
- [Till S.'s solution](https://github.com/gitseti/private-events) - [View in browser](https://protected-citadel-60271.herokuapp.com/)
- [Frank V's solution](https://github.com/fv42wid/events)
- [Amrr Bakry's solution](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/private_events) - [View in browser](https://fathomless-shore-10615.herokuapp.com/)
- [David Chapman's solution](https://github.com/davidchappy/odin_training_projects/tree/master/private-events)
- [Dylan's non RESTful solution](https://github.com/resputin/the_odin_project/tree/master/Rails/private-events)
- [DV's solution](https://github.com/dvislearning/private-events) - [View in browser](https://sleepy-everglades-63021.herokuapp.com/)
- [Sophia Wu's solution](https://github.com/SophiaLWu/private-events) - [View in browser](https://quiet-forest-50554.herokuapp.com/)
- [Eric Gonzalez solution](https://github.com/Twinpair/Eventor) - [View in browser](https://rails-eventor.herokuapp.com/)
- [Tom Westerhout's solution](https://github.com/TomWesterhout/private_events) - [View in browser](https://private-events-170388.herokuapp.com/)
- [at0micred's solution](https://github.com/amyjording/private-events)
- [Francisco Carlos's solution](https://github.com/fcarlosdev/the_odin_project/tree/master/private-events)
- [Punnadittr's solution](https://github.com/punnadittr/private-events) - [View in browser](https://boiling-plains-19274.herokuapp.com/)
- [Uy Bình's solution](https://github.com/uybinh/private_events_odin) - [View in browser](https://private-event-odin.herokuapp.com)
- [Agon's solution](https://github.com/AgonIdrizi/private-events) - [View in browser](https://myprivateevents.herokuapp.com/)
- [Malaika's Solution](https://github.com/malaikaMI/Event) - [View in browser](https://radiant-brook-99300.herokuapp.com/)
- [Jamesredux's Solution](https://github.com/Jamesredux/private-events) - [View in browser](https://infinite-basin-31084.herokuapp.com/)
- [bchalman's solution](https://github.com/bchalman/private-events)
- [Alex's solution](https://github.com/alexcorremans/private-events)
- [Brendaneus' Solution](https://github.com/Brendaneus/the_odin_project/tree/master/ruby_on_rails/private-events) - [View in browser](https://odin-private-events-0.herokuapp.com/events)
- [CodingCop's Solution](https://github.com/cleve703/private-events)
- [leetie's Solution](https://github.com/leetie/private-events) - [View in Browser](https://damp-ocean-10801.herokuapp.com/)
- [Run After's Solution](https://github.com/run-after/private-events)
- [Cristobal Becerra's Solution](https://github.com/powei94/private-events) - [View in Browser](https://sheltered-mountain-61366.herokuapp.com/)
- [Lucas Bide's Solution](https://github.com/Lucas-Bide/private_events)
- [Duarte's Barebones Solution](https://github.com/Duartemartins/events-app)
- [Jose Salvador's Solution](https://github.com/Jsalvadorpp/private-members)
- [Joshua Aldridge's Solution](https://github.com/JFAldridge/private-events) - [View in Browser](https://fathomless-scrubland-74558.herokuapp.com/)
- [Ovsjah Schweinefresser's Solution](https://github.com/Ovsjah/private_events) - [View in Browser](https://ovsjah-private-events.herokuapp.com/)
- [Dennis Cope's Solution](https://github.com/coped/private-events) - [View in Browser](https://private-events-top-coped.herokuapp.com/)
- [Ian's Solution](https://github.com/IanMKesler/private_events)
- [Braxton Lemmon's Solution](https://github.com/braxtonlemmon/private-events) - [View in Browser](https://safe-retreat-68130.herokuapp.com/)
- [Kevin Vuong's Solution](https://github.com/fffear/private-events)
- [Learnsometing's Solution](https://github.com/learnsometing/rails-private_events)
- [Simon Tharby's Solution](https://github.com/jinjagit/social_light) - [View in Browser](https://social-light-simontharby.herokuapp.com/)
- [prw001's Solution](https://github.com/prw001/private_events)
- [Max Garber's Solution](https://github.com/bubblebooy/private-events)
- [Austin Fisher's Solution](https://thawing-everglades-63943.herokuapp.com/)
- [Javier Machin's Solution](https://github.com/Javier-Machin/private-events) - [View in Browser](https://social-boost-app.herokuapp.com/)
- [0zra's Solution](https://github.com/0zra/event-planner)
- [Jmooree30's Solution](https://github.com/jmooree30/private-events.git) - [View in Broswer](https://sleepy-wildwood-90425.herokuapp.com/)
- [theghall's Solution](https://github.com/theghall/odin-private-events.git)
- [Clayton Sweeten's Solution](https://github.com/cjsweeten101/private-events)
- [Jonathan Yiv's Solution](https://github.com/JonathanYiv/private-events) - [View in Browser](https://shielded-waters-45439.herokuapp.com)
- [nmac's Solution](https://github.com/nmacawile/Events)
- [ToTenMilan's Solution](https://github.com/ToTenMilan/the_odin_project/tree/master/rails/associations/private-events) - [View in Browser](http://iventbrite.herokuapp.com/)
- [mindovermiles262's Solution](https://github.com/mindovermiles262/odin-events)
- [holdercp's Solution](https://github.com/holdercp/private-events) - [View in Browser](https://aqueous-shore-53729.herokuapp.com/)
- [jfonz412's Solution](https://github.com/jfonz412/private-events)
- [yilmazgunalp's Solution](github.com/yilmazgunalp/private-events) - [Live version](https://my-private-events.herokuapp.com/)
- [CloudTemplar\_'s Solution](https://github.com/cloudtemplar/private-events) - [Live version](https://shielded-falls-83468.herokuapp.com/)
- [LPSV's Solution](https://github.com/leosoaivan/TOP_ror_private_events)
- [Jib's Solution](https://github.com/NuclearMachine/odin_rails/tree/master/private_events) - [Live version](https://sheltered-crag-16269.herokuapp.com/)
- [Austin's Solution](https://github.com/CouchofTomato/private_events)
- [Jamie's Solution](https://github.com/Jberczel/private_events) - [View in Browser](http://privent.herokuapp.com/)
- [Donald's Solution](https://github.com/donaldali/odin-rails/tree/master/private-events)
- [TomTom's Solution](https://github.com/tim5046/projectOdin/tree/master/Rails/private-events/private-events)
- [Erithair's Solution](https://github.com/N19270/private-events) - [View in Browser](http://private-events.herokuapp.com/)
- [Marina Sergeyeva's Solution](https://github.com/imousterian/OdinProject/tree/master/Project3_EventBrite/private-events)
- [Kate McFaul's Solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/private_events)
- [Tommy Noe's Solution](https://github.com/thomasjnoe/private-events)
- [Vidul's Solution](https://github.com/viparthasarathy/private-events)
- [Aleksandar's Solution](https://github.com/rodic/private-events)
- [Vidul's Solution](https://github.com/viparthasarathy/private-events) - [View in Browser](https://fierce-headland-7201.herokuapp.com/)
- [Jason Matthews' Solution](https://github.com/fo0man/private-events)
- [Dominik Stodolny's Solution](https://github.com/dstodolny/private-events)
- [Kevin Mulhern's Solution](https://github.com/KevinMulhern/private_events) - [View in Browser](https://privateevents.herokuapp.com/)
- [AtActionPark's Solution](https://github.com/AtActionPark/odin_private_event) - [View in Browser](https://afternoon-citadel-2578.herokuapp.com/)
- [Andrej Dragojevic's Solution](https://github.com/antrix1/PrivateEvents) - [View in Browser](https://calm-refuge-3455.herokuapp.com/)
- [dchen71's Solution](https://github.com/dchen71/private-events) - [View in Browser](http://ronchon-moliere-6251.herokuapp.com/)
- [Matias Pan's Solution](https://github.com/kriox26/private-events) - [View in Browser](https://polar-refuge-9964.herokuapp.com/)
- [Tomislav Mikulin's Solution](https://github.com/MrKindle85/private-events)
- [Florian Mainguy's Solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/private-events)
- [Radi Totev's Solution](https://github.com/raditotev/private-events)
- [cdouglass's Solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/private-events)
- [Luke Walker's Solution](https://github.com/ubershibs/rails_course/tree/master/private-events)
- [Scott Bobbitt's Solution](https://github.com/sco-bo/private-events)
- [srashidi's Solution](https://github.com/srashidi/Active_Record_Associations/tree/master/private-events)
- [Max Gallant's Solution](https://github.com/mcgalcode/private-events) - [View in Browser](https://secret-gorge-95812.herokuapp.com/)
- [Hassan Mahmoud's Solution](https://github.com/HassanTC/private-events)
- [Miguel Herrera's Solution](https://github.com/migueloherrera/private-events)
- [James Brooks's Solution](https://github.com/jhbrooks/private-events) - [View in Browser](https://polar-caverns-15299.herokuapp.com/)
- [Matt Velez's Solution](https://github.com/Timecrash/rails-projects/tree/master/private-events)
- [Sander Schepens's Solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project9--private-events/private-events)
- [Mateo Mejia's Solution](https://github.com/mateomgj/private-events) - [View in Browser](https://fierce-brushlands-63385.herokuapp.com/)
- [Fabricio Carrara's Solution](https://github.com/fcarrara/private-events) - [View in Browser](https://private-events-rails.herokuapp.com)
- [Akshay Bharwani's Solution](https://github.com/akshaybharwani/private-events)
- [Martin Safer's Solution](https://github.com/mtsafer/private-events) - [View in Browser](https://aqueous-woodland-15720.herokuapp.com/)
- [Shala Qweghen's Solution](https://github.com/ShalaQweghen/private_events) - [View in Browser](http://cryptic-mesa-97521.herokuapp.com/)
- [John's Solution](https://github.com/johnTheDudeMan/private_events)
- [Oscar Y.'s Solution](https://github.com/mysteryihs/private-events)
- [Till S.'s Solution](https://github.com/gitseti/private-events) - [View in Browser](https://protected-citadel-60271.herokuapp.com/)
- [Frank V's Solution](https://github.com/fv42wid/events)
- [Amrr Bakry's Solution](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/private_events) - [View in Browser](https://fathomless-shore-10615.herokuapp.com/)
- [David Chapman's Solution](https://github.com/davidchappy/odin_training_projects/tree/master/private-events)
- [Dylan's non RESTful Solution](https://github.com/resputin/the_odin_project/tree/master/Rails/private-events)
- [DV's Solution](https://github.com/dvislearning/private-events) - [View in Browser](https://sleepy-everglades-63021.herokuapp.com/)
- [Sophia Wu's Solution](https://github.com/SophiaLWu/private-events) - [View in Browser](https://quiet-forest-50554.herokuapp.com/)
- [Eric Gonzalez Solution](https://github.com/Twinpair/Eventor) - [View in Browser](https://rails-eventor.herokuapp.com/)
- [Tom Westerhout's Solution](https://github.com/TomWesterhout/private_events) - [View in Browser](https://private-events-170388.herokuapp.com/)
- [at0micred's Solution](https://github.com/amyjording/private-events)
- [Francisco Carlos's Solution](https://github.com/fcarlosdev/the_odin_project/tree/master/private-events)
- [Punnadittr's Solution](https://github.com/punnadittr/private-events) - [View in Browser](https://boiling-plains-19274.herokuapp.com/)
- [Uy Bình's Solution](https://github.com/uybinh/private_events_odin) - [View in Browser](https://private-event-odin.herokuapp.com)
- [Agon's Solution](https://github.com/AgonIdrizi/private-events) - [View in Browser](https://myprivateevents.herokuapp.com/)
- [Malaika's Solution](https://github.com/malaikaMI/Event) - [View in Browser](https://radiant-brook-99300.herokuapp.com/)
- [Jamesredux's Solution](https://github.com/Jamesredux/private-events) - [View in Browser](https://infinite-basin-31084.herokuapp.com/)
- [bchalman's Solution](https://github.com/bchalman/private-events)
- [Alex's Solution](https://github.com/alexcorremans/private-events)
- [Brendaneus' Solution](https://theodinprojects.live/courses/ruby-on-rails/projects/private-events)
- [vanny96's Solution](https://github.com/vanny96/private-events) - [View in Browser](https://rocky-eyrie-58239.herokuapp.com/)
- [JamCry's Solution](https://github.com/jamcry/private-events) - [View in Browser](https://gentle-journey-93500.herokuapp.com/)
- [Tolulope Olusakin's Solution](https://github.com/Oluwadamilareolusakin/eventor) - [View in Browser](http://eventor-io.herokuapp.com/)
- [Rey van den Berg's Solution](https://github.com/Rey810/private-events)
- [Sanyogita's Solution](https://github.com/SanyogitaPandit/ruby_on_rails/tree/master/private-events)
- [Timework's Solution](https://github.com/Timework/private-events)
- [Bendee's Soultion](https://github.com/bendee48/rails-private-events) - [View in Browser](https://aqueous-gorge-20348.herokuapp.com/)
- [Robert Suazo's Soultion](https://github.com/rsuazo/private-events) - [View in Browser](https://private-events-suazo.herokuapp.com/)
</details>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

- [ActiveRecord Querying](http://guides.rubyonrails.org/active_record_querying.html)
