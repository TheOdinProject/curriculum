
### Introduction  

So far, you've been working with remote repositories each time you've pushed or pulled from your own GitHub repository while working on the curriculum's various projects. In this section, we're going to cover  slightly more advanced topics, which you might not have yet encountered or had to use.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

  - Using remotes to change history.
  - Dangers of history-changing operations.
  - Best practices of history-changing operations.

#### git push -\-force

Let's say you're no longer working on a project all by yourself, but with someone else. You want to push a branch you've made changes on to a remote repository. Normally, Git will only let you push your changes if you've already updated your local branch with the latest commits from this remote.

If you haven't updated your local branch, and you're attempting to `git push` a commit which would create a conflict on the remote repository, you'll get an error message. This is actually a great thing! This is a safety mechanism to prevent you from overwriting commits created by the people you're working with, which could be disastrous. You get the error because your history is outdated.

You might perform a brief query and find the command `git push --force`. This command overwrites the remote repository with your own local history. So what would happen if we used this while working with others? Well, let's see what would happen when we're working with ourselves. Type the following commands into your terminal, and when the interactive rebase tool pops up remove our commit for `Create fourth file`:

~~~bash
$ git push origin main
$ git rebase -i --root
$ git push --force
$ git log
~~~

Huh, that's interesting. We don't see our fourth file on our local system. Let's check our GitHub repository to see if it's there.

Oh no, we just destroyed it!  In this scenario, the danger - you could potentially destroy the work of those you're collaborating with! `git push --force` is a **very dangerous command, and it should be used with caution when collaborating with others**. Instead, you can fix your outdated history error by updating your local history using `fetch`, `merge`, and then attempting to `push` again.

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

So now that we've learned about the various dangers of `git push --force`, you're probably wondering why it exists and when to use it. A very common scenario in which developers use `git push --force` is updating pull requests. Collaborative work is covered more in depth in a separate lesson, but the take-away from this section should be that the `--force` option should be used only when you are certain that it is appropriate. There are also less common scenarios, such as when sensitive information is accidentally uploaded to a repository and you want to remove all occurrences of it.

<span id='force-with-lease'>It is worth giving special mention to `git push --force-with-lease`</span>, a command which in some companies is the default option. The reason for this is that it's a fail-safe! It checks if the branch you're attempting to push to has been updated and sends you an error if it has. This gives you an opportunity to, as mentioned before, `fetch` the work and update your local repository.

### Dangers and best practices

Let's review the dangers we've addressed so far. I know, I know, it's scary stuff - but we have to be mindful or our coworkers might end up hating our guts! If you look back through this lesson you'll see a common thread. `amend`, `rebase`, `reset`, `push --force` are all especially dangerous when you're collaborating with others. <span id='dangers'>These commands can destroy work your coworkers have created</span>. So keep that in mind. When attempting to rewrite history, always check the dangers of the particular command you're using and follow these best practices for the commands we've covered:

<span id='best-practices'></span>

1.  If working on a team project, make sure rewriting history is safe to do and others know you're doing it.
2.  Ideally, stick to using these commands only on branches that you're working with by yourself.
3.  Using the `-f` flag to force something should scare you, and you better have a really good reason for using it.
4.  Don't push after every single commit, changing published history should be avoided when possible.
5.  Regarding the specific commands we've covered:
    1.  For `git amend` never amend commits that have been pushed to remote repositories.
    2.  For `git rebase` never rebase a repository that others may work off of.
    3.  For `git reset` never reset commits that have been pushed to remote repositories.
    4.  For `git push --force` only use it when appropriate, use it with caution, and preferably default to using `git push --force-with-lease`.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  Read through [GitHub's documentation on merge conflicts](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/about-merge-conflicts)
    *   It's only a matter of time until you run into one (if you haven't already)! While merge conflicts might seem intimidating, they're actually very simple. Take your time with this resource and make sure you look at the two different ways the documentation suggests resolving merge conflicts - on GitHub itself, and on your command line. While you might not need this right now, keeping the source of this documentation in the back of your mind will prove invaluable for when you eventually run into a merge conflict and aren't sure where to find a simple solution.

2.  Read [think-like-a-git](http://think-like-a-git.net/)
    *   Take your time with this resource as well, it's very well written and will be very helpful in solidifying your understanding of Git.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class='knowledge-check-link' href='#force-with-lease'>What is a safe way to push history changes to a remote repository?</a>
*   <a class='knowledge-check-link' href='#dangers'>What are the dangers of history-changing operations?</a>
*   <a class='knowledge-check-link' href='#best-practices'>What are best practices of history-changing operations?</a>


### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

* If you're looking for an interactive way to deepen your knowledge of working with Git, check out this game, [Learn Git Branching](https://learngitbranching.js.org/)
