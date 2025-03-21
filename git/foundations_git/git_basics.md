### Introduction

In this lesson, we'll cover the essential Git commands used to manage your projects and upload your work to GitHub. These commands form the **basic Git workflow**, which you'll use 70-80% of the time when working with Git. Mastering these commands will put you well on your way to becoming proficient with Git!

---

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to create a repository on GitHub.
- How to transfer files to and from GitHub.
- How to take "snapshots" of your code using Git.

---

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Before you start!

- **Check Your Git Version**: GitHub recently updated its default branch naming convention. Ensure you're using Git version 2.28 or later by running:
  ```bash
  git --version
  ```

- **Set Default Branch to `main`**: If you haven't already, set your local default Git branch to `main`:
  ```bash
  git config --global init.defaultBranch main
  ```

- **Learn More**: For details on the change from `master` to `main`, see [GitHub's Renaming Repository](https://github.com/github/renaming).

---

#### Create the repository

1. **Create a GitHub Account**: If you haven't already, create a GitHub account as outlined in the [Setting Up Git](https://www.theodinproject.com/lessons/foundations-setting-up-git) lesson.

1. **Create a New Repository**:
   - On the GitHub homepage, click the "+" button in the top-right corner and select "New repository".
   - Name your repository `git_test` and check "Add a README file".
   - Click "Create repository" at the bottom of the page.

1. **Clone the Repository**:
   - After creating the repository, click the green "Code" button and select the SSH option.
   - Copy the SSH URL provided.

1. **Set Up Local Directory**:
   - Create a directory for your projects:
     ```bash
     mkdir ~/repos
     cd ~/repos
     ```
   - Clone the repository:
     ```bash
     git clone git@github.com:USER-NAME/git_test.git
     ```

1. **Verify Remote Connection**:
   - Navigate into the cloned repository:
     ```bash
     cd git_test
     ```
   - Check the remote connection:
     ```bash
     git remote -v
     ```
   - You should see output similar to:
     ```bash
     origin  git@github.com:USER-NAME/git_test.git (fetch)
     origin  git@github.com:USER-NAME/git_test.git (push)
     ```

---

#### Use the Git workflow

1. **Create a New File**:
   - Create a file named `hello_world.txt`:
     ```bash
     touch hello_world.txt
     ```

1. **Check Status**:
   - Run `git status` to see the untracked file:
     ```bash
     git status
     ```

1. **Stage the File**:
   - Add the file to the staging area:
     ```bash
     git add hello_world.txt
     ```
   - Verify the staging area:
     ```bash
     git status
     ```

1. **Commit the Changes**:
   - Commit the file with a message:
     ```bash
     git commit -m "Add hello_world.txt"
     ```
   - Check the status again:
     ```bash
     git status
     ```

1. **View Commit History**:
   - View your commit history:
     ```bash
     git log
     ```

---

#### Modify files

1. **Edit README.md**:
   - Open `README.md` in a text editor (e.g., Visual Studio Code):
     ```bash
     code README.md
     ```
   - Add "Hello Odin!" to the file and save it.

1. **Stage and Commit Changes**:
   - Stage the changes:
     ```bash
     git add README.md
     ```
   - Commit the changes:
     ```bash
     git commit -m "Edit README.md"
     ```

1. **Edit and Stage Multiple Files**:
   - Modify `hello_world.txt` and stage all changes:
     ```bash
     git add .
     ```
   - Commit the changes:
     ```bash
     git commit -m "Edit README.md and hello_world.txt"
     ```

---

#### Push your work to GitHub

1. **Push Changes**:
   - Push your commits to GitHub:
     ```bash
     git push origin main
     ```
   - Alternatively, you can use:
     ```bash
     git push
     ```

1. **Verify the Push**:
   - Check the status:
     ```bash
     git status
     ```
   - Refresh your GitHub repository page to see the updated files.

</div>

---

### Avoid editing directly on GitHub

While it might be tempting to make quick changes directly on GitHub, it's best to avoid this practice. Direct edits can cause issues that require advanced Git knowledge to resolve. Always make changes locally, then commit and push them using Git commands.

---

### Cheatsheet

This is a reference list of the most commonly used Git commands. (You might consider bookmarking this handy page.) Try to familiarize yourself with the commands so that you can eventually remember them all:

- **Remote Repository Commands**:
  - Clone a repository:
    ```bash
    git clone git@github.com:USER-NAME/REPOSITORY-NAME.git
    ```
  - Push changes:
    ```bash
    git push origin main
    ```

- **Workflow Commands**:
  - Stage changes:
    ```bash
    git add .
    ```
  - Commit changes:
    ```bash
    git commit -m "Your commit message"
    ```

- **Status and Log Commands**:
  - Check status:
    ```bash
    git status
    ```
  - View commit history:
    ```bash
    git log
    ```

---

### Git best practices

There's a lot to learn about using Git. But it is worth taking the time to highlight some best practices so that you can be a better collaborator. Git is not only helpful when collaborating with others. It's also useful when working independently. You will be relying more and more on your own commit history in the future when revisiting old code.

Two helpful best practices to consider are **atomic commits** and leveraging those atomic commits to make your commit messages more useful to future collaborators.

An atomic commit is a commit that includes changes related to only one feature or task of your program. There are two main reasons for doing this: first, if something you change turns out to cause some problems, it is easy to revert the specific change without losing other changes; and second, it enables you to write better commit messages. You'll learn more about what a good commit message looks like in a future lesson!

---

### Change the Git commit message editor

To use Visual Studio Code as your default Git commit message editor, run:
```bash
git config --global core.editor "code --wait"
```
Now, you can use `git commit` to write commit messages in VS Code.

---

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How do you create a new repository on GitHub?](#create-the-repository)
- [How do you clone a repository to your local machine?](#clone-the-repository)
- [What is the default name of your remote connection?](#verify-remote-connection)
- [What does `origin` mean in `git push origin main`?](#push-your-work-to-github)
- [What does `main` refer to in `git push origin main`?](#push-your-work-to-github)
- [Explain Git's two-stage system for saving files.](#use-the-git-workflow)
- [How do you check the status of your repository?](#check-status)
- [How do you add files to the staging area?](#stage-the-file)
- [How do you commit changes with a message?](#commit-the-changes)
- [How do you push changes to GitHub?](#push-your-work-to-github)
- [How do you view your commit history?](#view-commit-history)

---

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
