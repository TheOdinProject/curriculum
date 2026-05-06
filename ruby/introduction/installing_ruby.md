### Introduction

Before we start learning, we'll need to install Ruby first. This section is where you could potentially encounter a lot of errors.

Before continuing, let's review a few best practices to keep in mind:

- Copy and paste the commands to avoid typos.
- Follow the directions closely, and don't skip over any sections.
- **Do NOT use `sudo` unless The Odin Project specifically says to do so.** Failing to follow this can cause a lot of headaches, and never run as the `root` user. In some instances, you might see a message in the terminal telling you to use `sudo` and install something with `apt`. Ignore that and follow *our* instructions for now.

Now, let's get started!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Installing and updating Ruby.
- Setting local and global Ruby versions.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Install Ruby

1. Depending on the OS you are running, follow the appropriate Ruby installation guide below:
   - [Linux](https://github.com/TheOdinProject/curriculum/tree/main/ruby/introduction/installation_guides/ruby/linux.md "Ruby installation for Linux")
   - [MacOS](https://github.com/TheOdinProject/curriculum/tree/main/ruby/introduction/installation_guides/ruby/macos.md "Ruby installation for MacOS")

#### Updating Ruby

If you've just installed Ruby, congratulations! Your version is probably completely up to date, and you can safely skip this section. However, if you stick with this long enough, the need to update your version of Ruby will eventually arise. Fortunately, having `rbenv` installed makes this quite straightforward. Here are step by step instructions on how to update your ruby version:

1. Go to `.rbenv/` folder in your home directory.

   ```bash
     cd ~/.rbenv
   ```

1. Pull latest changes for your ruby version manager (`rbenv`).

   ```bash
     git pull
   ```

1. Run this command.

   ```bash
     ~/.rbenv/bin/rbenv init
   ```

1. Go to `ruby-build` plugin directory. This is what `rbenv` uses to compile ruby from source code (which is written in C).

   ```bash
     cd ~/.rbenv/plugins/ruby-build
   ```

1. Pull latest changes for `ruby-build`.

   ```bash
     git pull
   ```

1. Now you can check list of all the latest versions available for you to install.

   ```bash
     rbenv install --list-all
   ```

1. Now you can install the version of Ruby you like by running:

   ```bash
     rbenv install x.y.z
   ```

   where in `x.y.z` - `x` is the major version, `y` is the minor version and `z` is the patch version. This is called [semantic versioning](https://semver.org/#summary)

   For example:

   ```bash
     rbenv install 3.4.6
   ```

#### Setting local and global Ruby versions

`rbenv` makes it easy to have multiple different versions of Ruby installed and switch between them. You may have one project that runs with Ruby 3.4 and another that runs with Ruby 3.3, and `rbenv` will coordinate this for you. The version of Ruby set at the project level is called the "local" version.

To set the local Ruby version, run:

```bash
rbenv local x.y.z
```

This creates a `.ruby-version` file for storing the local version. To check the current project/directory's local Ruby version, run:

```bash
rbenv local
```

You can also configure your default Ruby version. This is called the "global" version. To set the global default Ruby version run:

```bash
rbenv global x.y.z
```

To check current global ruby version run:

```bash
rbenv global
```

#### Extras

If you are using Visual Studio Code as your IDE, you can install the "Ruby LSP" extension, which will provide you with semantic highlighting and formatting support.

Using the extension is optional, but it is a quick install; go to the "Extensions" tab in VSC (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>X</kbd>), search "Ruby LSP", and click install on the first one. Congratulations, the extension is now installed.

The most important features Ruby LSP provides will work out of the box. But it may bug you about using a monorepo setup, missing lockfiles or rubocop - you can choose "Don't show again" for now. We will introduce these later.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What program do we use to install and manage Ruby versions?](#install-ruby)
- [How does a "local" version of Ruby differ from the "global" version?](#setting-local-and-global-ruby-versions)
