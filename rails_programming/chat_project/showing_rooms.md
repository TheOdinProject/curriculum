When we load a room we want to show all of the messages for that room. At this point we don't have the messages available as we haven't made the model yet. So we can just create the show room and display the name of the room.

Open up the Rooms controller and add our show method

```ruby
def show
end
```

Inside the show method we want to find the room with the matching ID from the parameters

```ruby
def show
  @room = Room.find(params[:id])
end
```

The show method needs a corresponding view. Inside the app/views/rooms directory create a file called `show.html.erb`. For now let's add the name of the room and leave a blank div element to add the messages to once we have created the model for them later.

```html
<section class="section">
  <div class="container">
    <%= @room.name %>
  </div>
</section>
```
