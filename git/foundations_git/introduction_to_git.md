### Introduction

Git is like a really **epic save button** for your files and directories (officially, it is a "version control system"). In this lesson, we'll briefly explore the history of Git, what it is and what it's useful for, then in the next lesson we'll go over the basic workflow for using Git (which you will come to be great friends with throughout the entirety of this curriculum and beyond).

Going forward, we assume you have already followed our [Setting Up Git](https://www.theodinproject.com/lessons/foundations-setting-up-git) lesson to install Git and set up SSH.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What Git and GitHub are, and how they differ from each other.
- The differences between Git and a text editor in terms of what they "save".
- Why Git is useful for both individual developers and teams.

### Version control

A *save* in a text editor records all of the words in a document as a single file. You are only ever given one record of the file, such as `essay.doc`, unless you make duplicate copies like `essay-draft1.doc`, `essay-draft2.doc` and `essay-final.doc` (which is difficult to remember to do and keep track of).

However, a "save" (known as a "commit") in Git records differences in the files and folders *and* keeps a **historical record of each save**. This feature is a game changer. As an individual developer, Git enables you to review how your project grows and to easily look at or restore file states from the past. Once connected to a network, Git allows you to push your project to a remote storage facility such as GitHub (or other alternatives such as Bitbucket, Beanstalk or GitLab), like "saving to the cloud". This of course helps for sharing and collaborating with other developers.

<div class="lesson-note lesson-note--warning" markdown="1">

#### Git remote platform support

The Odin Project uses GitHub for remote storage. We will not be able to support the use of alternatives like GitLab or Bitbucket, whether that's to provide alternative instructions or troubleshooting problems.

</div>

### Git vs GitHub

While Git works on your *local* machine, GitHub is a *remote* storage facility on the web for all your coding projects. This means that by learning Git, you will get to showcase your portfolio on GitHub! This is really important because almost all software development companies consider using a version control system like Git to be an **essential skill** for modern web developers. Having a GitHub portfolio will provide proof to future potential employers as to what you are capable of.

Git and GitHub work together. The general idea is that you do your work on your local machine using Git to manage your "saves", then store things remotely by "pushing" to GitHub. If needs be, you can "pull" from GitHub to download and sync your local machine with the remote. This is extra valuable for collaborative work, allowing everyone to stay in sync with changes coming from all over the place. People can also review work on GitHub and manage how changes from different places come together.

For now, let's learn more about what Git is and why it's so powerful!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read chapters 1.1 through 1.4 from the [Getting Started section of Pro Git](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control) to learn the differences between local, centralized, and distributed version control systems.
1. Watch ["What is Git?" explained in 2 minutes](https://www.youtube.com/watch?v=2ReR1YJrNOM) - a video about what Git is and how it can improve the workflow of both an individual and a team of developers.
1. Take a look at [The Odin Project's `curriculum` repository on GitHub](https://github.com/TheOdinProject/curriculum). This is where all the lessons are stored as well as where proposals are discussed and updates are reviewed and merged! While you're there, look at all [our contributors](https://github.com/TheOdinProject/curriculum/graphs/contributors) to gain an appreciation for how Git records all collaborative efforts and how GitHub visually represents this.

</div>
