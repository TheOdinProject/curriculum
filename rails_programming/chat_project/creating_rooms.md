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

#### Step 3.1: Create the view file

In the app/views/rooms directory create a file called `index.html.erb`

#### Step 3.2: Add a title to the index view

Open the file and at the top let's add a header. As we added Bulma earlier this is a good opportunity to test out some of their stylings. Bulma comes with a (titles)[https://bulma.io/documentation/elements/title/] style that looks perfect for what we want. We will just add the default standard style but if you want to play around with them a bit more try adding some of the other classes and find a size and style that you like.

```html
<h1 class="title">Rooms</h1>
```

Spin up a rails server and navigate in your browser to `localhost:3000/rooms` and you should see Rooms proudly displayed.

#### Step 3.3: Add index call to rooms controller

In the rooms controller inside the index action we need to load in all of the rooms.

```ruby
def index
  @rooms = Room.all
end
```

#### Step 3.4: List the rooms in the view

We need to list all of the rooms in the view. If there are no rooms yet created we want to tell the user they need to create a room. To do this we need to check if the `@rooms` variable is empty or not. Rails provides a helper method for this, `present?` will confirm if an array or array like object contains any items. We can use this to display the rooms if they are available or a message if they are not.

Open up app/views/index.html.erb and below your h1 tag add the following.

```html
<% if @rooms.present? %>
  <% @rooms.each do |room| %>
    <%= link_to room.name, room_path(room) %>
  <% end %>
<% else %>
  <div>
    There are no rooms
  </div>
<% end %>
```

Refresh your browser and you should hopefully see the message for when there are no rooms.

### Step 4: Create a new room.

In order to create new rooms there are two actions we need to take. Firstly we need a `new` action in the rooms controller with a corresponding view and secondly we need a create action in order to actually process the change.

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

Navigate to `localhost:3000/rooms/new` and try to create a new room
