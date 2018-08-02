### Introduction
Before we can install ruby and get ready to launch a rails application, we have to set up the operating system to be compatible. If you are using a `MacOS` or `Linux` machine already, you can safely skip this section. Otherwise, click on the dropdown of the method you would like to use below.

<details markdown="block">
<summary class="dropDown-header">Linux Dual Boot
</summary>

*Read this whole section before continuing*

Dual-booting provides you two operating systems that you can switch from with a simple reboot. Each partition will not modify the other unless you explicitly do so. Be sure you back up any important data and have a way to ask for help before you continue. If you get lost, scared, or stuck: Talk to us in the [Gitter chat room](https://gitter.im/TheOdinProject/theodinproject) at any time. It helps to have a phone or another computer around if you get stuck. This process almost always goes smoothly, so don't worry too much :) .

### Step 1: Downloading Linux

First you will need to download the version of linux you wish to install onto your computer. A good rule of thumb is to use Ubuntu 18.04LTS for stability. Ubuntu comes in different flavors and It is suggested to use [Ubuntu](https://www.ubuntu.com/download/desktop) itself if you can afford the computing requirements. If you cannot match the requirements, [Xubuntu](https://xubuntu.org/) is recommended for pure performance. You are not limited to these "flavors" of Ubuntu however, [here](https://www.ubuntu.com/download/flavours) is a list of the other official Ubuntu flavors and you can choose which ever you would like.

### Step 2: Creating a bootable flash-drive

(If you do not have a flash-drive, you can also burn the image to a CD or DVD)

Next you will create a bootable flash drive so you can install Ubuntu to your hard drive.

Follow [this guide](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows#0) for instructions.

Note: You can use this method to try out different flavors of Ubuntu if you would like. These images allow you to try the different flavors of Ubuntu without committing to an installation. Just note that due to the nature of USB, it is slow for this purpose, and using it this way consistently over time can harm your flash-drive.

If you would like to play with the version of Ubuntu you installed on the flash drive, click 'try me' instead of 'install'. When you have found a version of Ubuntu you like, continue to the next step.

### Step 3: Installing Ubuntu along side Windows

#### Step 3.1: Booting from the flash-drive

First you will need to boot into Linux on your flash-drive. The exact steps may vary, but on a general level you will need to:

* Insert the flash drive into the computer
* Reboot the computer into the BIOS/UEFI
* Select the flash drive as the bootable device instead of the hard drive

#### Step 3.1: Installing Ubuntu

This is where the real changes start happening to your computer. The best course of action is to leave the settings as default. And click the option saying, "Install Ubuntu alongside Windows". If this option is not available, please come ask for help.

One thing you might want to change is the allocated disk space allowed for Linux. 30gb or more is recommended. This can be changed later, but it is a more involved process.

For more information and images: click [here](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0) for a guide from the creators of Ubuntu themselves.

</details>

<details markdown="block">
<summary class="dropDown-header">Windows 10 Windows Subsystem for Linux
</summary>

Microsoft in recent years has made a huge shift to embrace open source and support developers. One of the biggest things they did with Windows 10 was introduce the Windows Subsystem for Linux (WSL) which is a full native command line implementation of Linux within Windows. Of course there are a couple minor adjustments you need to make, but once you have it up and running, you can essentially follow the Ubuntu instructions.

Microsoft has made it easy to get up and running using [Windows Settings and the Microsoft Store](https://winaero.com/blog/enable-wsl-windows-10-fall-creators-update/) and you can absolutely go that way, but since we're installing a command line let's use Windows' command line to do it:

### Step 1: Activate WSL

First you have to open PowerShell as an administrator. One way to do this is to start typing `powershell` into the task bar search. After just a couple letters PowerShell should show up. Just right click on it and select "Run as Administrator" (if multiple PowerShells show up, just select the top one.)

That way is just fine, but I like the super secret squirrel way to do it: press the key combination, `cmd+x` (cmd is the button on the bottom row to the left with the windows logo on it.) This will open a nice bare-bones menu where you can select a lot of useful tools skipping all the fancy bells and whistles. From there just open `Windows PowerShell (Admin)`. Once you have PowerShell up and running, type at the command prompt:

~~~bash
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
~~~

This will, as the command you just typed so conveniently pointed out, enable the optional Windows feature, Microsoft Windows Subsystem for Linux. But in order to actually make any use of it, you need to install a Linux distribution. If it asks you to, reboot your computer and continue to step 2. If it doesn't, just continue to step 2.

### Step 2: Install Ubuntu

#### Step 2.1: Download Your Distribution of Choice

You can actually use any of a number of linux distros which are all available at the windows store, including Ubuntu, which is the one we are going to focus on (in fact, you can install more than one distribution and use them in various combinations, but that is beyond the scope of this tutorial.) But since we were already using PowerShell, why not just download it from the command line? If you had to reboot, open PowerShell like you did in step 1,(be sure to run as an administrator again), and run:

~~~bash
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.zip -UseBasicParsing
~~~

#### Step 2.2: Extract the Zip File

Once we have the archive downloaded, just unzip it to the location of your choice. Once again, you can absolutely just click and unzip from windows explorer, but since we are elite haxors, and PowerShell is still open, let's keep on using it:

~~~bash
Expand-Archive ~/Ubuntu.zip C:\Ubuntu
~~~

#### Step 2.3: Install Your Distribution of Choice

Now we just run `Ubuntu.exe` which will be inside `C:\Ubuntu` so either click there like a pleb or type into PowerShell:

~~~bash
C:\Ubuntu\Ubuntu.exe
~~~

This will install Ubuntu and immediately transfer you into a bash environment right inside PowerShell. Follow the onscreen instructions to set up your username and password and you're good to go.

### Step 3: Set up Symbolic Link

Okay this is really important: **If you try to edit files inside of the Linux file system from windows apps they will disappear and potentially mess stuff up**. But this is easily avoided, and it even makes things better because you will be able to edit your files with your favorite windows editors and use your bash commands on them too!

When Ubuntu was set up, your windows file system was mapped to `/mnt` in Ubuntu. This means that your C drives is actually `/mnt/c` inside wsl. Anything saved in `/mnt/c` is available to windows and linux and won't cause any problems.

If you want to use your fancy windows editors, you will have to put your project files inside that directory, and if you want them to be easy to find from windows you will likely want them inside your user directories. we're going to show you how to set up a symbolic link to make things really easy on you.

#### Step 3.1: Create Directory for your Projects

You can choose to put your project files anywhere you want, but we're going to assume you are cool and put a projects folder in your documents folder.
From inside ubuntu type:

~~~bash
mkdir /mnt/c/Users/<your windows user name>/Documents/Projects
~~~

This will create the folder. Obviously you could have used windows explore to click your way there too, but why not use our fancy new toy?

#### Step 3.2: Create the Symbolic Link

Next, we're going to establish the link. Essentially it's like an alias such that when you are inside bash, you will be able to type something like: `ls ~/Projects` which is a directory inside your home directory inside bash, but Unbuntu will see this: `ls /mnt/c/Users/<your windows user name>/Documents/Projects` Which is a folder inside your Windows file system.

So, at your bash command prompt type:

~~~bash
ln -s /mnt/c/Users/<your windows user name>/Documents/Projects ~/Projects
~~~

now you can easily access and safely edit your projects folder from inside WSL just by using the `~/Projects` directory instead of `/mnt/c/Users/<your windows user name>/Documents/Projects`.

### Step 4: Install Git

Git is a version control system that both allows you to easily save projects to the cloud, but also enables easy collaboration. Additionally, a lot of packages that you are going to need are stored there and we are going to need a way to get them to your computer. Go to [this](https://git-scm.com/download/win) link and download and then install git for windows. (it should start automatically.) You will then have access to it from both Windows and WSL.

### Step 5 (optional): Make it Easier to Find

If you want to, you can pin a link to ubuntu.exe to your start menu or your desktop.

You can also run it from inside PowerShell (you no longer need to be running as an Admin) or the old school Command Prompt by typing `wsl`.

If you run wsl inside PowerShell or Command Prompt, you can exit it by typing `exit` with no arguments. This returns you back to the normal windows file system.

### One last time

You **can** edit files inside your Linux file system, but you **must** use a command line editor from inside Linux, not some editor on the Windows side or you **will** break something. The only exception is anything inside the `/mnt/<windows drive letter>` directory. This is directly analogous to `<windows drive letter>:\` and is fair game from both the Linux system and the Windows system.

### Additional Links for Further Study

* You can find more info about managing and configuring WSL [here](https://docs.microsoft.com/en-us/windows/wsl/wsl-config).

* [This](https://docs.microsoft.com/en-us/powershell/scripting/getting-started/getting-started-with-windows-powershell?view=powershell-6) is an introduction to PowerShell if you want to make more use of it.

* If you want to learn all about the `ln` command we used to make the symbolic link, the [man page](https://ss64.com/bash/ln.html) (manual page) has all the info you need.

</details>


<details markdown="block">
<summary class="dropDown-header">Virtual Machine with Linux
</summary>

If you want to use Ubuntu (or any other version of Linux) as the operating system for your development related to TOP, but you don't feel like permanently changing your OS or switching back and forth between two different operating systems installed on your PC, then using a VM is probably the best option you have. VM is short for 'Virtual machine' which is a widely used program that [emulates](https://en.wikipedia.org/wiki/Emulator) a computer system. In other words, a VM allows you to run an operating system of your choice just like any other computer program. Unfortunately, such convenience comes at a price. Running a program that contains an operating system can be very heavy on your processor and RAM memory.

### Requirements

Before committing to the installation, make sure your computer meets the [requirements](https://www.virtualbox.org/wiki/End-user_documentation) to run a virtual machine, it doesn't hurt to take a look at your selected flavor of linux's requirements as well.

### Step 1: Downloads

You have read through the introduction part and you feel like a VM is your best option? Your computer meets the minimum requirements? Great, let's get started then. This is a fairly simple process and only a few things could go wrong, we'll make sure to mention them. This guide uses Oracle's 'VirtualBox' program, it's open source, free and simple. What more can you ask of a piece of software? Now let's make sure we have everything downloaded and ready for installation:

#### Step 1.1.1: Downloading Virtual Box


[Click here](https://www.virtualbox.org/wiki/Downloads) and download VirtualBox for Windows hosts.

#### Step 1.1.2: Linux download

There are various versions of Linux out there, Ubuntu being undoubtedly the most popular one. Our recommendation is to [download](http://releases.ubuntu.com/18.04/ubuntu-18.04-desktop-amd64.iso) and use Ubuntu 18.04 LTS, if you plan on running your VM on a less powerful computer (A rough estimation would be < 4GB ram, < 4 processor cores, for more details check out their [official requirements](https://help.ubuntu.com/community/Installation/SystemRequirements)), we recommend [downloading](https://xubuntu.org/download) and using Xubuntu 18.04 LTS.

### Step 2: Installing Virtualbox and setting up Ubuntu

#### Step 2.1: Installing VirtualBox

The installation of VirtualBox is a very straight forward process. It doesn't require any technical knowledge and is the same as installing any other computer program on your Windows computer. Double-clicking the downloaded file is sufficient to start the installation process. Any additional options prompted by the installation are left for the user to decide (such as creating a desktop icon and so on). After the installation is finished (the progress bar might get stuck for a few minutes, just wait for it to finish) search for your newly installed Virtual Box program and run it.

#### Step 2.2: Setting up Ubuntu
Now that you have Virtual Box installed, double click the icon and you should see something like this:

![installed_vbox](https://i.imgur.com/VO9Y1Si.png)

Click on the 'New' button to create a virtual operating system. Find your operating system in the dropdown menu (Linux/Ubuntu) and name it as you wish. Continue by pressing next and choose the following options in the next steps:

1. Memory size - Should be about half of your computers maximum. For example, if you have 16GB of RAM memory, allocate 8GB to your virtual operating system.

2. Hard disk - Create a virtual hard disk

3. Hard disk file type - Choose the VDI (VirtualBox Disk Image) option

4. Storage on physical hard disk - Dynamically allocated

5. File location and size - We recommend at least 20GB for the virtual hard disk

After completing the last step, click the Create button. Your newly created virtual OS should be in the menu now. Right click on it and go to Settings. Go to the Storage section and add the Ubuntu iso file you downloaded earlier:

![choose_disc_vbox](https://i.imgur.com/D3xfaZa.png)

After that, you can go to the System tab and change the amount of hardware the virtual operating system will be using. Generally 50% of RAM and processors should be allocated to the virtual OS, but you can always change that and set them as it fits best for you.

Now you can start Ubuntu by right clicking on the icon in the menu and selecting Start then Normal Start.

The next thing to do is Install Ubuntu. The process is very simple and most of the default options can be left like that including the Installation type which should be `Erase disk and install Ubuntu`. The setup will ask you to confirm this step because it thinks you're formatting your entire hard disk, but actually you're only formatting the newly created virtual hard disk, which doesn't have any data on it, and installing Ubuntu.

You can find their official installation guide for Ubuntu [here](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0) in case you need it.

### Step 3: Installing Guest Additions and enabling them

 Your regular operating system (Windows in this case), the one that is booted directly by pressing that big button on your computer is called the **Host** and all other operating systems that are run inside your VM are **Guests**. To make working in your Guest OS easier, you need to install Guest Additions. They add a lot of functionality to the Guest OS like 'Drag n Drop' from one OS to the other, custom screen sizes for the Guest OS (including fullscreen), Shared folders and so on.

#### Step 3.1: Downloading the ISO

To install guest additions first download the .iso file from [here](https://download.virtualbox.org/virtualbox/). Find your version, click on it and then look for a .iso file named "VBoxGuestAdditions_x.x.x" (x.x.x being your current version). If you're not sure what version of VirtualBox you're using go to the Help tab and click on 'About VirtualBox'. It's important to mention that this download is done on the Host OS. You're downloading this .iso file to Windows.

#### Step 3.2: Installing the guest additions

Now Start Ubuntu unless it's already open and look for a CD icon in the bottom-right part of the screen. Click on the CD icon and click on 'Choose disk image' and then find your recently downloaded VBoxGuestAdditions.iso file and load it. The installation should start automatically, if it doesn't look for the VBox_Gas file on your desktop and open it. After the installation restart your Guest OS.

### Understanding how VM works

  It's important to note a few things about coding in a virtual environment:

* All installations are done in the VM. Now that you have everything set up it is important to mention that everything you install regarding coding you install on the Guest OS (Ubuntu in this case) including Ruby,Rails,Text editors and everything else you will need during this curriculum. This means that during the installation project, you consider yourself a Linux user, not a Windows user.

* All of the development related to TOP is done in the VM.

### Possible issues

If you can not choose anything other than a 32-bit operating system when setting up your VM look at [this](http://www.fixedbyvonnie.com/2014/11/virtualbox-showing-32-bit-guest-versions-64-bit-host-os/#.WzzZYXYzZN0)

If you get a message like 'This kernel requires an x86-64 CPU, but only detected an i686 CPU. Unable to boot - please use a kernel appropriate for your CPU.' , you should go to the BIOS settings of your PC and enable 'Virtualization Technologies' and 'VT-x' (or AMD-x), save the settings and restart your PC.

If you experience any issues during the installation don't hesitate to ask for help on the [forums](https://forum.theodinproject.com/c/help) or in our [Gitter chat](https://gitter.im/TheOdinProject/theodinproject).

</details>
