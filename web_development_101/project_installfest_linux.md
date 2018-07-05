## Installing Ruby on Linux

### Step 1: Install updates, packages and libraries

Before we can install Ruby, we need to install some base packages. We will use the terminal to install all of the programs.

#### Step 1.0: Opening the Terminal

* From your desktop, push `ctrl + alt + t`, or push the application menu (it might be in the lower left, or upper left corner depending on your version of Ubuntu. Other Linux distributions may have it in a different spot)

* and look for an icon labeled `terminal` and click that.

The rest of the installations will take place inside the terminal window.

Hot tip: You can copy from the terminal with `ctrl + shift + c` and paste with `ctrl + shift + v`.

#### Step 1.1: Updating

Now that you have your terminal open, we need to make sure your Linux distribution is updated. Run these commands. (You will have to put your password in when using `sudo`)

```
sudo apt-get update
sudo apt-get upgrade
```
Be sure to push `y` and then `enter` when it prompts you.

#### Step 2.2: Packages and Libraries

Next You will have to install some packages that do not come with Ubuntu out of the box, these are required for the next steps to complete properly.

Run this command in the terminal, this will download and install all of the required packages.


```
sudo apt-get install git curl nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev xclip
```

Be sure to press `y` then press `enter` again when it prompts you to! (You may, or may not, have to type your password after pressing enter.)

### Step 2: Installing Ruby

Now we are ready to install Ruby. To do so we are going to use a tool called `rbenv`, which makes it easy to install Ruby and manage it's versions.

#### Step 2.1: Installing Rbenv

First we are going to clone the repository using `git`. `git` is a version control program we installed in the last command. You will become familiar with this program later.

`git clone https://github.com/rbenv/rbenv.git ~/.rbenv`

Next we will add some commands to a configuration file that allows for `rbenv` to work properly. If you would like to know more, read [this](https://github.com/rbenv/rbenv). We will use `echo` for this to make it easy.

Run these commands in sequence, they most likely won't give you any output, so just trust that they work. If you get an error, seek help in the [Gitter chat room](https://gitter.im/TheOdinProject/theodinproject)

```
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
```

After running those commands, we will need to restart the terminal. Simply type `exit` and re-open the terminal like before.


Next we are going to install `ruby-build` to help compile the Ruby binaries.

Run these commands in the terminal. These commands will create a directory for the ruby-build plugin and download it to the proper directory.

```
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

Now we will verify `rbenv` has been installed correctly. This command will download a script and run it, that script verifies that `rbenv` has been properly downloaded and installed.

```
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

it should look something like this:

```
name@domain:~$ curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
Checking for `rbenv' in PATH: /home/name/.rbenv/bin/rbenv
Checking for rbenv shims in PATH: OK
Checking `rbenv install' support: /home/name/.rbenv/plugins/ruby-build/bin/rbenv-install (ruby-build 20180618)
Counting installed Ruby versions: none
  There aren't any Ruby versions installed under `/home/name/.rbenv/versions'.
  You can install Ruby versions like so: rbenv install 2.2.4
Checking RubyGems settings: OK
Auditing installed plugins: OK

```

If this comes out with some errors, try the directions under "installing Ruby" again.

If you still have issues, please come and ask questions in the [Gitter chat](https://gitter.im/TheOdinProject/theodinproject)

#### Step 2.2: Installing Ruby

Now it is time to install Ruby itself we will be using `rbenv` to do so, and now you will see why we installed it in the first place!

We will be using Ruby 2.5.1 in this install. Some tutorials might require a different version, but you can safely dis-regard and continue those tutorials. If you have trouble, you know where to ask for it! [The gitter chat!](https://gitter.im/TheOdinProject/theodinproject)

Run this command in the terminal:

```
rbenv install 2.5.1 --verbose
```

This will take some time. We use the `--verbose` flag so you can see what it is doing and can be sure it hasn't gotten stuck. Take this time to watch [this video](https://www.youtube.com/watch?v=GzkfOKkIteA), or get a glass of water while it installs.

When the last command is finished. We will have to set the Ruby version, so Linux will know which version to use when you try to execute `ruby`. After, we need to be sure it was installed correctly. To do that run:

```
rbenv global 2.5.1
ruby -v
```

That should return something like this:

```
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
```

If this doesn't show up, ask for help in [the gitter chat](https://gitter.im/TheOdinProject/theodinproject). If the correct output does show up, you have successfully installed ruby!
