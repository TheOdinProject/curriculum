# Git Remotes
In this lesson, we will cover the `git remote` command and remote repositories. 

A remote is like a bookmark that tells Git where the other versions of a project are stored. These versions are housed in "remote repositories." 

Remote repositories are the versions of your project that are not on your local machine. These are typically the repositories that you are pulling code from and pushing code to when you use Git.

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

By the end of this you should be able to:

* Explain why we use remote repositories
* Fork and clone a repository to your machine
* Add a remote to a repository
* View remotes on a local project
* Remove a remote from a repository
* Pull changes from a remote branch
* Push changes to a remote branch
* Submit a pull request to a remote repository that doesn't belong to you

# Introduction to Remotes
This section will give you a clear understanding of what a remote is and why we use remotes. 

GitHub has an excellent definition for remotes: "A remote URL is Git's fancy way of saying 'the place where your code is stored.'" Remotes allow us to work in tandem with other developers by giving us central locations to store and share different versions of our projects.

There is a subtle, but important difference between a "remote" and a "remote repository." A remote is the bookmark-like tool that developers use to tell Git where a remote repository is located. The remote repository is where the code actually lives, typically this is on a server or another computer.

## Assignment
1. Read an [intro to remote repositories](https://www.git-tower.com/learn/git/ebook/en/command-line/remote-repositories/introduction#start)
2. Take a few minutes to watch [this overview](https://www.youtube.com/watch?v=kd4jMl_3LQE) of Git remotes and remote repositories

# Forking and Cloning a Remote Repository
This section is going to cover forking and cloning Git repositories. 

Forking is a way for developers to make their own copies of a GitHub repository. It's important to note that forking is specific to the GitHub website, so it is not a part of Git. When you create a fork on GitHub, you've made an identical copy of a repository under your own user account. This allows developers to copy and change a project without affecting the original.

Cloning is Git's way of getting a copy of a project. You'll have to clone a repository before you can make changes to it or see the source code on your own computer. Cloning helps you edit a repository on your local computer without making irreversible changes.

Remember forking is specific to GitHub, and cloning is a feature of Git. 

## Assignment
1. Watch [episode 1.3](https://www.youtube.com/watch?v=_NrSWLQsDL4&list=PLRqwX-V7Uu6ZF9C0YMKuns9sLDzK6zoiV&index=3) of [The Coding Train](https://www.youtube.com/channel/UCvjgXvBlbQiydffZU7m1_aw)'s [Git and GitHub for Poets](https://www.youtube.com/playlist?list=PLRqwX-V7Uu6ZF9C0YMKuns9sLDzK6zoiV) to learn about making forks on GitHub
2. Watch [episode 1.6](https://youtu.be/yXT1ElMEkW8?list=PLRqwX-V7Uu6ZF9C0YMKuns9sLDzK6zoiV) of [The Coding Train](https://www.youtube.com/channel/UCvjgXvBlbQiydffZU7m1_aw)'s [Git and GitHub for Poets](https://www.youtube.com/playlist?list=PLRqwX-V7Uu6ZF9C0YMKuns9sLDzK6zoiV) to understand cloning a remote repository

# Using the git remote Command
Here, we will discuss using the `git remote` command. First we will learn to add a new remote, then we will see how to view all remotes on a git repository. 

## Assignment
1. Read [GitHub](https://www.github.com)'s guide for [Adding a remote](https://help.github.com/articles/adding-a-remote/)
2. Read [Listing Remote Branches](http://gitready.com/intermediate/2009/02/13/list-remote-branches.html) from [Nick Quaranto](http://gitready.com/)
3. Read [GitHub](https://www.github.com)'s guide for [Removing a remote](https://help.github.com/articles/removing-a-remote/)

# Working with a Remote Repository
Finally, we are going to look at making changes to a repository and making a pull request to a remote repository that you don't own.

## Assignment
1. Watch this [60-second video](https://www.youtube.com/watch?v=-uQHV9GOA0w) covering git pull and git push
2. Take a look at [Pushing and Pulling](http://gitready.com/beginner/2009/01/21/pushing-and-pulling.html) from [Nick Quaranto](http://gitready.com/)
3. Watch [Git & GitHub: Pull requests](https://www.youtube.com/watch?v=FQsBmnZvBdc) from [Codecourse](https://www.youtube.com/watch?v=FQsBmnZvBdc)

## Exercises
* Follow [this tutorial]((https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github) from [DigitalOcean](https://www.digitalocean.com) to see forking, cloning, remotes, and pull requests in action

## Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Working with Remotes](https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes) from [Pro Git](https://git-scm.com/book/en/v2) by Scott Chacon and Ben Straub
* [What is version control: centralized vs. DVCS](https://www.atlassian.com/blog/software-teams/version-control-centralized-dvcs) from [Atlassian](https://www.atlassian.com/)

