### Introduction

Git is a crucial skill to have whether you're just a hobbyist or you aim to become a professional web developer.  It's the "save" button on steroids and allows for seamless collaboration.  There really aren't all that many commands for you to learn, but sometimes the real difficulty of Git comes from visualizing what's happening. 

In this lesson, we'll help with the visualization by diving deeper than just the `$ git add .` and `$ git commit` and `$ git push` commands you've mostly been using. We'll cover topics such as Remotes, Pointers, and Changing Git History. This will expand your understanding of what's actually going on under the hood with Git. 

It is **very important** to take a look at all of this before progressing any further with the curriculum. The project work is becoming more and more complex, so using a disciplined Git workflow is no longer optional. Hopefully after going through this lesson you'll be much more comfortable changing your Git history and have a better understanding of Git as a whole.


### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

* History changing Git commands
* Different ways of changing history
* Using remotes to change history
* Dangers of history-changing operations
* Best practices of history-changing operations
* Pointers

### Changing History

So let's say you're comfortable writing good commit messages and you're working with branches to have a good Git workflow going. But nobody is perfect, and as you're writing some beautiful code something goes wrong! Maybe you commit too early and are missing a file. Maybe you mess up one of your commit messages and omit a vital detail. 

Let's look at some ways we can change recent and distant history to fit our needs. We're going to cover how to:

- Change our most recent commit
- Change multiple commit messages
- Reorder commits
- Squash commits together
- Split up commits 

#### Getting Set Up

Before we get started with the lesson, let's create a Git playground in which we can safely follow along with the code and perform history changing operations. Go to GitHub, and as you have in the past create a new repository. Call it whatever you'd like, and clone this repository to your local system. Now, let's `cd` into the repository we just cloned, and create some new files! Once you're in the repository follow along with the following commands. Look them up if you're confused about anything that's happening.

~~~bash
  $ touch test{1..4}.md
  $ git add test1.md && git commit -m 'Create first file'
  $ git add test2.md && git commit -m 'Create send file'
  $ git add test3.md && git commit -m 'Create third file and create fourth file'
~~~

#### Changing The Last Commit

So if we look at the last commit we made *Uh-Oh!*, if you type in `git status` and `git log` you can see we forgot to add a file! Let's add our missing file and run `$ git commit --amend`

~~~bash
  $ git add test4.md
  $ git commit --amend
~~~

What happened here is we first updated the staging area to include the missing file, and then we replaced the last commit with our new one to include the missing file. If we wanted to, we could have changed the message of the commit and it would have overwritten the message of the past commit. 

Remember to **only amend commits that have not been pushed anywhere!** The reason for this  is that `git commit --amend` does not simply edit the last commit, it *replaces that commit with an entirely new one*. This means that if you were to amend a commit other developers are basing their work on, you're effectively destroying a commit they could be basing their work off of. When rewriting history always make sure that you're doing so in a safe manner, and that your coworkers are aware of what you're doing. 

#### Changing Multiple Commits

Now let's say we have commits further back in our history that we want to modify. This is where the beautiful command `rebase` comes into play! We're going to get deeper into the complexities of `rebase` later on in this lesson, but for now we're going to start out with some very basic usage. 

`rebase -i` is a command which allows us to interactively stop after each commit we're trying to modify, and then make whatever changes we wish. We do have to tell this command which is the last commit we want to edit. For example, `git rebase -i HEAD~2` allows us to edit the last two commits. Let's see what this looks like in action, go ahead and type in:

~~~bash
  $ git log
  $ git rebase -i HEAD~2
~~~

You should notice that when rebasing, the commits are listed in opposite order compared to how we see them when we use `log`. Take a minute to look through all of the options the interactive tool offers you. Now let's look at the commit messages at the top of the tool. If we wanted to edit one of these commits, we would change the word `pick` to be `edit` for the appropriate commit. If we wanted to remove a commit, we would simply remove it from the list, and if we wanted to change their order, we would change their position in the list. Let's see what an edit looks like! 

~~~bash
edit eacf39d Create send file
pick 92ad0af Create third file and create fourth file
~~~

This would allow us to edit the typo in the `Create send file` commit to be `Create second file`. Perform similar changes in your interactive rebase tool, but don't copy and paste the above code since it won't work. Save and exit the editor, which will allow us to edit the commit with the following instructions:

~~~bash
You can amend the commit now, with
       git commit --amend
Once you're satisfied with your changes, run
       git rebase --continue
~~~

So let's edit our commit by typing `git commit --amend`, fixing the typo in the title, and then finishing the rebase by typing `git rebase --continue`. That's all there is to it! Have a look at your handiwork by typing `git log`, and seeing the changed history. It seems simple, but this is a very dangerous tool if misused, so be careful. Most importantly, remember that **if you have to rebase commits in a shared repository, make sure you're doing so for a very good reason that your coworkers are aware of.**


#### Squashing Commits

Using `squash` for our commits is a very handy way of keeping our Git history tidy. It's important to know how to `squash`, because this process may be the standard on some development teams. Squashing makes it easier for others to understand the history of your project. What often happens when a feature is merged, is we end up with some visually complex logs of all the changes a feature branch had on a main branch. These commits are important while the feature is in development, but aren't really necessary when looking through the entire history of your main branch.

Let's say we want to `squash` the second commit into the first commit on the list, which is `Create first file`. First let's rebase all the way back to our root commit by typing `git rebase -i --root`. Now what we'll do is `pick` that first commit, as the one which the second commit is being `squash`ed into:

~~~bash
pick e30ff48 Create first file
squash 92aa6f3 Create second file
pick 05e5413 Create third file and create fourth file
~~~

Rename the commit to `Create first and second file`, then finish the rebase with `git rebase --continue`. That's it! Run `git log` and see how the first two commits got squashed together. 

#### Splitting Up a Commit

Before diving into Remotes, we're going to have a look at a handy Git command called `reset`. Let's have a look at the commit `Create third file and create fourth file`. At the moment we're using blank files for conveniece, but let's say these files contained functionality and the commit was describing too much at once. In that case what we could do is split it up into two smaller commits by, once again, using the interactive `rebase` tool. 

We open up the tool just like last time, change `pick` to `edit` for the commit we're going to split. Now, however, what we're going to do is run `git reset HEAD^`, which resets the commit to the one right before HEAD. This allows us to add the files individually, add, and commit them individually. All together it would look something like this:

~~~bash
$ git reset HEAD^
$ git add test3.md && git commit -m 'Create third file'
$ git add test4.md && git commit -m 'Create fourth file'
~~~

Let's start by looking a bit closer at what happened here. When you ran `git reset`, you reset the current branch by pointing HEAD at the commit right before it. At the same time, `git reset` also updated the index (the staging area) with the contents of wherever HEAD now pointed. So our staging area was also reset to what it was at the prior commit - which is great - because this allowed us to add and commit both files separately.

Now let's say we want to move where HEAD points to but *don't* want to touch the staging area. If we want to leave the index alone, you can use `git reset --soft`. This would only perform the first part of `git reset` where the HEAD is moved to point somewhere else.

The last part of reset we want to touch upon is `git reset --hard`. What this does is it performs all the steps of `git reset`, moving the HEAD and updating the index, but it *also* updates the working directory. This is important to note because it can be dangerous as it can potentially destroy data. A hard reset overwrites the files in the working directory to make it look exactly like the staging area of wherever HEAD ends up pointing to. Similarly to `git commit --amend`, a hard reset is a destructive command which overwrites history. This doesn't mean you should completely avoid it if working with shared repositories on a team with other developers. You should, however, **make sure you know exactly why you're using it, and that your coworkers are also aware of how and why you're using it.**

### Working With Remotes

Thus far you've been working with remote repositories each time you've pushed or pulled from your own GitHub repository while working on the curriculum's various projects. In this section we're going to cover some slightly more advanced topics, which you might not have yet encountered or had to use. 

#### git push --force

Let's say you're no longer working on a project all by yourself, but with someone else. You want to push a branch you've made changes on to a remote repository. Normally Git will only let you push your changes if you've already updated your local branch with the latest commits from this remote. 

If you haven't updated your local branch, and you're attempting to `git push` a commit which would create a conflict on the remote repository, you'll get an error message. This is actually a great thing! This is a safety mechanism to prevent you from overwriting commits created by the people you're working with, which could be disastrous. You get the error because your history is outdated. 

You might perform a brief query and find the command `git push --force`. This command overwrites the remote repository with your own local history. So what would happen if we used this while working with others? Well let's see what would happen when we're working with ourselves. Type the following commands into your terminal, and when the interactive rebase tool pops up remove our commit for `Create fourth file`:

~~~bash
$ git push origin main
$ git rebase -i --root
$ git push --force
$ git log
~~~

Huh, that's interesting, we don't see our fourth file on our local system. Let's check our GitHub repository, is our file test4.md there? 

No! We just destroyed it, which in this scenario is the danger - you could potentially destroy the work of those you're collaborating with! `git push --force` is a **very dangerous command, and it should be used with caution when collaborating with others**. Instead, you can fix your outdated history error by updating your local history using `fetch`, `merge`, and then attempting to `push` again. 

Let's consider a different scenario:

~~~bash
$ touch test4.md
$ git add test4.md && git commit -m "Create fifth file"
$ git push origin main
$ git log
~~~
We look at our commit message and realize *oops*, we made a mistake. We want to undo this commit and are once again tempted to just force the push. But wait, remember, this is a **very dangerous command**. If we're ever considering using it, always check if it's appropriate and if we can use a safer command instead. If we're collaborating with others and want to *undo* a commit we just made, we can instead use `git revert`! 

~~~bash
git revert HEAD
git push origin main
~~~

Remember when we were working with HEAD, aka the current commit we're viewing, while rebasing? What this would do is it would revert the changes to HEAD! Then we would push our new commit to whichever branch we're working on, which in this example is main even though normally our work would most likely be on a feature-branch. 

So now that we've learned about the various dangerous of `git push --force`, you're probably wondering why it exists and when to use it. A very common scenario in which developers use `git push --force` is updating pull requests. Collaborative work is covered more in depth in a separate lesson, but the take-away from this section should be that the `--force` option should be used only when you are certain that it is appropriate. There are also less common scenarios, such as when sensitive information is accidentally uploaded to a repository and you want to remove all occurrences of it. 

<span id='force-with-lease'>It is worth giving special mention to `git push --force-with-lease`</span>, a command which in some companies is the default option. The reason for this is that it's a fail-safe! It checks if the branch you're attempting to push to has been updated and sends you an error if it has. This gives you an opportunity to, as mentioned before, `fetch` the work and update your local repository.

### Dangers and Best Practices

Let's review the dangers we've addressed so far. I know, I know, it's scary stuff - but we have to be mindful or our coworkers might end up hating our guts! If you look back through this lesson you'll see a common thread. `amend`, `rebase`, `reset`, `push --force` are all especially dangerous when you're collaborating with others. <span id='dangers'>These commands can destroy work your coworkers have created</span>. So keep that in mind. When attempting to rewrite history, always check the dangers of the particular command you're using and follow these best practices for the commands we've covered:

<span id='best-practices'></span>

1.  If working on a team project, make sure rewriting history is safe to do and others know you're doing it.
1.  Ideally, stick to using these commands only on branches that you're working with by yourself.
1.  Using the `-f` flag to force something should scare you, and you better have a really good reason for using it.
1.  Don't push after every single commit, changing published history should be avoided when possible.
1.  Regarding the specific commands we've covered:
    1.  For `git amend` never amend commits that have been pushed to remote repositories.
    1.  For `git rebase` never rebase a repository that others may work off of.
    1.  For `git reset` never reset commits that have been pushed to remote repositories.
    1.  For `git push --force` only use it when appropriate, use it with caution, and preferably default to using `git push --force-with-lease`.

### Branches Are Pointers

While the focus of this lesson was more advanced tools for changing Git history, we're going into another advanced topic that might be hard for some to understand - Pointers. You've already learned about branches in the [Rock Paper Scissors revisited lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/revisiting-rock-paper-scissors) and how these hold multiple *alternate reality* versions of our files. Now we're going to discuss what that actually means under the hood, and what it means for branches to be pointers.

Before we dive into branches, let's talk about commits. If you recall this [Git basics lesson from foundations](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/git-basics), they were described as Snapshots. If it helps, think of this in a very literal sense. Every time you type in `git commit`, your computer is taking a picture of all the file contents that have been staged with `git add`. In other words, your entire tracked workspace gets copied. 

So what is a branch? Based off of your exposure, you might be visualizing a branch as a group of commits. This actually isn't the case! **A branch is actually a pointer to a single commit!** Hearing this, your first thought might be *"Well if a branch is just a finger pointing at a single commit, how does that single commit know about all the commits that came before it?"* The answer to this question is very simple: Each commit is also a pointer that points to the commit that came before it! Wow. This might be a lot to take in, so let's take a moment to absorb that fact. 

Now that you've had a second to gather your thoughts and attempt to wrap your head around this concept, it might help to go back and look at a concrete example of pointers we used in this lesson. Let's think back to our use of `git rebase -i HEAD~3`. If you can remember, this command lets us edit the last 3 commits. Do you have any guesses on how Git knew which 3 commits to edit? That's right, by using pointers! We start at HEAD, which is a special pointer for keeping track of the branch you're currently on. HEAD points to our most recent commit in the current branch. That commit points to the commit made directly before it, which we can call commit 2. Commit 2 does the exact same and points to the commit before it, which we can call commit 3. That's how `git rebase -i HEAD~3` starts with a HEAD pointer, and then follows subsequent pointers to find which three commits to edit. 

You might be feeling overwhelmed at this point, so let's recap what we've learned. A branch is simply a pointer to a single commit. A commit is a snapshot, and it's a pointer to the commit directly behind it in history. That's it!

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  Read through [GitHub's documentation on merge conflicts](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/about-merge-conflicts)
    *   It's only a matter of time until you run into one (if you haven't already)! While merge conflicts might seem intimidating, they're actually very simple. Take your time with this resource and make sure you look at the two different ways the documentation suggests resolving merge conflicts - on GitHub itself, and on your command line. While you might not need this right now, keeping the source of this documentation in the back of your mind will prove invaluable for when you eventually run into a merge conflict and aren't sure where to find a simple solution. 

2.  Read [think-like-a-git](http://think-like-a-git.net/)
    *   Take your time with this resource as well, it's very well written and will be very helpful in solidifying your understanding of git. 
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class='knowledge-check-link' href='https://git-scm.com/book/en/v2/Git-Basics-Undoing-Things'>How can you amend your last commit?</a>
*   <a class='knowledge-check-link' href='https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History'>What are some different ways to rewrite history?</a>
*   <a class='knowledge-check-link' href='#force-with-lease'>What is a safe way to push history changes to a remote repository?</a>
*   <a class='knowledge-check-link' href='#dangers'>What are the dangers of history-changing operations</a>
*   <a class='knowledge-check-link' href='#best-practices'>What are best practices of history-changing operations</a>
*   <a class='knowledge-check-link' href='https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell'>Explain what it means for branches to be pointers</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   Read this [Git Cheat Sheet](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet) if you need a reference sheet.
*   Watch this [video about Rebase & Merge](https://www.youtube.com/watch?v=f1wnYdLEpgI) for an example of how to use both rebase and merge.
*   Read the chapter on [Branches covered by git-scm](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell) if you want an even deeper dive into Branches.
*   Read the chapter on [Rebasing covered by git-scm](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) for an even deeper dive into Rebasing.
*   Read the chapter on [Reset covered by git-scm](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified) for a deeper dive into `git reset`.
