### Guide: Install Chrome on Linux

#### Step 1: Download Google Chrome

1. Open your **Terminal**
1. Run the following command to download latest **Google Chrome** `.deb` package

   ```bash
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   ```

<div class="lesson-note" markdown="1">

#### Copy and paste keyboard shortcuts

You have probably noticed that the common keyboard shortcut: <kbd>Ctrl</kbd> + <kbd>V</kbd> to paste something doesn't work in the terminal. In order to paste your text input into your terminal you can use: <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd> keyboard shortcut combination, instead. It is also very handy to know that the: <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd> keyboard combination will copy any highlighted text from your terminal, which can then be pasted later.

</div>

#### Step 2: Install Google Chrome

1. Enter the following command in your terminal to install **Google Chrome** `.deb` package

   ```bash
   sudo apt install ./google-chrome-stable_current_amd64.deb
   ```

1. Enter your password, if needed

<div class="lesson-note lesson-note--tip" markdown="1">

#### A note on typing passwords in the terminal

When using a command in the terminal that requires you to enter your password for authentication (such as `sudo`), you will notice that the characters aren't visible as you type them. While it might seem like the terminal isn't responding, don't worry!

This is a security feature to protect confidential information, like how password fields on websites use asterisks or dots. By not displaying the characters you write, the terminal keeps your password secure.

You can still enter your password as normal and press <kbd>Enter</kbd> to submit it.

</div>

<div class="lesson-note lesson-note--tip" markdown="1">

#### Download is performed unsandboxed

You can [ignore any notes saying `N: Download is performed unsandboxed (...)`](https://www.reddit.com/r/linux4noobs/comments/ux6cwx/comment/i9x2twx/).

</div>

#### Step 3: Delete the installer file

```bash
rm google-chrome-stable_current_amd64.deb
```

#### Step 4: Using Google Chrome

You can start chrome in two ways:

- Click **Google Chrome** from the Applications menu
- **Or**, use the `google-chrome` command from the terminal

  ```bash
  google-chrome
  ```

<div class="lesson-note lesson-note--tip" markdown="1">

#### Google Chrome as a background process

Chrome is going to use this terminal to output various messages and won't let you run other commands. Don't worry about those messages. If you want to use the same terminal that you run Chrome in for other commands, use `google-chrome &` instead.

</div>

[Return to Installations lesson](https://www.theodinproject.com/lessons/foundations-installations#google-chrome-installation)
