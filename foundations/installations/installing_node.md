### Introduction

Node is a JavaScript runtime environment that allows you to run JavaScript outside of your web browser, this means that you can code the server side of your application in JavaScript. To get started, there are some required tools we need before we can install Node on your system.

We're going to install it using `nvm` (Node Version Manager), because it makes it easy to change Node versions and upgrade Node. There is another tool called `npm` (Node Package Manager) that you will use later to install the various libraries and tools used in javascript environment. It can be easy to confuse these two so read carefully!

Node is also very easy to install using nvm, so this should go quickly :)

### Installing nvm

#### Step 0: Prerequisites 
To install nvm properly, you'll need `curl`. Simply run the command below:

~~~bash
sudo apt install curl
~~~ 

#### Step 1: Downloading and Installing `nvm`

Simply run this command:

~~~bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
~~~

This will install `nvm`

#### Step 2: Initializing `nvm`

In the terminal there should be some directions on how to initialize `nvm`, if not, (or if you don't feel like copying from the terminal), run these commands:

<a id="profile-snippet"></a>
~~~bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
~~~

You can verify `nvm` is installed by running the command:

~~~BASH
command -v nvm
~~~

#### Troubleshooting

If you get `nvm: command not found` or no feedback from your terminal after you typed `command -v nvm` restart you terminal and try verifying again. 

Even after that if it's not fixed then one of the following might be the reason.
1. Your default shell is different than `bash`.
2. In that case try adding the snippet from the <a href="#profile-snippet">install section</a>, that finds the correct nvm directory and loads nvm, to your usual profile (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc).

For more information, view [NVM's github documentation](https://github.com/nvm-sh/nvm#installation-and-update).

### Installing Node

Now that we have `nvm` installed, we can install Node.

#### Step 1: Installation

Run:

~~~bash
nvm install node --lts
~~~

This will install the most recent stable version of Node, and you’ll see a lot of output in the terminal. If everything worked, you should see something similar to this somewhere in the lines of output:

~~~bash
Downloading and installing Node v14.xx.x...
~~~

If not, close the terminal, re-open it and run `nvm install node` again.

#### Step 2: Setting the Node Version

We need to tell `nvm` which version of Node to use when we run the `node` command. It's easy, just run the following command:

~~~bash
nvm use node
~~~

Now when you run `node -v` you should see `v14.xx.x` or something similar.

If you see that, you have successfully installed Node!
