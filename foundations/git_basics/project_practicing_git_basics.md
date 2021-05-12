### Introduction

This short project will demonstrate how to use Git to manage and track your project folders.

1. You will set up a remote repository on GitHub and then copy it onto your local machine.
2. Once this repo is set up locally, you will be able to use Git like a save button for your files and folders.
3. When you have finalized your saves, you can then push your local repo up onto GitHub to share with everyone!

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Create a Git repository on GitHub and copy it onto your local machine.
 - Describe the difference between staging and committing changes.
 - Describe the difference between committing your changes and pushing them onto GitHub.
 - Explain how to check the status of your current repository from the command line.
 - Explain how to look at the history of your previous commits from the command line.

### Before you start!

- Recent changes to the way Github names the default branch means you need to make sure you are using a recent version of git (2.28 or later). You can check your version by running:  
`git --version`
 - If you haven't already, set your local default git branch to `main`. You can do so by running:  
 `git config --global init.defaultBranch main`
- For more information on the change from `master` to `main` see [GitHub's Renaming Repository](https://github.com/github/renaming).

### Assignment
In this project, we'll walk through the basic Git workflow that you will use in all your projects.

#### Create the Repository

1. You should have already created a GitHub account in the [Setting up Git](https://www.theodinproject.com/courses/foundations/lessons/setting-up-git) lesson. If you haven't done that yet, you can sign up [here](https://github.com/).

2. Create a new repository by clicking the button shown in the screenshot below.
  <a href="https://imgur.com/LURPUjP"><img class="tutorial-img" src="https://i.imgur.com/LURPUjP.png" title="source: imgur.com" /></a>
3. Give your repository the name "git_test" in the repository name input field, and create the repository by clicking the green "Create repository" button at the bottom of the page.
4. This will redirect you to your new repository on GitHub. To copy this repository onto your local machine, select the SSH option and copy the line next to it.
  <a href="https://i.imgur.com/HQc2kLc.png"><img class="tutorial-img" src="https://i.imgur.com/HQc2kLc.png" title="source: imgur.com" /></a>
5. In the command line on your local machine, navigate to where you want to store this project, and then clone your repository on GitHub onto your computer with `git clone` followed by the URL you copied in the last step. The full command should look similar to `git clone git@github.com:USER-NAME/REPOSITORY-NAME.git`.
  <a href="https://i.imgur.com/mdP01fk.png"><img class="tutorial-img" src="https://i.imgur.com/mdP01fk.png" title="source: imgur.com" /></a>
6. That's it! You have successfully connected the repository you created on GitHub to your local machine. To test this, you can `cd` into the new **git_test** folder that was downloaded and then enter `git remote -v` in your command line. This will display the URL of the repository you created in GitHub, which is the remote for your local copy. You may have also noticed the word **origin** at the start of the `git remote -v` output, which is the name of your remote connection. The name "origin" is both the default and the convention for the remote repository, but it could have just as easily been named "party-parrot" or "dancing-banana". (Don't worry about the details of origin for now; it will come up again near the end of this tutorial.)
  <a href="https://i.imgur.com/757rSOt.png"><img class="tutorial-img" src="https://i.imgur.com/757rSOt.png" title="source: imgur.com" /></a>

#### Use the Git Workflow
1. Create a new file in the `git_test` folder called "README.md" with the command `touch README.md`.
  <a href="https://i.imgur.com/lVTmtF9.png"><img class="tutorial-img" src="https://i.imgur.com/lVTmtF9.png" title="source: imgur.com" /></a>
2. Type `git status` in your terminal. In the output, notice that your README.md file is shown in red, which means that this file is not staged.
  <a href="https://i.imgur.com/Z3IS3iL.png"><img class="tutorial-img" src="https://i.imgur.com/Z3IS3iL.png" title="source: imgur.com" /></a>
3. Type `git add README.md`. This command adds your README.md file to the staging area in Git. Now, type `git status` again. In the output, notice that your file is now shown in green, which means that this file is now in the staging area.
  <a href="https://i.imgur.com/J1gXSvj.png"><img class="tutorial-img" src="https://i.imgur.com/J1gXSvj.png" title="source: imgur.com" /></a>
4. Type `git commit -m "Add README.md"` and then type `git status` once more. The output should now say, "*nothing to commit, working tree clean*", indicating that your changes have been committed. Don't worry about the `upstream is gone` message you may see, this is totally normal and only showing because your cloned repository currently has no branches. It will be resolved once you have followed the rest of the steps in this project.
  <a href="https://i.imgur.com/0SsF1lV.png"><img class="tutorial-img" src="https://i.imgur.com/0SsF1lV.png" title="source: imgur.com" /></a>
5. Type `git log` and look at the output. You should see an entry for your "Add README.md" commit. You will also see details on the author who made the commit and the date and time for when the commit was made.

#### Add Another File

1. Create a new file in the `git_test` folder called `hello_world.txt`. In the terminal, type `git status`, and notice `hello_world.txt` is not staged.
  <a href="https://i.imgur.com/2KDdWft.png"><img class="tutorial-img" src="https://i.imgur.com/2KDdWft.png" title="source: imgur.com" /></a>
2. Open README.md in your text editor of choice and add the text "This is (YourUsername)'s first git project!" and then save the file.
  <a href="https://i.imgur.com/YvYwHXM.png"><img class="tutorial-img" src="https://i.imgur.com/YvYwHXM.png" title="source: imgur.com" /></a>
3. Back in your terminal, type `git status`, and notice that README.md is now shown as modified, and not staged or committed.  This is because you made a change to it, and it is already a tracked file.
  <a href="https://i.imgur.com/v6pRrwW.png"><img class="tutorial-img" src="https://i.imgur.com/v6pRrwW.png" title="source: imgur.com" /></a>
4. Add README.md to the staging area with `git add README.md`.
5. Can you guess what `git status` will output now? README.md will be displayed in green text, while hello_world.txt will still be in red. This means that only README.md has been added to the staging area.
  <a href="https://i.imgur.com/sY0hUHH.png"><img class="tutorial-img" src="https://i.imgur.com/sY0hUHH.png" title="source: imgur.com" /></a>
6. Now, add hello_world.txt to the staging area with a slightly different command: `git add .`, where the full stop means to add all files **in the current directory** that are not staged. Then, type `git status` once more, and everything should now be in the staging area. *(Note: You can use `git add -A` to add ALL unstaged files to the staging area within the repository)*
  <a href="https://i.imgur.com/E3Us1Rx.png"><img class="tutorial-img" src="https://i.imgur.com/E3Us1Rx.png" title="source: imgur.com" /></a>
9. Finally, let's commit all of the files that are in the staging area and add a descriptive commit message `git commit -m "Add hello_world.txt and edit README.md"`. Then, type `git status` once again, which will output "*nothing to commit*".
  <a href="https://i.imgur.com/8j8qCPE.png"><img class="tutorial-img" src="https://i.imgur.com/8j8qCPE.png" title="source: imgur.com" /></a>
10. Take one last look at your commit history by typing `git log`. You should now see two entries.

#### Push Your Work to GitHub
Finally, let's upload your work to the GitHub repository you created at the start of this tutorial.

1. Type `git push origin main`.
  <a href="https://i.imgur.com/SMlW3bO.png"><img class="tutorial-img" src="https://i.imgur.com/SMlW3bO.png" title="source: imgur.com" /></a>
2. Type `git status` one final time. It should output "*nothing to commit, working tree clean*".
  <a href="https://i.imgur.com/zvrr2ou.png"><img class="tutorial-img" src="https://i.imgur.com/zvrr2ou.png" title="source: imgur.com" /></a>
3. When you reload the repository on GitHub, you should see the README.md and hello_world.txt files that you just pushed there from your local machine.
 <a href="https://i.imgur.com/aM9kgQK.png"><img class="tutorial-img" src="https://i.imgur.com/aM9kgQK.png" title="source: imgur.com" /></a>

### Conclusion
The main take away from the past few lessons is how to use Git and GitHub for your projects. You now have this very powerful skill that will help you immensely when we get into the coding projects. You will be able to share your work with others for code reviews and to get help with your code if you're stuck.

In later Git lessons, we will cover some of the more advanced Git features, such as branches, which will further expand your abilities and make you more productive.

For now, concentrate on using the basics of Git that you've learned here with all of your projects from now on. You will soon know each of the basic Git commands from memory!

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/) by [Chris Beams](https://github.com/cbeams) provides guidelines for writing neat and concise commit messages.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* How do you create a new repository on GitHub?
* How do you copy a repository onto your local machine?
* What is the default name of your remote connection?
* How do you check the status of your current repository?
* How do you add files to the staging area in git?
* How do you commit the files to the staging area and add a descriptive message?
* How do you push your changes to your repository on GitHub?
* How do you look at the history of your previous commits?