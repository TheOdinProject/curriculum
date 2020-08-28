### Users

Although we have covered creating your own authentication for our application we'll actually be using devise to do the heavy lifting. You already have a good idea of how devise works under the hood so this is just a case of using a well known gem to ensure our application is secure.

Thinking about our users for a chatroom they can log in using their email and password and like all chatrooms a user should set a username that they wish to identify as.

We want devise to be available for all of our app environments so we can add it to our Gemfile outside of any groups.

Open your Gemfile and just above the line which says `group :development, :test do` add the following line. Make sure it isn't inside any group as we want devise to be available across our application

```ruby
gem 'devise', '~>4.7'
```

Save the file and then in the terminal run `bundle install`

Now that the gem is installed we need to run the generator to give us a devise initial setup.

In the terminal we just need to run

```ruby
rails generate devise:install
```

This will install an initializer where we can configure all of our devise setup options. There are a couple of options that devise needs to be set to operate correctly and they confirm what they are in the terminal when you have run the initializer. You should see something like this

```bash
Some setup you must do manually if you havent yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

     config.action_mailer.default_url_options = { host: 'localhost', port: 3000  }

     In production, :host should be set to the actual host of your application.

     2. Ensure you have defined root_url to *something* in your config/routes.rb.
        For example:

          root to: "home#index"

     3. Ensure you have flash messages in app/views/layouts/application.html.erb.
        For example:

          <p class="notice"><%= notice %></p>
          <p class="alert"><%= alert %></p>

     4. You can copy Devise views (for customization) to your app by running:

          rails g devise:views
```

Number 1 on the list of devise configuration requirements is defining the default url_options in your environment files.

1. Locate and open the config/environments/development.rb file in your text editor.

2. At the bottom of the file, just above the last `end` statement add the following lines

```ruby
# add default url option
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

Make sure to save the file before you close it. The next step is to create the devise model itself

In your terminal run

```bash
rails generate devise User username:string
```

In the db/migrations directory open the devise migration file. Migrations are given a unique reference based on the time it was generated so the filename will look different for each one. At this time there should be only one file in the migrations directory to open.

In the file towards the bottom you should see a line that states `add_index :users, :email, unique: true`. Add a new line beneath that and add the following line

```ruby
add_index :users, :username, unique: true
```

Indexes ensure we are able to access data in the database very quickly. There is a downside in that writing to the database is a fraction slower because it has to maintain the indexes so don't go wild adding an index to every column in your database. We add an index here because we may want to look up a user by their username rather than their email and that is also why we need to ensure a username is unique.

In the same migration file find the line that says `t.string :username`

Change the line so it reads as follows:

```ruby
t.string :username, null: false
```

This will ensure a record cannot be created in the database without a username.

Save and close the file and then in the terminal run

```bash
rails db:migrate
```

This is a good time to stop and write some User model tests. Let's first write some validations and then you can see if you can write the code to make them pass. We've written validations before so they'll mostly seem familiar.

Open up your user_spec.rb in spec/models and add the following validations

```ruby
RSpec.describe User, type: :model do
  before(:example) { User.create(email: 'lettuce@lettuce.com', username: 'lettuce pray', password: 'lettuce') }

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('bob@bob.com').for('email') }
    it { is_expected.not_to allow_value('this_is_a_real_email_i_swear').for(:email) }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it do
      is_expected.to validate_length_of(:username)
        .is_at_least(2).is_at_most(20)
      end
    end
  end
end
```

Remember we need to create the User for the uniqueness validations in the before hook.

The one you haven't seen before is the allow_value which also comes from shoulda-matchers. This allows us to test the [format](https://guides.rubyonrails.org/active_record_validations.html#format) validation. In our case we want an email validation. We could write our own using a regular expression but instead we can use a Ruby provided email validation. So if you do try and write your own code to make these tests pass you will want to format with `URI::MailTo::EMAIL_REGEXP`.

Try writing the code to make these tests pass. We are only testing the email and username here so it should only be two extra lines in the User model. Write the validations below the lines added by devise.

It should looks something like

```ruby
class User < ApplicationRecord
  # ...

  validates :email, presense: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..20 }
end
```

Run the test suite and check that everything is green.

The default views that Devise provide don't look very nice and they only have default email and password fields for creating a new account. This won't work for us because we insist that our users provide a username too. This means we'll need to add a username field to our form and also allow that username parameter to be submitted to the devise controller in the parameters.

In order to generate the views that Devise uses we need to run the following command in our terminal

```bash
rails generate devise:views
```

This creates a long list of files

```bash
invoke  Devise::Generators::SharedViewsGenerator
create    app/views/devise/shared
create    app/views/devise/shared/_error_messages.html.erb
create    app/views/devise/shared/_links.html.erb
invoke  form_for
create    app/views/devise/confirmations
create    app/views/devise/confirmations/new.html.erb
create    app/views/devise/passwords
create    app/views/devise/passwords/edit.html.erb
create    app/views/devise/passwords/new.html.erb
create    app/views/devise/registrations
create    app/views/devise/registrations/edit.html.erb
create    app/views/devise/registrations/new.html.erb
create    app/views/devise/sessions
create    app/views/devise/sessions/new.html.erb
create    app/views/devise/unlocks
create    app/views/devise/unlocks/new.html.erb
invoke  erb
create    app/views/devise/mailer
create    app/views/devise/mailer/confirmation_instructions.html.erb
create    app/views/devise/mailer/email_changed.html.erb
create    app/views/devise/mailer/password_change.html.erb
create    app/views/devise/mailer/reset_password_instructions.html.erb
create    app/views/devise/mailer/unlock_instructions.html.erb
```

We won't need to edit all of these files. The one we need to focus on is the registrations/new.html.erb which is what Devise uses for a new user signing up. Open up that file in your IDE and have a look at the form. You may notice Devise still uses the older style form_for view helper to generate the form but other than that it should look quite familiar. It has fields for the email, password and password confirmation.

For your own apps I would recommend you decide which views you actually want to modify. For an app idea you hope to actually release it may well be all of them. For small practice apps you may only care about the sign_up and login pages. It is possible to only generate the views you actually want to change using `rails generate devise:views -v registrations confirmations` as an example. You can change any of the arguments passed to the views based on which views you want to generate. You'll become familiar with the different devise modules as you work with them more.

We need to add in our field for the username but before that let's modify the existing code to incoporate Bulma stylings. Below I'll provide a list of the steps we need to take before sharing the modified code. See how many you can do on your own (hopefully all of them) and then compare what you have against the final code edit. After that we'll be in a good position to add our username input field.

Steps: 
- For each label on the form add a class of `label`.
- For each input field add a class of `input`.
- For the submit button add a class of `button`.
- The inputs already are wrapped in a class of `field` which is used for Bulma styling so all you need to do is wrap each input element inside a div with a class of `control`.
- The button needs to be wrapped in both a field div and a control div. You can do this inside the action div provided by Devise.
- Give the h2 title a classes of `title` and `is-2`
- To make our form look good wrap everything inside a div with the following classes `modal` and `is-active`
- Remove all `</br>` elements from the page as we will let Bulma handle it.

Your html should look like this

```html
<div class="modal is-active">
  <h2 class="title is-2">Sign up</h2>

  <%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>
    <%= render "devise/shared/error_messages", resource: resource %>

    <div class="field">
      <%= f.label :email, class: "label" %>
      <div class="control">
        <%= f.email_field :email, autofocus: true, autocomplete: "email", class: 'input' %>
      </div>
    </div>

    <div class="field">
      <%= f.label :password, class: 'label' %>
      <% if @minimum_password_length %>
        <em>(<%= @minimum_password_length %> characters minimum)</em>
      <% end %><br />
      <div class="control">
        <%= f.password_field :password, autocomplete: "new-password", class: 'input' %>
      </div>
    </div>

    <div class="field">
      <%= f.label :password_confirmation, class: 'label' %>
      <div class="control">
        <%= f.password_field :password_confirmation, autocomplete: "new-password", class: 'input' %>
      </div>
    </div>

    <div class="actions">
      <div class="field">
        <div class="control">
          <%= f.submit "Sign up", class: 'button' %>
        </div>
      </div>
    </div>
  <% end %>

  <%= render "devise/shared/links" %>
</div>
```

Now we are in a position to enter the field for the username. Underneath the div for the email field  and above the password field div we can add the following code

```html
<div class="field">
  <%= f.label :username, class: 'label' %>
  <div class="control">
    <%= form.text_field :username, class: 'input' %>
  </div>
</div>
```

If you try and submit the form now you'll get a `NotNullViolation` error. It may not be immediately obvious what has happened but if you check the logs for the SQL that was generated by devise you'll notice that the username was not used. This is because devise sanitises the input using Rails strong parameters. Our need to add a username is pretty common and therefore we should first check if devise has a solution for us. Skimming the devise github repo README table of contents and I saw a section on string parameters which led me (here)[https://github.com/heartcombo/devise#strong-parameters]. The solution is very simple.

First we need to open up the ApplicationController found in `app/controllers/application_controller.rb` and then add the following code

```ruby
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
end
```

If you try and create an account now it should redirect you to the home screen.

Before ending this section let's just quickly also tidy up the login form with some bulma stylings to make it look good

#TODO decide if the login should accept a username or just the email

The file for logging in can be found in `app/views/devise/sessions/new.html.erb`. All the stylings should be familiar to you now so try adding the following documents. The HTML will be provided at the end for you.

- Wrap everything in a div with classes of `modal` and `is-active`.
- Add classes `title` and `is-2` to the h2 element
- Wrap the input fields in a div with a class of `control`.
- Wrap the submit button in two divs. The outer one needs a class of `field` and the inner div needs a class of `control`.
- Add a class of `button` to the Log In button.

The finished HTML should look like this

```html
<div class="modal is-active">
  <h2 class="title is-2">Log in</h2>

  <%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
    <div class="field">
      <%= f.label :email %>
      <div class="control">
        <%= f.email_field :email, autofocus: true, autocomplete: "email" %>
      </div>
    </div>

    <div class="field">
      <%= f.label :password %>
      <div class="control">
        <%= f.password_field :password, autocomplete: "current-password" %>
      </div>
    </div>

    <% if devise_mapping.rememberable? %>
      <div class="field">
        <%= f.check_box :remember_me %>
        <%= f.label :remember_me %>
      </div>
    <% end %>

    <div class="actions">
      <div class="field">
        <div class="control">
          <%= f.submit "Log in", class: 'button' %>
        </div>
      </div>
    </div>
  <% end %>

  <%= render "devise/shared/links" %>
</div>
```

Now we have a forms for new people to sign up with, we need to give them a link so they can reach the page. The home page is the perfect place for this. It's the first page they land on and they can't go anywhere else from there.

Open up the home page view and underneath the div class with our content let's add a sign up div. If you aren't sure what path to use in the link try running `rails routes` in the terminal. Devise gives us the `new_user_registration_path` in order to go to the sign_up page. Again we can use some Bulma stylings to get it looking nice

```html
<%= link_to "SIGN UP", new_user_registration_path, class: 'notification is-link' %>
```

Now if you navigate to `localhost:3000` in your browser you should see a nice sign up button which goes to the sign up page.

With devise added and working we need to ensure that only registered users can access the Rooms page. We don't want unregistered users being able to try to post comments. To do this Devise offers us an before hook method `authenticate_user!`. You can place this in individual controllers or if you want it to apply to all pages of your app you can put it in the ApplicationController.

We want it to apply to our rooms controller so open that up just underneath the class definition add the following line.

```ruby
class RoomsController < ApplicationController
  before_action :authenticate_user!

  # ...
```

Now if you load up the server and go the home page in the browser, when you try to access the rooms it will instead redirect you to login. Ideal!. If you need to create a user to login the easiest way is in the rails console.

Run `bundle exec rails console` in the terminal to load the console up and then you can create a user. The email doesn't have to be real so make it something memorable that you can use to login and test things.

```ruby
User.create(email: 'somethingwitty@wittyman.com', username: 'witmesiter', password: 'securewit123')
```

Once you've created the user close the console by typing `exit` and in the browser try logging in and you should now be directed to the room index page as expected.

That all seems fine. Before we finish though we should run our entire test suite to be sure everything is in order. In the terminal run

```bash
bundle exec rspec
```

You should now have some failing tests. Bummer! This is expected though. You may already know what the problem is. All the failing tests are our system tests. this means our interaction with the app has changed, which it has as we've seen above. Now when we click Rooms in the system tests instead of being taken to the rooms index page we instead end up at the login page.

We first need to ensure we have a logged in user before we can acess the tests. Devise actually has a pretty good wiki that covers a wide range of topics. A quick search for `tests` in the wiki led me to [this page](https://github.com/heartcombo/devise/wiki/How-To:-Test-with-Capybara). It gives two good options. One, you can mimic the user actually filling in the login form, or two you can include some test helpers to make logging in easier. We will go with the second option, although the wiki states that the first option is probably the more correct, it also means we'll have to do the same action for every test when really we just want to know a logged in user can take those steps.

The first thing we need to do is include the test helpers. Let's do that inside a support file. In spec/support create a file called `devise_support.rb` and then in the file add the following lines

```ruby
RSpec.configure do |config|
  config.include Warden::Test::Helpers

  config.after :each do
    Warden.test_reset!
  end
end

def login_user
  user = User.create(email: 'test@test.com', username: 'test', password: 'test123')
  login_as(user, scope: :user)
end
```

Save and close the file. The test_reset! ensures Warden doesn't carry a logged in user between tests and give a false positive for a test that shouldn't pass. The `login_user` method is a helper method we can use to login for our system tests.

Now you need to go through the system tests that were failing and login. For the deleting and editing rooms we already have a before block that creates a room. Inside that block just underneath where we create the Room just call the `login_user` method

```ruby
before(:example) do
  Room.create(name: 'test room')
  login_user
end
```

For the new room and room index tests we just need to add a before block underneath the opening describe block

```ruby
RSpec.describe 'something', type: :system do
  before(:example) { login_user }

  # ...
```

Now try running your test suite and everything should be groovy again.

We're now ready to move onto creating the messages for our rooms.
