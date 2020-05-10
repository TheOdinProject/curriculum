### Introduction
Before we can continue, we need to set up a development environment.

If you are already using **MacOS** or **Ubuntu**, you can skip this section. Otherwise, click on the small arrow to the left of the method you would like to use below to expand that section, and then follow the installation instructions.


<details markdown="block">
<summary class="dropDown-header">Virtual Machine (Recommended)
</summary>

Installing a Virtual Machine (VM) is the easiest and most reliable way to get started creating an environment for web development. A VM is an entire computer emulation that runs inside your current Operating System (OS), like Windows. The main drawback of a VM is that it can be slow because you’re essentially running two computers at the same time. We’ll do a few things to improve its performance.

### Step 1: Download VirtualBox and Xubuntu

Installing a VM is a simple process. This guide uses Oracle's VirtualBox program to create and run the VM. This program is open-source, free, and simple. What more can you ask for? Now, let's make sure we have everything downloaded and ready for installation.

#### Step 1.1: Download VirtualBox

[Click here](https://www.virtualbox.org/wiki/Downloads "VirtualBox Downloads") and download VirtualBox for Windows hosts.

#### Step 1.2: Download Xubuntu

There are thousands of versions of Linux out there, but Ubuntu is undoubtedly one of the most popular and user friendly. When installing Linux on a VM, we recommend [downloading Xubuntu 18.04](http://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/18.04/release/xubuntu-18.04-desktop-amd64.iso "Xubuntu Download Link"). Xubuntu uses the same base software as Ubuntu but has a desktop environment that requires fewer computer resources and is therefore ideal for virtual machines.

### Step 2: Install VirtualBox and set up Xubuntu

#### Step 2.1: Install VirtualBox

Installing VirtualBox is very straightforward. It doesn’t require much technical knowledge and is the same process as installing any other program on your Windows computer. Double clicking the downloaded VirtualBox file will start the installation process. During the installation, you’ll be presented with various options. Leave them in their default state unless you are certain about their behavior. As the software installs, the progress bar might appear to be stuck; just wait for it to finish.

#### Step 2.2: Prepare VirtualBox for Xubuntu

Now that you have VirtualBox installed, launch the program. Once open, you should see the start screen.

<img style="solid; border-width: thin; width:initial;" src="https://i.imgur.com/KKhCk0O.png" alt="The VirtualBox start screen" title="A new start">

Click on the “New” button to create a virtual operating system. Give it a name of “Xubuntu”, leave the “Machine Folder” as is, set the “Type” to “Linux” and be sure “Version” is set to “Ubuntu (64-bit)”. Continue by pressing “Next”, and choose the following options in the next steps:

<img style="border-style:solid; border-width: thin; width: initial;" src="https://i.imgur.com/v5DB5VZ.png" alt="The VirtualBox Create Virtual Machine window" title="Xubuntu should make the Version be Ubuntu (64-bit) automatically">

  1. Memory size: Use 2048 MB or more if possible. Ideally, this amount should be about half of your computer’s maximum memory. For example, if you have 8 GB of RAM, allocate 4096 MB (1024 MB to 1 GB) to your VM’s operating system. If you do not know how much RAM is available to you, please click [here](https://www.google.com/search?q=how+to+find+out+how+much+ram+you+have).
  
  <img style="border-style:solid; border-width: thin; width: initial;" src="https://i.imgur.com/U9OUMYy.png" alt="The VirtualBox RAM window" title="Please allow me to Google that for you">

  2. Hard disk: Click **“Create a virtual hard disk now”.**
  
  <img style="border-style:solid; border-width: thin; width: initial;" src="https://i.imgur.com/NSUorQQ.png" alt="The VirtualBox Create Hard Disk window 1" title="This is the default selection">

  3. Hard disk file type: Choose the **VDI (VirtualBox disk image)** option.
  
  <img style="border-style:solid; border-width: thin; width: initial;" src="https://i.imgur.com/NSUorQQ.png" alt="The VirtualBox Create Virtual Hard Disk window 2" title="This is also the default selection">
   
   4. Storage on physical hard disk: **“Dynamically allocated”**.
  
  <img style="border-style:solid; border-width: thin; width: initial;" src="https://i.imgur.com/LbU5cpc.png" alt="The VirtualBox Create Virtual Hard Disk window 3" title="Yet another default selection">
  
   5. File location and size: We recommend **at least 20 GB** for the virtual hard disk.
  
  <img style="border-style:solid; border-width: thin; width: initial;" src="https://i.imgur.com/gR21gCK.png" alt="The VirtualBox Create Virtual Hard Disk window 4" title="You could make it 21 GB if you want">

After completing the last step, click the **“Create”** button. Your new virtual OS should now appear in the menu. With **Xubuntu** selected, click on the **"Settings"** button on the navigation bar, highlighted in red below.

<img style="border-style:solid; border-width: thin; width: initial;" src="https://i.imgur.com/cmP2CH7.png" alt="The VirtualBox Home screen with Xubuntu" title="Or you can right-click Xubuntu and go to Settings">

 Click on the **“System”** tab and then the **“Processor”** tab. Increase the Processor(s) to 2. If this screen prevents you from increasing processors, you likely need to <a href="https://www.google.com/search?q=enable+virtualization+windows" target="_blank">enable virtualization in your computer’s BIOS/UEFI settings</a>. If you have a single core processor, you will not be able to change this setting.
 
<img style="border-style:solid; border-width: thin; width: initial" src="https://i.imgur.com/WAW79ep.png" alt="The Xubuntu System Settings Processor window" title="Weirdly enough, some people still have single core processors">

If you have more than one monitor, you can create additional monitors by increasing the **"Monitor Count"** attribute in the **"Display"** tab. Please be sure to increase the **"Video Memory"** slider until it is in the green. <u>**All other settings should remain default.**</u>

<img style="border-style:solid; border-width: thin; width: intitial;" src="https://i.imgur.com/qtJdmAo.png" alt="The Xubuntu System Settings Display window" title="This feature works surprisingly well">

With all that complete, click **"OK"** to save the changes.

You cannot install Xubuntu without mounting the ISO you downloaded earlier. We will do that now. Click on the section labeled **[Optical Drive] Empty** to the right of the text labeled **IDE Secondary Master** under **Storage** at the main VirtualBox screen, while Xubuntu is selected. This will open up a dropdown menu, click **Choose/Create a disk image...**.

<img style="border-style:solid; border-width: thin; width: intitial;" src="https://i.imgur.com/GHEDUmv.png" alt="The VirtualBox Home Screen again" title="This is much easier now">

The next window that opens, click on the Blue Circle with the Green Plus labeled **Add**, and locate your Xubuntu ISO file you downloaded earlier. Choose the ISO and click open.

<img style="border-style:solid; border-width: thin; width: intitial;" src="https://i.imgur.com/1af8WwO.png" alt="The Xubuntu - Opticial Disk Selector screen" title="So much easier">

You should now see the ISO on the Disk Selector screen. Click it and hit the **Choose** button at the bottom.

<img style="border-style:solid; border-width: thin; width: intitial;" src="https://i.imgur.com/2c402Xx.png" alt="The Xubuntu - Opticial Disk Selector screen but with an ISO loaded" title="And it works">

You can now start the VM by right clicking on the icon in the menu and by clicking the large "Start" arrow at the top.

When the VM starts up, you'll be asked to install Xubuntu. All of the default options can be left alone, including the Installation type ("Erase disk and install Ubuntu"). It may sound dangerous, but the VM can only see the "Hard Drive" of the VM. This is the beauty of VMs: the ability to separate the physical space of your computer across many VMs. While installing, be sure to take note of the password and username you chose, we will need these later.

The rest of the installation is pretty straightforward, but if you have any questions, you can find Ubuntu's official installation guide for Ubuntu [here](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0).

### Step 3: Install and Enable Guest Additions

Your regular operating system (Windows in this case) is called the **Host**, and all other operating systems that run as VMs are called **Guests**. To make working in your Guest OS easier, you need to install Guest Additions. It adds useful functionality to the Guest OS, such as full-screen guest mode.

While your VM is running, do the following steps:

  1. Click the **Whisker Menu** <img src="https://i.imgur.com/EjSLkCZ.png" style="width:25px" title="The Whisker Menu Icon" alt="Whisker Menu Icon"> on the top left of the desktop.
  2. Type `Software Updater` in the text field that opens up and click on the item with the same name.
  3. Install all available updates. If there are no available updates, move on to Step 5.
  4. If the **Software Updater** is stuck waiting for an **unattended upgrade** to finish, reboot the VM and start again from Step 1.
  5. Open a terminal with `ctrl + alt + t` or opening the **Whisker Menu** and typing in **Terminal** (the shortcut is obviously faster).
  6. Copy and paste this into the terminal and hit enter: `sudo apt install linux-headers-$(uname -r) build-essential dkms`. Enter your password when it asks you to.
  7. If you get the following errors: **Unable to locate package build-essential** and **Unable to locate package dkms**, paste in the following: `sudo apt-get install build-essential` and enter your password. Otherwise, move on to Step 8.
  8. Type `Y` when it asks you to and let it finish installing. Close the terminal when it is finished.
  9. Click **Devices** on the VM toolbar -> **Insert Guest additions CD image** in the menu bar.
  10. Wait for the CD image to mount, it will show the CD on the desktop as solid, not transparent, and a window will show on the top right of the VM screen saying it was successfully mounted.
  11. Double-click on the CD icon on the VM desktop.
  12. In the new window that opens, right click on the white-space or any file/folder, and click **Open Terminal Here**.
  13. In the newly opened terminal window, paste `sudo ./VBoxLinuxAdditions.run` and hit enter.
  14. Once it finishes, reboot your VM (which you can do by typing `reboot` and hitting enter).
  15. You can now maximize the VM window, use the shared clipboard, and create additional displays, among many other useful features. These options are available on the VM toolbar under **View** and **Device**.
  
  **NOTE**: 

* If upon trying to start the VM you only get a black screen, close and "power off" the VM, click "Settings -> Display" and make sure "Enable 3D Acceleration" is UNCHECKED, and Video memory is set to AT LEAST 128mb. 
* If you receive an error when trying to mount the Guest Additions CD image ("Unable to insert the virtual optical disk"), please reboot your host (Windows/OSX) operating system. Afterwards, ensure that there is no image file mounted in *both* Virtual Box as well as in the file system of the VM. 

### Step 4: Understand Your New VM

Here are some tips to help you get started in a virtual environment:

* All your work should happen in the VM. You will install everything you need for coding, including your text editor, Ruby, and Rails inside the VM. The Xubuntu installation inside of your VM also comes with a web browser pre-installed.

* To install software on your VM, you will follow the Ubuntu installation instructions from inside the Xubuntu VM.

* All of the development that you'll do related to TOP will be done in the VM.

* We recommend going full screen (Edit > Full-screen Mode) and forgetting about your host OS (Windows). For best performance, close all programs inside of your host OS when running your VM.

* If you added additional monitors in the "Display" tab of your VM settings, with the VM running, clicking "View" -> "Virtual Screen 2" -> "Enable". You can run fullscreen with multiple monitors, but it may ask for more "Video Memory", which you should have increased when adding more monitors. Upon exiting fullscreen, your secondary display may close. You can reopen it with these instructions.

</details>

<details markdown="block">
<summary class="dropDown-header">Ubuntu/Windows Dual-Boot
</summary>

**Read this entire section before starting**

Dual-booting provides two operating systems on your computer that you can switch between with a simple reboot. One OS will not modify the other unless you explicitly tell it to do so. Before you continue, be sure to back up any important data and to have a way to ask for help. If you get lost, scared, or stuck, we're here to help in the [Odin Tech Support chat room](https://discordapp.com/channels/505093832157691914/514204667245363200). Come say "Hi"!

### Step 1: Download Ubuntu

First, you need to download the version of Ubuntu you want to install on your computer. Ubuntu comes in different versions ("flavors"), but we suggest the standard [Ubuntu](https://www.ubuntu.com/download/desktop). If you're using an older computer, we recommend [Xubuntu](https://xubuntu.org/). Be sure to download the 64-bit version of [Ubuntu](https://www.ubuntu.com/download/desktop/thank-you?version=18.04.1&architecture=amd64) or [Xubuntu](http://ftp.ussg.iu.edu/linux/xubuntu/18.04/release/xubuntu-18.04.3-desktop-amd64.iso).

### Step 2: Create a Bootable Flash Drive

Next, follow [this guide](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows#0) to create a bootable flash drive so that you can install Ubuntu on your hard drive. If you don't have a flash drive, you can also use a CD or DVD.

Note: You can use this method to try out [different flavors of Ubuntu](https://www.ubuntu.com/download/flavours) if you'd like. These images allow you to try out different flavors without committing to an installation. Be aware that running the OS from a flash drive will cause the OS to be slow and can decrease the life of your flash drive.

### Step 3: Install Ubuntu

#### Step 3.1: Boot from the Flash Drive

First, you need to boot Ubuntu on your flash drive. The exact steps may vary, but in general, you will need to do the following:

* Insert the flash drive into the computer.
* Reboot the computer.
* Select the flash drive as the bootable device instead of the hard drive.

For example, on a Dell computer, you would need to plug in the flash drive, reboot the computer, and press the F12 key while the computer is first booting up to bring up the boot menu. From there, you can select to boot from the flash drive. Your computer may not be exactly the same, but Google can help you figure it out.

#### Step 3.2: Install Ubuntu

If you would like to test out the version of Ubuntu on the flash drive, click 'Try me'. When you have found a flavor of Ubuntu you like, click 'Install' and continue to the next step.

Installing Ubuntu is where the real changes start happening on your computer. The default settings are mostly perfect, but be sure to **"Install Ubuntu alongside Windows"** and change the allocated disk space allowed for Ubuntu to 30 GB (or more if you can).

For step-by-step instructions, please follow this [installation guide](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0) from the creators of Ubuntu.

</details>

<details markdown="block">
<summary class="dropDown-header">Windows 10 WSL (Not Supported)
</summary>
  
**Please note**: *Windows Subsystem for Linux is **not recommended** for those unfamiliar with Linux and advanced Windows features. Specifically, those unfamiliar with with the Command Line. Please consider installing Linux in a virtual machine or dual-boot*.

Microsoft has recently made a shift towards embracing open source and providing more developer support. One of the biggest features they added with Windows 10 was the Windows Subsystem for Linux (WSL), which is a Linux command line within Windows. With the exception of a few minor adjustments, once you have WSL up and running, you can essentially follow the Ubuntu instructions.

Having said that, setting up a development environment is not beginner friendly.  If you have run Linux environments in the past you will likely be able to get up and running, but if this is all new to you it is probably more trouble than it's worth.

If you do choose to move forward with WSL, we recommend using VSCode as your text editor (we will get into text editors later), running with the "Remote - WSL" extension. This allows you to open your WSL files directly in the editor. The Linux subsystem is completely separate from your Windows subsystem and you will have to manually link them together otherwise.

The Odin Project has great support for Linux/MacOS if you get stuck, so please give it a shot! If you feel you can contribute and support Windows at The Odin Project, please create a PR with Windows installation directions, and fixes for wherever the Windows commands might differ from Linux.

If you'd like to move forward with WSL, despite the warning above, please see below for installation instructions.

  <details markdown="block">
  <summary class="dropDown-header">Windows Subsystem for Linux Directions
  </summary>

### Step 1: Install WSL

Microsoft has made installing WSL super simple.

* Open your Start menu and search for "Microsoft Store". Open the Store.
* Enter "Ubuntu" in the search field of the Store. 
* Click on the orange "Ubuntu 18.04" button and then click "Get".

This will install WSL on your computer. The process will take about 10 minutes to complete, depending on your internet connection.

Note: If you run into an error, follow the directions [here](https://aka.ms/wslinstall) to enable and install WSL.

### Step 2: Start WSL

WSL is nothing more than a Linux terminal inside Windows. To start the program, simply open your Start menu and search for "Ubuntu 18.04". The first time you run the program, you may get a message that says, "Installing. This may take a few minutes..." When it finishes, you will be asked to create a new username and password that will be used to log into WSL.

*You can skip all of the following steps if you will be using VSCode with the "Remote - WSL" extension*

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

* Open all of your projects through the terminal. 

* The WSL program files are well hidden, but it's super important that you do not edit these files from Windows. Altering these files will cause serious problems with your Ubuntu installation and possibly with your Windows installation.
  </details>

</details>
