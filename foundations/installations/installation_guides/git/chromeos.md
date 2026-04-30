### Guide: Setting up Git in ChromeOS

#### Step 0: Prerequisites

Before installing Git, you'll need to have the Linux Development Environment enabled on your Chromebook. If you haven't set this up yet, follow [Google's guide to turn on Linux on ChromeOS](https://support.google.com/chromebook/answer/9145439).

#### Step 1: Update the system

Run these commands in the terminal to update the Linux system:

```bash
sudo apt update
sudo apt upgrade
```

<div class="lesson-note lesson-note--tip" markdown="1">

#### Typing passwords in the terminal

When using a command in the terminal that requires you to enter your password for authentication (such as sudo), you will notice that the characters aren't visible as you type them. While it might seem like the terminal isn't responding, don't worry!

This is a security feature to protect confidential information, like how password fields on websites use asterisks or dots. By not displaying the characters you write, the terminal keeps your password secure.

You can still enter your password as normal and press Enter to submit it.

</div>

#### Step 2: Install Git

Now you can install Git using the standard package manager:

```bash
sudo apt install git
```

#### Step 3: Verify Git version

Make sure your Git version is **at least** 2.28 by running this command:

```bash
git --version
```

If the version number is less than 2.28, you may need to add the Git PPA for a more recent version:

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

[Return to the Setting Up Git lesson](https://www.theodinproject.com/lessons/foundations-setting-up-git#assignment)
