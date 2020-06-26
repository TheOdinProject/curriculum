```bash
rails generate model room_message room:references user:references message:text
```

```bash
rails db:migrate
```

By referencing both room and user in the migration with `references`, Rails will automatically add the `belongs_to` associations for both user and room in the RoomMessage model. However we still need to write the other side of the association. At this stage we don't have a use for finding messages through the user so let's just add the association to the Room model

Open up the Room model and add the following code

```ruby
class Room < ApplicationRecord
  has_many: room_messages
end
```

We also need a route. Inside config/routes.rb change the line with `resources :rooms` to 

```ruby
resources :rooms do
  resources :room_messages
end
```

#TODO explain nested routes

In order to display messages in our view we need to pass them from our controller.

Inside the rooms controller add the following line to the show method

```ruby
def show
#...
@room_messages = @room.room_messages
```

This will grab all of the messages associated with that room.

We also need a form to submit new messages on each page. To do that we need to give it a new message object to work with which means we also need to add the following line to the show method

```ruby
def show
#...
@room_message = RoomMessage.new
```

Inside our show view file we need to display the room_messages.

#TODO loop messages

In order to create new messages we need a form. You should be very familiar with forms at this point but there are some new considerations for us to think about.

First, when we are working with a nested resource we need to pass both resources to the form. This is because the path will be something like `/rooms/1/room_messages/new`.

Second, we don't want to refresh the page every time we send a message, so in this instance we will use a javascript ajax request to send the message rather than an HTML request.

Third, since we are using an ajax request and the page won't refresh, any input in the form will still be visible after the message has been sent. That means we'll have to clear that ourselves and will give us a chance to work with a small amount of Javascript code.

For the nested resource in a form we'll need to consult the docs once again. Check out the (form_with)[https://api.rubyonrails.org/] Rails api page and see if you can spot what we need. You'll need to scroll down quite far.

From the example in the docs...

"If your resource has associations defined, for example, you want to add comments to the document given so that the routes are set correctly:"


```ruby
<%= form_with(model: [ @document, Comment.new  ]) do |form| %>
  ...
<% end %>
```

So we can see we need a form that passes the room, and new room message in an array to the model parameter of form_with.

Let's write the form. We will use some Bulma stylings and will need some custom css for the look and feel of the page.

Open up our room show view and inside the empty second column let's first add two divs. The first will be a container for all of the messages that get created and the second will be for the message form

```html
<div class="column">
  <div class="message-box"></div>
  <div class="message-form"></div>
</div>
```

Now inside the div with the class `message-form` we can write our form.

```html
<%= form_with model: [@room, @room-message] do |form| %>
  <div class="field has-addons">
    <div class="control">
      <%= form.text_field :message, class: 'input' %>
    </div>
    <div class="control">
      <%= form.button :submit, class: 'button' do %>
        <span class="icon is-large has-text-success">
          <span class="fa-2x">
            <i class="fas fa-arrow-circle-right"></i>
          </span>
        </span>
      <% end %>
    </div>
  </div>
  </div>
<% end %>
```

You may have noticed that the submit button above hasn't been written the same way as our other submit buttons in the other forms. This is because I wanted to use an icon to submit the message which requires passing a block to the button. `form.submit` does not accept a block so this is the way Rails recommends to handle it. Keep this in mind if you want your form buttons to use custom html rather than some text.

If you view the form now it won't look very nice. Bulma can only do so much and we'll need to add some custom css to this. We won't really explain the css too much as this isn't the point of the tutorial but we'll give a small explanation of what we are trying to do.

All of our css relates to the room views so we can write our css in `app/assets/stylesheets/room.scss` file. Open that up now.

Firstly we want our div for the messages to take up quite a bit of the screen and we can give it a nice border so it's clear where our messages will be displayed.

Inside the rooms.scss file add the following code

```css
.message-box {
  height: 80vh; 
  border: 1px solid #b8b1fc;
  border-radius: 5px 5px 0 0;
}
```

We also want the input field in the form to take up the majority of the width of the form. So we need to do two things here.

Firstly in the show.html.erb locate the div that surrounds the text input. It will have a class of `control` and add another class of `message-input` so we can target that in our css.

```html
<div class="control message-input">
  <%= form.text_field :message, class: 'input' %>
</div>
```

Then inside the room.scss file we can target that class. As Bulma has already given us a flexbox setup with the stylings we've attached we simply need to add the following to our css file.

```css
.message-input {
  flex-grow: 1;
}
```

This makes the input bar take up most of the space available.

Refresh the page and you should have a nice looking text area and form input.

As we have learned form_with submits as an ajax request by default and as we haven't added the `local: true` option it won't submit as an html request for us. That is exactly what we need. This takes care of points 1 and 2 from above.

For point 3, clearing the form after the user submits their message, we don't yet have the functionality to create the messages so we can come back to this once we know messages are being submitted and created correctly.

If you try and submit the form right now you may wonder why you don't get an error message. We should get one because we don't yet have a RoomMessages controller with the necessary actions. This is because the form is being submitted using an ajax request and therefore there is no page redirect to take us to an error page. However if you check the server logs you'll see there is an error message displayed there.

```bash
ActionController::RoutingError (uninitialized constant RoomMessagesController)
```

To fix this we need to create the controller. Open up a terminal and type

```bash
rails g controller room_messages
```

You may need to restart the server and if you now refresh the browser and resubmit a form entry you'll get a new error that the create action does not exist.

#TODO explain creating a room message through the room association

```ruby
def create
  @room = Room.find(params[:room_id])
  @room_message = @room.room_messages.build(room_message_params)
  @room_message.user = current_user
  @room_message.save
end
```
#TODO respond if message does not save

Now that the messages are being created we need to display them in the room. We are already grabbing all of the room_messages for each room in the rooms controller show method and we already have created a space to display them. So all we need to do is iterate the room_messages in the view and for each one print out the message.

Open up the rooms show html file and locate the div with the class `message-box` we can add the following code inside that div

```html
<% @room_messages.each do |room_message| %>
  <div class="message">
    <div class="message-header">
      <%= room_message.user.username %>
    </div>
    <div class="message-body">
      <%= room_message.message %>
    </div>
  </div>
<% end %>
```

Now you should be able to refresh the screen and see any messages you have created. If you haven't created any yet go ahead and make a few and then refresh the screen again.

If you check the server logs you may see something alarming. Each time we add a new room message there is a database request for the user. This is happening because we request the `user.username` for each message. This is known as the N+1 problem.

#TODO explain N+1

In order to avoid this problem we need to hit the database for both the room messages and their associated users at the same time. When you load an association this way it is known as Eager Loading. You can read a little bit about it in the (Rails Guides)[https://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations] section on this problem. It also gives us the solution to our problem. Rails has the `includes` method which makes sure ActiveRecord gets our queries with the minimum number of database queries.

Open up the rooms controller and lets include the users with the room messages in the show action

```ruby
@room_messages = @room.room_messages.includes(:users)
```

If you refresh the page and check the server logs you'll notice there is no longer a long list of user load queries. Rails has grabbed all the user information when it got the room messages. It might not make much of a difference now, but once a room has potentially thousands of messages you'd definitely notice the difference.

There is one last problem we need to deal with that you'd have noticed if you created enough messages to fill the space we've created for them. They just continue way down past the page which looks pretty terrible. We just need to do a simple css fix. Open the room.scss file in the stylesheets folder we just need to add one line to the `.message-box` target class

```css
.message-box {
  ...
  overflow-y: scroll;
}
```

Now if you refresh the browser you'll see any messages that don't fit are now reachable by a scrollbar.

Now we can finally go back to our earlier goal of clearing the input field when a message has been sent.

To do this we will need to use Javascript. Rails implements the rails_ujs package to handle a lot of javascript actions. If you look at the app/javascript/packs/application.js file you'll see the rails_ujs package is imported and started.

# TODO explain rails UJS

First, we need somewhere to write our script. We should not write scripts in the application.js file. So in app/javascript create a directory called `room_messages` and as our script relates to our room_messages create action we can create a file called `create.js` in there.

Only files in the `javascript/packs` directory are compiled so we need somewhere to reference the create.js file in there. As we only need to import one file we could just require it in application.js, but we don't want to overload that if we create more javascript files and this is a good opportunity to learn how we would handle this in a larger application so let's instead create a file called `room_message.js` inside `javascript/packs`.

This file will be automatically compiled by webpack but it won't be automatically included in our application. For that we need to include this javascript inside our `<head>` element. Open up `app/views/layouts/application.html.erb` and notice in the `<head>` there is already an import for our application.js file in the packs directory. `<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>¬`. This is the Rails way to import files from the pack directory.

We need to reference our room_message.js file which we can do the same way. Below the application import add the following line

```html
<%= javascript_pack_tag 'room_message', data-turbolinks-track':'reload' %>
```

This will ensure our room_message.js file in the packs directory gets imported into our application.

Now the final connection to make is inside room_message.js we need to require our create.js file from the room_messages directory. Open room_message.js in the packs directory and add the following line.

```js
require("room_messages/create")
```

Notice that we don't need to actually specify the path

# TODO explain webpacker source paths

Now everything is setup we can write the javascript code to clear the input.

We want to add an event listener to the form to listen for the `ajax:success` event. As the user won't start on this page we can't just add the event listener straight away as the form won't exist on any other page in our application. If the Javascript runs on our room index page were the form doesn't exist then when we navigate to the show page for any room the javascript will already have been evaluated. Instead we can add an event listener to the document for when the DOM loads each time. Then inside there check if the form is on the current page, and if it is then we can bind the event listener for a successful ajax request to it and clear the form.

To make it easier to target the form let's add an id to it. Open the rooms show.html.erb file and where we create the form add an id as follows

```html
<%= form_with model: [@room, @room_message], id: 'message-form' do |form| %>
```

Inside the create.js file in the room_messages directory add the following code

```js
document.addEventListener('DOMContentLoaded', () => {
  let form = document.getElementById('message-form')
  if(form) {
    form.addEventListener('ajax:success', (event) => {
      document.querySelector('.input').value = '';
    })
  }
})
```

Refresh the page in the browser and try and submit a message. The form should now clear on submission.
