# Project: Git Basics
This short project will demonstrate how to use git to manage and archive your project folders:

1. You will set up a remote repository on GitHub and then move it down onto your local machine.
2. Once this repo is set up locally, you will be able to use git like a save button for your files and folders.
3. When you have finalised your saves you can then push your local repo up onto GitHub to share with everyone!


## Learning Outcomes
*By the end of this you should be able to:*

* Create a Git repository on GitHub and move it onto your local machine
* Describe the difference between staging and committing changes
* Describe the difference between committing your changes and pushing them onto GitHub
* Check the status of your current repository from the command line
* Look at the history of your previous commits from the command line


## Basics of Git Project
Here we will describe the basic git workflow that you will use with your projects, follow along with each of the steps.

### Create your repository on Github
1. You should have created a github account in the [installations](https://www.theodinproject.com/courses/web-development-101/lessons/installations) project. If you haven't done that yet you can sign up [here](https://github.com/).

2. Create a new repository by clicking the button shown in the screenshot below.
  <a href="http://imgur.com/kbMCvCK"><img class="tutorial-img" src="http://i.imgur.com/kbMCvCK.png" title="source: imgur.com" /></a>
3. Give your repository the name "git_test" in the repository name input field and create the repository by clicking the green "create repository" button at the bottom of the page.

4. This will redirect you to your new repository on GitHub. To get this repository onto your local machine copy the url in the address bar of your browser for your repository.
  <a href="http://imgur.com/89vxeKi"><img class="tutorial-img" src="http://i.imgur.com/89vxeKi.png" title="source: imgur.com" /></a>
5. In your command line on your local machine, navigate to where you want to store this project and then clone your repository on github onto your computer with `git clone` followed by the url you copied for your repository in the last step. The full command should look something like this `git clone https://github.com/YourUsername/git_test`.
  <a href="http://imgur.com/HFQtIs4"><img class="tutorial-img" src="http://i.imgur.com/HFQtIs4.png?1" title="source: imgur.com" /></a>
6. Thats it! You have successfully connected the repository you created on GitHub to your local machine. To test this you can `cd` into the new *git_test* folder that was downloaded with the git clone and enter `git remote -v` in your command line. This will display the url of the repository you created in GitHub as your remote. You may have also noticed the word **origin** at the start of the `git remote -v` output. This is the name of your remote connection, it could have been named anything for example "party-parrot" or "dancing-banana" but origin is both the default and the convention. (Don't worry about the details of origin for now, it will come up again near the end of the tutorial.)
  <a href="http://imgur.com/oTb22tn"><img class="tutorial-img" src="http://i.imgur.com/oTb22tn.png" title="source: imgur.com" /></a>

## GIT workflow
1. Create a new file in git_test called "README.md"
  <a href="http://imgur.com/l4jEMwE"><img class="tutorial-img" src="http://i.imgur.com/l4jEMwE.png" title="source: imgur.com" /></a>
2. Type `git status` in your terminal notice your *README.md* file is in red, this means it is un-staged.
  <a href="http://imgur.com/SE9V63c"><img class="tutorial-img" src="http://i.imgur.com/SE9V63c.png" title="source: imgur.com" /></a>
3. Type `git add README.md` this adds your *README.md* file to staging area in git. Now type `git status` again, notice your file is now green.
  <a href="http://imgur.com/Ntpmh2u"><img class="tutorial-img" src="http://i.imgur.com/Ntpmh2u.png" title="source: imgur.com" /></a>
4. Now type `git commit -m "Added README"` and then type `git status` once more and notice that the output contains "*nothing to commit*". Your changes have been committed.
  <a href="http://imgur.com/kK5IT51"><img class="tutorial-img" src="http://i.imgur.com/kK5IT51.png" title="source: imgur.com" /></a>
5. Now type `git log` and look at its output. You should see a historical entry for your commit: *Added README*. You will also see details on the author who made the commit and the date time for when it was made.

## How does git save files?
A *save* in git is divided into two terminal commands: **add** and **commit**. The combination of these two commands gives you control of exactly what you want to be remembered in your snapshot.

###The staging Area
Think of `add` as adjusting the number of people or elements to be included in a photo.

With Git you choose the changes you want to save with `git add`. Imagine a project that contains multiple files and you have made changes to several of them. You want to save some of the changes you have made and leave some other changes to continue working on them.

###Committing
Think of `commit` as actually taking a photo, resulting in a snapshot.

We used this command to commit the *README.md* file `git commit -m "Added README"` the `-m` flag stands for message and must always be followed by a message in quotes in our case `"Added README"`.

## Adding another file into the mix.

1. Create a new file in the `git_test` folder and call it `hello_world.txt`. In your terminal type `git status`, notice `hello_world.txt` is un-staged.
  <a href="http://imgur.com/nW0a6cA"><img class="tutorial-img" src="http://i.imgur.com/nW0a6cA.png" title="source: imgur.com" /></a>
2. Now open the *README.md* in your text editor of choice and add "This is (YourUsername)'s first git project!" and then save the file.
  <a href="http://imgur.com/oohqJt0"><img class="tutorial-img" src="http://i.imgur.com/oohqJt0.png" title="source: imgur.com" /></a>
3. Back in your terminal enter `git status`, notice that *README.md* is now un-staged again.
  <a href="http://imgur.com/cUVKbjT"><img class="tutorial-img" src="http://i.imgur.com/cUVKbjT.png" title="source: imgur.com" /></a>
4. Add *README.md* to the staging area with `git add README.md`
5. Can you guess what `git status` will output now? *README.md* will be displayed in green text while *hello_world.txt* will still be in red. This means only *README.md* has been added to the staging area.
  <a href="http://imgur.com/12diOu9"><img class="tutorial-img" src="http://i.imgur.com/12diOu9.png" title="source: imgur.com" /></a>
6. Now lets add *hello_world.txt* to staging area with a different variation of add `git add .` - the full stop means add all un-staged files. Then enter `git status` once more, everything should now been added to the staging area.
  <a href="http://imgur.com/799uu2c"><img class="tutorial-img" src="http://i.imgur.com/799uu2c.png" title="source: imgur.com" /></a>
9. Finally, lets commit all of our files in the staging area and give a descriptive commit message `git commit -m "Added hello world file and added a line to README"`. Then enter `git status` once again, this will output `nothing to commit`.
  <a href="http://imgur.com/Vi5u2Ei"><img class="tutorial-img" src="http://i.imgur.com/Vi5u2Ei.png" title="source: imgur.com" /></a>
10. Have one last look at your history of commits with `git log`. You should now see two entries made!

## Pushing your finished work to github
Finally lets upload what you have done to the Github repository you created at the start of this tutorial

1. Simply enter `git push origin master`.
  <a href="http://imgur.com/aJvoHx6"><img class="tutorial-img" src="http://i.imgur.com/aJvoHx6.png" title="source: imgur.com" /></a>
2. Now enter `git status` one final time, it should output "*up to date with origin master*"
  <a href="http://imgur.com/l5y50J8"><img class="tutorial-img" src="http://i.imgur.com/l5y50J8.png" title="source: imgur.com" /></a>

## What is origin master?
As mentioned before, **origin** is a placeholder name, or branch, for the remote url of the git_test repository which you set up on Github at the beginning of this tutorial. You can use *origin* to access your remote without having to enter a full url each time. It also means you can have multiple different remotes by giving each a unique name.

**master** is the branch you want to push your changes to. We will get more into branches in a later lesson, the main thing to remember is that *master* is the official branch in your projects where production-ready code lives.

## Conclusion
The main take away from what you have learnt about Git over the past few lessons is how to use Git with your projects and upload them to Github. You now have the ability to do that. This is a very powerful skill that will help you out immensely when we get into the coding projects; you will be able to share your work with others for code reviews and get help with your code if you are stuck.

In later git lessons we will cover some of the more advanced git features such as branches which will expand your abilities even more and make your workflow on projects more productive.

For now concentrate on using the basics of Git which you have learnt here with all the projects ahead of you until the point where you know each of the basic Git commands from memory.  
