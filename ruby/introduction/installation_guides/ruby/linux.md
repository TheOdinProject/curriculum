### Guide: Install Ruby on Linux

#### Step 1: Install updates, packages and libraries

Before we can install Ruby, we need to install some base packages.

1. We'll use the terminal to install all of the programs.

   If you're using Ubuntu or Xubuntu, press <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd> to open the terminal (this may or may not work in other Ubuntu flavours; you'll have to try).

   **Quick tip:** In Linux, you can copy from the terminal with <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd> and paste with <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd>.

1. The rest of the installation will take place inside the terminal window.

   First, we need to make sure your Linux distribution is up to date. Run these commands one by one. Because these commands use `sudo`, you will have to enter your password in order for them to run. When typing your password, you may not get any visual feedback, but rest assured that your password is being entered. Once you're done typing your password, press <kbd>Enter</kbd>.

   ```bash
   sudo apt update
   sudo apt upgrade
   ```

   When it prompts you, press <kbd>Y</kbd> and then <kbd>Enter</kbd>.

1. Next, you need to install some required packages that do not come preinstalled. Be sure to copy and paste this command.

   ```bash
   sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev libyaml-dev
   ```

   When it prompts you, press <kbd>Y</kbd> and then <kbd>Enter</kbd>. You may or may not have to type your password after pressing <kbd>Enter</kbd>.

#### Step 2: Install rbenv

To install Ruby, we're going to use a tool called `rbenv` which makes it easy to install and manage Ruby versions.

1. First, you need to clone the rbenv repository:

   ```bash
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   ```

1. Run the next command, which takes care of setting rbenv:

   ```bash
   ~/.rbenv/bin/rbenv init
   ```

   Now close the terminal window and open a new one to refresh.

1. Next, you need to install `ruby-build` to help compile the Ruby binaries. Run these commands in the terminal to create a directory for the ruby-build plugin and then download it to the proper directory.

   ```bash
   mkdir -p "$(rbenv root)"/plugins
   git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
   ```

1. Finally, run the following command from your terminal to verify that `rbenv` has been installed correctly:

   ```bash
   rbenv -v
   ```

   You should get an output with a version number **similar** to this:

   ```bash
   rbenv 1.2.0-14-gc6cc0a1
   ```

   If you do not get a version number at all (anything not starting with `rbenv 1...`), please ask for help in [our Discord server](https://discordapp.com/channels/505093832157691914/505093832157691916).

#### Step 3: Install Ruby

It's finally time to install Ruby using `rbenv`!

1. Inside the terminal, run this command:

   ```bash
   rbenv install 3.4.6 --verbose
   ```

   This command will take 10-15 minutes to complete. The `--verbose` flag will show you what's going on so you can be sure it hasn't gotten stuck. While it installs, take this time to watch [funny jumping goats video](https://youtu.be/X2CYWg9-2N0) or to get a glass of water.

   You may get this error message:

   ```bash
   ruby-build: definition not found: x.x.x

   See all available versions with `rbenv install --list`.

   If the version you need is missing, try upgrading ruby-build:

     git -C /home/itorja/.rbenv/plugins/ruby-build pull
   ```

   If so, we run the suggested command:

   ```bash
   git -C "$(rbenv root)"/plugins/ruby-build pull
   ```

1. Once Ruby is installed, you need to tell rbenv which version to use by default. Inside the terminal, run:

   ```bash
   rbenv global 3.4.6
   ```

1. Now check the version of Ruby your system is using by running:

   ```bash
   ruby -v
   ```

   The above command should return something similar to the below, where x represents the version available at the time you installed Ruby:

   ```bash
   ruby 3.4.6pxx (20xx-xx-xx revision xxxxx) [x86_64-linux]
   ```

Well done! Pat yourself on the back! The hard part is done, and it's time to move on to the next lesson!

[Return to the Installing Ruby lesson](https://www.theodinproject.com/lessons/ruby-installing-ruby#assignment)
