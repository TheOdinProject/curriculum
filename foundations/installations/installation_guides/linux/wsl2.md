### Guide: WSL2 setup

Using WSL2 is a quick and easy way to get started with using Linux, allowing you to run a Linux distribution from within Windows. WSL2 is available on Windows 10 version 2004 and higher (Build 19041 and higher) and Windows 11.

To make it clear: you are going to be using a different OS, this is not a way to avoid using Linux. Due to how WSL2 is integrated with Windows it often causes significant confusion to new learners. Use the Virtual Machine if you want a clear separation between your Windows and Linux so the curriculum is easier to follow.

<div class="lesson-note" markdown="1">

#### WSL2 and Linux instructions

Because WSL2 is a full-fledged Linux distribution, almost everything that the curriculum teaches about Linux is also applicable to WSL2. In future lessons, whenever there are instructions that differ by OS, you should follow the Linux instructions, unless the lesson includes WSL2-specific instructions.

</div>

### Step 1: Installations

#### Step 1.1: Installing WSL2

1. Open PowerShell in administrator mode by searching for it in your applications, right clicking the top option, and then selecting run as administrator. You might get a prompt asking if you want to allow Windows Powershell to make changes to your device: click yes.
1. Enter the following command

   ```powershell
   wsl --install
   ```

1. After a few minutes you'll be prompted to reboot your computer; do so.
1. You should see an open Powershell window, prompting you to enter a username and a password. Your username should be lowercase, but can otherwise be whatever suits you. You'll also need to enter a new password.
1. When entering your password you might notice that you aren't seeing any visual feedback. This is a standard security feature in Linux, and will also happen in all future cases where you need to enter a password. Just type your password and hit <kbd>Enter</kbd>.

#### Step 1.2.1: Install Windows Terminal (Windows 10 only)

Windows Terminal is a terminal application that lets you more easily customize and run terminals, as well as supporting multiple tabs which can each run their own different terminals. [Install Windows Terminal](https://learn.microsoft.com/en-us/windows/terminal/install) by using the direct install option.

#### Step 1.2.2: Setting WSL2 as default (Optional)

Unless you are regularly using other terminals on your computer we recommend that you set WSL2 as the default terminal program when you open Windows Terminal.

1. Open Windows Terminal by searching for terminal in your applications.
1. Click the dropdown next to the new tab button (at the top of the windows), and select Settings.
1. You should see a Default Profile option with a dropdown next to it.
1. In the dropdown select Ubuntu.
1. Click save at the bottom of the page.

### Step 2 Opening WSL2

On Windows there are three primary ways to open WSL2.

- If you set Windows Terminal to open a Ubuntu terminal by default you can start a new WSL2 session by opening the terminal app.
- You can open Windows Terminal, click the dropdown next to the new tab button (at the top of the windows), and select Ubuntu.
- If you search for Ubuntu in the application search bar you should see a application titled Ubuntu; open it to start a new terminal session.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Terminal color scheme

You might notice when you open WSL2 via Windows Terminal, you'll see a window with a different color scheme and a different icon compared to opening a terminal through Ubuntu in your applications. This is because Windows Terminal comes with a default color scheme for Ubuntu meant to emulate how a real Ubuntu terminal looks. This difference is purely cosmetic, and there is no practical difference between the two.

</div>

<div class="lesson-note lesson-note--warning" markdown="1">

#### /mnt/c is not Linux!

When opening your WSL2 terminal ensure that you do not see `/mnt/c` at the start of the line. `/mnt/c` is where your Windows installation lives when working within WSL2, and messing around there can have unintended consequences.

</div>

[Return to Installations lesson](https://www.theodinproject.com/lessons/foundations-installations#os-installation)
