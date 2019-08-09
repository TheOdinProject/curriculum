### Introduction

Hopefully you've been using the basic Git commands to create repositories and push your code up to Github.  If not, you've got a bit of catching up to do but don't worry.

In any case, Git is a crucial skill to have whether you're a professional web developer or just a hobbyist who needs to back up your code base.  It's the "save" button on steroids and it allows giant teams of developers to collaborate.  There really aren't all that many commands for you to learn either, but sometimes the real difficulty of it comes from visualizing in your head what it's actually doing.

In this lesson, we'll dive deeper than just the `$ git add .` and `$ git commit` and `$ git push` commands you've mostly been using.  Maybe you've had the dubious pleasure of getting a merge conflict when you tried to pull or push changes.  Maybe you're just curious how multiple developers can work on a single code base at the same time.  Either way, this section should help you take the first steps towards expanding your Git toolkit and understanding what's actually going on under the hood with Git.

It's important to take a look at this stuff before getting any deeper into things because the project work is becoming more and more complex so using a disciplined Git workflow is no longer optional.  The axiom used to be "save early and often" and now it's "commit early and often".  Hopefully, after you've finished this lesson you will feel much more comfortable with the basics and at least know what to Google if you'd like to do more.

We'll begin by reading some things that are probably review from [Web Development 101](https://www.theodinproject.com/courses/web-development-101/lessons/introduction-to-git) but, if you're like most people, you could benefit from a refresher. We'll then dive deeper into topics that are relevant so you can use git for a more effective workflow, whether you're just working on your own project or trying to bring in collaborators as well.


### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

* How do you amend a commit message that you just messed up?
* How do you view the history of your most recent commits?
* What are two different uses for `$ git checkout`?
* How do you undo a recent commit?
* What are branches?
* How do you create a new branch to work on?
* How do you push that (non-master) branch up to Github?
* How do you merge the changes from your new branch into the master branch again?
* Why is working with feature branches useful?
* What is the difference between using `$ git merge` and `$ git rebase`? (hint: history)
* What is the difference between a "remote" and your local repo?
* How do you add your Github repo as the remote?

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. If you haven't had the chance to do so, go through the [Web Development 101 Git Basics section](https://www.theodinproject.com/courses/web-development-101/lessons/introduction-to-git).
  2. Read [Chapter 2: Git Basics](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository) of the [ProGit book](https://git-scm.com/book/en/v2). (Click "next" at the bottom of the page to get to the next page. You want to read from page 2.1 "Getting a Git Repository" through page 2.8 "Summary".)
  3. Read [Chapter 3: Git Branching](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell) of the [ProGit book](https://git-scm.com/book/en/v2). (Click "next" at the bottom of the page to get to the next page. You want to read from page 3.1 "Branches in a Nutshell" through page 3.7 "Summary".)
  4. To learn about some of the more advanced undo tools that Git offers, read these two additional pages from the [ProGit book](https://git-scm.com/book/en/v2): [Rewriting History](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History) and [Reset Demystified](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified).
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Watch [Get Going from Pro Git](http://git-scm.com/video/get-going) if you'd like a refresher of things.
* Read [Git Cheat Sheet](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet) if you need a reference sheet.
* Watch [Using Rebase & Merge](https://www.youtube.com/watch?v=f1wnYdLEpgI) for an example on how to use both rebase and merge.
