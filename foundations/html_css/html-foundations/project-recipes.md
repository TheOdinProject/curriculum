### Introduction

It's time to practice all of the HTML knowledge you have acquired. In this project, you are going to build a basic recipe website.

The website will consist of a main index page which will have links to a few recipes. The website won't look very pretty by the time you've finished. Not unless you're into [brutalist web design](https://brutalistwebsites.com/), that is.

But it's important to keep in mind that this project is just to build your HTML chops; we will revisit this project in the future to style it up with CSS.

### Setting up your project's GitHub repository

As mentioned in the [introduction to Git](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/introduction-to-git), you'll want to organize all your projects like a portfolio and link them to GitHub so it can be seen by others.

If you do not know how to set up a repository, follow the instructions found in [Git Basics](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/git-basics) to learn how.

1.  Create a new repo for this project on GitHub.com and call it `odin-recipes` and choose the `public` option instead of the default private.

2.  Move that repository onto your local machine, inside the `repos` folder that you previously created in the Git Basics lesson. The command should look like `git clone git@github.com:username/odin-recipes.git` (use SSH).

3.  Now `cd` into the `odin-recipes` project directory that is now on your local machine.

4.  Set up your `README.md` file and write a brief introduction describing what the current project is and what skills you will have demonstrated once you have completed it. (You can also do this as a self-reflection at the end of the project, which is a good way to review what you have learned.)

If you are having trouble:

-   All Git commands need to be run from inside your project's folder (did you forget to `cd` into the `odin-recipes` folder?).

-   Ensure you followed the steps [here on Step 2.3](/paths/foundations/courses/foundations/lessons/setting-up-git#step-2-configure-git-and-github) to clone from GitHub with SSH.

-   Refer to the [workflow](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/git-basics) in the Git Basics Lesson.

#### Tips on when to commit
Don't forget everything we went over in the [previous lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages) about commit messages!

When you're building your project, you will probably end up doing several `git add` + `git commit` cycles before being ready to push it up to GitHub with `git push origin main`.

When writing code, it's considered best practice to commit early and often. Commit every time you have a meaningful change in the code. This will create a timeline of your progress and show that your finished code didn't appear out of nowhere.

After you have entered `git push origin main`, switch over to your browser and open your repository on GitHub. You should now see all the files you just pushed.

Okay, that's enough Git for the moment -- time to actually build stuff!

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Iteration 1: initial structure

1.  Within the `odin-recipes` directory, create an `index.html` file.
2.  Fill it out with the usual boilerplate HTML and add an `h1` heading "Odin Recipes" to the body.

#### Iteration 2:  recipe page

1.  Create a new directory within the `odin-recipes` directory and name it `recipes`.
2.  Create a new HTML file within the  `recipes` directory and name it after the recipe it will contain. For example `lasagna.html`. You can use the name of your favorite dish or, if you need some inspiration, you can [find a recipe to use here](https://www.allrecipes.com/).
3.  For now, just include an `h1` heading with the recipe's name as its content.
4.  Back in the `index.html` file, add a link to the recipe page you just created. Example: Under the `<h1>Odin Recipes</h1>` heading, write out the link like so: `<a href="recipes/recipename.html">Recipe Title</a>`. The text of the link should again be the recipe name.

#### Iteration 3:  recipe page content

Your new recipe page should have the following content:

1.  An image of the finished dish under the h1 heading that you added earlier. You can find images of the dish on Google or the [recipe site](https://www.allrecipes.com/) we linked to earlier.

2.  Under the image, it should have an appropriately sized "Description" heading followed by a paragraph or two describing the recipe.

3.  Under the description, add an "Ingredients" heading followed by an **unordered list** of the ingredients needed for the recipe.

4.  Finally, under the ingredients list, add a "Steps" heading followed by an **ordered list** of the steps needed for making the dish.

#### Iteration 4: add more recipes

1. Add two more recipes with identical page structures to the recipe page you've already created.
2. Don't forget to link to the new recipes on the index page. Also, consider putting all the links in an unordered list so they aren't all on one line. 

Example:

~~~html 
 <ul>
    <li><a href="recipes/yourrecipe.html">Recipe Title 1</a></li>
    <li><a href="recipes/yourrecipe.html">Recipe Title 2</a></li>
    <li><a href="recipes/yourrecipe.html">Recipe Title 3</a></li>
  </ul>
~~~
  
Your links won't be flashy, but for now just focus on building them out.
</div>

### Viewing your project on the web

If you want to show your work (the project) to others, or submit a solution below, you will need to publish your site so that others can access it from the web, rather than just on your local machine. The good news is that if you have your project on GitHub (as described above), doing this is incredibly simple.

GitHub allows you to publish web projects directly from a GitHub repository. Doing this will allow you to access your project from `your-github-username.github.io/your-github-repo-name`.

There are a couple of ways to go about doing this, but the simplest is this:

-   Make sure that the main HTML file of your project is called `index.html`. If it is not, you will need to rename it.
-   Go to your GitHub repo on the web and click the **Settings** button as shown in the screenshot below.
    ![Screenshot pointing to the Settings located in an example repository](https://cdn.statically.io/gh/TheOdinProject/curriculum/90b1a362af0bb8635af9593cd8911c9aefb68569/foundations/html_css/html-foundations/imgs/01.png)
-   Click on **Pages** on the left side bar.
-   Change the **Branch** from _none_ to _main branch_ and click **Save**. 
-   It may take a few minutes (The GitHub website says up to 10, but we've seen it take up to an hour. Do not add a "theme" to your project, or you may have git conflicts, instead, be patient.) but your project should be accessible over the web from `your-github-username.github.io/your-github-repo-name` (obviously substituting your own details in the link).

