### Introduction

In this lesson we will cover common git commands used to manage your projects and upload your work onto GitHub. We refer to these commands as the **basic git workflow**. These are commands that will frequent about 70-80% of the time whenever you use git; wrapping your head around these would be more than half the battle won!


### Learning Outcomes
By the end of this you should be able to:

<details>
<summary>Name the git command used to get a full copy of an existing git repository from Github</summary>
<ul><ul>
  <li>Use <code>git clone git@github.com:&lt;your-respository-name&gt;</code> to clone the repository</li>
</ul></ul>
</details>

<details>
<summary>Name the git command used to check the status of your files</summary>
<ul><ul>
  <li>Use <code>git status</code> to see any changes since your last commit</li>
</ul></ul>
</details>

<details>
<summary>Name the git command used to track files</summary>
<ul><ul>
  <li>Use <code>git add</code> to track files</li>
</ul></ul>
</details>

<details>
<summary>Name the git command used to commit files</summary>
<ul><ul>
  <li>Use <code>git commit</code> to commit tracked files.</li>
</ul></ul>
</details>

<details>
<summary>Name the git command used to view your commit history</summary>
<ul><ul>
  <li>Use <code>git log</code> to view your commit history.</li>
</ul></ul>
</details>

<details>
<summary>Name the git command used to upload projects onto GitHub</summary>
<ul><ul>
  <li>Use <code>git push</code> to send your commit to GitHub.</li>
</ul></ul>
</details>

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Complete the first interactive lesson in the Codecademy [Basic Git Workflow](https://www.codecademy.com/learn/learn-git). Try to look for an emerging pattern with the commands you are running.
  2. Watch this [video](https://www.youtube.com/watch?v=HVsySz-h9r4) by Corey Schafer for a great overview of some basic git commands.

</div>

### Cheatsheet
Here is a reference list of the most commonly used git commands (you might consider bookmarking this handy webpage). Try to familiarise yourself with the commands and then eventually remember them:

* Commands related to remote repository:
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

The git syntax works like this: `program | action | destination`.

For example:

* `git add .` is read like `git | add | .`
* `git commit -m "message"` is read like `git | commit -m | "message"`
* `git status` is read like `git | status | (no destination)`

### Conclusion
You may not feel completely comfortable with Git at this point, which is normal.
Git is a skill that you will only get more comfortable with as you use it. This is why we have a project coming right after this lesson where we walk you through the entire process. It's the exact same process you would use in a real project.

The main thing to take away from this lesson is the **basic workflow**; the commands you have been exposed to here are ones you will be using the most with Git.

Don't worry if you don't know all the commands yet or that they don't stick at the moment - they will soon be seared into your brain as you use them multiple times in future Odin projects to come.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* An introductory guide by [Michael Hartl](http://www.michaelhartl.com/) called [Learn Enough Git to Be Dangerous](https://www.learnenough.com/git-tutorial)
* An easy-to-read, pragmatic guide to using Git available online from [RyPress](https://github.com/alokc83/Basic-Tutorials/blob/master/rypress.com%20Git/0_Ry's%20Git%20Tutorial.pdf), also available for free on [Kindle](https://www.amazon.com/Rys-Git-Tutorial-Ryan-Hodson-ebook/dp/B00QFIA5OC)
* [Git Reference](https://git-scm.com/docs) is another official Git resource, providing quick instructions for using common commands.
* This very thorough and well laid out tutorial from [Atlassian](https://www.atlassian.com/git/tutorials/)
* For a more in-depth understanding of Git, read the free [ProGit eBook](https://git-scm.com/book/en/v2)
