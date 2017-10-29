# Project: Git Remotes

In this project we will be forking TheOdinProject curriculum and learning to add your name and a link to your profile on GitHub through a pull request. This is a common way to contribute to open source software on GitHub and valuable skill. Your pull request will be reviewed by the team at TheOdinProject and once approved it will appear on TheOdinProject/Curriculum and be used to create an honor roll.

## Learning Outcomes
*By the end of this project you should be able to:*
* Fork an existing repository from GitHub and download it to you local machine.
* Add an additional remote to git so you can update your fork to include any changes from the original repository after it is forked.
* Create a new branch, make changes and push your updates to the forked repository.
* Create a pull request on GitHub to the administrators of the repository so it can be merged into the original code.
* Feel comfortable with the process outlined below and be able to contribute to open source projects with pull requests of bug fixes or documentation improvements as you move through TheOdinProject.

## Your Task
1. Go to [TheOdinProject'scurriculum GitHub](https://github.com/TheOdinProject/curriculum)  repository. The files within this repository make up the lessons within [TheOdinProject](http://www.theodinproject.com/) and fork the repository by clicking the button shown below.
  <a href="http://i.imgur.com/LdVgtOp.png"><img class="tutorial-img" src="http://i.imgur.com/LdVgtOp.png" title="Click Fork icon" /></a>
2. After a short wait you should now have your own fork of the GitHub repository at `https://github.com/Your-GitHub-Username/curriculum`. You now have a copy of the curriculum and are free to make changes to it and take it in a different direction or add your own features.
3. However, for our project we will keep our fork the same and create a branch that is only different in the `git/student_list.md` file by adding your name and a link to your GitHub repository. In terminal cd into the folder where you would like to place your forked copy of the curriculum and clone it with this line `git clone https://github.com/Your-GitHub-Username/curriculum.git`
4. In terminal `cd curriculum` to get into the root folder of the curriculum. When you cloned it you get a complete copy of the project and it's git with a remote back to your fork on GitHub:
  ```language-bash
  ~/curriculum$ git remote -v
  origin  git@github.com:105ron/curriculum.git (fetch)
  origin  git@github.com:105ron/curriculum.git (push)
  ```
5. We can also add additional remotes to git. We will add TheOdinProject's original curriculum and call it upstream with this command:
  ```language-bash
  ~/curriculum$ git remote add upstream https://github.com/theodinproject/curriculum.git
  ```
6. Now you can see `git remote -v` returns four results. We can `fetch` and `push` to `origin` and also `fetch` and `push` to `upstream`. Though if you try to change the TheOdinProjects repository and `git push upstream master` you will see that:
  ```language-bash
  curriculum$ git push upstream master
  remote: Permission to theodinproject/curriculum.git denied to odin-student.
  fatal: unable to access 'https://github.com/theodinproject/curriculum.git/': The requested URL returned error: 403
  ```
7. Error 403 is the HTTP status code which means that accessing the resource is forbidden. The creator of the repository can assign who has admin and write access. You can however still `fetch` and `pull` from upstream in this case. This allows you to `pull` from `TheOdinProject/curriculum` and push to your fork on GitHub which allows your fork to keep up to date with new commits on `TheOdinProject/curriculum`.
8. GitHub allows us to make a pull request which can then be reviewed by admin/moderators of the repository, which is what we will do now. We create a new branch, modify our feature, push it to GitHub and create a pull request on the site. The admin/moderators can then view the changes, reject the pull request, suggest modifications before it is accepted or merge it into their repository, making you a contributor to the original repository.
8. The first step is to create a branch called `new-student`:
  ```language-bash
  curriculum$ git checkout -b new-student
  ```
9. You are now working on the new-student branch. Open `git/student_list.md` and add your name and link to your GitHub in Markdown syntax on line two like so:
  ```
  * [Odin-Student](https://github.com/odin-student)  
  ```
and save it.
10. Add the file to the staging area and commit it. We want to  push the `new-student` branch to GitHub like so:
    
  ```language-bash
  curriculum$ git commit -am "add my name to student_list.md"
  curriculum$ git push origin new-student
  ```
11. Now when you view the forked repository on GitHub you will see it is ready to create the pull request:
  <a href="http://i.imgur.com/nPZpeHY.png"><img class="tutorial-img" src="http://i.imgur.com/nPZpeHY.png" title="Click Compare & Pull Request" /></a>
12. Once we click that we can add a message to the person who is going to accept or reject the pull request. In this case the standard message is fine.
  <a href="http://i.imgur.com/PEfej8w.png"><img class="tutorial-img" src="http://i.imgur.com/PEfej8w.png" title="Click Create Pull Request" /></a>
13. As you can see below the person viewing the pull request before approving it to be merged into `TheOdinProject/curriculum:Master` can see a summary of all the lines you have changed.
  <a href="http://i.imgur.com/XaRdf46.png"><img class="tutorial-img" src="http://i.imgur.com/XaRdf46.png" title="View changes to files" /></a>
14. Success! Now all that is needed is for TheOdinProject to approve your submission. You're first contribution to an open source project on GitHub. Although it is a minor contribution the process for any contribution to any repository you find on GitHub is the same as outlined here. So now when you have suggestions to improve the TheOdinProject's curriculum you can now create a pull request and help your fellow students. It's a team effort, go forth and help the open source community!

## Helpful Links
* [GitHub Forking](https://gist.github.com/Chaser324/ce0505fbed06b947d962)
