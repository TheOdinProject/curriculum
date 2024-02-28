### Introduction

In this lesson, we'll cover common Git commands used to manage your projects and to upload your work onto GitHub. We refer to these commands as the **basic Git workflow**. When you're using Git, these are the commands that you'll use 70-80% of the time. So if you can get these down, you'll be more than halfway done mastering Git!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to create a repository on GitHub.
- How to get files to and from GitHub.
- How to take "snapshots" of your code.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Before you start!

- Github recently updated the way it names the default branch. This means you need to make sure you are using a recent version of git (2.28 or later). You can check your version by running:
  `git --version`
- If you haven't already, set your <span id="main-push"></span>local default git branch to `main`. You can do so by running:
  `git config --global init.defaultBranch main`
- For more information on the change from `master` to `main` see [GitHub's Renaming Repository](https://github.com/github/renaming).

#### Create the repository

1. <span id="new-github-repo"></span>You should have already created a GitHub account in the [Setting Up Git](https://www.theodinproject.com/lessons/foundations-setting-up-git) lesson. If you haven't done that yet, you can sign up on [GitHub](https://github.com/).

1. Create a new repository by clicking the button shown in the screenshot below.

    ![The GitHub Profile Screen](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/00.png)

1. Give your repository the name "git_test" in the repository name input field. Check "Add a README file". And then create the repository by clicking the "Create repository" button at the bottom of the page.

    ![Create new repo using GitHub](https://cdn.statically.io/gh/TheOdinProject/curriculum/d0579120dd641d26aaef6a601008e998f8a7c648/git/foundations_git/git_basics/imgs/01.png)

1. This will redirect you to your new repository on GitHub. To get ready to copy (clone) this repository onto your local machine, click the green "Code" button. Then select the SSH option, and copy the line below it. **NOTE: You MUST click the SSH option to get the correct URL.**

    ![Copy SSH link using GitHub](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/02.png)

1. Let's use the command line on your local machine to create a new directory for all of your Odin projects. Create a directory called `repos` with the `mkdir` command in your home folder. Your home folder is represented by `~`. [Navigating Files and Directories](https://swcarpentry.github.io/shell-novice/02-filedir.html#callout1) covered variations of home folders - sometimes `~` stands for `/Users/your_username` and sometimes it stands for `/home/your_username`. If you're not sure if you're in your home folder, just type `cd ~`. Once it's made, move into it with the `cd` command.

    ![Creating a new directory](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/03.png)

1. <span id="github-to-local"></span>Now it's time to clone your repository from GitHub onto your computer with `git clone` followed by the URL you copied in the last step. The full command should look similar to `git clone git@github.com:USER-NAME/REPOSITORY-NAME.git`. If your URL looks like `https://github.com/USER-NAME/REPOSITORY-NAME.git`, you have selected the HTTPS option, not the required SSH option.

    ![Clone the repo using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/04.png)

1. <span id="origin-push"></span>That's it! You have successfully connected the repository you created on GitHub to your local machine. To test this, you can `cd` into the new **git_test** folder that was downloaded and then enter `git remote -v` on your command line. This will display the URL of the repository you created on GitHub, which is the remote for your local copy. <span id="default-remote"></span>You may have also noticed the word **origin** at the start of the `git remote -v` output, which is the name of your remote connection. The name "origin" is both the default and the convention for the remote repository. But it could have just as easily been named "party-parrot" or "dancing-banana". (Don't worry about the details of origin for now; it will come up again near the end of this tutorial.)

    ![Check repo remotes using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/05.png)

#### Use the Git workflow

1. Create a new file in the `git_test` folder called "hello_world.txt" with the command `touch hello_world.txt`.

    ![Create hello_world.txt using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/06.png)

1. <span id="git-status"></span>Type `git status` in your terminal. In the output, notice that your hello_world.txt file is shown in red, which means that this file is not staged.

    ![Check status of repo using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/07.png)

1. <span id="git-add"></span><span id="two-stages"></span>Type `git add hello_world.txt`. This command adds your hello_world.txt file to the staging area in Git. The staging area is part of the two-step process for making a commit in Git. Think of the staging area as a "waiting room" for your changes until you commit them. Now, type `git status` again. In the output, notice that your file is now shown in green, which means that this file is now in the staging area.

    ![Stage hello_world and check repo status again using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/08.png)

1. <span id="git-commit"></span>Type `git commit -m "Add hello_world.txt"` and then type `git status` once more. The output should now say: "*nothing to commit, working tree clean*", indicating your changes have been committed. Don't worry if you get a message that says "*upstream is gone*". This is normal and only shows when your cloned repository currently has no branches. It will be resolved once you have followed the rest of the steps in this project.

    The message, "*Your branch is ahead of 'origin/main' by 1 commit*" just means that you now have newer snapshots than what is on your remote repository. You will be uploading your snapshots further down in this lesson.

    ![Commit hello_world and check repo status again using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/09.png)

1. <span id="git-log"></span>Type `git log` and look at the output. You should see an entry for your "*Add hello_world.txt*" commit. You will also see details on the author who made the commit and the date and time of when the commit was made. If your terminal is stuck in a screen with (END) at the bottom, just press "q" to escape. You can configure settings for this later, but don't worry about it too much for now.

    ![Commit hello_world and check repo status again using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/10.png)

#### Modify a file or two

1. Open README.md in your text editor of choice. In this example, we will open the directory in Visual Studio Code by using the command `code .` inside your repository.

    ![Add text file and check repo status again using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/11.png)

    MacOS users: If your terminal reads *"command not found: code"*, you must head back to [Command Line Basics](https://www.theodinproject.com/lessons/foundations-command-line-basics#opening-files-in-vscode-from-the-command-line) and follow the instructions provided to allow this command to work.

1. Add "Hello Odin!" to line 3 of README.md and save the file with <kbd>Ctrl</kbd> + <kbd>S</kbd> (Mac: <kbd>Cmd</kbd> + <kbd>S</kbd>).

    ![Edit README using text editor](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/12.png)

    <!-- code element needed to not treat the backtick inside the kbd element as code markdown -->
    <!-- markdownlint-disable-next-line MD033 -->
1. Go back to your terminal or if you're using Visual Studio Code you can open the built-in terminal by pressing <kbd>Ctrl</kbd> + <kbd>`</kbd> (backtick). Then type <code>git status</code>. You'll notice that README.md is now shown as not staged or committed.

    ![Check repo status again using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/13.png)

1. Add README.md to the staging area with `git add README.md`.

1. Can you guess what `git status` will output now? README.md will be displayed in green text. That means README.md has been added to the staging area. The file hello_world.txt will not show up because it has not been modified since it was committed.

    ![Stage README changes and check repo status again using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/14.png)

1. Open hello_world.txt, add some text to it, save it and stage it. You can use `git add .` to add all files in the current directory and all subsequent directories to the staging area. Then, type `git status` once more, and everything should now be in the staging area.

    ![Stage all other files in repo and check repo status again using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/15.png)

1. Finally, let's commit all of the files that are in the staging area and add a descriptive commit message. `git commit -m "Edit README.md and hello_world.txt"`. Then, type `git status` once again, which will output "*nothing to commit*".

    ![Commit repo changes again and check repo status again using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/16.png)

1. Take one last look at your commit history by typing `git log`. You should now see three entries.

    ![Git Log](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/17.png)

#### Push your work to GitHub

Finally, let's upload your work to the GitHub repository you created at the start of this tutorial.

1. <span id="git-push"></span>Type `git push`. To be more specific, type `git push origin main`. Since you are not dealing with another branch (other than *main*) or a different remote (as mentioned above), you can leave it as `git push` to save a few keystrokes. **NOTE: If at this point you receive a message that says "Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.", you have followed the steps incorrectly and cloned with HTTPS, not SSH. Please follow the steps for [switching remote URLs from HTTPS to SSH](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh) to change your remote to SSH, then attempt to push to Github.**

    ![Push changes to remote using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/18.png)

1. Type `git status` one final time. It should output "*Your branch is up to date with 'origin/main'. nothing to commit, working tree clean*".

    ![Check repo status again to confirm local repo is up to date with remote using CLI](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/19.png)

1. When you reload the repository on GitHub, you should see the README.md and hello_world.txt files that you just pushed there from your local machine.

    ![Verify repo changes are on GitHub](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/20.png)

</div>

#### Note/Warning

When trying to make quick changes to the files in your repo, such as attempting to fix a typo in your README.md you might be tempted to make this change directly via Github. However, it is best to avoid this as it will cause issues that require more advanced Git knowledge than we want to go over at this stage (it is covered in a future lesson), for now it is advised to make any changes via your local files then commit and push them using Git commands in your terminal once ready.

#### Cheatsheet

This is a reference list of the most commonly used Git commands. (You might consider bookmarking this handy page.) Try to familiarize yourself with the commands so that you can eventually remember them all:

- Commands related to a remote repository:
  - `git clone git@github.com:USER-NAME/REPOSITORY-NAME.git`
  - `git push` or `git push origin main` (Both accomplish the same goal in this context)
- Commands related to the workflow:
  - `git add .`
  - `git commit -m "A message describing what you have done to make this snapshot different"`
- Commands related to checking status or log history
  - `git status`
  - `git log`

The basic Git syntax is `program | action | destination`.

For example,

- `git add .` is read as `git | add | .`, where the period represents everything in the current directory;
- `git commit -m "message"` is read as `git | commit -m | "message"`; and
- `git status` is read as `git | status | (no destination)`.

#### Git best practices

There's a lot to learn about using Git. But it is worth taking the time to highlight some best practices so that you can be a better collaborator. Git is not only helpful when collaborating with others. It's also useful when working independently. You will be relying more and more on your own commit history in the future when revisiting old code.

Two helpful best practices to consider are **atomic commits** and leveraging those atomic commits to make your commit messages more useful to future collaborators.

An atomic commit is a commit that includes changes related to only one feature or task of your program. There are two main reasons for doing this: first, if something you change turns out to cause some problems, it is easy to revert the specific change without losing other changes; and second, it enables you to write better commit messages. You'll learn more about what a good commit message looks like in a future lesson!

#### Changing the Git commit message editor

If you are using *Visual Studio Code* (and you should be if you're following this curriculum), there's a way to ensure that if you use `git commit` without the message flag (`-m`), you won't get stuck writing your commit message in [Vim](<https://en.wikipedia.org/wiki/Vim_(text_editor)>).

Changing the default message editor is a good idea in case you accidentally omit the flag, unless you prefer using Vim. There is no downside to changing it, because you will have the option to write your commit messages in the terminal or in the comfort of VS Code.

The following command will set this configuration. Type (or copy & paste) this command into your terminal and hit <kbd>Enter</kbd>.

```bash
git config --global core.editor "code --wait"
```

There will be no confirmation or any output on the terminal after entering this command.

With that done, you can now choose to use either `git commit -m "your message here"` or `git commit` to type your message with Visual Studio Code!

To make a commit with Visual Studio Code as the text editor, just type `git commit`. After you hit <kbd>Enter</kbd> a new tab in VS Code will open for you to write your commit message. You may provide more details on multiple lines as part of your commit message. After typing your commit message, save it <kbd>Ctrl</kbd> + <kbd>S</kbd> (Mac: <kbd>Cmd</kbd> + <kbd>S</kbd>) and close the tab. If you return to the command line, you will see your commit message and a summary of your changes.

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How do you create a new repository on GitHub?](#new-github-repo)
- [How do you copy a repository onto your local machine from GitHub?](#github-to-local)
- [What is the default name of your remote connection?](#default-remote)
- [Explain what `origin` is in `git push origin main`.](#origin-push)
- [Explain what `main` is in `git push origin main`.](#main-push)
- [Explain the two-stage system that Git uses to save files.](#two-stages)
- [How do you check the status of your current repository?](#git-status)
- [How do you add files to the staging area in git?](#git-add)
- [How do you commit the files in the staging area and add a descriptive message?](#git-commit)
- [How do you push your changes to your repository on GitHub?](#git-push)
- [How do you look at the history of your previous commits?](#git-log)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Complete Git and GitHub Tutorial from Basics to Advanced](https://www.youtube.com/watch?v=apGV9Kg7ics) - by Kunal Kushwaha
- [Git - Reference](https://git-scm.com/docs)
- [GitHub guide on adding locally hosted code](https://docs.github.com/en/migrations/importing-source-code/using-the-command-line-to-import-source-code/adding-locally-hosted-code-to-github) walks you through creating a git repository from a local folder and adding it to GitHub.
