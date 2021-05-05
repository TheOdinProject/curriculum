### Introduction

This is a simple follow along lesson to show you how Action Cable can be used to enhance an application to give it real time features. We won't explain everything in detail, as much of the setup instructions should be familiar to you but will take the time around the Action Cable specific content to explain things a little more.

The app we'll build will be in two stages. The first stage will be an app for sending messages only viewable to those currently logged in. We'll then build on it in the second stage to save the messages so that they are also viewable to anyone who logs in in the future.

### Setup

First let's create the app

~~~bash
rails new messager -T
~~~

Add devise to the Gemfile

~~~bash
bundle add devise
~~~

`bundle add` both adds the gem to our Gemfile and runs bundle install. The good thing about it is it also sets the gem version to its latest variant. The down side is that it adds the gems to the bottom of the Gemfile by default. So use it with caution. There are a few flags that can be used. You can have a read about it [here](https://bundler.io/man/bundle-add.1.html).

Run the devise installer

~~~bash
bundle exec rails generate devise:install
~~~

Open `config/environments/development.rb` and add the following line

~~~ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
~~~

Generate our user model and migrate

~~~bash
bundle exec rails generate devise user && bundle exec rails db:migrate
~~~

To keep things simple we'll just create a couple of users in `db/seeds.rb`

~~~ruby
User.create(email: 'humblebragger@humblebrag.com', password: 'humblebaby')
User.create(email: 'fitnessgrampacer@test.com', password: 'pacertest')
~~~

You can set the user info to whatever you want. Then run the seed file

~~~
bundle exec rails db:seed
~~~

Let's create a simple one page app, users will land on our homepage, get redirected to log in, and then directed back to the homepage. First let's create a controller. We'll just call it `hangouts` as our users will hangout there doing absolutely nothing.

~~~bash
bundle exec rails generate controller hangouts index
~~~

Set the root to our index page in `routes.rb`

~~~ruby
root 'hangouts#index'
~~~

Let's also protect our app from unauthorised viewing by adding the following to `app/controllers/application_controller.rb`

~~~ruby
before_action :authenticate_user!
~~~

Lastly in the initial setup, let's add a little bit of styling with the Bulma gem and a navbar just with some login and logout functionality.

~~~bash
bundle add bulma-rails
~~~

Next, and just to save some time you need to go to the `app/assets/stylesheets/` directory and change `application.css` to `application.scss`. Bulma-rails uses scss and although there are other ways to handle it this is the easiest.

Now open the `application.scss` file and right at the bottom add

~~~css
@import "bulma";
~~~

Lastly, to add the navbar functionality we can just add it straight into the main layout file. Open `app/views/layouts/application.html.erb` add the following code right below the opening `<body>` tag and above the `<%= yield %>` line.

~~~html
<nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-end">
    <div class="navbar-item">
      <div class="buttons">
        <% if current_user %>
          <%= link_to "Logout", destroy_user_session_path, method: :delete, class: 'button is-link' %>
        <% else %>
          <%= link_to "Login", new_user_session_path, class: 'button is-link' %>
        <% end %>
      </div>
    </div>
  </div>
</nav>
~~~

This mostly is just using Bulma stylings to make it look nice.

Now if you were to spin up a server and open localhost in a browser you should need to log in to access the homepage and be able to logout using the button in the navbar. The login button is actually pretty redundant since as soon as you logout you get taken to the login screen because the app is protected, but it is what it is.

### Action Cable

Let's now deal with setting up the server connection. As we covered in the Action Cable lesson, the connection manages all the channels that a client subscribes to and deals with authentication and authorization.

If you open up `app/channels/connection.rb` we can authorise a connection when the user logs in. The code is pretty identical to the [connection](https://guides.rubyonrails.org/action_cable_overview.html#server-side-components-connections) found in the Rails Guides on Action Cable, with the only difference being we can use the user details set on the warden object environment variable.

~~~ruby
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
~~~

This is used to establish a connection between client and server but it won't do anything until you create a channel. It is the channel that makes a request to the websocket server that then starts the connection authorization.

We can create a channel for messages. In the terminal we can write

~~~bash
bundle exec rails generate channel message
~~~

You can see from the output it creates some files for us

~~~bash
      create  app/channels/message_channel.rb
   identical  app/javascript/channels/index.js
   identical  app/javascript/channels/consumer.js
      create  app/javascript/channels/message_channel.js
~~~

The index and consumer js files already exist. Nice! But it has created a message_channel.rb and message_channel.js file

In `app/channels/message_channel.rb` let's establish our stream. Remember, streams are how Rails publishes broadcasts to subscribers. We won't be operating on a model so we won't need `stream_for`. We can instead use `stream_from` to just stream to our message room.

~~~ruby
class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'message'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
~~~

Now that our stream is setup you should see in the server logs when you refresh that you are connected to the channel with `MessageChannel is streaming from message`. Nice.

The next thing we need is a display for our messages and a form in which to post them on our index page. Open up `app/views/hangouts/index.html.erb` and add the following code

~~~html
<div>
  <div id="message-display">
  </div>
  <div id="message-form">
    <form action="" id="message-form">
      <div class="field has-addons">
        <div class="control">
          <input class="input" id="message-input" type="text">
        </div>
        <div class="control">
          <input type="submit" value="Send Message" class="button is-primary">
        </div>
      </div>
    </form>
  </div>
</div>
~~~

We've written a div with an id of `message-display` where we can display the messages as they are created and then we have a form. The form doesn't have an action because we aren't posting it anywhere. We'll need to grab a reference to the form in our javascript and when it's submitted we can post a message to the websocket server. We use a basic html form because we don't have an object or url to work with so Rails form helpers aren't much use to us. We can change this later when we do create a Message object to work with. All the class names are Bulma stylings so don't worry too much about the markup.

I'm not going to stress about the page looking amazing. But just to make the message display area a decent size open up `app/assets/stylesheets/hangouts.scss` and add the following code.

~~~css
#message-display {
  height: 80vh;
  overflow: auto
}

#message-input {
  width: 60vw;
}
~~~

Now when the form is submitted, we need to intercept and handle it. Open up our `app/javascript/channels/message_channel.js` and take a look at the code as it stands.

~~~js
import consumer from "./consumer"

const messageChannel = consumer.subscriptions.create("MessageChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
  }
});
~~~

Yours will have some comments that aren't important, but you will need to verify that the constant `messageChannel` is declared. What we need to do here first is set an event listener on the form submit so we can grab the value entered. Once we have the value, we want to send it to the server to be broadcast to all the channel subscribers. This is called rebroadcasting and you can see how it works [In the Rails Guides](https://guides.rubyonrails.org/action_cable_overview.html#rebroadcasting-a-message). We can use `MessageChannel.send` to send the value entered in the input box to our websocket server.

Right at the bottom of our `message_channel.js` file add the following code

~~~js
document.addEventListener("turbolinks:load", () => {
  let form = document.querySelector('#message-form')
  if(form) {
    form.addEventListener('submit', (e) => {
      e.preventDefault()
      let messageInput = document.querySelector('#message-input').value
      if(messageInput == '') return;
      const message = {
        body: messageInput
      }
      messageChannel.send({message: message})
    })
  }
})
~~~

Firstly, since JS assets are loaded in the head of our html, the Javascript files will be evaluated often before the DOM has rendered, so we first want to make sure the DOM has been created. We do this using the `turbolinks:load` event listener. Then we want to check if we are on a page with the form. It might seem obvious since we only have one page but you can never be too careful...

Next if we are on a page with the form we add an event listener to it on its submit property. When the form is submitted we first prevent the default submit from happening. This stops the page rerendering. Then we grab the value from our input field and check it isn't an empty string. If it is we simply return and do nothing. If it isn't, then we create a JS object with a key named `body` which holds the value of our messageInput. If you're wondering why I did this under it's own object instead of just sending `message: messageInput` in the send method it's because often you'll submit more than one parameter, and when we do create a Message Model this is similar to how it will be returned from a controller.

The last part of our code is the important bit. We call `send` on `messageChannel` and pass it an object with a key of `message` and a value of the message object we create earlier. You can see we create `messageChannel` in this line `const messageChannel = consumer.subscriptions.create("MessageChannel", {`. So it holds a reference to the channel created for message. When we call `send` on it, Rails knows to route it to the message_channel on the server side. If you save this file and refresh your browser if you have a rails server running you should be able to submit a message without the page refreshing. Check the server logs and you should see something like

~~~bash
Unable to process MessageChannel#receive({"message"=>{"body"=>"hello"}})
~~~

This is because we're missing the server side handling of our message submitted to the server. The Rails Guides section linked above on rebroadcasting shows a `receive` method on the server side to handle incoming messages from the client.

Open up `app/channels/message_channel.rb` and underneath the `unsubscribed` method lets add the receive method

~~~ruby
def receive(data)
  ActionCable.server.broadcast('message', data)
end
~~~

Rails handles routing any incoming message from a client to the `receive` method on the class representing the channel through which the message was sent. In our `receive` method we simply broadcast the message right back to all subscribers of the `message` stream. Sending it right back might seem strange but it's how we can ensure a message created on one client gets sent to all other clients subscribed to the channel without them having to refresh their browser. This is one of the main benefits of WebSockets.

When data is broadcast to subscriber it goes right back to the client side to the object handling the connection to the websocket channel. In this case it's our `messageChannel` that references the connection. Data received here goes, funnily enough, to the `received` function of our messageChannel object in `message_channel.js`. Inside `received` we need to use the data received to create a template for the message so we can display it and we then want to append it to our `#message-display` div. In order to create a template we can use Javascript string template literals. Underneath the `received` function add a new function called `template` that will receive the data and return an html string. The template does use some Bulma stylings so don't worry about the actual markup. It could be any html.

~~~js
const messageChannel = consumer.subscriptions.create("MessageChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
  },

  template(data) {
    return `<article class="message">
              <div class="message-header">
                <p>${data.user.email}</p>
              </div>
              <div class="message-body">
                <p>${data.message.body}</p>
              </div>
            </article>`
  }
});
~~~

Don't forget to add a comma after the received function.

To get the message to display in our view we first find the div with the id of `message-display` that we created in our hangouts index view. We can then create the template and insert it into the document. This will happen in our `received()` function which handles incoming messages from the websocket server.

~~~js
received(data) {
  const messageDisplay = document.querySelector('#message-display')
  messageDisplay.insertAdjacentHTML('beforeend', this.template(data))
}
~~~

If you try this now you will get an error. That is because the data received doesn't know anything about the user so in our template where we write `${data.user.email}` it won't have a reference to the user.

To fix this we need to go back to our `receive` method in `message_channel.rb`. Recall it currently looks like

~~~ruby
def receive(data)
  ActionCable.server.broadcast('message', data)
end
~~~

To fix this we just need to set user on data. Remember data was json that has been turned into a hash object in our Ruby code. And we have access to the user who sent the message from `current_user`.

~~~ruby
def receive(data)
  data['user'] = current_user
  ActionCable.server.broadcast('message', data)
end
~~~

data will then be converted back to JSON as it gets sent back to the client to be handled in the js file. Not bad.

Now if you log in and try and post a message you should get it nicely displayed. Open a private browser window and log in as your other user. Post some messages there with the other user too. The cool thing about our app currently is that it works as a secret meeting place. Only current logged in users will ever see the messages as they post. Anyone who joins later will never know what was said earlier.

As cool as that is we will now cover turning the app into something which does save the messages. Strap in!

First things first. We're going to need a message model. We know from our template it needs a `body` of type `string` and we also need to reference the `user` who created it. That's everything for now.

In the terminal type

~~~bash
bundle exec rails generate model message body:string user:references
~~~

And then 

~~~bash
bundle exec rails db:migrate
~~~

Next we need a controller to for our messages. We only need a create action since we aren't doing anything else with them

~~~bash
bundle exec rails generate controller messages
~~~

Then in your `routes.rb` create the resource

~~~ruby
resources :messages, only: [:create]
~~~

In our user model add the other side of the association

~~~ruby
has_many :messages
~~~

We can now create a form using Rails helpers. First in our hangouts controller in the index method we can create a new message object for the form to use

~~~ruby
def index
  @message = Message.new
end
~~~

Then in our hangouts index view we can change the form to use `form_with`. You don't need to change anything else, just remove the form inside of the div with the `message-form` id

~~~html
<%= form_with model: @message, local: false do |f| %>
  <div class="field has-addons">
    <div class="control">
      <%= f.text_field :body, id: 'message-input', class: 'input' %>
    </div>
    <div class="control">
      <%= f.submit 'Send Message', class: 'button is-primary' %>
    </div>
  </div>
<% end %>
~~~

If you try and submit a message now it will still work. That's because in our `message_channel.js` file we still have the code hijacking the submit event and preventing the default. You should now delete the bit of the code. Open the `message_channel.js` file and delete

~~~js
document.addEventListener("turbolinks:load", () => {
  let form = document.querySelector('#message-form')
  if(form) {
    form.addEventListener('submit', (e) => {
      e.preventDefault()
      let messageInput = document.querySelector('#message-input').value
      if(messageInput == '') return;
      const message = {
        body: messageInput
      }
      messageChannel.send({message: message})
    })
  }
})
~~~

Submitting the form now does work in the server logs, but obviously nothing happens. Before we tackle that we firstly need to tackle displaying any current message on page load.

Go back to our hangouts controller and in the index method add the following line

~~~ruby
@messages = Message.all
~~~

Then in our index view let's iterate the messages and display them using the same html as we used in our template. In our hangouts index file in the `message-display` div add the following code.

~~~html
<% @messages.each do |message| %>
  <article class="message">
    <div class="message-header">
      <%= message.user.email %>
    </div>
    <div class="message-body">
      <%= message.body %>
    </div>
  </article>
<% end %>
~~~

Kudos is you noticed the N+1 problem we just introduced. By calling `message.user` for each message. Let's fix that in the hangouts controller index method

~~~ruby
@messages = Message.includes(:user)
~~~

Much better

Now let's deal with our create method in the messages controller

~~~ruby
def create
  @message = current_user.messages.build(message_params)
  @message.save
  ActionCable.server.broadcast('message', @message.as_json(include: :user))
end

private

def message_params
  params.require(:message).permit(:body)
end
~~~

This should all be familar with the exception of `@message.as_json(include: :user)`. To send data to the client through the websocket server it must be in a json like format. If we just supplied `@message` then Rails would call `as_json` itself for us on the object. However, since we want to include the user association we need to call it ourselves.

We just have one last small change to make. If you put a console.log on `data` in the received function you'd see now `body` is a direct property of `data` so in our template function in `message_channel.js` we just need to change `${data.message.body}` to `${data.body}`.

That's it. Try sending messages between your two users and you should see instant real-time messages. As they are now saved nobody will miss any of the banter before they arrived.

### Conclusion

The point here was to show you how Action Cable makes WebSockets pretty easy to work with. You need to have at least a basic knowledge of Javascript to handle things in the client when a message is sent but other than that you can see how powerful this can be. If you have a situation where you need to update all connected clients without waiting for them to refresh, then think WebSockets.

This only scratches the surface of what Action Cable can do, but if you do find yourself in a situation where you think they might be useful you should be able to find what you need with a few searches.
