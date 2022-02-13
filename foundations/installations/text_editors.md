### Introduction
A text editor is by far the most used developer tool regardless of what type of developer you are. A good text editor can help you write better code with real-time code checking, syntax highlighting, and automatic formatting.

### Why can't I use Microsoft Word?

Rich text editors, such as Microsoft Word and Libre-Office Writer, are great for writing a paper, but the features that make them good at creating nicely formatted documents make them unsuitable for writing code. A document created with these rich text editors has more than just text embedded in the file. These files also contain information on how to display the text on the screen and data on how to display graphics embedded into the document. In contrast, plain text editors, such as VSCode and Sublime, don't save any additional information. Saving only the text allows other programs, like Ruby's interpreter, to read and execute the file as code.

### Code Editors

You can think of code editors as specialized web development tools. They are highly customizable and offer many features that will make your life easier. There is nothing worse than spending 2 hours trying to figure out why your program isn't working only to realize that you missed a closing bracket. Plugins, syntax highlighting, auto-closing of brackets and braces, and linting are just a few of the benefits of using a code editor. There are many text editors out there to choose from, but we suggest starting with Visual Studio Code.

**Visual Studio Code**, or just VSCode as it's commonly referred to, is an excellent free code editor. It has outstanding add-on support and great Git integration. VSCode is the most popular code editor among Odin's students and moderators, so support is easy to find in the community.

Which editor you use is generally a matter of preference, but for the purposes of this course, we are going to assume you're using VSCode, mainly because it's free, it's easy to use, and it works pretty much the same on every operating system. Keep in mind that means you will not able to get help if you are using a different text editor than VSCode for the curriculum.

As a reminder, if you're using a **virtual machine**, you should install your text editor of choice **on your VM**. You're welcome to also install it on your host (i.e., your Windows main OS), but you'll want to be sure that you have this critical tool inside your VM.

### VSCode Installation

Choose your Operating System:

<details markdown="block">
<summary class="dropDown-header">Linux</summary>

#### Step 1: Download VSCode

   - Open your **Terminal**
   - Run the following command to download the latest **VSCode** `.deb` package

~~~bash
curl -L -o code-latest.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
~~~

#### Step 2: Install VSCode

   - Enter the following command in your terminal to install the **VSCode** `.deb` package

~~~bash
sudo apt install ./code-latest.deb
~~~

   - If prompted, enter your password

#### Step 3: Delete the installer file

~~~bash
rm code-latest.deb
~~~

#### Step 4: Using VSCode
You can start VSCode in two ways,

   - Click **Visual Studio Code** from the Applications menu
   - **Or**, use the `code` command from the terminal

~~~bash
code
~~~

#### Alternative Installation
More advanced users might want to install VSCode using the built-in `apt` package manager. This allows VSCode to be kept up to date automatically. Instructions on how to set this up can be found on [this webpage](https://code.visualstudio.com/docs/setup/linux).

</details>

<details markdown="block">
<summary class="dropDown-header">MacOS</summary>

#### Step 1: Download VSCode

   - Click [this link](https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal) to automatically download the latest VSCode installer .zip file.

#### Step 2: Install VSCode

   - Open the **Downloads** folder
   - Double click the file **VSCode-darwin-universal.zip** 
   - Drag the **Visual Studio Code.app** icon to the **Applications** folder icon

#### Step 3: Delete the installer file

   - Open **Finder**
   - Go to the **Downloads** folder
   - Drag **VSCode-darwin-universal.zip** to the trash

#### Step 4: Using VSCode

   - Go to your **Applications** folder
   - Double click **Visual Studio Code**

</details>

### Assignment
<div class="lesson-content__panel" markdown="1">

  1. Familiarizing yourself with VSCode will allow you to save time and become more productive. Learn the basics of using this text editor by watching [these introductory videos](https://code.visualstudio.com/docs/introvideos/basics). Watch only the first video as the second involves installing Node.js which will not be needed at this stage.
</div>
