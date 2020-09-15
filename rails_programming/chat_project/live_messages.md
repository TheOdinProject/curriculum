Now that we've implemented message creation we need to deal with the fact our messages aren't being synced in real time to users who are currently in a chat room. When a user submits a message, none of the other users know one has been sent. They would have to continually refresh the page to find out if any new messages were available. This isn't the 90's and we can do better.

We need websockets.

We won't get into the nitty gritty of what websockets are here but to provide a little context, websockets let our client (the browser) and server keep an active connection open for as long as needed. Usually in the world of http connections the client sends a request to the server, this opens a connection and once the server responds the connection is closed. This makes sense in scenarios like requesting HTML for a webpage. We want to get the HTML and any other assets required to display the webpage and then close the connection. There is no need to keep it open.

By keeping a connection open it allows our server to push data down to a client rather than wait for a client to request some information. The benefits of this should be obvious for our application. We can notify a client when a new message is available and send them the data. We can then update each room with the new message which they can then load into the chatroom live without the user having to make any requests.

#TODO: Decide if we discuss what came before websockets, long polling etc

Prior to Rails 5 using websockets within Rails wasn't easy. Third party solutions existed but weren't ideal. However with Rails 5 came Actioncable. This is Rails integrated solution. At first it definitely had some teething problems but with each Rails iteration it has worked on them and with Rails 6 and webpacker there is a real seamless integration with the existing Rails architecture. You can see in your own app that Rails includes an `app/channels` directory where serverside websocket processing happens and an `app/javascript/channels` directory for the client side of things which does use Javascript. You won't need to be a JS magician as Rails does a lot of the heavy lifting. All you need to know are a few Javascript basics such as how to get an element and append some data to it.

#TODO: Provide a summary of the different files that come with actioncable.

The websocket we need to create will serve our Rooms. When a user views an individual room to see the messages in there they should connect to that Rooms websocket stream. Therefore we need to create a RoomChannel resource. For this Rails gives us a generator to do all of the heavy lifting. In the terminal you just need to run

```bash
bundle exec rails generate channel room
```

#TODO Show output

That's it. Rails will generate the files we need.

The first thing we need to do is setup a connection identifer. If you refer to [section 4.1.1](https://guides.rubyonrails.org/action_cable_overview.html#server-side-components-connections) in the Rails guides it provides a little more context. Essentially we need a unique identifer for each consumer. The example given in the Guides is pretty much what we need. We can identify a connection to our websocket by the current logged in user. Not only does this ensure each connection can be uniquely identified but as the guides suggest we could also identify all connections a particular user is connected to. While we may not need that here it's still useful to know what can be done when you branch out to making your own apps.

Open up the `app/channels/application_cable/connection.rb` file and in there let's enter the following code

```ruby
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
```

Let's summarise what is happening here:

- The Connection class represents the link between the server and every client that connects to it. This means for every connection made via a WebSocket there is a corresponding connection object instantiated. Connection objects are concerned with identifying a connection
- `identify_by` tells our connection object what will uniquely identify each connection. We used `current_user` because we want to identify a connection by the user logged in who goes into a chatroom. This is an attribute of the Connection class so it isn't the same as the `current_user` method that devise makes available to us.
- The only method we need to provide to the Connection class is a `connect` method. This method is called each time a connection is made to a websocket by a client. In this method you normally assign your unique_identifier to the connection. The unique identifer can be anything, we just decided to use the current logged in user because each user is unique. You may have a use case where a user doesn't have to be logged in. In that case there are ways in Ruby to generate unique strings such as `SecureRandom.urlsafe_base64`.
- For our find_verified_user method we use a bit of Ruby trickery to both assign something to verified_user and use that value in our `if` statement. We assign `env['warden'].user` as devise uses warden to handle authentication and that is how warden holds the current user. If you don't have a user class it will be whatever class represents a user of your site. If no such user exists we use `reject_unauthorized_connection` which is provided to us by ActionCable to ensure a connection can't be made without a verified user being present.
- If you need to do any cleanup when a user disconnects you can also implement a `disconnect` method.

Now that we have a way to authenticate a connection we can move onto the channel. Inside the same directory as your connection.rb file is a file called `channel.rb`. We don't need to do anything with this file but note if you have several channels that implement the same methods you can instead write then inside the `Channel` class in this file and all channels you create will have it available as they inherit from this class.

We also have inside the `channels` directory a file named `room_channel.rb`. This was created for us when we ran our generator. If you open up that file you'll see it has created a class `RoomChannel` that as mentioned above inherits from `ApplicationCable::Channel` along with two methods. `subscribed` and `unsubscribed`.

You may have already worked out the `subscribed` method is called whenever a client connects to this channel and `unsubscribed` is called when a client disconnects. As an example lets say you want to keep track of how many connections are currently active for that channel. There are a few approaches you can take but lets say you keep a class variable that you add 1 to when someone subscribes, when they unsubscribe you'd want to minus 1. That would be a use for `unsubscribed`.

For our use case we are going to use the RoomChannel for all rooms. When they connect we will want to identify the particular room and set up our stream for that room. How we can do this is on the client side we can send any number of parameters across when the connection is made. We can use that parameter to identify the room and set up the stream.

Inside our `subscribed` method in the `RoomChannel` class let's find a room using a parameter we haven't yet passed from the client and then use that to set up a stream.

```ruby
def subscribed
  room = Room.find(params[:room])
  stream_for room
end
```

What is happening here is when a client connects to our RoomChannel and provides a room parameter, which will be the id of the room, we find the room and then set the stream_for that particular room. Elsewhere in our appliation when we have something to broadcast to our room we can provide a Room object from the database and our stream will ensure the data is sent to that room.

Along with `stream_for` there is a `stream_from` method. Either could be used but `stream_for` is provided when you want to broadcast to a specific model, a room in our case. It's really just a convenience wrapper of stream_from. Whereas `stream_from` expects a string, `stream_for` expects a model object and forms the string that `stream_from` requires.

We could have written the subscribed method as

```ruby
def subscribed
  stream_from "room_channel_#{params[:room]}"
end
```

When working with a model object it's easier to use `stream_for`.

The next thing we need to deal with is the client side. This will be the code ran in the browser of whoever uses our chat app. With Rails 6 all Javascript now lives in the `app/javascript` directory. Have a look in there and you will notice there is a `channels` directory there with 3 files. `consumer.js`, `index.js` and `room_channel.js`.

The consumer and index files are created with the `rails new` command and the room_channel directory was created when we ran the generator to create the channel. We don't really need to concern ourselves with the two created with the Rails app, the consumer file just imports the javascript code in the actioncable package in node_modules and then exports it and the index file just requires all the files that live in the channels directory.

Inside `room_channel` is where the magic happens. Open the file. Firstly we can see it imports the code exported in the `channel` file. Then calls `subscriptions.create` on it and passes "RoomChannel" as an argument along with an object that provides 3 methods. `connected()`, `disconnected()` and `received()`.

`connected()` and `disconnected()` do the same as `subscribed` and `unsubscribed` but on the client side. So when your browser establishes a connection to the server it will run the `connected()` method and when it closes it will run `disconnected()`.

`received()` is the interesting function to us in that it is executed each time the server sends new data through the websocket. There are a couple of things we need to do here.

Firstly, if you recall our subscribe method we need to pass a `room` parameter. Then once we get our room connected we need to handle receiving data.

To pass our room parameter we need to be able to access it using Javascript. The easiest way to do that is to open our `app/views/rooms/show.html.erb` file and right at the top add a div with a data attribute of the room id. Then in the room_channel file we can grab it using some javascript and pass it as an argument to the room directory.

Open the `show.html.erb` file and add the following

```html
<div id="room_id" data-room=<%= @room.id %>></div>
```

We give it an id to be able to find it easily and then set the data attribute to `@room.id`. Nothing complicated. Now back in our `room_channel.js` file we can find the element and grab the value held in the room data attribute. You may think we can just do something like

```javascript
const roomElement = document.querySelector('#room_id')
const room = roomElement.dataset.room
```

The code is valid but it wouldn't work. This is because the javascript code is downloaded when somebody first loads our app and then executed. So as soon as someone opened up the homepage the code above would run and roomElement would return null. We'd then get errors trying to access it's dataset.

What we actually want to do is each time a new page is loaded check to see if the element exists, and if it does then grab the attribute. The element will only exist when a chatroom is loaded. We've already covered an event listener that will allow us to do this, `turbolinks:load`. If we didn't need to pass any parameters when opening the connection, or if they were static parameters then we wouldn't need to do this. We could just allow the connection to open when the client connected to the server.

In our case we need a new connection to be made when a user joins a chatroom so we need to potentially create a connection several times as they move between chatrooms. As the turbolinks event listener fires each time a page is loaded we need to use this, and also means we need to wrap our entire room_channel connection inside the event listener.

```javascript
import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  let room
  const roomElement = document.querySelector('#room_id')
  if (roomElement) {
    room = roomElement.dataset.room
  }

  consumer.subscriptions.create("RoomChannel", {
    connected() {

    },

    disconnected() {

    },

    received(data) {

    },
  });
})
```

We declare room at the top because `let` ensures the variable is block scoped so wouldn't be available outside the if statement otherwise. We then query for the element with a `room_id` id and if it exists we get its room data attribute.

The next step is to actually pass the data attribute as our `room` parameter to our server so it can set up the websocket for that room. We do this by passing an object as the first argument to the `create` function instead of a string. The object must have `channel` as its first property which should have the name of the channel it should try to connect to. 

Change the line with `consumer.subscriptions` to the following

```javascript
consumer.subscriptions.create({channel: "RoomChannel", room: room}, {
  // ...
})
```

Here we are passing a paramater called `room` to the connection. Recall when the subscription is made on the server we look for a `room` param

```ruby
stream_from "room_channel_#{params[:room]}"
```

So on the client side in our javascript we are simply passing the id of the room we need to subscribe to. To ensure this is working let's just add a console log to the `connected()` function so that we can be sure our room has connected ok.

```javascript
console.log(`connected to room: ${room}`)
```

With a Rails server running, navigate to the rooms page in your browser (make sure you are logged in) and ensure you have devtools open with the javascript console tab open and then click on a room. You should see a message printed to the console that the room is connected along with the id of the room. We now have an open connection between the server and the client. Totally Rad! You can remove the console log statement now. We don't need it.

What we do need to do is when a new message is created and saved to the database we need to send that message to our room channel to be broadcast to any subscribers. If you refer to the Rails Guides section on [broadcasting](https://guides.rubyonrails.org/action_cable_overview.html#broadcasting) you'll see Rails gives us a `broadcast_to` method which we can call on any channel we've created. The first argument to `broadcast_to` is the channel we want to broadcast to. In the example in the Rails guides they broadcast to the current user which you would do if you had set up a seperate channel for each user and wanted to broadcast a message directly to them. In our case we have set up a channel for a room. That means the first argument we need to provide is the room object. Technically it is the id of the room object we use because we subscribed users to the rooms channel using the room id. So a user subscribing to a room with an id of "1" will be subscribed to the `rooms:1` channel and receive any messages broadcasted there.

After the first argument being the room we want to broadcast to we can then pass in a hash of arguments that would then be broadcast to all subscribers. As the message is being sent to the client and picked up by a javascript file it is converted to json. Rails does this by calling an `as_json` method available on all model objects which converts the object including all attributes into a json object. So if we only wanted to send the message then we could just call the `broadcast_to` method passing in `@room` and `@message` objects in our message controllers create method. For the `@message` Rails would call `as_json` and ensure the data passed to the client was in a format it could understand. However as we discovered when we were displaying messages we also need the details of the user who created the message. This isn't automatically done when `as_json` is called on an object becuase by default it only converts the object itself to json. We avoided the n+1 issue earlier by ensuring when we retrieved the messages from the database we also obtained details of the users. We can do something similar here by specifically calling the `as_json` method on our `@message` object and passing a hash as an argument. The hash will have a key of `include:` and a value being a symbol of the association to include, in our case `:user`. If you wanted to include more than one association you could pass an array of symbols representing the associations you want to include in the json.

Open up the rooms controller and inside the create method add the following line at the bottom

```ruby
def create
  # ...
  RoomChannel.broadcast_to @room, @message.as_json(include: :user)
end
```

Now, whenever a message is created we can broadcast to the RoomChannel and any subscribers will receive the information pushed into the published queue. If you look again at the room_channel.js file then you will see a `received()` function with a `data` argument being passed to it. This function is called each time a new broadcast is received by a subscriber to the channel. We can see what is being passed from the server to the client through this channel by throwing a log statement inside and inspecting the console when we send a message.

```javascript
received(data) {
  console.log(data)
}
```

If you still have the server running with a room open refresh the browser and send a message. You should see in the devtools console a representation of the data received through the websocket

```javascript
created_at: "2020-09-15T11:06:13.168Z"
id: 81
message: "hello"
room_id: 2
updated_at: "2020-09-15T11:06:13.168Z"
user: {
  created_at: "2020-08-26T14:22:11.211Z"
  email: "bob@bob.com"
  id: 1
  updated_at: "2020-08-26T14:22:11.211Z"
  username: "bob"
}
```

You may need to expand the message to see all of the information like this. One thing that should leap out at you is how many unnecessary fields there are here. It would be better to send only those fields which are required. That will be a good exercise for you to try on your own later. For now let's first ensure we can add this message to the screen without having to refresh.

The steps we need to take now are:

- From the data received we need to create the html to be added into the form
- We need to make sure we insert the message in the appropriate place
- We need to ensure the message page moves to the bottom of the screen so the user doesn't have to scroll to see it.

In order to create the html we could use the old school way of creating the elements in Javascript using `createElement` and then adding classes with `classList.add` and then appending everything inside other elements we've created but the resulting Javascript is messy and pretty horrible to read. There is another way. Templates. We can write a function that produces an HTML template as a string, inserting the data received in the correct place. We can then append that string as HTML in the correct place in our chatroom.

The template we need has already been created in our rooms show view when we iterate the existing messsages for a room. Open up the show page and take a look at the part where we iterate the `@messages` variable.

```html
<% @messages.each do |message| %>
  <div class="message">
    <div class="message-header">
      <%= message.user.username %>
    </div>
    <div class="message-body">
      <%= message.text %>
    </div>
  </div>
<% end %>
```

The part inside the Ruby each iterator is the template we need to display messages. Inside our room_channel.js inside the received function we can use the data json received to populate this template.

```javascript
received(data) {
  const html = `
    <div class="message">
      <div class="message-header">
        ${data.user.username}
      </div>
      <div class="message-body">
        ${data.message}
      </div>
    </div>
  `
  }
```

This uses a javascript template literal which uses backticks to create a string in which we can interpolate javascript code. We could have done it using a series of `+` to join the various strings together but it looks terrible and is prone to typos.

Now that we have our html string we need to insert it into the DOM. We can do this by getting a reference to the element that houses all our messages. This is a div on the rooms show page with a class of "message-box". There is only one element on the page with that class and it is unlikely to change so we can use that to get a reference to the element we want to append our message template to

```javascript
received(data) {
  const html = // etc
  const messageBox = document.querySelector('.message-box')
}
```

Now we can use [insertAdjacentHTML](https://devdocs.io/dom/element/insertadjacenthtml) to append the HTML in the correct place. Looking at the options on that link, `beforeend` states it places the HTML just inside the child, after its last child.

```javascript
received(data) {
  const html = // etc
  const messageBox = // etc
  messageBox.insertAdjacentHTML("beforeend", html)
}
```

That inserts the HTML correctly. Now all we need to do is make sure the page scrolls to the bottom. This is accomplished by setting the `scrollTop` position of messageBox to its `scrollHeight`.

```javascript
received(data) {
  // ...
  messageBox.scrollTop = messageBox.scrollHeight
}
```

While we're considering this, it would also be nice if when the room page loaded it scrolled to the bottom of the messages. In our `app/javascript/room_messages` folder in the create.js file we made earlier we already do a check for whether the form for submitting a message exists. If it does we add an event listener to listen for form submission. Since the form is only available on the same page we can use the same turbolinks event listener to set the scroll position of the message box.

Open up the create js file in the room_messages folder and add the following lines

```javascript
document.addEventListener("turbolinks:load", () => {
  // ..
  if(form) {
    const messageBox = document.querySelector('.message-box')
    messageBox.scrollTop = messageBox.scrollHeight
    // ..
  }
})
```

Now if you refresh your browser and load up a room you should see the messages scrolled to the latest ones and if you submit a new message you should see it be added to the screen and the scroll position update.
