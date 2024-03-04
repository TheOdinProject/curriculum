<!-- markdownlint-disable MD024 MD043 -->

### Introduction

A text editor is by far the most used developer tool regardless of what type of developer you are. A good text editor can help you write better code with real-time code checking, syntax highlighting, and automatic formatting.

### Why can't I use Microsoft Word?

Rich text editors, such as Microsoft Word and Libre-Office Writer, are great for writing a paper, but the features that make them good at creating nicely formatted documents make them unsuitable for writing code. A document created with these rich text editors has more than just text embedded in the file. These files also contain information on how to display the text on the screen and data on how to display graphics embedded into the document. In contrast, plain text editors, such as VSCode and Sublime, don't save any additional information. Saving only the text allows other programs, like Ruby's interpreter, to read and execute the file as code.

### Code editors

You can think of code editors as specialized web development tools. They are highly customizable and offer many features that will make your life easier. There is nothing worse than spending 2 hours trying to figure out why your program isn't working only to realize that you missed a closing bracket. Plugins, syntax highlighting, auto-closing of brackets and braces, and linting are just a few of the benefits of using a code editor. There are many text editors out there to choose from, but we suggest starting with Visual Studio Code.

**Visual Studio Code**, or just VSCode as it's commonly referred to, is an excellent free code editor. It has outstanding add-on support and great Git integration. VSCode is the most popular code editor among Odin's students and moderators, so support is easy to find in the community.

Which editor you use is generally a matter of preference, but for the purposes of this course, we are going to assume you're using VSCode, mainly because it's free, it's easy to use, and it works pretty much the same on every operating system. Keep in mind that this means you will not be able to get help if you are using a different text editor other than VSCode for the curriculum.

As a reminder, if you're using a **virtual machine**, you should install VSCode **on your VM**. You're welcome to also install it on your host (i.e., your Windows main OS), but you'll want to be sure that you have this critical tool inside your VM.

### VSCode installation

Choose your Operating System:

<details markdown="block">
<summary class="dropDown-header">Linux</summary>

#### Step 1: Download VSCode

- Open your **Terminal**.
- Run the following command to download the latest **VSCode** `.deb` package:

```bash
wget -O code-latest.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
```

#### Step 2: Install VSCode

- Enter the following command in your terminal to install the **VSCode** `.deb` package:

```bash
sudo apt install ./code-latest.deb
```

- If prompted, enter your password.

<div class="lesson-note lesson-note--tip" markdown="1">

You might see a notice starting with `N: Download is performed unsandboxed (...)`. You don't need to worry about it. [Read this reddit post for more information.](https://www.reddit.com/r/linux4noobs/comments/ux6cwx/comment/i9x2twx/)

</div>

#### Step 3: Delete the installer file

```bash
rm code-latest.deb
```

#### Step 4: Using VSCode

You can start VSCode in two ways,

- Click **Visual Studio Code** from the Applications menu.
- **Or**, use the `code` command from the terminal.

```bash
code
```

</details>

<details markdown="block">
<summary class="dropDown-header">MacOS</summary>

#### Step 1: Download VSCode

- Click [this link](https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal) to automatically download the latest VSCode installer .zip file.

#### Step 2: Install VSCode

- Open the **Downloads** folder.
- Double click the file **VSCode-darwin-universal.zip**.
- Drag the **Visual Studio Code.app** icon to the **Applications** folder icon.

#### Step 3: Delete the installer file

- Open **Finder**.
- Go to the **Downloads** folder.
- Drag **VSCode-darwin-universal.zip** to the trash.

#### Step 4: Using VSCode

- Go to your **Applications** folder.
- Double click **Visual Studio Code**.

</details>

<details markdown="block">
<summary class="dropDown-header">WSL2</summary>

#### Step 1: Install VSCode

- Follow the instructions for [Visual Studio Code on Windows](https://code.visualstudio.com/docs/setup/windows) to install VSCode.

#### Step 2: Delete the installer file

- Open **File Explorer**.
- Go to the **Downloads** folder.
- Drag **VSCodeUserSetup-{version}.exe** to the trash.

#### Step 3: Install WSL Extension

- Open Visual Studio Code.
- Navigate to the extensions tab.
- Find and install the [WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl).

#### Step 4: Ensure that WSL2 can correctly open VSCode

- Open a new WSL2 terminal.
- Run the following command to open a new VSCode window.

  ```bash
  code
  ```

- After a few moments a new VSCode window should open, and VSCode should provide a notification that its opening in WSL2.

</details>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Familiarizing yourself with VSCode will allow you to save time and become more productive. By watching this [VSCode Tutorial for Beginners](https://youtu.be/ORrELERGIHs?t=103) video, you'll get an idea of all the features VSCode has to offer. Don't worry about actually coding along, just watch for the way that VSCode is used throughout the video.

</div>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- [VSCode docs](https://code.visualstudio.com/docs) are a great place to refer to for any of your queries related to VSCode.
- These handy little PDFs on VSCode's [shortcuts for linux](https://go.microsoft.com/fwlink/?linkid=832144) and [shortcuts for macOS](https://go.microsoft.com/fwlink/?linkid=832143) are a great resource to help make your VSCode experience smoother and more efficient.
