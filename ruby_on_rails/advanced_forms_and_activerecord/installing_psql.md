### Introduction

One of the great things about Rails is that it comes with some sensible defaults so that you can get started quickly. That being said, as awesome as SQLite is, it is typically not used for production. There are a bunch of reasons, but one of the major speed bumps with SQLite is that many cloud providers that can host Rails applications for public access also often have ephemeral file systems. Because SQLite relies on flat files to store your database, the persistence of your data may be questionable.

For the toy applications we've written so far, this data persistence is usually not a problem. However, as we progress in our knowledge and expand our toolbox, it will become increasingly more sensible to make sure that our data can be persisted if our application's instance gets restarted or wakes up from sleep. It is also sensible to make sure our application development environment is fairly close to our intended production environment so we can avoid a whole class of problems that stem from using different tools in different environments.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- Discuss what an environment is
- Briefly discuss environment variables and how to utilize them
- Install PostgreSQL locally and set it up
- Scaffold a simple Rails application to test our installation

### Environments and Their Variables

In the context of application development, an environment is the collection of tools, configurations and conventions that allow developers to make changes to the application. For a particular environment, this collection of tools also run the application. There are often four basic types of environments that are set up for a specific purpose, and the collection of these steps forms what is called a pipeline.

The *development* environment is intended to be the place where we can make changes, add features, or improve our code without having any impact on the practical experience of any users that might be using our application. The dev environment is typically local to the developer.

The *test* environment is set up to facilitate testing of our application. This environment is usually not that different from our development environment, but there may be some additional tooling that is added to monitor and analyze the performance of our application that wouldn't be present in the development environment. The testing environment is usually local, but certain deployment pipelines will run tests in a test environment in the cloud.

The *staging* environment is the pre-production environment. Usually, this environment mirrors the production environment completely, but the deployment is private or restricted to the developers. This environment exists usually as a final pre-flight check for changes that are intended to go to a live/production environment to make sure everything works as expected.

Finally, the *production* environment is what your users will access on a day-to-day basis. This environment is what actually runs your application every day.

Because an environment is just a collection of tools and configurations, they come in handy as a place we can store secrets or other information that may change based on how we intend to use our application. It turns out, you've been working in an *everything* environment already! But once you start thinking about deploying larger applications that you intend to be public, starting to think about the separate environments can come in handy.

For example, when we are developing locally, we may have different access credentials to certain tools compared to what we might use in production. Another example might be that our production application could include an analytics suite and more logging which would not be useful and potentially wasteful, if it's a paid service, in a development environment.

Well, how exactly does our application know what credentials or even bits of software to use or not to use? The answer actually lives in the environment!

The foundation of any environment is the operating system and they generally provide ways to store local variables. Not surprisingly, these are known as *environment variables* and they can be very important to getting our application running. A git repository (and by extension Github) are great places to store and share your code, but you definitely don't want to share things like API keys that allow anyone to access your resources. Using environment variables, this type of private data can be saved so that they can only be accessed locally.

Based on information in the environment, Rails will run in a specific way as well as use the gems that you specify for that environment. Additionally, we can provide operating system level variables for our Rails application to use. This is where you might store an API key or other authentication required to run the application.

We will be using the environment to store some credentials so that your Rails apps can access your local PostgreSQL server.

### Installing PostgreSQL

If you've been following the curriculum, then you should already have all the supporting bits and pieces installed. If not, please go back and refer to those lessons before continuing. You'll want to confirm that node.js, Ruby, Rails and yarn are all installed.

Pick your operating system below to get the relevant steps for installing PostgreSQL.

<details markdown="block">
<summary class="dropDown-header">Ubuntu
</summary>

### Step 1: Make sure the system is up to date
Before we install PostgreSQL, it's always a good idea to make sure our system is up to date.

If you're using an Ubuntu based operating system, simply press `Ctrl + Alt + T` to open a terminal. As a quick reminder, copy and pasting to the terminal in Ubuntu requires doing `Ctrl + Shift + C` and `Ctrl + Shift + V`.

Remember that, because we are using `sudo`, you will be prompted for your password. Type it in, even though there is no visual feedback, so we can update our system's software.

~~~~bash
sudo apt update
sudo apt upgrade
~~~~

If there are any prompts, review them before pressing `Y` and `Enter`. Typically, the prompts advise you about how much additional space will be used by the updates.

### Step 2: Install the PostgreSQL packages
We will first install the packages for PostgreSQL, then configure them afterwards.

~~~bash
sudo apt install postgresql postgresql-contrib libpq-dev
~~~

Then, we will start the server using this command:

~~~bash
sudo systemctl start postgresql.service
~~~

We can check if the service is active by running this command:

~~~bash
service postgresql status
~~~

If you get an error or the service is not running at this point, come visit the Discord for some help. You can press `Q` to quit the status screen and return to your prompt.

### Step 3: Setting up PostgreSQL
PostgreSQL is now running, but we have to configure it in order to be able to use it with our local Rails applications.

#### 3.1 PostgreSQL Roles
PostgreSQL authenticates locally via roles. The idea is that a role can stand for a user or a group of users, and the default installation has set up a `postgres` role that we can use to interact with the database. This is great, but that would mean having to switch to that role every time we wanted to do something with the database.

What we will do in this step is to set up a role within PostgreSQL so that we don't have to switch to the default `postgres` role in order to utilize the database. PostgreSQL can also authenticate users via "peer authentication" which means we can easily access our local server by creating a role that hss the same name as our Linux user.

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

Make sure that you enter your Linux user name as the name of the role, and be sure to make that user a superuser. You may get prompted to enter your password before being able to enter a name because we are using `sudo`.

#### 3.3 Creating the Role Database
One other important step in setting up Postgre is that each role must have its own database of the same name. Without it, the role we just created will not be able to log in or interact with the Postgre server.

You can try to run `psql` now, and you will get an error that the database does not exist. Let's create one to resolve this error:

~~~bash
sudo -u postgres createdb <linux_username>
~~~

#### 3.4 Securing Our New Role
One important thing that we have to do is to set up a password for our new role so that the data is protected. Enter this command to enter the PostgreSQL prompt:

~~~bash
psql
~~~

You'll see the PostgreSQL prompt come up with the new role we just created, like so:

~~~psql
<role_name>=#
~~~

Let's create a password for our user:

~~~bash
\password <role_name>
~~~

You'll be prompted to enter a password and to verify it. Once you are done, the prompt will return to normal. Now, we will configure the permissions for our new role:

~~~bash
grant all privileges on database <role_database_name> to <role_name>
~~~

Remember that you should change the `<role_database_name>` and `<role_name>`! You can type `\q` to exit the prompt.

#### 3.5 Saving Access in the Environment
Finally, we have our configuration all set up. Now the last step is to practice putting our new role password into our environment so that we can access it in our code without saving it to our repository!

In order to save our password to the environment, we can run this command:

~~~bash
echo 'export DATABASE_PASSWORD="<role_password>"' >> ~/.bashrc
~~~

Remember to update `<role_password>` to the same password that you set above! This command saves this variable name and value to your environment, so that you can retrieve it later without saving it to your repository!

Now that our database server is configured, let's test it out with the assignment below.

</details>

<details markdown="block">
<summary class="dropDown-header">macOS
</summary>

Content here

</details>

### Creating a Rails Application Backed by PostgreSQL
Now that we've installed and configured our local PostgreSQL server, let's generate a new Rails application to make sure everything is working.

#### Telling Rails What Database to Use
We are already familiar with `rails new <app_name>` but it is also possible to specify the database that Rails should use when generating a new application! Since we just installed PostgreSQL, let's try to generate a new application to use PostgreSQL:

~~~bash
rails new <app_name> --database=postgresql
~~~

Now, because PostgreSQL has peer authentication set up, we actually don't have to do much to utilize our new PostgreSQL server. Typing `rails db:create` should create the databases without any issues. This is because Rails will fall back to the current Linux user and try that as a PostgreSQL role. Because we set up PostgreSQL with this exact situation in mind, everything should work without a hitch.

However, if you ever need to set up a username and password explicitly, you can do so in the `config/database.yml` file:


~~~yml
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <role_name> # role we set up previously
  password: <%= ENV['DATABASE_PASSWORD'] %> # variable we added to the environment
~~~

Then, once this information is specified, you can type:

~~~bash
rails db:create
~~~

And you'll see your brand new databases created, ready to go! As a final check, we can start the Rails server:

~~~bash
rails s
~~~

Open your browser, and head on over to `localhost:3000` and you should be greeted by the Rails info page.

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="A KNOWLEDGE CHECK URL">A KNOWLEDGE CHECK QUESTION.</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
