### Introduction
Before we can install ruby and get ready to launch a rails application, we have to set up the operating system to be compatible. If you are using a `MacOS` or `Linux` already you can skip this section. Otherwise, click on the dropdown of the method you would like to use below.

<details markdown="block">
<summary class="dropDown-header">Linux Dual Boot
</summary>

*Read this whole section before continuing*

Dual-booting provides you two operating systems that you can switch from with a simple reboot. Each partition will not modify the other unless you explicitly do so. Be sure you back up any important data and have a way to ask for help before you continue. If you get lost, scared, or stuck: Talk to us in the [Gitter tech support chat room](https://gitter.im/TheOdinProject/tech_support) at any time. It helps to have a phone or another computer around if you get stuck. This process almost always goes smoothly, so don't worry too much :) .

### Step 1: Downloading Linux

First you will need to download the version of linux you wish to install onto your computer. Ubuntu comes in different versions ("flavors"), but we suggested the standard [Ubuntu](https://www.ubuntu.com/download/desktop) or [Xubuntu](https://xubuntu.org/) if you're using an older computer. Be sure to download the 64bit version, it is the most compatible and will prevent many hard to solve problems.

### Step 2: Creating a bootable flash-drive

(If you do not have a flash-drive, you can also burn the image to a CD or DVD)

Next you will create a bootable flash drive so you can install Ubuntu to your hard drive.

Follow [this guide](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows#0) for instructions.

Note: You can use this method to try out different [flavors of Ubuntu](https://www.ubuntu.com/download/flavours) if you would like. These images allow you to try the different flavors of Ubuntu without committing to an installation. Just note that due to the nature of USB, it is slow for this purpose, and using it this way consistently over time can harm your flash-drive.

If you would like to play with the version of Ubuntu you installed on the flash drive, click 'try me' instead of 'install'. When you have found a version of Ubuntu you like, continue to the next step.

### Step 3: Installing Ubuntu along side Windows

#### Step 3.1: Booting from the flash-drive

First you will need to boot into Linux on your flash-drive. The exact steps may vary, but on a general level you will need to:

* Insert the flash drive into the computer
* Reboot the computer
* Select the flash drive as the bootable device instead of the hard drive

For example, on a Dell computer you will need to plug in the USB drive, reboot the computer and press the F12 key when the computer is first booting up to bring up the boot menu. From here you can select your USB drive and boot from that.  Your computer may not be the same, so google will be your friend in trying to figure it out.

#### Step 3.1: Installing Ubuntu

This is where the real changes start happening to your computer. The default settings are mostly perfect, but be sure to "__Install Ubuntu alongside Windows__". Not doing this can cause irreversible data loss.

One thing you might want to change is the allocated disk space allowed for Linux. 30gb or more is recommended. This can be changed later, but it is a more involved process.

For step by step instructions please follow this [installation guide](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0) from the creators of Ubuntu.

</details>

<details markdown="block">
<summary class="dropDown-header">Windows 10 Windows Subsystem for Linux
</summary>

Microsoft has recently made a huge shift to embrace open source and support developers. One of the biggest things they did with Windows 10 was introduce the Windows Subsystem for Linux (WSL) which is a linux command line within Windows. Of course there are a couple minor adjustments you need to make, but once you have it up and running, you can essentially follow the Ubuntu instructions.

Beginning with the 2017 Fall Creators Update, Microsoft has made it easy to get up and running using [Windows Settings and the Microsoft Store](https://winaero.com/blog/enable-wsl-windows-10-fall-creators-update/). It's as simple as installing via the Microsoft Store.

### Step 1: Install WSL

Microsoft has made installing WSL super simple. To install this feature you need to

* Open your start menu and start searching for "Microsoft Store"
* Enter "Ubuntu" into the search field of the store. 
* Click on the orange "Ubuntu 18.04" and then "Get".

This will install the Windows Subsystem for Linux on your computer.  The process will take about 10 minutes to complete, depending on your internet connection.

NOTE: If you run into an error, click [here](https://aka.ms/wslinstall) and follow the directions to enable and install WSL.

### Step 2: Starting WSL

Windows Subsystem for Linux is nothing more than a linux terminal inside of Windows. To start the program simply open your start menu and search for "Ubuntu 18.04". The first time you run the program you may get a message, "Installing, this may take a few minutes..." Sit tight and give it a few moments. When complete, you will be asked to create a new user and password. This is how you will log into your WSL installation.

### Step 3: Set up Symbolic Link

When Ubuntu was set up, your windows file system (C-Drive) was mapped to `/mnt` in Ubuntu. This means that your C drives is actually `/mnt/c` inside WSL and that both Windows and WSL can have access to your C-drive. Don't trust us? Try it out yourself:

From your open WSL terminal, type `cd /mnt/c` and then `ls` (Check out the [Command Line Basics Section](/courses/web-development-101/lessons/command-line-basics) if you're unsure about this command). You can then compare the output to the contents of your `C:\` drive in Windows. They should be the same.

#### Step 3.1: Create Directory for your Projects

You can choose to put your project files anywhere you want, but we're going to assume you are cool and put a projects folder in your Documents folder.

From inside the Ubuntu terminal type:

~~~bash
mkdir /mnt/c/Users/<Your Windows Username>/Documents/Projects
~~~

(Replace `<Your Windows Username>` with your Windows username). This will create a new `Projects` folder inside of your Documents folder. Obviously you could have used windows explore to click your way there too, but why not use our fancy new toy?

#### Step 3.2: Create the Symbolic Link

Next, we're going to establish the link so that instead of having to type `ls /mnt/c/Users/<your windows user name>/Documents/Projects` each time, you can simply type `ls ~/Projects`, which will point to that obscenely long path above.

At your Ubuntu command prompt type:

~~~bash
ln -s /mnt/c/Users/<your windows user name>/Documents/Projects ~/Projects
~~~

now you can easily access and safely edit your projects folder from inside WSL just by using the `~/Projects` directory.

### Step 4 (optional): Make Ubuntu Easier to Find

If you want to, you can pin a link to Ubuntu to your start menu or your desktop.

You can also elevate PowerShell or Command Prompt by typing `wsl` and pressing enter

If you run wsl inside PowerShell or Command Prompt, you can close WSL by typing `exit` and hitting enter. This returns you back to the normal PowerShell/Command Prompt.

### Important Note

The WSL program files are well hidden but it's super important that you do not edit these files from Windows. Ignoring this will cause serious problems to your Ubuntu installation and possibly your Windows installation.

### Additional Links for Further Study

* You can find more info about managing and configuring WSL [here](https://docs.microsoft.com/en-us/windows/wsl/wsl-config).

* [This](https://docs.microsoft.com/en-us/powershell/scripting/getting-started/getting-started-with-windows-powershell?view=powershell-6) is an introduction to PowerShell if you want to make more use of it.

* If you want to learn all about the `ln` command we used to make the symbolic link, the [man page](https://ss64.com/bash/ln.html) (manual page) has all the info you need.

</details>

<details markdown="block">
<summary class="dropDown-header">Virtual Machine with Linux
</summary>

If you want to use Linux but can't or don't want to install WSL, then using a VM is the best option. VM is short for 'Virtual machine' which is a widely used program that [emulates](https://en.wikipedia.org/wiki/Emulator) a computer system. In other words, a VM allows you to run an operating system of your choice just like any other computer program. Unfortunately, such convenience comes at a price. Running a program that contains an operating system can be very heavy on your processor and RAM memory.

### Requirements

Before committing to the installation, make sure your computer meets the [requirements](https://www.virtualbox.org/wiki/End-user_documentation) to run a virtual machine, it doesn't hurt to take a look at your selected flavor of linux's requirements as well.

### Step 1: Downloads

You have read through the introduction part and you feel like a VM is your best option? Your computer meets the minimum requirements? Great, let's get started then. This is a fairly simple process and only a few things could go wrong, we'll make sure to mention them. This guide uses Oracle's 'VirtualBox' program, it's open source, free and simple. What more can you ask of a piece of software? Now let's make sure we have everything downloaded and ready for installation:

#### Step 1.1.1: Downloading Virtual Box


[Click here](https://www.virtualbox.org/wiki/Downloads) and download VirtualBox for Windows hosts.

#### Step 1.1.2: Linux download

There are thousands of versions of Linux out there. Ubuntu is undoubtedly one of the most popular and user friendly. When installing on a VM we recommend [downloading](https://xubuntu.org/download) and installing Xubuntu 18.04. Xubuntu uses the same base software as Ubuntu, but has a display that's better for VM environments.

### Step 2: Installing Virtualbox and setting up Ubuntu

#### Step 2.1: Installing VirtualBox

The installation of VirtualBox is a very straight forward process. It doesn't require any technical knowledge and is the same as installing any other computer program on your Windows computer. Double-clicking the downloaded file is sufficient to start the installation process. Any additional options prompted by the installation are left for the user to decide (such as creating a desktop icon and so on). After the installation is finished (the progress bar might get stuck for a few minutes, just wait for it to finish) search for your newly installed Virtual Box program and run it.

#### Step 2.2: Setting up Ubuntu
Now that you have Virtual Box installed, double click the icon and you should see something like this:

![installed_vbox](https://i.imgur.com/VO9Y1Si.png)

Click on the 'New' button to create a virtual operating system. Find your operating system in the dropdown menu (Linux/Ubuntu) and name it as you wish. Continue by pressing next and choose the following options in the next steps:

1. Memory size - Should be about half of your computers maximum. For example, if you have 8GB of RAM memory, allocate 4GB to your virtual operating system.

2. Hard disk - Create a virtual hard disk

3. Hard disk file type - Choose the VDI (VirtualBox Disk Image) option

4. Storage on physical hard disk - Dynamically allocated

5. File location and size - We recommend at least 20GB for the virtual hard disk

After completing the last step, click the Create button. Your newly created virtual OS should be in the menu now. Right click on it and go to Settings. Go to the Storage section and add the Ubuntu iso file you downloaded earlier:

![choose_disc_vbox](https://i.imgur.com/D3xfaZa.png)

After that, you can go to the System tab and change the amount of hardware the virtual operating system will be using. Generally 50% of RAM and at least 2 processors should be allocated to the virtual OS, but you can always change these settings based on your needs

You can start the VM by right clicking on the icon in the menu and selecting Start then Normal Start.

The next thing to do is Install Xubuntu. The process is very simple and most of the default options can be left like that including the Installation type which should be `Erase disk and install Ubuntu`. You will need to confirm this step. It may sound dangerous, but the VM can only see the "Hard Drive" you created above in step 2.2 #2-5. This is the beauty of VMs - the ability to separate the physical space of your computer across many VMs.

The rest of the installation is pretty straightforward, but should you have any questions you can find Ubunutu's official installation guide for Ubuntu [here](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0).

### Step 3: Installing Guest Additions and enabling them

 Your regular operating system (Windows in this case) is called the **Host** and all other operating systems that run as Virtual Machines are called **Guests**. To make working in your Guest OS easier you need to install Guest Additions. Guest Additions add a lot of functionality to the Guest OS like 'Drag n Drop' files, full-screen guest mode, shared folders and copy/paste between host and guest.

Installing Guest Additions can be tricky, but luckily there is Youtube. Check out [this video](https://www.youtube.com/watch?v=qNecdUsuTPw) by ProgrammingKnowledge on how to install the Guest Additions.  Their installation may look different than yours, but all of the commands are the same.

### Understanding how VM works

  It's important to note a few things about coding in a virtual environment:

* All installations are done in the VM. Now that you have everything set up it is important to mention that everything you install regarding coding you install on the Guest OS (Ubuntu in this case) including Ruby,Rails,Text editors and everything else you will need during this curriculum. This means that during the installation project, you consider yourself a Linux user, not a Windows user.

* All of the development related to TOP is done in the VM.

### Possible issues

If you can not choose anything other than a 32-bit operating system when setting up your VM look at [this](http://www.fixedbyvonnie.com/2014/11/virtualbox-showing-32-bit-guest-versions-64-bit-host-os/#.WzzZYXYzZN0)

If you get a message like 'This kernel requires an x86-64 CPU, but only detected an i686 CPU. Unable to boot - please use a kernel appropriate for your CPU.' , you should go to the BIOS settings of your PC and enable 'Virtualization Technologies' and 'VT-x' (or AMD-x), save the settings and restart your PC.

If you experience any issues during the installation don't hesitate to ask for help on the [forums](https://forum.theodinproject.com/c/help) or in our [Gitter tech support chat room](https://gitter.im/TheOdinProject/tech_support).

</details>
