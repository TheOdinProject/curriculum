### Introduction

The first step for building any website is having the right tools. For us, that means setting up a development environment for writing good code.

Many online development courses use in-browser code editors or "sandboxes," which give you the tools and programs needed to accomplish the task at hand and nothing else. You'll use some of these sandboxes throughout the early stages of The Odin Project since they're great for getting started quickly. However, the best way to set yourself up for long-term success is to operate in a real development environment. 

We won't lie to you: installing packages, editors, and even entire operating systems can be very frustrating. However, having the experience of setting up a development environment to run the code you'll write is an invaluable real-world skill you'll carry with you for the rest of your career.

### The Installation Plan

In the following sections, we'll go over the steps for setting up your environment. These sections are **the most important steps** in the entire curriculum. Please take the extra time to **double check what you're typing** or you may cause more headaches for yourself down the road. 

In the next few lessons, we will walk through these installation steps together:

* installing the [operating system](https://en.wikipedia.org/wiki/Operating_system) (OS) of your choice;
* installing a code editor;
* creating an SSH key (a personal "password" that will identify you to GitHub, Heroku, and many other sites you'll be using); and
* creating and deploying a very basic Ruby on Rails application to make sure it all works. 

At the end of this section, you'll be up and running with many of the tools you need to write and run code! It may seem like a lot of steps, but we'll get through it as painlessly as possible together! If anything goes wrong, remember to use these steps:

* Parse the terminal output for the actual error.
* Google, Google, Google.
* Never be afraid to [ask for help](https://discord.gg/hvqVr6d)!

### OS Options

"Woah, woah, woah! I like my OS just fine the way it is!"

Don't worry! We're not asking you to get rid of what you're comfortable using. You've probably learned a lot of tips and tricks for your favorite OS and don't want to lose everything you have on your computer. However, most OSs are developed with non-technical folks in mind, so they hide or make it difficult to use many of the languages and frameworks we'll need to install. Having to work around these difficulties causes many new developers to give up before they've even started their journey to full-stack nirvana. 

Modifying or dual booting a computer to work with the tools you'll need will make it much easier to start programming, can help create a distraction-free environment, and will look good on your resume. Take a deep breath, and let's look at your options.

#### Mac

If you're using a Mac, you're in great shape. Most professional developers rely on Unix-based systems for their coding. By installing just a few programs, you will be up and running with your education in no time!

#### Linux

[Linux](https://en.wikipedia.org/wiki/Linux) is a free and open-source operating system that works well with all programming languages. Most development tools are written to work natively with Linux. Your tools will likely be updated more often, have more information available for troubleshooting, and just plain run better on Linux. We'll be using Ubuntu, one of the most popular and user-friendly distributions available, or the lighter weight alternative Xubuntu. **If you don't use a Mac, we recommend that you use Linux.** It's that simple.

#### Virtual Machines and Dual-Boots

A **virtual machine** is an emulation of a computer that runs within your existing OS. It allows you to use another operating system inside of a program on your current operating system (e.g. Running Linux inside of Windows). Virtual machines are as simple to install as any other program and are risk free. If you don't like Linux, you can easily remove the virtual machine. Virtual machines are a great way for new developers to get started quickly.

 - [Watch this video](https://youtu.be/yIVXjl4SwVo) on Virtual Machines to achieve an overview of how they work. 
 - If you need further clarity, [read this article](https://www.howtogeek.com/196060/beginner-geek-how-to-create-and-use-virtual-machines/) for more information on virtual machines. 

**Dual-booting** means installing two operating systems on your computer, which can give you the option to boot either Linux or Windows when your computer first starts up. The advantage of dual-booting over a virtual machine is that the OS can use all of your computer's resources, resulting in much faster operation. There is some risk to installing a dual-boot system because you're changing your hard drive partitions, but the risk is very low. You'll be okay as long as you take your time and read the instructions.

Dual-booting can be as easy as inserting a flash drive and clicking a few buttons. The benefits of dual-booting cannot be understated. You will allow Linux to access the full capabilities of your hardware, have a clean and distraction-free environment for coding, and learn the platform used by many senior developers and servers around the world.

#### Windows 10 with the Subsystem for Linux

You're probably familiar with Windows for one reason or another. For many people, it is their OS of choice. Windows is easy to use and comes pre-installed on most computers. Unfortunately, some languages, such as Ruby, were created with the assumption that they'll be used on Unix-based (Mac or Linux) systems and do not easily run on Windows.

It is possible to develop with the Windows Subsystem for Linux (WSL), but it is **highly** discouraged. If you go this route, you'll end up spending many hours on Google trying to fix the many problems you'll encounter. For your sanity, we recommend installing a virtual machine instead of using WSL.

### Online Editors

Finally, there are a variety of online code sandboxes that can be quite handy when you're away from your main system or prototyping some code before committing it. 

* [Repl.it](https://repl.it/)
* [Codepen.io](https://codepen.io/)
* [JSFiddle.net](https://jsfiddle.net/)
* [CodeSandBox](https://codesandbox.io/)

These sites can be used to complete small exercises or to sketch out a concept you don't quite understand. However, you shouldn't use these sites as your main development environment.
