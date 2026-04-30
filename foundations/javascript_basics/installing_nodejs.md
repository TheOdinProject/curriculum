### Introduction

Node.js is a JavaScript runtime environment that allows you to run JavaScript outside of your web browser. We will need this for some exercises in the upcoming lessons. To get started, there are some required tools we need before we can install Node on your system.

We're going to install it using nvm (Node Version Manager), because it makes it easy to change Node versions and upgrade Node. There is another tool called npm that we will later use to install the various libraries and tools used in JavaScript environments. It can be easy to confuse these two, so read carefully!

Node is also very easy to install using nvm, so this should go quickly :)

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Install nvm (Node Version Manager), Node and npm.
- Learn how to run Node console.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Installing nvm

1. We first need to install nvm so that we can install and manage our Node installations easily. Follow the appropriate guide for the OS that you are using:
   - [Linux](https://github.com/TheOdinProject/curriculum/tree/main/foundations/javascript_basics/installation_guides/linux.md "Linux nvm installation")
   - [MacOS](https://github.com/TheOdinProject/curriculum/tree/main/foundations/javascript_basics/installation_guides/macos.md "MacOS nvm installation")

#### Installing Node

Now that we have nvm installed, we can use it to install Node.

1. In your terminal, run:

   ```bash
   nvm install --lts
   ```

   This will install the most recent stable version of Node in "long-term support" (LTS), and you’ll see a lot of output in the terminal. If everything worked, you should see something similar to this somewhere in the lines of output (with the Xs replaced with actual numbers):

   ```text
   Downloading and installing Node vXX.xx.x...
   ```

   If not, close the terminal, re-open it and run `nvm install --lts` again.

1. We need to tell nvm which version of Node to use when we run the `node` command. It's easy, just run the following command:

   ```bash
   nvm use --lts
   ```

   We have told nvm to use the most recent LTS version of Node installed on our computer. You **must** use the LTS version of Node to avoid incompatibilities with packages we will be installing in future lessons. The LTS version of Node is a version that is guaranteed support for thirty months after its initial release. It is more stable and compatible with a variety of packages than a non-LTS version of Node.

   Now when you run `node -v`, you should see `vXX.xx.x` or something similar (with the Xs replaced with actual numbers).

   Installing Node also installs npm alongside it. Run `npm -v` and like above you should see `XX.xx.x` or something similar.

   If you see those messages, you have successfully installed Node and npm!

#### Using the Node REPL

For convenience, Node provides a REPL which is an interactive console that lets you run and edit your JavaScript code right in your terminal, similar to the console in the browser you used in the previous lesson. This can be quite helpful to debug or test small snippets of non-browser-related code quickly without opening the browser every time.

To run the Node console, open up your terminal and run `node` on its own to open the REPL. Type `.exit` to quit the REPL.

</div>
