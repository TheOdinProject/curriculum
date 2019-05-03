### Introduction

Feeling scared of the command line? You're not alone. We have this image of developers staring intently at a black screen with white or green text flashing across as they wildly enter incomprehensible commands to hack into the corporate mainframe (no doubt while guzzling soda and wiping neon orange Cheetos dust off their keyboard).

That black screen or window is the command line interface (CLI), where you're able to enter commands that your computer will run for you. While there's no need for you to reenact the scene above, working with the command line is a critical skill for you to learn as a developer. The command line is like our base of operations, from which we can launch other programs and interact with them. It has a syntax of its own to learn, but since you'll be entering the same commands dozens of times, you'll quickly pick up the commands you need most.

In this introductory lesson to the command line, you'll learn how to navigate around your computer and how to manipulate files and directories (also known as folders) directly from the comfort of the command line. You'll soon see that this isn't as difficult as you may think. The commands you will learn in this lesson are very straightforward, so don't be intimidated by the prospect of using the command line for the first time.

## Why learn this now?

You will be making heavy use of the command line throughout this curriculum, and the upcoming installations project will require you to install many different software programs using the command line. Additionally, you will primarily be using Git within the command line (more on this later). As part of the bigger picture, you may well be using the command line on a daily basis in your career as a software developer, making it an indispensable skill in your toolset.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

- Describe what the command line is.
- Open the command line on your computer.
- Use the command line to navigate directories and display directory contents.
- Use the command line to create a new directory and a new file.
- Use the command line to rename or destroy a directory and a file.

### Assignment
Note: Many of these resources assume you're using a Mac or Linux environment. You can either skip ahead to the installations section and follow the instructions to install Linux or use an online IDE like [AWS Cloud9](https://aws.amazon.com/cloud9/), which provides a terminal window that you can use to practice.

<div class="lesson-content__panel" markdown="1">
  1. Read through [chapter 1 of Conquering the Command Line](http://conqueringthecommandline.com/book/basics).
  2. (Optional) If you'd like some more practice, complete the first 2 sections of [this interactive Codecademy course](https://www.codecademy.com/learn/learn-the-command-line) to get practice navigating and manipulating directories and files.
</div>

#### Use the Command Line Like a Pro
There's something important that you need to know about programmers. Programmers are lazy. Like, really lazy. If they are forced to do something over and over again, odds are good that they'll figure out a way to automate it instead. The good news is that you get benefit from the many shortcuts they've created along the way. It's time to learn how to use the command line like a pro (which is to say, in a really lazy way). 

First, you might have already noticed that copying and pasting inside the command line doesn't work the way that you'd expect. When you're inside the command line, you'll need to use `Ctrl+Shift+C` to copy and `Ctrl+Shift+V` to paste. For example, to copy and paste commands from your browser into the command line, you'll highlight the command text and use `Ctrl+C` as usual and then paste it in your terminal using `Ctrl+Shift+V`. Test it out!

Second, you need to learn about [tab completion](https://en.wikipedia.org/wiki/Command-line_completion). Seriously, this tip will save you so much time and frustration. Let's say that you're in the command line and that you need to move into a folder that's far away, something like `~/Documents/Odin-Project/Web-Development-101/javascript/calculator/`. That's a long command to type out, and everything needs to be exactly right in order for it to work. Nope, we're *way* too lazy for that! Basically, by hitting `Tab`, the command line will automatically complete commands that you've started typing once there's only one option. For example, it's pretty common to have a `Documents` folder and a `Downloads` folder in the home directory. If you've typed `cd D` and then press `Tab`, the command line will let you know that it's not sure which one you want by showing you the different options that match what you've typed so far:
```bash
$ cd D
Documents/ Downloads/
$ cd D
```
But once you've typed in a little bit more, it will complete the name for you, making it possible to write out the full file path above by typing as little as `cd Doc[tab]O[tab]W[tab]j[tab]cal[tab]` (depending on what other folders exist on your computer). Test it out, and get comfortable with how this works. You're gonna love it.

Third, there's a really handy shortcut for opening everything within a project directory: `.` Once you've installed a text editor, you can use this shortcut to open up an entire project and all of its files in one go. For example, if you have VS Code installed, you can `cd` into the project directory and then type `code .` (with the period) to open up all of the project files. This shortcut is also commonly used with Git (which is covered in detail later on) with commands like `git add .` to add all of the files inside of a directory into Git's staging area.

### Exercise
In this exercise, you will practice creating files and directories and deleting them.

<div class="lesson-content__panel" markdown="1">
  1. Create a new directory in your home directory with the name `test`.
  2. Navigate to the `test` directory.
  3. Create a new file called `test.txt`. *Hint: use the `touch` or `echo` command.*
  4. Navigate back out of the `test` directory.
  5. Delete the `test` directory.
</div>

That's it--you're done with command line basics! If you commit to doing most things from the command line from here on out, these commands will become second nature to you. Moving and copying files is much more efficiently done through the command line, even if it feels like more of a hassle at this point.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental material for if you want to dive deeper into something.

* The free online book [Learn Enough Command Line to Be Dangerous](https://www.learnenough.com/command-line-tutorial) is a great resource for mastering the command line. It goes into more depth than you really need at this point, so just focus on chapters 1 and 4. Feel free to refer to the rest of the book (it's great!) whenever you like.
* [ExplainShell.com](http://explainshell.com/) is a great resource for if you want to deconstruct a particularly strange shell command or learn how Bash works through guess-and-check.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, clicking the small arrow to the left of the question will reveal the answers.

<details>
<summary>What is the command line?</summary>
<ul><ul>
  <li>The command line is a way to interact with the computer using specific words called "commands".</li>
</ul></ul>
</details>

<details>
<summary>How do you open the command line on your computer?</summary>
<ul><ul>
  <li>On Linux: Open the programs menu and search for "Terminal". You can also open the terminal by pressing <code>CTRL</code> + <code>ALT</code> + <code>T</code>.</li>
  <li>On Mac: Open your applications folder and find "Terminal".</li>
</ul></ul>
</details>

<details>
<summary>How can you navigate to a particular directory?</summary>
<ul><ul>
  <li>You can use the <code>cd</code> command to change directories.</li>
</ul></ul>
</details>

<details>
<summary>Where will <code>cd</code> on its own navigate you to?</summary>
<ul><ul>
  <li>On Linux and Mac, it will navigate you home.</li>
</ul></ul>
</details>

<details>
<summary>Where will <code>cd ..</code> navigate you to?</summary>
<ul><ul>
  <li>It will navigate you "up" one folder, that is, into the parent of the current directory.</li>
</ul></ul>
</details>

<details>
<summary>How do you display the name of the directory you are currently in?</summary>
<ul><ul>
  <li>On Linux and Mac, use the <code>pwd</code> (print working directory) command.</li>
</ul></ul>
</details>

<details>
<summary>How do you display the contents of the directory you are currently in?</summary>
<ul><ul>
  <li>On Linux and Mac, use the <code>ls</code> command. Use <code>ls -l</code> to display the files in a list.</li>
</ul></ul>
</details>

<details>
<summary>How do you create a new directory?</summary>
<ul><ul>
  <li>You can do this using the <code>mkdir</code> command.</li>
</ul></ul>
</details>

<details>
<summary>How do you create a new file?</summary>
<ul><ul>
  <li>On Linux and Mac, use the <code>touch</code> command, e.g., <code>touch new-file.txt</code>.</li>
</ul></ul>
</details>

<details>
<summary>How do you destroy a directory or file?</summary>
<ul><ul>
  <li>On Linux and Mac, use the <code>rm</code> command. To destroy folders, use <code>rm -r</code> or <code>rmdir</code>.</li>
</ul></ul>
</details>

<details>
<summary>How do you rename a directory or file?</summary>
<ul><ul>
  <li>On Linux and Mac, use the <code>mv</code> command, e.g., <code>mv folder/old-file.txt folder/new-file.txt</code>.</li>
</ul></ul>
</details>
