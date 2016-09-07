## The Basics of how git works
< In this blurb we should talk about what this lesson will include, the commands used here will be the ones you will probably
use the most with git etc

## Learning Outcomes

*By the end of this lesson you should understand the following*

* How do you create a new Git repository for a project locally?
* How do you create it on Github?
* How do you commit changes?
* What is the difference between staging and committing changes?
* What is the difference between committing your changes and pushing them to Github?
* How do you check the status of your current repo in git?
* How do you see the history of your previous commits (from the command line)?
* How can you look through your historical commits on the Github website?


## Assignment:

< do we need any more assignments other than this? >
1.[try git from codeschool](https://try.github.io/levels/1/challenges/1) this goes into branches and merging in the later parts don't worry if you don't understand these too well after going through this lesson. Those concepts will be covered in more detail in a later lesson.



## Basics of git tutorial

### The two approaches for setting up a new project with GIT
There are two options available to you in regards to setting up git with a new project.

### Create your project on Github first
1. You should have created a github account in the [installations](http://www.theodinproject.com/web-development-101/installations) project.
   If you haven't done that yet you can sign up here [github](https://github.com/)
2. Create a new repository by clicking the button shown in the screen shot below.
3. Give your repository the name "git_test" in the repository name input field.
4. Check the "Initialize this repository with a README" option and finally create the repository by clicking the green "create repository" button at the bottom of the page.
5. This will redirect you to your new repository on github. To get this repository onto your local machine copy the url in the adress bar of your browser for your repository.
6. In your command line on your local machine navigate to where you want to store this project and then clone your repository on github onto your computer with `git clone` followed by the url you copied for your repository in the last step. The full command should look something like this `git clone https://github.com/YourUsername/git_test`.


7. Thats it, you have successfully connected the repository you created on github to your machine.
   to test this enter `git remote -v` in your command line. This will display the url of the repository you created
   in github as your remote. You might have also noticed

### Create your project on your computer first
1. In your command line create a new folder called "testing_git"
2. Go into this new folder `cd testing_git`
3. Now we will initialize it with git by entering `git init`
4. Go to github and create a new repository, name it `testing_git` **Note: It's important to your repository the same name as the name of the folder you created on your local machine.**
5. Check the initialize with read me option and create the new repository. This will redirect you to your new repo on Github.
6. Back on your command line enter `git remote -v` notice that its empty. This project isn't connected to any remote github repositories. Lets fix that.
7. Go to the testing_git repository on github and copy and paste the url. Back in your command line enter: `git remote add origin` followed by the url you copied. The full command will look something like this: `git remote add origin https://github.com/yourname/testing_git`
**Note: `origin` will be the name of your remote connection, you could call it anything you want but origin is convention.**
8. Enter `git remote -v` again, you should now have a connection to your remote github repository.   



## GIT workflow
1. change directories into the git_test folder you cloned onto your machine.
2. Create a new file in git_test called "hello_world.txt" 
3. type `git status in your terminal` notice your hello_world.rb file is in red, this means it is un-staged.
4. type `git add hello_word.txt` this adds your hello_world.txt file to staging area in git.
5. now type `git status` again, notice your file is now green.
6. now type `git commit -m "Initial commit"` and type `git status again` notice it now outputs "nothing to commit" your changes have been committed.

##Intermission

A *save* in git is divided into two terminal commands: **add** and **commit**. This gives you control of exactly what you want to be remembered in your snapshot.

###The staging Area
Think of `add` as adjusting the number of people or elements to be included in your photo.

With Git you choose the changes you want to save with `git add`. Imagine a project that contains multiple files and you have made changes to several of them. You want to save some of the changes you have made and leave some other changes to continue working on them.

###Committing

Think of `commit` is actually taking the photo, resulting in a snapshot.

We used this command to commit the hello_world.txt file `git commit -m "Initial commit"` the `-m` flag stands for message and must always be followed by a message in quotes in our case `"Initial commit"`.

#todo in the next part we will edit the file again and add another file to repeat the basic commands so the student can get used to them
Now we will add another file into the mix.

7. Create a new file in the `git_test` folder and call it `hello_mars.txt`.
8. In your terminal and type `git status`, notice `hello_mars.txt` is un-staged.
9. Now open the `hello_word.txt` in your text editor of choice and add "Inside the hello world file".
10. Back in your terminal enter `git status`, notice that `hello_word.txt` is now un-staged again.
11. Add `hello_word.txt` to the staging area with `git add hello_word.txt`
12. Can you guess what `git status` will output now? `hello_word.txt` will be displayed in green text and `hello_mars.txt` will still be in red. This means only `hello_world.txt` has been added to the staging area.
13. Now lets add `hello_mars.txt` to staging area with a different variation of add `git add .` this full stop means add all un-staged files.
14. Enter `git status` once more, everything has now been added to the staging area.
15. Finally lets commit all of our changes `git commit -m "Added hello mars file and added a line to hello world"`
16. Enter `git status` once more, nothing to commit.


<!-- question for cs rail
  Should we task them with setting up a repo on github at the beginning or the end? I'm thinking the beginning.
  -->
