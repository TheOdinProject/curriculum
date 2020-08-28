We've added the ability to create new rooms, but what if you need to make a change once it's been created. Maybe you made a typo with the room name and need to amend it or maybe the name of your room no longer reflects what it is used for. You don't want to have to create a new room when the room you have is perfectly adequate. Instead you just want to make the change to the room itself. For new rooms we have the new and create methods, and for updating existing rooms we have the edit and update methods in the controller.

Before we start the process of creating the edit action though we should first create a link where rooms can be edited. The main benefit of doing this first is that you'll be able to see the parameter(s) passed to the controller for use. If we first wrote the controller action it is more difficult to see the connection between the parameters passed in and how we use them.

There is no standard on where your edit link should go and will depend on the design of your application. For our application we can place it next to each room in the rooms list on your rooms index page.

For our own use we want the edit link to be one of the fontawesome icons. If you navigate to the (Font Awesome)[https://fontawesome.com/] website you are able to search for icons in the top left corner. We want a nice looking edit icon so why don't you have a search for `edit` in the box and see what comes up. On the left hand side you should be able to select to view free icons only. (The first result)[https://fontawesome.com/icons/edit?style=solid] looks promising so that is what I am going to use. Feel free to choose your own if you have another style you would prefer. If you click on the icon you like it will give you all the relevant information about the icon including the html you need to include, `<i class="fas fa-edit"></i>`.

We encountered link_to in the lesson on creating the rooms index page and looked through the example provided for the different ways you can generate links using this method. We can't write this link using the same format as we did before because we want custom html to insert the icon rather than just a name. For example the following won't work because it will try and use the html as a string rather than generate html elements for us.

```ruby
<%= link_to "<i class='fas fa-edit'></i>", edit_room_path(room)
```

You should also note in the above code the path we are using. This is taken from the routes generated for us by Rails from our routes.rb file. You can check the rails routes in the terminal with `bundle exec rails routes` if you want a refresher on which routes have been generated.

So what's the solution. It never hurts to refer back to the docs. Let's have another look at the examples for (link_to)[https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to]. Scrolling down through the examples you might have seen `You can use a block as well if your link target is hard to fit into the name parameter`. The example provided was

```html
<%= link_to @profile do %>
  <strong><%= @profile.name %></strong> -- <span>Check it out!</span>
<% end %>
```

This looks like exactly what we need. Using a block allows us to insert html to be used for the name of the link.

There is other small consideration we should handle now. When Bulma creates the menu item they are formatted to occupy the entire space. If we add an icon as things stand they will drop to the line below. I don't want to get too deeply into this as this isn't a Rails issue but to ensure you understand some of the html that follows we are going to use the Bulma (level)[https://bulma.io/documentation/layout/level/] classes to ensure our links still look nice.

All we need to do at this stage is in the rooms sidebar where we have the `link_to` providing a link each room, we need to wrap it in a div with a class of 'level'.

```html
<li>
  <div class="level">
    <%= link_to room.name, room_path(room) %>
  </div>
</li>
```

Getting back to our edit_link we want to place our edit icon on the right of the level. It's as simple as wrapping it in a div with a class of "level-right"
Open up our rooms index page in a text editor and after the link we created for the room name let's add the following code:

```html
<div class="level-right">
  <%= link_to edit_room_path(room) do %>
    <span class="icon">
      <i class="fas fa-edit"></i>
    </span>
  <% end %>
</div>
```

You will also need to add this code in the show.html.erb view in the same place.

The span class of "icon" is unsurprisingly another Bulma style.

Be careful when writing link_to. It might be tempting to wrap the argument to link_to in parentheses such as `link_to(edit_room_path(room)) do` which would work but if you are adding any additional arguments to the list such as a class you need to ensure you wrap it inside in the closing parenthesis otherwise it isn't included as part of the argument list and you'll likely end up with a syntax error.

So for example

```ruby
link_to(edit_room_path(room), class: 'some-class') do
```

Would work, but

```ruby
link_to(edit_room_path(room)), class: 'some-class' do
```

Would not. This may seem obvious to some of you as this is just standard Ruby behaviour but I've seen people get caught out with this before.

Load up `localhost:3000/rooms` in your browser and you should now see a nice looking icon that represents editing a room. However it has caused one small issue with the link for our room name now not stretching the rest of the available space. The easiest way to fix this is with a bit of css. Firstly we can add a class to target in our css to the link for the room name. Let's add a class name of "room-link" to each link we create. The way this is done in Rails with a link_to is by adding a hash argument to the link_to argument list with a key of class and it's value being a string of the class name(s) you want to add. Change the link_to for each room to the following

```html
<%= link_to room.name, room_path(room), class: 'room-link' %>
```

Then we need to write that css. Open up app/assets/stylesheets/rooms.scss and add the following code

```css
.room-link {
  width: 100%
}
```

Make sure all files are saved and then refresh the page and you should see a nicely formatted menu for the rooms.

Going back to the edit icon we created if you click on it you'll get an error because we haven't created the edit controller action or view yet so let's move on and fix that.

Editing a room is very similar to creating a new room, we want a similar form where we can update the details for the room with the main difference being we want the room details already loaded into the form ready to be changed. However before we do that let's follow the path our request would take. Rails would firstly try to match a request to edit a resource with a route. As we already created all of the routes with `resources :rooms` in the routes file that has already been taken care of. The route would send our request to the Rooms controller looking for the edit method. This is a good place to start.

Open up the rooms controller and add the edit action underneath the create action you created earlier.

```ruby
def edit
end
```

What should go inside our edit action? In the new action we created a new room with `@room = Room.new` but here we want a room that already exists in our database. A good place to start is to consider the url created for us by Rails. If you inspect the edit link in the browser you will see something like `a href="/rooms/1/edit"`. The URI pattern is `/rooms/:id/edit`. This means Rails will assign the number in the edit link to `:id` in the params.

The last piece of the puzzle is deciding which method provided by ActiveRecord we need to use. The Rails Guides are a great place to browse when you aren't sure what to use. Let's have a look at the Rails Guide on the (Active Record Query Interface)[https://guides.rubyonrails.org/active_record_querying.html] and see what they suggest. Looking at the sections on the right of the page we can see that section 1. Retrieving a Single Object from the database is exactly what we are trying to do. Click on the section we want to visit and have a little read through what it says. For single object retrieval ActiveRecord provides the `find` method.

The example provided there is `client = Client.find(10)`. The 10 here is the ID of the client in the database.

The ID for the room we want to find is given to us through the params object Rails makes available to us in each controller. As we saw above Rails will match the id for the room to `:id` using the URI pattern `/rooms/:id/edit`. We can access params just like a hash so `params[:id]` will give us the id matched from `/room/1/edit` in the example we used earlier. In your case the id might not be `1` if you created multiple rooms so don't worry if your id is different.

We now have what we need to complete the edit method in the controller. We need to create a `@room` variable to pass to our edit view. The variable should contain the room we want to edit and we can find that room using the `find` method provided by ActiveRecord and the id matched by Rails from the URI.

Inside the edit method in the Rooms Controller let's create that variable.

```ruby
def edit
  @rooms = Room.find(params[:id])
end
```

It might have seemed a long-winded explanation just to add that one line but Rails is a huge framework. There are hundreds of convenience methods and it's just impractical to learn them all. It's the same with any programming language. They often provide so many methods that memorising them is impossible. So it is better to learn how to find what you need so when you do need to look it's not a painful experience. We have just learned to use the Rails Guides to find the information we need. They might not be the most exciting read but when you are stuck with something in Rails they should be the first place to reach along with the Rails API to look up how each method can be implemented. That's how we found out about link_to accepting a block. If you can't find what you need in either of those places then a search engine will point you in the right direction.

If you click the edit icon now you'll get an error. Go ahead and click it to see for yourself. The error is pretty self-explanatory.

```
RoomsController#edit is missing a template for request formats: text/html
```

Our edit method is missing a template for an HTML request. When we want to return HTML in Rails we use a view. We've already created our index and new room views so now we need one for our edit action.

In app/views/rooms create a file called `edit.html.erb`. This is in line with the naming convention we've already used for our other views.

We've already discussed what should go in the view. We need a form to edit the room. We already covered forms when built the new room form and this form is no different. The only difference is the object we supply to the form. In the form for a new room we pass `@room = Room.new` from the controller. This blank room has no attributes set for it yet in the database so our form input is blank for name. With edit we pass a Room object that matches the id that got matched from the params of our edit link. Therefore `@room = Room.find(params[:id])` will instead pass a room from the database that will already have the name completed.

Let's build the form for our edit view.

We start by creating the form using form_with. We don't want the form to submit using AJAX so we will again use the `local: true` option.

```ruby
<%= form_with model @room do, local: true |form|
<% end %>
```

Inside our form we want an input field for the name variable. Because we name our form input `name` which is what we have called the attribute in the database for our room name, and because our form is using `model @room` is means the input field is assuming `@room` has an attribute named 'name'. So in the input field the form will load `@room.name`.

The final view including our Bulma stylings should look as follows:

```html
<section>
  <div class="container">
    <%= form_with model @room do, local: true |form|
    <div class="field">
      <%= form.label :name, class: 'label' %>
      <div class="container">
        <%= form.text_field :name, class: 'input'  %>
      </div>
    </div>
      <%= form.submit 'Edit', class: 'button is-link' %>
    <% end %>
  </div>
</section>
```

If you go back to `localhost:3000/rooms` and now try clicking on an edit link you should see the form loaded with the name of the room already loaded into the input field. Neat!

Now all that is left is to render the error partial as we did for our new form.

```html
<div class="container">
  <%= render partial: 'shared/errors', locals: { obj: @room } %>

  # ...
</div>
```

If you try to submit the form now you'll get another error.

```bash
The action 'update' could not be found for RoomsController
```

Much like when we create a new room we need a create method, editing a room requires an update method in the controller for when the form is submitted. Open up your Rooms Controller and below the edit method write an update method.

```ruby
def update
end
```

Inside update we first need to load the room that we want to update. The id is passed in the same way as for the edit action so we can find the room the same way.

```ruby
def update
  @room = Room.find(params[:id])
end
```

Now we need to update the params. What method do we need to use? The first place to start is again our trusty (Rails Guides)[https://guides.rubyonrails.org/]. Have a look at the link and see if you can spot where we should go. We are working with updating a Model so that's a good place to look. The first link under Models is Active Record Basics with a sub-heading stating "This guide will get you started with models, persistence to database, and the Active Record pattern and library.". We are trying to update a record in the database which is persisting a record so this looks like the page we need. Click the link and have a look at the contents of the page on the right. Scanning down the list I can see that section 5 is about "CRUD". The U in CRUD is for updating. Let's have a look here and you should arrive at the (Update)[https://guides.rubyonrails.org/active_record_basics.html#update] section. This tells us we can find a user and call update on it, providing a hash of attributes. This is exactly what gets passed to our controller in the params hash.

We've already loaded the object we want to update. So now we can just call update on it and pass in a hash of the attributes we want to update. To ensure we only pass in attributes that we've allowed we can use the room_params method that we used when creating a room.

```ruby
def update
  @room = Room.find(params[:id])
  @room.update(room_params)
```

After updating our params we can now redirect back to the room and set a flash message that is has succeeded or failed

```ruby
def update
  @room = Room.find(params[:id])
  if @room.update(room_params)
    flash[:success] = "Room successfully updated"
    redirect_to rooms_path
  else
    flash.now[:error] = "Room could not be updated"
    render :edit
  end
```

Now once a room has updated we can redirect back to the room page to see it and if it fails our edit view is rendered again and our errors partial will display the reasons why.

Play around with it and ensure it works as expected.

The last thing we need to do is write our trusty system tests to ensure our application works as expected.

In the terminal let's create a system test

```bash
bundle exec rails generate rspec:system edit_room
```

As with our new room system tests remove everything inside the opening describe block so you are left with

```ruby
require 'rails_helper'

RSpec.describe "EditRooms", type: :system do
end
```

Before we start writing the actual test let us think through our approach. We need an existing room in the database to edit which can be handled in a before hook. We can then take a similar approach to when we created a room, visit the root_path, click on the "Rooms" link and then click on our link to edit the room. This is where we have an issue compared to our previous approach. Before when creating a new room we used the link text to tell our test what to click. In this case we don't have any text. How do we click on an icon? We did touch on this earlier when looking at the [capybara click](https://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Actions#click_button-instance_method) method. For the locator we can provide either text, id or test_id attribute. Here we will use a test_id attribute as we don't need to add an id just for testing purposes.

In order to add a data-attribute we can again turn to the [link_to](https://apidock.com/rails/v6.0.0/ActionView/Helpers/UrlHelper/link_to) docs. If you read the section on the options we can provide one is data which can be used to add custom attributes.

Open up our room_list partial which you can find in the rooms view directory and locate the line where we generate the edit link. We just need to add the data option and pass that a hash of key value pairs. The key will represent the data attribute set. For a value we need something unique. We will have several rooms in our list and we need to target a specific one. We could use the id of each room as it will be unique and it could work as our testid attribute doesn't need to represent anything to a person looking at our code but the name of our rooms is also unique and so this would be a good case because in our tests we don't want to have to manually assign an id to any object we create.

Our room names might have spaces, or special characters and that will make setting a test id difficult as things stand. We want to create a consistency in how we create these names. Rails has a [parameterize] method that we can call on a string which will remove any special characters, downcase all letters and then seperate words with a hyphen. Keep in mind if you ever want to use this method yourself in your own apps that if you have a word such as `don't` it will seperate on the `'` and you will end up with `don-t`.

The very last consideration is we will probably need to use the same approach for our delete link so if we just use the room name for the test id we will get the same name for our delete link. If Capybara detects two possible options for a link it will throw an error because it doesn't know which one you want. We can just give our edit link a start of "edit-" and then tack on the hyphenated room name.

If you're feeling confident try and write the data-attribute yourself. If not then have a look at the code below and I'm sure you'll grasp what is happening straight away.

```ruby
<%= link_to edit_room_path(room), data: { test_id: "edit-#{room.name.parameterize}" } do %>
```

If you now load up the rooms index page in your browser and check the HTML for the edit links you should see they now contain a testid data attribute. We can use this to target the element in our test.

The last thing we need to do is tell capybara what data attribute name we are using. It's pretty simple to do. In the `spec/support` directory create a new file called `capybara_support.rb`.

In there we just need to define the config test_id.

```ruby
Capybara.configure do |config|
  config.test_id = "data-test-id"
end
```

The only thing to note here that might seem confusing is that we set `test_id` and here we have `test-id`. This is just how Rails standardises attribute names.

Let's get back to our system test.

It will follow a similar pattern to our system test for creating a new room so hopefully will look familiar to you.

```ruby
RSpec.describe 'EditRooms', type: :system do
  before(:example) do
    Room.create(name: 'test room')
  end

  context 'when a valid edit is made' do
    it 'informs the user that the room was successfully updated' do
      visit root_path
      click_on "Rooms"

      click_on "edit-test-room" # our test_id data attribute

      fill_in 'room_name', with: 'prod room'
      click_on 'Update Room'

      expect(page).to have_selector('.is-success')
      expect(page).to have_content('Room successfully updated')
      expect(page).to have_content 'prod room'
      expect(page).not_to have_content 'test room'
    end
  end
end
```

Note in the last expectation we negate it with `not_to` as we no longer expect 'test room' to appear on the page once the name has been changed.

Run the test file and stare in awe at the greenness of it all.

We can also write one for if we try to edit a room name to something invalid.

```ruby
RSpec.describe "EditRooms", type: :system do
  before do
    Room.create(name: 'test room')
  end

  context 'when a valid edit is made' do
    # ...
  end

  context 'when an invalid edit is made' do
    it 'informs the user the room change could not be made' do
      visit root_path
      click_on "Rooms"

      click_on "edit-test-room"

      fill_in 'room_name', with: ''
      click_on 'Update Room'

      expect(page).to have_selector('.is-danger')
      expect(page).to have_content('Room could not be updated')
      expect(page).to have_content('Name can\'t be blank')
      expect(page).to have_content('Name is too short (minimum is 4 characters)')
    end
  end
end
```

Again, run these tests and everything should be groovy.

Now we have a green test suite lets turn our attention to refactoring. There is one bit I don't like which is where we create the test_id in the room_list partial. It's too much logic in a view. We should instead turn this into a helper method. As this relates to a room name we can put it in the room_helper file and if we find that we need to use it elsewhere we can lift it up to the application helper.

As we have already written the code to make our system tests pass, and are just lifting it up to a helper I'll just write all the tests together below and then the code to make it pass. If you want to try this yourself then go ahead. See what tests you can come up with.

`app/helpers/rooms_helper.rb`

```ruby
RSpec.describe RoomsHelper, type: :helper do
  describe('#edit_test_attribute') do
    context('when a single word is provided') do
      it 'returns a downcased version of the word preceeded with edit-' do
        expect(helper.edit_test_attribute('Dude')).to eq 'edit-dude'
      end
    end

    context ('when a phrase is provided') do
      it('returns a downcased version of the word preceeded with edit-')
        expect(helper.edit_test_attribute('Where is My Cat')).to eq 'edit-where-is-my-cat'
      end
    end

    context('when there are special characters') do
      it('removes the special characters from the phrase') do
        expect(helper.edit_test_attribute('hi @ mom')). to eq 'edit-hi-mom'
      end
    end
  end
end
```

To make the test pass open up the room_helper file in `/helpers` and add the `edit_test_attribute` method

```ruby
module RoomsHelper
  def edit_test_attribute(name)
    "edit-#{name.parameterize}"
  end
end
```

Run the room_helper_spec file with rspec and the tests should be green. All that is left is in our room_list partial to call this method in our edit link_to.

```ruby
<%= link_to edit_room_path(room), data: { test_id: edit_test_attribute(room.name) } do %>
```

To ensure this hasn't broken our code run the edit_rooms system test file again. All tests should be green.
