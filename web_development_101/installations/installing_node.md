### Introduction

Node is a JavaScript interpreter that doesn't run in the browser, there are many tools that require this to be installed. Testing frameworks and bundlers are two of many.

We're going to install it using `nvm` (Node Version Manager), because it makes it easy to change node versions and upgrade node.  There is another tool called `npm` (Node Package Manager) that you will use later to install the various libraries and tools used in javascript environment.  It can be easy to confuse these two so read carefully!

Node is also very easy to install using nvm, so this should go quickly :)

### Step 1: Downloading and Installing `nvm`

#### Step 1.1: Download and Install

Simply run this command:

~~~bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
~~~

This will install `nvm`

#### Step 1.2: Initializing `nvm`

In the terminal there should be some directions on how to initialize `nvm`, if not, (or you don't feel like copying from the terminal), run these commands:

~~~bash
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
~~~

You can verify `nvm` is installed by running the command:


~~~BASH
command -v nvm
~~~

if this returns `nvm: command not found` close the terminal and re-open it.

On OS X you may continue to see the same message. If this happens, open your .bash_profile and add the following line of code:
~~~
source ~/.bashrc
~~~
For more information, view [NVM's github documentation](https://github.com/nvm-sh/nvm#installation-and-update).

Then try running the above command again. If you get anything else, you're good to continue!

### Step 2: Installing Node

Now that we have `nvm` installed: we can install Node.

#### Step 2.1: Installation

Run:

~~~bash
nvm install node
~~~

This will install the most recent version of node, and you’ll see a lot of output in the terminal. If everything worked, you should see something similar to this somewhere in the lines of output:

~~~bash
Downloading and installing node v12.6.0...
~~~

If not, close the terminal, re-open it and run `nvm install node` again.

#### Step 2.2: Setting the node Version

We need to tell `nvm` which version of Node to use when we run the `node` command. It's easy, just run the following command:

~~~bash
nvm use node
~~~

Now when you run `node -v` you should see `v11.8.0` or something similar.

If you see that, you have successfully installed node!
