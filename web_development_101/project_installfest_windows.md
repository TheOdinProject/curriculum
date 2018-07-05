# Installing Windows Subsystem for Linux on Windows 10
## Intro
Microsoft in recent years has made a huge shift to embrace open source and support developers. One of the biggest things they did with Windows 10 was introduce the Windows Subsystem for Linux (WSL) which is a full native command line implementation of Linux within Windows. Of course there are a couple minor adjustments you need to make, but once you have it up and running, you can essentially follow the Ubuntu instructions.
## Installation
Microsoft has made it easy to get up and running using [Windows Settings and the Microsoft Store](https://winaero.com/blog/enable-wsl-windows-10-fall-creators-update/) and you can absolutely go that way, but since we're installing a command line let's use Windows' command line to do it:
### Step 1: Activate WSL
First you have to open PowerShell as an administrator. One way to do this is to start typing `powershell` into the taskbar search. After just a couple letters PowerShell should show up. Just right click on it and select "Run as Administrator" (if multiple PowerShells show up, just select the top one.)

That way is just fine, but I like the super secret squirrel way to do it: press the key combination, `cmd+x` (cmd is the button on the bottom row to the left with the windows logo on it.) This will open a nice bare-bones menu where you can select a lot of useful tools skipping all the fancy bells and whistles. From there just open `Windows PowerShell (Admin)`. Once you have PowerShell up and running, type at the command prompt:
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```
This will, as the command you just typed so conveniently pointed out, enable the optional Windows feature, Microsoft Windows Subsystem for Linux. But in order to actually make any use of it, you need to install a Linux distribution.
### Step 2: Install Ubuntu
#### Step 2.1: Download Your Distribution of Choice
You can actually use any of a number of linux distros which are all available at the windows store, including Ubuntu, which is the one we are going to focus on (in fact, you can install more than one distribution and use them in various combinations, but that is beyond the scope of this tutorial.) But since we already have PowerShell open, why not just download it from the command line:
```
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.zip -UseBasicParsing
```
#### Step 2.2: Extract the Zip File
Once we have the archive downloaded, just unzip it to the location of your choice. Once again, you can absolutely just click and unzip from windows explorer, but since we are elite haxors, and PowerShell is still open, let's keep on using it:
```
Expand-Archive ~/Ubuntu.zip C:\Ubuntu
```
#### Step 2.3: Install Your Distribution of Choice
Now we just run `Ubuntu.exe` which will be inside `C:\Ubuntu` so either click there like a pleb or type into PowerShell:
```
C:\Ubuntu\Ubuntu.exe
```
This will install Ubuntu and immediately transfer you into a bash environment right inside PowerShell. Follow the onscreen instructions to set up your username and password and you're good to go.
### Step 3: Install Sqlite
Your new install of Ubuntu doesn't come with `sqlite` pre installed and we're going to need it for Rails, so the first thing we are going to do is install it. type at your new BASH command prompt:
```
sudo apt-get update
```
Then install that bugger:
```
sudo apt-get install sqlite3 libsqlite3-dev
```
There ya go. We are just about ready to join the rest of the class to configure git (pay attention to the side notes), and install Ruby and Rails (just do what everybody else does, you are a first class Linux citizen now!)
### Step 4 (optional): Make it Easier to Find
If you want to, you can pin a link to ubuntu.exe to your start menu or your desktop. You can also run it from inside PowerShell (you no longer need to be running as an Admin) or the old school Command Prompt by typing `wsl`. If you run wsl inside PowerShell or Command Prompt, you can exit it by typing `exit` with no arguments. This returns you back to the normal windows file system.
### Step 5: Set up Symbolic Link
Okay this is really important: **If you try to edit files inside of the Linux file system from windows apps they will disappear and potentially mess stuff up**. But this is easily avoided, and it even makes things better because you will be able to edit your files with your favorite windows editors and use your bash commands on them too!

When ubuntu was set up, it mapped your windows file system to `/mnt` so that your `C` drive will be `/mnt/c` from inside wsl. so anything saved inside `/mnt/c` will be fair game. If you want to use your fancy windows editors, you will have to put your project files inside that directory, and if you want them to be easy to find from windows you will likely want them inside your user directories. I'm going to show you how to set up a symbolic link to make things really easy on you.
#### Step 5.1: Create Directory for your Projects
You can chose to put your project files anywhere you want, but I'm going to assume you are cool like me and put a projects folder in your documents folder.
From inside ubuntu type:
```
mkdir /mnt/c/Users/<your windows user name>/Documents/Projects
```
This will create the folder. Obviously you could have used windows explore to click your way there too, but why not use our fancy new toy?
#### Step 5.2: Create the Symbolic Link
Next, we're going to establish the link. Essentially it's like an alias such that when you are inside bash, you will be able to type something like: `ls ~/Projects` which is a directory inside your home directory inside bash, but Unbuntu will see this: `ls /mnt/c/Users/<your windows user name>/Documents/Projects` Which is a folder inside your Windows file system.

So, at your bash command prompt type:
```
ln -s /mnt/c/Users/<your windows user name>/<folder you want to store your projects in> ~/Projects`
```
now you can easily access and safely edit your projects folder from inside wsl just by using the `~/Projects` directory instead of `/mnt/c/Users/<your windows user name>/Documents/Projects`.
## One last time
You **can** edit files inside your Linux file system, but you **must** use a command line editor from inside Linux, not some editor on the Windows side or you **will** break something. The only exception is anything inside the `/mnt/<windows drive letter>` directory. This is directly analogous to `<windows drive letter>:\` and is fair game from both the Linux system and the Windows system.
## Additional Links for Further Study
* You can find more info about managing and configuring WSL [here](https://docs.microsoft.com/en-us/windows/wsl/wsl-config).
* [This](https://docs.microsoft.com/en-us/powershell/scripting/getting-started/getting-started-with-windows-powershell?view=powershell-6) is an introduction to PowerShell if you want to make more use of it.
* If you want to learn all about the `ln` command we used to make the symbolic link, the [man page](https://ss64.com/bash/ln.html) has all the info you need.
