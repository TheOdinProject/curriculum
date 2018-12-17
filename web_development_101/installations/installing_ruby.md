### Introduction

Now that you've installed your OS of choice it's time to start installing the actual programming language.  This section is where most of the errors will occur.

Before continuing let me point out a few Gotchas:

* Copy and Paste the commands to avoid typos.

* Do NOT use `sudo` unless the command specifically says to do so.

* Follow directions closely. It is easy to skip over a section.

With those out of the way, let's get started:

<details markdown="block">
<summary class="dropDown-header">Linux / WSL
</summary>

### Step 1: Install updates, packages and libraries

Before we can install Ruby, we need to install some base packages. We will use the terminal to install all of the programs.

#### Step 1.0: Opening the Terminal

Using Ubuntu or Xubuntu, simply press `Ctrl + Alt + T` to open the terminal. (This may work in other Linux distributions, you'll have to try!)

If you're using WSL, open up the "Ubuntu 18.04" program from your start menu.



Quick tip: You can copy from the terminal with `ctrl + shift + c` and paste with `ctrl + shift + v` in Linux.
(In WSL you can use `ctrl + c` like you are used to to copy from the terminal. to paste into the terminal--either bash, PowerShell, or Command Prompt--right click at the prompt and it will paste the contents of the clipboard.)

#### Step 1.1: Updating

The rest of the installation will take place inside the terminal window.  

First, we need to make sure your Linux distribution is updated. Run these commands one by one. (You will have to put your password in when using `sudo`)

~~~bash
sudo apt-get update
sudo apt-get upgrade
~~~

Be sure to push `y` and then `enter` when it prompts you.

#### Step 1.2: Packages and Libraries

Next You will have to install some packages that do not come preinstalled. These are required for the next steps.

Be sure to copy and paste this command.

~~~bash
sudo apt-get install curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
~~~

Be sure to press `y` then press `enter` again when it prompts you to! (You may, or may not, have to type your password after pressing enter.)

### Step 2: Installing Ruby

Now we are ready to install Ruby. To do so we are going to use a tool called `rbenv`, which makes it easy to install and manage Ruby versions. 

#### Step 2.1: Installing Rbenv

First we are going to clone the repository using `git` - a version control program we installed in the last command. You will become familiar with this program later.

~~~bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
~~~

Next we will add some commands to allow `rbenv` to work properly. We will use the linux `echo` command to this to make it easy.

Note: Run these commands one by one in sequence. They will not provide any output if done properly. Again, be sure to copy and paste these commands.

~~~bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exit
~~~

After running the final `exit` command, you will need to re-open the terminal like before.

Next we need to install `ruby-build` to help compile the Ruby binaries.

Run these commands in the terminal. These commands will create a directory for the ruby-build plugin and download it to the proper directory.

~~~bash
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
~~~

Now we will verify `rbenv` has been installed correctly. Run `rbenv -v` from your terminal and you should get an output with version number like below:

~~~bash
$ rbenv -v
rbenv 1.1.1-39-g59785f6
~~~

If you do not get a version number, please seek help in the [Odin Project Chat Room](https://discordapp.com/channels/505093832157691914/505093832157691916)

#### Step 2.2: Installing Ruby

Finally it's time to install Ruby using `rbenv` !

Run this command within your terminal:

~~~bash
rbenv install 2.5.3 --verbose
~~~

This will take some time. We use the `--verbose` flag so you can see what it is doing and can be sure it hasn't gotten stuck. Take this time to watch [this video](https://www.youtube.com/watch?v=GzkfOKkIteA), or get a glass of water while it installs.

When the last command is finished, we will set the Ruby version and verify it's working:

~~~bash
rbenv global 2.5.3
~~~

then

~~~bash
ruby -v
~~~

which should return ruby 2.5.3:

~~~bash
ruby 2.5.3pxx (20xx-xx-xx revision xxxx) [x86_64-linux]
~~~
where x represents the versioning available at the time you install ruby.

Well Done! Pat yourself on the back. The hard part is done! Go ahead and move on to the next lesson!

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

This will install XCode - A program provided by Apple for programming. It will install a lot of necessary programs we need for Ruby and Git.  This should take 10-15 minutes to install.

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

The next program we need to install is Ruby.  Ruby is a scripting language very similar to Python (if you've heard of that before).  

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

At this point we need to restart the terminal for changes to take effect.  Click the red "x" and then re-open the terminal as we did above.


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
