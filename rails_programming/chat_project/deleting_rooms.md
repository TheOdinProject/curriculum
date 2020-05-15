The last part of our journey into CRUD is the delete operation. Luckily it also happens to be the simplest as it doesn't require a view and only has one controller method needed yet still has a few complexities to consider.

As with the edit method we are going to use an icon to represent the delete action and we can place it alongside our edit icon in the rooms list.

Our first task will be finding a sweet icon to use. Let's navigate over to (Font Awesome)[https://fontawesome.com/] and have a search. I searched for "delete" but again I encourage you to explore on your own to find an icon you'd like to use. I've settled on the (trash-alt)[https://fontawesome.com/icons/trash-alt?style=solid] icon which I think clearly represents our intention when clicked to delete the intended room. The html for this icon is `<i class="fas fa-trash-alt"></i>` but if you have found your own icon then yours will be a little different.

We don't need to dive deeply into link_to as we've already discussed this at length but there are a couple of points worthy of consideration. Let's again review the routes that Rails provides for us for each room.

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

As with the update action the URI pattern for showing, updating and destroying a room is the same and Rails differentiates based on the method you pass in, so for our delete link we need to specify the delete method in our link. The second consideration we will discuss after we have implemented our link.

Writing most of the link_to should be familiar now but to get an understanding of how we write the delete method let's again refer to the (link_to)[https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to] documentation. If you scroll down through the examples you'll eventually get to one that states "The only option specific to link_to (:method) is used as follows:" with the following example.

```html
link_to("Destroy", "http://www.example.com", method: :delete)
# => <a href='http://www.example.com' rel="nofollow" data-method="delete">Destroy</a>
```

This looks like what we are trying to do except we want our link to be an icon. This is a good chance to practice writing your own link_to method. You want to use the same style as we did for the link_to method but we need to ensure the delete method is added. Give it a go and then refer to the code below.

```html
<%= link_to room_path(room), method: :delete do %>
  <span class="icon">
    <i class="fas fa-trash-alt"></i>
  </span>
<% end %>
```

If you refresh the page you should now see a delete icon next to the edit action for each room you have created. Try clicking on it and you'll get an error with a nice description identifying the problem "The action 'destroy' could not be found for RoomsController" and if you again refer back to the (Rails Guide)[https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions] section on CRUD, verbs and actions we can see that a delete request routes to the destroy method in our controller.

Open up the Rooms controller and let's write the last method

```ruby
def destroy
end
```

As for what goes inside we first need to load up the room we want to delete. We've already done this before.

```
def destroy
  @room = Room.find(params[:id])
end
```

And we can once again refer back to the (Rails Guide)[https://guides.rubyonrails.org/active_record_basics.html#delete] action for deleting an object to see we need to call the destroy method on it. The destory method will return false if the record can't be destroyed so we can use this much like we have done in other controller methods in an if;else statement.

```
def destroy
  @room = Room.find(params[:id])
  if @room.destroy
    flash.notice = "The room was deleted"
    redirect_to rooms_path
  else
    flash.now = "The Room could not be deleted"
  end
end
```

Try clicking on the delete icon now in your browser and you should hopefully see the room disappear with a helpful message. This brings us back to that second consideration I mentioned earlier. What happens if you accidentally click on the delete icon? Right now it would delete the room and you'd lose all the messages. What we need is a way for the user to have to confirm that they actually want to do that. As we are working on the browser it is handled by Javascript using a confirmation modal that returns true if the user clicks ok and flase otherwise. You can read more about it (here)[https://developer.mozilla.org/en-US/docs/Web/API/Window/confirm]. Luckily Rails providues a handy way to handle this for us.

Have another look at the link_to examples in the Rail API and see if you can spot something useful.

Hopefully you spotted you can add data-attributes using the data option and the example provided looks perfect.

```html
link_to "Visit Other Site", "http://www.rubyonrails.org/", data: { confirm: "Are you sure?"  }
# => <a href="http://www.rubyonrails.org/" data-confirm="Are you sure?">Visit Other Site</a>
```

Let's modify our delete link to incorporate this change.

```html
<%= link_to room_path(room), method: :delete, data: { confirm: "Are you sure you want to delete the room?" } do %>
  <span class="icon">
    <i class="fas fa-trash-alt"></i>
  </span>
<% end %>
```

Test deleting a room now and you should see a nice confirmation modal providing us with that safety net that we can't accidentally delete a room.
