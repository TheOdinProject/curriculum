### Guide: Install nvm on MacOS

On MacOS 10.15 and above, the default shell is now zsh. During installation, nvm will look for a `.zshrc` file in your user home directory. By default, this file does not exist so we need to create it by running the following command in your terminal:

```bash
touch ~/.zshrc
```

Now we can run the following command to install nvm:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

Restart your terminal, or copy and paste the following into your terminal and press <kbd>Enter</kbd>:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
```

Test your nvm installation by running, which should give you the version number installed:

```bash
nvm --version
```

For more information, read about [installing and updating from NVM's GitHub](https://github.com/nvm-sh/nvm#installation-and-update).

[Return to the Installing Node.js lesson](https://www.theodinproject.com/lessons/foundations-installing-node-js#assignment)
