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
4. We will be using Devise for authentication in this project, complete the steps in their [Getting Started guide](https://github.com/heartcombo/devise#getting-started) up to and including the part where you have to run `rails db:migrate`
5. Create a `Users` controller with a `show` action. Display the users email within a `<h1>` tag in the show view.
6. When the user signs in, it should redirect them to their show page. Check out [devises guide](https://github.com/heartcombo/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-in-out) on how to do this. 


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
5. Modify the User's Show page to separate those events which have occurred in the past ("Previously attended events") from those which are occurring in the future ("Upcoming events"). You could do this by putting logic in your view. Don't have your controller call separate model methods to retrieve each, e.g. `@upcoming_events = current_user.upcoming_events` and `@prev_events = current_user.previous_events`. You'll get some practice with working with dates as well as building some queries.
6. Modify the Event Index page to list all events, separated into Past and Upcoming categories. Use a class method on Event (e.g. `Event.past`).
7. Refactor the "upcoming" and "past" methods into simple scopes (remember scopes??).
8. Put navigation links across the top to help you jump around.
9. Extra Credit: Allow users to invite other users to events. Only allow invited users to attend an event.
10. Push to GitHub.

</div>


### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

- [ActiveRecord Querying](http://guides.rubyonrails.org/active_record_querying.html)
