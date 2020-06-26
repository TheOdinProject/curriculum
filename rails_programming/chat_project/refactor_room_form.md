Part of writing a program is refactoring your code when you see an opportunity present itself and once done leaves the code in a better state. Refactoring code is especially important if you notice a code smell.

#TODO intro to code smells

The topic of recognising code smells is an exhaustive one and they are much easier to learn as you write your own code and notice something doesn't feel right. We'll cover some common code smells as we go through this course and we'll explain how we recognised them and what we can do about them.

#TODO discuss and decide if we actually add this description to the table to better illustrate to just conceptually discuss

To illustrate how we might recognise a code smell let's say that we decide that our rooms need a description to go with their name so we need to add a description column to our rooms table in the database. We want the description to have to be provided so we add a validation to the model and then we need to update the new room view to add that input field in our form.

Everything is great and we can now create rooms and add a wonderful description to them. You decide that one of the rooms has the wrong name so you try to edit it. You update the room name and try to save it but now you start getting errors telling you no description can't be blank and you realise that when you updated the new room form you didn't also update the edit one.

Now, there are times when this is unavoidable. A change in your code requires you to update several places each time. And there may be times when you just aren't sure which way your code is going to go when you are finished with it, so prematurely extracting code and moving it around can actually make it worse later. In this instance though we know for sure that whether creating a new room, or editing an existing one you are always going to want to display the same form fields and for that reason the fact you're having to update both forms each time you change the model means yous spider sense should be tingling.

Further, if you do have a look at your new and edit forms side by side in your IDE you should realise that they are in fact identical.

We can solve this by using a Partial.

Inside app/views/rooms create a file called `_room_form.html.erb` and then copy and paste the form from your new.html.erb file

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
      <%= form.submit class: 'button is-link' %>
    <% end %>
  </div>
</section>
```

Now inside new.html.erb we can delete all of the text and instead render the partial

```ruby
<%= render "room_form" %>
```

Load up the new form page and you should see the form displayed just as it was before.

Now all we need to do is open the edit.html.erb view in the rooms directory and render the partial in the same way.

```ruby
<%= render "room_form" %>
```

Now if you try and edit a room you should see the same form you did previously.

Now that this has been finished let's consider what we just did. Both our new and edit views started and finished being identical but by extracting the form out into a partial if we need to change the form, such as add a new input field, we only need to make the change in one place. We've removed the code smell which in this case was having to change the same code in two places whenever a change to the room form was made.

This pattern of using partials to extract duplicate code is very common in Rails.

#### Your Turn

Having completed this refactoring you might have realised this problem has been seen elsewhere. The rooms index and show views have some duplication that means a change to one means a change to both.

See if you can extract that duplicate logic into it's own partial. Call it room_list.html.erb. To give us more flexibility we should not move the column itself for the sidebar because that will allow us to change the width of the column if we deem it necessary. For example we may decide that our index view should have a wider room list, therefore just move everything inside of the first column to it's own partial.

If all went according to plan you should now have a file called `_room_list.html.erb` in the app/views/rooms directory with the following content

```html
<h3 class="subtitle">Room List</h3>
<div class="field">
  <%= link_to "Create Room", new_room_path, class: 'button is-link' %>
</div>
<% if @rooms.present? %>
  <aside class="menu">
    <ul class="menu-list">
      <% @rooms.each do |room| %>
        <li>
        <div class="level">
          <%= link_to room.name, room_path(room), class: 'room-link' %>
          <div class="level-right">
            <%= link_to edit_room_path(room) do %>
              <span class="icon">
                <i class="fas fa-edit"></i>
              </span>
            <% end %>
            <%= link_to room_path(room), method: :delete, data: { confirm: "Are you sure you want to delete this room" } do %>
              <span class="icon">
                <i class="fas fa-trash-alt"></i>
              </span>
            <% end %>
          </div>
        </div>
        </li>
      <% end %>
    </ul>
  </aside>
<% else %>
  <div class="notification is-info">
    There are no rooms
  </div>
<% end %>
```
