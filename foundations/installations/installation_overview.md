<!-- TODO: Reconsider structure of installations + overview lesson (missing assignment section for this overview lesson) -->
<!-- markdownlint-disable TOP004 -->
### Introduction

The first step in building any website is having the right tools. For us, that means setting up a development environment for writing good code.

Many online development courses use in-browser code editors or "sandboxes," which give you the tools and programs needed to accomplish the task at hand and nothing else. You'll use some of these sandboxes throughout the early stages of The Odin Project since they're great for getting started quickly. However, the best way to set yourself up for long-term success is to operate in a real development environment.

We won't lie to you: installing packages, editors, and even entire operating systems can be very frustrating. However, having the experience of setting up a development environment to run the code you'll write is an invaluable, real-world skill you'll carry with you for the rest of your career.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What operating systems (OS) are supported by The Odin Project.

### OS options

<div class="lesson-note" markdown="1">

Specifics about distros/versions and OS installation instructions are all in the next lesson. You do not need to go and install anything just yet.

</div>

#### macOS

If you're using a Mac, you're in great shape. The Odin Project instructions assume a Unix-based system. By installing just a few programs, you will be up and running with your education in no time!

#### Linux (Official Ubuntu flavors)

[Linux](https://en.wikipedia.org/wiki/Linux) is a free and open-source operating system that works well with all programming languages. Most development tools are written to work natively with Linux. Your tools will likely be updated more often, have more information available for troubleshooting, and just plain run better on Linux. We'll be using Ubuntu, one of the most popular and user-friendly distributions available, or the lighter weight alternative Xubuntu. **If you don't use a Mac, we recommend that you use Linux.** It's that simple.

#### Windows

Windows, by itself, **is not natively supported** by The Odin Project, or on our Discord server. Because many of the tools you'll be using were written with a Linux environment in mind, you'll need to have one even if you plan to use Windows as your development OS. If you are currently using Windows, you can use one of the following options to create your development environment (we provide full step-by-step instructions for these options in the next lesson):

- A VirtualBox Virtual Machine
- Dual-boot Ubuntu installation
- Windows Subsystem for Linux (WSL2)

A [virtual machine](https://youtu.be/yIVXjl4SwVo) is an emulation of a computer that runs within your existing OS. It allows you to use another operating system inside of a program on your current operating system (e.g. Running Linux inside of Windows). Virtual machines are as straightforward to install as any other program and are risk free. If you don't like Linux, you can easily remove the virtual machine. Virtual machines are a great way for new developers to get started quickly.

**Dual-booting** means installing two operating systems on your computer, giving you the option to boot either Linux or Windows when your computer starts up. The advantage of dual-booting over a virtual machine is that the OS can use all of your computer's resources, resulting in much faster operation. There is some risk to installing a dual-boot system because you're changing your hard drive partitions, but you'll be okay as long as you take your time and read the instructions.

Dual-booting can be as easy as inserting a flash drive and clicking a few buttons. The benefits of dual-booting cannot be overstated. You will allow Linux to access the full capabilities of your hardware, have a clean and distraction-free environment for coding, and learn the platform used by many senior developers and servers around the world.

**Windows Subsystem for Linux** lets you run a full-fledged Linux environment from within an existing Windows installation, giving you all of the advantages of Linux through a simplified installation process. We'll be using version 2 of WSL, commonly known as WSL2, within the curriculum.

#### Chromebook

For Chromebook users, you may be able to run a Linux terminal on your device. More details will be provided in the next lesson.

### Concerned about installing a new OS?

"Woah, woah, woah! I like my OS just fine the way it is!"

If you don't have an Apple computer, you are likely using Windows. Don't worry! The options above don't mean you need to get rid of Windows. Linux will gladly share the hard drive with Windows. We know you've probably learned a lot of tips and tricks for your favorite OS and don't want to lose everything you have on your computer. However, most OSs are developed with non-technical folks in mind, so they hide or make it difficult to use many of the languages and frameworks we'll need to install. Having to work around these difficulties causes many new developers to give up before they've even started their journey to full-stack nirvana.

Modifying or dual-booting a computer to work with the tools you'll need will make it much easier to start programming, help create a distraction-free environment, and look good on your resume. Take a deep breath, and let's look at your options.

Still not convinced? Here are a few great reasons to install Linux:

- **Tested** - We've tested our directions with macOS, Ubuntu (and official Ubuntu flavors) and WSL2. We did the research so that you can get tools installed with as few issues as possible, getting you to coding sooner. Time spent wrestling with your operating system is time taken from learning how to code.
- **Community Support** - Using the tools we recommend makes it easier for us to help when you run into trouble.
- **Development Tools Are Built for Linux** - Ruby (on Rails) and Node.js, popular backend technologies covered by The Odin Project and widely used in the larger web development community, are open source projects that explicitly *expect* to run on an open-source (UNIX-based) platform like Linux.
- **Work Like The Pros** - Many developers use a Unix-based operating system.
- **Performance** - Are you worried about installing Linux because your machine is slow or older and has limited space? When performance is a priority, Linux is a great choice. It uses fewer system resources than Windows and occupies less hard drive space.

Many learners come to our Discord channel to ask if the directions on this page need to be followed. The moderators of our Discord server wrote everything you just read about the installation plan. Those supporting learners on our Discord server agree with the guidance on this page and will make the same recommendations you have read here.

Before we can continue, we must first stress one detail of importance:

**We can only support what is provided within the scope of our curriculum. We do not support native Windows as a development environment.** Using Windows has been discussed many times and it is not feasible to do so at this time. Please do not ask us to support Windows, and **do not bring it up in the Discord**. We are constantly evaluating our curriculum to keep content as fresh and accessible as possible, and Windows has not proven to be a path of low resistance. For more information on The Odin Project and Windows, we have a [list of reasons why Windows is not a supported OS in The Odin Project](https://github.com/TheOdinProject/blog/wiki/Why-We-Do-Not-Support-Windows).

With that out of the way, we need to set up an appropriate development environment!

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Read the OSSPH blog on [why developers should use linux for development](https://blog.ossph.org/reasons-why-developers-should-use-linux).
