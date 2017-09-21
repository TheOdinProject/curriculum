Git basics are very simple, but it sometimes feels like a bottomless pit when you find yourself on the wrong side of a confusing error situation.  It's doubly frustrating because you think that messing up or trying the wrong solution can lose data. It's actually very hard to "lose" data with Git but it can certainly be hiding somewhere you wouldn't think to look without an experienced dev poking around.

You'll have your share of misadventures, but everyone does.  The best remedy is to commit early and often.  The smaller and more modular your commits are, the less that can go wrong if you mess one up.  

There's some debate out there about how to properly use Git in your workflow, but I try to think of it this way: Your commit message should fully describe (in present tense) what the commit includes, e.g. "add About section to navbar on static pages".  If you need to use a comma or the word "and", you've probably got too much stuff in your commit and should think about keeping your changes more modular and independent.

It can also be tempting to immediately fix bugs in your code or tweak some CSS as soon as you see it.  Everyone's guilty of that (ahem).  But it's really best to keep that pen and paper next to you, write down the thing you want to fix, and continue doing what you were doing.  Then, when you've committed your current feature or merged its feature branch or somehow extricated yourself from the current problem, go back and tackle the things you wanted to touch originally.  

Again, it's all designed to keep your workflow modular and the commits independent so you can easily jump around your Git timeline without messing up too many other things along the way.  The first time you need to go back and modify a single monolithic commit, you'll feel that pain and mend your ways.

The thing about Git is that, unless you've got a seriously impressive memory, you can't just learn it by reading about it up front... you need to do it.  Find a problem you want to go back and fix, hit an error in your merge, etc. and Google the hell out of it, learning a new Git tactic in the process.  

To help you out, come back and refer to this lesson again when you're in trouble. We'll first cover a real-world example of a Github workflow used on this very project.  The Additional Resources section below should also help you find high quality resources for when you need them later on.

### A Git Workflow For Open Source Contribution

Let's say you want to contribute to the web application that powers this website(check it out [here](https://github.com/TheOdinProject/theodinproject)). _**NOTE**: this is not the curriculum repo that you have been submitting your project solutions too, this is the main Odin website that pulls the files from the curriculum in._

How do you do that?  This is a production-ready workflow that is actually used by contributors to this website.  We'll assume here that you do not have write access to the original repository.

The key players in this story will be the `upstream` (the original Github repository), the `origin` (your fork of that repo), and the "local" repository (your local clone of `origin`).  Think of it as a happy triangle... except that "local" can only pull from `upstream`, not push.

#### Initial Setup

1. Fork the original ("upstream") repository into your own Github account by using the "fork" button at the top of that repo's page on Github.
2. Clone your forked repository onto your local machine using something like `$ git clone git@github.com:your_user_name_here/theodinproject.git` (you can get the url from the little widget on the sidebar on the right of that repo's page on Github)
3. Because you cloned the repository, you've already got a remote that points to `origin`, which is your fork on Github.  You will use this to push changes back up to Github.  You'll also want to be able to pull directly from the original repository on Github, which we'll call `upstream`, by setting it up as another remote.  Do this by using `$ git remote add upstream git@github.com:TheOdinProject/theodinproject.git`.
4. If this is your first time using git, don't forget to set your username and email using:

        $ git config --global user.name "YOUR NAME"
        $ git config --global user.email "YOUR_EMAIL@EXAMPLE.COM"

#### Ongoing Workflow

We've got two main branches -- `master` and `dev`.  `master` is just for production-ready code.  Any code deployed to `master` will be tested in staging and shipped to production.  You'll be working in a feature branch and submitting your pull requests to the `dev` branch.  Pretend `master` doesn't even exist.

4. Create a new feature branch for whatever feature you want to build, using `$ git checkout -b your_feature_name`.  
5. Code, commit, code, commit, code, commit (see a pattern?)
6. When you're done with your feature, odds are that someone has made changes to the upstream repository in the meantime.  That means that your `master` and `dev` branches are probably out of date.  Fetch the most updated copies of these using `$ git fetch upstream`.
7. Type `$ git branch --all` to see a list of all the branches, including the ones that are normally hidden (e.g. the remote branches you just grabbed).  You should see `upstream/master` and `upstream/dev` among them.
8. Now merge the upstream's changes into your local version of `dev` using `$ git merge`.  Specifically, you'll first want to `$ git checkout dev` to get onto the `dev` branch and then `$ git merge upstream/dev` to merge in those upstream changes that we just fetched.  
9. Note that a `$ git fetch upstream` followed by a `$ git merge upstream/some_branch` is the EXACT same thing as doing a `$ git pull upstream/some_branch`.  I prefer to split it up so I can explicitly walk through the steps.
9. Now that your `dev` branch is up-to-date, you need to merge it into your feature branch.  Yes, that is correct and it seems odd at first.  Don't you want to merge the feature branch into the `dev` branch instead?  Yes, you do, *but not yet*.  **Your feature branch is dirty.**  You don't know if it has any conflicts which might creep up.  Any time you are merging in more "senior" branches (e.g. merging the feature into `dev` or the `dev` into `master`), you want it to be a clean and conflict-free merge.  So you first merge the "senior" branch into your dirty branch to resolve those conflicts.  So do a `$ git checkout your_feature_name` to jump back onto your feature branch then a  `$ git merge dev` to merge `dev` into it.
9. You may have merge conflicts... resolve those with `$ git mergetool` or just manually open up the files that have conflicts.  Basically, merge conflicts will insert markers into your conflicting files to denote what lines are part of the incoming code and which lines are part of your pre-existing code. You'll need to manually edit those files one-by-one (including removing the merge marker text) and then resave them.  Once you've finished fixing all the files that have conflicts, you need to commit your changes to finish the merge.

#### Sending Your Pull Request

10. Now that your feature branch is squeaky clean and you know it'll merge cleanly into `dev`, the hard part is all over.  Merge into `dev` with `$ git checkout dev` `$ git merge your_feature_name`.
11. Now you want to send your local version of the `dev` branch back up to your `origin` (your fork of the `upstream` repository).  You can't send directly to `upstream` because you don't have access, so you'll need to make a pull request.  Use `$ git push origin dev` to ship `dev` up to your fork on Github.
12. Finally, submit a pull request to send your forked version of `dev` back to the original `upstream` repository's `dev` branch.  This can be done using Github's interface.  You just need to make sure you're sending it back to the `dev` branch and not the `master` branch.
13. Shake your moneymaker, you're an OSS contributor!

### Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* How often should you commit?
* How large should your commits be?
* What should your commit messages say?
* Can you commit unfinished features?
* Which workflow should you use? (e.g. Merge? Topic Branches? Git-Flow? Rebase?)  Hint: There's no right answer.

### Your Assignment:

1. Read [Version Control Best Practices](http://www.git-tower.com/learn/ebook/command-line/appendix/best-practices#start) from Tower.
1. Skim Seth Robertson's [Git Best Practices](http://sethrobertson.github.io/GitBestPractices/).  Don't worry too much about the commands you haven't seen yet... just work on the high level concepts.
1. Read through this great resource to get a solid understanding of [how git works](http://think-like-a-git.net/)

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Git Branching and Tagging Best Practices on SO](http://programmers.stackexchange.com/questions/165725/git-branching-and-tagging-best-practices)
* [Git Best Practices Workflow Guidelines](http://www.lullabot.com/blog/article/git-best-practices-workflow-guidelines)
* Github's [official training site](https://training.github.com/)
* [Understand Git Conceptually](http://www.sbf5.com/~cduan/technical/git/)
* Learn about [Git Branching from Peter Cottle](http://pcottle.github.io/learnGitBranching/) using his interactive branching tutorial.
* Need more still?  See [this meta-list of git tutorials for beginners](http://sixrevisions.com/resources/git-tutorials-beginners/).
* [Git Immersion](http://gitimmersion.com/lab_01.html) is another great tutorial to learn the shortcuts of git.
