### Users

Although we have covered creating your own authentication for our application we'll actually be using devise to do the heavy lifting. You already have a good idea of how devise works under the hood so this is just a case of using a well known gem to ensure our application is secure.

Thinking about our users for a chatroom they can log in using their email and password and like all chatrooms a user should set a username that they wish to identify as.

#### Step 1: Adding devise

We want devise to be available for all of our app environments so we can add it to our Gemfile outside of any groups.

Open your Gemfile and just above the line which says `group :development, :test do` add the following line

```ruby
gem 'devise', '~>4.7'
```

Save the file and then in the terminal run

```ruby
bundle install
```

### Step 2: Installing devise

#### Step 2.1: Run the generator

Now that the gem is installed we need to run the generator to give us a devise initial setup.

In the terminal we just need to run

```ruby
rails generate devise:install
```

This will install an initializer where we can configure all of our devise setup options. There are a couple of options that devise needs to be set to operate correctly and luckily they confirm what they are in the terminal when you have run the initializer. You should see something like this

```bash
Some setup you must do manually if you haven't yet:

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

#### Step 2.2: Set the config mailer

Number 1 on the list of devise configuration requirements is defining the default url_options in your environment files.

1. Locate and open the config/environments/development.rb file in your text editor.

2. At the bottom of the file, just above the last `end` statement add the following lines

```ruby
# add default url option
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

Make sure to save the file before you close it.

### Step 3: Creating the User Model

The next step is to create the devise model itself

#### Step 3.1: Create the model

In your terminal run

```bash
rails generate devise User username:string
```

#### Step 3.2: Add an index for the username

In the db/migrations directory open the devise migration file. Migrations are given a unique reference based on the time it was generated so the filename will look different for each one. At this time there should be only one file in the migrations directory to open.

In the file towards the bottom you should see a line that states `add_index :users, :email, unique: true`. Add a new line beneath that and add the following line

```ruby
add_index :users, :username, unique: true
```

#### Step 3.3: Ensure usernames cannot be left empty

In the same migration file find the line that says `t.string :username`

Change the line so it reads as follows:

```ruby
t.string :username, null: false
```

This will ensure a record cannot be created in the database without a username.

Save and close the file.

#### Step 3.4: Run the migration

In the terminal run

```bash
rails db:migrate
```

The default views that Devise provide don't look very nice and they only have default email and password fields for creating a new account. This won't work for us because we insist that our users provide a username too. This means we'll need to add a username field to our form and also allow that username parameter to be submitted to the devise controller in the parameters.

In order to generate the views that Devise uses we need to run the following command in our terminal

```bash
rails generate devise:install
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

Now we are in a position to enter the field for the username. Underneath the div for the email field we can add the following code

```html
<div class="field">
  <%= f.label :username, class: 'label' %>
  <div class="control">
    <%= form.text_field :username, class: 'input' %>
  </div>
</div>
```

If you try and submit the form now you'll get a `NotNullViolation` error. It may not be immediately obvious what has happened but if you check the logs for the SQL that was generated by devise you'll notice that the username was not used. This is because devise sanitises the input using Rails strong parameters. Our need to add a username is not unique and therefore we should first check if devise has a solution for us. Skimming the devise github repo README table of contents and I saw a section on string parameters which led me (here)[https://github.com/heartcombo/devise#strong-parameters]. The solution is very simple.

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
