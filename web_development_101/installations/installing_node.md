### Introduction

Node is a JavaScript intreperter that doesn't run in the browser, there are many tools that require this to be installed. Testing frameworks and bundlers are two of many.

We're gonig to install it using `nvm` (Node Version Manager), because it makes it easy to change node versions and upgrade node.  There is another tool called `npm` (Node Package Manager) that you will use later to install the various libraries and tools used in javascript environment.  It can be easy to confuse these two so read carefully!

Node is also very easy to install using nvm, so this should go quickly :)

### Step 0: Prerequisites

We need to make sure we have everything  we need to install and run nvm, node, and npm. Even if you have already installed the prerequisites, it won't hurt to install them again.

#### Step 0.1: Installing Curl

Curl is used to install `nvm`, let's install it:

First we update the system:

~~~bash
sudo apt update
sudo apt upgrade
~~~

When this is complete, run:

~~~bash
sudo apt install curl
~~~

Now you're ready to download and install `nvm`

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

if this returns `nvm: command not found` close the terminal and re-open it. Then try running the above command again. If you get anything else, you're good to continue!

### Step 2: Installing Node

Now that we have `nvm` installed: we can install Node.

#### Step 2.1: Installation

Run:

~~~bash
nvm install node
~~~

This will install the most recent verson of node.

#### Step 2.2: Setting the node Version

We need to tell `nvm` which version of Node to use when we run the `node` command. It's easy, just run the following command:

~~~bash
nvm use node
~~~

Now when you run `node -v` you should see `v11.8.0` or something similar.

If you see that, you have successfully installed node!
