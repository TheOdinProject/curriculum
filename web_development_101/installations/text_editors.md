### Introduction
A text editor is by far the most used developer tool regardless of what type of developer you are. A good text editor can help you write better code with real-time code checking, syntax highlighting, and automatic formatting.

### Why can't I use Microsoft Word?

Rich text editors, such as Microsoft Word and Libre-Office Writer, are great for writing a paper, but the features that make them good at creating nicely formatted documents make them unsuitable for writing code. A document created with these rich text editors have more than just text embedded in their files. These files also contain information on how to display the text on the screen and data on how to display graphics embedded into the document. In contrast, plain text editors, such as VSCode and Sublime, don't save any additional information. Saving only the text allows other programs, like Ruby's interpreter, to read and execute the file as code.

### Code Editors

You can think of code editors as specialized web development tools. They are highly customizable and offer many features that will make your life easier. There is nothing worse than spending 2 hours trying to figure out why your program isn't working only to realize that you missed a closing bracket. Plugins, syntax highlighting, auto-closing of brackets and braces, and linting are just a few of the benefits of using a code editor. There are many text editors out there to choose from, but we suggest starting with VSCode.

**VSCode** is an excellent free code editor. It has outstanding add-on support and great Git integration. VSCode is the most popular code editor among Odin's students and moderators, so support is easy to find in the community. You can download the .deb file and install it from [here](https://code.visualstudio.com/).

Which editor you use is generally a matter of preference, but for the purposes of this course, we are going to assume you're using VSCode, mainly because it's free, it's easy to use, and it works pretty much the same on every operating system. If you want to use something else, do it. However, using something other than VSCode may make it more difficult to get help in the chat room.

As a reminder, if you're using a **virtual machine**, you should install your text editor of choice **on your VM**. You're welcome to also install it on your host (i.e., your Windows main OS), but you'll want to be sure that you have this critical tool inside your VM.

### Opening VSCode from the Command Line

On Windows and Linux, you can open VSCode from the command line by typing `code`, and you can open folders or files by adding the name of the location after it: `code my_first_rails_app/`.

#### MacOS Users:

MacOS can do this too, but you need to set it up. After installing VSCode, launch it any way you're comfortable with. Once it's running, open the Command palette with `CMD + Shift + P`. In the little dialog that appears, type `shell command`. One of the choices that appears will be `Shell Command: Install 'code' command in PATH`. Select that option, and restart the terminal if you have it open.

##### Regarding Security Warning:

A message may show, warning the user that VSCode is not trusted software. This is an expected message. VSCode can be trusted, therefore it is safe to ignore this warning.

#### WSL Users:

Although you just installed Ubuntu on your computer, you should still install the Windows version of the code editor you choose. You will edit the files in your Projects directory with the code editor, and WSL will be able to read these files. If you are using VSCode, be sure to install the *"Remote - WSL"* extension when prompted. This extension will allow you to directly access your Linux files. Once installed, select the green icon in the lower left corner to connect to WSL.

### Additional Set Up: Live Server Extension for VSCode

An extension is a program that is meant to enhance your experience by modifying the capabilities of a software. 

Just like the Google Chrome Web Browser, VSCode supports extensions and one useful one is [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer). It has been made to save the time of developers like yourself. This extension will save you from the hassle of refreshing the browser window repeatedly to see changes made in your code and will automatically load the most recent change in the browser window.

Refer to [this video](https://youtu.be/mGORIVStWWc) for installation details.
