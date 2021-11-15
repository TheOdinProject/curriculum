### Introduction

It's time to put all of the HTML knowledge you have been acquiring so far into practice. In this project, you are going to build a basic recipe website.

The website will consist of a main index page which will have links to a few recipes. The website won't look very pretty by the time you've finished. Not unless you're into [brutalist web design](https://brutalistwebsites.com/), that is.

But it's important to keep in mind that this project is just to build your HTML chops; we will revisit this project in the future to style it up with CSS.

### Setting Up Your Project's GitHub Repository

As mentioned in the [introduction to Git](/courses/foundations/lessons/introduction-to-git), you'll want to organize all your projects like a portfolio and link them to GitHub so it can be seen by others.

If you do not know how to set up a repository, follow the instructions found in [Git Basics](/courses/foundations/lessons/git-basics) to learn how.

1. If you haven't already, create a folder on your computer called `the_odin_project` and `cd` into it. This folder will house all the projects you do at Odin.
2. Create a new repo for this project on GitHub.com and call it `odin-recipes`.
3. Move that repository onto your local machine. The command should look like `git clone git@github.com:username/odin-recipes.git` (use SSH).
4. Now `cd` into the `odin-recipes` project directory that is now on your local machine.
5. Set up your `README.md` file and write a brief introduction describing what the current project is and what skills you will have demonstrated once you have completed it. (You can also do this as a self-reflection at the end of the project, which is a good way to review what you have learned.)

If you are having trouble:

- All Git commands need to be run from inside your project's folder (did you forget to `cd` into the `odin-recipes` folder?).
- Ensure you followed the steps [here on Step 2.3](/courses/foundations/lessons/setting-up-git#step-2-configure-git-and-github) to clone from GitHub with SSH.
- Refer to the [workflow](/courses/foundations/lessons/git-basics) in the Git Basics Lesson.

#### Tips on when to commit
When you're building your project, you will probably end up doing several `git add` + `git commit` cycles before being ready to push it up to GitHub with `git push origin main`.

When writing code, it's considered best practice to commit early and often. Commit every time you have a meaningful change in the code. This will create a timeline of your progress and show that your finished code didn't appear out of nowhere.

If you have entered `git push origin main` and typed out your username and password, when you refresh your GitHub page you should see new files added onto GitHub.

Okay, that's enough Git for the moment -- time to actually build stuff!

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Iteration 1: Initial structure

1. Within the `odin-recipes` directory, create an `index.html` file.
2. Fill it out with the usual boilerplate HTML and add an `h1` heading "Odin Recipes" to the body.

#### Iteration 2:  Recipe Page

1. Create a new directory within the `odin-recipes` directory and name it `recipes`.
2. Create a new HTML file within the  `recipes` directory and name it after the recipe it will contain. For example `lasagna.html`. You can use the name of your favorite dish or, if you need some inspiration, you can [find a recipe to use here](https://www.allrecipes.com/).
3. For now, just include an `h1` heading with the recipe's name as its content.
4. Back in the `index.html` file, add a link to the recipe page you just created. The text of the link should again be the recipe name.

#### Iteration 3:  Recipe Page Content

The recipe page should have the following content:

1. An image of the finished dish under the h1 heading that you added earlier. You can find images of the dish on google or the site [recipe site](https://www.allrecipes.com/) we linked to earlier.
2. Under the image, it should have an appropriately sized "Description" heading followed by a paragraph or two describing the recipe.
3.  Under the description, add an "Ingredients" heading followed by an **unordered list** of the ingredients needed for the recipe.
4. Finally, under the ingredients list, add a "Steps" heading followed by an **ordered list** of the steps needed for making the dish.

#### Iteration 4: Add More Recipes

1. Add two more recipes with identical page structures to the recipe page you've already created.
2. Don't forget to link to the new recipes on the index page. Also, consider putting all the links in an unordered list so they aren't all on one line.
</div>

### Viewing your project on the web

If you want to show your work (the project) to others, or submit a solution below, you will need to publish your site so that others can access it from the web, rather than just on your local machine. The good news is that if you have your project on GitHub (as described above), doing this is incredibly simple.

GitHub allows you to publish web projects directly from a GitHub repository. Doing this will allow you to access your project from `your-github-username.github.io/your-github-repo-name`.

There are a couple of ways to go about doing this, but the simplest is this:

- make sure that the main HTML file of your project is called `index.html`. If it is not, you will need to rename it.
- go to your GitHub repo on the web and click the **Settings** button.
- click on **Pages** on the left side bar.
- change the **Source** from _none_ to _main branch_ and click Save.
- it may take a few minutes (the GitHub website says up to 10) but your project should be accessible over the web from `your-github-username.github.io/your-github-repo-name` (obviously substituting your own details in the link).
