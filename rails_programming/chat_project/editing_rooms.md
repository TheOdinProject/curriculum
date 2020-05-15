We've added the ability to create new rooms, but what if you need to make a change once it's been created. Maybe you made a typo with the room name and need to amend it or maybe the name of your room no longer reflects what it is used for. You don't want to have to create a new room when the room you have is perfectly adequate. Instead you just want to make the change to the room itself. Enter the edit method.

Before we start the process of creating the edit action though we should first create a link where rooms can be edited. The main benefit of doing this first is that you'll be able to see the parameter(s) passed to the controller for use. If we first wrote the controller action it is more difficult to see the connection between the parameters passed in and how we use them.

There is no standard on where your edit link should go and will depend on the design of your application. For our application we can place it next to each room in the rooms list on your rooms index page.

For our own use we want the edit link to be one of the fontawesome icons. If you navigate to the (Font Awesome)[https://fontawesome.com/] website you are able to search for icons in the top left corner. We want a nice looking edit icon so why don't you have a search for `edit` in the box and see what comes up. On the left hand side you should be able to select to view free icons only. (The first result)[https://fontawesome.com/icons/edit?style=solid] looks promising so that is what I am going to use. Feel free to choose your own if you have another style you would prefer. If you click on the icon you like it will give you all the relevant information about the icon including the html you need to include, `<i class="fas fa-edit"></i>`.

We encountered link_to in the lesson on creating the rooms index page and looked through the example provided for the different ways you can generate links using this method. We can't write this link using the same format as we did before because we want custom html to insert the icon rather than just a name. For example the following won't work because it will try and use the html as a string rather than generate html elements for us.

```ruby
<%= link_to "<i class='fas fa-edit'></i>", edit_room_path(room)
```

You should also note in the above code the path we are using. This is taken from the routes generated for us by Rails from our routes.rb file. You can check the rails routes in the terminal if you want a refresher on which routes have been generated.

So what's the solution. It never hurts to refer back to the docs. Let's have another look at the examples for (link_to)[https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to]. Scrolling down through the examples you might have seen `You can use a block as well if your link target is hard to fit into the name parameter`. The example provided was

```html
<%= link_to @profile do %>
  <strong><%= @profile.name %></strong> -- <span>Check it out!</span>
<% end %>
```

This looks like exactly what we need. Using a block allows us to insert what we need for the name of the element using html.

There is other small consideration we should handle now. When Bulma creates the menu item they are foramtted to occupy the entire space. If we add an icon as things stand they will drop to the line below. I don't want to get too deeply into this as this isn't a Rails issue but to ensure you understand some of the html that follows we are going to use the Bulma (level)[https://bulma.io/documentation/layout/level/] classes to ensure our links still look nice.

All we need to do at this stage is in the rooms sidebar where we have the `link_to` providing a link each room we need to wrap it in a div with a class of 'level'.

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

The span class of "icon" is unsurprisingly another Bulma style.

Be careful when writing link_to. It might be tempting to wrap the argument to link_to in parentheses such as `link_to(edit_room_path(room)) do` which would work but if you are adding any additional arguments to the list such as a class you need to ensure you wrap it inside in the closing parenthesis otherwise it isn't included as part of the argument list and you'll likely end up with a syntax error.

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

```ruby
<%= form_with model @room do, local: true |form|
  <%= form.label :name, class: 'label' %>
  <%= form.text_field :name, class: 'input'  %>
  <%= form.submit 'Edit', class: 'button is-link' %>
<% end %>
```

If you go back to `localhost:3000/rooms` and now try clicking on an edit link you should see the form loaded with the name of the room already loaded into the input field. Neat!

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

If you try to submit the form now you'll get another error.

```
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

After updating our params we can now redirect back to the room.

```ruby
def update
  @room = Room.find(params[:id])
  if @room.update(room_params)
    redirect_to rooms_path
  else
    render :edit
  end
```

Now once a room has updated we can redirect back to the room page to see it.

Try and update a room and see what happens. Now try updating a room but remove

#TODO refactor new and edit views to use a partial
