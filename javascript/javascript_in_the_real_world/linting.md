### Introduction

Before we dive further into code, we are going to take a moment to improve your editor setup and overall productivity. Doing this now will make things much easier for you going forward. This lesson will give you some information about code style, and then give you some tools to help you maintain consistent code-style throughout your projects. In some cases it can even help adjust things like indentation for you!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Learn about style guides and why they are important.
- Set up a linter and prettier to make your code better.

### Style guides

Code style is important! Having a consistent set of style rules for things such as indentation or preferred quote style makes your code more maintainable and easier to read. There are several popular JavaScript style guides on the net that set standards for these types of things, and a little time spent looking through them *will* make you a better developer. Have a little look at some popular style guides for an idea of what sort of things can be done to improve consistency:

1. The [Airbnb Style Guide](https://github.com/airbnb/javascript) is one of the most popular. It is also very well formatted and easy to read.
1. There is also a [JavaScript style guide used at Google](https://google.github.io/styleguide/jsguide.html).
1. The [JavaScript Standard Style](https://standardjs.com/rules.html).

### Linting

The style guides we mentioned above are full of really helpful advice for formatting, organizing and composing your code. But there are a *lot* of rules - it can be difficult to internalize them all. **Linters** are tools that will scan your code with a set of style rules and will report any errors to you that they find. In some cases, they can even auto-fix the errors!

There are multiple options for linting your JavaScript, but the most popular (and most common in the industry) is [ESLint](https://eslint.org/). Getting it installed and the initial set-up is straightforward.

1. [ESLint's official 'Getting Started' page](https://eslint.org/docs/user-guide/getting-started) is a good place to start. It covers installation and basic setup. The basic way to use this tool is to run the `eslint` command in your terminal with a specific file.
    - You may also want to look at the [docs on configuring ESLint](https://eslint.org/docs/latest/use/configure/) for a list of options that you can change.
1. There is an [ESLint extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) with which you can get automatic lint highlighting for your files as you write, without you needing to rerun the `eslint` command every time. If your open workspace also contains an ESLint configuration file at the top level, the extension will automatically use those rules for that project.

<div class="lesson-note lesson-note--warning" markdown="1">

#### ESLint v9 and flat config support

The above ESLint doc links take you to the docs for v9, which was released in April 2024. v9 came with a lot of big changes, including forcing all ESLint config files to use the "flat config" format (`eslint.config.(m|c)js`).

Because of these changes, some community plugins like [eslint-config-airbnb-base](https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb-base) (which makes ESLint use Airbnb's ruleset) have not yet been able to release a version that supports v9 or flat config.

For the time being, if you wish to use airbnb's style guide with ESLint, you will need to use [ESLint's v8.57 version of the docs](https://eslint.org/docs/v8.x/use/getting-started) and make sure you use one of the older [eslintrc configuration file formats](https://eslint.org/docs/v8.x/use/configure/configuration-files), **not** the newer flat config format.

</div>

### Formatters

Formatters are *awesome*. They are similar to linters, but serve a slightly different function. Formatters take your JavaScript code and then automatically format it according to a set of rules. Unlike linters, they do not look for style errors, but specifically target the layout of your code, making intelligent decisions about things like spaces, indentation levels and line-breaks.

As usual, there are multiple formatters out there. [Prettier](https://prettier.io/) is a very popular choice that is highly opinionated. Besides a few options, most of its formatting decisions are not customizable. Since many of these decisions have been made for you, this reduces the time spent deciding on things like indentation size or spacing, and more time on the problems that actually matter.

1. Read [Prettier's installation guide](https://prettier.io/docs/en/install.html) for installing it as a dependency in your projects.
1. Prettier also has [instructions for setting up and configuring the VSCode Prettier extension](https://github.com/prettier/prettier-vscode). This extension allows you to format with Prettier via Visual Studio Code commands or keybinds instead of commands in the terminal.

Using Prettier makes coding faster and easier! You don't have to worry about nailing things like indentation, or remembering every semi-colon because prettier will take care of those details for you.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Extensions and project dependencies

While the Visual Studio Code extensions for ESLint and Prettier are really convenient, they are local to your machine only. It's good practice to install any linters and formatters as dev dependencies in your projects as well.

At some point, you may need to work on code with multiple people, and others may not use all of the same tools as you. Therefore, including linters and formatters as dependencies in your project, as well as any rule configuration files, allows everyone access to the same linting and formatting tools and rules.

Editor extensions can then be used to make linting and formatting more convenient for you. The ESLint and Prettier extensions will recognise and use any rule files in your project. If your open workspace has ESLint installed as a dependency, then the ESLint extension can automatically detect this to apply the right setting for whether to use the flat config or legacy eslintrc format.

</div>

### Using ESLint and Prettier

We **highly** recommend that you install ESlint and Prettier and use them for all future projects. It will make your code easier to read, both for yourself and for anyone else looking at it.

For most people using the default ESLint ruleset, there will be no special setup needed apart from installing both of them.

Some community plugins, such as [eslint-config-airbnb-base](https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb-base), turn on some stylistic rules that may clash with what Prettier formats. If you wish to use a plugin like `eslint-config-airbnb-base` and Prettier together, you will also need to install [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier) which will turn off any of the ESLint rules that clash with Prettier. If you are using the default ESLint ruleset, you will not need this.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Adding setup to template repositories

Recall [template repositories](https://www.theodinproject.com/lessons/node-path-javascript-revisiting-webpack#template-repositories)? You can include linter and formatter setup in any of your templates to make things quicker and easier in the future!

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read this article that goes more into [the value of linters and how they work](https://hackernoon.com/how-linting-and-eslint-improve-code-quality-fa83d2469efe).
1. Watch this [short intro to Prettier](https://www.youtube.com/watch?v=hkfBvpEfWdA) by its creator.
1. Go to [Prettier's online playground](https://prettier.io/playground) and give it a test drive. Go ahead and copy/paste some of your old JavaScript code into that editor and see what happens.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is linting?](#linting)
- [Which problems can linting prevent?](https://hackernoon.com/how-linting-and-eslint-improve-code-quality-fa83d2469efe)
- [What are some of the benefits of using a formatter?](#formatters)
- [What is Prettier?](https://www.youtube.com/watch?v=hkfBvpEfWdA)
- [Why should you install linters and/or formatters as dev dependencies in your project?](#extensions-and-project-dependencies)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
