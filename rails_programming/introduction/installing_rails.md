### Introduction

If you went through the [Ruby course](https://www.theodinproject.com/courses/ruby-programming/lessons/installing-ruby-ruby-programming) you will have already installed Ruby. But if you haven't done that, then now is the time to [install it](https://www.theodinproject.com/courses/ruby-programming/lessons/installing-ruby-ruby-programming) as you will need Ruby installed before we tackle installing Rails.

With Ruby installed, you're all set to install Rails and create our first Rails app to ensure everything went smoothly.

Before continuing, let's review a few best practices to keep in mind:

* Follow the directions closely, and don't skip over any sections.
* **Do NOT use `sudo` unless The Odin Project specifically says to do so.** Failing to follow this advice can cause *a lot* of headaches. In some instances, you might see a message in the terminal telling you to use `sudo` and/or to install something with `apt`. **Ignore what the terminal says** and follow the instructions below.
* Copy and paste the commands to avoid typos.
* If you stop working on this project partway through and come back to it later, be sure to use `cd` to move back inside your project directory so that the commands will work.

In this project, we're going to build a fully functional Rails application. The entire point of this exercise is to make sure that you have everything installed and working correctly on your computer. Do *not* worry if you don't fully understand what you're doing. You'll learn exactly what all of these commands are doing later on in the course. For now, go slowly, and be sure to follow **each and every** step closely. If you run into trouble, don't forget that you can always reach out for help on [Discord](https://discord.gg/hvqVr6d). You can also use the [Discord search function](https://support.discordapp.com/hc/en-us/articles/115000468588-Using-Search) to check if someone else had a similar problem and how they solved it.

**Reminder**: In this lesson you'll see shaded boxes that contain text like the one below.

~~~bash
whoami
~~~

Those are terminal commands and you'll need to enter them on the terminal in your operating system. Forgot how to open your terminal? Try googling "how to open terminal in [**your operating system**]".

### Your First Rails App

### Step 1: Create Your First Ruby on Rails Web Application

Don't worry if you don't totally understand what you are doing in these next steps. You will learn what all of this does later in The Odin Project curriculum. As long as the commands complete successfully, just keep going. The main reason we're doing this is to ensure everything is properly installed and configured.

#### Step 1.1: Install Rails and Bundler

We've previously installed Ruby, and now it's time to install Ruby on Rails. It's as simple as running one command!

~~~bash
gem install rails -v 5.2.3
~~~

Once the installation finishes, you can check if everything went well by running the following command:

~~~bash
rails -v
~~~

This should display the version of Rails installed on your system indicating the installation went smoothly.

#### Step 1.2: Lay the Groundwork

Next, if you haven't already done it, we need to create a directory that will house our project. You can name it anything you like!

**NOTE TO WSL USERS:** If you are on WSL, you MUST `cd` into your `Projects` folder to avoid issues.

~~~bash
mkdir odin_on_rails
~~~

Then, move into the new directory:

~~~bash
cd odin_on_rails
~~~

#### Step 1.3: Create the Application

This is where things might become more foreign. If you don't understand what's going on, just double check that you're typing in the correct commands and keep going. This section is meant to expose you to the process and to verify that everything is working. Again, it's OK to not understand what's going on at this point.

We're going to start by telling Rails to initialize the application for us. Then, we'll tell Rails to create a template for us so that we can get up and running.

~~~bash
rails new my_first_rails_app
~~~

This will do a bunch of things, and you'll see a lot of output in the terminal. If everything worked, you should see something similar to this in the last few lines of output:

~~~bash
Bundle complete! 18 Gemfile dependencies, 79 gems now installed.
Use `bundle info <gem name>` to see where a bundled gem is installed.
~~~

In the above process, Rails created a new directory for us. Let's `cd` into it now:

~~~bash
cd my_first_rails_app
~~~

Now, we're going to tell Rails to generate some templates for us. This will get us up and running in no time at all.

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

Now, go to your browser and visit [http://localhost:3000/cars](http://localhost:3000/cars) to see your application! **Note:** If you're using a VM, you will need to open the browser inside of your VM in order for this to work.

Go ahead and create a new car, and then refresh the page to verify it is working. Add as many cars as you'd like! When you're satisfied, go back to the terminal where Rails is running, and type `Ctrl + C` to end the application.

### Step 2: Initialize Git and Push to GitHub

To push our app to GitHub and Heroku, we need to use Git.

##### Step 2.1: Initialize git

To tell Git we want to use version control on the directory we are in, we need to initialize it.

Verify you're in the `my_first_rails_app` directory by using the `pwd` (print working directory) command.

~~~bash
$ pwd
/home/you/odin_on_rails/my_first_rails_app
~~~

Then, initialize the Git repo (short for "repository"):

~~~bash
git init
~~~

#### Step 2.2: Commit Changes

Now that Git is initialized, we need to tell Git to save all the files we have. First, we add our files to the staging area, which temporarily holds files before committing them. Don't worry if you don't understand all of this right now.

To stage all our files, type

~~~bash
git add .
~~~

Then, we'll commit the files. Be sure to include the quotation marks.

~~~bash
git commit -m "initial commit"
~~~

#### Step 2.3: Connect the Local Repository to the Remote Repository

At this point, we have our files on our own computer and can track changes made to our files over time. But what if we want to share the files with another computer or have multiple people work on the same project? For this functionality, we need a GitHub repository.

First, open [GitHub.com](https://github.com/) in your browser and sign in (if you aren't already). Next, look for your profile picture in the upper right-hand corner, click the "+" symbol next to it, and then click `New repository`. Give the repository a name (maybe `my_first_rails_app`?), and then click `Create Repository`.

On the next page, you'll see a bunch of commands listed. We're really only interested in the SSH URL at the top, so double check that `SSH` has been selected and then copy the URL.

Now, switch back over to the terminal to connect the project and GitHub by running two simple commands:

NOTE: Do not enter the `<` or `>` symbols. Replace those symbols and everything between them with the URL that you copied from GitHub.

~~~bash
git remote add origin <SSH URL from above>
git push -u origin master
~~~

Remember to replace `<SSH URL from above>` with the URL that you copied.

The terminal will start its work, pausing to verify your connection to GitHub.

A message from Github stating, "The authenticity of host 'github.com'..." may appear during this process. You can type `yes` and hit `Enter` to continue.

After the terminal finishes its magic, return to your GitHub repository and refresh the page. You should see a lot of files, starting with a folder called "app".

This marks the start of your Odin journey! Later on, you'll be able to look back at this repository and marvel over how far you've come!

### Step 3: Deploy Your Rails Application

Now that you've created your first Rails application, it's time to deploy it so that you can show the whole world! This process will allow you to send a link to people so they can see your app working. 

Recall, in the [previous lesson](https://www.theodinproject.com/courses/ruby-on-rails/lessons/preparing-for-deployment) we set up our Heroku account to deploy our web applications. If you have not already done so, go back and complete the lesson.

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

Then, we'll use VSCode to modify the `Gemfile`. Open your app in VSCode by typing `code .` (**NOTE: The period at the end is important!**) (WSL users: If you type `code .` and you see `system32` in the top left, you have created your application outside of the `Projects` directory we created earlier.)

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

#### Step 3.2.2: Install the Bundle

Next, we need to tell Ruby, Git, and Heroku that we've changed the `Gemfile`. To do this, we can simply run

~~~bash
bundle install --without production
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

#### Step 3.3: Add Changes to Git

Now that we have made some changes, we need to tell Git. This step is also required to successfully deploy to Heroku.

First, we'll check which files have been updated by running

~~~bash
git status
~~~

The output should look similar to the example below:

~~~bash
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   Gemfile
	modified:   Gemfile.lock
	modified:   config/routes.rb

no changes added to commit (use "git add" and/or "git commit -a")
~~~

Great! Now, let's add the changes to staging:

~~~bash
git add .
~~~

Then, commit the files in staging:

~~~bash
git commit -m 'updates for heroku deployment'
~~~

While we're here, we might as well push our changes to GitHub too:

~~~bash
git push origin master
~~~

#### Step 3.4: Push to Heroku

Now that we've committed the files, we can push to Heroku:

~~~bash
git push heroku master
~~~

  **UPDATE 2019-01-04:** If you run into an error on the next command stating that you need to use Bundler 2 or greater with this lockfile, you'll need to run:

```
heroku buildpacks:set https://github.com/bundler/heroku-buildpack-bundler2
```

  and then run the `git push heroku master` command again.

This will send the app you created to Heroku. There will be a lot of output in your console. Wait for it to finish.

#### Step 3.5: Migrate the Database on Heroku

Similar to what we did locally before we launched our app, we need to migrate the database on Heroku, which we can do with the Heroku CLI.

Run this command:

~~~bash
heroku run rails db:migrate
~~~

You might see some strange output, but as long as you do not have an error, you have successfully deployed a Rails application!

If you have an error, come to our [chat room](https://discord.gg/hvqVr6d), and ask for help. Be sure to include the entire output from your terminal when you ask your question.

#### Step 3.6: Visit Your New Application

It's time to see your app on the web! If you are using Linux or Mac, you can quickly open your app with the command below. If you are using WSL it will not open automatically, however, you will get an error message containing the link to copy and paste in your browser:

~~~bash
heroku open
~~~

Now go and play around with it!
