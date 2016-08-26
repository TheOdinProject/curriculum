## The Basics of how git works
In this section we will describe the basics of adding git to a project and the basic work flow of staging and committing files as well as pushing them to a remote. A small exercise can be added here to too. One of the assignments should be codeschools try git.

1.[try git from codeschool](https://try.github.io/levels/1/challenges/1) this goes into branches and merging in the later parts dont worry if you dont understand these too well after going through this lesson. Those concepts will be covered in more detail in a later lesson.

Here we will describe the basic git workflow that you will use with your projects, feel free to follow along with this
<-- screen shots will be provided!->

1. Created a new folder called git_test and add a file called hello_world.txt
2. to initialize git we use `git init` this creates a hidden folder called .git/ where configuration settings for git will be stored
3. type `git status in your terminal` notice your hello_world.rb file is in red
4. type `git add hello_word.txt` this adds your hello_world.txt file to staging area in git.
5. now type `git status` again, notice your file is now green.
6. now type `git commit -m "Initial commit"` and type `git status again` notice it now outputs "nothing to commit" your changes have been commited.

**Intermission:**

The staging Area
as mentioned `git add hello_word.txt` adds your new files to the staging area. Why do you need to do this instead of just commiting them. Imagine you have a project with multiple files and you only want to commit some of them. The staging area allows you to choose the files you want to commit.

Commiting
we used this command to commit the hello_world.txt file `git commit -m "Initial commit"` the `-m` flag stands for message and must always be followed by a message in quotes in our case `"Initial commit"`. You can think of commit like takeing a saving the state of the file at the time of the commit and the message is used to describe what you have done.

**Intermission end**

#todo in the next part we will edit the file again and add another file to repeat the basic commands so the student can get used to them



# One more section for add adding the project to github
