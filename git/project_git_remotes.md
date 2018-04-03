# Project: Git Remotes

In this project we will fork The Odin Project's curriculum repository to add your name and a link to your Github Profile through a pull request. This is a common way to contribute to open source software on GitHub and valuable skill. Your pull request will be reviewed by the team at TheOdinProject and once approved it will appear on TheOdinProject/Curriculum. It might even be used to create an honor roll (so pay attention!).

## Learning Outcomes
*By the end of this project you should be able to:*
* Fork an existing repository from GitHub and download it to you local machine.
* Add an additional remote so you can update your fork to include any changes from the original repository.
* Create a new branch, make changes and push your updates.
* Create a pull request on GitHub so your changes can be merged.
* Feel comfortable with the process outlined below 
* Be able to contribute to open source projects with pull requests of bug fixes or documentation improvements as you move through TheOdinProject.

## Your Task
1. Go to [TheOdinProject'scurriculum GitHub](https://github.com/TheOdinProject/curriculum)  repository. The files within this repository make up the lessons within [TheOdinProject](http://www.theodinproject.com/). Fork this repository by clicking the "Fork" button as shown below.
  <a href="http://i.imgur.com/LdVgtOp.png"><img class="tutorial-img" src="http://i.imgur.com/LdVgtOp.png" title="Click Fork icon" /></a>
2. After a short wait you should now have your own fork of the GitHub repository at `https://github.com/Your-GitHub-Username/curriculum`. This is a copy of the curriculum. You are free to make changes to it, update content, or add your own features.
3. For this project we will keep things small and create a new branch where the only change is to `git/student_list.md`.  We will change it by adding your name and a link to your GitHub repository. In your terminal, `cd` into the folder where you would like to place your forked copy of the curriculum and clone it by typing `git clone https://github.com/Your-GitHub-Username/curriculum.git`
4. In the terminal, `cd curriculum` to get into the root folder of the curriculum. With `git clone` you download a complete copy of the curriculum with a reference (remote) back to your fork on GitHub. To see all the remotes of a repository, type
  ```language-bash
  ~/curriculum$ git remote -v
  origin  git@github.com:105ron/curriculum.git (fetch)
  origin  git@github.com:105ron/curriculum.git (push)
  ```
5. We can also add additional remotes to git. We will add TheOdinProject's original curriculum repository and call it `upstream` with this command:
  ```language-bash
  ~/curriculum$ git remote add upstream https://github.com/theodinproject/curriculum.git
  ```
6. Now you can see, (using `git remote -v`) there are four remote branches. We can `fetch` and `push` to both `origin` and `upstream`. Though if you try to change the TheOdinProjects repository and `git push upstream master` you will see that it's not permitted:
  ```language-bash
  curriculum$ git push upstream master
  remote: Permission to theodinproject/curriculum.git denied to odin-student.
  fatal: unable to access 'https://github.com/theodinproject/curriculum.git/': The requested URL returned error: 403
  ```
7. The response error 403 is the HTTP status code which basically means that you don't have access. The creator of the repository can assign who has admin and write access. TheOdinProject/curriculum is set up so you can still `fetch` and `pull`, just not `push`. So how do you make changes? 
8. To make changes, we will follow this process: Make new branch >> Pull any changes >> Make changes >> Add >> Commit >> Push to Github
9. From there, GitHub allows us to make a pull request to the main TheOdinProject/curriculum repository. Let's get started.
10. The first step is to create a branch called `new-student`:
  ```language-bash
  curriculum$ git checkout -b new-student
  ```
11. You are now working on the new-student branch and can pull any changes to TheOdinProject/curriculum since you've last updated. To do this, type `git pull upstream master` into your terminal. If you've just forked this repository there may not be any changes.

  ```language-bash
  curriculum$ git pull upstream master
  ```

12. It's now time to make your changes. Open `git/student_list.md` in your text editor and add your name and link to your GitHub in Markdown syntax on line two like so:
  ```
  * [Odin-Student](https://github.com/odin-student)  
  ```
then save the file.
13. The next steps are to add the changed file to the staging area and commit it.  To see what files have changed, you can use `git status`. Then, to add the files to statging area you type `git add git/student_list.md ` (you may have to change the file location if it's not the same). Lastly, you'll commit these changes by typing `git commit -m "Commit Message Here"`.  In the end, it will look something like this:
  ```language-bash
  curriculum$ git status
  On branch master
  << Truncated >>
  Changes not staged for commit:
      modified: git/student_list.md
      
  curriculum$ git add git/student_list.md
  
  curriculum$ git commit -m "add my name to student_list.md"
  [new-student d4aed63] add my name to student_list.md
  1 file changed, 1 insertations
  
  curriculum$ git push origin new-student
  Counting objects: 7, done.
  << Truncated >>
  To https://github.com/odin-student/curriculum.git
    d4aed63..72afe28 new-student -> new-student
  ```
Success!

14. Now when you log into github and view your forked repository you will see it is ready to create the pull request:
  <a href="http://i.imgur.com/nPZpeHY.png"><img class="tutorial-img" src="http://i.imgur.com/nPZpeHY.png" title="Click Compare & Pull Request" /></a>
15. Click on the Compare & Pull Request button. Optionally, you can add a message to the person who is going to accept or reject the pull request. In this case the standard message is fine.
  <a href="http://i.imgur.com/PEfej8w.png"><img class="tutorial-img" src="http://i.imgur.com/PEfej8w.png" title="Click Create Pull Request" /></a>
16. The Odin moderator viewing the pull request can see a summary of all the lines you've changed before merging it into `TheOdinProject/curriculum:Master`.
  <a href="http://i.imgur.com/XaRdf46.png"><img class="tutorial-img" src="http://i.imgur.com/XaRdf46.png" title="View changes to files" /></a>
17. Success! Now all that is needed is for TheOdinProject to approve your submission. You've completed your first contribution to an open source project on GitHub. Although this was minor, the process for any contribution to a GitHub repository is the same as outlined here. So, when you have suggestions to improve the TheOdinProject's curriculum you can now create a pull request and help your fellow students. It's a team effort, go forth and help the open source community!

## Helpful Links
* [GitHub Forking](https://gist.github.com/Chaser324/ce0505fbed06b947d962)
