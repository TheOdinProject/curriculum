### Introduction
Before we can install ruby and get ready to launch a rails application, we have to set up the operating system to be compatible. 

If you are already using __MacOS__ or __Linux__ already you can skip this section. Otherwise, click on the dropdown of the method you would like to use below.


<details markdown="block">
<summary class="dropDown-header">Virtual Machine with Linux
</summary>

A Virtual Machine is the easiest and most reilable way of getting started with Web Development.  A Virtual Machine is simply an entire "computer" that runs inside of your current OS. The only drawback of a VM is that it can be slow because you're essentially running two computers at the same time, but there are things we will do to improve performance.

### Requirements

Before committing to the installation, make sure your computer meets the [requirements](https://www.virtualbox.org/wiki/End-user_documentation) to run a virtual machine, it doesn't hurt to take a look at your selected flavor of linux's requirements as well.

### Step 1: Downloads

You have read through the introduction part and you feel like a VM is your best option? Your computer meets the minimum requirements? Great, let's get started then. This is a fairly simple process and only a few things could go wrong, we'll make sure to mention them. This guide uses Oracle's 'VirtualBox' program, it's open source, free and simple. What more can you ask of a piece of software? Now let's make sure we have everything downloaded and ready for installation:

#### Step 1.1.1: Downloading Virtual Box


[Click here](https://www.virtualbox.org/wiki/Downloads) and download VirtualBox for Windows hosts.

#### Step 1.1.2: Linux download

There are thousands of versions of Linux out there, but Ubuntu is undoubtedly one of the most popular and user friendly. When installing on a VM we recommend [downloading](http://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/18.04/release/xubuntu-18.04-desktop-amd64.iso) and installing [Xubuntu 18.04](https://xubuntu.org/release/18-04/). Xubuntu uses the same base software as Ubuntu, but has a display that requires less computer resources, and thus, is better for VM environments.

### Step 2: Installing Virtualbox and setting up Xubuntu

#### Step 2.1: Installing VirtualBox

The installation of VirtualBox is a very straight forward process. It doesn't require any technical knowledge and is the same as installing any other computer program on your Windows computer. Double-clicking the downloaded file is sufficient to start the installation process. Any additional options prompted by the installation are left for the user to decide (such as creating a desktop icon and so on). After the installation is finished (the progress bar might get stuck for a few minutes, just wait for it to finish) search for your newly installed Virtual Box program and run it.

#### Step 2.2: Setting up Xubuntu
Now that you have Virtual Box installed, double click the icon and you should see something like this:

![installed_vbox](https://i.imgur.com/VO9Y1Si.png)

Click on the 'New' button to create a virtual operating system. Find your operating system in the dropdown menu (Linux/Ubuntu) and name it as you wish. Continue by pressing next and choose the following options in the next steps:

1. Memory size - Use 2048 MB or more if possible.  Ideally, this amount should be about half of your computers maximum. For example, if you have 8GB of RAM memory, allocate 4GB to your virtual operating system.

2. Hard disk - Create a virtual hard disk

3. Hard disk file type - Choose the VDI (VirtualBox Disk Image) option

4. Storage on physical hard disk - Dynamically allocated

5. File location and size - We recommend at least 20GB for the virtual hard disk.

After completing the last step, click the Create button. Your newly created virtual OS should be in the menu now. 

Right click on it and go to Settings. Click on the __System__ tab and then the __Processor__ Tab.  Increase the __Processor(s)__ to 2.

Next, go to the __Storage__ tab and click the __Empty__ CD Icon. Add the Xubuntu iso file you downloaded earlier:

![choose_disc_vbox](https://i.imgur.com/KvF7FHJ.png)

With all that complete, click __OK__ to save the changes.

You can start the VM by right clicking on the icon in the menu and selecting Start then Normal Start.

The next thing to do is Install Xubuntu. The process is very simple and most of the default options can be left like that including the Installation type which should be `Erase disk and install Ubuntu`. You will need to confirm this step. It may sound dangerous, but the VM can only see the "Hard Drive" you created above in step 2.2 #2-5. This is the beauty of VMs - the ability to separate the physical space of your computer across many VMs.

The rest of the installation is pretty straightforward, but should you have any questions you can find Ubunutu's official installation guide for Ubuntu [here](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0).

### Step 3: Installing Guest Additions and enabling them

 Your regular operating system (Windows in this case) is called the **Host** and all other operating systems that run as Virtual Machines are called **Guests**. To make working in your Guest OS easier you need to install Guest Additions. Guest Additions add a lot of functionality to the Guest OS like 'Drag n Drop' files, full-screen guest mode, shared folders and copy/paste between host and guest.

Installing Guest Additions can be tricky, but luckily there is Youtube. Check out [this video](https://www.youtube.com/watch?v=qNecdUsuTPw) by ProgrammingKnowledge on how to install the Guest Additions.  Their installation may look different than yours, but all of the commands are the same.

Installing the Guest Additions is the hardest part of setting up a VM.

### Understanding how VM works

It's important to note a few things about coding in a virtual environment:

* All installations are done in the VM. You will install everything you need for coding inside the Guest OS including Ruby, Rails, and Javascript.

* You will now follow all Linux installation instructions

* All of the development related to TOP is done in the VM.

* It's easiest to go full screen (Edit > Full-Screen Mode) and forget about the host OS.

</details>

<details markdown="block">
<summary class="dropDown-header">Linux/Windows Dual Boot
</summary>

*Read this whole section before continuing*

Dual-booting provides you two operating systems that you can switch from with a simple reboot. Each partition will not modify the other unless you explicitly do so. Be sure you back up any important data and have a way to ask for help before you continue. If you get lost, scared, or stuck we're here to help in the [Odin Tech Support chat room](https://gitter.im/TheOdinProject/tech_support). Come say "Hi".

### Step 1: Downloading Linux

First you will need to download the version of linux you wish to install onto your computer. Ubuntu comes in different versions ("flavors"), but we suggested the standard [Ubuntu](https://www.ubuntu.com/download/desktop) or [Xubuntu](https://xubuntu.org/) if you're using an older computer. Be sure to download the 64-bit version of [Ubuntu](https://www.ubuntu.com/download/desktop/thank-you?version=18.04.1&architecture=amd64) or [Xubuntu](http://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/18.04/release/xubuntu-18.04-desktop-amd64.iso).

### Step 2: Creating a bootable flash-drive

(If you do not have a flash-drive, you can also burn the image to a CD or DVD)

Next you will create a bootable flash drive so you can install Ubuntu to your hard drive.

Follow [this guide](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows#0) for instructions.

Note: You can use this method to try out different [flavors of Ubuntu](https://www.ubuntu.com/download/flavours) if you would like. These images allow you to try the different flavors of Ubuntu without committing to an installation. Just note that because the OS is running from the USB drive it will be slow and can decrease the life of your USB drive.

### Step 3: Installing Ubuntu along side Windows

#### Step 3.1: Booting from the flash-drive

First you will need to boot into Linux on your flash-drive. The exact steps may vary, but on a general level you will need to:

* Insert the flash drive into the computer
* Reboot the computer
* Select the flash drive as the bootable device instead of the hard drive

For example, on a Dell computer you will need to plug in the USB drive, reboot the computer and press the F12 key when the computer is first booting up to bring up the boot menu. From here you can select your USB drive and boot from that.  Your computer may not be the same, so google will be your friend in trying to figure it out.

#### Step 3.1: Installing Ubuntu

If you would like to play with the version of Ubuntu you installed on the flash drive, click 'try me' instead of 'install'. When you have found a flavor of Ubuntu you like, continue to the next step.

The installation of Ubuntu is where the real changes start happening to your computer. The default settings are mostly perfect, but be sure to "__Install Ubuntu alongside Windows__" and change is the allocated disk space allowed for Linux. 30 GB or more if you can.

For step by step instructions please follow this [installation guide](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0) from the creators of Ubuntu.

</details>

<details markdown="block">
<summary class="dropDown-header">Windows 10 Windows Subsystem for Linux
</summary>

Microsoft has recently made a shift to embrace open source and support developers. One of the biggest things they did with Windows 10 was introduce the Windows Subsystem for Linux (WSL) which is a linux command line within Windows. Of course there are a couple minor adjustments you need to make, but once you have it up and running, you can essentially follow the Ubuntu instructions.

With that being said, WSL is still rather buggy with Ruby and Rails so we suggest you use a Virtual Machine instead. It will save you headaches in the long run.

Since the 2017 Fall Creators Update, Microsoft has made it easy to get up and running using [Windows Settings and the Microsoft Store](https://winaero.com/blog/enable-wsl-windows-10-fall-creators-update/). It's as simple as installing via the Microsoft Store.

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

When Ubuntu was set up, your windows file system (C-Drive) was mapped to the `/mnt` directory in Ubuntu. To make your life much easier we are going to set up a shortcut between your C-Drive and your "Home" folder inside of WSL.

#### Step 3.1: Create Directory for your Projects

You can choose to put your project files anywhere you want, but we're going to assume you are cool and put a projects folder in your Documents folder.

From inside the Ubuntu terminal type:

~~~bash
mkdir /mnt/c/Users/<Your Windows Username>/Documents/Projects
~~~

(Replace `<Your Windows Username>` with your Windows username). This will create a new `Projects` folder inside of your Documents folder. Obviously you could have used windows explore to click your way there too, but why not use our fancy new toy?

#### Step 3.2: Create the Symbolic Link

Next, we're going to establish a link to connect this new Projects folder to your WSL "Home" directory.  This is important for many behind-the-scenes reasons.

At your Ubuntu command prompt type:

~~~bash
ln -s /mnt/c/Users/<your windows user name>/Documents/Projects ~/Projects
~~~

### Important Notes

* Any projects created from the WSL Terminal need to be placed inside the Projects directory

* The WSL program files are well hidden but it's super important that you do not edit these files from Windows. Ignoring this will cause serious problems to your Ubuntu installation and possibly your Windows installation.

</details>
