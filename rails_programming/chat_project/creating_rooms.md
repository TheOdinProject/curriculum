## Create a new room.

In the last section we created our rooms index page where we can list all of the rooms we've created. That's no good if we can't create any rooms though. Let's sort that out now.

Before we actually create the page where we can create new rooms we need a way to access the page. We can create a link to click on to take us to the new room form. We can place it in the left sidebar on the index page just below our subtitle. This way it will always be at the top of the room list and easily accessible. The link will be similar to the one we've already created but the path will be different. Referring back to the routes that Rails created for us we can see the prefix for a new room path is unsurprisingly `new_room`.

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

Open up the index.html.erb view from the room views directory and below the subtitle let's create a link. This may be a good time to try writing your own link_to before looking at our solution. It will differ slightly as we will be using some Bulma stylings but you can add those afterwards. A button is an inline element but we don't want anything to wrap next to it so we should wrap it in a div. Bulma has a nice field class you can add which gives the div a bit of space around it.

```html
<h3 class="subtitle">Room List</h3>
<div class="field">
</div>
```

Now try writing your own link inside that div and then check the code below. 

```html
<div class="field">
  <%= link_to "Create Room", new_room_path, class: 'button is-link' %>
</div>
```

The only difference may be the classes we've used which are Bulma provided classes so don't worry if it's not identical. If you used different wording in the button then don't worry. Make this project your own where you can, but just remember when we write a system test to mimic this you will need to use the text you used in the button when we find the element to click on.

Spin up a Rails server and navigate to `localhost:300/rooms` and you'll see the nice button on the page to create a new room. Clicking it now will throw an error that we don't have a controller action for what we want to do. In order to create new rooms there are two actions we need to take. Firstly we need a `new` action in the rooms controller with a corresponding view which will load up any objects we need access to and render the page for creating a new room. Secondly when we submit the form with the new room information Rails will route it to the `create` method in the controller in order to actually create the room in the database. Let's tackle the new action first.

Just like with our index page, where we had to pass in a `@rooms` variable with a list of all rooms to use in the view, we need our new room page to have access to a room object. We don't need to do this. It would be valid instead to just write a form with the necessary room attribute information and send that to the correct route to be picked up by the create method in the Rooms controller. Using a new room object is advantageous though, by using a new room object we get access to many conveniences that Rails have provided. The main ones are that by using a new room object in our form, Rails will know it should send that request to the create method in that objects controller. It also allows Rails to know if the attributes you are using in the form actually belong to that object so it's easier to create input and select fields for a particular objects attributes. We'll see this as we go along.

Open up the room controller and underneath the index method add a `new` method. To create a new room object to work with we don't need any Rails magic, we just create an object in the same way as you normally would for a Ruby class, by using the `new` method. It should be obvious why we call the variable `@room`.

```ruby
def new
  @room = Room.new
end
```

Any HTML request routed through the new method needs a corresponding view. In the app/views/rooms directory create a file called `new.html.erb`

To create a new room we will need to create a form for the user to submit. We'll again use some Bulma stylings to make the form look slick. Rails has a `form_with` helper that we can use to leverage the power of Rails to keep the form as simple as possible. If you take a glance at the Rails guides on [Action View Form Helpers](https://guides.rubyonrails.org/form_helpers.html) paying close attention to section 2.2 you should get a feel for how Rails binds a form to an object which is exactly what we want to do.

To use this we need to tell `form_with` that it is dealing with a model object. We can use the `model:` argument to `form_with` to give the form the object we are working with.

One other gotcha we need to think about is that by default all forms submit themselves as Javascript (AJAX) requests. This is just moving with modern times where often you want to submit a form and do something with the object created without reloading the page. If you don't want to do this and instead want to submit your request as HTML (which we do) you can set `local: true` as one of the `form_with` arguments. How this works under the hood is that without setting the `local` option the form Rails generates will have the `data-remote="true"` option set on the form which submits the request as Javascript.

If you ever work with any older Ruby projects you may come across `form_for` and `form_tag`. These are soft-deprecated form_helpers that did the same as `form_with` does now. `form_for` was used to work with model objects and `form_tag` worked by generating url's without working with an underlying object. The equivalent of `form_tag` using `form_with` is `form_with url: rooms_path`. Refer to the Rails guides if you ever need to create a form without using a model.

Inside the new.html.erb file we just created let's create the shell of the form for a user to complete to create a new room.

```html
<section>
  <div class="container">
    <%= form_with model: @room, local: true do |form| %>
    <% end %>
  </div>
</section>
```

The `|form|` variable we pass into our form block is a reference to the form object Rails gives us when using `form_with`. This allows us to work directly with the form to generate the correct form fields. Now we need to add our model attributes to the form. In order to do this we can use helper methods provided by the form object. Check out [this section](https://guides.rubyonrails.org/form_helpers.html#helpers-for-generating-form-elements) of the Rails Guides. This gives us an idea of the helpers available for generating form fields. The ones shown here are the standalone helper methods but when working with a form object we can call these methods on that object and then we can drop the `tag` part of the method name.

As an example if we want to create an input field the `text_field_tag` can be called directly on the form object as `form.text_field`. This benefit of doing it this way is that it binds the input to the form name which will submit our form to the server using the way Rails expects us to do so. Sticking to Rails conventions where possible makes it easier to find help when we need it as well as speeds up our development time.

Our room only has a name attribute. We also want to have a label for our name field to make it clear what needs to be entered. We can do this in the same way as described above. Rails provides a `label_tag` form helper so we can call `form.label` on the form object. Passing a label a symbol of the same name as our form field means Rails can connect the label to the correct form element. A must for website accessibility.

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
    <% end %>
  </div>
</section>
```

Aside from the classes, which to nobodies surprise are for Bulma styling, the form should hopefully make sense. We create a label and pass it `:name`, and when we create our text_field and also give it `:name` it binds the label to the input field.

If you save this, spin up a Rails server and navigate to `localhost:3000/rooms/new` you should see the form. Use devtools to inspect the name input field on the form and you'll see in the html it has been given a name of `room[name]`. 

```html
<input class="input" type="text" name="room[name]" id="room_name">
```

If our `@room` object had other form fields, for example a field for the room topic, using `form.text_field :topic` would have generated an input with a name of `room[topic]`. The benefit of this is what when the form is submitted through the server, Rails groups these parameters together so we can easily access all of the room parameters together. The benefit of this will become apparent when we work on creating a new room and need to ensure the parameters are sanitised.

The last thing we need is a submit button. There isn't anything surprising about it so I'll just show the code below

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
          <%= form.submit class: 'button is-link' %>
        </div>
      </div>
    <% end %>
  </div>
</section>
```

Now if you fill in a name and submit you'll see it directs to the server where we are met with another error because Rails needs a create method to be avilable. Progress!

In the rooms controller add a create action

```ruby
def create
end
```

Inside the create action we need to create another room object to work with. The one we created in the new action was just to work with the form in the new.html.erb file, it doesn't get passed from the view back to our controller.

```ruby
def create
  @room = room.new
end
```

This creates the room object for us, but we need to set attributes on it that we passed from the server (just the name in this case). To protect your application Rails uses strong parameters which you can read more about [here](https://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters). This is to stop someone submitting a form with a parameter which you haven't approved with the intent to either gain access to your application or database or to cause damage to your application.

We could handle it right there in the create method but Rails convention is to handle it in a private method in the controller. That way you can use the same sanitised parameters when updating an existing object too.

The syntax for sanitising the parameters can be seen in the Rails Guides link above. We need to permit our `room` parameters and then allow our name attribute that has been passed in the parameters. This is why when we worked with our form above we wanted each field to have a `room[name_of_attribute]` name set on it. Let's take a quick look at the parameters that get passed through by our room form.

```bash
 Parameters: {"authenticity_token"=>"Pw0tiGP0WrZ5pfqSo6cx1YbSyuu1zGegkngaQBwAaFy4UNuIHI60dWGkRacLTHtcNNZJnwENhvQeXDky7K4BCQ==", "room"=>{"name"=>"Don't @ me bro"}, "commit"=>"Create Room"}
```

Here we can see there is an authenticity token which is what Rails uses as a form of protection against Cross-Site forgery requests. You can read more about that [here](https://api.rubyonrails.org/classes/ActionController/RequestForgeryProtection.html). There is also a commit to create room which is what Rails uses to route the request to the correct controller action. It is the `"room"` parameter key that interests us now though. You can see that Rails has grouped our form fields into a hash of key value pairs for each field. In our case there was only one field but if we had more you'd see them here. By grouping them this way it is much easier for us to sanitise these parameters. We can permit the room key in the params hash and then allow each field that should be in there. This way, if anyone tries to set a rougue field on our form it won't be allowed to reach any other part of our app.

Let's allow our parameters safely through. In the rooms controller after the create method let's create a private method, which by convention is `room_params` which we can use to allow our parameters through.

```ruby
class RoomsController < ApplicationController
  def create
    # ...
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
```

This requires our parameters to have a room key, whose value should be a hash with a key of "name". This will return back to us the key, value pairs that have been allowed back through the sanitised parameters. So in our case from `room_params` we'll get back a hash like `name: "whatever name we chose"`. This is exactly how Rails allows us to build up new model objects. If we wanted to build a room in our Rails console we would do something like

```ruby
Room.new(name: "turnip lovers unite")
```

So getting back to our create method we want to pass the result of the method call to our new room object.

```ruby
def create
  @room = room.new(room_params)
end
```

This is standard Ruby behaviour. We can call the room_params method as an argument to our new method call and the return value of room_params gets used as the argument. This works because Rails expects a hash to be passed in of the values needed to build a room. If you had your own object that expected defined arguments in a particular order then this approach wouldn't work. Just keep that in mind when designing your own classes in future, if you need arguments to be flexible, use a hash.

Now we have our room object we need to save it to validate it. We have already played with this earlier in the Rails console. To validate an object we can call `.valid?` on it but we can do that at the same time as trying to save it by using the `save` method. If the save method is able to save our room object to the database it returns something truthy, otherwise it returns false. If the object is unable to save we want to rerender the new room view so that we can correct any errors and submit the form again. If it is saved we want to let the user know and then direct back to the rooms index page.

```ruby
def create
  @room = room.new(room_params)
  
  if(@room.save) # This returns something either truthy or false
    redirect_to rooms_path # Here we can use Ruby path helpers to redirect to our desired location
  else
    render :new # Here we don't want to redirect to the new page. This would go through our controller new action which would then create a new room object and wouldn't preserve any of the object we've created here. So we just want to render the new page. `:new` will render the new.html.erb in the view folder matching the controller.
  end
end
```

If the room name is valid, it is saved to the database and we are then redirect back to the index page. This should then show us the room name in the rooms list on the left of the page. We don't yet see any confirmation it was actually created, which we'll handle in a moment.

If the room isn't valid we render the new page again which makes available our instance variable `@room` to it and this is where we can see how using Rails helpers benefits us. Our form works on a `@room` object. When we first navigate to the new room page our new method in the rooms controller creates a new room object `@room = Room.new`. But once we go to the create method the `@room` object which is passed to new when it fails to save actually holds a room object that has had `valid?` called on it, we practised using this in the console in an earlier lesson. So now our form is built on this object, and when the fields are built for us, Rails actually calls the name of the field on the object to fill in the input or whatever other helper we are using. So in our case when it reaches the input field for name it tries to fill it in `@room.name`. For a new room object it is blank, so the field is blank, but for an existing object with a value for name, it will pre-populate it for us with the value it holds.

Let's see it in action. Navigate to the new room form and try to fill in a name longer than 20 characters and submit it. Check the server logs to see what happens here. Rails will rollback the transaction to make sure nothing gets saved to the database which will then return false to our `@room.save` conditional. This means the else clause of our if statement is executed and the new page is rendered. Because our `@room` object had the name value set on it when we did `room.new(room_params)` when our form is rendered again Rails fills in our form input with the value that was already there.

We still need a way to display any errors which we will handle after we allow deal with notifying users when a room has been successfully created.

When we create, edit or delete a room we want to be able to notify the user that the action has successfully finished, otherwise how would the user know. If you create a new room, but there are already 50 rooms, you'd have to scan them to find the room to make sure it created successfully. That isn't great for the user experience. So, we need to display some confirmation but also make sure it doesn't persist. Normally that would be done using javascript but Rails provides a more suitable solution out of the box. The Flash!. Check out [this section](https://api.rubyonrails.org/classes/ActionDispatch/Flash.html) of the Rails API for further details.

Neat. It works a lot like a hash but with some added convenience methods. This is just what we need. We can set a message in the flash if a room is created and display it on our page.

In our create action if a room is saved let's set a flash message confirming this.

```ruby
def create
  # ...

  if(@room.save)
    flash[:success] = "Room Successfully Created"
    redirect_to rooms_path
  # ...
```

Now we just need a way to actually see this message on our page. We could potentially set the flash on any page if such a need arises so it makes sense that the flash messages are potentially displayed on all pages. The easiest way to accomplish this is to set it in the application.html.erb file just like we did for the navigation page. We should also create the actual view in a partial and then render that in the application view.

In `app/views/layout` open up the `application.html.erb` file and underneath where we render our navbar enter the following

```html
<%= render 'shared/flashes' %>
```

Now in the `app/views/shared` folder create a new file called `_flashes.html.erb`. Remember the leading underscore is used for partial views which are only used inside other views.

Inside our view, Rails provides a `flash` method which we can use to access the flash that we set in the controller. Because the flash provides to us hash-like access you must access the contents of it using the name you set on it. So we used `flash[:success]` but we could have called it something else, which is common in Rails applications. You may have a `flash[:warning]` or `flash[:error]` for messages denoting some kind of problem and the benefit of this is it allows you to style components based on the status set on the flash. As we don't know what potential future flash keys will be used we can instead just iterate them (just as you can iterate any hash in Ruby) and output the value each hash key holds.

Inside `_flashes.html.erb` write the following code

```html
<% flash.each do |type, message| %>
  <%= message.html_safe %>
<% end %>
```

[html_safe](https://apidock.com/rails/v6.0.0/String/html_safe) inserts the string into HTML with no escaping. This ensures if we use something like `&` in your flash message you don't instead see the HTML escaped version. You should only use `html_safe` on content you know is safe, which will usually be code you've written yourself on the server that can't be manipulated by a user of your site. In this case we always set the message on the flash ourselves.

How we iterate the flash should be familiar to you as it's just standard Ruby. We iterate the hash-like flash so for each iteration we get two values. A key and a value. We named the key 'type' as it'll correspond to the type of message we set on the flash. In the case of our create method it'll be `:success` and we named the value from our hash 'message' which represents "Room Successfully Created" from the flash we set earlier.

If you were to refresh your browser now and try to create a valid room you should see a message underneath the navbar confirming the room was created successfully. This is a step in the right direction but the message looks a little bland, and would look the same no matter what type of message we were trying to convey. So an error message on the flash would look identical to a message indicating a successful action.

We can fix this by using some bulma stylings. Bulma has a [notification](https://bulma.io/documentation/elements/notification/) class that looks like it would do the job. Notice that we need to add the class `notification` and then can add an additional class to give it a specific style. `is-success` looks like a good match for the message we set when a room is successfully created.

How do we set a dynamic class name based on the content of our `type` variable from the flash iteration in our partial? For example we need to map `:success` from our flash type to `is-success`. We will also eventually need to map an error type to a bulma styling too. In Ruby when you want to do something like this you'd usually reach for a hash. We can set the hash keys to match our flash 'type' and the values to be our bulma stylings.

But where do we put it?

When we think about it logically what we want is a helper method to be available for our views. And once again Rails has already thought about this and you may have noticed when we created the rooms controller that Rails also created a `rooms_helper.rb` file in `app/helpers`. This file is intended to be used to create small helper methods for our view. This ensures our views don't become littered with logic. We want to keep the views limited to presentation only. The helper method we want to create is a perfect example of this.

I will just say now, although we won't dive into the concept in detail, if you find yourself creating lots of helper methods in your view that are used on a model object that you pass from the controller you might be better off considering decorators. A [decorator](https://en.wikipedia.org/wiki/Decorator_pattern) is a design pattern in general programming that can be used to add additional methods to an object. If you have several methods all relating to that object, whose only job is to help present that object in some kind of view, then a decorator is what you want. As a quick example if you had a profile object for a user and their profile contained their first name, last name, phone number and address, and in the view we wanted to show their full name, format their phone number to be a consistent format across all profiles and do the same with the address we could do one of three things. We could use helper methods as described above. This may be acceptable but as you add other general helper methods for the view it would become harder to reason about which methods are for what purpose. The second option is to have these methods on the model itself. Our Profile model could easily house our methods to format the name, telephone number and address. However the model should only contain domain logic for that model. These methods are merely presentation logic and again, our model could quickly become cluttered with lots of little helper methods if we aren't careful. The last option is to use an object to wrap our Profile object for our user, and house these presentation methods. You pass in the model object when you create the decorator so in your controller instead of passing the model object itself you instead first wrap it in a decorator and pass that decorator from the model to the view. If our Room model had a decorator we'd create a directory called `decorators` and a `room_decorator.rb` file in there. Then in our controller we'd do

```ruby
room = Room.find(params[:id])
@room = RoomDecorator.new(room)
```

By passing room to the room decorator what happens is when we called a method on the decorator, say `full_name` it can access all of the methods and attributes on room. If you called a method defined in the Room model itself the decorator first checks itself for the methods and if not passed the method to the object you passed to the decorator when you initialised it and checks there. It's a powerful design pattern but make sure the methods are ones only applicable to the presentation of the object in question. If you only had one method then you would be better just using a method in the helper file. Don't worry about learning about decorators right now. Just know they exist and are a cool design pattern to keep your codebase a little more organised.

Getting back on track let's create a helper method. In this instance let's try something a bit different. Let us try and write a test first and then write the code to get the test to pass. True TDD style.

Firstly let's work out where we would even write this method and then we can write a corresponding test. Although earlier I mentioned a room helper file that was generated when we created the rooms controller the method we are using is in a partial for the flash and therefore applicable to all view recourse. In that case, just as with html code applicable to all pages being put in our application.html.erb file, any helper methods applicable to all views are put in application_helper.rb found in the helpers directory.

Rails doesn't provide a test file for that by default so we need to create it. In `spec/helpers` create a file called `application_helper_spec.rb`

Open the file and let's create a basic file structure for our test file

```ruby
require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
end
```

Now might be a good time to quickly review the room_helper_spec.rb file created for us by Rails. In there it gives an example of how you can test methods written inside this module. Rather than having to create a new class and include the module in it, and then instantiate the class ourselves, we are instead given by RSpec a `helper` object that we can call any methods written inside our file with.

Back in our application helper spec file let's write a test. The first thing we need to consider is a good name for our method. The purpose of the method is to provide us with a Bulma class name based on the type we pass to it. Let's go with a method called `bulma_class_for`. That way we can call it such as `bulma_class_for :success` and it reads quite nicely. Let's start building out our test

```ruby
RSpec.describe ApplicationHelper, type: :helper do
  describe '#bulma_class_for' do # The # before our bulma_class_for indicates we are testing a class instance method
    context 'when the type is success' do
      let(:type) { 'success' }

      it 'returns the bulma is-success class' do
      end
    end
  end
end
```

Here we've set a context to provide additional information around what we are testing and then we use `let` to create a `type` variable that we can use in our test and it will return the contents of the block.

Now to write our test expectation

```ruby
let(:type) { 'success' }

it 'returns the bulma is-success class' do
  expect(helper.bulma_class_for(type)).to eq 'is-success'
end
```

In true TDD fashion run the file now

```bash
bundle exec rspec spec/helper/application_helper_spec.rb
```

And you should see a failure message

```bash
1) ApplicationHelper#bulma_class_for when the type is :success returns the Bulma is-success class
Failure/Error: expect(helper.bulma_class_for(type)).to eq 'is-success'

NoMethodError:
undefined method `bulma_class_for' for #<#<Class:0x000000000500c828>:0x00000000050d5368>`
```

Here we can see that we haven't yet defined the method. Let's do that. Open up the `application_helper.rb` file in the helpers directory and let's write the method

```ruby
module ApplicationHelper
  def bulma_class_for(type)
    bulma_classes = { 'success' => 'is-success' }
    bulma_classes.fetch(type)
  end
end
```

Here we create a hash to hold the bulma classes as a value against a key which should match the type being passed into the method. We then call `fetch` on it to retrive the value we need for the key we pass in.

You may wonder here why in our test and our application code we made the type `success` when our key is `:success`. This is just how Rails serializes the flash stored in a cookie. Symbols get converted to strings

Run the test now and it should pass. Woohoo.

Now we have a passing test we should refactor the code. I don't like that bulma_classes is a local variable. This is a sign of a code smell. We can extract the bulma classes into a private method.

```ruby
module ApplicationHelper
  def bulma_class_for(type)
    bulma_classes.fetch(type)
  end

  private

  def bulma_classes
    { 'success' => 'is-success' }
  end
end
```

Run the test file again and it should still be green. Now you're test-driving like a pro.

There is one more thing I'd like to do, and that is provide a default case where we use a key that we don't want a particular bulma class for but still want a nice default colour. That way we can use any flash key without having to account for every one in a test file. We probably shouldn't just use lots of different flash keys as they should have a semantic meaning to its indended use but we may have multiple keys which should have the same default bulma styling and by providing a default value from our `bulma_class_for` method we can avoid having to ensure each key is in the hash. A nice neutral Bulma styling is the `is-info` class we can add. The other reason we should write a test is by using the `fetch` method to retrive a value from a hash we raise an error is the key doesn't exist. We don't want this to break out application.

Let's write a test first and then the code to make it pass.

```ruby
describe '#bulma_class_for' do
  context 'when the type is success' do
    # ...
  end

  context 'when the type does not have a matching key' do
    let(:type) { 'kevins-bacon' }

    it 'returns the default value' do
      expect(helper.bulma_class_for(type)).to eq 'is-info'
    end
  end
end
```

Run the test file now and you get a failing test. The fix is simple. The fetch method let's us return a default value when no key exists on the hash.

```ruby
def bulma_class_for(type)
  bulma_classes.fetch(type, 'is-info')
end
```

Now for any key not in our `bulma_classes` hash we can still rrturn a default value to style our flash notifications. Run the test file now and we should be back to green.

Try creating a room now in your browser and you should now see a nice green coloured notification confirm the room has been successfully created.

What happens though if we try to create a room that isn't valid. Give it a try. Click to create a new room and in the room name input enter something longer than 20 characters and try to submit it. What you should see is that nothing really happens. The room name input is still showing the long room name you entered and you have no idea whether the room was created or what the problem was. If we wanted our users to have no idea what was going on we'd just link them to [stealth boats](http://www.stealthboats.com/).

Let's revisit our current room controller create method

```ruby
def create
  @room = room.new(room_params)
  
  if(@room.save)
    flash[:success] = "Room Successfully Created"
    redirect_to rooms_path
  else
    render :new
  end
end
```

When a room isn't able to be saved we `render :new` which just renders the new.html.erb file from the view file matching the controller, in this case rooms. It doesn't do a full redirect. The first thing we want to do is set a flash message to warn the user that the room was not saved. You might think we can just set the flash as we did before by adding something like `flash[:error] = "Room could not be created"` just before we render the new page again but this won't work as expected. The way the flash works is it makes itself available in the current request and the next request only, and then clears itself. So if you consider when we create a successful room, we set the flash, so it has been set in the current request cycle and then we do a redirect which moves to the next request cycle and our flash message is displayed. If we then navigate elsewhere the flash has been cleared of that particular message so it will disappear.

When the room isn't saved, if we set the flash as we did before, it would set it for the current request cycle, and when we `render :new` it isn't a redirect so we are still in the current cycle. The flash message would show up as expected but when we navigated to a new page we would only be on the next cycle, so the flash would persist and show again which is not what we want to happen.

The answer to this is to use a `now` method on the flash which limits the life cycle of the flash message you set to only one request. That way if you render a page in the current request it will show on that page only. You should only use `now` when you aren't redirecting before viewing the flash otherwise it will not show up.

What that in mind let's first quickly write a test for our `bulma_class_for` because when there is a problem we want to set the Bulma `is-danger` class. Open up our application_helper_spec file and let's add another test.

This could be a great one to try on your own first. You know how to write the test and updating the code to make it pass. Give it a try and try to get the test suite green before checking the solution below.

```ruby
describe '#bulma_class_for' do
  context 'when the type is success' do
    # ...
  end

  context 'when the type is error' do
    let(:type) { 'error' }

    it 'returns the Bulma is-danger class' do
      expect(helper.bulma_class_for(type)).to eq 'is-danger'
    end
  end

  context 'when the type does not have a matching key' do
    # ...
  end
end
```

To get the test to pass we simply need to add to our `bulma_classes` hash in our application_helper file

```ruby
module ApplicationHelper
  # ...

  private

  def bulma_classes
    { 'success' => 'is-success', 'error' => 'is-danger' }
  end
end
```

Hopefully you got your tests passing ok with your own code. Btw... we use a similar approach in the [TOP repo](https://github.com/TheOdinProject/theodinproject/blob/master/app/helpers/application_helper.rb) expect we use bootstrap instead of Bulma. 

Now we can set the flash message on our create action when the room fails to save

```ruby
def create
  @room = room.new(room_params)
  
  if(@room.save)
    # ...
  else
    flash.now[:error] = "Room could not be created"
    render :new
  end
end
```

Try creating an invalid room now and you should get a nice red banner informing our users that the room could not be created.

While this is nice, it would be even better if we could tell our users why the room didn't save. We have already experiemented in the Rails console with creating invalid rooms and saw how when we create a room object, we can call `valid?` on it. If valid? returns false then Rails populates an errors method on our object which we can call to get a list of all the reasons our object didn't save.

There is a good chance when we create applications that we will create several models that our users can create, and all of them will have some kind of validation. So we need a reusable way to list errors for those pages where we could potentially have to show them to our users. Unlike our navbar and flash partials we definitely don't need to show them on every page, and we also want a bit more flexibilty over where we show our errors as we might have a page with several forms for different models.

The create a reusable view we already know we need to create a partial, but instead of rendering it in our top-level application html view we can instead just render it on any page where we might need to list some model errors.

Let's first create the partial. In our app/views/shared create a file called `_errors.html.erb`

What we need to do in our errors partial is iterate our model object's errors and for each one create a list of errors. In order to pass a variable to a partial you can set a `locals` hash in the argument list to `render`. See [section 3.4.4](https://guides.rubyonrails.org/layouts_and_rendering.html#using-partials) in the Rails Guides for details on the syntax. This allows us to abstract the model in our partial and to a default name and then just pass the model object from the view to the partial under the abstracted name. If this does all seem a bit... abstract it will make sense in a moment after you see some code.

Inside the partial we created let us create an unordered HTML list, and inside that iterate over our abstract model's errors and for each one we can create a list item and list the error message for it.

```html
<%= if obj.errors.present? %>
  <div class="content">
    <ul>
      <% obj.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>
```

Here we first check if there any any error present on the object. If not we don't want to create the div and unordered list elements which will hold no content.

Then we iterate through the full_messages array on the errors object which contains a full sentence for the reason for the failure and for each one we create a list element and display the message. This is all just standard Ruby and should be familiar to you.

Now we just need to ensure we render this partial in the appropriate view. In app/views/rooms/new.html.erb let's render it inside the container div right above the form.

```html
<div class="container">
  <%= render partial: 'shared/errors', locals: { obj: @room } %>

  # ...
</div>
```

Notice here how we set `obj` to our `@room` object so that we can keep our errors partial abstract and not tied to any particular model. We can reuse the partial in any view and just pass in the model object from that view. It keeps our code clean and DRY.

Try creating some rooms that won't pass validations. Now not only do you get a flash message informing our users their room could not be created but they also now get an accompanying list.

Just remember the way I am showing you isn't the only way. You could instead, in the rooms controller create method when the room doesn't save, just pass the error messages to the flash and just display them there. It all depends on how you want to style your app.

Now our creating rooms is working as intended all that is left is to write some system tests to confirm it works as intended.

In the terminal let's create a system spec for this.

```bash
bundle exec rails generate rspec:system new_room
```

Delete everything inside the opening RSpec describe block and let's write a test for when we successfully create a room.

```ruby
RSpec.describe "NewRooms", type: :system do
  context 'when valid parameters are submitted through the form' do
    it 'informs the user that the room has been created' do
      visit root_path
      click_on "Rooms"

      click_on "Create Room"

      fill_in 'room_name', with: 'I miss MySpace'
      click_on 'Create Room'

      expect(page).to have_selector '.is-success'
      expect(page).to have_content "Room Successfully Created"
    end
  end
end
```

Run the test and it should be green.

A couple of things to note here. One is that we still initially visit the root_path. We could have just written `visit rooms_path` but remember a system test is supposed to mimic a user using the app. If you do find yourself writing the same code for your tests just to get a point where you then write the different parts of the test then you can use a `before` hook to extract the same code for each test. The expectation for the selector is written because it should not appear if the room doesn't successfully save as it was set in our `bulma_class_for` method.

Although we shouldn't write too many system tests we should write one more to verify an error message is displayed when the room name is invalid. We don't need to write variations for all our possible validations because we already tests the validations on the model. We can write this inside the same system spec file in a different context.

```ruby
RSpec.describe "NewRooms", type: :system do
  context 'when valid parameters are submitted through the form' do
    # ...
  end

  context 'when invalid parameters are submitted through the form' do
    it 'informs the user that the room could not be created and lists the errors' do
      visit root_path
      click_on "Rooms"

      click_on "Create Room"

      fill_in 'room_name' with: ('x' * 21)
      click_on "Create Room"

      expect(page).to have_selector '.is-danger'
      expect(page).to have_content 'Room could not be created'
      expect(page).to have_content 'Name is too long (maximum is 20 characters)'
    end
  end
end
```

Run the spec file and your tests should be green. There isn't any refactoring to do here so with that we have successfully finished creating our new rooms. Give yourself a pat on the back.
