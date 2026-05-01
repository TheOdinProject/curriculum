### Guide: Install nvm on Linux

#### Step 0: Prerequisites

Firstly, run the following in your terminal to make sure your Ubuntu package lists are up-to-date:

```bash
sudo apt update && sudo apt upgrade
```

Now, to install nvm properly, you'll need `curl`. Run the command below to install `curl`:

```bash
sudo apt install curl
```

#### Step 1: Downloading and installing nvm

Run this command to install `nvm`:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

#### Step 2: Initializing nvm

In the terminal, there should be some directions on how to initialize `nvm`. If not (or if you don't feel like copying from the terminal), run these commands:

```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

You can verify `nvm` is installed by running the command:

```bash
command -v nvm
```

If this returns `nvm: command not found`, close the terminal and re-open it.

[Return to the Installing Node.js lesson](https://www.theodinproject.com/lessons/foundations-installing-node-js#assignment)
