## Your First Rails App

### Step 1: Configuring Git and GitHub

Git is a very popular version control system that can handle any size of project efficiently. You will become very familiar with this piece of software. Don't worry too much about understanding it at this point, later there is a lesson to learn it.

GitHub is a service that allows you to upload your code, using git, and manage it thorough a nice interface. GitHub and Git are not the same thing, and are not the same company. GitHub is used due to the ease of working with others.

#### Step 1.1: Tell git who you are

For git to work properly, we will have to let it know who we are. This is so we can link a local git user (you) to GitHub. When working on a team, this allows people to see what you have committed and who committed any line of code.

These commands will configure git, be sure to fill out your own information in the quotes! (but leave the quotes)

```
git config --global user.name "Herman Brown"
git config --global user.email "hbrown@example.com"
```

To enable colors enter:

```
git config --global color.ui auto
```

To verify things are working properly, enter these commands and verify the output matches your name and email address.

```
git config --get user.name
git config --get user.email
```

#### Step 1.2: Create a GitHub account

Go to [GitHub.com](https://github.com/) and create an account! If you already have an account, sign in.

#### step 1.3: Create an SSH key

An SSH key is a cryptographically secure identifier. It's like a really long password to identify your machine. GitHub uses SSH keys to allow you to upload to your repository without having to type in your username and password every time.

First we need to see if you have an SSH key already installed. Type this into the terminal:

```
ls ~/.ssh/id_rsa
```

If the message in the console contains `No such file or directory` continue on, if you see `/home/name/.ssh/id_rsa`, or something similar, go to Step 3.4.

Since you do not have an SSH key already installed, we need to create one. The next command will create an SSH key and prompt you for some information. Be sure to use the same email address as you have configured with git. (If you have forgotten, run `git config --get user.email` to remind yourself)

```
ssh-keygen -C hbrown@example.com
```

* When it prompts you for a location to save the generated key, just push `enter`.
* Next it will ask you for a password
  * If you are on your own computer, and are not worried about using a password here, push `enter` twice.
  * If you are not the sole user of the computer (this is an office computer, family computer, etc) you may want to enter a password
    * type a secure password then push `enter` (the password will not show up while typing)
    * type the same password again and push `enter`

After doing the steps above, you should see a fancy randomart image!

Now add the key to the authentication agent. This is so we can use the generated key automatically.

```
ssh-add ~/.ssh/id_rsa
```

If you configured the key with a password, enter it now, and push `enter`.

The output should let you know you have added the identity.

#### Step 1.4: Link your SSH key with GitHub

Now we will need to tell GitHub what our ssh key is, so we can push our code without typing in a password every time.

First we need to navigate to where GitHub receives our SSH key. Log into GitHub and then click your profile picture in the top right corner, then click `settings` in the drop-down. Next, on the right hand side, click `SSH and GPG keys`. After you have done that, click the button in the top right that says `New SSH Key`. Name your key something that is descriptive enough for you to remember where it came from. Leave this window open while we do the next steps.

Now we need to copy our public ssh key, we installed a tool called `xclip` in the beginning to make this easy. Run the command below. (Note that the `.pub` is important in this case)

```
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Now go back to the github.com browser window we opened earlier, and paste the key we copied with `xclip` into the box that says `key`. Then click `Add SSH key`. You may need to enter your github.com password to continue. Then you will see your key added!

### Step 2: Creating your first Ruby on Rails web application

Don't worry if you do not totally understand what you are doing in these next steps. You will learn what all of this does later in The Odin Project curriculum. As long as the commands complete successfully, just keep going.

#### Step 2.1: Installing Rails and Bundler

Now we need to install Rails itself. It's as simple as running the next command!

```
gem install rails
```

(This command might take a while to run.)


After installing rails, we need to install `bundler`, this gem (ruby package), is used to provide a consistent environment for ruby applications. It handles the dependencies gracefully.

```
gem install bundler
```

This command should take a lot less time than the last one.

#### Step 2.2: Setting up the ground-work

Next we need to create a directory that will house our project and change to that directory. You can name it anything you like!

```
mkdir odin_on_rails
cd odin_on_rails
```

#### Step 2.3: Actually create the application

This is where things might become more foreign, if you don't understand, just keep going. This section is firstly to help verify everything has been installed correctly, and expose you to the process. Again, it's OK to not understand at this point :) .

Now we are going to tell rails to initialize the application for us. We will then tell it to generate the scaffolds, which are sort of like a template, for us.

```
rails new my_first_rails_app
```

This will do a bunch of things and you will see a lot of output into the terminal. As long as nothing looks like an error, you can continue. Otherwise, come to [the Gitter chat room](https://gitter.im/TheOdinProject) for help.

Now that we have let rails do the heavy lifting for us, we need to move into the directory it has created for us.

```
cd my_first_rails_app
```

Now we tell rails to generate some scaffolding. Scaffolding is basically a template for our rails app, and sets up some working parts for us.

```
rails generate scaffold drink name:string temperature:integer
```

After generating the scaffolds, we need to migrate the database.

```
rails db:migrate
```

#### step 2.4: Start it up!

Now that you have created a rails application, we can start it up and see if it works!

run:
```
rails server
```
and go to your browser, and visit [http://localhost:3000/drinks] to see your application! Go ahead and create a new drink, and refresh the page to verify it is working! Add as many as you'd like!

When you are satisfied, go back to the terminal where rails is running, and push `ctrl + c` to end the application.

### Step 3: Initializing Git and Pushing to GitHub

Now that we set up our application, we should start using version control. For that we use `git` which we downloaded earlier.

#### Step 3.1: Initializing git

To tell git we want to watch the directory we are in, we need to initialize it.

First verify what directory we are in using `pwd`. You should see something like this:

```
/home/name/odin_on_rails/my_first_rails_app
```

If you called your application something different, your output will be different here.

Once you have confirmed you are in the correct directory, (You can also type `ls` and verify you see a `Gemfile.lock` file in the output), run this:

```
git init
```

#### Step 3.2: Committing changes

Now that we have a git repository, we need to tell git to save what we have. First add it to staging, this is a palace to hold files before committing them. Don't worry if you don't understand what you are doing yet.

Run this command, which will add all the files of your project to staging:
```
git add .
```

Now we will commit them to git, this is telling git to remember what the files look like.

We do this by running this, remember the quotes are important:

```
git commit -m "initial commit"
```

#### Step 3.3: Hooking our local repository to the remote repository

We need to tell git where to send the files, to do this we will need to create a remote repository and take the address it creates, and add it to git.

First open [GitHub](https://github.com/) in the browser and sign in if you aren't already. Next click the `+` symbol next to your profile picture in the upper right and click `New Repostiory`. Then give the repository a name, and click the `Create Repository` button below the form. You can leave all the other options alone.

GitHub should have taken you to a page That has some commands listed. We are going to follow the section that says `...or push an existing repository from the command line`. Click the icon to the right of that section and it will copy the commands to your clipboard. Then paste them into the terminal we have open. (`ctrl + shift + v` will paste into a terminal).

You may see a message that says something along the lines of `The authenticity of host 'github.com (192.30.253.112)' can't be established`, you can safely type `yes` and press `enter` into the console.

After the commands have been run, you should refresh the browser page and you should see a lot of files, starting with a folder called `app`. If you do not see this, ask for help in the gitter chat room.

This marks the start of your Odin Journey! You can look back and find this application to see how you have progressed and changed over time.

### Step 4: Deployment of a Rails Application

Now that you have created your first rails application, it's time to deploy it so you can show the whole world! This will allow you to send a link to people and they will see it working. (Note: we set up git in the last step, if you skipped it for whatever reason, you will need to `git init`, `git add .` and `git commit -m 'message'` before pushing to Heroku.)

#### Step 4.1: Create a Heroku account

Go to [the heroku website](https://www.heroku.com/) and create an account using the same email address you used for github and git.

#### Step 4.2: Heroku cli

After activating your account from the email they sent you. We will install the Heroku command line to interact with the Heroku service. We will use `curl` to download a script and run it to install Heroku. (source of script: https://devcenter.heroku.com/articles/heroku-cli)

Run this command:

```
curl https://cli-assets.heroku.com/install.sh | sh
```
Then running `heroku version` should result with something similar to:`heroku/7.5.1 linux-x64 node-v10.5.0`


#### Step 4.3: Adding you SSH key to Heroku

This lets Heroku know what machine the commands are coming from, for the same reason as GitHub.

run

```
heroku keys:add
```

Then press `y`, and then `enter`. Now type in your email address you used to create your heroku account, then press `enter`. Then the password for your Heroku account. Then press `y` and `enter` to allow Heroku to upload your public SSH key.

#### Step 4.4: Creating a Heroku application from a local rails application

First run:

```
heroku create
```

Then run `git remote show` and verify you see `heroku` in the output.


#### Step 4.5: Preparing rails for Heroku Deployment

##### Step 4.5.1: Configuring the Gemfile


To properly deploy a rails application, we will have to change some configuration in it's files.

First we need to open the `Gemfile` and edit it.

In your terminal, type `ls` and verify you can see `Gemfile` in the output. If you don't navigate to the directory you have created in Steps 4.2 and 4.3.

Then we will use `gedit`, a plain text editor, to modify our `Gemfile`. Run `gedit Gemfile` in the terminal.

Delete the line that says:

```
gem 'sqlite3'
```

And put this in it's place:

```
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
```
Then save the file, and then close the text editor.

##### Step 4.5.2: Installing the Bundle (Needs better explanation)

Next we need to install the bundle, that is as simple as typing this:

```
bundle install --without production
```

##### Step 4.5.3: Configuring the root route

The next thing we need to edit is the `routes.rb` file, and set our root route. This is so we can send the application without having to append `/drinks` at the end. We will be using `gedit` to do so again.

First make sure we are in the root directory of our application, type `ls` and verify you see `Gemfile` in the terminal output.

Next we need to edit the `routes.rb` file. To do this run:

```
gedit config/routes.rb
```

Find the line that says: `Rails.application.routes.draw do`, and place:

```
root 'drinks#index'
```

after the line.

#### Step 4.6: Adding Changes to git

Now that we have made some changes, we should add the changes to git. This is required to successfully deploy to Heroku as well.

First run:

```
git add .
```

then:

```
git commit -m 'updates for heroku deployment'
```

While we are here, we might as well push our changes to GitHub:

```
git push
```

#### Step 4.7: Pushing to Heroku

After adding the edits to git, we now want to send the whole works off to Heroku.

```
git push heroku master
```

This will send the app you created to Heroku. There will be a lot of output in your console. Wait for this to finish.

#### Step 4.8: Migrate the DB on Heroku

Like we did locally before we launched our app, we need to migrate the database. We need to do this on Heroku, so we can use the Heroku-cli to do so.

Run this command:

```
heroku run rails db:migrate
```

You might see some strange output, as long as you do not have an error, you have successfully deployed a rails application! If you have an error, come to the gitter chat, and ask for help.

#### Step 4.9: Visit your new application

Now It's time to see your app on the web! To quickly open it, type:
```
heroku open
```
 and play around with it! If nothing shows up, come ask for help in the gitter chat room.

### Step 5: Let us know how it went!

You have successfully completed the installations. Congratulations! If you have any comments, or suggestions, we would love to hear them. Talk to us either in the Gitter chat room, or on the Odin Project forms. You can always find these links in the top right corner, under community.
