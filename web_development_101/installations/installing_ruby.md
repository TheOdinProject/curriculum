### Introduction

Now that you've installed your OS and text editor of choice, it's time to install the actual programming language. This section is where you will encounter the most errors.

Before continuing, let's review a few best practices to keep in mind:

* Copy and paste the commands to avoid typos.
* Follow the directions closely, and don't skip over any sections.
* **Do NOT use `sudo` unless The Odin Project specifically says to do so.** Failing to follow this can cause a lot of headaches, and never run as the `root` user. In some instances you might see a message in the terminal telling you to use sudo and install something with `apt` ignore that and follow _our_ instructions for now.

Now, let's get started!

<details markdown="block">
<summary class="dropDown-header">Linux / WSL
</summary>

### Step 1: Install Updates, Packages and Libraries

Before we can install Ruby, we need to install some base packages.

#### Step 1.1: Open the Terminal

We'll use the terminal to install all of the programs.

If you're using Ubuntu or Xubuntu, simply press `Ctrl + Alt + T` to open the terminal. (This may work in other Linux distributions; you'll have to try!)

If you're using WSL, open the "Ubuntu 18.04" program from your Start menu.

**Quick tip:** In Linux, you can copy from the terminal with `ctrl + shift + c` and paste with `ctrl + shift + v`. In WSL, you can use `ctrl + c` to copy from the terminal, and you can right click at the prompt to paste the contents of the clipboard into the terminal, whether it's bash, PowerShell, or Command Prompt.

#### Step 1.2: Update Linux

The rest of the installation will take place inside the terminal window.  

First, we need to make sure your Linux distribution is up to date. Run these commands one by one. Because these commands use `sudo`, you will have to enter your password in order for them to run. When typing your password, you may not get any visual feedback, but rest assured that your password is being entered. Once you're done typing your password, press `enter`.

~~~bash
sudo apt update
sudo apt upgrade
~~~

When it prompts you, press `y` and then `enter`.

#### Step 1.3: Install Packages and Libraries

Next, you need to install some required packages that do not come preinstalled. Be sure to copy and paste this command.

~~~bash
sudo apt install curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
~~~

When it prompts you, press `y` and then `enter`. You may or may not have to type your password after pressing `enter`.

### Step 2: Install Ruby

Now you're ready to install Ruby. We're going to use a tool called `rbenv`, which makes it easy to install and manage Ruby versions.

#### Step 2.1: Install rbenv

First, you need to clone the rbenv repository using `git`, which is a version control program you installed with the last command. You will become more familiar with this program later on.

~~~bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
~~~

Next, we'll add some commands to allow rbenv to work properly. We can use the Linux `echo` command to make it easy.

Note: Run these commands one by one in sequence. They will not provide any output if done properly. Again, be sure to copy and paste these commands.

~~~bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exit
~~~

After running the final `exit` command, you will need to re-open the terminal (see Step 1.1 above).

Next, you need to install `ruby-build` to help compile the Ruby binaries. Run these commands in the terminal to create a directory for the ruby-build plugin and then download it to the proper directory.

~~~bash
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
~~~

Finally, run 

~~~bash
rbenv -v
~~~~

 from your terminal to verify that `rbenv` has been installed correctly. You should get an output with a version number similar to this:

~~~bash
rbenv 1.1.2-2-g4e92322
~~~

If you do not get a version number, please ask for help in the [Odin Project Chat Room](https://discordapp.com/channels/505093832157691914/505093832157691916).

#### Step 2.2: Install Ruby

It's finally time to install Ruby using `rbenv`!

Inside the terminal, run this command:

~~~bash
rbenv install 2.6.5 --verbose
~~~

This command will take 10-15 minutes to complete. The `--verbose` flag will show you what's going on so you can be sure it hasn't gotten stuck. While it installs, take this time to watch [this video](https://www.youtube.com/watch?v=GzkfOKkIteA) or to get a glass of water.

When the last command is finished, set the Ruby version and verify that it's working:

~~~bash
rbenv global 2.6.5
~~~

Then,

~~~bash
ruby -v
~~~

The above command should return something similar to this:

~~~bash
ruby 2.6.5pxx (20xx-xx-xx revision xxxxx) [x86_64-linux]
~~~
where x represents the version available at the time you installed Ruby.

Well done! Pat yourself on the back! The hard part is done, and it's time to move on to the next lesson!

</details>


<details markdown="block">
<summary class="dropDown-header">Raspbian for Raspberry Pi
</summary>

### Step 1: Install Updates, Packages and Libraries

Before we can re-install Ruby, we need to install some base packages.

#### Step 1.1: Open the Terminal

We'll use the terminal to install all of the programs. Open the terminal and verify your are using the newest version of the Raspbian OS on your RPi.

Running your RPi, simply press Ctrl + Alt + T to open the terminal. (This may work in other Linux distributions; you’ll have to try!) 

#### Step 1.2: Verify Raspbian Version

The rest of the installation will take place inside the terminal window.

First, we need to make sure your Raspbian distribution is up to date. For this installation, we are running Raspbian GNU/Linux 10 (buster)


~~~bash
cat /etc/os-release
~~~

#### Step 1.3: Download RVM

Next, you need to install Ruby Version Manager (rvm). (Be sure to copy and paste this command.)

~~~bash
\curl -sSL https://get.rvm.io | bash
~~~

### Step 1.4: Set Source 

To start using RVM, we need to ensure it loads properly. 

In the script below, replace ‘user’ with the name of your machine (which is most likely ‘pi’). 

You can enter this into the terminal to confirm the name of your machine and use the output to replace ‘user’

~~~bash
whoami
source /home/`user`/.rvm/scripts/rvm
~~~

#### Step 2: Install Ruby

Now you’re ready to re-install Ruby. We’re going to use a tool called rvm, which makes it easy to install and manage Ruby versions. We are using rvm 1.29.9, so let’s confirm this

~~~bash
rvm -v
~~~

#### Step 2.1: Install Ruby with RVM

~~~bash
rvm install ruby
~~~

After the installation completes, you should be running ruby 2.7.0p0. Let’s confirm this

~~~bash
ruby -v
~~~

#### Step 3: Install Ruby Gems

~~~bash
sudo apt-get install rubygems
~~~

#### Step 3.1: Update Gems

Let’s make sure our gem files are up-to-date.

~~~bash
gem update
~~~

#### Step 3.2 Install Ruby Patch 
 
~~~bash
sudo apt-get install ruby-dev zlib1g-dev liblzma-dev build-essential patch
~~~

When it prompts you, press `y` and then `enter`. You may or may not have to type your password after pressing enter.

#### Step 3.3 Gemset list

~~~bash
rvm gemset list
~~~

#### Step 4 Installing Rails

You should now be running Rails 6.0.2.1. Let’s confirm this

~~~bash
rails -v
~~~

#### Step 4.1 Making Rails Directory

We need to update some libraries to get Rails working properly on the RPi. Create a Rails directory.

~~~bash
mkdir odin_on_rails
~~~

Move to the directory.

~~~bash
cd odin_on_rails
~~~

#### Step 4.2 Making Rails App

Create a Ruby on Rails application. This will take some time, so get a cup of coffee if you need it.

~~~bash
rails new my_first_rails_app
~~~

#### Step 4.3 Rails installations

During the creation of your first Rails app, you will some requests to install additional  gems. Let’s move to our application.

~~~bash
cd my_first_rails_app 
~~~

We need to install Yarn, which is a Javascript package manager. Raspbian is a Debian based OS, so we’ll download and install the Debian / Ubuntu Stable (1.21.1) version of Yarn.

~~~bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
~~~

~~~bash
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
~~~

Install the files.

~~~bash
sudo apt update && sudo apt install yarn
~~~

We need to install webpack, whose main purpose is to bundle JavaScript files for usage in a browser.

~~~bash 
rails  webpacker:install
~~~
#### Step 5 Boot up the Server

With those additional gem installations, the Rails server works on the RPi.

~~~bash
rails server
~~~

In your web browser, visit http://localhost:3000 and you will see the Rails greeting screen.

Well done! Pat yourself on the back! The hard part is done, and it’s time to move on to the next lesson!

</details>


<details markdown="block">
<summary class="dropDown-header">MacOS
</summary>

### Step 1: Install Packages and Libraries

Before we can install Ruby, we need to install some base packages. We will use the terminal to install all of the programs.

#### Step 1.1: Open the Terminal

In your Applications folder, find "Utilities" and double click "Terminal". Alternatively, using Spotlight (`CMD + Space`) or Launchpad, type "Terminal".

The rest of the instructions are done inside this terminal window.

#### Step 1.2: Install Xcode

First, you need to install Xcode, which is a program provided by Apple for programming. Xcode will install many programs that are needed for Ruby and Git and should take 10-15 minutes to install.

Type `xcode-select --install` in your terminal and press `enter`. You may need to click "Install" when prompted.

#### Step 1.3: Install Homebrew

The next program you need to install is [Homebrew](https://brew.sh/), which makes it easy to install other programs you'll need. From inside the terminal, type the following:

~~~bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
~~~

You will be prompted to enter your password. When typing your password, you may not get any visual feedback, but rest assured that your password is being entered. Once you're done typing your password, press `enter`.

Congratulations! You've installed the prerequisites!

### Step 2: Install Heroku

Heroku is a place to host your Rails applications

#### Step 2.1: Install Heroku

Next, install Heroku:

~~~bash
brew install heroku/brew/heroku
~~~

This command will install the command line interface for Heroku, a free website that can host your Ruby on Rails applications. You'll learn more about this later.

### Step 3: Install Ruby

Now you're ready to install Ruby. We're going to use a tool called `rbenv`, which makes it easy to install and manage Ruby versions.

#### Step 3.1: Install rbenv

To install `rbenv`, run the following in your terminal:

~~~bash
brew install rbenv
~~~

Then, run this command:

~~~bash
rbenv init
~~~

You should see one of two messages after the command has run.

Either:

~~~bash
# Load rbenv automatically by appending
# the following to ~/.bash_profile:

eval "$(rbenv init -)"
~~~

Or:

~~~bash
# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init -)"
~~~

You'll do as it suggests by running either of the following commands in the terminal.

If the previous message stated you should append to your bash_profile then run:

~~~bash
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
~~~

Otherwise if it mentioned zshrc then run:

~~~bash
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
~~~

You'll notice nothing happened in the terminal. That's okay and is typical response for many terminal commands. At this point, take note of the page and step number you are on, close everything, do a full reboot and log back into your profile. After logging back in, re-open the terminal (see Step 1.1).

#### Step 3.3: Install Ruby

We can now (finally) install Ruby! We recommend using the latest version, which is currently 2.6.5:

~~~bash
rbenv install 2.6.5 --verbose
~~~

This command will take 10-15 minutes to complete. The `--verbose` flag will show you what's going on so you can be sure it hasn't gotten stuck. While it installs, take this time to watch [this video](https://www.youtube.com/watch?v=GzkfOKkIteA) or to get a glass of water.

Once Ruby is installed, you need to tell rbenv which version to use by default. Inside the terminal, type:

~~~bash
rbenv global 2.6.5
~~~

You can double check that this worked by typing `ruby -v` and checking that the output says version 2.6.5:

~~~bash
$ ruby -v
ruby 2.6.5pxx (20xx-xx-xx revision xxxxx)
~~~

If you don't see the output above, log off and log back on, then try again.

Well done! Pat yourself on the back! The hard part is done, and it's time to move on to the next lesson!

</details>
