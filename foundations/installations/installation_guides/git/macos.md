### Guide: Setting up Git in MacOS

#### Step 1: Install Homebrew

First, you'll need to install Homebrew. To install it, you’ll first need to make sure you meet the [Homebrew MacOS requirements](https://docs.brew.sh/Installation#macos-requirements). Once you meet the requirements, copy and paste the following into your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

<div class="lesson-note lesson-note--warning" markdown=1>

#### Additional step for Apple Silicon Mac users

On an Apple Silicon Mac, you will have an extra step to take.
If you look at the terminal output after installing Homebrew, you will see "Installation Successful!". Further down in the terminal, there will be a section called "Next steps".

Reading the terminal may seem a bit intimidating, but this is a great chance to overcome those feelings. Follow the next steps as stated in your terminal (copy and paste the commands given) to add Homebrew to your `PATH`, which allows you to use the `brew` command prefix.

</div>

#### Step 2: Update Git

MacOS already comes with a version of Git, but you should update to the latest version. In the terminal, type

```bash
brew install git
```

This will install the latest version of Git. Easy, right?

#### Step 3: Verify version

If you have just installed and/or updated Git from the previous step, first close that terminal window.

**Open a new terminal window** and then make sure your Git version is **at least** 2.28 by running this command:

```bash
git --version
```

If the version number is less than 2.28, follow the instructions again. If you are encountering a `no formulae found in taps` error:

1. Run `brew doctor`.
1. You will see an output like the one below. NOTE: The actual output of `brew doctor` may vary based on the version of MacOS you're running, and any other issues you may have with your own installation. Ultimately, you must run each command line snippet that Homebrew provides after running `brew doctor` to repair your installation of Homebrew, including `brew cleanup` at the end.
![Brew Doctor Sample Output](https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/foundations/installations/setting_up_git/imgs/00.png)
1. Run `brew install git`, **open a new terminal window**, and then check your version of Git, which should now be the latest.

[Return to the Setting Up Git lesson](https://www.theodinproject.com/lessons/foundations-setting-up-git#assignment)
