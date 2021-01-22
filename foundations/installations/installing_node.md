### Introduction


Node is a JavaScript runtime environment that allows you to run JavaScript outside of your web browser, which means that now you can run JavaScript code in the Backend(server) also.
There are some tools that is required for you to use Node in your system.

We're going to install it using `nvm` (Node Version Manager), because it makes it easy to change node versions and upgrade node.  There is another tool called `npm` (Node Package Manager) that you will use later to install the various libraries and tools used in javascript environment.  It can be easy to confuse these two so read carefully!

Node is also very easy to install using nvm, so this should go quickly :)

# Installation in Linux

### Step 0: Prerequisites 
To install NVM properly, you'll need `curl`. Simply run the command below:

~~~bash
sudo apt install curl
~~~ 

### Step 1: Downloading and Installing `nvm`

#### Step 1.1: Download and Install

Simply run this command:

~~~bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
~~~

This will install `nvm`

#### Step 1.2: Initializing `nvm`

In the terminal there should be some directions on how to initialize `nvm`, if not, (or you don't feel like copying from the terminal), run these commands:

~~~bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
~~~

You can verify `nvm` is installed by running the command:


~~~BASH
command -v nvm
~~~

if this returns `nvm: command not found` close the terminal and re-open it.

In macOS 10.15 and above, the default shell is zsh and nvm will look for .zshrc to update, none is installed by default.

Simply run the following commands:

~~~bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
~~~


~~~bash
touch ~/.zshrc
~~~



Paste the following in your terminal and press enter: 

~~~bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
~~~

Press Enter.

            

Open a new terminal window and test your nvm installation by running 

~~~bash
nvm --version.
~~~

For more information, view [NVM's github documentation](https://github.com/nvm-sh/nvm#installation-and-update).



### Step 2: Installing Node

Now that we have `nvm` installed: we can install Node.

#### Step 2.1: Installation

Run:

~~~bash
nvm install node
~~~

This will install the most recent version of node, and you’ll see a lot of output in the terminal. If everything worked, you should see something similar to this somewhere in the lines of output:

~~~bash
Downloading and installing node v14.15.4...
~~~

If not, close the terminal, re-open it and run `nvm install node` again.

#### Step 2.2: Setting the node Version

We need to tell `nvm` which version of Node to use when we run the `node` command. It's easy, just run the following command:

~~~bash
nvm use node
~~~

Now when you run `node -v` you should see `v14.10.0` or something similar.

If you see that, you have successfully installed node!


