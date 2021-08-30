### Introduction

For this project you'll be creating an entire web page from a design we'll provide for you. If you've been following along you should have the skills you need to accomplish this, but it may not be easy!

The design we're providing you comes in the form of 2 images, one of them an image of the complete website, and one with some details about some of the fonts and colors we've used.

Do _not_ be afraid to use google or go back to previous lessons to look something up. **Real-life, professional developers use google _constantly_ for things that they have been doing for years.** At this point it is not expected that you will have everything memorized so don't worry about it. Additionally, there are a few small details that you may not have encountered in our lessons yet. _This is by design._ These details are minor, and easily searched (i.e. google `css rounded corners`).

Get your project as close as you can to the design but do not worry about getting it pixel-perfect. Don't get out your ruler or count pixels to find the exact margin between the various sections. The point of this assignment is creating something from scratch and getting the various elements in more or less the right position relative to the rest. It doesn't matter if you use `margin: 24px` when the design actually has `margin: 48px`.

_Finally_, feel free to substitute your own content into this design. The images have some meaningless dummy-content, but if you want to make up a business and personalize this page, please feel free to do so! Insert actual images in the placeholders, and feel free to play with the colors and fonts a bit too.

> #### A note about images on the web.
> You do not have the legal right to use just any image that you find on the web. There are many free images to be found, but make sure that the image you use is actually free for you to use, and make sure to credit the creator of the image in your project. An easy way to give credit is to put the creator's name and contact info in a README file in your repository.
> Some good places to find free-to-use images on the web include [Pexels](https://www.pexels.com/), [Pixabay](https://pixabay.com/), and [Unsplash](https://unsplash.com/).

### Setting up your project's GitHub repository

As mentioned in the [introduction to Git](/courses/foundations/lessons/introduction-to-git), you'll want to organize all your projects like a portfolio and link them to GitHub so it can be seen by others.

If you do not know how to set up a repository, follow the instructions found in [Git Basics](/courses/foundations/lessons/git-basics) to learn how.

1. If you haven't already, create a folder on your computer called `the_odin_project` and `cd` into it. This folder will house all the projects you do at Odin.
2. Create a new repo for this project on GitHub.com and call it `foundations-project` (instead of `git-test`).
3. Then move that repository onto your local machine. The command should look like: `git clone git@github.com:username/foundations-project.git` (use SSH).

   - [Setting up SSH on GitHub](/courses/foundations/lessons/setting-up-git#step-2-configure-git-and-github).

4. Now `cd` into the `foundations-project` directory that is now on your local machine; set up your `README.md` file and write a brief introduction for what the current project is and what skills you have demonstrated once you have completed it. (You can do this as a self-reflection at the end of the project which is a good way to review what you have learned.)

If you are having trouble:

- All Git commands need to be run from inside your project's folder (did you forget to `cd` into the `foundations-project` folder?)
- Ensure you followed the steps [here on Step 2.3](/courses/foundations/lessons/setting-up-git#step-2-configure-git-and-github) to clone from GitHub with SSH.
- Refer to the [workflow](/courses/foundations/lessons/git-basics) in the Git Basics Lesson.

_When you're building your project, you will probably end up doing several `git add` + `git commit` cycles before being ready to push it up to GitHub with `git push origin main`._

_When writing code, it's considered best practice to commit early and often. Commit every time you have a meaningful change in the code. This will create a timeline of your progress and show that your finished code didn't appear out of nowhere._

If you have entered `git push origin main` and typed out your username and password, if you refresh your GitHub page, you should see new files added onto GitHub.

Okay, that's enough Git for the moment -- time to actually build stuff!

### Warning About Looking at Other People's Finished Project Code Before You have Completed Your Own

All of our projects have a "Student Solutions" section at the bottom for people to post their completed code and live websites for the projects. These are here for you to compare your **completed** code to and see what other routes people have chosen to take with their project code and designs. 

We know it may be tempting to look at the solutions when you get stuck or don't know where to start, but **don't** do it! Here are some reasons why:

- All of the submitted projects are other *student* solutions. This means they are written by other people who are also still learning and may not necessarily be representative of "best practice" or quality code.
- Looking at solutions robs you of the chance to develop your problem solving and researching skills. In the real world, there will not always be "solutions" for you to look at and you will have to come up with your own.
- There are many different ways to achieve the same end result, it is not "one size fits all".
- An Analogy: "Looking at completed code is like learning how to make pizza dough from looking at a baked pizza."  There is a lot more that goes into it than you would have assumed by only seeing the final product and not the process that lead to it.

Once you have completed your project feel free to look at the other solutions to see alternative ways the project was completed.

*Note: It is okay to check the "Live Preview" to get an idea of layout and styling before starting but not the code files.*

**DO NOT PEEK. Come ask for help in our discord server!**

### Assignment

1. Download the design images and take a look at what you're going to be creating here. [INSERT LINK TO IMAGES HERE.. They're in the curriculum repo]
1. There are many ways to tackle a project like this, and it can be overwhelming to look at a blank HTML document and not know where to start. Our suggestion: take it one section at a time. The website you're creating has 4 main sections (and a footer), so pick one and get it into pretty good shape before moving on. Starting at the top is always a solid plan.
2. For the section you're working on, begin by getting all the content onto the page before beginning to style it. In other words, do the HTML and _then_ do the CSS. You'll probably have to go back to the HTML once you start styling, but bouncing back and forth from the beginning will end up making things take longer and may end up causing you more frustration.
3. Many of the elements on this page are very similar to things you saw in our flexbox exercises... feel free to go back to those if you need a refresher.
4. Do not worry about making your project look nice on a mobile device. We'll learn that later.
5. When you finish, don't forget to push it up to github using the instructions above!

### Viewing your project on the web

If you want to show your work (the project) to others, or submit a solution below, you will need to publish your site so that others can access it from the web, rather than just on your local machine. The good news is that if you have your project on GitHub (as described above) doing this is incredibly simple.

GitHub allows you to publish web projects directly from a GitHub repository. Doing this will allow you to access your project from `your-github-username.github.io/your-github-repo-name`

There are a couple of ways to go about doing this, but the simplest is this:

- make sure that the main HTML file of your project is called `index.html`. If it is not, you will need to rename it.
- go to your GitHub repo on the web and click the **Settings** button
- click on **Pages** on the left side bar
- change the **Source** from _none_ to _main branch_ and click Save.
- it may take a few minutes (the GitHub website says up to 10) but your project should be accessible over the web from `your-github-username.github.io/your-github-repo-name` (obviously substituting your own details in the link)

