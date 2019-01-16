### Introduction

In this lesson, we'll cover common Git commands used to manage your projects and to upload your work onto GitHub. We refer to these commands as the **basic Git workflow**. When you're using Git, these are the commands that you'll use 70-80% of the time, so if you can get these down, you'll be more than halfway done mastering Git!


### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe how to copy an existing repository from Github onto your local machine.
 - Explain the two-stage system that Git uses to save files.
 - Describe how to upload your work to GitHub using Git.
 - Describe how to check the status of your files and how to view your commit history.

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Complete the first interactive lesson in the Codecademy [Basic Git Workflow](https://www.codecademy.com/learn/learn-git) course. Try to look for a pattern in the commands you are running.
  2. Watch [this video](https://www.youtube.com/watch?v=HVsySz-h9r4) by Corey Schafer for a great overview of some basic Git commands.

</div>

### Cheatsheet
This is a reference list of the most commonly used Git commands. (You might consider bookmarking this handy page.) Try to familiarize yourself with the commands so that you can eventually remember them all:

* Commands related to a remote repository:
  * `git clone git@github.com:USER-NAME/REPOSITORY-NAME.git` 
  or 
  `git clone https://github.com/user-name/repository-name.git`
  * `git push origin master`
* Commands related to workflow:
  * `git add .`
  * `git commit -m "A message describing what you have done to make this snapshot different"`
* Commands related to checking status or log history
  * `git status`
  * `git log`

The basic Git syntax is `program | action | destination`.

For example,

* `git add .` is read as `git | add | .`, where the period represents everything in the current directory;
* `git commit -m "message"` is read as `git | commit -m | "message"`; and
* `git status` is read as `git | status | (no destination)`.

### Conclusion
You may not feel completely comfortable with Git at this point, which is normal. It's a skill that you will get more comfortable with as you use it. Therefore, we have a project coming right after this lesson where we'll walk you through the entire Git workflow, which is the exact same process you would use in a real project.

The main thing to take away from this lesson is the **basic workflow**. The commands you've learned here are the ones you will be using the most often with Git.

Don't worry if you don't know all the commands yet or if they aren't quite sticking in your memory yet. They will soon be seared into your brain as you use them over and over in future Odin projects.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Learn Enough Git to Be Dangerous](https://www.learnenough.com/git-tutorial) is an introductory guide on Git by [Michael Hartl](http://www.michaelhartl.com/).
* An easy-to-read, pragmatic guide to using Git is available online from [RyPress](https://github.com/alokc83/Basic-Tutorials/blob/master/rypress.com%20Git/0_Ry's%20Git%20Tutorial.pdf) and also available for free on [Kindle](https://www.amazon.com/Rys-Git-Tutorial-Ryan-Hodson-ebook/dp/B00QFIA5OC).
* The [Git Cheat Sheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf) from GitHub provides quick instructions for using common commands.
* [Atlassian](https://www.atlassian.com/git/tutorials/what-is-version-control) has a very thorough and well laid out Git tutorial.
* For a more in-depth understanding of Git, read the free [ProGit eBook](https://git-scm.com/book/en/v2).

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, clicking the small arrow to the left of the question will reveal the answers.

<details>
<summary>What is the Git command used to get a full copy of an existing Git repository from Github?</summary>
<ul><ul>
  <li>Use <code>git clone git@github.com:&lt;your-respository-name&gt;</code> to clone a GitHub repository onto your local machine.</li>
</ul></ul>
</details>

<details>
<summary>What is the Git command used to check the status of your files?</summary>
<ul><ul>
  <li>Use <code>git status</code> to see any changes made since your last commit.</li>
</ul></ul>
</details>

<details>
<summary>What is the Git command used to track files with Git?</summary>
<ul><ul>
  <li>Use <code>git add</code> to track files.</li>
</ul></ul>
</details>

<details>
<summary>What is the Git command used to commit files?</summary>
<ul><ul>
  <li>Use <code>git commit</code> to commit tracked files.</li>
</ul></ul>
</details>

<details>
<summary>What is the Git command used to view your commit history?</summary>
<ul><ul>
  <li>Use <code>git log</code> to view your commit history.</li>
</ul></ul>
</details>

<details>
<summary>What is the Git command used to upload projects onto GitHub?</summary>
<ul><ul>
  <li>Use <code>git push</code> to send your commit to GitHub.</li>
</ul></ul>
</details>

<details>
<summary>Explain the two-stage system that Git uses to save files.</summary>
<ul><ul>
  <li>A <strong>save</strong> in Git is divided into two terminal commands: **add** and **commit**. The combination of these two commands gives you control of exactly what you want to be remembered in your snapshot.</li>
  <li><strong>Staging:</strong> Think of <code>add</code> as adjusting the number of people or elements to be included in a photo. With Git, you can select the changes you want to save with <code>git add</code>. Imagine a project that contains multiple files where changes have been made to several files. You want to save some of the changes you have made and leave some other changes to continue working on them.</li>
  <li><strong>Committing:</strong> Think of <code>commit</code> as actually taking a photo, resulting in a snapshot. For example, to commit a file named README.md, type <code>git commit -m "Add README.md"</code>. The <code>-m</code> flag stands for "message" and must always be followed by a commit message inside quotation marks. In this example, the commit message was <code>"Add README.md"</code>.</li>
</ul></ul>
</details>

<details>
<summary>Explain what <code>origin</code> is in <code>git push origin master</code>.</summary>
<ul><ul>
  <li>In Git, <code>origin</code> is a placeholder name for the URL of the remote repository. Git sets up the origin by default when it clones a remote repository. You can use <code>origin</code> to access the remote repository without having to enter a full URL every time. This also means that you can have multiple remotes for a repository by giving each a unique name.</li>
</ul></ul>
</details>

<details>
<summary>Explain what <code>master</code> is in <code>git push origin master</code>.</summary>
<ul><ul>
  <li>In Git, <code>master</code> is the branch of the remote repository you want to push your changes to. We will get more into branches in a later lesson, but the main thing to remember is that <code>master</code> is the official branch in your projects where production-ready code lives.</li>
</ul></ul>
</details>