### Introduction

Git basics are very straightforward, but it sometimes feels like a bottomless pit when you find yourself on the wrong side of a confusing error situation. It's doubly frustrating because you think that messing up or trying the wrong solution can lose data. It's actually very hard to "lose" data with Git but it can certainly be hiding somewhere you wouldn't think to look without an experienced dev poking around.

The thing about Git is that, unless you've got a seriously impressive memory, you can't just learn it by reading about it up front... you need to do it. Find a problem you want to go back and fix, hit an error in your merge, etc. and Google the hell out of it, learning a new Git tactic in the process.

To help you out, come back and refer to this lesson again when you're in trouble. We'll first cover a real-world example of a GitHub workflow used on this very project. The Additional Resources section below should also help you find high quality resources for when you need them later on.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- A reminder about commit messages.
- Using Git to make open source contributions.

### Commit messages for collaboration

Before we dive into workflows, take a minute to remind yourself about good commit messages. You can check the [foundations lesson](https://www.theodinproject.com/lessons/foundations-commit-messages) for a reminder. This is a good time to draw particular attention to [Conventional Commits](https://www.conventionalcommits.org), a standard for commits that is gaining more and more popularity for collaborative projects. It helps to make sure your commit message gives a clear description of its purpose to anyone reading. You may like to implement these going forwards (if you aren't already!), or at least be aware of them for when you read other repos.

### A Git workflow for open source contribution

Let's say you want to contribute to the [repo that houses our curriculum content](https://github.com/TheOdinProject/curriculum/)

How do you contribute when you do not have write access to the repository? Below is a production-ready workflow that is actually used by contributors to this website. We'll assume here that you have commented on an [open issue on our repo](https://github.com/TheOdinProject/curriculum/issues) and that it has been assigned to you. If you don't have an issue assigned to you, you can still follow along with some arbitrary updates, just stop before step 3 in the **Sending your pull request** section since your changes aren't legitimate.

The key players in this story will be the `upstream` (the original GitHub repository), the `origin` (your fork of that repo), and the "local" repository (your local clone of `origin`). Think of it as a happy triangle... except that "local" can only pull from `upstream`, not push.

#### Initial setup

1. Read [the contributing guide](https://github.com/TheOdinProject/.github/blob/main/CONTRIBUTING.md) for the project.
1. Navigate to the curriculum repository and fork the original ("upstream") repository into your own GitHub account by using the "fork" button at the top of that repo's page on GitHub.
1. Clone your forked repository onto your local machine using something like `git clone git@github.com:your_user_name_here/curriculum.git` (you can get the url from the little widget on the sidebar on the right of that repo's page on GitHub).
1. Because you cloned the repository, you've already got a remote that points to `origin`, which is your fork on GitHub. You will use this to push changes back up to GitHub. You'll also want to be able to pull directly from the original repository on GitHub, which we'll call `upstream`, by setting it up as another remote. Do this by using the git command below inside the project folder `curriculum`:

```bash
git remote add upstream git@github.com:TheOdinProject/curriculum.git
```

#### Ongoing workflow

We've got one main branch -- `main`. `main` is for production-ready code. Any code deployed to `main` (on the original repo, not on your fork) will be tested in staging and shipped to production. You'll be working in a feature branch and submitting your pull requests to the `main` branch.

1. Create a new feature branch for whatever feature you want to build, and add commits following the same practices that you learned about in the [branching section of our Revisiting Rock Paper Scissors lesson](https://www.theodinproject.com/lessons/foundations-revisiting-rock-paper-scissors#using-branches).
1. When you're done with your feature, odds are that someone has made changes to the upstream repository in the meantime. That means that your `main` branch is probably out of date. Fetch the most updated copy using `git fetch upstream`.
1. Now merge the upstream's changes into your local version of `main` using `git merge`. Specifically, you'll first want to make sure you're on your `main` branch using `git checkout main` and then `git merge upstream/main` to merge in those upstream changes that we just fetched.
1. Note that a `git fetch upstream` followed by a `git merge upstream/some_branch` is the EXACT same thing as doing a `git pull upstream some_branch`. We prefer to split it up here so that we can explicitly walk through the steps.
1. Now that your `main` branch is up-to-date with upstream, you need to merge it into your feature branch. Yes, that is correct and it seems odd at first. Don't you want to merge the feature branch into the `main` branch instead? Yes, you do, *but not yet*. **Your feature branch is dirty.** You don't know if it has any conflicts which might creep up. Any time you are merging in more "senior" branches (e.g. merging the feature into `main`), you want it to be a clean and conflict-free merge if possible. So you first merge the "senior" branch into your dirty branch to resolve those conflicts. Run `git checkout your_feature_name` to jump back onto your feature branch, then `git merge main` to merge `main` into it.
1. You may have merge conflicts... resolve those using the skills you learned in [the Deeper Look at Git lesson](https://www.theodinproject.com/lessons/ruby-a-deeper-look-at-git)! ([JS Course Link](https://www.theodinproject.com/lessons/javascript-a-deeper-look-at-git)).

#### Sending your pull request

1. Now that your feature branch is squeaky clean and you know it'll merge cleanly into `main`, the hard part is all over. All that's left is to make the Pull Request (often abbreviated as PR) against our `upstream` repo on GitHub!
1. Now you want to send your feature branch back up to your `origin` (your fork of the `upstream` repository). You can't send directly to `upstream` because you don't have access, so you'll need to make a pull request. Use `git push origin your_feature_name` to ship your feature branch up to your fork on GitHub.
1. If you have been following along with the above steps to get familiar with this workflow, you should **stop at this point**. If you have completed an assigned issue, the final step is to submit a pull request to merge your feature branch into the original `upstream` repository's `main` branch. This can be done using GitHub's interface.
1. Shake your moneymaker, you're an OSS contributor!

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class='knowledge-check-link' href='#initial-setup'>What name is typically given for a Git remote that points to a repo that's been forked?</a>
- <a class='knowledge-check-link' href='#sending-your-pull-request'>Can you directly send your changes to a repository that you don't own/have write access to?</a>
- <a class='knowledge-check-link' href='#ongoing-workflow'>What should you do immediately before merging your feature branch into main?</a>

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- Seth Robertson's [Git Best Practices](http://sethrobertson.github.io/GitBestPractices/)
- [Git Branching and Tagging Best Practices on SO](http://programmers.stackexchange.com/questions/165725/git-branching-and-tagging-best-practices)
- [Git Best Practices Workflow Guidelines](http://www.lullabot.com/blog/article/git-best-practices-workflow-guidelines)
- GitHub's [official training site](https://training.github.com/)
- [Understand Git Conceptually](http://www.sbf5.com/~cduan/technical/git/)
- Learn about [Git Branching from Peter Cottle](http://pcottle.github.io/learnGitBranching/) using his interactive branching tutorial.
- Need more still? See [this meta-list of git tutorials for beginners](http://sixrevisions.com/resources/git-tutorials-beginners/).
- [Git Immersion](http://gitimmersion.com/lab_01.html) is another great tutorial to learn the shortcuts of git (if you're following the Ruby path or are willing to learn some Ruby).
- [Contributing to Open Source](https://youtu.be/mENDYhfxH-o) is a tutorial video reviewing this lesson.

Sometimes (okay, maybe a lot of times) when you're working with Git, something goes terribly wrong. Don't panic! Git is designed to help you recover from your misfortune. These resources will help you get back on track towards version control nirvana:

- [Dangit, Git!?!](https://dangitgit.com/) is a quick reference to get you out of common Git problems.
- This article on [How to undo (almost) anything with Git](https://github.blog/2015-06-08-how-to-undo-almost-anything-with-git/) will walk you through some of many options Git provides for undoing various mistakes.
- If the problem you're facing is more advanced, you can click through [this more in-depth guide](https://sethrobertson.github.io/GitFixUm/fixup.html) to find the answer to your specific question.
