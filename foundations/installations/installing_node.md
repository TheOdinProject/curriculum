### Introduction

Node.js is a JavaScript runtime environment, that means that now you can run JavaScript code on the server side also!
Node uses JavaScript as its scripting language, and achieves high throughput via non-blocking I/O and a single-threaded event loop.

There are many tools that require this to be installed. Testing frameworks and bundlers are two of many.

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

Now when you run `node -v` you should see `v14.10.0` or something similar.

If you see that, you have successfully installed node!


# Installation on MacOS (zsh)

**You can also install Node Using the macOS installer available from the Node.js [website](https://nodejs.org/en/download/)**


# Prerequisites 

Make sure you have command line tools installed by typing `git` into the terminal.

~~~bash
git
~~~

This will prompt you to install command\-line tools when the command fails to work.

This only applies to people wanting to upgrade from bash to zsh.

To see what shell your terminal currently is in, from the command line type in:

~~~bash
echo $0
~~~

If you’re in the `bash` shell, you’ll see printed out:

~~~bash
\-bash
~~~

If you’re in the `zsh` shell, you’ll see printed out:
~~~bash
\-zsh
~~~
# Switch Your Default Shell To `zsh`

To switch your shell to the `zsh` shell, you may enter:

~~~bash
chsh \-s /bin/zsh
~~~

To switch back to the bash shell, you may enter:

~~~bash
chsh \-s /bin/bash
~~~


# Follow the instructions :

Make a folder under your home directory called dev , something like this:


~~~zsh
mkdir ~/.antigen && cd ~/.antigen
~~~

Next, Add package manager for zsh called antigen:


~~~zsh
curl -L git.io/antigen > antigen.zsh
~~~

Now we’re going to configure our .zshrc file:

~~~zsh
nano ~/.zshrc
~~~


This will open the .zshrc file in nano.
Copy and paste the following into your .zshrc file:

~~~zsh

source ~/.antigen/antigen.zsh
# This loads the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle lukechilds/zsh-nvm
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# Load the theme.
antigen theme robbyrussell
# Tell Antigen that you're done.
antigen apply

~~~

Restart your terminal. You’ll see a bunch of applications getting installed the first time the terminal is run. 
Now you can finally install Node.js and NPM with a single line using nvm!

~~~zsh
nvm install --lts
~~~

Now you’re ready to roll and won’t have permissions issues when using NPM packages in zsh.




