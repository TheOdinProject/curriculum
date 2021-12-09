### Introduction

Before we start learning, we'll need to install Python first. This section is where you could potentially encounter a lot of errors.

Before continuing, let's review a few best practices to keep in mind:

* Copy and paste the commands to avoid typos.
* Follow the directions closely, and don't skip over any sections.
* **Do NOT use `sudo` unless The Odin Project specifically says to do so.** Failing to follow this can cause a lot of headaches, and never run as the `root` user. In some instances, you might see a message in the terminal telling you to use sudo and install something with `apt`. Ignore that and follow _our_ instructions for now.

Now, let's get started!

<details markdown="block">
<summary class="dropDown-header">Ubuntu / Xubuntu
</summary>

### Step 1: Install Updates, Packages and Libraries

Before we can install Python, we need to install some base packages.

#### Step 1.1: Open the Terminal

We'll use the terminal to install all of the programs.

If you're using Ubuntu or Xubuntu, simply press `Ctrl + Alt + T` to open the terminal. (This may work in other Linux distributions; you'll have to try!)

**Quick tip:** In Linux, you can copy from the terminal with `ctrl + shift + c` and paste with `ctrl + shift + v`.

#### Step 1.2: Check if You Already have Python Installed

Many Linux installations come with Python already installed. Use this [guide](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-programming-environment-on-an-ubuntu-20-04-server) to see if you already have Python installed. You'll have to enter these commands in the terminal. Optionally, follow the guide to set up virtual environments which can be used to ensure none of the dependencies you install for one project won't disrupt the dependencies you install for another project.

#### Step 2: Confirm Python and pip are Installed

Run the following commands in your terminal. Make sure your Python version is at least 3.6:

~~~bash
$ python -V
Python 3.X.X
~~~

Make sure pip is installed correctly too:

~~~bash
$ pip -V
pip 21.X.X
~~~

If you don't see the output above, log off and log back on, then try again.

Well done! Pat yourself on the back! The hard part is done, and it's time to move on to the next lesson!


</details>


<details markdown="block">
<summary class="dropDown-header">MacOS
</summary>

### Step 1: Install Packages and Libraries

Before we can install Python, we need to install some base packages. We will use the terminal to install all of the programs.

#### Step 1.1: Open the Terminal

In your Applications folder, find "Utilities" and double click "Terminal". Alternatively, using Spotlight (`CMD + Space`) or Launchpad, type "Terminal".

The rest of the instructions are done inside this terminal window.

#### Step 1.2: Install Xcode

First, you need to install Xcode, which is a program provided by Apple for programming. Xcode will install many programs that are needed for Ruby and Git and should take 10-15 minutes to install.

Type `xcode-select --install` in your terminal and press `enter`. You may need to click "Install" when prompted.

#### Step 1.3: Install Homebrew

The next program you need to install is [Homebrew](https://brew.sh/), which makes it easy to install other programs you'll need. From inside the terminal, type the following:

~~~bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
~~~

You will be prompted to enter your password. When typing your password, you may not get any visual feedback, but rest assured that your password is being entered. Once you're done typing your password, press `enter`.

Congratulations! You've installed the prerequisites!

### Step 2: Install Python

Now you're ready to install Python and its package manager, `pip`. Use `brew` to do so:

~~~bash
$ brew install python
~~~

This will take a few minutes.

You can double check that this worked by typing `Python -V` and checking that the output says version 3.6 or higher:

~~~bash
$ python -V
Python 3.X.X
~~~

Make sure pip is installed correctly too:

~~~bash
$ pip -V
pip 21.X.X
~~~

If you don't see the output above, log off and log back on, then try again.

Well done! Pat yourself on the back! The hard part is done, and it's time to move on to the next lesson!

</details>

### Extras

If you are using Visual Studio Code as your IDE, you can install the "Python" extension which will provide you with semantic highlighting and formatting support. This is optional, but it is a quick install; go to the "Extensions" tab in VSC (ctrl+shift+x or cmd+shift+x), search "Python", and click install on the first one. Congratulations, the extension is now installed (you can also uninstall the extension from here).

If you are using a different IDE, a quick Google search such as "Python programming extensions for (your IDE here)" should provide you with the resources to get started. Free support extensions can help make your programming go more smoothly, and there are tons of extensions for tons of languages (not just Python).
