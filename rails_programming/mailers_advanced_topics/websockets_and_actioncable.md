### Introduction

When you think about a typical interaction between a client and website, a browser makes a request to the server and after that request has completed the server closes the connection.

There are often times where you want to keep that connection open so that the server can update the client if there is something relevant for the user. For that we have WebSockets and Action Cable brings WebSockets to Rails in an easy to use way.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment.

* What is a WebSocket?
* What options did developers have before WebSockets to update a client without a user request?
* What is a consumer?
* What is a subscriber?
* What is a channel?
* What is a stream?
* How can you broadcast to a stream from the server?

### What is a WebSocket?

Before diving into Action Cable specifics we should first understand what a WebSocket is and what problem it seeks to solve.

The WebSocket API was created to allow two-way communication between a server and a client. A typical http connection between a server and client opens and closes as the client requests something. A WebSocket connection keeps the http connection alive so that the server can send updates to the client without a specific request being made.

A WebSocket manages the connection between server and client as well as sends and receives data through that connection.

To understand what problem WebSockets solve let us consider an example of where WebSockets may be useful and then consider what our options would have been prior to the WebSocket API.

Let us imagine we've built an awesome new social media app, Chewbooka. A place to be our true selves and talk all things Chewbacca. One key feature for our app, to make us all billions, is that when someone creates a new post extolling the virtues of Peter Mayhew, that all the other users connected to our app receive that post without having to manually refresh for updates.

We'll be rich! But, in a time before WebSockets, how are we going to solve it?

We could use Javascript to set an interval to reach out to the server at regular intervals to see if there are any updates. If there are we could notify users of the new post and update their view and if there wasn't we can just return an empty response. This still involves opening and closing a request on the sever. This was a technique know as polling and was one of the first ways websites tried to bring server updates to the client. The downside to this was one of efficiency. If there were no updates for the client it would still request an update from the server. In an age of capped internet usage this was a big no.

Since we don't want the inefficiency of checking for an update when there isn't one. What if instead we allow a client to send an http request and if there is no new information, instead of sending an empty response and closing the connection, we instead hold the request open on the server side. When we have a new post we can send that response to any open http requests being held and that will complete the http request and close the connection. Then the client can simply send a new request to open the connection again. This is known as long-polling and is still in operation on many sites. The downside of this approach is that it's very server intensive to keep receiving requests and holding them open for an indefinite time and if order is important in the response you may have issues if there are several updates between requests. You may have come across this in the past on some sites where the order of updates changed if you refreshed the page. Some old chatrooms did this.

There are some other approaches used, such as Java applets or Cross Frame Communication but ultimately they all had some pretty big drawbacks. The internet was not initially designed for these kinds of requests.

If our app is going to make it. If we want to give the world Chewbooka. We need something else...

WebSockets were created for this. Our moment is now!

### WebSockets and Action Cable

In earlier versions of Rails, when WebSockets first came onto the scene, there was no easy way to integrate them into an app. A lot of gems came about to solve this problem but ultimately they were a little bit hacky. Eventually, with Rails 5, came Action Cable. A built in way to support WebSockets the Rails way. It's evolved quite a bit since then to make the integration even more seamless and now it's easy to get up and running with WebSockets. We'll cover the basics here which should give you the platform to go and use them yourself when you find a use case in your own apps.

#### Terminology

The first thing we need to cover is some of the terminology you'll come across with Action Cable.

Action Cable uses a server to handle connections. A single user may have several connections open to the same server, such as if they were using multiple tabs in their browser to visit your website but for simplicity most people will just use one browser tab to visit a site and therefore they would hold one connection to the Action Cable server. The client of that connection is called a consumer.

Although a consumer holds one connection to the cable server they can subscribe, through that connection, to multiple channels. A channel should represent one logical piece of work. When a consumer subscribes to a channel, they become known as a subscriber and the connection becomes known as a subscription.

Once subscribed, each channel can then stream what are known as 'broadcastings' to subscribers. Such as new posts to Chewbooka.

There is quite a bit of terminology here, and also these are handled on both the client and server side, so it is a lot to consider, but Rails does a lot of the heavy lifting for us.

When going through the layers of Action Cable it's helpful to have a real Rails app to refer to. If you still have your Rails install cars project on hand that would be ideal for looking through the files as we mention them here to get familar with where they are. If not just spinning up a new Rails app would also work fine.

We'll handle server side and client side concerns seperately to try and keep things simple.

Let's first look at the default files that come with a new Rails app for handling WebSockets. Then we can look at how to create a new channel and what comes with that.

### Server side concerns

#### Connections

As mentioned earlier, every WebSocket accepted by the server creates a connection which manages all the channels that a user subscribes to. The connection itself simply deals with authentication and authorization. The client of this connection object is called a consumer.

If you have a Rails app handy open up `app/channels/application_cable/connection.rb`

~~~ruby
module ApplicationCable
  class Connection < ActionCable::Connection::Base
  end
end
~~~

You use the class above to authorize the incoming connection. You can use any logic you want to uniquely identify a user. If you use devise or a similar gem and only want logged in users to be authorised then you can use that to verify the incoming connection.

You can see an example of how you would do that in the Rails Guides section on [Action Cable connections](https://guides.rubyonrails.org/action_cable_overview.html#connection-setup). Here they look for an encrypted cookie with user_id to verify a connection so would assume you set a cookie in this way. As you may know devise does set a cookie in the session. However because Action Cable operates on its own separate server for WebSockets, it doesn't have access to the session. Instead we can use the warden environment variable object. It does this as Devise is built on top of [Warden](https://github.com/wardencommunity/warden/wiki) and sets the user on the warden middleware object.

So if you are using devise a neat way to verify a connection is to use the following in your `find_verified_user` method

~~~ruby
def find_verified_user
  if verified_user == env['warden'].user
    verified_user
  else
    reject_unauthorized_connection
  end
end
~~~

There are lots of ways to authorise a connection. You might want it to be available for all users, even those not logged in for example. There are a range of options so we'll leave it to you to investigate if you ever have a need for a different way.

#### Channels

A channel is a logical unit of work, not too different from what a controller does in a Rails app. It handles the incoming and outgoing information through a particular channel. If you do have a Rails app handy then you can take a look at `app/channels/application_cable/channel.rb`. This is the parent channel that any channels you create inherit from. This is where you can put any logic that should be shared across multiple channels rather than duplicating code.

#### Subscriptions

Each channel you create can be subscribed to by one or more clients. Messages can then be broadcast to that channel who will forward it to any subscribers.


### Client side concerns

#### Connections

Consumers of subscriptions require an instance of the connection on the client side also. This is so when the server broadcasts a message it can be picked up and handled by the browser. Rails generates this boilerplate for you by default and the files live in `app/javascript/channels`.

#### Connect consumer

This lives in `app/javascript/channels/consumer.js`

~~~javascript
import { createConsumer } from "@rails/actioncable"

export default createConsumer()
~~~

This code creates a consumer that will try to establish a connection to `/cable` on your server. All channels you create will import this file and use it to create a subscription to the server.

### Creating channels

Now that we've learned the basics of how Rails handles creating a WebSocket connection between server and client let us turn our attention to how to create a channel and what files this produces.

#### Rails channel generator

Unsurprisingly Rails gives us a generator we can use to create new channels. This creates all the boilerplate code we can use to make getting started simple.

The command is pretty simple. Imagine we wanted to create a WebSocket connection for a chatroom. We would write the following in the terminal

~~~bash
rails generate channel room
~~~

This will create the following files

~~~bash
   create  app/channels/room_channel.rb
identical  app/javascript/channels/index.js
identical  app/javascript/channels/consumer.js
   create  app/javascript/channels/room_channel.js
~~~

You can see here it does try to create all files we would need and if any exist, such as our consumer.js file then it doesn't overwrite them.

### Client-server interactions

Let's take a closer look at the chat_channel.rb and chat_channel.js files that were created by the generator.

As mentioned earlier the generator will create a channel in the `app/channels` directory. In our example it was `room_channel.rb` which produces some boilerplate code

~~~ruby
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
~~~

#### Streams

Streams are how Rails publish broadcasts to subscribers. In order to register a subscription, once a connection is established, the subscribed method is called which should set up the stream.

Action Cable gives us two stream options. `stream_from` and `stream_for`.

The difference is that `stream_from` expects a string to identify the stream whereas `stream_for` operates on a model. Ultimately they produce something similar.

~~~ruby
def subscribed
  stream_from "room"
end

def subscribed
  room = Room.find_by(name: 'someroom')
  stream_for room
end
~~~

So you would reach for `stream_for` when you have a specific model you want to use for the stream. To give an example imagine our chat room scenario. You may want to subscribe to the chatroom and broadcast when a message is created in that room. Using `stream_for` means we can let Rails do the heavy lifting of setting up the stream so we can broadcast using the room object (this will make sense in a moment when we look at the broadcast options).

You can also pass parameters from the client to the server and use those to generate a stream. We'll look at how to do that on the client side shortly. On the server side it's not that much different from how you'd handle it in a controller


~~~ruby
def subscribed
  stream_from "room_#{params[:room]}"
end

def subscribed
  room = Room.find(params[:id])
  stream_for room
end
~~~

#### Broadcasting

Once you have the WebSocket server set up you then just need to broadcast to it from wherever is appropriate in your app, usually it would be a controller.

Like streams, there are a couple of ways you can broadcast.

If you used `stream_for` then you can call `broadcast_to` directly on the room channel object itself, using it this way you'd pass at least two arguments. The first argument would be the room object that you initially set up the stream on, the other arguments would be the data you want to broadcast. This can either be a list of key value pairs, or an object that responds to `to_json` because ultimately the data is streamed in a json convertible format.

Following our earlier example of setting up a stream on a room, you may have a message controller where you create messages for an associated room. Your create method may look something like

~~~ruby
def create
  @room = Room.find(params[:id])
  @message = @room.messages.build(message_params)
  @message.save

  # You can then broadcast to the room like follows
  RoomChannel.broadcast_to(@room, @message)
end
~~~

Rails automatically calls `to_json` on our message object. The alternative syntax would look something like

~~~ruby
RoomChannel.broadcast_to(@room, name: 'Kevin', dork_status: 'Ultimate')
~~~

Here Rails calls `to_json` on the arguments as a Hash object.

The other way to broadcast a stream is to broadcast it directly from the ApplicationCable server. Why might you want to do this? If you didn't set up the stream on an object, but instead used `stream_from`, then using `broadcast_to` on RoomChannel will look for a stream with a particular name format. Going back to our chat example if you had set the stream up as

~~~ruby
stream_from "room"
~~~

And then tried to call

~~~ruby
RoomChannel.broadcast_to("room" @message)
~~~

Then Rails will look for a stream called `room:room`. This is just how Action Cable works. When you use `stream_for room` it actually creates the stream as `room:<some_room_id>` so the format is correct when you then later call `RoomChannel.broadcast_to(@room, @message)`. It would look for the stream `room:<the_room_id>`.

So if you just wanted to call broadcast on a stream set up as a string using `stream_from`, you could write in the controller

~~~ruby
ActionCable.server.broadcast 'message', @message
~~~

This way we can just hit the server directly looking for a stream with the relevant name. It might take a little getting used to but the approach you take really depends on how you set up the stream.

#### Client subscriptions

Going back to our earlier channel generator the other file it generated for us was `app/javascript/channels/room_channel.js`. This is pretty straightforward with only a couple of things we need to concern ourselves with at this time. Let's take a look at the default file it generated for us

~~~javascript
import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
~~~

Note it imports our consumer from the consumer.js file we discussed earlier. Then it calls `subscriptions.create` on the consumer. We don't need to really dive into how this works under the hood but we just need to understand a couple of key points.

The first is that that the first argument is given as a string. This would try to connect to the `RoomChannel` channel on the server. It doesn't have to be a string though. Remember those parameters we discussed earlier, this is where you can pass them. Instead of a string you can instead pass an object. The first key-value pair must be in the format `channel: 'ChannelName'`, and then afterwards you can pass in any number of key-value pairs which becomes the parameters sent to the server to establish a connection. Let's say we want to send the id of a room to our RoomChannel. We could write that first line as follows

~~~javascript
consumer.subscriptions.create({channel: 'RoomChannel', room: 1}, {
~~~

We could then access the parameters in the RoomChannel on the server side as

~~~ruby
room = Room.find(params[:room])
~~~

This allows you to set multiple streams to the same channel by providing different parameters. When might this be useful? A couple of examples are registering to different chatrooms using the same channel object or how about subscribing to different notifications for different programming languages? They'd have to go through the same NotificationChannel but you would want to send relevant data only to those who subscribed to the relevant notification. Params are the way to do it.

The second argument is another object containing three pre-defined functions. `connected()` and `disconnected()` are called when the channel first connects and disconnects from the server. `received(data)` is where you'll spend most of your time focusing. This is called everytime something is broadcast through the stream. What you do here will depend on your app but will usually involve appending something to the DOM, or alerting a user to a new message etc.

You can add additional functions to the object to help you process the data. The data will be in json format.

### A few last things

It is possible for a client to send a message to the server and for the server to rebroadcast that message to others. You can read the short section in the [Rails Guides](https://guides.rubyonrails.org/action_cable_overview.html#rebroadcasting-a-message) if you are interested.

If you want to send dynamic parameters from the client when setting up the server care needs to be taken. You can only get params once the DOM has rendered and it's common to therefore wrap code in a `turbolinks:load` event listener. Because of this if you aren't careful, you can end up subscribing the same stream multiple times as you navigate pages. Action Cable doesn't check if you are already subscribed to a stream before doing it again, because this might be intended behaviour for your app they can't only allow one connection to a channel. This is connected with the way turbolinks works. You can read this [Stack Overflow](https://stackoverflow.com/questions/39541259/rails-actioncable-turbolinks-chat-issue-posting-duplicate-messages) post where others have experienced this behaviour.

For testing and development Action Cable uses an async adapter to work, but in Production it defaults to looking for a redis server. You will need to ensure you have one working if you want to get it up and running on Heroku or another service.

The connection only remains active while the http request remains unbroken. Refreshing the browser or navigating to a new page sever the connection and then will look to establish it again on reconnection.

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Make sure you've read through all of the [Rails Guides on Action Cable](https://guides.rubyonrails.org/action_cable_overview.html). They even have some full stack examples which you may find useful.
  2. Follow along with this [Simple Messaging App](https://github.com/TheOdinProject/curriculum/blob/main/rails_programming/mailers_advanced_topics/actioncable_lesson.md) that we've written to give you a taste of introducing Action Cable to a project
</div>

### Conclusion

There is more to Action Cable but it's still quite a niche use case so it's not something you should seek to use on every app you build. Look to keep it simple and only introduce WebSockets when you see a real opportunity to add value to your site.


