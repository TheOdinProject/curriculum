### Guide: Install Ruby on MacOS

#### Step 1: Install packages and libraries

Before we can install Ruby, we need to install some base packages. We will use the terminal to install all of the programs.

1. In your Applications folder, find "Utilities" and double click "Terminal". Alternatively, using Spotlight (<kbd>Cmd</kbd> + <kbd>Space</kbd>) or Launchpad, type "Terminal".

   The rest of the instructions are done inside this terminal window and if you followed all the Foundations instructions, you should have already completed step 1.2 and 1.3.

1. The first thing you need to install is Xcode, which is a program provided by Apple for programming. Xcode will install many programs that are needed for Ruby and Git and should take 10-15 minutes to install.

   Run the following command in your terminal (you may need to click "Install" when prompted):

   ```bash
   xcode-select --install
   ```

1. The next program you need to install is [Homebrew](https://brew.sh/), which makes it easy to install other programs you'll need. From inside the terminal, run the following:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

   You will be prompted to enter your password. When typing your password, you may not get any visual feedback, but rest assured that your password is being entered. Once you're done typing your password, press <kbd>Enter</kbd>.

1. To verify the Homebrew installation, we can run:

   ```bash
   which brew
   ```

   If it outputs a certain path, you're good to go ahead! But if the terminal reads ```brew not found```, please go through the [MacOS instructions in the setting up git lesson](https://www.theodinproject.com/lessons/foundations-setting-up-git) to get homebrew installed.

Congratulations! You've installed the prerequisites!

### Step 2: Install rbenv

Now you're ready to install Ruby. We're going to use a tool called `rbenv`, which makes it easy to manage Ruby versions.

1. First, let's install `ruby-build`:

   ```bash
   brew install ruby-build
   ```

   `ruby-build` will make it possible to install our Ruby version of choice.

1. To install `rbenv`, run the following in your terminal:

   ```bash
   brew install rbenv
   ```

   Then, run this command:

   ```bash
   rbenv init
   ```

1. To confirm that everything went as it should, close your terminal and open a new one, then run:

   ```bash
   rbenv -v
   ```

   You should get an output with a version number **similar** to this:

   ```bash
   rbenv 1.2.0-14-gc6cc0a1
   ```

   If you do not get a version number at all (anything not starting with `rbenv 1...`), please ask for help in [our Discord server](https://discordapp.com/channels/505093832157691914/505093832157691916).

#### Step 3: Install Ruby

We can now (finally) install Ruby! Our curriculum currently uses version 3.4.6, which will allow you to complete this path's materials and content without error. We upgrade the material to accommodate newer versions as necessary. Without further ado, let's get going!

1. First, let's upgrade `ruby-build`:

   ```bash
   brew upgrade ruby-build
   ```

1. Now we're ready to install our desired version of Ruby:

   ```bash
   rbenv install 3.4.6 --verbose
   ```

   This command will take 10-15 minutes to complete. The `--verbose` flag will show you what's going on so you can be sure it hasn't gotten stuck. While it installs, take this time to watch [funny jumping goats video](https://www.youtube.com/watch?v=X2CYWg9-2N0) or to get a glass of water.

1. Once Ruby is installed, you need to tell rbenv which version to use by default. Inside the terminal, run:

   ```bash
   rbenv global 3.4.6
   ```

1. Now double check that this worked by checking that the current Ruby version in use is 3.4.6:

   ```bash
   ruby -v
   ```

   You should get an output with a version number **similar** to this:

   ```bash
   ruby 3.4.6pxx (20xx-xx-xx revision xxxxx) [x86_64-darwin18]
   ```

   If you don't see the output above, close and reopen the terminal window, then run the command again.

Well done! Pat yourself on the back! The hard part is done, and it's time to move on to the next lesson!

[Return to the Installing Ruby lesson](https://www.theodinproject.com/lessons/ruby-installing-ruby#assignment)
