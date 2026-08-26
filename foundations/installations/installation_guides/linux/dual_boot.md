### Guide: Dual-boot Ubuntu and Windows

Dual-booting provides two operating systems on your computer that you can switch between with a simple reboot. One OS will not modify the other unless you explicitly tell it to do so. There are many Ubuntu flavors out there and while our curriculum supports official flavors of Ubuntu, this guide will focus on installing the official Ubuntu Desktop running on GNOME. If you would like to install a different flavor, instructions this guide will still work. Just pay close attention to the installer's instructions on your flavor.

Before you continue, be sure to back up any important data and to have a way to ask for help. If you get lost, scared, or stuck, we're here to help in the [Odin Tech Support chat room](https://discordapp.com/channels/505093832157691914/514204667245363200). Come say "Hi"!

### Step 0: BitLocker

If you have Windows Pro (or any of the editions listed on [the official Microsoft BitLocker Overview](https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/#windows-edition-and-licensing-requirements)) then you may have [BitLocker](https://support.microsoft.com/en-us/windows/bitlocker-drive-encryption-76b92ac9-1040-48d6-9f5f-d14b3c5fa178) enabled on your main drive. BitLocker is Microsoft's drive encryption software. If the drive you want to install Ubuntu on has BitLocker enabled then you will not be able to at first.

There are a few ways to resolve this dilemma but we're going to go with the most simple one: temporarily disabling BitLocker.

[Ubuntu's official guide for turning off BitLocker in Windows](https://ubuntu.com/desktop/docs/en/latest/how-to/turn-off-bitlocker-in-windows/#turn-off-bitlocker-in-windows) will provide you with instructions on how to disable BitLocker on both Windows 11 and prior Windows releases.

If you're going to install Ubuntu on a separate drive/partition that does not have BitLocker enabled then you should have no issues dual booting and will not need to disable BitLocker.

### Step 1: Download Ubuntu

First, you need to download the version of Ubuntu you want to install on your computer. Ubuntu comes in different versions ("flavors"), but we suggest the standard desktop [Ubuntu](https://releases.ubuntu.com/24.04/). Be sure to download the 64-bit version of Ubuntu. If you reach the download page and are unsure about what version to choose, it is recommended that you pick the Long-Term Support (LTS) version 24.04 (Noble Numbat). You may be tempted to choose a more recent release if one exists, but this version is tried and tested by the Odin Project community and therefore the most reliable option for the purposes of this curriculum.

### Step 2: Create a bootable flash drive

Next, follow [step 3 from the official Install Ubuntu Desktop guide](https://ubuntu.com/tutorials/install-ubuntu-desktop#3-create-a-bootable-usb-stick) to create a bootable flash drive so that you can install Ubuntu on your hard drive. You will need a USB stick with at least 12GB or above available. Be sure to back up any data that you have on this USB stick because this step involves erasing all data available on this stick.

### Step 3: Install Ubuntu

#### Step 3.1: Boot from the flash drive

First, you need to boot Ubuntu from your flash drive. The exact steps may vary, but in general, you will need to do the following:

1. Insert the flash drive into the computer.
1. Reboot the computer.
1. Select the flash drive as the bootable device instead of the hard drive.

For example, on a Dell computer, you would need to plug in the flash drive, reboot the computer, and press the F12 key while the computer is first booting up to bring up the boot menu. From there, you can select to boot from the flash drive. Your computer may not be exactly the same, but Google can help you figure it out.

#### Step 3.2: Install Ubuntu

Once you're in, you'll be greeted by Ubuntu's installer to select your language, accessibility settings, keyboard layout and wifi connection.

If you would like to test out Ubuntu on the flash drive, click on **Try Ubuntu**. Once you're ready to install, double click on the **Install Ubuntu 24.04 LTS** icon on your home page

Installing Ubuntu is where the real changes start happening on your computer. The default settings are mostly perfect, but be sure to **Install Ubuntu alongside Windows** and change the allocated disk space allowed for Ubuntu to 30 GB (or more if you can).

For step-by-step instructions, please follow [step 6 from the official Install Ubuntu Desktop guide](https://ubuntu.com/tutorials/install-ubuntu-desktop#6-type-of-installation).

### Intel RST (Rapid Storage Technology)

If you encounter an error requesting you to disable **Intel RST** while attempting to install Ubuntu, follow this [workaround to install Ubuntu with Intel RST systems](https://askubuntu.com/questions/1233623/workaround-to-install-ubuntu-20-04-with-intel-rst-systems/1233644#1233644), specifically **Choice #2**. The process forces Windows to boot into safemode after you switch your motherboard storage driver to work with Ubuntu. Once it boots into Windows, the forced-on safemode is disabled and you are free to attempt an installation of Ubuntu once again.

[Return to Installations lesson](https://www.theodinproject.com/lessons/foundations-installations#os-installation)
