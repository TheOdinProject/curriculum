### Introduction

If you went through the [Ruby course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) you will have already installed Ruby. But if you haven't done that, then now is the time to [install it](https://www.theodinproject.com/lessons/ruby-installing-ruby) as you will need Ruby installed before we tackle installing Rails.

With Ruby installed, you're all set to install Rails and create our first Rails app to ensure everything went smoothly.

Before continuing, let's review a few best practices to keep in mind:

* Follow the directions closely, and don't skip over any sections.
* **Do NOT use `sudo` unless The Odin Project specifically says to do so.** Failing to follow this advice can cause *a lot* of headaches. In some instances, you might see a message in the terminal telling you to use `sudo` and/or to install something with `apt`. **Ignore what the terminal says** and follow the instructions below.
* Copy and paste the commands to avoid typos.
* If you stop working on this project partway through and come back to it later, be sure to use `cd` to move back inside your project directory so that the commands will work.

In this project, we're going to build a fully functional Rails application. The entire point of this exercise is to make sure that you have everything installed and working correctly on your computer. Do *not* worry if you don't fully understand what you're doing. You'll learn exactly what all of these commands are doing later on in the course. For now, go slowly, and be sure to follow **each and every** step closely. If you run into trouble, don't forget that you can always reach out for help on [Discord](https://discord.gg/fbFCkYabZB). You can also use the [Discord search function](https://support.discordapp.com/hc/en-us/articles/115000468588-Using-Search) to check if someone else had a similar problem and how they solved it.

### Your First Rails App

### Step 1: Create Your First Ruby on Rails Web Application

Don't worry if you don't totally understand what you are doing in these next steps. You will learn what all of this does later in The Odin Project curriculum. As long as the commands complete successfully, just keep going. The main reason we're doing this is to ensure everything is properly installed and configured.

#### Step 1.1: Install Rails

We've previously installed Ruby, and now it's time to install Ruby on Rails. It's as simple as running one command!

~~~bash
gem install rails
~~~

Once the installation finishes, you can check if everything went well by restarting your terminal and running the following command:

~~~bash
rails -v
~~~

This should display the version of Rails installed on your system indicating the installation went smoothly.

#### Step 1.2: Install Yarn

You may be wondering why we are installing Yarn when Rails 7 provides import maps that allows you to import JavaScript Modules directly from the browser. We will go over import maps in a later lesson but, it is important to note that import maps handles libraries without transpiling or bundling and uses the asset pipeline. We still need to install Yarn to ensure frameworks that require compiling or bundling can still be used. This is due to the way some JavaScript is bundled requiring the usage of Yarn.

JavaScript libraries used to be managed through the asset pipeline in previous Rails versions but as JavaScript progressed it became a little dated and made it hard to integrate the latest JavaScript libraries and frameworks.

Yarn is a JavaScript package manager, much like Bundler for Ruby, and allows you to easily manage your JavaScript libraries for the frameworks that do require bundling and compiling.

Visit [The Yarn Download Page](https://classic.yarnpkg.com/en/docs/install#windows-stable). The easiest way to install Yarn is to run the `npm` command shown on the page. This will install Yarn Classic, which is the version we want.

You can verify the install by running the following command:

~~~bash
yarn --version
~~~

If you don't get a version number drop by the chatrooms for some assistance.

#### Step 1.3: Create the Application

This is where it might start to be difficult to follow just what is happening. If you don't understand what's going on, just double check that you're typing in the correct commands and keep going. This section is meant to expose you to the process and to verify that everything is working. Again, it's OK to not understand what's going on at this point.

We're going to start by navigating to the directory that you house your projects in, then telling Rails to initialize the application for us.

~~~bash
cd ~/your_odin_project_directory
rails new my_first_rails_app
~~~

This will do a bunch of things, and you'll see a lot of output in the terminal. If everything worked, you should see something similar to this around the end of the terminal output:

~~~bash

Bundle complete! 16 Gemfile dependencies, 76 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
Switch development cable to use redis
        gsub  config/cable.yml
Create controllers directory
      create  app/javascript/controllers
      create  app/javascript/controllers/index.js
      create  app/javascript/controllers/application.js
      create  app/javascript/controllers/hello_controller.js
Import Stimulus controllers
      append  app/javascript/application.js
Pin Stimulus
      append  config/importmap.rb

~~~

In the above process, Rails created a new directory for us. Let's `cd` into it now:

~~~bash
cd my_first_rails_app
~~~

Now, we're going to tell Rails to generate some templates for us. This will get us up and running in no time at all. If you are using Ruby 2.7 or higher then you may see some deprecation warnings that look like errors in the console. Ruby made some changes in version 2.7 to deprecate using hashes as the last argument of a method call. You can read more about it [here](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/). It will take time for gems to update their codebases to deal with this deprecation, especially if they are as large as Rails. If you do see any deprecation warnings then don't worry, they will get fixed eventually. The warnings will look something like:

~~~bash
warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
~~~

Run the following in the terminal:

~~~bash
rails generate scaffold car make:string model:string year:integer
~~~

After generating the scaffolds, we need to migrate the database.

~~~bash
rails db:migrate
~~~

#### Step 1.4: Start Up Your App

Now that you have created a Rails application, you can start it up and see if it works!

In the terminal, type

~~~bash
rails server
~~~

Now, open a browser and visit [http://localhost:3000/cars](http://localhost:3000/cars) to see your application! **Note:** If you're using a VM, you will need to open the browser inside of your VM in order for this to work.

Go ahead and create a new car, and then refresh the page to verify it is working. Add as many cars as you'd like! When you're satisfied, go back to the terminal where the Rails server is running, and type `Ctrl + C` to close the server.

### Step 2: Git Groundwork

Like all of the projects you've done so far we need to use Git for our version control and to push our app to different remotes.

#### Step 2.1 Stage and Commit Local Changes
Rails will already have initialized Git for you when it was doing its thing, so just stage and commit all of the work it's done so far.

~~~bash
git add .
git commit -m "Initial commit"
~~~

#### Step 2.2 Initialize on GitHub, add the remote, and Push
Make a repo on Github and make sure you **do not** initialize the repository with a README because Rails has created one already. Add this repo as a remote and push your repo to GitHub just like you normally do.

REMINDER: Do not enter the `<` or `>` symbols below. Replace those symbols and everything between them with the URL that you copied from GitHub.

~~~bash
git remote add origin <SSH URL from GitHub>
git push -u origin main
~~~

#### Step 2.3 Confirm Git is Working Correctly
Confirm that the push was successful and on GitHub you see all the folders and files made locally by Rails, starting with a folder called "app".

This marks the start of your Rails journey! Later on, you'll be able to look back at this repository and marvel over how far you've come!

### Step 3: Deploy Your Rails Application

Now that you've created your first Rails application, it's time to deploy it so that you can show the whole world! This process will allow you to send a link to people so they can see your app working.

Recall, in the [previous lesson](https://www.theodinproject.com/lessons/ruby-on-rails-preparing-for-deployment) we set up our Heroku account to deploy our web applications. If you have not already done so, go back and complete the lesson.

#### Step 3.1: Create a Heroku Application

First, run

~~~bash
heroku create
~~~

Then, run

~~~bash
git remote
~~~

Verify that you see `heroku` in the output.

#### Step 3.2: Prepare Rails for Heroku Deployment

Heroku uses a slightly different setup than what we have on our machine. We need to configure the application to play nicely with both.

#### Step 3.2.1: Configure the Gemfile

To deploy a Rails application, we need to change some settings.

First, we need to open the `Gemfile` and edit it.

In your terminal, type `ls` and verify that you see `Gemfile` in the output. If you don't see it, navigate to the directory you created in Steps 2.2 and 2.3.

Then, we'll use VSCode to modify the `Gemfile`. Open your app in VSCode by typing `code .` (**NOTE: The period at the end is important!**)

When VSCode opens, you should see a list of files on the left side of the screen. Click on `Gemfile` to open it in the editor. Then, delete the line that says,

~~~ruby
gem 'sqlite3'
~~~

Replace the line you just deleted with the following:

~~~ruby
group :development, :test do
 gem 'sqlite3'
end

group :production do
  gem 'pg'
end
~~~

Then, save the file. You can leave VSCode open since we're going to be coming back to it, but for the next step, go back to your terminal.

#### Step 3.2.2: Install the new gems.

Next, we need to tell Ruby, Git, and Heroku that we've changed the `Gemfile`. When we deploy the app, Heroku will install the gems in the `:production` group and ignore the ones in the `:development` and `:test` groups. Conversely, we don't need to install the gems in the `:production` group on our local machine, since they aren't being used for development. To accomplish this, we need to tell `Bundler` to ignore the `:production` group gems in this project by running

~~~bash
bundle config set --local without production
~~~

We're not just saving disk space here; we also need to do this because the pg gem relies on having the pg (PostgreSQL) database installed locally. Without it, the gem can’t build the native extensions needed to interact with the database and we would get an error during installation. Using the same database in both development and production is something we would definitely recommend, but not at this stage. An sqlite database is much easier to get up and running for development, but sqlite isn't supported on Heroku, so we need to use PostgreSQL instead in production.

Now we can install only the gems in the `:development` and `:test` groups on our local machine by simply running

~~~bash
bundle install
~~~

#### Step 3.2.3: Configure the Root Route

The next thing we need to edit is the `routes.rb` file to set our root route. We're going to do this so that we can see the application without having to append `/cars` at the end of the URL.

Go back to VSCode and expand the `config` folder in the file list at the left-hand side of the screen. One of the files inside the folder will be named `routes.rb`. Open `routes.rb` and make it match the example below:

~~~ruby
Rails.application.routes.draw do
  root 'cars#index'
  resources :cars
end
~~~

Save the file. You can close VSCode now; the rest of the steps take place in the terminal.

#### Step 3.3: Add Changes to Git and GitHub

First, run:

~~~bash
bundle lock --add-platform x86_64-linux --add-platform ruby
~~~

Now, you can stage and commit your changes so that the repo is ready for prime time when we push it to Heroku next!

~~~bash
git add .
git commit -m 'Updates for heroku deployment'
~~~

While we're here, we might as well push our changes to GitHub too:

~~~bash
git push origin main
~~~

#### Step 3.4: Push to Heroku

Now that we've committed the files, we can push to Heroku:

~~~bash
git push heroku main
~~~

This will send the app you created to Heroku. There will be a lot of output in your console. Wait for it to finish.

#### Step 3.5: Migrate the Database on Heroku

Similar to what we did locally before we launched our app, we need to migrate the database on Heroku, which we can do with the Heroku CLI.

Run this command:

~~~bash
heroku run rails db:migrate
~~~

You might see some strange output, but as long as you do not have an error, you have successfully deployed a Rails application!

If you have an error, come to our [chat room](https://discord.gg/fbFCkYabZB), and ask for help. Be sure to include the entire output from your terminal when you ask your question.

#### Step 3.6: Visit Your New Application

It's time to see your app on the web! If you are using Linux or Mac, you can quickly open your app with the command below.

~~~bash
heroku open
~~~

Now go and play around with it!
