### Guide: Setting up Git in Linux

#### Step 1: Update the system

Run these commands in the terminal to update the Linux system:

```bash
sudo apt update
sudo apt upgrade
```

<div class="lesson-note lesson-note--tip" markdown="1">

#### Typing passwords in the terminal

When using a command in the terminal that requires you to enter your password for authentication (such as `sudo`), you will notice that the characters aren't visible as you type them. While it might seem like the terminal isn't responding, don't worry!

This is a security feature to protect confidential information, like how password fields on websites use asterisks or dots. By not displaying the characters you write, the terminal keeps your password secure.

You can still enter your password as normal and press <kbd>Enter</kbd> to submit it.

</div>

#### Step 2: Install Git

You likely have Git installed already, but to make sure that we have the most up to date version, run the following commands:

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

#### Step 3: Verify Git version

Make sure your Git version is **at least** 2.28 by running this command:

```bash
git --version
```

If the version number is less than 2.28, follow the instructions from the beginning again.

[Return to the Setting Up Git lesson](https://www.theodinproject.com/lessons/foundations-setting-up-git#assignment)
