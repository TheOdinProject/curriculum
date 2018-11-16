### Welcome to The Odin Project
The Odin Project is an open source community dedicated to providing the best sources information to take you from zero to full-stack developer.  More information at [The Odin Project](https://www.theodinproject.com/about)

### Introduction

With Ruby installed we're all set to create your first Ruby on Rails application

### Your First Rails App

#### Step 1: Configuring Git and GitHub

Git is a very popular version control system. You will become very familiar with this piece of software so don't worry too much about understanding it at this point; there is a lesson to learn it later in the cirriculum.

GitHub is a service that allows you to upload your code, using git, and manage it through a nice web interface. GitHub and Git are not the same thing and are not the same company.

#### Step 1.1: Tell git who you are

For git to work properly, we will have to let it know who we are. This is so we can link a local git user (you) to GitHub. When working on a team, this allows people to see what you have committed and who committed any line of code.

These commands will configure git, be sure to fill out your own information in the quotes! (but leave the quotes)

~~~bash
git config --global user.name "Your Name"
git config --global user.email "yourname@example.com"
~~~

And to enable colorful output with `git`

~~~bash
git config --global color.ui auto
~~~

To verify things are working properly, enter these commands and verify the output matches your name and email address.

~~~bash
git config --get user.name
git config --get user.email
~~~

#### Step 1.2: Create a GitHub account or Sign in

Go to [GitHub.com](https://github.com/) and create an account! If you already have an account, sign in. You do not need to use the same email address you used before, but to keep things in line, it might be a good idea to use the same one.

#### step 1.3: Create an SSH key

An SSH key is a cryptographically secure identifier. It's like a really long password to identify your machine. GitHub uses SSH keys to allow you to upload to your repository without having to type in your username and password every time.

First we need to see if you have an SSH key already installed. Type this into the terminal:

~~~bash
ls ~/.ssh/id_rsa.pub
~~~

If the message in the console contains `No such file or directory` it means you don't have an SSH key so we'll need to create one. If you do not see `No such file or directory` in the output, you already have a key - Proceed to step 1.4

To create a new ssh key we can run `ssh-keygen` inside of our terminal. We will add the `-C` flag and our email address to make sure Github knows who we are.

~~~bash
ssh-keygen -C yourname@example.com
~~~

* When it prompts you for a location to save the generated key, just push `enter`.
* Next it will ask you for a password, enter one if you wish, though it's not required.

#### Step 1.4: Link your SSH key with GitHub

Now we will need to tell GitHub what our ssh key is, so we can push our code without typing in a password every time.

First we need to navigate to where GitHub receives our SSH key. Log into GitHub and then click your profile picture in the top right corner, then click `settings` in the drop-down. 
Next, on the left hand side, click `SSH and GPG keys`. Then click the green button in the top right that says `New SSH Key`. Name your key something that is descriptive enough for you to remember where it came from. Leave this window open while we do the next steps.

Now we need to copy our public ssh key, to do this we are going to use a command called `cat` to read the file to the console. (Note that `.pub` is important in this case)

~~~bash
cat ~/.ssh/id_rsa.pub
~~~

Now highlight and copy the output (starts with `ssh-rsa` and ends with your email address).

Now go back to the github.com browser window and paste the key we copied into the key field. Then click `Add SSH key`. Done! You've successfully added your key!

### Step 2: Creating your first Ruby on Rails web application

Don't worry if you do not totally understand what you are doing in these next steps. You will learn what all of this does later in The Odin Project curriculum. As long as the commands complete successfully, just keep going. The main reason we're doing this is to ensure everything is properly installed and configured.

#### Step 2.1: Installing Rails and Bundler

In the previous steps we've installed Ruby and now it's time to install Ruby on Rails. It's as simple as running one command!

~~~bash
gem install rails
~~~

#### Step 2.2: Setting up the ground-work

Next, if you haven't already done it, we need to create a directory that will house our project. You can name it anything you like! 

**NOTE TO WSL USERS:** If you are on WSL, you MUST `cd` into your `Projects` folder to avoid issues.

~~~bash
mkdir odin_on_rails
~~~

and then move into the new directory:

~~~bash
cd odin_on_rails
~~~

#### Step 2.3: Create the Application

This is where things might become more foreign, if you don't understand, just double check your typing and keep going. This section is meant to expose you to the process and verify everything is working. Again, it's OK to not understand at this point.

We are going to start by telling rails to initialize the application for us. We will then tell rails to create a template for us so we can get up and running.

~~~bash
rails new my_first_rails_app
~~~

This will do a bunch of things and you will see a lot of output into the terminal. If everything worked you should see something similar to this in the last few lines of output:

~~~bash
Bundle complete! 18 Gemfile dependencies, 79 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
~~~

In the above process, Rails created a new directory for us. Let's `cd` into it now:

~~~bash
cd my_first_rails_app
~~~

Now we tell rails to generate some templates for us. This will get us up and running in no time at all.

~~~bash
rails generate scaffold car make:string model:string year:integer
~~~

After generating the scaffolds, we need to migrate the database.

~~~bash
rails db:migrate
~~~

#### step 2.4: Start it up!

Now that you have created a rails application, we can start it up and see if it works!

run:

~~~bash
rails server
~~~

and go to your browser, and visit [http://localhost:3000/cars](http://localhost:3000/cars) to see your application! Go ahead and create a new car, and refresh the page to verify it is working! Add as many as you'd like!

When you are satisfied, go back to the terminal where rails is running, and push `ctrl + c` to end the application.

### Step 3: Initializing Git and Pushing to GitHub

In order to push our app to Github and Heroku we need to use git.

##### Step 3.1: Initializing git

To tell git we want to watch the directory we are in, we need to initialize it.

Verify you're in the `my_first_rails_app` directory by using the `pwd` (Print Working Directory) command. 

~~~bash
$ pwd
/home/you/odin_on_rails/my_first_rails_app
~~~

Then initialize the git repo

~~~bash
git init
~~~

#### Step 3.2: Committing changes

With that set up, we need to tell git to save all the files we have. First we add it to staging. this is an area to temporarily hold files before committing them. Don't worry if you don't understand what you are doing yet.

To stage all our files, run

~~~bash
git add .
~~~

Then we will commit the files. Be sure to take note of the quotation marks.

~~~bash
git commit -m "initial commit"
~~~

#### Step 3.3: Hooking our local repository to the remote repository

At this point we have our files on our own computer and can track changes made to our file over time. But what if we want to share with another computer or have multiple people work on our project with us? For this we'll need a GitHub repository.

First we'll open [GitHub.com](https://github.com/) in the browser and sign in (if you aren't already). Next, look for your profile picture in the upper right hand corner, click the + symbol next to it, and create a __new repository__. Give the repository a name (Maybe `my_first_rails_app`?), then click __Create Repository__.

On the next page you'll see a bunch of commands listed. We're really only interested in the SSH url at the top so double check the `SSH` has been selected and copy the url.

We'll move back to the terminal to connect the project and Github by running two simple commands:

~~~bash
git remote add origin <SSH URL from Above>
git push -u origin master
~~~

replacing `<SSH URL from Above>` with the URL that you copied.

The terminal will start it's work, pausing to verify that you're okay connection to GitHub 

A message from Github, 'The authenticity of host 'github.com'...', may appear during the process. You can type `yes` and hit enter to continue.

After the terminal finishes it's magic, return to your GitHub profile and refresh the page. You should see a lot of files, starting with a folder called "app."

This marks the start of your Odin Journey! Later on you'll be able to look back at this repository and marvel over how far you've come!

#### Step 4: Deployment of a Rails Application

Now that you have created your first rails application, it's time to deploy it so you can show the whole world! This will allow you to send a link to people and they will see it working.

#### Step 4.1: Create a Heroku account

Go to [the heroku website](https://www.heroku.com/) and create an account using the same email address you used for github and git.

#### Step 4.2: Heroku cli

After activating your account from the email they sent you. We will install the Heroku command line to interact with the Heroku service. We will use `curl` to download a script and run it to install Heroku.

Run this command:

~~~bash
curl https://cli-assets.heroku.com/install.sh | sh
~~~

Then typing `heroku version` should result with something similar to:`heroku/7.5.1 linux-x64 node-v10.5.0`


#### Step 4.3: Adding your SSH key to Heroku

This lets Heroku know what machine the commands are coming from, for the same reason as GitHub.

run

~~~bash
heroku keys:add
~~~

Then press `y`, and then `enter`. Now type in your email address you used to create your heroku account, then press `enter`. Then the password for your Heroku account. Then press `y` and `enter` to allow Heroku to upload your public SSH key.

#### Step 4.4: Creating a Heroku application from a local rails application

First run:

~~~bash
heroku create
~~~

Then run `git remote show` and verify you see `heroku` in the output.

#### Step 4.5: Preparing rails for Heroku Deployment

Heroku uses a slightly different setup than what we have on our machine. We are going to configure the application to play nicely with both.

#### Step 4.5.1: Configuring the Gemfile

To deploy a rails application we will need to change some settings.

First we need to open the `Gemfile` and edit it.

In your terminal, type `ls` and verify you can see `Gemfile` in the output. If you don't navigate to the directory you have created in Steps 4.2 and 4.3.

Then we will use VSCode to modify our `Gemfile`. Open your app in VSCode by typing `code .` (WSL users: If you type `code .` and you see `system32` in the top left, you have created your application outside of the `Projects` directory we created earlier.)

When VSCode opens you should see a list of files on the left side of the screen. Click to open `Gemfile` then 

delete the line that says:

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

Then save the file. You can leave VSCode open. We're going to be coming back to it, but for the next step go back to your terminal.

#### Step 4.5.2: Installing the Bundle

Next we need to tell ruby, git, and heroku that we've changed the `Gemfile`. To do this we can simply run

~~~bash
bundle install --without production
~~~

#### Step 4.5.3: Configuring the root route

The next thing we need to edit is the `routes.rb` file, and set our root route. This is so we can send the application without having to append `/cars` at the end. We will be using VSCode to do so again.

So go back to VSCode and expand the `config` folder in the left hand side file list. One of the files inside the folder will be named `routes.rb`. Open it up and make it match the example below:

~~~ruby
Rails.application.routes.draw do
  root 'cars#index'
  resources :cars
end
~~~

Save the file. You can close VSCode now; the rest of the steps take place in the terminal.

#### Step 4.6: Adding Changes to git

Now that we have made some changes need to tell git. This is required to successfully deploy to Heroku as well.

We will first check which files have been updated by running `git status`:

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

Great, now let's add the changes to staging

~~~bash
git add .
~~~

then commit the files in staging:

~~~bash
git commit -m 'updates for heroku deployment'
~~~

While we are here, we might as well push our changes to GitHub too:

~~~bash
git push origin master
~~~

#### Step 4.7: Pushing to Heroku

Now that we've commited the files we can push to Heroku:

~~~bash
git push heroku master
~~~

This will send the app you created to Heroku. There will be a lot of output in your console. Wait for this to finish.

Most of this input you can ignore for now, but take note of the line a couple lines above your command prompt that will look something like this:

~~~bash
remote:        https://random-words-73975.herokuapp.com/ deployed to Heroku
~~~

This is the link to your new site! Yes, you have published something to the internet! You can click it now, but we aren't quite done setting everything up just yet.

#### Step 4.8: Migrate the DB on Heroku

Like we did locally before we launched our app, we need to migrate the database. We need to do this on Heroku, so we can use the Heroku-CLI to do so.

Run this command:

~~~bash
heroku run rails db:migrate
~~~

You might see some strange output, as long as you do not have an error, you have successfully deployed a rails application! 

If you have an error, come to the [Gitter tech support chat room](https://gitter.im/TheOdinProject/tech_support), and ask for help, be sure to include the entire output from your terminal.

#### Step 4.9: Visit your new application

Now It's time to see your app on the web! If you are not using WSL, to quickly open it, type:

~~~bash
heroku open
~~~

and play around with it! 

### Step 5: Let us know how it went!

You have successfully completed the installations. Congratulations!!! This was __the hardest part__ of the entire Odin Project.

You probably felt like you were in way over your head and you didn't understand much of what you were doing. That's 100% normal. Hang in there. You can do this! And we've got your back.
