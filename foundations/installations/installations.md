### Introduction

The first step in building any website is having the right tools. For us, that means setting up a development environment for writing good code.

Many online development courses use in-browser code editors or "sandboxes," which give you the tools and programs needed to accomplish the task at hand and nothing else. You'll use some of these sandboxes throughout the early stages of The Odin Project since they're great for getting started quickly. However, the best way to set yourself up for long-term success is to operate in a real development environment.

We won't lie to you: installing packages, editors, and even entire operating systems (OS) can be very frustrating. However, having the experience of setting up a development environment to run the code you'll write is an invaluable, real-world skill you'll carry with you for the rest of your career.

**If you are already using MacOS, Ubuntu, or [an official flavor of Ubuntu](https://ubuntu.com/desktop/flavours) as your operating system and have Google Chrome as an installed browser, you can skip this lesson. Otherwise, follow the installation instructions below to set up your development environment.**

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to set up a proper environment to follow The Odin Project curriculum.
- Installing Google Chrome in your environment.

### Supported operating systems

#### macOS

If you're using a Mac, you're in great shape. The Odin Project instructions assume a Unix-based system. By installing just a few programs, you will be up and running with your education in no time!

#### Linux (Ubuntu and official flavors)

[Linux](https://en.wikipedia.org/wiki/Linux) is a free and open-source operating system that works well with all programming languages. Most development tools are written to work natively with Linux. Your tools will likely be updated more often, have more information available for troubleshooting, and just plain run better on Linux.

In order to improve the availability of help in our community, we limit our supported Linux distros to Ubuntu and official flavours of Ubuntu only. This means we do not provide support any other distros, including ones "based on Ubuntu or Debian" (like Mint, Pop!_OS etc.).

We support the following methods of running Linux (instructions for these are in the assignment section below):

- A VirtualBox virtual machine
- Dual-booting
- Windows Subsystem for Linux version 2 (WSL2)

#### Chromebook

For Chromebook users, you may be able to run a Linux terminal on your device. More details will be provided in the ChromeOS Linux guide in the assignment section below.

### Concerned about installing a new OS?

"Woah, woah, woah! You don't support Windows? But I like my OS just fine the way it is!"

If you don't have an Apple computer, you are likely using Windows. **Windows, by itself, is not natively supported by The Odin Project, nor in our Discord server.** Because many of the tools you'll be using were written with a Unix-based environment in mind, you'll need to have one even if you plan to use Windows as your development OS in the future.

Don't worry! The options above don't mean you need to get rid of Windows, nor are we asking you to stop using Windows for anything outside of The Odin Project. Linux will gladly share the hard drive with Windows. We know you've probably learned a lot of tips and tricks for your favorite OS and don't want to lose everything you have on your computer. However, most OSes are developed with non-technical folks in mind, so they hide or make it difficult to use many of the languages and frameworks we'll need to install. Having to work around these difficulties causes many new developers to give up before they've even started their journey to full-stack nirvana.

Modifying or dual-booting a computer to work with the tools you'll need will make it much easier to start programming and help create a distraction-free environment. Windows users can use any of our supported Linux options for The Odin Project.

Still not convinced? Here are a few great reasons to install Linux:

- **Tested** - We've tested our directions with macOS, Ubuntu (and official Ubuntu flavors) and WSL2. We did the research so that you can get tools installed with as few issues as possible, getting you to coding sooner. Time spent wrestling with your operating system is time taken from learning how to code.
- **Community Support** - Using the tools we recommend makes it easier for us to help when you run into trouble.
- **Development Tools Are Built for Linux** - Ruby (on Rails) and Node.js, popular backend technologies covered by The Odin Project and widely used in the larger web development community, are open source projects that explicitly *expect* to run on an open-source (UNIX-based) platform like Linux.
- **Work Like The Pros** - Many developers use a Unix-based operating system.
- **Performance** - Are you worried about installing Linux because your machine is slow or older and has limited space? When performance is a priority, Linux is a great choice. It uses fewer system resources than Windows and occupies less hard drive space.

<div class="lesson-note lesson-note--warning" markdown="1">

#### Community support

**We can only support what is provided within the scope of our curriculum. We do not support native Windows as a development environment.** Using Windows has been discussed many times and it is not feasible to do so at this time. Please do not ask us to support Windows, and **do not bring it up in the Discord**. We are constantly evaluating our curriculum to keep content as fresh and accessible as possible, and Windows has not proven to be a path of low resistance. For more information on The Odin Project and Windows, we have a [list of reasons why Windows is not a supported OS in The Odin Project](https://github.com/TheOdinProject/blog/wiki/Why-We-Do-Not-Support-Windows).

Many learners come to our Discord channel to ask if the directions on this page need to be followed. The team, which also runs our Discord server, wrote everything you just read about the installation plan. Those supporting learners on our Discord server agree with the guidance on this page and will make the same recommendations you have read here.

</div>

With that out of the way, we need to set up an appropriate development environment!

### Choosing your setup

If you're not already using MacOS, Ubuntu, or an official Ubuntu flavor, you'll need to set up a development environment. Here's what each option offers:

#### VirtualBox virtual machine (recommended)

A [virtual machine](https://youtu.be/yIVXjl4SwVo) (VM) is an emulation of a computer that runs within your existing OS. It allows you to use another operating system inside of a program on your current operating system (e.g. running Linux inside of Windows). Virtual machines are as straightforward to install as any other program and are risk free. If you don't like Linux, you can easily remove the virtual machine. Virtual machines are a great way for new developers to get started quickly.

Because of this, we recommend this option for beginners, especially if you're not sure what option to go for after reading all this. We have very clear step-by-step instructions to help you get this set up.

#### Dual-boot

Dual-booting means installing two operating systems on your computer, giving you the option to boot either Linux or Windows when your computer starts up. The advantage of dual-booting over a VM is that the OS can use all of your computer's resources, resulting in much faster operation. There can be some risk to installing a dual-boot system because you're changing your hard drive partitions (unless you have a separate hard drive exclusively for Linux), but you'll be absolutely fine as long as you take your time and follow the instructions carefully. Don't try to mix and match instructions from other sources.

#### ChromeOS/ChromeOS Flex

This is for users who have a Chromebook or want to install ChromeOS Flex on older hardware. Many Chromebooks have built-in Linux support that works well for development.

#### WSL2 (advanced)

WSL2 is a special kind of VM that lets you run Linux directly within Windows. While powerful, it can cause confusion for new learners because you're working across two operating systems simultaneously without much visual separation, meaning it's easier to interact with the wrong OS than something more clearly separated like a VM with VirtualBox or dual-booting. This is why we mark it as advanced and do not recommend it for beginners who don't know much about OSes. A more clearly separated Linux experience (like a VirtualBox VM or dual-booting) is much more intuitive and less likely to have you interacting with the wrong things without realising.

Note that WSL2 is not the same as WSL1. We only support WSL2 for The Odin Project.

### Browser support

We only support the use of Google Chrome for The Odin Project. Our lessons use Google Chrome and it's overwhelmingly used by developers and consumers; the recommendations we make are very intentional. Look at this [usage share of web browsers](https://en.wikipedia.org/wiki/Usage_share_of_web_browsers#Summary_tables) and see what other folks are using the most.

Google Chrome includes powerful developer tools that you'll use throughout this curriculum to inspect, debug, and test your web applications. While other browsers have similar tools, our instructions and screenshots will assume you're using Chrome. Like with our OS support, we cannot provide support for problems or differences with using other browsers.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. If you're not already running a supported environment, follow one of the <span id="os-installation">installation guides</span> below:
   - [Virtual Machine (Recommended)](https://github.com/TheOdinProject/curriculum/blob/main/foundations/installations/installation_guides/linux/virtual_machine.md) - The easiest and most reliable way to get started. A VM runs inside your current OS like Windows.
   - [Ubuntu/Windows Dual-Boot](https://github.com/TheOdinProject/curriculum/blob/main/foundations/installations/installation_guides/linux/dual_boot.md) - Install Ubuntu alongside Windows on your computer.
   - [ChromeOS/ChromeOS Flex](https://github.com/TheOdinProject/curriculum/blob/main/foundations/installations/installation_guides/linux/chromeos.md) - Instructions for Chromebook users.
   - [WSL2 (Advanced)](https://github.com/TheOdinProject/curriculum/blob/main/foundations/installations/installation_guides/linux/wsl2.md) - Run Linux from within Windows. Can cause confusion for new learners due to less clear separation between operating systems.

   <div class="lesson-note lesson-note--warning" markdown="1">

   #### Unsupported hardware and software

   This curriculum only supports using a laptop, desktop or supported Chromebook. We cannot help you set up a developer environment on a RaspberryPi or any other device. You only need to follow one of these sets of instructions if you are **not** already using **MacOS**, **Ubuntu**, or [an official flavor of Ubuntu](https://ubuntu.com/desktop/flavours) as your operating system.

   If you are already using supported hardware and software, you can skip straight to step 2 below.

   </div>

1. Because our lessons use Google Chrome, and Chrome/Chromium are overwhelmingly used by developers and consumers, the recommendations we make are very intentional. Look at this [usage share of web browsers](https://en.wikipedia.org/wiki/Usage_share_of_web_browsers#Summary_tables) and see what other folks are using the most.

   <span id="google-chrome-installation">Install Google Chrome</span> for your operating system:
   - [Linux](https://github.com/TheOdinProject/curriculum/blob/main/foundations/installations/installation_guides/chrome/linux.md) - For Ubuntu, Xubuntu, and other Linux distributions.
   - [MacOS](https://github.com/TheOdinProject/curriculum/blob/main/foundations/installations/installation_guides/chrome/macos.md) - For Mac users.
   - [WSL2](https://github.com/TheOdinProject/curriculum/blob/main/foundations/installations/installation_guides/chrome/wsl2.md) - For WSL2 users on Windows.

   <div class="lesson-note lesson-note--tip" markdown="1">

   #### Chrome shortcuts

   Google Chrome is one of the most important tools that you will be using throughout the curriculum. This reference has many [common shortcuts that you may find useful when using Chrome](https://support.google.com/chrome/answer/157179?hl=en&co=GENIE.Platform%3DDesktop#zippy=%2Ctab-window-shortcuts).

   </div>

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What operating systems does The Odin Project support?](#supported-operating-systems)
- [What browser does The Odin Project support?](#browser-support)
