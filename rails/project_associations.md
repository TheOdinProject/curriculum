# Projects: Active Record Associations
<!-- *Estimated Time: 6-10 hrs* -->

*Don't forget to use Git to save your projects!*

In these projects, you'll finally really get to dive into ActiveRecord's associations, one of the best features it offers.  The tutorial chapter will have you creating microposts for your users and the other project will give you a chance to add some more interesting associations to your previous work.

## Warmup: Thinking Data First

Lay out the data architecture you'd need to implement to build the following scenarios:

1. A site for pet-sitting (watching someone's pet while they're gone). People can babysit for multiple pets and pets can have multiple petsitters. 
4. You like hosting people for dinner so you want to build a dinner party invitation site.  A user can create parties, invite people to a party, and accept an invitation to someone else's party.  
5. Extra credit (tricky): You and your friends just love posting things and following each other.  How would you set up the models so a user can follow another user?

## Project 1: Ruby on Rails Tutorial

This chapter of the tutorial begins the conceptual heavy lifting.  For beginners trying to plough through the tutorial, this is usually the beginning of the "I'm doing it but not understanding it" phase. Luckily, you've already learned everything that will be covered in the tutorial and this should be a great chance to see it in action as part of a real website.

The basic gist of it is that, to have a microposting site like Twitter, you've got to actually have microposts.  Users create microposts, so you can surely expect that a User will `has_many` microposts.  With the association done, the rest is really just about setting up the correct views to display the microposts.  

As with the previous chapter, just make sure you're writing the test specs in the correct files and stick with it.  There's a lot of ground to cover but, again, the conceptual hurdles should be well within reach at this point.

### Your Task

* Do the [Ruby on Rails Tutorial Chapter 11](https://www.railstutorial.org/book/user_microposts), "User microposts".

## Project 2: Private Events

You want to build a site similar to a private [Eventbrite](http://www.eventbrite.com) which allows users to create events and then manage user signups.  Users can create events and send invitations and parties (sound familiar?).  Events take place at a specific date and at a location (which you can just store as a string, like "Andy's House").

A user can create events.  A user can attend many events. An event can be attended by many users. This will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won't be able to just rely on Rails' defaults like you have before).

### Your Task

We've gotten quite far here, so these tasks will only lay out the high level overview of what you're meant to build.  You'll need to implement the details yourself.  As usual, it's not meant to look pretty, just work.  Design is all extra credit.

#### Setup and Sign In

1. Model the data for your application, including the necessary tables.
1. Create a new Rails application and Git repo called `private-events`.
2. Update your README to be descriptive and link to this project.
2. Build and migrate your User model.  Don't worry about validations.
3. Create a simple Users controller and corresponding routes for `#new`, `#create`, and `#show` actions.  You'll need to make a form where you can sign up a new user and a simple `#show` page.  You should be getting better and faster at this type of vanilla controller/form/view building.
3. Create a simple sign in function that doesn't require a password -- just enter the ID or name of the user you'd like to "sign in" as and click Okay.  You can then save the ID of the "signed in" user in either the `session` hash or the `cookies` hash and retrieve it when necessary.  It may be helpful to always display the name of the "signed in" user at the top.

#### Basic Events

3. Build and migrate your Event model without any foreign keys.  Don't worry about validations.  Include the event's date in your model but don't worry about doing anything special with it yet.
4. Add the association between the event creator (a User) and the event.  Call this user the "creator".  Add the foreign key to the Events model as necessary.  You'll need to specify your association properties carefully (e.g. `:foreign_key`, `:class_name`, and `:source`).
5. Modify your User's Show page to list all the events a user has created.
5. Create an EventsController and corresponding routes to allow you to create an event (don't worry about editing or deleting events), show a single event, and list all events.
6. The form for creating an event should just contain a `:description` field.
7. The `#create` action should use the `#build` method of the association to create the new event with the user's ID prepopulated.  You could easily also just use Event's `::new` method and manually enter the ID but... don't.
6. The event's Show page should just display the creator of the event for now.
7. Create the Event Index page to display all events.

#### Event Attendance

5. Now add the association between the event attendee (also a User) and the event.  Call this user the "attendee".  Call the event the "attended_event". You'll again need to juggle specially named foreign keys and classes and sources.
6. Create and migrate all necessary tables and foreign keys.  This will require a "through" table since an Event can have many Attendees and a single User (Attendee) can attend many Events... many-to-many.
4. Now make an Event's Show page display a list of attendees.
5. Make a User's Show page display a list of events he is attending.
6. Modify the User's Show page to separate those events which have occurred in the past ("Previously attended events") from those which are occuring in the future ("Upcoming events").  You could do this by putting logic in your view.  Don't.  Have your controller call separate model methods to retrieve each, e.g. `@upcoming_events = current_user.upcoming_events` and `@prev_events = current_user.previous_events`.  You'll get some practice with working with dates as well as building some queries.
7. Modify the Event Index page to list all events, separated into Past and Upcoming categories.  Use a class method on Event (e.g. `Event.past`).
8. Refactor the "upcoming" and "past" methods into simple scopes (remember scopes??).
8. Put navigation links across the top to help you jump around.
9. Extra Credit: Allow users to invite other users to events.  Only allow invited users to attend an event.
10. Push to Github.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Jamie's solution](https://github.com/Jberczel/private_events) | [View in browser](http://privent.herokuapp.com/)
* [Donald's solution](https://github.com/donaldali/odin-rails/tree/master/private-events)
* [TomTom's solution](https://github.com/tim5046/projectOdin/tree/master/Rails/private-events/private-events)
* [Erithair's solution](https://github.com/N19270/private-events) | [View in browser](http://private-events.herokuapp.com/)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project3_EventBrite/private-events)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/private_events)
* [Tommy Noe's solution](https://github.com/thomasjnoe/private-events)
* [Vidul's solution](https://github.com/viparthasarathy/private-events)
* [Aleksandar's solution](https://github.com/Rodic/private-events)
* [Vidul's solution](https://github.com/viparthasarathy/private-events) | [View in browser](https://fierce-headland-7201.herokuapp.com/)
* [Jason Matthews' solution](https://github.com/fo0man/private-events)
* [Dominik Stodolny's solution](https://github.com/dstodolny/private-events)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/private_events) | [View in browser](https://privateevents.herokuapp.com/)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_private_event) | [View in browser](https://afternoon-citadel-2578.herokuapp.com/)
* [Andrej Dragojevic's solution](https://github.com/antrix1/PrivateEvents) | [View in browser](https://calm-refuge-3455.herokuapp.com/)
* [dchen71's solution](https://github.com/dchen71/private-events) | [View in browser](http://ronchon-moliere-6251.herokuapp.com/)
* [Matias Pan's solution](https://github.com/kriox26/private-events) | [View in browser](https://polar-refuge-9964.herokuapp.com/)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/private-events)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/private-events)
* [Radi Totev's solution](https://github.com/raditotev/private-events)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/private-events)
* [Luke Walker's solution](https://github.com/ubershibs/rails_course/tree/master/private-events)
* [Scott Bobbitt's solution](https://github.com/sco-bo/private-events)
* [srashidi's solution](https://github.com/srashidi/Active_Record_Associations/tree/master/private-events)
* [Max Gallant's solution](https://github.com/mcgalcode/private-events) | [View in browser](https://secret-gorge-95812.herokuapp.com/)
* [Hassan Mahmoud's solution](https://github.com/HassanTC/private-events)
* [Miguel Herrera's solution](https://github.com/migueloherrera/private-events)
* Add your solution above this line!


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* [ActiveRecord Querying](http://guides.rubyonrails.org/active_record_querying.html)
