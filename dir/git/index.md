---
layout: 'content'
---
# Git
Total Estimated Time: 8-12 hours

## !! This section is Under Construction !!

## Intro

Hopefully you've been using the basic Git commands to create repositories and push your code up to Github.  If not, you've got a bit of catching up to do but don't worry.
 
In any case, Git is a crucial skill to have whether you're a professional web developer or just a hobbyist who needs to back up the code base.  It's the "save" button on steroids for code and it allows giant teams of developers to collaborate.  There really aren't all that many commands for you to learn, either, but sometimes the real difficulty of it comes from visualizing in your head what it's actually doing.

In this section, we'll dive deeper than just the `$ git pull` and `$ git add .` commands you've been using.  Maybe you've had the dubious pleasure of getting a merge conflict when you tried to pull or push changes.  Maybe you're just curious how multiple developers can work on a single code base at the same time.  Either way, this section should help you take the first steps towards expanding your git toolkit and understanding what's actually going on under the hood with git.

## Assignment

1. Watch the following Pro Git videos to get warmed up:

    1. [What is Version Control?](http://git-scm.com/video/what-is-version-control)
    2. [What is Git?](http://git-scm.com/video/what-is-git)
    3. [Get Going](http://git-scm.com/video/get-going)

1. Read [Pro Git](http://git-scm.com/book) chapters 1-3
2. Supplement your understanding with the first six videos from [Github's training screencasts](http://teach.github.com/articles/training-screencasts/) (up to and including pull requests)

TODO: How a real developer uses Git (2)

## Project: Git Calisthenics

TODO: set up your git username, check your configurations via a tour, create a new repo, mess something up, have to debug a merge conflict, view logs... best get this stuff out of the way on a toy project than your important one!  Should have already done Try Git, else do that first.

## Finale

Git basics are very simple but it feels like a bottomless pit sometimes when you find yourself on the wrong side of a confusing error situation.  It's doubly frustrating because you think that messing up or trying the wrong solution can lose data. It's actually very hard to "lose" data with git but it can certainly be hiding somewhere you wouldn't think to look without an experienced dev poking around looking for it.

You'll have your share of misadventures, but everyone does.  The best remedy is to commit early and often.  The smaller and more modular your commits are, the less that can go wrong if you mess one up.  There's some debate out there about how to properly use git in your workflow, but I try to think of it this way: Your commit message should fully describe (in present tense) what the commit includes, e.g. "add About section to navbar on static pages".  If you need to use a comma or the word "and", you've probably got too much stuff in your commit and should think about keeping your changes more modular and independent.

It can also be tempting to immediately fix bugs in your code or tweak some CSS when you see it.  Everyone's guilty of that (ahem).  But it's really best to keep that pen and paper next to you, write down the thing you want to fix, and continue doing what you were doing.  Then, when you've committed your current feature or merged its feature branch or somehow extricated yourself from the current problem, go back and tackle the things you wanted to touch originally.  

Again, it's all designed to keep your workflow modular and the commits independent so you can easily jump around your git timeline without messing up too many other things along the way.  The first time you need to go back and modify a single monolithic commit, you'll feel that pain and mend your ways.

The thing about git is that, unless you've got a seriously impressive memory, you can't just learn it by reading about it up front... you just need to do it.  Find a problem you want to go back and fix, hit an error in your merge, etc. and google the hell out of it, learning a new git tactic in the process.  To help you out, come back and refer to this section again when you're in trouble. The Additional Resources section below should also help you find high quality resources for when you need them.

Git after it!  (Okay, pun fail.)


## Additional Resources

* Atlassian has a series of [beginner guides with visualizations](https://www.atlassian.com/git/tutorial) for git.
* Github's [official training site](http://teach.github.com/)
* [Understand Git Conceptually](http://www.sbf5.com/~cduan/technical/git/)
* Learn about [Git Branching from Peter Cottle](http://pcottle.github.io/learnGitBranching/) using his interactive branching tutorial.
* Need more still?  See [this meta-list of git tutorials for beginners](http://sixrevisions.com/resources/git-tutorials-beginners/).
* For more info about dealing with merge conflicts, check out [around minute 30 of this video from edX's SAAS course](https://www.youtube.com/watch?v=ieoHg0Vb-xo&list=PLxNY6twFc_xCxdSPLlxUS4C0VO3sni2DA)

