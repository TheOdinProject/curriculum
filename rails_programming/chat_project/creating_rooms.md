### Creating Rooms

### Step 1: Creating the model

#### Step 1.1: Creating the model

In the terminal run

```bash
rails generate model Room name:string:uniq
```

#### Step 1.2: Migrate the database
Open up the migration and add `null: false` to the room name. Then save the file and in the terminal run

```bash
rails db:migrate
```

Open up the model in app/models/room.rb

Add validations:

```ruby
class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 4..20 }
end
```

### Step 2: Creating the controller

#### Step 2.1: Create the controller

In the terminal run

```bash
rails generate controller Rooms
```

#### Step 2.2: Add the index method to the Rooms Controller

Open up the app/controller/rooms.rb file and add the index action

```ruby
class RoomsController < ApplicationController
  def index
  end
end
```

#### Step 2.3: Adding the routes

Open up the config/routes.rb file and add

```ruby
resources :rooms
```

### Step 3: Creating the index view

Let us first consider how we want our Rooms to look.

#TODO add image of rooms index page to show intended look

We need a left sidebar which provides a link to all of the rooms and a larger display area. As this is an index page we aren't showing any messages but we can fill it with .... 

#TODO decide what to fill rooms index page with

#### Step 3.1: Create the view file

In the app/views/rooms directory create a file called `index.html.erb`

#### Step 3.2: Create the index page template

The first step is to create the template for our sidebar and main page areas. We installed Bulma earlier and this is a good chance to use the stylings they provide to keep it as simple as possible. Bulma uses a (column)[https://bulma.io/documentation/columns/] template system which we can use to break up the page into column sections of varying sizes. We want to avoid getting dragged into the details too much but you can read through the columns pages to get a feel for the possibilities. A sidebar about a fifth of the page seems about right so let's start with that. We will also use the section and container bulma stylings.

```html
<section class="section">
  <div class="container">
    <div class="columns">
      <div class="column is-one-fifth">
      </div>
      <div class="column">
      </div>
    </div>
  </div>
</section>
```

We can add the code to display a list of rooms inside the first column that takes up a fifth of the page.

To be sure our code is displaying properly let's add a title to the left column which will simply state "Room List". Inside the first column we can add the following code

```html
<h3 class="subtitle">Room List</h3>
```

Spin up a rails server and navigate in your browser to `localhost:3000/rooms` and you should see the subtitle on the left.

#### Step 3.3: Get a list of rooms for the index action

In the rooms controller inside the index action we need to load in all of the rooms.

#TODO explain about the all method

```ruby
def index
  @rooms = Room.all
end
```

#### Step 3.4: List the rooms in the view

We need to list all of the rooms in the view. If there are no rooms created yet we want to tell the user they need to create a room. To do this we need to check if the `@rooms` variable is empty or not. Rails provides a helper method for this. (present?)[https://api.rubyonrails.org/classes/Object.html#method-i-present-3F] will confirm if an array or array like object contains any items. Have a look at the source code and see how simple the method actually is. Rails provides a lot of handy additional methods to make life easier for us. We can use present? to display the rooms if they are available or a message if none have been created yet.

This is a good place to start. Writing a small amount of code to get started and then filling in the details as we go.

Open up app/views/index.html.erb and below your h3 tag add the following.

```html
<% if @rooms.present? %>
  <-- Here is where we will write the code to display our rooms -->
<% else %>
  <div class="notification is-info">
    There are no rooms
  </div>
<% end %>
```

Before moving on make sure you understand what is happening in our code. There is nothing special here, it's just Ruby code so you should have a good grasp of it. We first check if the `@rooms` variable passed from our Rooms controller has anything in it using `present?`. As `@rooms` is an array like object, `present?` will return true if it has any rooms in it and the code inside the if statement will run. If `@rooms` is empty then the else part of our code will run and we can display a message in an html div that there are no rooms.

#### Reach for the Each

As the `@rooms` variable from our controller gives us an array like object to work with we can use all the array methods that both Ruby and Rails provide. When we want to iterate something in Ruby we reach for the each method.

Inside the `if` statement we can add the code to iterate each room. The each method in Ruby returns the object that each was called on after it was iterated. This means if you use the erb tags with `=` it will return the calling object and display it in on our website. If you ever are using `each` in erb code and see an array or activerecord object displayed on your website that is probably the culprit.

As we iterate each room in the `@rooms` variable we want to provide a link that the user can click on to show the room. We'll deal with the link in a moment but let's first write the code to iterate our rooms. Again, this is just standard Ruby code. Nothing magical about it

HTML provides us with the list element for such a task and since our list has no particular order we'll use the `<ul>` tag

When displaying the rooms we want to present them nicely. Bulma has a (menu)[https://bulma.io/documentation/components/menu/] item that can jazz up our lists to look nice

```html
<% if @rooms.present? %>
  <aside class="menu">
    <ul class="menu-list">
      <% @rooms.each do |room| %>
        <li>
          <-- Here we will add the link for each room -->
        </li>
      <% end %>
    </ul>
  </aside>
<% else %>
  <div>
    There are no rooms
  </div>
<% end %>
```

To add a link to our page we can't write plain html. To understand why we need to consider how you would write the path to show each room. Run `rails routes` in the terminal and look at the path we need to provide for editing a room. `/rooms/:id(.:format)`. If the id of your room was 1. Then you would need a path of `/rooms/1` to load the page to show that room. We couldn't know the id or the name of the room using only html so we need to use some ruby in our html to create the link.

Let us first consider how we would write this route in plain html. A link in html is the `<a>` tag and we provide the link using `href` so our link would be

```html
<a href="/rooms/1">Name of Room</a>
```

The 1 href path represents the id of the room and between the `<a>` tags where I wrote `Name of Room` would be, funnily enough, the name of the room. We will need to use some ruby to place those values.

Consider the following part of our view

```ruby
<% @rooms.each do |room| %>
  <-- Here we will add the link for each room -->
<% end %>
```

Inside our `do; end` block we have `room` available for each object in `@rooms`. We can use this inside some erb code to get the information we want. The link would become:

```html
<a href="/room/<%= room.id %>><%= room.name %></a>"
```

While this would work it is cumbersome and prone to formatting errors. Rails has recognised this and provides a lot of helper methods to write html using only ruby. You might not always know where to start looking when you want to write some code the Rails way so don't be afraid when you're writing your own projects to use a search engine to find out what you need.

Rails provides a handy (link_to)[https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to] helper method for generating links using Ruby in our views. Click the link and spend a moment reviewing how the method operates. Not all of it will make sense at this time but make sure you scroll down enough to look at the examples provided on its intended use.

Scrolling through the examples take note that `link_to` lets us use the Rails provided paths for the routes we have defined. If you have another looks at your routes in the terminal you'll see that the path to take us to the room show page is simply `room`. So we can use `room_path` along with the room as a parameter to that method to generate the path we need.

We now have everything we need to finish this up. We can use `room.name` as the first argument to link_to which will ensure each link is presented as the name of the room and we can provide `room_path(room)` using the room variable in the block to generate the correct href to each room.

In our app/views/index.html.erb file add the link_to code shown below.

```html
<% if @rooms.present? %>
  <aside class="menu">
    <ul class="menu-list">
      <% @rooms.each do |room| %>
        <li>
          <%= link_to room.name, room_path(room) %>
        </li>
      <% end %>
    </ul>
  </aside>
<% else %>
  <div>
    There are no rooms
  </div>
<% end %>
```

You may be wondering how we generate the correct path when we are passing in a room object as the argument in `room_path(room)`. As `room` is actually an activerecord relation object Rails takes the id from it to generate the correct path. With that in mind there is one more Rails trick we can use to make our code less verbose. Looking through the link_to examples you should be able to see instead of passing in a path as the second argument we can just pass in the activerecord object itself and Rails will infer we want to generate a link to show that object. You can therefore update the link to the following

```ruby
<%= link_to room.name, room %>
```

Refreshing your browser should still show the message that there are no rooms. We need to create some rooms first in order to show up in our list. Let's tackle that next.

### Step 4: Create a new room.

Before we actually build out the rooms we need to create a link to click on to take us to the new room form. We can place it in the left sidebar in the index page just below our subtitle. The link will be similar to the one we've already created but the path will be different. Referring back to the routes that Rails created for us we can see the prefix for a new room is unsurprisingly `new_room`.

```
               Prefix     Verb    URI Pattern
rooms#index    rooms      GET     /rooms(.:format)
rooms#create              POST    /rooms(.:format)
rooms#new      new_room   GET     /rooms/new(.:format)
rooms#edit     edit_room  GET     /rooms/:id/edit(.:format)
rooms#show     room       GET     /rooms/:id(.:format)
rooms#update              PATCH   /rooms/:id(.:format)
rooms#update              PUT     /rooms/:id(.:format)
rooms#destroy             DELETE  /rooms/:id(.:format)
```

Open up the index.html.erb view from the room views and below the subtitle let's create a link. This may be a good time to try writing your own link_to before looking at our solution. It will differ slightly as we will be using some Bulma stylings but you can add those afterwards. This is a good opportunity to practice writing your own. A button is an inline element but we don't want anything to wrap next to it to we should wrap it in a div. Bulma has a nice field class you can add which gives the div a bit of space around it.

```html
<div class="field">
</div>
```

Now try writing your own link inside that div and then check the code below.

```html
<div class="field">
  <%= link_to "Create Room", new_room_path, class: 'button is-link' %>
</div>
```

If you have a Rails server running refresh it now and you'll see the nice button on the page to create a new button.

In order to create new rooms there are two actions we need to take. Firstly we need a `new` action in the rooms controller with a corresponding view and secondly we need a `create` action in order to actually process the change.

#### Step 4.1: Add the new action

Open up the room controller and underneath the index method add a `new` method. Our method should create a new room object for our view to use.

```ruby
def new
  @room = Room.new
end
```

#### Step 4.2: Create the view

In the app/views/rooms directory create a file called `new.html.erb`

#### Step 4.3: Create a user form

To create a new room we will need to create a form for the user to submit. We can take advantage of some Bulma styles to make our form look amazing.

Inside in new.html.erb file we just created let's create a form for the user to submit and create a new room. Add the following code:

```html
<section>
  <div class="container">
    <%= form_with model: @room, local: true do |form| %>
      <div class="field">
        <%= form.label :name, class: 'label' %>
        <div class="control">
          <%= form.text_field :name, class: 'input' %>
        </div>
      </div>
      <div class="field">
        <div class="control">
          <%= form.submit 'Create', class: 'button is-link' %>
        </div>
      </div>
    <% end %>
  </div>
</section>
```

#### Step 4.4: Add the create action

In the rooms controller add a create action

```ruby
def create
  @room = room.new(room_params)
  if @room.save
    redirect_to rooms_path
  else
    render :new
  end
end
```

#### Step 4.5: Add the room_params method

In the rooms controller before the last end add

```ruby
private

def room_params
  params.require(:room).permit(:name)
end
```

Navigate to `localhost:3000/rooms/new` and try to create a new room. If it's successful it should take you back to the room index page and now you should see a link to the room you created instead of the message that there are no rooms.
