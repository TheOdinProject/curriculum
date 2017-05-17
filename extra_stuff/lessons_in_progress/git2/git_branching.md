# Git Branching

Using Git Branch enables you to take your development path into new directions. Branching gives you the ability to represent what is typically a linear and flat development process as a multi-dimensional mind-map.

Every time a commit is made, this commit is being saved on a single default branch called `master`. Committing on only one branch would mean multiple features implemented into a project are only ever recorded within one line of development. For smaller projects this is acceptable, but as project size increases, continuing development in this manner leaves little to no room for quality control of your source code.

Git branching's function is two-fold: first, it demarcates an event or turning point in your development path. Second, it proposes a new development line to work on. What this functionality achieves is an opportunity to micromanage and control your projects transparently.

This concept of transparency means that as a team of developers, you can accurately identify which direction your project is headed towards and potential checkpoints for where bugs were introduced. With a much finer control of project development, employing Git Branch also means that you are able to have several developer teams operating in parallel towards a final goal.

## Learning Outcomes

*By the end of this lesson you should be able to:*

<!-- Lesson 1 is about naming and recalling the commands (familiarity) a high level overview as much as possible -->
* Describe which environment of three that the `master` branch should belong to in the development of an application
* Describe the opportunities that Git Branching provides
* Describe the four commands involved in carrying out an informed branch merge. <!-- Maybe needs clarification?? or use the following labelled redundant -->

<!-- redundant?? -->
* Name the command used to create new branches and see a listing of available branches
* Name the command used for visualising how git branching takes place
* Name the command used to switch between branches
* Name the command used for moving an older branch

<!-- Lesson 2 is about using the commands, answers for Lesson 1 learning outcomes are implicit in the learning outcomes of Lesson 2 -->
* Use `git branch` to create new branches and see a listing of available branches
* Use `git log` and the flags `--oneline`, `--graph` and `--decorate` to visualise how git branching takes place
* Use `git checkout` to switch between branches
* Identify whether one branch is ahead or behind in commits with another branch
* Use `git merge` to move a project's code forward from an older branch to a newer branch

### Assignment:

lesson 1
* talk about code environments, master is for production code
* convey that branches act as markers to a commit history
* show BEFORE and AFTER commits to branches -> demonstrate divergence

lesson 2
* fork odin curriculum and have students use git log with no flags, one flag (every instance), pairs of flags (every combination) and then all three flags so they appreciate what git branches look like
* demonstrate with diagrams the workflow of git branching which should involve: 
  * `git branch branch1`
  * `git checkout branch1`
  * `git add` `git commit`
  * `git checkout master`
  * `git merge branch1`

project
* an actual project with examples. have users write 5 sentences about themselves (and possibly more to get a cooler branch) - try and have the sentences be educational and reflective - this is a chance to get people to think about their study habits!!
  1. NAME was here
  2. My favourite quote is:
  3. What got me into programming:
  4. What I struggle with programming the most:
  5. My motivation to stay on track with programming:
* have people talk about 

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*