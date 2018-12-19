### Introduction
A text editor is by far the most used tool of a developer. This holds true no matter what kind of developer you are. A good text editor can also help you write better code as well by helping out with real-time code checking, syntax highlighting, and automatic formatting.

### Why can't I use Microsoft Word?

Rich text editors like Microsoft Word, or Libre-Office Writer, are great for writing a paper, but for the same reason they are good at creating nicely formatted documents they are not suited for writing code. A document created with these kinds of editors have more than just text embedded in their files. That's what makes them pretty. They have information on how to display the text on the screen and data on how to display graphics embedded into the document. A plain text editor, like VSCode or Sublime, doesn't save this extra information. Only saving the text allows other programs, like Ruby's interpreter, to read and execute the file as code.

### What should I use then?

You can think of code editors as specialized web development tools. They are highly customizable and have many more features that make your life much easier. There is nothing worse than spending 2 hours trying to figure out why your program isn't working only to realize you missed a closing bracket. Plugins, syntax highlighting, auto-closing of braces, and linting are just a few of the benefits of using a code editor. There are many text editors out there, but to get started we suggest one of the following:

#### VSCode

VSCode is great and it's free. It has outstanding addon support and great git integration. This editor is the most popular among Odin's students and moderators and support is easy to find in the community. You can download and install it from [here](https://code.visualstudio.com/).

#### Sublime Text

Sublime is extremely light-weight and flexible, however it is not free. You can use it for a while, and decide for yourself if it is worth the purchase or not. This editor is favored by many. Check it out and install from [here](https://www.sublimetext.com/).

What editor you use is a matter of preference BUT for the purposes of this course we are going to assume you are using VSCode. Mainly because it is free, easy to use, and works pretty much the same on every operating system.


### A few Notes

#### MacOS

On Windows and Linux, you can open VSCode from the command line by typing `code` and you can open folders or files by adding the name of the location after it: `code my_first_rails_app/`. MacOS can do it too, but you gotta set it up yourself:

After installing VSCode launch it whichever way you are comfortable with. Once it's running open the Command palette by typing `CMD + Shift + P`. In the little dialog that appears type `shell command`. One of the choices that appears will be `Shell Command: Install 'code' command in PATH`. I bet you know where this is going. Select that option and restart the terminal if you have it open.

#### Windows

Although you have just installed Ubuntu on your computer, you will want to install the Windows version of the code editor you choose. You will edit the files in your Projects directory with the code editor and WSL will be able to read these files
