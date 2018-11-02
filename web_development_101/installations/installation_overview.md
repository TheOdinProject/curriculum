### Introduction

The first step to building any website is having the right tools. For us, that means setting up an environment to write good code.

Many development courses use online code editors or "sandboxes" which give you the tools and programs you need at that moment to accomplish the task at hand, but nothing else. While you will use some of these sandboxes throughout the early stages of The Odin Project (They're great for getting started quickly), the best way to set yourself up for success is to operate in a real development environment. 

We won't lie to you: installing packages, editors, and even entire operating systems can be frustrating at times. However, having the experience of setting up a development environment to run the code you'll write is an invaluable real-world skill you'll carry with you the rest of your career.

### What are we doing?

In the following sections we'll be going over the necessary steps for your environment. These steps are **the most important steps** in the entire curriculum.  Please take the extra time to __double check what you're typing__, or you may cause more headache for yourself. 

In the next few lessons we will be:

* Installing the [OS](https://en.wikipedia.org/wiki/Operating_system) of your choice,
* Installing Ruby, Rails, and Git.
* Installing a code editor,
* Creating an SSH key (a personal "password" that will identify you to GitHub, Heroku, and many other sites you'll be using),
* And finally, creating and deploying a very basic Ruby on Rails application to make sure it all works. You will also be able to show this off to your friends and family!

It may seem like a lot of steps, but we'll get through it as painlessly as possible together! And, if anything goes wrong, always remember to follow these steps:

* Parse the error message for the actual error.
* Google, Google, Google.
* Never be afraid to ask for help!

### OS Options

#### Woah, woah, woah. I like my OS just fine the way it is

That's just fine! We're not asking you to get rid of what you're comfortable with using regularly. You've probably learned a lot of tips and tricks for your favorite OS and don't want to lose everything you have on your computer. But most OS' are developed with non-technical folks in mind and hide or make it difficult for a lot of the languages and frameworks we'll be using to be installed. Having to work around these difficulties is what causes a lot of new developers to give up before they've even started their journey to Full Stack Nirvana. 

Modifying or dual booting a computer to work with the tools you'll need will make it much easier to start as a beginner, can help create a distraction free environment, and will look good on your resume. Take a deep breath and just look at your options.

#### Mac

If you're using a Mac you're in great shape.  Most professional developers rely on Macs to code on. By just installing a few programs you will be up and running with your education in no time!

#### Linux

Linux is a free operating system that works well with all programming languages. Most development tools are written to work natively with Linux. Your tools will likely be updated more often, have more information available for troubleshooting, and just plain run better with Linux. We'll be using Ubuntu, one of the most popular and user-friendly versions available. __If you don't use a Mac we recommend you use Linux__. It's that simple.

#### Windows Virtual Machines and Dual Boots

Virtual Machines are computers that run within your OS. They're as simple to install as any other program and are risk-free. If you don't like linux you can easily remove the Virtual Machine. They are a great way for new developers to get their toes' wet without spending too much time getting set up.

Dual boots give you the option to boot into Linux or Windows when your computer first starts up.  The advantage to these over VMs is that the OS can use all of your computer's resources resulting in a much faster OS. There is some risk to installing a dual boot system because you're changing around your hard drive partitions, but the risk very low. Take your time and read the instructions and you'll be okay.

Dual-booting can be as easy as inserting a USB and clicking a few buttons. The benefits of dual-booting cannot be understated: You'll be allowing Linux to access the full capabilities of your hardware, have a clean and distraction free environment to do your work in, and be learning the platform used by many senior developers and servers around the world.

#### Windows 10 with Linux Subsystem

You're probably familiar with Windows for one reason or another. For many people it is their OS of choice. It is easy to use and comes pre-installed on most computers. Unfortunately, some languages (Ruby) have been created with the assumption that you will be developing them on a Unix-based (Mac or Linux) system and have not been easily made to run on Windows.

It is possible to develop with WSL but it is __highly__ discouraged. You will end up with a lot of problems you'll spend hours on google trying to fix.  For your sanity, we recommend installing a Virtual Machine instead of using WSL.

#### Online editors

Lastly, there are a variety of online code sandboxes that can be quite handy when you're away from your main system or prototyping some code before committing it. Sites such as

* [Repl.it](https://repl.it/)
* [Codepen.io](https://codepen.io/)
* [JSFiddle.net](https://jsfiddle.net/)
* [codeanywhere.com](https://codeanywhere.com/)

can be used to complete small exercises or jot out a concept you might not understand. However, you shouldn't use these sites as your main development environment.
