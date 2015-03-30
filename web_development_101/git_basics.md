# Git 101
<!-- *Estimated Time: 2 hrs* -->

We mentioned Git briefly in the previous course [Introduction to Web Development](/introduction-to-web-development/tools-of-the-trade) and you've had a chance to use it during the [Rails project](/web-development-101/ruby-on-rails) but now it's time to actually dig in a bit more and understand what Git really is.

Git is an essential professional tool.  Github is where just about every developer out there stores his or her portfolio and it's where your next job is likely to host their code as well.  Git will be a part of your everyday life as a developer and there's no avoiding it.  It can also be incredibly helpful to you as you slowly become aware of its more useful features.  Learning it can be a bit tough because it's not always conceptually linear, so don't fret if you still feel like you don't have a great handle on it by the end of this unit.  You really learn Git by needing to use it in a situation and being forced to learn your way out (the hard way, unfortunately).

## Why Git is Useful

Backing up a bit, Git is the version control system used by developers.  It means that you can revert to a previous (working) version of the application if you really screwed something up and it means that you have a standardized way of managing a project with contributions from multiple developers.  It's even useful if it's just you and you're working on a project on your own with a few half-baked ideas that you're trying to code at the same time but want to keep separated until they've matured sufficiently.

It sort of feels like if you were typing a text document and, every time you saved it, you entered a summary message like "just finished paragraph on how git works".  Then, if you realize at the end of the day that all your changes are awful and ruin the flow of the document, you could go back to the last save of yesterday and bring the document back to the way it was.

But wait, you say, "Why not just erase the offending paragraphs and move on?"  Here's where the web application stops resembling a high school essay.  Changes you make to your web application to build some new feature will be scattered in a dozen different files and will likely involve changing existing code at least as much as it involves actually producing new (and easily deleted) code, so having that ability to just reset the clock to a particular point in the past saves you from having to remember exactly what was changed and what it looked like beforehand.  

The power of git goes well beyond this simple example, but it should help you start to see why people use it.  In a situation with multiple developers, how do you let them each work on the same code base at the same time?  Git keeps track of all the files that have been changed and how and it will help you resolve any situations where two people have changed the same file independently (a "merge conflict").

## Your Path to Git

Your use of Git will, for a long time, likely revolve primarily around the simple act of staging the changes you've made to local files, committing them to your local Git repository, then pushing them up to Github for safe keeping.  Later on, you'll learn how to push that code up to Heroku so it can actually be run on a real web server.  You may run into things like merge conflicts now and then if you've messed up your workflow a bit, but 95% of the time it will be incredibly straightforward.

You'll probably want to fork someone else's repository and clone it onto your hard drive at some point, and hopefully also make a contribution to The Odin Project curriculum yourself.  These are all pretty easy to do as well.

It won't be until you start hacking on more full-featured applications that you're likely to run into some of the more gnarly features of Git.  For now, sit back and learn the basics.  You'll have the chance to dig deeper in a later course.

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*

* What is Git?
* What is SCM?
* What is a VCS?
* Why is Git useful for a developer?
* Why is Git useful for a team of developers?
* How do you create a new Git repository for a project locally?
* How do you create it on Github?
* How do you commit changes?
* What is the difference between staging and committing changes?
* What is the difference between committing your changes and pushing them to Github?
* How do you check the status of your current repo in git?
* How do you see the history of your previous commits (from the command line)?
* How can you look through your historical commits on the Github website?
* What is a "Merge"?
* What is a "Pull Request"?
* What is "Forking" a repo?
* What is "Cloning" a repo?

## Assignment:

1. Watch the following videos from [Github's Youtube Channel](http://www.youtube.com/GitHubGuides):
    
    1. [Git Basics #1: What is VCS?](http://www.youtube.com/watch?v=8oRjP8yj2Wo) will introduce you to version control for developers.
    2. [Git Basics #2: What is Git?](http://www.youtube.com/watch?v=uhtzxPU7Bz0) will start getting a bit more into a Git workflow.
    3. [Git Basics #3: Get Going](https://www.youtube.com/watch?v=wmnSyrRBKTw) will show your how to configure your git initially.  You likely did some of these steps during the installation phase, so don't download it again.
    2. [Webcast: The Basics of Git and GitHub](http://www.youtube.com/watch?v=U8GBXvdmHT4) will provide more of a linear and wholistic look at practical workflows when using Git.  Some of the early terminology is a bit developer-y and it is pretty wide-ranging, but just soak it in and save it for later.  You'll also see information about some helpful Help files and GUI tools to visualize Git.

2. Do the quick [Try Git exercises](http://try.github.io/levels/1/challenges/1) as well.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* ["Just a simple guide for getting started with Git, no deep shit." from Roger Dudler](http://rogerdudler.github.io/git-guide/).
* [Git Basics #4: Quick Wins with Git](http://www.youtube.com/watch?v=7w5Z7LmyLgI) will get a bit more into some of the features of Git.  A bit abstract, but should give you some conceptual tips.
* [Git CheatSheet from Tiimgreen](https://github.com/tiimgreen/github-cheat-sheet)
* [For the very technical, this site helps you learn Git by building Git (not in Ruby)](http://kushagragour.in/blog/2014/01/build-git-learn-git/)
* [Visualization for basic git commands](http://www.wei-wang.com/ExplainGitWithD3/)
* [Interactive search that explains the meaning of any shell command, including git commands](http://explainshell.com)
