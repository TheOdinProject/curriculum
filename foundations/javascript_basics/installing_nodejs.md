<!-- markdownlint-disable MD024 MD043 -->

### Introduction

Node.js is a JavaScript runtime environment that allows you to run JavaScript outside of your web browser. We will need this for some exercises in the upcoming lessons. To get started, there are some required tools we need before we can install Node on your system.

We're going to install it using `nvm` (Node Version Manager), because it makes it easy to change Node versions and upgrade Node. There is another tool called `npm` that we will later use to install the various libraries and tools used in JavaScript environments. It can be easy to confuse these two, so read carefully!

Node is also very easy to install using nvm, so this should go quickly :)

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Learn how to Install `nvm` (Node Version Manager) and `npm`.
- Learn how to run Node console.

### Installing NVM

<details markdown="block">
  <summary class="dropDown-header">Installation on Linux</summary>

#### Step 0: Prerequisites

To install nvm properly, you'll need `curl`. Run the command below to install `curl`:

```bash
sudo apt install curl
```

Note: You may need to update the Ubuntu package lists to the latest version for the Curl installation to complete. If so, run the command below:

```bash
sudo apt update && sudo apt upgrade
```

#### Step 1: Downloading and Installing NVM

Run this command to install `nvm`:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
```

#### Step 2: Initializing NVM

In the terminal there should be some directions on how to initialize `nvm`. If not, (or if you don't feel like copying from the terminal), run these commands:

```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

You can verify `nvm` is installed by running the command:

```bash
command -v nvm
```

If this returns `nvm: command not found`, close the terminal and re-open it.

</details>

<details markdown="block">
  <summary class="dropDown-header">Installation on macOS</summary>
  
On macOS 10.15 and above, the default shell is now zsh. During installation, nvm will look for a `.zshrc` file in your user home directory. By default, this file does not exist so we need to create it.

To create the `.zshrc` file and start the nvm installation, run the following commands:

```bash
touch ~/.zshrc
```

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
```

Restart your terminal, or copy and paste the following into your terminal and press <kbd>Enter</kbd>:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
```

Test your nvm installation by running:

```bash
nvm --version
```

For more information, view [NVM's GitHub Documentation](https://github.com/nvm-sh/nvm#installation-and-update).

</details>

### Installing Node

Now that we have `nvm` installed, we can install Node.

#### Step 1: Installation

Run:

```bash
nvm install --lts
```

This will install the most recent stable version of Node in 'long-term support' (LTS), and you’ll see a lot of output in the terminal. If everything worked, you should see something similar to this somewhere in the lines of output (with the X's replaced with actual numbers):

```bash
Downloading and installing Node vXX.xx.x...
```

If not, close the terminal, re-open it and run `nvm install --lts` again.

#### Step 2: Setting the Node version

We need to tell `nvm` which version of Node to use when we run the `node` command. It's easy; just run the following command:

```bash
nvm use --lts
```

We have told `nvm` to use the most recent LTS version of Node installed on our computer. You **must** use the LTS version of Node to avoid incompatibilities with packages we will be installing in future lessons. The LTS version of Node is a version that is guaranteed support for thirty months after its initial release. It is more stable and compatible with a variety of packages than a non-LTS version of Node.

Now when you run `node -v`, you should see `vXX.xx.x` or something similar (with the X's replaced with actual numbers).

If you see that, you have successfully installed Node!

### Using Node console

For convenience, Node provides an interactive console which lets you run and edit your JavaScript code right in your terminal, similar to IRB for ruby. This is quite helpful to debug or test small snippets of your code quickly without opening the browser every time.

To run the Node console, open up your terminal and type `node`. Type `.exit` to quit the console.

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
