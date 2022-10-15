### Introduction

One of the great things about Rails is that it comes with some sensible defaults so that you can get started quickly. However, SQLite is typically not used for production. One major issue is that many hosting providers have ephemeral file systems which means your database can be deleted.

For the apps written so far, it's probably not a big deal. As we progress to writing larger applications, though, it will become increasingly sensible to make sure that data persists even after a restart or hibernation.

It is also sensible to make sure the application development environment is as close to the production environment as possible. This helps to avoid problems that stem from using different tools in different environments.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- Discuss what an environment is and how it can impact our application
- Briefly discuss environment variables and how to utilize them
- Install PostgreSQL and set it up
- Set up a bare Rails application to test our database installation

### Environments and Pipelines

In the context of application development, an environment is the collection of tools, configurations and conventions that developers write and run code with. An environment usually consists of an operating system and other software packages on top of that operating system. Some of that software, like `code`, helps write software while others, like `rbenv`, provide tools and configurations to help run software.

There are four basic types of environments that are typically set up together. The application that's being developed will then progress through these steps, which are grouped together in a "production pipeline":

1. The development environment is where developers can make changes, add features and improve the code without impacting actual users.
1. The test environment is set up to facilitate testing of the application. This environment may use different tools and configuration settings (like more verbose logging) to validate a program's behavior and identify bugs.
1. The staging environment usually mirrors the production environment but deployments are not meant to be public.
1. The production environment runs the application so that it is accessible by users.

Because an environment is a collection of tools and configurations, they come in handy as a place to store secrets or other information that may change based on the intended use the application.

For example, the local database server might have different credentials than the production one or maybe there are more analytics and logging requirements for a production deployment.

As applications get larger, setting up these different environments can help developers deliver their best work while making sure changes (or bugs) don't negatively affect users.

### Environment Variables
The foundation of any environment is the operating system which provides ways to store local variables. Not surprisingly, these are known as environment variables.

Why are environment variables important? After all, the information could be added to the git repository (and by extension Github). While tools like git and Github are excellent for storing and sharing code, sensitive information like API keys or passwords should be kept private. Using environment variables, this type of private data can only be accessed locally which means the application gets the information it needs without exposing it to the world.

Rails uses the environment to set up its own internal environment variable. The framework will look for a `RAILS_ENV` variable in the environment and set its own env that way. If it can't find the variable, then [Rails will assume it is in a development environment](https://github.com/rails/rails/blob/main/railties/lib/rails.rb#L67). Isn't that cool?

We will use an environment variable to set up PostgreSQL credentials for our Rails apps.

### Installing PostgreSQL

If you've been following the curriculum, then you should already have all the supporting bits and pieces installed. If not, please go back and refer to those lessons before continuing. You'll want to confirm that node.js, Ruby, Rails and yarn are all installed.

Pick your operating system below to get the relevant steps for installing PostgreSQL.

<details markdown="block">
<summary class="dropDown-header">Ubuntu
</summary>

### Step 1: Make sure the system is up to date
Before installing PostgreSQL, it's a good idea to make sure the operating system is up to date.

In Ubuntu, press `Ctrl + Alt + T` to open a new terminal. As a quick reminder, copy and pasting to the terminal in Ubuntu requires doing `Ctrl + Shift + C` and `Ctrl + Shift + V`.

<div class="lesson-note" markdown="1">
#### Note
We will be using `sudo` quite a bit. As you follow these instructions, you may be (re-)prompted for your password. Remember that there will be no visual feedback when you type in your password.
</div>

To update our system, type in these commands:

~~~~bash
sudo apt update
sudo apt upgrade
~~~~

Be sure to review any prompts before pressing `Y` and `Enter`. While they typically advise you about additional space required for updates, this might not be the case!

### Step 2: Install the PostgreSQL packages
After our system is up to date, we will install the packages for PostgreSQL.

~~~bash
sudo apt install postgresql postgresql-contrib libpq-dev
~~~

After installation is complete, let's start the server using this command:

~~~bash
sudo systemctl start postgresql.service
~~~

If you are unsure about whether postgre is active, it's possible to check with this command:

~~~bash
service postgresql status
~~~

Got an error, or don't see an active service? Come visit the Discord for some help!

If postgre is active, you can press `Q` to quit the status screen and move on to the next step.

### Step 3: Setting up PostgreSQL
PostgreSQL is now running, but we have to configure it in order to be able to use it with our local Rails applications.

#### 3.1 PostgreSQL Roles
PostgreSQL authenticates via roles. A role is like a user and the default installation has set up a `postgres` role that we can use to interact with the database server. This is great, but that would mean having to switch to that role every time we wanted to do something with the database server.

Instead, we will set up our own user to avoid switching to `postgres` all the time.

<div class="lesson-note" markdown="1">
#### IMPORTANT
You'll want to take note of your Linux username so we can create the right role! The terminal prompt, by default, is configured in this format:

~~~bash
<linux_username>@<machine_name>: 
~~~
</div>

#### 3.2 Creating a New Role
With all your information ready, let's create a role in Postgre! The command to do so is:

~~~bash
sudo -u postgres createuser --interactive
~~~

Make sure that you enter your Linux user name as the name of the role, and be sure to make that user a superuser. Setting up a role this way means that we leverage "peer authentication" which makes using the local database very easy from Rails.

#### 3.3 Creating the Role Database
One other important step in setting up Postgre is that each role must have its own database of the same name. Without it, the role we just created will not be able to log in or interact with the Postgre server.

You can try to run `psql` now, but you will get an error that the database does not exist. Not to worry, let's create one to resolve fix this:

~~~bash
sudo -u postgres createdb <linux_username>
~~~

Now our role is fully set up: we've got `<role_name>` and that role has a database.

#### 3.4 Securing Our New Role
One important thing that we have to do is to set up a password for our new role so that the data is protected. Now that our role is set up, we can actually use it to administer the Postgre server. All you have to do is enter this command to get into the PostgreSQL prompt:

~~~bash
psql
~~~

You should see the PostgreSQL prompt come up with the new role we just created, like so:

~~~
<role_name>=#
~~~

If you don't see a similar prompt, then reach out on Discord for some help. 

If you **do** see a similar prompt, then we can create a password for the role like so:

~~~
\password <role_name>
~~~

You'll be prompted to enter a password and to verify it. Once you are done, the prompt will return to normal. Now, we will configure the permissions for our new role:

~~~
grant all privileges on database <role_database_name> to <role_name>;
~~~

Remember that you should change the `<role_database_name>` and `<role_name>` (they should both the same)! If you see `GRANT` in response to the command, then you can type `\q` to exit the prompt.

#### 3.5 Saving Access Information in the Environment
After finishing our configuration, the last step is save it into the environment to access later.

In order to save our password to the environment, we can run this command:

~~~bash
echo 'export DATABASE_PASSWORD="<role_password>"' >> ~/.bashrc
~~~

Note here the name we've chosen for our environment variable: `DATABASE_PASSWORD`. Also, remember to update `<role_password>` in the command to what was set above!

Now, this variable lives in our environment for us to use. As the variable is new, we'll want to reload the environment so that we can access it. To reload the environment, you can close and re-open your terminal.

Once that's done, we can move to testing it out!

</details>

<details markdown="block">
<summary class="dropDown-header">macOS
</summary>

### Step 1: Make sure the system is up to date
Before running commands with homebrew, you'll want to make sure things are up to date. Run the following commands.

~~~~bash
brew update
brew upgrade
~~~~

If your terminal doesn't recognize `brew`, then you'll need to go and install homebrew. You can find it and other installs in the curriculum [here](https://www.theodinproject.com/lessons/installation_lessons).

### Step 2: Install the PostgreSQL packages
Now that we've ensured our packages are up to date, we will use brew to install PostgreSQL.

~~~bash
brew install postgresql@14
~~~

After installation is complete, let's start the server using this command:

~~~bash
brew services start postgresql@14
~~~

If you are unsure about whether postgres is active, it's possible to check with this command:

~~~bash
brew services info postgresql@14
~~~

Got an error, or don't see an active service? Come visit the Discord for some help!

If the postgres service is active, move on to the next step.

### Step 3: Setting up PostgreSQL
PostgreSQL is now running, but we have to configure it in order to be able to use it with our local Rails applications.

#### 3.1 PostgreSQL Roles
PostgreSQL authenticates via roles. A role is like a user, and by default, the install on MacOS should have a role set up with your MacOS username. If you're not sure of your username, you can run the command `whoami` in your terminal to get it. To verify that you have a role in postgres matching your username, enter the following command:

~~~bash
psql postgres
~~~

And you should see a prompt like this
~~~
psql (14.x (Homebrew))
Type "help" for help.

postgres=#
~~~
Input `\du`, hit Return, and check that your MacOS username is the listed role name.

#### 3.2 Creating the Role Database
One other important step in setting up postgres is that each role must have its own database of the same name. We need this to login as the role matching our username. While still in the postgres session prompt, type the following command to create the new database. Make sure you include the semicolon.

~~~
CREATE DATABASE <username>;
~~~

Now our role is fully set up: we've got `<role_name>` and that role has a database. Enter the command `\q` to exit the interactive terminal for `postgres`.

#### 3.3 Securing Our New Role
One important thing that we have to do is to set up a password for our new role so that the data is protected. Now that our role is set up, we can actually use it to administer the postgres server. All you have to do is enter this command to get into the PostgreSQL prompt for the database matching your user:

~~~bash
psql
~~~

You should now see the postgres prompt come up like this:

~~~
<role_name>=#
~~~

If you don't see a similar prompt, then reach out on Discord for some help. 

If you **do** see a similar prompt, then we can create a password for the role like so:

~~~
\password <role_name>
~~~

You'll be prompted to enter a password and to verify it. Once you are done, the prompt will return to normal. Now, we will configure the permissions for our new role:

~~~
grant all privileges on database <role_database_name> to <role_name>;
~~~

Remember that you should change the `<role_database_name>` and `<role_name>` (they should both the same)! If you see `GRANT` in response to the command, then you can type `\q` to exit the prompt.

#### 3.4 Saving Access Information in the Environment
After finishing our configuration, the last step is save it into the environment to access later.

In order to save our password to the environment, we can run this command:

~~~bash
echo 'export DATABASE_PASSWORD="<role_password>"' >> ~/.zshrc
~~~

Note here the name we've chosen for our environment variable: `DATABASE_PASSWORD`. Also, remember to update `<role_password>` in the command to what was set above!

Now, this variable lives in our environment for us to use. As the variable is new, we'll want to reload the environment so that we can access it. To reload the environment, you can close and re-open your terminal.

Once that's done, we can move to testing it out!

</details>

</details>

### Creating a Rails Application Backed by PostgreSQL
Now that we've installed and configured our local PostgreSQL server, let's generate a new Rails application to make sure everything is working.

#### Telling Rails What Database to Use
We are already familiar with `rails new <app_name>` but it is also possible to specify the database that Rails should use when generating a new application. Since we just installed PostgreSQL, let's try it out!

Navigate to where you keep your projects and enter:

~~~bash
rails new <app_name> --database=postgresql
~~~

#### Configuring Rails Using Environment Variables
Let's navigate into the app directory and set up our database credentials.

~~~bash
cd <app_name>
~~~

We can set up the database username and password in `config/database.yml` by adding entries with our information:

~~~diff
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
+  username: <role_name> # role previously added
+  password: <%= ENV['DATABASE_PASSWORD'] %> # variable previously added
~~~

Save the file, and we can see Rails work its magic:

~~~bash
rails db:create
~~~

Rails should create the two databases, and as a final check we can start the Rails server:

~~~bash
rails s
~~~

Open your browser, and head on over to `localhost:3000`. If you are greeted by the Rails splash page, then we did it! If you see an error, come to the Discord community and get some help!

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

-   RubyGuides has a good [introduction to environment variables](https://www.rubyguides.com/2019/01/ruby-environment-variables/) that has a lot of information.
-   DigitalOcean has a fantastic [guide to setting up PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-22-04) that you can also check out.
-   We set up a role in this guide because [PostgreSQL peer authentication](https://www.postgresql.org/docs/current/auth-peer.html) makes local authorization easy if we do that.