# Git 101
<!-- notes for my editing this lesson
two things this lesson should do,
1. provide a high level overview of git and why its used
2. explain the basic work flow of staging, commiting and pushing

Make sure to get the point across that git can feel cumbersome and unintuitive at the start, to not worry about understanding everything about git. The students will get more comfortable with it as they use it, git is a passive skill that will improve over time with use and understanding the basics is enough for now. They will learn more of the advanced features of git as and when they need them.
-->

Git is an essential skill for a modern web developer, in this lesson we will have a look at what git is, why its needed and the basics of how it works.

the reason we are introducing git now before we have git into coding is for a few reasons.
1. the sooner the student understands the basics, the sooner they will get comfortable with git
2. they will be able to upload the coming projects to github with at least a basic understanding of what they are doing
3. having your projects on github will allow them to get help easier from others, as they can just share a link to their repo to share their code when they need help
4. start building a git profile.

## Learning Outcomes

*By the end of this lesson you should understand the following*

* What is Git?
* Why is Git useful for a developer?
* Why is Git useful for a team of developers?
* What is the different between Git and github?
* How do you create a new Git repository for a project locally?
* How do you create it on Github?
* How do you commit changes?
* What is the difference between staging and committing changes?
* What is the difference between committing your changes and pushing them to Github?
* How do you check the status of your current repo in git?
* How do you see the history of your previous commits (from the command line)?
* How can you look through your historical commits on the Github website?

## What is Git and why is it important:
In this section we will include a high level overview of what git is and why its important to know, one or two good resources about what git is used for should cover the second point.

1. [A short history of git and GitHub](https://www.youtube.com/watch?v=1h9_cB9mPT8)
2. [what is git](https://www.youtube.com/watch?v=8oRjP8yj2Wo)
2. [what is git and github](https://www.youtube.com/watch?v=uUuTYDg9XoI)
3. [why use git](https://www.git-tower.com/learn/git/ebook/en/command-line/basics/why-use-version-control)
4. [difference between git and github](https://www.youtube.com/watch?v=xKVlZ3wFVKA)


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

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* No more than 3 extra resources, we want to keep the links to a minimum on lesson pages now.
