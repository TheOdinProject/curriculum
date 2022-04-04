### Introduction

If you are already using **MacOS**, **Ubuntu**, or [an official flavor of Ubuntu](https://wiki.ubuntu.com/UbuntuFlavors) as your operating system and have **Google Chrome** as an installed browser, you can skip this section. Otherwise, click on the small arrow to the left of the method you would like to use below to expand that section, and then follow the installation instructions.

**Please Note**: We can only support the operating systems indicated above. Our instructions have been tested with MacOS, Ubuntu, and official flavors of Ubuntu. We do not recommend installing an OS that is only based on Ubuntu (like Mint, Pop!_OS, ElementaryOS, etc).

### OS Installation

**IMPORTANT**

This curriculum only supports using a laptop, desktop or supported Chromebook. We cannot help you set up a developer environment on a RaspberryPi or any other device.

<details markdown="block">
<summary class="dropDown-header">Virtual Machine (Recommended)
</summary>

Installing a Virtual Machine (VM) is the easiest and most reliable way to get started creating an environment for web development. A VM is an entire computer emulation that runs inside your current Operating System (OS), like Windows. The main drawback of a VM is that it can be slow because you’re essentially running two computers at the same time. We’ll do a few things to improve its performance.

### Step 1: Download VirtualBox and Xubuntu

Installing a VM is a simple process. This guide uses Oracle's VirtualBox program to create and run the VM. This program is open-source, free, and simple. What more can you ask for? Now, let's make sure we have everything downloaded and ready for installation.

**IMPORTANT**

Once you have completed these instructions, **you are expected to work entirely in the VM.** Maximize the window, add more virtual monitors if you have them, fire up the Internet Browser in the **Whisker Menu** <img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/whisker_menu_icon.png" style="width:25px" title="The Whisker Menu Icon" alt="Whisker Menu Icon"> on the top left of the desktop. You should not be using anything outside of the VM while working on The Odin Project. If you feel like you have a good understanding after using the VM for a while, and or want to improve your experience, we recommend dual-booting Ubuntu, which there are instructions for below.

#### NOTICE FOR WINDOWS 11 USERS:

Windows 11 released in October 2021. VirtualBox (the program that runs your Virtual Machine) does not currently support Windows 11 as a host operating
system. This means that VirtualBox may not properly install or run on Windows 11, or that you could face serious bugs that hinder performance or cause
crashes. It is recommended that you remain on Windows 10 until VirtualBox is supported or consider installing Linux using Dual-Boot with the assistance
of the second guide on this lesson page.

You can see the currently supported operating systems for VirtualBox hosting [in this section of their documentation.](https://www.virtualbox.org/manual/UserManual.html#hostossupport)

#### Step 1.1: Download VirtualBox

[Click here](https://www.virtualbox.org/wiki/Downloads "VirtualBox Downloads") and download VirtualBox for Windows hosts.

#### Step 1.2: Download Xubuntu

There are thousands of distributions of Linux out there, but Ubuntu is undoubtedly one of the most popular and user friendly. When installing Linux on a VM, we recommend [downloading Xubuntu 20.04](https://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/20.04/release/xubuntu-20.04.4-desktop-amd64.iso). Xubuntu uses the same base software as Ubuntu but has a desktop environment that requires fewer computer resources and is therefore ideal for virtual machines.

### Step 2: Install VirtualBox and set up Xubuntu

#### Step 2.1: Install VirtualBox

Installing VirtualBox is very straightforward. It doesn’t require much technical knowledge and is the same process as installing any other program on your Windows computer. Double clicking the downloaded VirtualBox file will start the installation process. During the installation, you’ll be presented with various options. Leave them in their default state unless you are certain about their behavior. As the software installs, the progress bar might appear to be stuck; just wait for it to finish.

#### Step 2.2: Prepare VirtualBox for Xubuntu

Now that you have VirtualBox installed, launch the program. Once open, you should see the start screen.

<img style="padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/00.png" alt="The VirtualBox start screen" title="A new start">

Click on the “New” button to create a virtual operating system. Give it a name of “Xubuntu”, leave the “Machine Folder” as is, set the “Type” to “Linux” and be sure “Version” is set to “Ubuntu (64-bit)”. If the 64-bit option is not present, you'll likely need to [enable virtualization in your computer’s BIOS/UEFI settings](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-troubleshooting-enabling_intel_vt_x_and_amd_v_virtualization_hardware_extensions_in_bios). Continue by pressing “Next”, and choose the following options in the next steps:

<img style="border-style: solid; border-width: thin; padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/01.png" alt="The VirtualBox Create Virtual Machine window" title="Xubuntu should make the Version be Ubuntu (64-bit) automatically">

1. Memory size: Use 2048 MB or more if possible. Ideally, you want this amount to be somewhere between 2048 (the recommended amount by Xubuntu) and half of your computer’s maximum memory. For example, if you have 8 GB (8192 MB respectively) of RAM, you could allocate up to 4096 MB (1024 MB to 1 GB) to your VM’s operating system. If you do not know how much RAM is available to you, please click [here](https://www.google.com/search?q=how+to+find+out+how+much+ram+you+have). If the VM runs a bit slow, try allocating more memory!<br/>**Note:** Difficulty converting your **G**iga**B**ytes into **M**ega**B**ytes? 1 GB of RAM is equal to 1024 MB. Therefore, you can say that **8 GB = 8 x 1024 = 8192 MB.**

   <img style="border-style: solid; border-width: thin; padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/02.png" alt="The VirtualBox RAM window" title="Please allow me to Google that for you">

2. Hard disk: Click **“Create a virtual hard disk now”.**

   <img style="border-style: solid; border-width: thin; padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/03.png" alt="The VirtualBox Create Hard Disk window 1" title="This is the default selection">

3. Hard disk file type: Choose the **VDI (VirtualBox disk image)** option.

   <img style="border-style: solid; border-width: thin; padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/04.png" alt="The VirtualBox Create Virtual Hard Disk window 2" title="This is also the default selection">

4. Storage on physical hard disk: **“Dynamically allocated”**.

   <img style="border-style: solid; border-width: thin; padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/05.png" alt="The VirtualBox Create Virtual Hard Disk window 3" title="Yet another default selection">

5. File location and size: We recommend **at least 20 GB** for the virtual hard disk.

   <img style="border-style: solid; border-width: thin; padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/07.png" alt="The VirtualBox Create Virtual Hard Disk window 4" title="You could make it 21 GB if you want">

After completing the last step, click the **“Create”** button. Your new virtual OS should now appear in the menu. With **Xubuntu** selected, click on the **"Settings"** button on the navigation bar, highlighted in red below.

<img style="padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/08.png" alt="The VirtualBox Home screen with Xubuntu" title="Or you can right-click Xubuntu and go to Settings">

 Click on the **“System”** tab and then the **“Processor”** tab. Increase the Processor(s) to 2. If this screen prevents you from increasing processors, you likely need to [enable virtualization in your computer’s BIOS/UEFI settings](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-troubleshooting-enabling_intel_vt_x_and_amd_v_virtualization_hardware_extensions_in_bios). If you have a single core processor, you will not be able to change this setting.
 
<img style="padding: 0em width: auto;" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/09.png" alt="The Xubuntu System Settings Processor window" title="Weirdly enough, some people still have single core processors">

If you have more than one monitor, you can create additional monitors by increasing the **"Monitor Count"** attribute in the **"Display"** tab. Please be sure to increase the **"Video Memory"** slider until it is in the green. **All other settings should remain default.**

<img style="padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/10.png" alt="The Xubuntu System Settings Display window" title="This feature works surprisingly well">

With all that complete, click **"OK"** to save the changes.

You cannot install Xubuntu without mounting the ISO you downloaded earlier. We will do that now. Click on the section labeled **[Optical Drive] Empty** to the right of the text labeled **IDE Secondary Master** under **Storage** at the main VirtualBox screen, while Xubuntu is selected. This will open up a dropdown menu, click **Choose/Create a disk image...**.

<img style="padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/12.png" alt="The VirtualBox Home Screen again" title="This is much easier now">

The next window that opens, click on the Blue Circle with the Green Plus labeled **Add**, and locate your Xubuntu ISO file you downloaded earlier. Choose the ISO and click open.

<img style="padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/13.png" alt="The Xubuntu - Optical Disk Selector screen" title="So much easier">

You should now see the ISO on the Disk Selector screen. Click it and hit the **Choose** button at the bottom.

<img style="padding: 0em; width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/14.png" alt="The Xubuntu - Optical Disk Selector screen but with an ISO loaded" title="And it works">

You can now start the VM by right clicking on the icon in the menu and by clicking the large "Start" arrow at the top.

When the VM starts up, you'll be asked to install Xubuntu. All of the default options can be left alone, including the Installation type ("Erase disk and install Ubuntu"). It may sound dangerous, but the VM can only see the "Hard Drive" of the VM. This is the beauty of VMs: the ability to separate the physical space of your computer across many VMs. While installing, be sure to take note of the password and username you chose, we will need these later.

The rest of the installation is pretty straightforward, but if you have any questions, you can find Ubuntu's official installation guide for Ubuntu [here](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0).

When the installation is finished and asks you to **"Please remove the installation medium, then press ENTER"**, simply press ENTER. No need to remove anything.

### Step 3: Install and Enable Guest Additions

Your regular operating system (Windows in this case) is called the **Host**, and all other operating systems that run as VMs are called **Guests**. To make working in your Guest OS easier, you need to install Guest Additions. It adds useful functionality to the Guest OS, such as full-screen guest mode.

While your VM is running, do the following steps:

  1. Click the **Whisker Menu** <img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/whisker_menu_icon.png" style="width:25px" title="The Whisker Menu Icon" alt="Whisker Menu Icon"> on the top left of the desktop.
  2. Type `Software Updater` in the text field that opens up and click on the item with the same name.
  3. Install all available updates. If there are no available updates, move on to Step 5.
  4. If the **Software Updater** is stuck waiting for an **unattended upgrade** to finish, reboot the VM and start again from Step 1.
  5. Open a terminal with `ctrl + alt + t` or opening the **Whisker Menu** and typing in **Terminal** (the shortcut is obviously faster).
  6. Copy and paste this into the terminal: `sudo apt install linux-headers-$(uname -r) build-essential dkms`. _(__note__: You cannot copy and paste between your guest OS and host OS (Windows), so when copying these commands you need to open this page in your VM through your `Web Browser` by pressing `Windows + w` (the Windows key should be between the left ctrl and alt keys) or opening the **Whisker Menu** and typing in **Web Browser**.)_
  7. Enter your password when it asks you to. **(__note__: Your password will not be visible in the terminal. You will not see any feedback when you type. This is a security feature to protect your password. Press `Enter` when done.)**
  8. If you get the following errors: **Unable to locate package build-essential** and **Unable to locate package dkms**, paste in the following: `sudo apt install build-essential` and enter your password. Otherwise, move on to Step 9.
  9. Type `Y` when it asks you to and let it finish installing. Close the terminal when it is finished.
  10. Click **Devices** on the VM toolbar -> **Insert Guest additions CD image** in the menu bar.
  11. Wait for the CD image to mount, it will show the CD on the desktop as solid, not transparent, and a window will show on the top right of the VM screen saying it was successfully mounted.
  12. Let's take a look at the contents of the CD image we just mounted. If you see a File Manager window appear, then confirm the presence of a file named `VBoxLinuxAdditions.run`. If that file is present, you can move on to step 13. If you do _not_ see a File Manager window appear, then navigate to the desktop by minimizing all opened windows, and then double-click on the CD icon on the VM desktop. Now you can confirm that the file `VBoxLinuxAdditions.run` is present. If you see that file, move on to step 13.
  13. In the window we opened in step 12, click File > **Open Terminal Here** - this should open a terminal with the prompt ending in something like `VBox_GAs_x.x.x` where the x's are the version number.
  14. In the newly opened terminal window, paste `sudo ./VBoxLinuxAdditions.run` and hit enter.
  15. Once it finishes, close the terminal and the CD folder.
  16. Right-click CD on the VM desktop and click **Eject Volume**. It will not eject if the CD folder is open.
  17. Reboot your VM (which you can do by typing `reboot` and hitting enter in a terminal).
  18. You can now maximize the VM window, create additional displays, and use many other useful features. These options are available on the VM toolbar under **View** and **Device**.

  **NOTE**:

* If upon trying to start the VM you only get a black screen, close and "power off" the VM, click "Settings -> Display" and make sure "Enable 3D Acceleration" is UNCHECKED, and Video memory is set to AT LEAST 128mb.
* If you receive an error when trying to mount the Guest Additions CD image ("Unable to insert the virtual optical disk"):
   
   Suggestion 1: Reboot your host (Windows/OSX) operating system. Afterward, ensure that there is no image file mounted in *both* Virtual Box as well as in the file system of the VM.
   
   Suggestion 2: In VirtualBox Manager, while the VM is not running, select Xubuntu then click Settings. In the Storage tab, under Controller: IDE, click on VBoxGuestAdditions.iso and make sure "Live CD/DVD" is ticked. Enabling this option causes the image to not be removed upon ejection, therefore it should be removed as the final step. To do so, once you have completed the Guest Additions installation and shut down your VM, you can find the image where you enabled "Live CD/DVD": under Controller: IDE, by selecting the blue circle dropdown on the right side of the window and clicking "Remove Disk from Virtual Drive". It is also suggested to uncheck "Live CD/DVD" at this point.
* If you encounter the error "VirtualBox-Error: Failed to open a session for the virtual machine..." you might have to turn on 'virtualization' in your host's BIOS settings. If you are using Windows as your host OS you can follow these [instructions](https://2nwiki.2n.cz/pages/viewpage.action?pageId=75202968), otherwise just google how to turn it on for your specific OS.
* Are you using a touchscreen? [Click here](https://www.youtube.com/watch?v=hW-iyHHoDy4) to watch a video on how to enable touchscreen controls for VirtualBox.

### Step 4: Understand Your New VM

Here are some tips to help you get started in a virtual environment:

* All your work should happen in the VM. You will install everything you need for coding, including your text editor, Ruby, and Rails inside the VM. The Xubuntu installation inside of your VM also comes with a web browser pre-installed.

* To install software on your VM, you will follow the Ubuntu installation instructions from inside the Xubuntu VM.

* To take a screenshot (which you might need when asking for help on our Discord), you can either press the Host Key (Right Ctrl) + E or click "View -> Take Screenshot" for a full screenshot, or you can click the "Whisker Menu" and type in "Screenshot", in which you can choose to take a screenshot of your entire screen, the current window you are on or to select a certain area to capture.

* All of the development that you'll do related to TOP will be done in the VM.

* We recommend going full screen (View > Full-screen Mode) and forgetting about your host OS (Windows). For best performance, close all programs inside of your host OS when running your VM.

* If you added additional monitors in the "Display" tab of your VM settings, with the VM running, clicking "View" -> "Virtual Screen 2" -> "Enable". You can run fullscreen with multiple monitors, but it may ask for more "Video Memory", which you should have increased when adding more monitors. Upon exiting fullscreen, your secondary display may close. You can reopen it with these instructions.

### Step 5: Safely shutting down your VM

You don't pull the plug on your everyday use computer, right? Why would you do the same to your virtual computer? When you click the X button and just close out your VM, you might as well say goodbye to your files. In this section, you'll understand three ways you can shut off your VM.

#### Option 1 - Shutting down from inside the VM with UI

Clicking on the **Whisker Menu** <img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/5d27ddb08c8cf3c553537deb6156a5c7f7aa1bac/foundations/installations/prerequisites/imgs/whisker_menu_icon.png" style="width:25px" title="The Whisker Menu Icon" alt="Whisker Menu Icon"> and clicking the power icon will give you several options on how to modify your session, including Shutting Down.

<img style="width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/9ec5047b3ffdbd4ef4ecc609fb4f52f9b188830f/foundations/installations/prerequisites/imgs/VM_01.png" title="Power Icon" alt="Power Icon">
<br/>
<img style="width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/9ec5047b3ffdbd4ef4ecc609fb4f52f9b188830f/foundations/installations/prerequisites/imgs/VM_02.png" title="User Session Popup" alt="User Session Popup">

#### Option 2 - Shutting down from inside the VM with the Terminal

Simply enough, typing `poweroff` will do in this case. Your system will immediately shutdown.

#### Option 3 - Shutting down from outside the VM

The last way to accomplish this goal of safely shutting down is by using the VM interface. Clicking on the File tab and hitting the close button (which also has a Power Icon) will bring up a popup titled "Close Virtual Machine". This popup asks if you want to "Save the machine state", "Send the shutdown signal", or "Power off the machine".

<img style="width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/9ec5047b3ffdbd4ef4ecc609fb4f52f9b188830f/foundations/installations/prerequisites/imgs/VM_03.png" title="VM File Menu" alt="VM File Menu">
<br/>
<img style="width: auto" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/9ec5047b3ffdbd4ef4ecc609fb4f52f9b188830f/foundations/installations/prerequisites/imgs/VM_04.png" title="Close Virtual Machine Menu" alt="Close Virtual Machine Menu">

To be safe, click the "Send the shutdown signal" radio and hit OK. This will safely power down your VM and your files will not get corrupted.

</details>

<details markdown="block">
<summary class="dropDown-header">Ubuntu/Windows Dual-Boot
</summary>

**Read this entire section before starting**

Dual-booting provides two operating systems on your computer that you can switch between with a simple reboot. One OS will not modify the other unless you explicitly tell it to do so. Before you continue, be sure to back up any important data and to have a way to ask for help. If you get lost, scared, or stuck, we're here to help in the [Odin Tech Support chat room](https://discordapp.com/channels/505093832157691914/514204667245363200). Come say "Hi"!

### Step 1: Download Ubuntu

First, you need to download the version of Ubuntu you want to install on your computer. Ubuntu comes in different versions ("flavors"), but we suggest the standard desktop [Ubuntu](https://releases.ubuntu.com/20.04/). If you're using an older computer, we recommend [Xubuntu](https://xubuntu.org/release/20-04/). Be sure to download the 64-bit version of [Ubuntu](https://releases.ubuntu.com/20.04/) or [Xubuntu](https://xubuntu.org/release/20-04/).

### Step 2: Create a Bootable Flash Drive

Next, follow [this guide](https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/) to create a bootable flash drive so that you can install Ubuntu on your hard drive. If you don't have a flash drive, you can also use a CD or DVD.

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
   
### Intel RST (Rapid Storage Technology)

If you encounter an error requesting you to disable **Intel RST** while attempting to install Ubuntu, follow [these instructions from Stack Exchange](https://askubuntu.com/questions/1233623/workaround-to-install-ubuntu-20-04-with-intel-rst-systems/1233644#1233644), specifically **Choice #2**. The process forces Windows to boot into safemode after you switch your motherboard storage driver to work with Ubuntu. Once it boots into Windows, the forced-on safemode is disabled and you are free to attempt an installation of Ubuntu once again.

</details>

<details markdown="block">
<summary class="dropDown-header">Chrome OS/CloudReady
</summary>

With the recent addition of Linux (Beta), the Chrome OS platform has been opened up to the ability to install native Linux applications. If you wish to use your Chromebook to complete The Odin Project, you will need to ensure you meet a couple requirements:

1. You have a [supported Chromebook](https://www.chromium.org/chromium-os/chrome-os-systems-supporting-linux)
2. You can install [Linux (Beta)](https://support.google.com/chromebook/answer/9145439?hl=en)

Once you have successfully met both of these requirements, you should be able to follow along with the Linux instructions throughout the entire curriculum.

**Note for CloudReady users**

Currently there is a bug preventing CloudReady v83.4 from successfully installing Linux (Beta). This was resolved in version 85.2.

</details>

### Google Chrome Installation

#### Why Google Chrome?

Because our lessons use Google Chrome, and Chrome/Chromium are overwhelmingly used by developers and consumers, the recommendations we make are very intentional.
Look at this [usage share of web browsers](https://en.wikipedia.org/wiki/Usage_share_of_web_browsers#Summary_tables) and see what other folks are using the most.

Choose your Operating System:

<details markdown="block">
<summary class="dropDown-header">Linux</summary>

#### Step 1: Download Google Chrome

   - Open your **Terminal**
   - Run the following command to download latest **Google Chrome** `.deb` package

~~~bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
~~~

#### Step 2: Install Google Chrome

   - Enter the following command in your terminal to install **Google Chrome** `.deb` package

~~~bash
sudo apt install ./google-chrome-stable_current_amd64.deb
~~~

   - Enter your password, if needed

#### Step 3: Delete the installer file

~~~bash
rm google-chrome-stable_current_amd64.deb
~~~

#### Step 4: Using Google Chrome
You can start chrome in two ways,

   - Click **Google Chrome** from the Applications menu
   - **Or**, use the `google-chrome` command from the terminal *(Don't worry about the messages printed in the terminal)*

~~~bash
google-chrome
~~~

</details>

<details markdown="block">
<summary class="dropDown-header">MacOS</summary>

#### Step 1: Download Google Chrome

   - [Visit](https://www.google.com/chrome/) Google Chrome download page
   - Click **Download Chrome for Mac**

#### Step 2: Install Google Chrome

   - Open the **Downloads** folder
   - Double click the file **googlechrome.dmg** 
   - Drag the Google Chrome icon to the **Applications** folder icon

#### Step 3: Delete the installer file

   - Open **Finder**
   - Click the **arrow** next to Google Chrome in the sidebar
   - Go to the **Downloads** folder
   - Drag **googlechrome.dmg** to the trash

#### Step 4: Using Google Chrome

   - Go to your **Applications** folder
   - Double click **Google Chrome**

</details>
