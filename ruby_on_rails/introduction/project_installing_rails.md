### Introduction

Ready to jump into Rails? Let's get started by installing it and creating your first Rails application!

Before continuing, let's review a few best practices to keep in mind:

* Follow the directions closely, and don't skip over any sections.
* **Do NOT use `sudo` unless The Odin Project specifically says to do so.** Failing to follow this advice can cause *a lot* of headaches. In some instances, you might see a message in the terminal telling you to use `sudo` and/or to install something with `apt`. **Ignore what the terminal says** and follow the instructions below.
* Copy and paste the commands to avoid typos.
* If you stop working on this project partway through and come back to it later, be sure to use `cd` to move back inside your project directory so that the commands will work.

In this project, we're going to build a fully functional Rails application. The entire point of this exercise is to make sure that you have everything installed and working correctly on your computer. Do *not* worry if you don't fully understand what you're doing. You'll learn exactly what all of these commands are doing later on in the course. For now, go slowly, and be sure to follow **each and every** step closely. If you run into trouble, don't forget that you can always reach out for help on [Discord](https://discord.gg/fbFCkYabZB). You can also use the [Discord search function](https://support.discordapp.com/hc/en-us/articles/115000468588-Using-Search) to check if someone else had a similar problem and how they solved it.

### Your first Rails app

### Step 1: Create your first Ruby on Rails web application

Don't worry if you don't totally understand what you are doing in these next steps. You will learn what all of this does later in The Odin Project curriculum. As long as the commands complete successfully, just keep going. The main reason we're doing this is to ensure everything is properly installed and configured.

#### Step 1.1: Install Rails

We've previously installed Ruby, and now it's time to install Ruby on Rails. It's just running one command!

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

#### Step 1.3: Create the application

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

#### Step 1.4: Start up your app

Now that you have created a Rails application, you can start it up and see if it works!

In the terminal, type

~~~bash
rails server
~~~

Now, open a browser and visit [http://localhost:3000/cars](http://localhost:3000/cars) to see your application! 

<div class="lesson-note lesson-note--warning" markdown=1>
If you're using a VM, you will need to open the browser inside of your VM in order for this to work.
</div>

Go ahead and create a new car, and then refresh the page to verify it is working. Add as many cars as you'd like! When you're satisfied, go back to the terminal where the Rails server is running, and type <kbd>Ctrl</kbd> + <kbd>C</kbd> to close the server.

### Step 2: Git groundwork

Like all of the projects you've done so far we need to use Git for our version control and to push our app to different remotes.

#### Step 2.1 Stage and commit local changes
Rails will already have initialized Git for you when it was doing its thing, so just stage and commit all of the work it's done so far.

~~~bash
git add .
git commit -m "Initial commit"
~~~

#### Step 2.2 Initialize on GitHub, add the remote, and push
Make a repo on Github and make sure you **do not** initialize the repository with a README because Rails has created one already. Add this repo as a remote and push your repo to GitHub just like you normally do.

REMINDER: Do not enter the `<` or `>` symbols below. Replace those symbols and everything between them with the URL that you copied from GitHub.

~~~bash
git remote add origin <SSH URL from GitHub>
git push -u origin main
~~~

#### Step 2.3 Confirm Git is working correctly
Confirm that the push was successful and on GitHub you see all the folders and files made locally by Rails, starting with a folder called "app".

This marks the start of your Rails journey! Later on, you'll be able to look back at this repository and marvel over how far you've come!
