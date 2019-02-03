### Introduction
Before we can install Ruby and launch a Rails application, we need to set up a compatible operating system. 

If you are already using **MacOS** or **Linux**, you can skip this section. Otherwise, click on the small arrow to the left of the method you would like to use below to expand that section, and then follow the installation instructions.


<details markdown="block">
<summary class="dropDown-header">Virtual Machine (Easiest)
</summary>

Installing a virtual machine (VM) is the easiest and most reilable way to get started with web development. A VM is an entire computer emulation that runs inside your current OS. The main drawback of a VM is that it can be slow because you're essentially running two computers at the same time. We'll do a few things to improve its performance though.

### Step 1: Download VirtualBox and Linux

Installating a VM is a simple process. This guide uses Oracle's VirtualBox program to create and run the VM. This program is open-source, free, and simple. What more can you ask for? Now, let's make sure we have everything downloaded and ready for installation.

#### Step 1.1: Download VirtualBox

[Click here](https://www.virtualbox.org/wiki/Downloads) and download VirtualBox for Windows hosts.

#### Step 1.2: Download Linux

There are thousands of versions of Linux out there, but Ubuntu is undoubtedly one of the most popular and user friendly. When installing Linux on a VM, we recommend [downloading](http://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/18.04/release/xubuntu-18.04-desktop-amd64.iso) and installing [Xubuntu 18.04](https://xubuntu.org/release/18-04/). Xubuntu uses the same base software as Ubuntu but has a display that requires fewer computer resources and is therefore better for VM environments.

### Step 2: Install VirtualBox and Set up Xubuntu

#### Step 2.1: Install VirtualBox

Installing VirtualBox is very straightforward. It doesn't require any technical knowledge and is the same process as installing any other program on your Windows computer. Double clicking the downloaded file will start the installation process. Any additional options prompted by the installation, such as creating a desktop icon, are left for you to decide. During installation, the progress bar might get stuck for a few minutes; just wait for it to finish. After the installation is finished, search for your newly installed VirtualBox program and run it.

#### Step 2.2: Set up Xubuntu
Now that you have VirtualBox installed, double click the icon, and you should see something like this:

![installed_vbox](https://i.imgur.com/VO9Y1Si.png)

Click on the "New" button to create a virtual operating system. Find your operating system in the dropdown menu (Linux/Ubuntu) and name it as you wish. Continue by pressing "Next", and choose the following options in the next steps:

  1. Memory size: Use 2048 MB or more if possible. Ideally, this amount should be about half of your computer's maximum memory. For example, if you have 8 GB of RAM, allocate 4 GB to your VM's operating system.

  2. Hard disk: Create a virtual hard disk.

  3. Hard disk file type: Choose the VDI (VirtualBox disk image) option.

  4. Storage on physical hard disk: Dynamically allocated.

  5. File location and size: We recommend at least 20 GB for the virtual hard disk.

After completing the last step, click the "Create" button. Your new virtual OS should be in the menu now. Right click on it, and go to "Settings". Click on the "System" tab and then the "Processor" tab. Increase the Processor(s) to 2.

Next, go to the "Storage" tab and click the "Empty" CD icon. Add the Xubuntu iso file you downloaded earlier:

![choose_disc_vbox](https://i.imgur.com/KvF7FHJ.png)

With all that complete, click "OK" to save the changes.

You can start the VM by right clicking on the icon in the menu and by selecting "Start" and then "Normal Start".

When the VM starts up, you'll be asked to install Xubuntu. The process is very simple, and all of the default options can be left alone, including the Installation type ("Erase disk and install Ubuntu"). It may sound dangerous, but the VM can only see the "Hard Drive" of the VM. This is the beauty of VMs: the ability to separate the physical space of your computer across many VMs.

The rest of the installation is pretty straightforward, but if you have any questions, you can find Ubuntu's official installation guide for Ubuntu [here](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0).

### Step 3: Install and Enable Guest Additions

 Your regular operating system (Windows in this case) is called the **Host**, and all other operating systems that run as VMs are called **Guests**. To make working in your Guest OS easier, you need to install Guest Additions. Guest Additions add a lot of functionality to the Guest OS, such as "Drag n Drop" files, full-screen guest mode, shared folders, and copy/paste between the host and guest.

Installing Guest Additions is the hardest part of setting up a VM, but luckily, we have Guides. Check out [this article](http://www.fixedbyvonnie.com/2015/07/how-to-setup-xubuntu-linux-in-virtualbox-step-by-step/#.XDVqWVxKguU). You can simple scroll down to the portion that says `Installing Guest Additions in Xubuntu`.

### Step 4: Understand Your New VM

Here are some tips to help you get started coding in a virtual environment:

* All installations are done in the VM. You will install everything you need for coding, including Ruby, Rails, and JavaScript, inside the Guest OS.

* To install software on your VM, you will follow the Linux installation instructions from inside the Xubuntu VM.

* All of the development that you'll do related to TOP will be done in the VM.

* We recommend going full screen (Edit > Full-Screen Mode) and forgeting about your host OS (Windows).

</details>

<details markdown="block">
<summary class="dropDown-header">Linux/Windows Dual-Boot
</summary>

**Read this entire section before starting**

Dual-booting provides two operating systems on your computer that you can switch between with a simple reboot. One OS will not modify the other unless you explicitly tell it to do so. Before you continue, be sure to back up any important data and to have a way to ask for help. If you get lost, scared, or stuck, we're here to help in the [Odin Tech Support chat room](https://discordapp.com/channels/505093832157691914/514204667245363200). Come say "Hi"!

### Step 1: Download Linux

First, you need to download the version of Linux you want to install on your computer. Ubuntu comes in different versions ("flavors"), but we suggest the standard [Ubuntu](https://www.ubuntu.com/download/desktop). If you're using an older computer, we recommend [Xubuntu](https://xubuntu.org/). Be sure to download the 64-bit version of [Ubuntu](https://www.ubuntu.com/download/desktop/thank-you?version=18.04.1&architecture=amd64) or [Xubuntu](http://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/18.04/release/xubuntu-18.04-desktop-amd64.iso).

### Step 2: Create a Bootable Flash Drive

Next, follow [this guide](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows#0) to create a bootable flash drive so that you can install Ubuntu on your hard drive. If you don't have a flash drive, you can also use a CD or DVD.

Note: You can use this method to try out [different flavors of Ubuntu](https://www.ubuntu.com/download/flavours) if you'd like. These images allow you to try out different flavors without committing to an installation. Be aware that running the OS from a flash drive will cause the OS to be slow and can decrease the life of your flash drive.

### Step 3: Install Ubuntu

#### Step 3.1: Boot from the Flash Drive

First, you need to boot Linux on your flash drive. The exact steps may vary, but in general, you will need to do the following:

* Insert the flash drive into the computer.
* Reboot the computer.
* Select the flash drive as the bootable device instead of the hard drive.

For example, on a Dell computer, you would need to plug in the flash drive, reboot the computer, and press the F12 key while the computer is first booting up to bring up the boot menu. From there, you can select to boot from the flash drive. Your computer may not be exactly the same, but Google can help you figure it out.

#### Step 3.1: Install Ubuntu

If you would like to test out the version of Ubuntu on the flash drive, click 'Try me'. When you have found a flavor of Ubuntu you like, click 'Install' and continue to the next step.

Installing Ubuntu is where the real changes start happening on your computer. The default settings are mostly perfect, but be sure to **"Install Ubuntu alongside Windows"** and change the allocated disk space allowed for Linux to 30 GB (or more if you can).

For step-by-step instructions, please follow this [installation guide](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0) from the creators of Ubuntu.

</details>

<details markdown="block">
<summary class="dropDown-header">Windows 10 WSL (Not Recommended)
</summary>

Microsoft has recently made a shift towards embracing open source and providing more developer support. One of the biggest features they added with Windows 10 was the Windows Subsystem for Linux (WSL), which is a Linux command line within Windows. With the exception of a few minor adjustments, once you have WSL up and running, you can essentially follow the Ubuntu instructions.

With that being said, though, Ruby and Rails are still rather buggy on WSL, so we recommend using a virtual machine instead. In the long run, using a VM instead of WSL will save you time and headaches.

Since the 2017 Fall Creators Update, Microsoft has made it easy to get up and running using [Windows Settings and the Microsoft Store](https://winaero.com/blog/enable-wsl-windows-10-fall-creators-update/). 

### Step 1: Install WSL

Microsoft has made installing WSL super simple.

* Open your Start menu and search for "Microsoft Store". Open the Store.
* Enter "Ubuntu" in the search field of the Store. 
* Click on the orange "Ubuntu 18.04" button and then click "Get".

This will install WSL on your computer. The process will take about 10 minutes to complete, depending on your internet connection.

Note: If you run into an error, follow the directions [here](https://aka.ms/wslinstall) to enable and install WSL.

### Step 2: Start WSL

WSL is nothing more than a Linux terminal inside Windows. To start the program, simply open your Start menu and search for "Ubuntu 18.04". The first time you run the program, you may get a message that says, "Installing. This may take a few minutes..." When it finishes, you will be asked to create a new username and password that will be used to log into WSL.

### Step 3: Set Up Symbolic Link

When Ubuntu was set up, your Windows file system (C:\ drive) was mapped to the `/mnt` directory in Ubuntu. To make your life much easier, we are going to set up a shortcut between your C:\ drive and your "Home" folder inside WSL.

#### Step 3.1: Create a Projects Directory

You can choose to put your project files anywhere you want, but to make your life easier, we recommend adding a Projects folder inside your Documents folder.

From inside the Ubuntu terminal, type:

~~~bash
mkdir /mnt/c/Users/<Your Windows Username>/Documents/Projects
~~~

Be sure to replace `<Your Windows Username>` with your Windows username in the above code.

#### Step 3.2: Create the Symbolic Link

Next, we're going to establish a link to connect this new Projects folder to your WSL "Home" directory. This is important for many behind-the-scenes processes.

Inside the Ubuntu terminal, type:

~~~bash
ln -s /mnt/c/Users/<your windows user name>/Documents/Projects ~/Projects
~~~

### Important Notes

* Any projects created from the WSL terminal need to be placed inside the Projects directory.

* The WSL program files are well hidden, but it's super important that you do not edit these files from Windows. Altering these files will cause serious problems with your Ubuntu installation and possibly with your Windows installation.

</details>

**Please Note: We do not support Windows without a VM or WSL at this time, many people have had problems developing with Rails while using Windows** 

The Odin Project has great support for Linux if you get stuck, please give it a shot :)
