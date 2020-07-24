## Create a new room.

Before we actually create the page to create new rooms we need a way to access the page. We can create a link to click on to take us to the new room form. We can place it in the left sidebar on the index page just below our subtitle. This way it will always be at the top of the room list and easily accessible. The link will be similar to the one we've already created but the path will be different. Referring back to the routes that Rails created for us we can see the prefix for a new room path is unsurprisingly `new_room`.

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

The only difference may be the classes we've used which are Bulma provided classes so don't worry if it's not identical. If you used different wording in the button then don't worry. Make this project your own where you can.

Spin up a Rails server and navigate to `localhost:300/rooms` and you'll see the nice button on the page to create a new room. Clicking it now will throw an error that we don't have a controller action for what we want to do. In order to create new rooms there are two actions we need to take. Firstly we need a `new` action in the rooms controller with a corresponding view which will load up any objects we need access to and render the page for creating a new room. Secondly when we submit the form with the new room information Rails will route it to the `create` method in the controller in order to actually create the room in the database. Let's tackle the new action first.

Just like with our index page, where we had to pass in a `@rooms` variable with a list of all rooms to use in the view, we need our new room page to have access to a room object. We don't need to do this. It would be valid instead to just write a form with the necessary room attribute information and send that to the correct route to be picked up by the create method in the Rooms controller. Using a new room object is advantageous though, by using a new room object we get access to many conveniences that Rails have provided. The main ones are that by using a new room object in our form, Rails will know it should send that request to the create method in the objects controller. It also allows Rails to know if the attributes you are using in the form actually belong to that object so it's easier to create input and select fields for a particular objects attributes. We'll see this as we go along.

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

# TODO: set flash

# TODO: set errors on form
