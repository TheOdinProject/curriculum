### Introduction

Great job working through the Restaurant Page! Setting up and using Webpack with all of its loaders and plugins may have seemed tedious, and you may even still wonder what the point of it all is. As you keep going, a lot of this will become more natural to you, and hopefully these fundamental concepts can help you with problems that are yet to come!

Now that you've played around with Webpack a little, let's have a look at a few things that can help to improve the setup experience and your development workflow. Some of these things aren't just limited to Webpack, but are things you can continue to use with other tools as you progress.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to write and run npm scripts.
- What Webpack modes are and how to automate switching between modes as required.
- How to create and use template repositories.

### npm scripts

While `npx webpack` and `npx webpack serve` aren't particularly long commands to type, you will have encountered `git subtree push --prefix dist origin gh-pages` in the Restaurant Page project's deployment instructions. You surely won't want to be typing that out every time you need to use it.

Fortunately, we can write npm scripts in our `package.json` file by adding a `"scripts"` property containing an object of scripts. Scripts can be written in the form `"name": "command"`, and are executed by running `npm run <name>` in the terminal. For example:

```json
{
  // ... other package.json stuff
  "scripts": {
    "build": "webpack",
    "dev": "webpack serve",
    "deploy": "git subtree push --prefix dist origin gh-pages"
  },
  // ... other package.json stuff
}
```

We have three npm scripts here. In this case, running `npm run build` would be the same as running `npx webpack` (which you may have seen in the Webpack guides from the previous Webpack lesson), `npm run dev` would be the same as `npx webpack serve`, and `npm run deploy` would run `git subtree push --prefix dist origin gh-pages` for us. Not only can we often save time, it's also nice to have sensible and somewhat standardized names for our commands. `npm run build` often contains a tool's command for building/bundling/compiling. `npm run dev` is often used to start a dev server, etc. Names might not always be the same, but they can explain their purposes better than `npx webpack`.

Note that we drop the `npx` from the start of the `webpack` and `webpack serve` commands when setting them as scripts, as we only needed `npx` to run them directly in the terminal without npm scripts.

### Webpack modes

So far, we've stuck with using Webpack in development mode, which is naturally most suitable for when we're working on development. However, when we come to build our projects for deployment, the dedicated production mode does some different optimizations for us. Try it! You can go to your Restaurant Page project, change the mode to `"production"` in `webpack.config.js`, then run your build command again. Have a look at the JavaScript bundle in `dist` to see an even more glorious jumble of characters!

We *really* do not need to know exactly what optimizations have been applied, nor do we need to know about any other specifics of production mode, but it's nice to be aware that the two modes exist and are designed for specific things.

To save you from having to manually edit your configuration file every time you wish to switch modes, such as before bundling into `dist` or before going back to use your dev server, you can have two different configuration files (e.g. `webpack.dev.js` and `webpack.prod.js`), and then have your build and dev npm scripts specify which configuration files to use (omitting the `--config` option makes Webpack search for `webpack.config.js` by default):

```json
"build": "webpack --config webpack.prod.js",
"dev": "webpack serve --config webpack.dev.js"
```

In the assignment, we will introduce a tool called `webpack-merge` that can make using multiple Webpack configuration files easier to deal with and with minimal duplication. Doing it this way is nice. We set it up once, then we can forget about it since each script will use the appropriate configuration file and mode!

### Template repositories

One thing you might have noticed already is that setting up Webpack involves multiple files and directories, and a fair bit of configuration. Each time you set up a new project with Webpack, you may have to look at what you configured before to copy and paste the configuration you want to reuse. You may have also noticed that whenever you create a new repository on Github, there is an option near the top for a `Repository template`.

This is where template repositories can really come in handy. Any of your existing repositories can be converted to a template in its settings (right under where you can rename the repository, there is a checkbox for whether the repository is a template or not). If you check this box, congratulations! That's all you need to do. Now, when you go to create a new repository, the `Repository template` dropdown will list any templates for you to select. Selecting one will mean your new repository will be a copy of the chosen template, not an empty one!

You may not know for sure what you might want or need in a template, but when you find yourself reusing a lot of setup code for multiple projects, you can make a new repository with all of the setup code you need and mark it as a template, then update it as necessary. Now you can select that template when creating a new project repository to save time, letting you dive into working on the project itself sooner!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [a little more about npm scripts](https://www.knowledgehut.com/blog/web-development/package-json-scripts-node-js). This article goes a little further than what you might find yourself needing to use for a while, such as pre/post and lifecycle scripts, but it's good to be aware of what things are possible with the tools you have.
1. Read through [Webpack's "Production" guide](https://webpack.js.org/guides/production/) where they walk you through how to use `webpack-merge` and split your configuration file. The exact code examples they've used in that guide follow on from a previous part of a longer tutorial they have, but the main parts about `webpack-merge` and splitting the configuration file should still be followable with a new project, or you can even try converting your Restaurant Page project to do things this way!
   - You can ignore the "Specify the Mode" section and its examples.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Where do npm scripts live?](#npm-scripts)
- [How do you define and run npm scripts?](#npm-scripts)
- [What are the two Webpack modes?](#webpack-modes)
- [What tool allows you to split your Webpack configuration file with minimal duplication?](https://webpack.js.org/guides/production/)
- [What is a template repository, and how would you create one?](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
