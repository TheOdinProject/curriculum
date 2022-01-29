### Introduction

Git is a crucial skill to have whether you're just a hobbyist or you aim to become a professional web developer.  It's the "save" button on steroids and allows for seamless collaboration.  There really aren't all that many commands for you to learn, but sometimes the real difficulty of Git comes from visualizing what's happening. 

In this lesson, we'll help with the visualization by diving deeper than just the `$ git add .` and `$ git commit` and `$ git push` commands you've mostly been using. We'll cover topics such as Remotes, Pointers, and Changing Git History. This will expand your understanding of what's actually going on under the hood with Git. 

It is **very important** to take a look at all of this before progressing any further with the curriculum. The project work is becoming more and more complex, so using a disciplined Git workflow is no longer optional. Hopefully after going through this lesson you'll be much more comfortable changing you Git history, and have a better understanding of Git as a whole.


### Learning Outcomes
Look through these now and then use them to test yourself after going through the lesson:

* Gain a deeper knowledge about Git commands
* Learn about the different ways to change history
* Learn how to work with remotes to change history
* Explain the dangers of history-changing operations
* Be able to point out best practices of history-changing operations
* Learn about the concept of pointers

### Changing History

So let's say you're comfortable writing good commit messages and you're working with branches to have a good Git workflow going. But nobody is perfect, and as you're writing some beautiful code something goes wrong! Maybe you commit too early and are missing a file. Maybe you mess up one of your commit messages and omit a vital detail. 

Let's look at some ways we can change recent and distant history to fit our needs. We're going to cover how to:
- Change our most recent commit
- Change multiple commit messages
- Reorder commits
- Squash commits together
- Split up commits 

## Changing The Last Commit

Let's say we execute a commit but *Uh-Oh!*, we're missing a file! Let's add our missing file, and run `$ git commit --amend`

~~~bash
  $ git commit -m 'Initial commit missing a file'
  $ git add missing_file
  $ git commit --amend
~~~

What happened here is we first updated the staging area to includes the missing file, and replaced the last commit with our new one to include the missing file. If we wanted to, we could have changed the message of the commit and it would have overwritten the message of the past commit. 

Remember to **only amend commits that have not been pushed anywhere!** The reason for this  is that `git commit --amend` does not simply edit the last commit, it *replaces that commit with an entirely new one*. This means that if you were to amend a commit other developers are basing their work on, you're effectively destroying a commit they could be basing their work off of. When rewriting history always make sure that you're doing so in a safe manner, and that your coworkers are aware of what you're doing. 

## Changing Multiple Commits

Now let's say you have commits further back in your history that you want to modify. This is where the beautiful command `rebase` comes into play! We're going to get deeper into the complexities of `rebase` later on in this lesson, but for now we're going to start out with some very basic usage. 

`rebase -i` is a command which allows you to interactively stop after each commit you're trying to modify, and then make whatever changes you wish. You do have to tell this command which is the last commit you want to edit, for example `git rebase -i HEAD~3` to edit the last three commits. Let's see what this looks like in action. Open up a project you've worked on, and [create a new branch](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/revisiting-rock-paper-scissors). Now that we're somewhere safe where we can experiment, type in:

~~~bash
  $ git log
  $ git rebase -i HEAD~3
~~~

You should notice that when rebasing, the commits are listed in opposite order compared to how you see them when you use `log`. Take a minute to look through all of the options the interactive tool offers you. Now let's look at the commit messages at the top of the tool. What I see when I run `git rebase -i HEAD~3` while writing this lesson on Advanced Git Topics is these last three commits:

~~~bash
pick c85c71dd5 Rewrite Introduction
pick 4ad2c8df6 Add information on using amend
pick 729db1da4 Begin work on Remotes
~~~

If I wanted to edit one of them, I would change the word `pick` to be `edit` for the appropriate commit. If I wanted to remove a commit I would simply remove it from that list, and if I wanted to change the order I would move them around on the list. Let's see what all three would look like! 

~~~bash
pick 4ad2c8df6 Add information on using amend
edit c85c71dd5 Rewrite Introduction
~~~

This would allow me to edit the `Rewrite Introduction` commit, switch its order with the `Add information on using amend` commit, and completely remove the most recent `Begin work on Remotes` commit. When I'm certain I want to do this, I'll save and exit the editor, which will allow me to edit my commit with the following instructions:

~~~bash
You can amend the commit now, with
       git commit --amend
Once youre satisfied with your changes, run
       git rebase --continue
~~~

These commit changes would be disasterous for me, so I won't *actually* do it, but it's a great tool to keep in mind for your future projects. That's all there is to it! It seems simple, but this is a very dangerous tool if misused, so be careful. Most importantly, remember to **only rebase commits that exist in your repository, never rebase commits others may work off of.**


## Squashing Commits

Using `squash` for your commits is a very handy way of keeping your Git history tidy. It's important to know how to `squash`, because this process may be the standard on some development teams. Squashing makes it easier for others to understand the history of your project. What often happens when a feature is merged, is you end up with some visually complex logs of all the changes a feature branch had on a main branch. These commits are important while the feature is in development, but aren't really necessary when looking through the entire history of your main branch.

Let's say I want to `squash` all three of the commits I previously worked with together into the first commit on the list, which is `Rewrite Introduction`. I would simply  `pick` that commit as the commit that the other two are being `squash`ed into:

~~~bash
pick c85c71dd5 Rewrite Introduction
squash 4ad2c8df6 Add information on using amend
squash 729db1da4 Begin work on Remotes
~~~

That's it! When I save and exit the editor, the bottom two commits on that list get squashed into the top commit. 

## Splitting Up a Commit

Before diving into Remotes, we're going to have a look at a handy Git command called `reset`. Let's say one of my commits was `c85c71dd5 Add knight class and Add attack module`. That's a mouthful, and a bit much for one commit as you should have learned in the previous lesson on commits. So what we're going to do is split it up into two smaller commits, also using the interactive `rebase` tool. 

We open up the tool just like last time, change `pick` to `edit` for the commit we're going to split. Now, however, what we're going to do is run `git reset HEAD^`. What this does is it resets the commit. This allows us to add the files individually, commit them individually, and then `git rebase --continue` just like we did last time to finish up our changes. All together it would look something like this:

~~~bash
$ git reset HEAD^
$ git add lib/knight.rb
$ git commit -m 'Add knight class'
$ git add lib/movement.rb
$ git commit -m 'Add attack module'
$ git rebase --continue
~~~

As always however, remember to **check that none of these commits are pushed to shared repositories**.

### Working With Remotes

Thus far you've been working with remote repositories each time you've pushed or pulled from your own GitHub repository while working on the curriculum's various projects. In this section we're going to cover some slightly more advanced topics, which you might not have yet encountered or had to use. 

## git push --force

Let's say you're no longer working on a project all by yourself, but with someone else. You want to push a branch you've made changes on to a remote repository. Normally Git will only let you push your changes if you've already updated your local branch with the latest commits from this remote. 

If you haven't updated your local branch, and you're attempting to `git push` a commit which would create a conflict on the remote repository, you'll get an error message. This is actually a great thing! This is a safety mechanism to prevent you from overwriting commits created by the people you're working with, which could be disasterous. You get the error because your history is outdated. 

You might perform a brief query and find the command `git push --force`. This command overwrites the remote repository with your own local history. So what would happen we used this while working with others? You could potentially destroy their work! `git push --force` is a **very dangerous command, and should be used with caution when collaborating with others**. Instead, you can fix your outdated history error by updating your local history using `fetch`, `merge`, and then attempting to `push` again. 

Let's say alternatively that you pushed a commit, and *oops* made a mistake. You want to undo this commit and are once again tempted to just force the push. But wait, remember, this is a **very dangerous command**. If you're ever considering using it always check if it's appropriate and if you can use a safer command instead. If you're collaborating with others and want to *undo* a commit you just made, you can instead use `git revert`! 

~~~bash
git revert HEAD~1
git push origin feature-branch
~~~

Remember when we were working with HEAD, aka the current commit we're viewing, while rebasing? What this would do is it would revert the changes to HEAD by 1 commit! Then we would push our new commit to whichever branch we're working on, which in this example is feature-branch. 

So now that we've learned about the various dangerous of `git push --force`, you're probably wondering why it exists and when to use it. A very common scenario in which developers use `git push --force` is updating pull requests. Collaborative work is covered more in depth in a seperate lesson, but the take-away from this section should be that the `--force` option should be used only when you are certain that it is appropriate. There are also less common scenarios, such as when sensitive information is accidentally uploaded to a repository and you want to remove all occurances of it. 

<span id='force-with-lease'>It is worth giving special mention to `git push --force-with-lease`</span>, a command which in some companies is the default option. The reason for this is that it's a fail-safe! It checks if the branch you're attempted to push to has been updated, and sends you an error if it has. This gives you an opportunity to, as mentioned before, `fetch` the work and update your local repository.

## Merge Conflicts

Let's go back to a situation we discussed in the previous section - merge conflicts. While these might seem intimidating, especially if you've encountered them before and shoved your way through them without fully understanding what's going on, merge conflicts are actually very simple. 

Let's go straight to the source and read through [GitHub's documentation on merge conflicts](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/about-merge-conflicts). Take your time, and make sure you look at the two different ways the documentation suggests resolving merge conflicts - on GitHub itself, and on your command line. While you might not need this right now, keeping the source of this documentation in the back of your mind will prove invaluable for when you eventually run into a merge conflict and aren't sure where to find a simple solution. 


### Dangers and Best Practices

Let's review the dangers we've addressed so far. I know, I know, it's scary stuff - but we have to be mindful or our coworkers might end up hating our guts! If you look back through this lesson you'll see a common thread. `amend`, `rebase`, `reset`, `push --force` are all especially dangerous when you're collaborating with others. <span id='dangers'>These commands can destroy work your coworkers have created</span>. So keep that in mind. When attempting to rewrite history always check the dangers of the particular command you're using, and follow these best practices for the commands we've covered:
<span id='best-practices'>
1) If working on a team project make sure rewriting history is safe to do, and others know you're doing it.</span>
2) Ideally stick to using these commands only on branches that you're working with by yourself.
3) Using the `-f` flag to force something should scare you, and you better have a really good reason for using it.
4) Don't push after every single commit, changing published history should be avoided when possible
5) Regarding the specific commands we've covered:
  - For `git amend` never amend commits that have been pushed to remote repositories
  - For `git rebase` never rebase a repository that others may work off of 
  - For `git reset` never reset commits thath have been pushed to remote repositories
  - For `git push --force` only use it when appropriate, use it with caution, and preferably default to using `git push --force-with-lease`

### Branches Are Pointers

While the focus of this lesson was more advanced tools for changing Git history, we're going into another advanced topic that might be hard for some to understand - Pointers. You've already learned about [branches](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/revisiting-rock-paper-scissors) and how these hold multiple *alternate reality* versions of our files. Now we're going to discuss what that actually means under the hood, and what it means for branches to be pointers.

Before we dive into branches, let's talk about commits. If we recall [first learning about commits](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/git-basics), they were described as Snapshots. If it helps, think of this in a very literal sense. Every time you type in `git commit` your computer is taking a picture of all the file contents that have been staged with `git add`, in other words your entire tracked workspace gets copied. 

So what is a branch? Based off of your exposure, you might be visualizing a branch as a group of commits. This actually isn't the case! **A branch is actually a pointer to a single commit!** Hearing this your first thought might be *"Well if a branch is just a finger pointing at a single commit, how does that single commit know about all the commits that came before it?"*. The answer to the question is very simple, each commit is also a pointer, and points to the commit that came before it! Wow. This might be a lot to take in, so let's take a moment to absorb that fact. 

Now that you've had a second to gather your thoughts and attempt to wrap your head around this concept, it might help to go back and look at a concrete example of pointers we used in this lesson. Let's think back to our use of `git rebase -i HEAD~3`. If you can remember, this command lets us edit the last 3 commits. Do you have any guesses on how Git knew which 3 commits to edit? That's right, by using pointers! We start at HEAD, a special pointer for keeping track of the branch you're currently on. HEAD points to our most recent commit in the current branch. That commit points to the commit made directly before it, which we can call commit 2. That commit does the exact same, and points to the commit before it, which we can call commit 3. That's how `git rebase -i HEAD~3` starts with a HEAD pointer, and then uses more pointers to see which three commits to edit. 

You might be feeling overwhelmed at this point, so let's recap what we've learned. A branch is simply a pointer to a single commit. A commit is a snapshot, and a pointer at the commit directly behind it in history. That's it!

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.
* Read [Git Cheat Sheet](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet) if you need a reference sheet.
* Watch [Using Rebase & Merge](https://www.youtube.com/watch?v=f1wnYdLEpgI) for an example on how to use both rebase and merge.
* Read [Branches in a Nutshell](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell) if you want an even deeper dive into Branches.
* Read [this chapter on Rebasing](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) for an even deeper dive into Rebasing.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* <a class='knowledge-check-link' href='https://git-scm.com/book/en/v2/Git-Basics-Undoing-Things'>How can you amend your last commit?</a>
* <a class='knowledge-check-link' href='https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History'>What are some different ways to rewrite history?</a>
* <a class='knowledge-check-link' href='#force-with-lease'>What is a safe way to push history changes to a remote repository?</a>
* <a class='knowledge-check-link' href='#dangers'>What are the dangers of history-changing operations</a>
* <a class='knowledge-check-link' href='#best-practices'>What are best practices of history-changing operations</a>
* <a class='knowledge-check-link' href='https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell'>Explain what it means for branches to be pointers</a>