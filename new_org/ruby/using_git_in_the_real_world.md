# Using Git in the Real World
*Estimated Time: 1hr*

Git basics are very simple but it feels like a bottomless pit sometimes when you find yourself on the wrong side of a confusing error situation.  It's doubly frustrating because you think that messing up or trying the wrong solution can lose data. It's actually very hard to "lose" data with git but it can certainly be hiding somewhere you wouldn't think to look without an experienced dev poking around looking for it.

You'll have your share of misadventures, but everyone does.  The best remedy is to commit early and often.  The smaller and more modular your commits are, the less that can go wrong if you mess one up.  

There's some debate out there about how to properly use git in your workflow, but I try to think of it this way: Your commit message should fully describe (in present tense) what the commit includes, e.g. "add About section to navbar on static pages".  If you need to use a comma or the word "and", you've probably got too much stuff in your commit and should think about keeping your changes more modular and independent.

It can also be tempting to immediately fix bugs in your code or tweak some CSS when you see it.  Everyone's guilty of that (ahem).  But it's really best to keep that pen and paper next to you, write down the thing you want to fix, and continue doing what you were doing.  Then, when you've committed your current feature or merged its feature branch or somehow extricated yourself from the current problem, go back and tackle the things you wanted to touch originally.  

Again, it's all designed to keep your workflow modular and the commits independent so you can easily jump around your git timeline without messing up too many other things along the way.  The first time you need to go back and modify a single monolithic commit, you'll feel that pain and mend your ways.

The thing about git is that, unless you've got a seriously impressive memory, you can't just learn it by reading about it up front... you need to do it.  Find a problem you want to go back and fix, hit an error in your merge, etc. and Google the hell out of it, learning a new git tactic in the process.  

To help you out, come back and refer to this lesson again when you're in trouble. The Additional Resources section below should also help you find high quality resources for when you need them.

Git after it!  (Okay, pun fail.)

## You Will Need To Understand

* How often should you commit?
* How large should your commits be?
* What should your commit messages say?
* Can you commit unfinished features?
* Which workflow should you use? (e.g. Merge? Topic Branches? Git-Flow? Rebase?)  Hint: There's no right answer.

## Your Assignment:

1. Read [Version Control Best Practices](http://www.git-tower.com/learn/version-control-best-practices.html) from Tower.
1. Skim Seth Robertson's [Git Best Practices](http://sethrobertson.github.io/GitBestPractices/).  Don't worry too much about the commands you haven't seen yet... just work on the high level concepts.

## Additional Resources

* [Git Branching and Tagging Best Practices on SO](http://programmers.stackexchange.com/questions/165725/git-branching-and-tagging-best-practices)
* [Git Best Practices Workflow Guidelines](http://www.lullabot.com/blog/article/git-best-practices-workflow-guidelines)
* Github's [official training site](http://teach.github.com/)
* [Understand Git Conceptually](http://www.sbf5.com/~cduan/technical/git/)
* Learn about [Git Branching from Peter Cottle](http://pcottle.github.io/learnGitBranching/) using his interactive branching tutorial.
* Need more still?  See [this meta-list of git tutorials for beginners](http://sixrevisions.com/resources/git-tutorials-beginners/).
* For more info about dealing with merge conflicts, check out [around minute 30 of this video from edX's SAAS course](https://www.youtube.com/watch?v=ieoHg0Vb-xo&list=PLxNY6twFc_xCxdSPLlxUS4C0VO3sni2DA)
