### Introduction

This short project will demonstrate how to use Git to manage and track your project folders.

1. You will set up a remote repository on GitHub and then copy it onto your local machine.
1. Once this repo is set up locally, you will be able to use Git like a save button for your files and folders.
1. When you have finalized your saves, you can then push your local repo up onto GitHub to share with everyone!

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

1. You should have already created a GitHub account in the [Setting up Git](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/setting-up-git) lesson. If you haven't done that yet, you can sign up [here](https://github.com/).

1. Create a new repository by clicking the button shown in the screenshot below.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/00.png" title="Create new repo using GitHub" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/00.png)
1. Give your repository the name "git_test" in the repository name input field, and create the repository by clicking the green "Create repository" button at the bottom of the page.
1. This will redirect you to your new repository on GitHub. To copy this repository onto your local machine, select the SSH option and copy the line next to it.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/01.png" title="Copy SSH link using GitHub" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/01.png)
1. In the command line on your local machine, navigate to where you want to store this project, and then clone your repository on GitHub onto your computer with `git clone` followed by the URL you copied in the last step. The full command should look similar to `git clone git@github.com:USER-NAME/REPOSITORY-NAME.git`.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/02.png" title="Clone repo using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/02.png)
1. That's it! You have successfully connected the repository you created on GitHub to your local machine. To test this, you can `cd` into the new **git_test** folder that was downloaded and then enter `git remote -v` in your command line. This will display the URL of the repository you created in GitHub, which is the remote for your local copy. You may have also noticed the word **origin** at the start of the `git remote -v` output, which is the name of your remote connection. The name "origin" is both the default and the convention for the remote repository, but it could have just as easily been named "party-parrot" or "dancing-banana". (Don't worry about the details of origin for now; it will come up again near the end of this tutorial.)
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/03.png" title="Check repo remotes using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/03.png)

#### Use the Git Workflow

1. Create a new file in the `git_test` folder called "README.md" with the command `touch README.md`.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/04.png" title="Create README using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/04.png)
1. Type `git status` in your terminal. In the output, notice that your README.md file is shown in red, which means that this file is not staged.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/05.png" title="Check status of repo using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/05.png)
1. Type `git add README.md`. This command adds your README.md file to the staging area in Git. Now, type `git status` again. In the output, notice that your file is now shown in green, which means that this file is now in the staging area.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/06.png" title="Stage README and check repo status again using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/06.png)
1. Type `git commit -m "Add README.md"` and then type `git status` once more. The output should now say, "*nothing to commit, working tree clean*", indicating that your changes have been committed. Don't worry about the `upstream is gone` message you may see, this is totally normal and only showing because your cloned repository currently has no branches. It will be resolved once you have followed the rest of the steps in this project.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/07.png" title="Commit README and check repo status again using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/07.png)
1. Type `git log` and look at the output. You should see an entry for your "Add README.md" commit. You will also see details on the author who made the commit and the date and time for when the commit was made.

#### Add Another File

1. Create a new file in the `git_test` folder called `hello_world.txt`. In the terminal, type `git status`, and notice `hello_world.txt` is not staged.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/08.png" title="Add text file and check repo status again using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/08.png)
1. Open README.md in your text editor of choice and add the text "This is (YourUsername)'s first git project!" and then save the file.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/09.png" title="Edit README using text editor" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/09.png)
1. Back in your terminal, type `git status`, and notice that README.md is now shown as modified, and not staged or committed.  This is because you made a change to it, and it is already a tracked file.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/10.png" title="Check repo status again using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/10.png)
1. Add README.md to the staging area with `git add README.md`.
1. Can you guess what `git status` will output now? README.md will be displayed in green text, while hello_world.txt will still be in red. This means that only README.md has been added to the staging area.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/11.png" title="Stage README changes and check repo status again using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/11.png)
1. Now, add hello_world.txt to the staging area with a slightly different command: `git add .`, where the full stop means to add all files **in the current directory** that are not staged. Then, type `git status` once more, and everything should now be in the staging area. *(Note: You can use `git add -A` to add ALL unstaged files to the staging area within the repository)*
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/12.png" title="Stage all other files in repo and check repo status again using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/12.png)
1. Finally, let's commit all of the files that are in the staging area and add a descriptive commit message `git commit -m "Add hello_world.txt and edit README.md"`. Then, type `git status` once again, which will output "*nothing to commit*".
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/13.png" title="Commit repo changes again and check repo status again using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/13.png)
1. Take one last look at your commit history by typing `git log`. You should now see two entries.

#### Push Your Work to GitHub

Finally, let's upload your work to the GitHub repository you created at the start of this tutorial.

1. Type `git push origin main`.
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/14.png" title="Push changes to remote using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/14.png)
1. Type `git status` one final time. It should output "*nothing to commit, working tree clean*".
  [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/15.png" title="Check repo status again to confirm local repo is up to date with remote using CLI" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/15.png)
1. When you reload the repository on GitHub, you should see the README.md and hello_world.txt files that you just pushed there from your local machine.
 [<img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/16.png" title="Verify repo changes are on GitHub" />](https://cdn.statically.io/gh/TheOdinProject/curriculum/febe02abdad0d578925567d19e9eccc52ea123f4/foundations/git_basics/project_practicing_git_basics/imgs/16.png)

### Conclusion

The main take away from the past few lessons is how to use Git and GitHub for your projects. You now have this very powerful skill that will help you immensely when we get into the coding projects. You will be able to share your work with others for code reviews and to get help with your code if you're stuck.

In later Git lessons, we will cover some of the more advanced Git features, such as branches, which will further expand your abilities and make you more productive.

For now, concentrate on using the basics of Git that you've learned here with all of your projects from now on. You will soon know each of the basic Git commands from memory!

### Additional Resources
This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/) by [Chris Beams](https://github.com/cbeams) provides guidelines for writing neat and concise commit messages.

### Knowledge Check
The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- How do you create a new repository on GitHub?
- How do you copy a repository onto your local machine?
- What is the default name of your remote connection?
- How do you check the status of your current repository?
- How do you add files to the staging area in git?
- How do you commit the files to the staging area and add a descriptive message?
- How do you push your changes to your repository on GitHub?
- How do you look at the history of your previous commits?
