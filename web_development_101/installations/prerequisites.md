### Introduction
Before we can continue, we need to set up a development environment.

If you are already using **MacOS** or **Ubuntu**, you can skip this section. Otherwise, click on the small arrow to the left of the method you would like to use below to expand that section, and then follow the installation instructions.


<details markdown="block">
<summary class="dropDown-header">Virtual Machine (Recommended)
</summary>

Installing a virtual machine (VM) is the easiest and most reliable way to get started with web development. A VM is an entire computer emulation that runs inside your current OS. The main drawback of a VM is that it can be slow because you're essentially running two computers at the same time. We'll do a few things to improve its performance.

### Step 1: Download VirtualBox and Lubuntu

Installing a Virtual Machine (VM) is the easiest and most reliable way to get started creating an environment for web development. A VM is an entire computer emulation that runs inside your current Operating System (OS), like Windows. The main drawback of a VM is that it can be slow because you’re essentially running two computers at the same time. We’ll do a few things to improve its performance.

#### Step 1.1: Download VirtualBox

[Click here](https://www.virtualbox.org/wiki/Downloads "VirtualBox Downloads") and download VirtualBox for Windows hosts.

#### Step 1.2: Download Lubuntu

There are thousands of versions of Linux out there, but Ubuntu is undoubtedly one of the most popular and user friendly. When installing Linux on a VM, we recommend downloading [Lubuntu 16.04.3 LTS](http://cdimage.ubuntu.com/lubuntu/releases/16.04/release/lubuntu-16.04.3-desktop-amd64.iso "Lubuntu download link") Lubuntu uses the same base software as Ubuntu but has a desktop environment that requires fewer computer resources and is therefore ideal for virtual machines. It also looks like Windows!

### Step 2: Install VirtualBox and set it up for Lubuntu

#### Step 2.1: Install VirtualBox

Installing VirtualBox is very straightforward. It doesn’t require much technical knowledge and is the same process as installing any other program on your Windows computer. Double clicking the downloaded file will start the installation process. During the installation, you’ll be presented with various options. Leave them in their default state unless you are certain about their behavior. As the software installs, the progress bar might appear to be stuck; just wait for it to finish.

#### Step 2.2: Make way for Lubuntu

Now that you have VirtualBox installed, launch the program. Once open, you should see the start screen.

![The VirtualBox start screen](https://cdn.discordapp.com/attachments/594699048842297355/687463646523031552/00_VirtualBox_Start_Screen.png "A new start")

Click on the “New” button to create a virtual operating system. Give it a name of “Lubuntu”, leave the “Machine Folder” as is, set the “Type” to “Linux” and be sure “Version” is set to “Ubuntu (64-bit)”. Continue by pressing “Next”, and choose the following options in the next steps:

<img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687463655696367877/01_VirtualBox_OS.png" alt="The VirtualBox Create Virtual Machine window" title="Lubuntu should make the Version be Ubuntu (64-bit) automatically">

  1. Memory size: Use 2048 MB or more if possible. Ideally, this amount should be about half of your computer’s maximum memory. For example, if you have 8 GB of RAM, allocate 4096 MB (1024 MB to 1 GB) to your VM’s operating system. If you do not know how much RAM is available to you, please click [here](https://www.google.com/search?q=how+to+find+out+how+much+ram+you+have).
  
  <img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687463663421882379/02_VirtualBox_Mem.png" alt="The VirtualBox RAM window" title="Please allow me to Google that for you">

  2. Hard disk: Click **“Create a virtual hard disk now”.**
  
  <img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687463681331691585/03_VirtualBox_HardDisk.png" alt="The VirtualBox Create Hard Disk window 1" title="This is the default selection">

  3. Hard disk file type: Choose the **VDI (VirtualBox disk image)** option.
  
  <img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687463702500475001/04_VirtualBox_HardDiskType.png" alt="The VirtualBox Create Virtual Hard Disk window 2" title="This is also the default selection">

  4. Storage on physical hard disk: **“Dynamically allocated”**.
  
  <img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687463713716174881/05_VirtualBox_DynamicHardDisk.png" alt="The VirtualBox Create Virtual Hard Disk window 3" title="Yet another default selection">
                
  5. File location and size: We recommend **at least 20 GB** for the virtual hard disk.
  
  <img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687463723534778398/06_VirtualBox_HardDiskSize.png" alt="The VirtualBox Create Virtual Hard Disk window 4" title="You could make it 21 GB if you want">

After completing the last step, click the **“Create”** button. Your new virtual OS should now appear in the menu. With **Lubuntu** selected, click on the **"Settings"** button on the navigation bar, highlighted in red below.

<img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687466148434149408/07_VirtualBox_SettingsButton.png" alt="The VirtualBox Home screen with Lubuntu" title="Or you can right-click Lubuntu and go to Settings">

 Click on the **“System”** tab and then the **“Processor”** tab. Increase the Processor(s) to 2. If this screen prevents you from increasing processors, you likely need to <a href="https://www.google.com/search?q=enable+virtualization+windows" target="_blank">enable virtualization in your computer’s BIOS/UEFI settings</a>, or you have a single core processor.
 
<img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687479763723354200/08_VirtualBox_Processor.png" alt="The Lubuntu System Settings Processor window" title="Weirdly enough, some people still have single core processors">

Next, go to the **“Storage”** tab and in the **“Storage Devices”** column, beside the “Controller: IDE” indicator, click the round, blue icon with the green plus.

<img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687480592199450744/09_VirtualBox_Storage.png" alt="The Lubuntu System Settings Storage window" title="Good-bye, CD-ROM Drive!">

This will open a window called **“Optical Disk Selector”** Click the **“Add”** button, which is another blue icon with a green plus. Please locate your Lubuntu ISO you downloaded earlier and select it. If you are not sure where to find it, start by looking in your Downloads folder. Once you have selected your ISO, hit the **“Choose”** button.

<img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687481963430412300/10_VirtualBox_OpticalDiskSelector.png" alt="The Lubuntu System Settings Optical Disk Selector window" title="Hello, Virtually Mounted ISO file!">

If you have more than one monitor, you can create additional monitors by increasing the **"Monitor Count"** attribute in the **"Display"** tab. Please be sure to increase the **"Video Memory"** slider until it is in the green. <u>**All other settings should remain default.**</u>

<img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687484394264592535/11_VirtualBox_Monitors.png" alt="The Lubuntu System Settings Display window" title="This feature works surprisingly well">

With all that complete, click **"OK"** to save the changes.

You can start the VM by double-clicking **"Lubuntu"** or by clicking the large green **"Start"** button on the navigation bar.

<img style="border-style:solid; border-width: thin;" src="https://cdn.discordapp.com/attachments/594699048842297355/687487045584683024/12_VirtualBox_StartItUp.png" alt="The VirtualBox start VM screen" title="Or you can right-click Lubuntu and hit Start">

When the VM starts up, you’ll be asked to choose your language and to either try or install Lubuntu. If you make no decision for 30 seconds, it will launch the "Try Lubuntu without installing" option. You can reset, or double-click **"Install Lubuntu 16.04.3 LTS"**

Choose your language again, hit next, and check both boxes on the **"Preparing to install Lubuntu"** page.

The default options on the Installation type page should be used **(“Erase disk and install Lubuntu”)**. It may sound dangerous, but the VM can only see the “Hard Drive” of the VM. This is the beauty of VMs: the ability to separate the physical space of your computer across many VMs. While installing, be sure to take note of the password and username you chose, we will need these later.

The rest of the installation is pretty straightforward, but if you have any questions, you can find Ubuntu’s official installation guide for Ubuntu [here](https://ubuntu.com/tutorials/tutorial-install-ubuntu-desktop#1-overview). Since Lubuntu is a flavor of Ubuntu, the installation is exactly the same across all flavors.

**Note:** If at any point you cannot see the **"Continue"** button on your screen, pressing **"Enter"** on your keyboard will bring you to the next screen. You can also drag the installer window to the left to see the button.

**Note:** If you have a Non-English-(US) keyboard, please utilize the **"Keyboard layout"** screen by clicking the **"Detect Keyboard Layout"** button and following the prompts.

### Step 3: Install and Enable Guest Additions

Your regular operating system (Windows in this case) is called the **Host**, and all other operating systems that run as VMs are called **Guests**. To make working in your Guest OS easier, you need to install Guest Additions. It adds useful functionality to the Guest OS, such as full-screen guest mode.

While your VM is running, do the following steps:

  1. Click "Devices" -> "Insert Guest additions CD image" in the menu bar
  2. Open a terminal by pushing `ctrl + alt+ t` on the keyboard, if a terminal does not open, click anywhere on the desktop of the VM and try again.
  3. The following commands will ask you to type the password you setup earlier. As you type your password, you'll notice there is no visual feedback as this is a security measure. When prompted for your password, just type it and then push Enter on your keyboard. Enter the following command into the terminal: `sudo apt-get update`. Once the command has finished, enter `sudo apt-get upgrade`. 
  4. Type the following command into the terminal: `sudo apt install gcc make perl`. You might be requested to enter in your password again. If an error is thrown, reboot the VM and try the steps in this list again.
  5. Run: `sudo /media/$USER/VBox*/VBoxLinux*.run` This might also require you to enter your password. If the terminal throws back an error, you can try again but replace $USER with your username you created in Lubuntu, but this should not be necessary.
  6. Run `reboot` in the terminal, and the VM should reboot. If this does not work, reboot the VM by clicking the "start" menu, and selecting "reboot."
  
  **NOTE**: 

* If upon trying to start the VM you only get a black screen, close and "power off" the VM, click "Settings -> Display" and make sure "Enable 3D Acceleration" is UNCHECKED, and Video memory is set to AT LEAST 128mb. 
* If you receive an error when trying to mount the Guest Additions CD image ("Unable to insert the virtual optical disk"), please reboot your host (Windows/OSX) operating system. Afterwards, ensure that there is no image file mounted in *both* Virtual Box as well as in the file system of the VM. 

### Step 4: Understand Your New VM

Here are some tips to help you get started in a virtual environment:

* All your work should happen in the VM. You will install everything you need for coding, including your text editor, Ruby, and Rails inside the VM. The Lubuntu installation inside of your VM also comes with a web browser pre-installed.

* To install software on your VM, you will follow the Ubuntu installation instructions from inside the Lubuntu VM.

* All of the development that you'll do related to TOP will be done in the VM.

* We recommend going full screen (Edit > Full-screen Mode) and forgetting about your host OS (Windows). For best performance, close all programs inside of your host OS when running your VM.

* If you added additional monitors in the "Display" tab of your VM settings, with the VM running, clicking "View" -> "Virtual Screen 2" -> "Enable". You can run fullscreen with multiple monitors, but it may ask for more "Video Memory", which you should have increased when adding more monitors. Upon exiting fullscreen, your secondary display may close. You can reopen it with these instructions.

</details>

<details markdown="block">
<summary class="dropDown-header">Ubuntu/Windows Dual-Boot
</summary>

**Read this entire section before starting**

Dual-booting provides two operating systems on your computer that you can switch between with a simple reboot. One OS will not modify the other unless you explicitly tell it to do so. Before you continue, be sure to back up any important data and to have a way to ask for help. If you get lost, scared, or stuck, we're here to help in the [Odin Tech Support chat room](https://discordapp.com/channels/505093832157691914/514204667245363200 "Please read the rules"). Come say "Hi"!

### Step 1: Download Ubuntu

First, you need to download the version of Ubuntu you want to install on your computer. Ubuntu comes in different versions ("flavors"), but we suggest the standard [Ubuntu](https://www.ubuntu.com/download/desktop). If you're using an older computer, we recommend [Lubuntu](https://lubuntu.net/). Be sure to download the 64-bit version of [Ubuntu](https://www.ubuntu.com/download/desktop/thank-you?version=18.04.1&architecture=amd64) or [Lubuntu](http://cdimage.ubuntu.com/lubuntu/releases/16.04/release/lubuntu-16.04.3-desktop-amd64.iso).

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

#### Step 3.1: Install Ubuntu

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
