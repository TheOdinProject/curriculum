### Introduction

Great job working through the Restaurant Page! Setting up and using Webpack with all of its loaders and plugins may have seemed tedious, and you may even still wonder what the point of it all is. As you keep going, a lot of this will become more natural to you, and hopefully these fundamental concepts can help you with problems that are yet to come!

Now that you've played around with Webpack a little, let's have a look at a few things that can help to improve the setup experience and your development workflow. Some of these things aren't just limited to Webpack, but are things you can continue to use with other tools as you progress.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to write and run npm scripts.
- What Webpack modes are and how to automate switching between modes as required.
- How to create and use template repositories.

### npm scripts

While `npx webpack` and `npx webpack serve` aren't particularly long commands to type, you may have encountered `git subtree push --prefix dist origin gh-pages` in the Restaurant Page project. You surely won't want to be typing that out every time you need to use it.

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

We have three npm scripts here. Running `npm run build` would be the same as running `npx webpack` (which you may have seen in the Webpack guides from the previous Webpack lesson), `npm run dev` would be the same as `npx webpack serve`, and `npm run deploy` would just run `git subtree push --prefix dist origin gh-pages` for us. Not only can we save time sometimes, it's nice to have sensible and somewhat standardised names for our commands. `npm run build` often contains a tool's command for building/bundling/compiling. `npm run dev` is often used to start a dev server etc. Names might not always be the same, but they can explain their purposes better than `npx webpack`.

Note that we drop the `npx` from the start of the `webpack` and `webpack serve` commands when setting them as scripts, as we only needed `npx` to run them directly in the terminal without npm scripts.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
