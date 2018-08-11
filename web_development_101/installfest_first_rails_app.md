### Introduction

Click on the section below related to the operating system you set up in the prerequisites; be sure to follow the directions closely! It is best to copy and paste the commands to avoid typos. You will get plenty of experience typing commands later, it is vital these are correct to avoid unnecessary issues. Most problems arise from people typing things incorrectly or not reading everything. **Don't be one of those people.**

### Step 0: Pick your operating system.

This isn't as monumental as chosing shirts or skins, and you can always decide to change later, but you need to pick what operating system you are using to do your developing. Different OSses have different procedures in installing Ruby.

If you have a Mac, the choice is easy. Just click the triangle next to "MacOS" and follow the instructions that appear.

If you don't have a Mac, it's also easy: click the other triangle.

<details markdown="block">
<summary class="dropDown-header">Linux / Linux Virtual Machine / WSL
</summary>

### Step 1: Install updates, packages and libraries

Before we can install Ruby, we need to install some base packages. We will use the terminal to install all of the programs.

#### Step 1.0: Opening the Terminal

A shortcut for Ubuntu and it's derivatives is pushing `ctrl + alt + t` to open the terminal. (This may work in other Linux distributions, you'll have to try!)

* push the application menu (it might be in the lower left, or upper left corner depending on your version of Ubuntu. Other Linux distributions may have it in a different spot). You can also use `super` to open the menu. ( `super` is the windows key )

* and look for an icon labeled `terminal` and click that.

On Windows with WSL, if you took advantage of the optional step, just open your shortcut to Ubuntu. Alternatively you can:

* Open `PowerShell` from either the `cmd+x` menu or the search bar (remember, you don't need to be as an admin anymore.)

* Open the old school `Command Prompt`.

* Type `wsl` into either `PowerShell` or `Command Prompt`.

The rest of the installations will take place inside the terminal window.

Quick tip: You can copy from the terminal with `ctrl + shift + c` and paste with `ctrl + shift + v` in Linux.
(In WSL you can use `ctrl + c` like you are used to to copy from the terminal. to paste into the terminal--either bash, PowerShell, or Command Prompt--right click at the prompt and it will paste the contents of the clipboard.)

#### Step 1.1: Updating

Now that you have your terminal open, we need to make sure your Linux distribution is updated. Run these commands. (You will have to put your password in when using `sudo`)

~~~bash
sudo apt-get update
sudo apt-get upgrade
~~~

Be sure to push `y` and then `enter` when it prompts you.

#### Step 1.2: Packages and Libraries

Next You will have to install some packages that do not come with Ubuntu out of the box, these are required for the next steps to complete properly.

#### Step 1.2.0: Install Git (if you haven't already)

If you are on WSL, you will already have installed Git for Windows. If not, run this command in the terminal to install it:

~~~bash
sudo apt-get install git
~~~

#### Step 1.2.1: Install the Rest of the Required Packages:

Run this command in the terminal, this command will download the required packages for building Ruby. **Your Ruby install will fail if you miss this command**.

~~~bash
sudo apt-get install curl nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
~~~

Be sure to press `y` then press `enter` again when it prompts you to! (You may, or may not, have to type your password after pressing enter.)

### Step 2: Installing Ruby

Now we are ready to install Ruby. To do so we are going to use a tool called `rbenv`, which makes it easy to install Ruby and manage it's versions. 

Before continuing, run `rvm -v`, if it says `Command 'rvm' not found...` You are good to go. 

Otherwise you have rvm already installed and you can update Ruby using [this](https://rvm.io/rvm/basics#installing-rubies) documentation. Or, the preferred option, remove rvm and install rbenv. To do that, simply run `rvm implode`, then continue with this guide.

#### Step 2.1: Installing Rbenv

First we are going to clone the repository using `git`. `git` is a version control program we installed in the last command. You will become familiar with this program later.

~~~bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
~~~

Next we will add some commands to a configuration file that allows for `rbenv` to work properly. If you would like to know more, read [this](https://github.com/rbenv/rbenv). We will use `echo` for this to make it easy.

Run these commands in sequence, they most likely won't give you any output, so just trust that they work. If you get an error, seek help in the [Gitter chat room](https://gitter.im/TheOdinProject/theodinproject)

~~~bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
~~~

After running those commands, we will need to restart the terminal. Simply type `exit` and re-open the terminal like before.


Next we are going to install `ruby-build` to help compile the Ruby binaries.

Run these commands in the terminal. These commands will create a directory for the ruby-build plugin and download it to the proper directory.

~~~bash
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
~~~

Now we will verify `rbenv` has been installed correctly. This command will download a script and run it, that script verifies that `rbenv` has been properly downloaded and installed.

~~~bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
~~~

it should look something like this:

~~~bash
name@domain:~$ curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
Checking for `rbenv' in PATH: /home/name/.rbenv/bin/rbenv
Checking for rbenv shims in PATH: OK
Checking 'rbenv install' support: /home/name/.rbenv/plugins/ruby-build/bin/rbenv-install (ruby-build 20180618)
Counting installed Ruby versions: none
There aren't any Ruby versions installed under `/home/name/.rbenv/versions'.
You can install Ruby versions like so: rbenv install 2.2.4
Checking RubyGems settings: OK
Auditing installed plugins: OK
~~~

If this comes out with some errors, try the directions under "installing Ruby" again.

If you still have issues, please come and ask questions in the [Gitter chat](https://gitter.im/TheOdinProject/theodinproject)

#### Step 2.2: Installing Ruby

Now it is time to install Ruby itself and we will be using `rbenv` to do so, and now you will see why we installed it in the first place!

We will be using Ruby 2.5.1 in this install. Some tutorials might require a different version, but you can safely dis-regard and continue those tutorials. If you have trouble, you know where to ask for it! [The Gitter chat!](https://gitter.im/TheOdinProject/theodinproject)

Run this command in the terminal:

~~~bash
rbenv install 2.5.1 --verbose
~~~

This will take some time. We use the `--verbose` flag so you can see what it is doing and can be sure it hasn't gotten stuck. Take this time to watch [this video](https://www.youtube.com/watch?v=GzkfOKkIteA), or get a glass of water while it installs.

When the last command is finished. We will have to set the Ruby version, so Linux will know which version to use when you try to execute `ruby`. After, we need to be sure it was installed correctly. To do that run:

~~~bash
rbenv global 2.5.1
ruby -v
~~~

That should return something like this:

~~~bash
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
~~~

If this doesn't show up, ask for help in [the Gitter chat](https://gitter.im/TheOdinProject/theodinproject). If the correct output does show up, you have successfully installed ruby!

</details>


<details markdown="block">
<summary class="dropDown-header">MacOS
</summary>

### Step 1: Install Packages and Libraries

Before we can install Ruby, we need to install some base packages. We will use the terminal to install all of the programs.

#### Step 1.0: Open up your Terminal

* In your Applications folder find "Utilities" and double click on "Terminal".

* Alternatively use Spotlight (`cmd+SPC`) or Launchpad and type "Terminal".

The rest of the installations will take place inside of this terminal window.

#### Step 1.1: Installing xcode

Type `xcode-select --install` and press enter. You may need to click "Install" when prompted.

This will install XCode - A program provided by Apple for programming. It will install a lot of necessary programs we need for Ruby and Git.  This should take 10-15 minutes to install.

#### Step 1.2: Installing homebrew

Now that XCode is finished installing, we can continue. The next program we need to install is called [homebrew](https://brew.sh/). Homebrew makes it easy to install other programs we will need. From inside of the terminal type:

~~~bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
~~~

You will be prompted to enter your password. When typing your password you may not get any visual feedback, but rest assured your password _is_ being entered. Once you are done typing your password, press enter.

Congratulations! You've installed the prerequisites! When you're ready let's move on and install Git.

### Step 2: Installing git and Heroku

Git is one of the most powerful tools in your toolbelt. Git tracks changes in the code, allows collaboration and many other things. Not to worry - You'll learn more about this soon!

#### Step 2.1: Updating git

MacOS already comes with a version of git, but we should update it to the latest version. To do that it's as simple as:

~~~bash
brew install git
~~~

This will install the latest version of git. Easy, right?

#### Step 2.2: Installing Heroku

Let's repeat the installation process with Heroku:

~~~bash
brew install heroku
~~~

This will install the command line interface for Heroku, a free website that can host your Ruby on Rails application. More about this later.

### Step 3: Installing Ruby

The next program we need to install is Ruby.  Ruby is a scripting language very similar to Python (if you've heard of that before).  

#### Step 3.1: Installing rbenv

To make our lives easier in the long run, we will install a Ruby version manager to install Ruby. This version manager, named "rbenv", makes it easy to switch between different versions of ruby.

Before continuing, run `which rvm`, `which rbenv` and `which chruby`, if it responds `/usr/local/bin/<rvm/chruby/rbenv>` you already have a Ruby version manager installed. Installing two will cause strange issues. If you need help please come and ask questions in the [Gitter chat](https://gitter.im/TheOdinProject/theodinproject). If the commands did nothing you can continue.

To install rbenv, run the following in your terminal:

~~~bash
brew install rbenv
~~~

then run:

~~~bash
rbenv init
~~~

You should see the following after the command has run:

~~~bash
# Load rbenv automatically by appending 
# the following to ~/.bash_profile: 

eval "$(rbenv init -)"
~~~

We will do as it suggests by running the following in the terminal:

~~~bash
`echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
~~~

These commands will use `brew` to install rbenv and add it to your profile so Rbenv loads when you open your terminal. By using `brew` to manage the installation we make it easy to update and uninstall `Rbenv` in the future if we want to. Don't worry if you don't know what this means.

At this point we need to restart the terminal for changes to take effect.  Click the red "x" and then re-open the terminal as we did above.

#### Step 3.2: Installing rbenv cont.

From inside of the new terminal enter the following:

~~~bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
~~~

If you see something *very, very similar* to the message below you are ready to proceed, if not you should seek assistance in the Gitter channel

~~~bash
Checking for `rbenv' in PATH: /usr/local/bin/rbenv Checking for rbenv shims in PATH: OK Checking `rbenv install' support: /usr/local/bin/rbenv-install (ruby-build 20180618) Counting installed Ruby versions: none There aren't any Ruby versions installed under `/Users/<YourNameHere>/.rbenv/versions'. You can install Ruby versions like so: rbenv install 2.2.4 Checking RubyGems settings: OK Auditing installed plugins: OK
~~~


##### Step 3.3: Installing Ruby

We can now (finally) install Ruby!  We recommend using the latest version, which currently is 2.5:

~~~bash
rbenv install 2.5.1 --verbose
~~~

This will install Ruby version 2.5.1. The `--verbose` flag is used to show you that things are happening. A lot of stuff will be displayed on your screen. It's rbenv doing it's thing. Hang out for 10-15 minutes until your prompt (the `$` sign) is visible once again.

The last thing we need to do is tell rbenv to use this new version of Ruby by default. Again, inside of the terminal type:

~~~bash
rbenv global 2.5.1
~~~

</details>

---

### Your First Rails App

#### Step 1: Configuring Git and GitHub

Git is a very popular version control system that can handle any size of project efficiently. You will become very familiar with this piece of software. Don't worry too much about understanding it at this point, later there is a lesson to learn it.

GitHub is a service that allows you to upload your code, using git, and manage it through a nice interface. GitHub and Git are not the same thing, and are not the same company. GitHub is used due to the ease of working with others.

#### Step 1.1: Tell git who you are

For git to work properly, we will have to let it know who we are. This is so we can link a local git user (you) to GitHub. When working on a team, this allows people to see what you have committed and who committed any line of code.

These commands will configure git, be sure to fill out your own information in the quotes! (but leave the quotes)

~~~bash
git config --global user.name "Herman Brown"
git config --global user.email "hbrown@example.com"
~~~

To enable colorful output with `git` enter:

~~~bash
git config --global color.ui auto
~~~

into the console.

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
ls ~/.ssh/id_rsa
~~~

If the message in the console contains `No such file or directory` continue on, if you see `/home/name/.ssh/id_rsa`, or something similar, go to Step 1.4.

Since you do not have an SSH key already installed, we need to create one. The next command will create an SSH key and prompt you for some information. Be sure to use the same email address as you have configured with git. (If you have forgotten, run `git config --get user.email` to remind yourself)

~~~bash
ssh-keygen -C hbrown@example.com
~~~

* When it prompts you for a location to save the generated key, just push `enter`.
* Next it will ask you for a password
  * If you are on your own computer, and are not worried about using a password here, push `enter` twice.
  * If you are not the sole user of the computer (this is an office computer, family computer, etc) you may want to enter a password
    * type a secure password then push `enter` (the password will not show up while typing)
    * type the same password again and push `enter`

After doing the steps above, you should see a fancy randomart image!

Now add the key to the authentication agent. This is so we can use the generated key automatically.

~~~bash
ssh-add ~/.ssh/id_rsa
~~~

( If that does not work, try running `eval $(ssh-agent)` and then run the command above again. )

If you configured the key with a password, enter it now, and push `enter`.

The output should let you know you have added the identity.

#### Step 1.4: Link your SSH key with GitHub

Now we will need to tell GitHub what our ssh key is, so we can push our code without typing in a password every time.

First we need to navigate to where GitHub receives our SSH key. Log into GitHub and then click your profile picture in the top right corner, then click `settings` in the drop-down. Next, on the left hand side, click `SSH and GPG keys`. After you have done that, click the button in the top right that says `New SSH Key`. Name your key something that is descriptive enough for you to remember where it came from. Leave this window open while we do the next steps.

Now we need to copy our public ssh key, to do this we are going to use a command called `cat` to read the file to the console. (Note that `.pub` is important in this case)

~~~bash
cat ~/.ssh/id_rsa.pub
~~~

Now highlight the output, which should start with `ssh-rsa` and end with your email address. Then copy that output.

* In Linux you can use `ctrl + shift + c` to copy from the console, or right click in most cases.
* In WSL you can just use `ctrl + c` to copy from the terminal.

Now go back to the **github.com** browser window we opened earlier, and paste the key we copied ( from the console with the `cat` command ) into the box that says `key`. Then click `Add SSH key`. You may need to enter your **github.com** password to continue. Then you will see your key added!

### Step 2: Creating your first Ruby on Rails web application

Don't worry if you do not totally understand what you are doing in these next steps. You will learn what all of this does later in The Odin Project curriculum. As long as the commands complete successfully, just keep going. The main reason we're doing this is to ensure everything is properly installed and configured.

#### Step 2.1: Installing Rails and Bundler

Now we need to install Rails itself. It's as simple as running the next command!

~~~bash
gem install rails
~~~

(This command might take a while to run. Also, if you are on WSL, you may see a warning: `Insecure world writeable dir /home/...` This is normal. It is a side effect of the interoperability of Windows and Linux. You could get rid of the warning by changing folder permissions, but in so doing, you could break the communication between your Windows and Linux systems)


After installing rails, we need to install `bundler`, this gem (Ruby package), is used to provide a consistent environment for Ruby applications. It also handles the dependencies gracefully.

~~~bash
gem install bundler
~~~

This command should take a lot less time than the last one.

#### Step 2.2: Setting up the ground-work

Next, if you haven't already done it, we need to create a directory that will house our project. You can name it anything you like! If you are on WSL, be sure to `cd` into your `Projects` folder you created in the prerequisites for Windows 10.

~~~bash
mkdir odin_on_rails
~~~

and then change to that directory:

~~~bash
cd odin_on_rails
~~~

#### Step 2.3: Actually create the application

This is where things might become more foreign, if you don't understand, just keep going. This section is firstly to help verify everything has been installed correctly, and expose you to the process. Again, it's OK to not understand at this point :) .

Now we are going to tell rails to initialize the application for us. We will then tell it to generate the scaffolds, which are sort of like a template, for us.

~~~bash
rails new my_first_rails_app
~~~

This will do a bunch of things and you will see a lot of output into the terminal. As long as nothing looks like an error, you can continue. Otherwise, come to [the Gitter chat room](https://gitter.im/TheOdinProject/theodinproject) for help.

Now that we have let rails do the heavy lifting for us, we need to move into the directory it has created for us.

~~~bash
cd my_first_rails_app
~~~

Now we tell rails to generate some scaffolding. Scaffolding is basically a template for our rails app, and sets up some working parts for us.

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

Now that we set up our application, we should start using version control. For that we use `git` which we downloaded earlier.

##### Step 3.1: Initializing git

To tell git we want to watch the directory we are in, we need to initialize it.

First verify what directory we are in using `pwd`. You should see something like this:

~~~bash
/home/name/odin_on_rails/my_first_rails_app
~~~

If you called your application something different, your output will be different here.

Once you have confirmed you are in the correct directory, (You can also type `ls` and verify you see a `Gemfile.lock` file in the output), run this:

~~~bash
git init
~~~

#### Step 3.2: Committing changes

Now that we have a git repository, we need to tell git to save what we have. First add it to staging, this is a palace to hold files before committing them. Don't worry if you don't understand what you are doing yet.

Run this command, which will add all the files of your project to staging:

~~~bash
git add .
~~~

Now we will commit them to git, this is telling git to remember what the files look like.

We do this by running this, remember the quotes are important:

~~~bash
git commit -m "initial commit"
~~~

#### Step 3.3: Hooking our local repository to the remote repository

At this point we have our files on our own computer and can track changes made to our file over time. But what if we want to share with another computer or have multiple people work on our project with us? For this we'll need a GitHub repository.

First we'll open [GitHub.com](https://github.com/) in the browser and sign in (if you aren't already). Next, look for your profile picture in the upper right hand corner, click the + symbol next to it, and create a `new repository`. Give the repository a name (Maybe `my_first_rails_app`?), then click `Create Repository` below the form. For your first project you shouldn't need to mess with any of the other options, but they're good to read over for future projects!

On your `Create Repository` page you'll see various commands listed. We know that we want to use SSH to connect to GitHub so **make sure `SSH` has been selected.** Look for the section that says "... or push an existing repository from the command line" and click the icon to the right of it to copy the text to your clipboard. Then paste it into the terminal we have open (Using CTRL + SHIFT + V in Linux or CTRL + V in WSL).

The terminal will start it's work, pausing to verify that you're okay connection to GitHub ('The authenticity of host 'github.com'...' will be displayed and you can safely click yes). After the terminal finishes, return to your GitHub profile and refresh the page. You should see a lot of files, starting with a folder called "app." If you do not see this in on your GitHub repository, ask for help in the [the Gitter chat room](https://gitter.im/TheOdinProject)

This marks the start of your Odin Journey! Later on you'll be able to look back at this repository and marvel over how far you've come!

#### Step 4: Deployment of a Rails Application

Now that you have created your first rails application, it's time to deploy it so you can show the whole world! This will allow you to send a link to people and they will see it working. (Note: we set up git in the last step, if you skipped it for whatever reason, you will need to `git init`, `git add .` and `git commit -m 'message'` before pushing to Heroku.)

#### Step 4.1: Create a Heroku account

Go to [the heroku website](https://www.heroku.com/) and create an account using the same email address you used for github and git.

#### Step 4.2: Heroku cli

After activating your account from the email they sent you. We will install the Heroku command line to interact with the Heroku service. We will use `curl` to download a script and run it to install Heroku. (source of script: https://devcenter.heroku.com/articles/heroku-cli)

Run this command:

~~~bash
curl https://cli-assets.heroku.com/install.sh | sh
~~~

Then running `heroku version` should result with something similar to:`heroku/7.5.1 linux-x64 node-v10.5.0`


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

To properly deploy a rails application, we will have to change some configuration in its files.

First we need to open the `Gemfile` and edit it.

In your terminal, type `ls` and verify you can see `Gemfile` in the output. If you don't navigate to the directory you have created in Steps 4.2 and 4.3.

Then we will use VSCode to modify our `Gemfile`. (If you haven't already installed it, go [here](https://code.visualstudio.com/). Don't worry, we'll wait.) Open your app in VSCode by typing `code .`

Once VSCode finishes starting up, there should be a tree view of your app on the left side of the screen. open `Gemfile` and

Delete the line that says:

~~~ruby
gem 'sqlite3'
~~~

And put this in its place:

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

Next we need to install the bundle, this ensures that all of the required dependencies are satisfied. That is as simple as typing this:

~~~bash
bundle install --without production
~~~

#### Step 4.5.3: Configuring the root route

The next thing we need to edit is the `routes.rb` file, and set our root route. This is so we can send the application without having to append `/cars` at the end. We will be using VSCode to do so again.

So go back to VSCode and expand the `config` folder in the tree view. one of the files inside will be `routes.rb`. Go ahead and open it up and make it match the example below:

~~~ruby
Rails.application.routes.draw do
  root 'cars#index'
  resources :cars
end
~~~

and save the file. You can close VSCode now if you want, but it won't hurt to leave it open either. either way, the rest of the steps take place in the terminal.

##### Step 4.6: Adding Changes to git

Now that we have made some changes, we should add the changes to git. This is required to successfully deploy to Heroku as well.

First run:

~~~bash
git add .
~~~

then:

~~~bash
git commit -m 'updates for heroku deployment'
~~~

While we are here, we might as well push our changes to GitHub:

~~~bash
git push
~~~

#### Step 4.7: Pushing to Heroku

After adding the edits to git, we now want to send the whole works off to Heroku.

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

Like we did locally before we launched our app, we need to migrate the database. We need to do this on Heroku, so we can use the Heroku-cli to do so.

Run this command:

~~~bash
heroku run rails db:migrate
~~~

You might see some strange output, as long as you do not have an error, you have successfully deployed a rails application! If you have an error, come to the [Gitter chat](https://gitter.im/TheOdinProject/theodinproject), and ask for help.

#### Step 4.9: Visit your new application

Now It's time to see your app on the web! If you are not using WSL, to quickly open it, type:

~~~bash
heroku open
~~~

and play around with it! 

If you are using WSL, `heroku open` will not open automatically, but remember that link in step 4.7? If you already visited it out of excitement, just refresh the page, if you haven't copy/paste it now and have a look! If nothing shows up, come ask for help in [the Gitter chat room](https://gitter.im/TheOdinProject)

### Step 5: Let us know how it went!

You have successfully completed the installations. Congratulations! If you have any comments, or suggestions, we would love to hear them. Talk to us either in the [the Gitter chat room](https://gitter.im/TheOdinProject), or on the Odin Project forms. You can always find these links in the top right corner, under community.
