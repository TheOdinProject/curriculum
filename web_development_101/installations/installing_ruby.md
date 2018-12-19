### Introduction

Now that you've installed your OS and text editor of choice, it's time to install the actual programming language. This section is where you will encounter the most errors.

Before continuing, let's review a few best practices to keep in mind:

* Copy and paste the commands to avoid typos.
* Do NOT use `sudo` unless the command specifically says to do so.
* Follow the directions closely, and don't skip over any sections.

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

First, we need to make sure your Linux distribution is up to date. Run these commands one by one. Because these commands use `sudo`, you will have to enter your password in order for them to run.

~~~bash
sudo apt-get update
sudo apt-get upgrade
~~~

When it prompts you, press `y` and then `enter`.

#### Step 1.3: Install Packages and Libraries

Next, you need to install some required packages that do not come preinstalled. Be sure to copy and paste this command.

~~~bash
sudo apt-get install curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
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

Finally, run `rbenv -v` from your terminal to verify that `rbenv` has been installed correctly. You should get an output with a version number similar to this:

~~~bash
$ rbenv -v
rbenv 1.1.1-39-g59785f6
~~~

If you do not get a version number, please ask for help in the [Odin Project Chat Room](https://discordapp.com/channels/505093832157691914/505093832157691916).

#### Step 2.2: Install Ruby

It's finally time to install Ruby using `rbenv`!

Inside the terminal, run this command:

~~~bash
rbenv install 2.5.3 --verbose
~~~

This command will take some time. The `--verbose` flag will show you what's going on so you can be sure it hasn't gotten stuck. While it installs, take this time to watch [this video](https://www.youtube.com/watch?v=GzkfOKkIteA) or to get a glass of water.

When the last command is finished, set the Ruby version and verify that it's working:

~~~bash
rbenv global 2.5.3
~~~

Then,

~~~bash
ruby -v
~~~

The above command should return something similar to this:

~~~bash
ruby 2.5.3pxx (20xx-xx-xx revision xxxx) [x86_64-linux]
~~~
where x represents the version available at the time you installed Ruby.

Well done! Pat yourself on the back! The hard part is done, and it's time to move on to the next lesson!

</details>


<details markdown="block">
<summary class="dropDown-header">MacOS
</summary>

### Step 1: Install Packages and Libraries

Before we can install Ruby, we need to install some base packages. We will use the terminal to install all of the programs.

#### Step 1.0: Open up your Terminal

* In your Applications folder find "Utilities" and double click on "Terminal".

* Alternatively use Spotlight (`CMD + Space`) or Launchpad and type "Terminal".

The rest of the installations will take place inside of this terminal window.

#### Step 1.1: Installing xcode

Type `xcode-select --install` into your terminal and press enter. You may need to click "Install" when prompted.

This will install XCode - A program provided by Apple for programming. It will install a lot of necessary programs we need for Ruby and Git. This should take 10-15 minutes to install.

#### Step 1.2: Installing homebrew

Now that XCode is finished installing, we can continue. The next program we need to install is called [homebrew](https://brew.sh/). Homebrew makes it easy to install other programs we will need. From inside of the terminal type:

~~~bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
~~~

You will be prompted to enter your password. When typing your password you may not get any visual feedback, but rest assured your password is being entered. Once you are done typing your password, press enter.

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
brew install heroku/brew/heroku
~~~

This will install the command line interface for Heroku, a free website that can host your Ruby on Rails application. More about this later.

### Step 3: Installing Ruby

The next program we need to install is Ruby. Ruby is a scripting language very similar to Python (if you've heard of that before). 

#### Step 3.1: Installing rbenv

To make our lives easier in the long run, we will install a Ruby version manager. This version manager, named "rbenv", makes it easy to switch between different versions of ruby.

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

eval "$(rbenv init -)
~~~

We will do as it suggests by running the following in the terminal:

~~~bash
`echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
~~~

At this point we need to restart the terminal for changes to take effect. Click the red "x" and then re-open the terminal as we did above.


##### Step 3.3: Installing Ruby

We can now (finally) install Ruby!  We recommend using the latest version, which currently is 2.5.3:

~~~bash
rbenv install 2.5.3 --verbose
~~~

This will install Ruby version 2.5.3. The `--verbose` flag is used to show you that things are happening. A lot of stuff will be displayed on your screen. It's rbenv doing it's thing. Hang out for 10-15 minutes until your prompt (the `$` sign) is visible once again.

Once installed, we need to tell rbenv which version to use by default. Inside of the terminal type:

~~~bash
rbenv global 2.5.3
~~~

We can double check our work by typing `ruby -v` and checking the output for version 2.5.3

~~~bash
$ ruby -v
ruby 2.5.3p82 (2018-09-12)
~~~

Way to go!  With Ruby installed it should be smooth sailing from here on out.

</details>
