### Introduction

In this lesson, we'll cover the essential Git commands used to manage your projects and upload your work to GitHub. These commands form the **basic Git workflow**, which you'll use 70-80% of the time when working with Git. Mastering these commands will put you well on your way to becoming proficient with Git!

### Lesson Overview

This section provides a general overview of the topics you'll learn in this lesson:

- How to create a repository on GitHub.
- How to transfer files to and from GitHub.
- How to take "snapshots" of your code using Git.

---

### Assignment

#### Before You Start!

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

#### Create the Repository

1. **Create a GitHub Account**: If you haven't already, create a GitHub account as outlined in the [Setting Up Git](https://www.theodinproject.com/lessons/foundations-setting-up-git) lesson.

2. **Create a New Repository**:
   - On the GitHub homepage, click the "+" button in the top-right corner and select "New repository".
   - Name your repository `git_test` and check "Add a README file".
   - Click "Create repository" at the bottom of the page.

3. **Clone the Repository**:
   - After creating the repository, click the green "Code" button and select the SSH option.
   - Copy the SSH URL provided.

4. **Set Up Local Directory**:
   - Create a directory for your projects:
     ```bash
     mkdir ~/repos
     cd ~/repos
     ```
   - Clone the repository:
     ```bash
     git clone git@github.com:USER-NAME/git_test.git
     ```

5. **Verify Remote Connection**:
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

#### Use the Git Workflow

1. **Create a New File**:
   - Create a file named `hello_world.txt`:
     ```bash
     touch hello_world.txt
     ```

2. **Check Status**:
   - Run `git status` to see the untracked file:
     ```bash
     git status
     ```

3. **Stage the File**:
   - Add the file to the staging area:
     ```bash
     git add hello_world.txt
     ```
   - Verify the staging area:
     ```bash
     git status
     ```

4. **Commit the Changes**:
   - Commit the file with a message:
     ```bash
     git commit -m "Add hello_world.txt"
     ```
   - Check the status again:
     ```bash
     git status
     ```

5. **View Commit History**:
   - View your commit history:
     ```bash
     git log
     ```

---

#### Modify Files

1. **Edit README.md**:
   - Open `README.md` in a text editor (e.g., Visual Studio Code):
     ```bash
     code README.md
     ```
   - Add "Hello Odin!" to the file and save it.

2. **Stage and Commit Changes**:
   - Stage the changes:
     ```bash
     git add README.md
     ```
   - Commit the changes:
     ```bash
     git commit -m "Edit README.md"
     ```

3. **Edit and Stage Multiple Files**:
   - Modify `hello_world.txt` and stage all changes:
     ```bash
     git add .
     ```
   - Commit the changes:
     ```bash
     git commit -m "Edit README.md and hello_world.txt"
     ```

---

#### Push Your Work to GitHub

1. **Push Changes**:
   - Push your commits to GitHub:
     ```bash
     git push origin main
     ```
   - Alternatively, you can use:
     ```bash
     git push
     ```

2. **Verify the Push**:
   - Check the status:
     ```bash
     git status
     ```
   - Refresh your GitHub repository page to see the updated files.

---

### Avoid Editing Directly on GitHub

While it might be tempting to make quick changes directly on GitHub, it's best to avoid this practice. Direct edits can cause issues that require advanced Git knowledge to resolve. Always make changes locally, then commit and push them using Git commands.

---

### Cheatsheet

Here’s a quick reference list of the most commonly used Git commands:

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

### Git Best Practices

1. **Atomic Commits**: Make commits that focus on a single feature or task. This makes it easier to revert changes if needed and improves the clarity of your commit history.
2. **Descriptive Commit Messages**: Write clear and concise commit messages to help collaborators (and your future self) understand the changes.

---

### Change the Git Commit Message Editor

To use Visual Studio Code as your default Git commit message editor, run:
```bash
git config --global core.editor "code --wait"
```
Now, you can use `git commit` to write commit messages in VS Code.

---

### Knowledge Check

Test your understanding by answering these questions:

- How do you create a new repository on GitHub?
- How do you clone a repository to your local machine?
- What is the default name of your remote connection?
- What does `origin` mean in `git push origin main`?
- What does `main` refer to in `git push origin main`?
- Explain Git's two-stage system for saving files.
- How do you check the status of your repository?
- How do you add files to the staging area?
- How do you commit changes with a message?
- How do you push changes to GitHub?
- How do you view your commit history?

---

### Additional Resources

This section will include helpful links to related content. Stay tuned for updates!

---
