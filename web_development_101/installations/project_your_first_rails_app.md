### Introduction

With Ruby installed, you're all set to create your first Ruby on Rails application!

### Your First Rails App

#### Step 1: Configure Git and GitHub

Git is a very popular version control system. You'll become very familiar with this piece of software throughout TOP, so don't worry too much about understanding it at this point. There are multiple lessons focused on Git later in the cirriculum.

GitHub is a service that allows you to upload your code using Git and to manage your code with a nice web interface. GitHub and Git are not the same thing or even the same company.

#### Step 1.1: Setup Git

For Git to work properly, we need to let it know who we are so that it can link a local Git user (you) to GitHub. When working on a team, this allows people to see what you have committed and who committed each line of code.

The commands below will configure Git. Be sure to enter your own information inside the quotes (but include the quotation marks)!

~~~bash
git config --global user.name "Your Name"
git config --global user.email "yourname@example.com"
~~~

To enable colorful output with `git`, type

~~~bash
git config --global color.ui auto
~~~

To verify things are working properly, enter these commands and verify that the output matches your name and email address.

~~~bash
git config --get user.name
git config --get user.email
~~~

#### Step 1.2: Create a GitHub Account or Sign In

Go to [GitHub.com](https://github.com/) and create an account! If you already have an account, sign in. You do not need to use the same email address you used before, but it might be a good idea to use the same one to keep things simple.

#### step 1.3: Create an SSH Key

An SSH key is a cryptographically secure identifier. It's like a really long password used to identify your machine. GitHub uses SSH keys to allow you to upload to your repository without having to type in your username and password every time.

First, we need to see if you have an SSH key already installed. Type this into the terminal:

~~~bash
ls ~/.ssh/id_rsa.pub
~~~

If the message in the console contains `No such file or directory`, then you don't have an SSH key, and you'll need to create one. If you do not see `No such file or directory` in the output, you already have a key; proceed to step 1.4.

To create a new SSH key, run the following command inside your terminal. The `-C` flag followed by our email address ensures that GitHub knows who we are.

~~~bash
ssh-keygen -C yourname@example.com
~~~

* When it prompts you for a location to save the generated key, just push `Enter`.
* Next, it will ask you for a password; enter one if you wish, but it's not required.

#### Step 1.4: Link Your SSH Key with GitHub

Now, you need to tell GitHub what your SSH key is so that you can push your code without typing in a password every time.

First, you'll navigate to where GitHub receives our SSH key. Log into GitHub and click on your profile picture in the top right corner. Then, click on `Settings` in the drop-down menu. 

Next, on the left-hand side, click `SSH and GPG keys`. Then, click the green button in the top right corner that says `New SSH Key`. Name your key something that is descriptive enough for you to remember where it came from. Leave this window open while you do the next steps.

Now you need to copy your public SSH key. To do this, we're going to use a command called [`cat`](http://www.linfo.org/cat.html) to read the file to the console. (Note that the `.pub` file extension is important in this case.)

~~~bash
cat ~/.ssh/id_rsa.pub
~~~

Highlight and copy the output, which starts with `ssh-rsa` and ends with your email address. 

Now, go back to GitHub in your browser window and paste the key you copied into the key field. Then, click `Add SSH key`. You're done! You've successfully added your SSH key!

### Step 2: Create Your First Ruby on Rails Web Application

Don't worry if you don't totally understand what you are doing in these next steps. You will learn what all of this does later in The Odin Project curriculum. As long as the commands complete successfully, just keep going. The main reason we're doing this is to ensure everything is properly installed and configured.

#### Step 2.1: Install Rails and Bundler

We've previously installed Ruby, and now it's time to install Ruby on Rails. It's as simple as running one command!

~~~bash
gem install rails
~~~

#### Step 2.2: Lay the Groundwork

Next, if you haven't already done it, we need to create a directory that will house our project. You can name it anything you like! 

**NOTE TO WSL USERS:** If you are on WSL, you MUST `cd` into your `Projects` folder to avoid issues.

~~~bash
mkdir odin_on_rails
~~~

Then, move into the new directory:

~~~bash
cd odin_on_rails
~~~

#### Step 2.3: Create the Application

This is where things might become more foreign. If you don't understand what's going on, just double check that you're typing in the correct commands and keep going. This section is meant to expose you to the process and to verify that everything is working. Again, it's OK to not understand what's going on at this point.

We're going to start by telling Rails to initialize the application for us. Then, we'll tell Rails to create a template for us so that we can get up and running.

~~~bash
rails new my_first_rails_app
~~~

This will do a bunch of things, and you'll see a lot of output in the terminal. If everything worked, you should see something similar to this in the last few lines of output:

~~~bash
Bundle complete! 18 Gemfile dependencies, 79 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
~~~

In the above process, Rails created a new directory for us. Let's `cd` into it now:

~~~bash
cd my_first_rails_app
~~~

Now, we're going to tell Rails to generate some templates for us. This will get us up and running in no time at all.

~~~bash
rails generate scaffold car make:string model:string year:integer
~~~

**(Feb 8, 2019) NOTE: If you get an error with the above command, follow these steps:**

 1. Open your Gemfile in a text editor. If you use VSCode, you can do that by typing `code Gemfile`. Change the line that reads `gem ‘sqlite3’` to `gem 'sqlite3' , '~> 1.3.13'`. Save the file.
 2. In the terminal, run `bundle install`.
 3. Now that SQLite is working properly, run `rails generate scaffold car make:string model:string year:integer` again.


After generating the scaffolds, we need to migrate the database.

~~~bash
rails db:migrate
~~~

#### Step 2.4: Start Up Your App

Now that you have created a Rails application, you can start it up and see if it works!

In the terminal, type

~~~bash
rails server
~~~

Now, go to your browser and visit [http://localhost:3000/cars](http://localhost:3000/cars) to see your application! Go ahead and create a new car, and then refresh the page to verify it is working. Add as many cars as you'd like!

When you're satisfied, go back to the terminal where Rails is running, and type `Ctrl + C` to end the application.

### Step 3: Initialize Git and Push to GitHub

To push our app to GitHub and Heroku, we need to use Git.

##### Step 3.1: Initialize git

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

#### Step 3.2: Commit Changes

Now that Git is initialized, we need to tell Git to save all the files we have. First, we add our files to the staging area, which temporarily holds files before committing them. Don't worry if you don't understand all of this right now.

To stage all our files, type

~~~bash
git add .
~~~

Then, we'll commit the files. Be sure to include the quotation marks.

~~~bash
git commit -m "initial commit"
~~~

#### Step 3.3: Connect the Local Repository to the Remote Repository

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

#### Step 4: Deploy Your Rails Application

Now that you've created your first Rails application, it's time to deploy it so that you can show the whole world! This process will allow you to send a link to people so they can see your app working.

#### Step 4.1: Create a Heroku Account

Go to the [Heroku website](https://www.heroku.com/) and create an account using the same email address you used for GitHub and Git.

#### Step 4.2: Heroku CLI

Activate your account from the email they sent you. Now, we'll install the Heroku command line so that we can interact with the Heroku service. We will use `curl` to download a script and run it to install the Heroku CLI.

Run this command:

~~~bash
curl https://cli-assets.heroku.com/install.sh | sh
~~~

Then, type `heroku version`, which should return something similar to `heroku/7.5.1 linux-x64 node-v10.5.0`.


#### Step 4.3: Add your SSH Key to Heroku

Adding your SSH key lets Heroku know what machine the commands are coming from, similar to how GitHub uses SSH keys.

In your terminal, type

~~~bash
heroku keys:add
~~~

Next, press `y` and then `Enter`. Now, type in the email address you used to create your Heroku account and press `Enter`. Then, type in the password for your Heroku account. Next, press `y` and `Enter` to allow Heroku to upload your public SSH key.

#### Step 4.4: Create a Heroku Application

First, run

~~~bash
heroku create
~~~

Then, run 

~~~bash
git remote show
~~~

Verify that you see `heroku` in the output.

#### Step 4.5: Prepare Rails for Heroku Deployment

Heroku uses a slightly different setup than what we have on our machine. We need to configure the application to play nicely with both.

#### Step 4.5.1: Configure the Gemfile

To deploy a Rails application, we need to change some settings.

First, we need to open the `Gemfile` and edit it.

In your terminal, type `ls` and verify that you see `Gemfile` in the output. If you don't see it, navigate to the directory you created in Steps 2.2 and 2.3.

Then, we'll use VSCode to modify the `Gemfile`. Open your app in VSCode by typing `code .` (**NOTE: The period at the end is important!**) (WSL users: If you type `code .` and you see `system32` in the top left, you have created your application outside of the `Projects` directory we created earlier.)

When VSCode opens, you should see a list of files on the left side of the screen. Click on `Gemfile` to open it in the editor. Then, delete the line that says,

~~~ruby
gem 'sqlite3' , '~> 1.3.13'
~~~

Replace the line you just deleted with the following:

~~~ruby
group :development, :test do
 gem 'sqlite3' , '~> 1.3.13'
end

group :production do
  gem 'pg'
end
~~~

Then, save the file. You can leave VSCode open since we're going to be coming back to it, but for the next step, go back to your terminal.

#### Step 4.5.2: Install the Bundle

Next, we need to tell Ruby, Git, and Heroku that we've changed the `Gemfile`. To do this, we can simply run

~~~bash
bundle install --without production
~~~

#### Step 4.5.3: Configure the Root Route

The next thing we need to edit is the `routes.rb` file to set our root route. We're going to this so that we can see the application without having to append `/cars` at the end of the URL. 

Go back to VSCode and expand the `config` folder in the file list at the left-hand side of the screen. One of the files inside the folder will be named `routes.rb`. Open `routes.rb` and make it match the example below:

~~~ruby
Rails.application.routes.draw do
  root 'cars#index'
  resources :cars
end
~~~

Save the file. You can close VSCode now; the rest of the steps take place in the terminal.

#### Step 4.6: Add Changes to Git

Now that we have made some changes, we need to tell Git. This step is also required to successfully deploy to Heroku.

First, we'll check which files have been updated by running `git status`:

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

#### Step 4.7: Push to Heroku

Now that we've commited the files, we can push to Heroku:

~~~bash
git push heroku master
~~~

  **UPDATE 2019-01-04:** If you run into an error on the next command stating that you need to use Bundler 2 or greater with this lockfile, you'll need to run: 

```
heroku buildpacks:set https://github.com/bundler/heroku-buildpack-bundler2
``` 

  and then run the `git push heroku master` command again.

This will send the app you created to Heroku. There will be a lot of output in your console. Wait for it to finish.

You can ignore most of this output for now, but take note of the line a couple lines above your command prompt that will look something like this:

~~~bash
remote:        https://random-words-73975.herokuapp.com/ deployed to Heroku
~~~

This is the link to your new site! Yes, you have published something to the internet! You can click it now, but we aren't quite done setting everything up just yet.

#### Step 4.8: Migrate the Database on Heroku

Similar to what we did locally before we launched our app, we need to migrate the database on Heroku, which we can do with the Heroku CLI.

Run this command:

~~~bash
heroku run rails db:migrate
~~~

You might see some strange output, but as long as you do not have an error, you have successfully deployed a Rails application! 

If you have an error, come to our [chat room](https://discord.gg/5v6s6rs), and ask for help. Be sure to include the entire output from your terminal when you ask your question.

#### Step 4.9: Visit Your New Application

It's time to see your app on the web! If you are not using WSL, to quickly open your app, type

~~~bash
heroku open
~~~

and play around with it! 

### Step 5: Let us know how it went!

You have successfully completed the installations. Congratulations!!! This was __the hardest part__ of the entire Odin Project.

You probably felt like you were in way over your head, and you probably didn't understand much of what you were doing. That's 100% normal. Hang in there. You can do this! And we've got your back.
