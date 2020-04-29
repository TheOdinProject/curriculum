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
