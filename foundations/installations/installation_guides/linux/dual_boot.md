### Guide: Dual-boot Ubuntu and Windows

Dual-booting provides two operating systems on your computer that you can switch between with a simple reboot. One OS will not modify the other unless you explicitly tell it to do so. Before you continue, be sure to back up any important data and to have a way to ask for help. If you get lost, scared, or stuck, we're here to help in the [Odin Tech Support chat room](https://discordapp.com/channels/505093832157691914/514204667245363200). Come say "Hi"!

### Step 1: Download Ubuntu

First, you need to download the version of Ubuntu you want to install on your computer. Ubuntu comes in different versions ("flavors"), but we suggest the standard desktop [Ubuntu](https://releases.ubuntu.com/24.04/). If you're using an older computer, we recommend [Xubuntu](https://xubuntu.org/release/24.04/). Be sure to download the 64-bit version of Ubuntu or Xubuntu. If you reach the download page and are unsure about what version to choose, it is recommended that you pick the Long-Term Support (LTS) version 24.04 (Noble Numbat). You may be tempted to choose a more recent release if one exists, but this version is tried and tested by the Odin Project community and therefore the most reliable option for the purposes of this curriculum.

### Step 2: Create a bootable flash drive

Next, follow the guide on [how to create an Ubuntu Live USB in Windows](https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/) to create a bootable flash drive so that you can install Ubuntu on your hard drive. If you don't have a flash drive, you can also use a CD or DVD.

Note: You can use this method to try out [different flavors of Ubuntu](https://www.ubuntu.com/download/flavours) if you'd like. These images allow you to try out different flavors without committing to an installation. Be aware that running the OS from a flash drive will cause the OS to be slow and can decrease the life of your flash drive.

### Step 3: Install Ubuntu

#### Step 3.1: Boot from the flash drive

First, you need to boot Ubuntu from your flash drive. The exact steps may vary, but in general, you will need to do the following:

1. Insert the flash drive into the computer.
1. Reboot the computer.
1. Select the flash drive as the bootable device instead of the hard drive.

For example, on a Dell computer, you would need to plug in the flash drive, reboot the computer, and press the F12 key while the computer is first booting up to bring up the boot menu. From there, you can select to boot from the flash drive. Your computer may not be exactly the same, but Google can help you figure it out.

#### Step 3.2: Install Ubuntu

If you would like to test out the version of Ubuntu on the flash drive, click 'Try me'. When you have found a flavor of Ubuntu you like, click 'Install' and continue to the next step.

Installing Ubuntu is where the real changes start happening on your computer. The default settings are mostly perfect, but be sure to **"Install Ubuntu alongside Windows"** and change the allocated disk space allowed for Ubuntu to 30 GB (or more if you can).

For step-by-step instructions, please follow [how to install Ubuntu and dual boot alongside Windows](https://medium.com/linuxforeveryone/how-to-install-ubuntu-20-04-and-dual-boot-alongside-windows-10-323a85271a73). These instructions are are 22.04 and for Windows 10, but they will get you through the process until we get dedicated dual booting instructions in place.

### Intel RST (Rapid Storage Technology)

If you encounter an error requesting you to disable **Intel RST** while attempting to install Ubuntu, follow this [workaround to install Ubuntu with Intel RST systems](https://askubuntu.com/questions/1233623/workaround-to-install-ubuntu-20-04-with-intel-rst-systems/1233644#1233644), specifically **Choice #2**. The process forces Windows to boot into safemode after you switch your motherboard storage driver to work with Ubuntu. Once it boots into Windows, the forced-on safemode is disabled and you are free to attempt an installation of Ubuntu once again.

[Return to Installations lesson](https://www.theodinproject.com/lessons/foundations-installations#os-installation)
