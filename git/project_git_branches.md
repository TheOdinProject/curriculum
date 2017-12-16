# Project: Git Branches

In this project we will be forking The Odin Project's `git_branches` repository and learning to create a branch to work in and trial a new feature for the `git_branches` web page.. If you want to try adding an experimental feature to your project, branching allows you to add and change code whilst not modifying the `master` branch.. Should the feature be successful, it can be included in `master` branch with a merge. Should the feature be deemed unnecessary, the branch can be deleted and development can continue on the `master` branch without having to remove any code added for the feature branch.

## Learning Outcomes

* Fork an existing repository from GitHub and clone it to your local machine.
* Create a new branch in the repository and add new features.
* Switch between branches and view the different state of the project.
* Merge the feature branch into `master` and see the changes from the feature branch included in `master`

## Your Task

1. Go to [TheOdinProject's git_branches](https://github.com/TheOdinProject/git_branches) repository on GitHub. This repository is a simple web page `index.html` that has been made specifically for this lesson. Fork the repository by clicking the button shown below.
  <a href="http://i.imgur.com/fcJTCJU.png"><img class="tutorial-img" src="http://i.imgur.com/fcJTCJU.png" title="Click Fork icon" /></a>
2. After a short wait you should now have your own fork of the `git_branches` repository at `https://github.com/Your-GitHub-Username/git_branches`. When you fork on GitHub you can think of it as creating a copy of the original project that you own and can modify as you please without affecting the original.
3. In terminal `cd`  into the folder where you would like to place your forked copy of the curriculum and use this style of command `git clone https://github.com/Your-GitHub-Username/git_branches.git` to clone it. Don't forget to replace *Your-GitHub-Username* with your own GitHub username. GitHub will supply the URI you need in the clone command if you click on the `Clone or download` drop down menu shown here:
  <a href="http://i.imgur.com/rMnFkTy.png"><img class="tutorial-img" src="http://i.imgur.com/rMnFkTy.png" title="URI to download repository" /></a>
4. Now if we `cd git_branches` and run `git branch -v` we should see this:
  ```language-bash
   * master                f9230de Add index.html and describe project README.md

  ```
5. Let's create a new branch on the project called `new-feature` by entering `git branch new-feature`. Once done we should see a new branch in the list like so:
  ```language-bash
   * master                f9230de Add index.html and describe project README.md
     new-feature           f9230de Add index.html and describe project README.md

  ```
6. Now you can see the original branch `master` and the new branch `new-feature`. You'll see the head on both is currently pointing to the commit `f9230de` and we are on branch `master` as signified by the `*`. 
6. To swap, use `git checkout branch-name`. In this case it will be `git checkout new-feature`. As you will often want to create a branch and then checkout to the new branch, git provides a shortcut `git checkout -b new-feature` to do these two commands in one line.
7. Check that the previous command was successful by entering `git status`. If you have followed successfully you should see this:
  ```language-bash
  On branch new-feature
  nothing to commit, working tree clean

  ```
8. Now lets open `index.html` in the browser and view the file:
  <a href="http://i.imgur.com/hHCFyLn.png"><img class="tutorial-img" src="http://i.imgur.com/hHCFyLn.png" title="Page before modification" /></a>
9. Open `index.html` in your text browser. You will find a set of `<p></p>` tags with no content, add a second paragraph of your story.
10. Commit the changes to git with `git commit -am "add second paragraph"` (This adds the changes to the staging area and commits in the one line - another handy shortcut). Let's view it in the browser to see the changes:
  <a href="http://i.imgur.com/g8tF88n.png"><img class="tutorial-img" src="http://i.imgur.com/g8tF88n.png" title="Page after modification" /></a>
11. Now look at the branches with `git branch -v`
  ```language-bash
     master                f9230de Add index.html and describe project README.md
   * new-feature           7cc84e4 add second paragraph

  ```
  `new-feature` has the latest commit whilst master remains unchanged
12. Now, swap to `master` with `git checkout master`. Refresh the browser and see what happens 
  <a href="http://i.imgur.com/hHCFyLn.png"><img class="tutorial-img" src="http://i.imgur.com/hHCFyLn.png" title="Master remains unchanged" /></a>
13. `master` is the same as before and doesn't take in any changes made whilst on the `new-feature` branch. If `new-feature` proves to be a failure and introduces bugs we can switch to `master` and continue with development and not include the `new-feature` branch.
14. But in this case `new-feature` looks like a good addition. We can `git merge branch-name`, in this case `git merge new-feature`. When we do this we must be careful that our current branch is where we would like to merge `new-feature` into.
15. You should see something like this in the terminal:
  ```language-bash
  Updating f9230de..7cc84e4
  Fast-forward
  index.html | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

  ```
  And if we refresh the browser again we will see all the changes from `new-feature` are now included in `master`.
  <a href="http://i.imgur.com/g8tF88n.png"><img class="tutorial-img" src="http://i.imgur.com/g8tF88n.png" title="Master includes new-feature's modifications" /></a>
16. Now that `new-feature` is merged into `master`, let's clean up our repository by deleting `new-feature` with `git branch -d new-feature`
  ```language-bash
  Deleted branch new-feature (was 7cc84e4).
  ```
17. Success. We've created a new branch, made a new commit in it (we can make as many as we like before merging it into `master`) and then decided to merge it into `master`

## Helpful Links

* [Git-scm - Branches in a Nutshell](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)