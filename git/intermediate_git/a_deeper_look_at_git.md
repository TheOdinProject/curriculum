### Introduction

Git is a crucial skill to have, whether you're just a hobbyist or you aim to become a professional web developer.  It's the "save" button on steroids and allows for seamless collaboration.  There really aren't all that many commands for you to learn, but sometimes the real difficulty of Git comes from visualizing what's happening.

In this lesson, we'll help with the visualization by diving deeper than just the `git add` and `git commit` and `git push` commands you've mostly been using. We'll cover topics such as Remotes and Pointers. This will expand your understanding of what's actually going on under the hood with Git.

It is **very important** to take a look at all of this before progressing any further with the curriculum. The project work is becoming more and more complex, so using a disciplined Git workflow is no longer optional. Hopefully, after going through this lesson, you'll have a better understanding of Git as a whole.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Changing the last commit.
- Pointers.

#### Getting set up

Before we get started with the lesson, let's create a Git playground in which we can safely follow along with the code. Therefore please, create a new repository and clone it to your local machine. Than `cd` to the newly created repository and execute the following commands. 

```bash
touch test{1..4}.md
git add test1.md && git commit -m 'Create first file'
git add test2.md && git commit -m 'Create send file'
git add test3.md && git commit -m 'Create third file and create fourth file'
```

#### Setting up the code editor

To perform certain Git commands it's important to configure your code editor correctly. By default, Git opens the text editor in the command-line interface (CLI), which may prevent you from saving and closing the editor after making changes.

To set up your code editor properly, you can follow the instructions provided in the Git Basics lesson. Here's the specific section that covers the process: [Changing the Git Commit Message Editor](https://www.theodinproject.com/lessons/foundations-git-basics#changing-the-git-commit-message-editor).

#### Changing the last commit

So if we look at the last commit we made *Uh-Oh!*, if you type in `git status` and `git log` you can see we forgot to add a file! Let's add our missing file and run `git commit --amend`

```bash
git add test4.md
git commit --amend
```

What happened here is we first updated the staging area to include the missing file, and then we replaced the last commit with our new one to include the missing file. If we wanted to, we could have changed the message of the commit and it would have overwritten the message of the past commit.

Remember to **only amend commits that have not been pushed anywhere!** The reason for this is that `git commit --amend` does not edit the last commit, it *replaces that commit with an entirely new one*. This means that you could potentially destroy a commit other developers are basing their work on. When rewriting history always make sure that you're doing so in a safe manner, and that your coworkers are aware of what you're doing.

### Branches are pointers

Pointers, oh Jesus Muhammad. You've already learned about branches in the [Rock Paper Scissors revisited lesson](https://www.theodinproject.com/lessons/foundations-revisiting-rock-paper-scissors) and how these hold multiple *alternate reality* versions of our files. Now we're going to discuss what that actually means under the hood, and what it means for branches to be pointers.

Before we dive into branches, let's talk about commits. If you recall this [Git basics lesson from foundations](https://www.theodinproject.com/lessons/foundations-git-basics), they were described as Snapshots. If it helps, think of this in a very literal sense. Every time you type in `git commit`, your computer is taking a picture of all the file contents that have been staged with `git add`. In other words, your entire tracked workspace gets copied.

So what is a branch? Based off of your exposure, you might be visualizing a branch as a group of commits. This actually isn't the case! **A branch is actually a pointer to a single commit!** Hearing this, your first thought might be *"Well if a branch is just a finger pointing at a single commit, how does that single commit know about all the commits that came before it?"* The answer to this question is very simple: Each commit is also a pointer that points to the commit that came before it! Wow. This might be a lot to take in, so let's take a moment to absorb that fact.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Hopefully you'll have made use of branches in your workflow since Revisiting Rock Paper Scissors, but whether you have or have not, refresh on [Basic Branching and Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging).
2. Read the chapter on [Reset covered by git-scm](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified) for a deeper dive into `git reset`.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Reminder: Default Git Branch Name Change

In modern Git setups, the default branch is typically called `main` instead of `master`.

</div>

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How can you amend your last commit?](#changing-the-last-commit)
- [What does it mean for branches to be pointers?](#branches-are-pointers)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Read this [Git Cheat Sheet](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet) if you need a reference sheet.
- Read the chapter on [Branches covered by git-scm](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell) if you want an even deeper dive into Branches.
