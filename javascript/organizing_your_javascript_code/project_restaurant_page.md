### Introduction

Let's use what we've learned and take a chance to continue practicing DOM manipulation by dynamically rendering a restaurant homepage! By the end, we are going to be using JavaScript alone to generate the entire contents of the website!

**Note: DOM elements should be created using JavaScript but styling can be done in a separate CSS file.**

<div class="lesson-note lesson-note--tip" markdown="1">

#### .gitignore

When working with packages that are installed with npm, you don't need to track the contents of `node_modules` with git, nor push those files to GitHub. As we learned in the [npm lesson](https://www.theodinproject.com/lessons/node-path-javascript-npm), the `package.json` file contains all the dependency information, so that anyone can clone your project and install them on their machine with `npm install`.

You can make a `.gitignore` file in the root of the project, and by writing file or directory names in it, you can tell git what things you don't want to track. It's customary to add `node_modules` to `.gitignore`, since it can get really big. Similarly, `dist` is often ignored as it can be generated when someone runs the command to bundle/build the application.

When creating a new repo on GitHub, there is an option to specify a `.gitignore` template.  There are many templates out there that include common files and directories that are not typically tracked based on the type of project or language used.  For JavaScript projects, there is a `node` template that includes `node_modules` and `dist`.

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Start the project the same way you began the webpack tutorial project, by creating the `package.json` file and setting up Webpack.
    - Remember, you only need to install and configure the things you need for your project. For example, if you do not plan to have local image files linked in your HTML template, you will not need to install and configure `html-loader`.
1. Create a `.gitignore` file in the root of your project. It should contain the text `node_modules` and `dist` on separate lines.

   ```text
   node_modules
   dist
   ```

1. Set up an HTML skeleton inside of `src/template.html`. Inside the body, add a `<header>` element that contains a `<nav>` with buttons (not links!) for different "tabs" (for example buttons for "Home", "Menu" or "About" etc). Below the `<header>`, add a single `<div id="content">`.
1. Inside of `src/index.js` write a `console.log` or `alert` statement and then run `npx webpack serve`. Open [http://localhost:8080](http://localhost:8080) in your browser and check your JavaScript is running.
1. Inside `div#content`, create a homepage for your restaurant. You might want to include an image, headline, and some text about how wonderful the restaurant is; you do not have to make this look too fancy. It’s okay to hard-code these into the HTML for now just to see how they look on the page.
1. Now remove everything inside `div#content` from the HTML (so you still have the `<header>` and `<nav>` with an empty `<div id="content">` below it) and instead create them by using JavaScript only, e.g. by appending each new element to `div#content` once the page is first loaded. Since we're all set up to write our code in multiple files, let's write this initial page-load function inside of its own module and then import and call it inside of `index.js`.
1. Next, set up your restaurant site to use tabbed browsing to access the Menu and Contact pages. Look at the behavior of this [student's live preview site](https://web.archive.org/web/20221024060550/https://eckben.github.io/bearysBreakfastBar/) for visual inspiration.
    1. Put the contents of each "tab" inside of its own module. Each module will export a function that creates a div element, adds the appropriate content and styles to that element and then appends it to the DOM.
    1. Write the tab-switching logic inside of `index.js`. You should have event listeners for each button in the header navbar that wipes out the current contents of `div#content` and then runs the correct 'tab module' to populate it with the new contents again.

#### Deployment

Let's deploy your project to GitHub pages! This is a little more work than it has been for previous projects, because GitHub Pages tries to look for an `index.html` *in the root of your project*, but yours is inside `dist`! We will need to do a few steps to push *the contents* of your `dist` directory to its own branch on GitHub, which will then have a root-level `index.html` for GitHub pages to serve.

You don't need to know exactly what all the commands do - as long as you follow the instructions below carefully you should be fine. You can use these instructions to deploy your project initially, and also redeploy it again if you make more changes to your project later.

1. Make a new branch to deploy from by running `git branch gh-pages`. You only need to do this the first time you deploy. The rest of the steps should be done every time you deploy or redeploy your project.
1. Make sure you have all your work committed. You can use `git status` to see if there's anything that needs committing.
1. Run `git checkout gh-pages && git merge main --no-edit` to change branch and sync your changes from `main` so that you're ready to deploy.
1. Now let's bundle our application into `dist` with your build command. For now, that's `npx webpack`.
1. Now there are a few more commands. Run each of these in order:

   ```bash
   git add dist -f && git commit -m "Deployment commit"
   git subtree push --prefix dist origin gh-pages
   git checkout main
   ```

1. Recall that the **source branch** for GitHub Pages is set in your repository's settings. Get this changed to the `gh-pages` branch. That should be everything!

</div>
