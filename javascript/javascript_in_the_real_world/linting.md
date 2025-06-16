### Introduction

Before we dive further into code, we are going to take a moment to improve your editor setup and overall productivity. Doing this now will make things much easier for you going forward. This lesson will give you some information about code style, and then give you some tools to help you maintain consistent code-style throughout your projects. In some cases it can even help adjust things like indentation for you!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Learn about style guides and why they are important.
- Set up a linter and prettier to make your code better.

### Style guides

Code style is important! Having a consistent set of style rules for things such as indentation, preferred quote style or general code structure practices, makes your code more maintainable and easier to read. There are several popular JavaScript style guides on the net that set standards for these types of things and you'll find they often differ in what they enforce. None are "right" or "wrong", only that they enforce *something* to promote consistency across a codebase.

Here are a few examples of style guides, including ones used by specific companies:

1. The [Airbnb Style Guide](https://github.com/airbnb/javascript) is one of the most popular.
1. There is also a [JavaScript style guide used at Google](https://google.github.io/styleguide/jsguide.html).
1. The [JavaScript Standard Style](https://standardjs.com/rules.html).

### Linting

The style guides we mentioned above are full of really helpful advice for formatting, organizing and composing your code. But there are a *lot* of rules - it can be difficult to internalize them all. **Linters** are tools that will scan your code with a set of style rules and will report any errors to you that they find. In some cases, they can even auto-fix the errors! There are many linters that exist for JavaScript but by far the most common one is [ESLint](https://eslint.org/).

ESLint is installed as a dev dependency in your project which will allow you to run checks on any of your files via the command line. [ESLint's official "Getting Started" page](https://eslint.org/docs/user-guide/getting-started) is a good place to start which covers installation and basic configuration. The default rule set covers many of the most common scenarios with sensible default settings.

You will also want to look at the [docs on configuring ESLint](https://eslint.org/docs/latest/use/configure/) for a list of options that you can change, such as including or excluding certain folders or files, and details about specific rules.

### Formatters

Formatters are *awesome*. They are similar to linters, but serve a slightly different function. Formatters take your JavaScript code and then automatically format it according to a set of rules. Unlike linters, they do not look for style errors, but specifically target the layout of your code, making intelligent decisions about things like spaces, indentation levels and line-breaks.

As usual, there are multiple formatters out there. [Prettier](https://prettier.io/) is a very popular choice that is highly opinionated. Besides a few options, most of its formatting decisions are not customizable. Since many of these decisions have been made for you, this reduces the time spent deciding on things like indentation size or spacing, and more time on the problems that actually matter.

Like with ESLint, Prettier is installed as a dev dependency in your project, so read [Prettier's installation guide](https://prettier.io/docs/en/install.html) for instructions on how to do this. While it normally runs with its default rules, you can also change any of its settings in a [Prettier configuration file](https://prettier.io/docs/configuration).

Using Prettier makes coding faster and easier! You don't have to worry about nailing things like indentation, or remembering every semi-colon because it will take care of those details for you.

### IDE extensions for linting and formatting

Linters and formatters are typically packages you install in a project and use via the command line. However, many popular tools also have IDE extensions, and ESLint and Prettier both have extensions for Visual Studio Code that can make linting and formatting much more convenient on your machine.

For example, when installed, the [ESLint extension](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) can provide linter warnings and errors as color-coded squiggly lines directly in the open file and even give you details about the specific rule(s) broken, all without you having to run ESLint in the command line. The [Prettier extension](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) allows you to format a file with an IDE command or custom keyboard shortcut, again without having to run a command in the terminal.

It is important that you still have the packages installed as dependencies in your project along any configuration files. The extensions can have fallback rules set, but if they detect the respective package and configuration file in your project, they will use those rules and the package version installed. That way, projects always hold the source of truth for what linting and formatting rules should be applied, and should you ever work on other projects, you're less likely to introduce unwanted style changes from your local settings.

In summary, the extensions are great tools for convenience but they should not be used as the source of truth for a project's linting or formatting setup.

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
- [Why should you install linters and/or formatters as dev dependencies in your project?](#ide-extensions-for-linting-and-formatting)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
