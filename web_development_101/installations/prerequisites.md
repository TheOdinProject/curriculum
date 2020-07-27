### Introduction
Before we can continue, we need to set up a development environment.

If you are already using **MacOS** or **Ubuntu**, you can skip this section. Otherwise, click on the small arrow to the left of the method you would like to use below to expand that section, and then follow the installation instructions.


<details markdown="block">
<summary class="dropDown-header">Virtual Machine (Recommended)
</summary>

Installing a Virtual Machine (VM) is the easiest and most reliable way to get started creating an environment for web development. A VM is an entire computer emulation that runs inside your current Operating System (OS), like Windows. The main drawback of a VM is that it can be slow because you’re essentially running two computers at the same time. We’ll do a few things to improve its performance.

### Step 1: Download VirtualBox and Xubuntu

Installing a VM is a simple process. This guide uses Oracle's VirtualBox program to create and run the VM. This program is open-source, free, and simple. What more can you ask for? Now, let's make sure we have everything downloaded and ready for installation.

**IMPORTANT**
  
Once you have completed these instructions, **you are expected to work entirely in the VM.** Maximize the window, add more virtual monitors if you have them, fire up the Internet Browser in the **Whisker Menu** <img src="https://i.imgur.com/EjSLkCZ.png" style="width:25px" title="The Whisker Menu Icon" alt="Whisker Menu Icon"> on the top left of the desktop. You should not be using anything outside of the VM while working on The Odin Project. If you feel like you have a good understanding after using the VM for a while, and or want to improve your experience, we recommend dual-booting Ubuntu, which there are instructions for below.

#### Step 1.1: Download VirtualBox

[Click here](https://www.virtualbox.org/wiki/Downloads "VirtualBox Downloads") and download VirtualBox for Windows hosts.

#### Step 1.2: Download Xubuntu

There are thousands of distributions of Linux out there, but Ubuntu is undoubtedly one of the most popular and user friendly. When installing Linux on a VM, we recommend [downloading Xubuntu 18.04](http://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/18.04/release/xubuntu-18.04-desktop-amd64.iso "Xubuntu Download Link"). Xubuntu uses the same base software as Ubuntu but has a desktop environment that requires fewer computer resources and is therefore ideal for virtual machines.

### Step 2: Install VirtualBox and set up Xubuntu

#### Step 2.1: Install VirtualBox

Installing VirtualBox is very straightforward. It doesn’t require much technical knowledge and is the same process as installing any other program on your Windows computer. Double clicking the downloaded VirtualBox file will start the installation process. During the installation, you’ll be presented with various options. Leave them in their default state unless you are certain about their behavior. As the software installs, the progress bar might appear to be stuck; just wait for it to finish.

#### Step 2.2: Prepare VirtualBox for Xubuntu

Now that you have VirtualBox installed, launch the program. Once open, you should see the start screen.

<img style="width:initial; padding: 0em;" src="https://i.imgur.com/KKhCk0O.png" alt="The VirtualBox start screen" title="A new start">

Click on the “New” button to create a virtual operating system. Give it a name of “Xubuntu”, leave the “Machine Folder” as is, set the “Type” to “Linux” and be sure “Version” is set to “Ubuntu (64-bit)”. Continue by pressing “Next”, and choose the following options in the next steps:

<img style="border-style: solid; border-width: thin; width:initial; padding: 0em;" src="https://i.imgur.com/v5DB5VZ.png" alt="The VirtualBox Create Virtual Machine window" title="Xubuntu should make the Version be Ubuntu (64-bit) automatically">

1. Memory size: Use 2048 MB or more if possible. Ideally, this amount should be about half of your computer’s maximum memory. For example, if you have 8 GB of RAM, allocate 4096 MB (1024 MB to 1 GB) to your VM’s operating system. If you do not know how much RAM is available to you, please click [here](https://www.google.com/search?q=how+to+find+out+how+much+ram+you+have).
   
   <img style="border-style: solid; border-width: thin; width:initial; padding: 0em;" src="https://i.imgur.com/U9OUMYy.png" alt="The VirtualBox RAM window" title="Please allow me to Google that for you">

2. Hard disk: Click **“Create a virtual hard disk now”.**
   
   <img style="border-style: solid; border-width: thin; width:initial; padding: 0em;" src="https://i.imgur.com/NSUorQQ.png" alt="The VirtualBox Create Hard Disk window 1" title="This is the default selection">

3. Hard disk file type: Choose the **VDI (VirtualBox disk image)** option.
   
   <img style="border-style: solid; border-width: thin; width:initial; padding: 0em;" src="https://i.imgur.com/O6UROTf.png" alt="The VirtualBox Create Virtual Hard Disk window 2" title="This is also the default selection">
   
4. Storage on physical hard disk: **“Dynamically allocated”**.
   
   <img style="border-style: solid; border-width: thin; width:initial; padding: 0em;" src="https://i.imgur.com/LbU5cpc.png" alt="The VirtualBox Create Virtual Hard Disk window 3" title="Yet another default selection">
  
5. File location and size: We recommend **at least 20 GB** for the virtual hard disk.
   
   <img style="border-style: solid; border-width: thin; width:initial; padding: 0em;" src="https://i.imgur.com/gR21gCK.png" alt="The VirtualBox Create Virtual Hard Disk window 4" title="You could make it 21 GB if you want">

After completing the last step, click the **“Create”** button. Your new virtual OS should now appear in the menu. With **Xubuntu** selected, click on the **"Settings"** button on the navigation bar, highlighted in red below.

<img style="width:initial; padding: 0em;" src="https://i.imgur.com/cmP2CH7.png" alt="The VirtualBox Home screen with Xubuntu" title="Or you can right-click Xubuntu and go to Settings">

 Click on the **“System”** tab and then the **“Processor”** tab. Increase the Processor(s) to 2. If this screen prevents you from increasing processors, you likely need to <a href="https://www.google.com/search?q=enable+virtualization+windows" target="_blank">enable virtualization in your computer’s BIOS/UEFI settings</a>. If you have a single core processor, you will not be able to change this setting.
 
<img style="width:initial; padding: 0em;" src="https://i.imgur.com/WAW79ep.png" alt="The Xubuntu System Settings Processor window" title="Weirdly enough, some people still have single core processors">

If you have more than one monitor, you can create additional monitors by increasing the **"Monitor Count"** attribute in the **"Display"** tab. Please be sure to increase the **"Video Memory"** slider until it is in the green. **All other settings should remain default.**

<img style="width:initial; padding: 0em;" src="https://i.imgur.com/qtJdmAo.png" alt="The Xubuntu System Settings Display window" title="This feature works surprisingly well">

With all that complete, click **"OK"** to save the changes.

You cannot install Xubuntu without mounting the ISO you downloaded earlier. We will do that now. Click on the section labeled **[Optical Drive] Empty** to the right of the text labeled **IDE Secondary Master** under **Storage** at the main VirtualBox screen, while Xubuntu is selected. This will open up a dropdown menu, click **Choose/Create a disk image...**.

<img style="width:initial; padding: 0em;" src="https://i.imgur.com/GHEDUmv.png" alt="The VirtualBox Home Screen again" title="This is much easier now">

The next window that opens, click on the Blue Circle with the Green Plus labeled **Add**, and locate your Xubuntu ISO file you downloaded earlier. Choose the ISO and click open.

<img style="width:initial; padding: 0em;" src="https://i.imgur.com/1af8WwO.png" alt="The Xubuntu - Opticial Disk Selector screen" title="So much easier">

You should now see the ISO on the Disk Selector screen. Click it and hit the **Choose** button at the bottom.

<img style="width:initial; padding: 0em;" src="https://i.imgur.com/2c402Xx.png" alt="The Xubuntu - Opticial Disk Selector screen but with an ISO loaded" title="And it works">

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
  6. Copy and paste this into the terminal: `sudo apt install linux-headers-$(uname -r) build-essential dkms`. Enter your password when it asks you to. _(__note__: Your password will not be visible in the terminal. This is a security feature to protect your password. Press `Enter` when done.)_
  7. If you get the following errors: **Unable to locate package build-essential** and **Unable to locate package dkms**, paste in the following: `sudo apt-get install build-essential` and enter your password. Otherwise, move on to Step 8.
  8. Type `Y` when it asks you to and let it finish installing. Close the terminal when it is finished.
  9. Click **Devices** on the VM toolbar -> **Insert Guest additions CD image** in the menu bar.
  10. Wait for the CD image to mount, it will show the CD on the desktop as solid, not transparent, and a window will show on the top right of the VM screen saying it was successfully mounted.
  11. Double-click on the CD icon on the VM desktop.
  12. In the new window that opens, right click on the white-space or any file/folder, and click **Open Terminal Here**.
  13. In the newly opened terminal window, paste `sudo ./VBoxLinuxAdditions.run` and hit enter. You will know it is finished when it asks you to close the window.
  14. Once it finishes, close the terminal and the CD folder.
  15. Right-click CD on the VM desktop and click **Eject Volume**. It will not eject if the CD folder is open.
  16. Reboot your VM (which you can do by typing `reboot` and hitting enter in a terminal).
  17. You can now maximize the VM window, use the shared clipboard, and create additional displays, among many other useful features. These options are available on the VM toolbar under **View** and **Device**.
  
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

First, you need to boot Ubuntu from your flash drive. The exact steps may vary, but in general, you will need to do the following:

* Insert the flash drive into the computer.
* Reboot the computer.
* Select the flash drive as the bootable device instead of the hard drive.

For example, on a Dell computer, you would need to plug in the flash drive, reboot the computer, and press the F12 key while the computer is first booting up to bring up the boot menu. From there, you can select to boot from the flash drive. Your computer may not be exactly the same, but Google can help you figure it out.

#### Step 3.2: Install Ubuntu

If you would like to test out the version of Ubuntu on the flash drive, click 'Try me'. When you have found a flavor of Ubuntu you like, click 'Install' and continue to the next step.

Installing Ubuntu is where the real changes start happening on your computer. The default settings are mostly perfect, but be sure to **"Install Ubuntu alongside Windows"** and change the allocated disk space allowed for Ubuntu to 30 GB (or more if you can).

For step-by-step instructions, please follow this [installation guide](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0) from the creators of Ubuntu.

</details>
  
**A note to those who are wondering why they're being asked to install an entire new operating system**

Why is everyone who comes to The Odin Project 'forced' to switch to Linux or macOS for development? Are there *no* web developers out there who use Windows as their main operating system? 

The answer to that question is: [well, not that many](https://onezero.medium.com/microsoft-failed-developers-and-now-it-has-a-plan-to-win-them-back-ecdafde5b20). One of the reasons is that Ruby (on Rails) and Node.js, popular backend technologies taught by The Odin Project and widely used in the larger web development community, are open source projects that explicitly *expect* to run on an open-source (UNIX-based) platform. And while Apple's operating systems have all included the XNU kernel, originally based on the [FreeBSD flavor of UNIX](https://www.freebsd.org/) since the transition from System 9 to Mac OS X in 2001, Microsoft has only recently commited to embracing open source and providing more support for the way people approach web development today.   

One of the biggest features added in Windows 10 was the Windows Subsystem for Linux (WSL), which is a Linux command line within Windows. Setting up a development environment inside WSL is not beginner friendly, though, which is why The Odin Project chooses **not** to recommend and/or support this approach. All instructions you encounter here will assume you're running either MacOS or Linux. Using WSL with these instructions may cause problems we are not able to help you resolve. 

We do have great support for Linux/MacOS if you get stuck, so please give it a shot! If you feel you can contribute and support Windows at The Odin Project, please create a PR with Windows installation directions, and fixes for wherever the Windows commands might differ from Linux.


