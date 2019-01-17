### Introduction

Raise your hand if you're scared of the command line.  Yes, we have this image of developers staring at a black screen with white or green text flashing across while they wildly enter incomprehensible commands and hack into the corporate mainframe (no doubt spilling soda and wiping Cheetos off their keyboard as well).

That black screen (or window) is the command line interface (abbreviated as CLI), where you're able to enter commands that your computer will run for you.  And while that image of a programmer is a bit overdone, the command line really is sort of like our base of operations, from which we'll launch other programs to do our "real developing" in.  It has a syntax of its own, which is different, but not all that difficult to pick up.  You'll be entering the same commands dozens of times anyway, so you'll get pretty good at it in a short period of time.

In this introductory lesson to the command line, you will learn how to navigate around your computer and how to manipulate files and directories (also known as folders) all from the comfort of the command line. As you will soon see, this is not as difficult as you may think. The commands you will learn in this lesson are very intuitive, so don't let the prospect of using the command line for the first time intimidate you.

### Why learn this now?

You will be making heavy use of the command line throughout this curriculum, since the installations project at the end of this section will require you to install a lot of different kinds of software through the command line.  Additionally, you will be using GIT (more on this later) primarily within the command line. As for the bigger picture, you may well be using the command line on a daily basis in your career as a software developer. It will therefore be an indispensable skill in your toolset.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment

<details>
<summary>What is the command line?</summary>
<ul><ul>
  <li>The command line is one way to interact with the computer using specific words called "commands"</li>
</ul></ul>
</details>

<details>
<summary>How do you open it on your computer?</summary>
<ul><ul>
  <li>On Linux: Open the programs menu and search for "Terminal". You can also open the terminal by pressing <code>CTRL</code> + <code>ALT</code> + <code>T</code></li>
  <li>On Mac: Open your applications folder and find "Terminal"</li>
</ul></ul>
</details>

<details>
<summary>How can you navigate to a particular directory?</summary>
<ul><ul>
  <li>You can use the <code>cd</code> command to change directories</li>
</ul></ul>
</details>

<details>
<summary>Where will <code>cd</code> on its own navigate you to?</summary>
<ul><ul>
  <li>On Linux and Mac, it will navigate you home</li>
</ul></ul>
</details>

<details>
<summary>Where will <code>cd ..</code> navigate you to?</summary>
<ul><ul>
  <li>It will navigate you "up" one folder, that is, to the parent of the current directory</li>
</ul></ul>
</details>

<details>
<summary>How can you display the name of the directory you are currently in?</summary>
<ul><ul>
  <li>On Linux and Mac, by using the <code>pwd</code> command</li>
</ul></ul>
</details>

<details>
<summary>How can you display the contents of the directory you are currently in?</summary>
<ul><ul>
  <li>On Linux and Mac, by using the <code>ls</code> command. Use <code>ls -l</code> to display the files in a list</li>
</ul></ul>
</details>

<details>
<summary>How can you create a new directory?</summary>
<ul><ul>
  <li>By using the <code>mkdir</code> command</li>
</ul></ul>
</details>

<details>
<summary>How can you create a new file?</summary>
<ul><ul>
  <li>On Linux and Mac, by using the <code>touch</code> command: <code>touch new-file.txt</code></li>
</ul></ul>
</details>

<details>
<summary>How can you destroy a directory or file?</summary>
<ul><ul>
  <li>On Linux and Mac, by using the <code>rm</code> command. Use <code>rm -r</code> or <code>rmdir</code> to destroy folders</li>
</ul></ul>
</details>

<details>
<summary>How can you rename a directory or file?</summary>
<ul><ul>
  <li>On Linux and Mac, by using the <code>mv</code> command: <code>mv folder/old-file.txt folder/new-file.txt</code></li>
</ul></ul>
</details>


### Assignment
Note: Many of these assume you're using a Mac or a Linux environment. You can skip ahead to the installations section and follow the instructions to install Linux or use an online IDE like [AWS Cloud9](https://aws.amazon.com/cloud9/), which has a terminal window you can practice with.

<div class="lesson-content__panel" markdown="1">
  1. To get an initial high-level overview of the command line, check out [A Command Line Crash Course](http://www.vikingcodeschool.com/web-development-basics/a-command-line-crash-course) from the Viking Code School Prep Work.
  2. To layer on a bit more depth, read through [chapter 1 of Conquering the Command Line](http://conqueringthecommandline.com/book/basics).
  3. (Optional) If you'd still like some more practice, complete the first 2 sections of [this interactive Codecademy course](https://www.codecademy.com/learn/learn-the-command-line) to get practice navigating and manipulating directories and files.
</div>

### Exercise
In this exercise you will practice creating files and directories and deleting them.

<div class="lesson-content__panel" markdown="1">
  1. Create a new directory in your home directory with the name `test`
  2. Navigate to the `test` directory
  3. Create a new file called `test.txt` *hint: use the `touch` or `echo` command*
  4. Navigate back out of the `test` directory
  5. Delete the `test` directory
</div>

That's it, you're done with command line basics.  This stuff will become second nature to you if you will commit to doing most things from the command line from here on.  Things such as moving and copying files are done much more efficiently through the command line once you've got the command engrained, even if it feels like more of a hassle at this point.


### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [This book](https://www.learnenough.com/command-line-tutorial) is a great resource for mastering the command line.  It goes into more depth than you really need at this point, so just go through chapters 1 and 4.  Feel free to refer to the others (they're great!) whenever you like.
* If you want to deconstruct a particularly strange shell command or learn how Bash works through guess-and-check, [ExplainShell.com](http://explainshell.com/) is your solution.
