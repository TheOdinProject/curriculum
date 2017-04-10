# Git Branches Introduction
Git branches are a fundamental piece of the Git framework. This lesson will teach you how to think conceptually about them and know what they are useful for, as well as why. By the end you should be able to create your own branch and use it to contribute!

## Learning Outcome
*By the end of this lesson you should be able to:*


* Know what a Git branch is.
* Understand what the master branch is.
* Understand why branches are useful in projects, especially in a team environment.
* Understand feature branches and their purpose.
* Understand what a spike branch is for.

## Assignment
* [Read this tutorial on Git branches](https://www.atlassian.com/git/tutorials/using-branches). This will cover some commands, and information on what branches are.
* [Checkout this video](https://www.youtube.com/watch?v=JTE2Fn_sCZs) to see git branching in action, as well as to learn how feature branches are useful on development teams.

## Branch Types
To fully understand branches, you will want to learn and use the different types.
* **Master** : The name commonly given to the main branch, where everyone on a development team will push their changes to.
* **Feature** : A branch created for an individual feature to be worked on. These can be divided amongst team members without fear of interferring with eachothers code.
* **Develop** : A branch used to actively develop on.
* **Release or Spike** : This is a branch that is not developed on, but is instead a snapshot, usually ready for release. Think of them as "Spikes" in the ground, or immovable.
* **Hotfix/Bugfix** : A branch created to solve individual issues such as bugs.

## Branch-related commands
* `git branch` - Displays the current branch.
* `git branch -a` - Displays existing branches.
* `git checkout -b test` - Will create a new branch named test.
* `git checkout master` - You can switch back and forth between branches by using the checkout command, then the branch name.



## Exercises
*The best way to get comfortable with Git branching is by doing it!*
* Create your own feature branch.
* Switch back and forth between branches.
* Try out other Git branch commands to get a feel for them.

## Conclusion
Git is a powerful tool that allows multiple people to work on the same project through branching. It may seem a bit overwhelming at first, however the more that you use branching the easier it will become and the bigger picture will start to form in your mind. When you create a branch, you can freely work with and develop on that code without fear of overwriting other developers work or them interferring with the work you are doing.


## Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/) - Useful insight into different types of branches.
* [Interactive branching tutorial](http://learngitbranching.js.org/) - Some deeper looks into Git branching through an interactive website.
