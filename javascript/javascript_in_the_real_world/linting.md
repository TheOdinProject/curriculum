### Introduction

Before we dive all the way into the Code, we are going to take a moment to improve your editor setup and overall productivity. Doing this now will make things much easier for you going forward. This lesson will give you some information about code style, and then give you some tools to help you maintain consistent code-style throughout your projects.  In some cases it can even help adjust things like indentation for you! We will also introduce template repositories which can save you time setting up projects that share a lot of configuration with other projects.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Learn about style guides and why they are important.
- Set up a linter and prettier to make your code better.
- Learn what template repositories are and how to set one up.

### Style guides

Code style is important! Having a consistent set of style rules for things such as indentation or preferred quote style makes your code more maintainable and easier to read. There are several popular JavaScript style guides on the net that set standards for these types of things, and a little time spent reading them *will* make you a better developer.

1. The [Airbnb Style Guide](https://github.com/airbnb/javascript) is one of the most popular. It is also very well formatted and easy to read.
1. Google also has their own [style guide](https://google.github.io/styleguide/jsguide.html) for JavaScript.
1. The [JavaScript Standard Style](https://standardjs.com/rules.html). Used by companies like NPM and GitHub, among [others](https://standardjs.com/index.html#who-uses-javascript-standard-style).

### Linting

The style guides we mentioned above are full of really helpful advice for formatting, organizing and composing your code. But there are a *lot* of rules - it can be difficult to internalize them all. **Linters** are tools that will scan your code with a set of style rules and will report any errors to you that they find. In some cases, they can even auto-fix the errors! The following articles explain in more detail the benefits of using a linter while you code.

1. This article on [javascript linters](https://gomakethings.com/javascript-linters/) gets right to the point... start here!
1. Read this article that [goes a little further](https://hackernoon.com/how-linting-and-eslint-improve-code-quality-fa83d2469efe) by discussing exactly *how* linters do what they do.

There are multiple options for linting your JavaScript, but the most popular (and most common in the industry) is [eslint](https://eslint.org/). Getting it installed and the initial set-up is straightforward.

1. [The official 'Getting Started' page](https://eslint.org/docs/user-guide/getting-started) is a good place to start. It covers installation and basic setup. The basic way to use this tool is to run the `eslint` command in your terminal with a specific file.
1. Far more useful are linting plugins for your favorite text editor. Most editor plugins allow you to automatically lint your code as you are writing it, and will show the errors right in the editor, which makes resolving them *much* simpler. We can't cover *every* editor installation but some of the more popular are:
   1. Visual Studio Code - [The Plugin](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) and [a tutorial](https://www.digitalocean.com/community/tutorials/linting-and-formatting-with-eslint-in-vs-code).
   1. Sublime Text - [The Plugin](https://github.com/roadhump/SublimeLinter-eslint) and [a tutorial](http://jonathancreamer.com/setup-eslint-with-es6-in-sublime-text/).
   1. Atom - [The Plugin](https://atom.io/packages/linter-eslint) and [a tutorial](https://medium.freecodecamp.org/how-to-set-up-eslint-in-atom-to-contribute-to-freecodecamp-3467dee86e2c).
   1. Vim - [Use the ALE plugin](https://github.com/dense-analysis/ale). If you use Vim you already know what you're getting into. ALE is a great plugin, but the setup and configuration can be a little tricky.

### Prettier

Prettier is *awesome*. It is similar to a linter, but serves a slightly different function. Prettier will take your JS code and then automatically format it according to a set of rules. Unlike a linter, it's not looking for style errors, but specifically targeting the layout of your code and making intelligent decisions about things like spaces, indentation levels and line-breaks.

1. This [quick talk](https://www.youtube.com/watch?v=hkfBvpEfWdA) from Prettier's creator is a great introduction.
1. Give prettier a [test drive](https://prettier.io/playground). Go ahead and copy/paste some of your old JavaScript code into that editor and see what happens.
1. Setup is simple. [The homepage](https://prettier.io/) links to tutorials for most popular editors.

Using prettier makes coding faster and easier! You don't have to worry about nailing things like indentation, or remembering every semi-colon because prettier will take care of those details for you.

### Using ESLint and Prettier

We **highly** recommend that you install ESlint and Prettier and use them for all future projects. It will make your code easier to read, both for yourself and for anyone else looking at it.
However, using ESLint and Prettier together causes conflicts. To fix that follow the instructions to install [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier#installation). It turns off all ESLint rules that are unnecessary or might conflict with Prettier. Doing just this is enough to resolve the conflict and get them both working smoothly with one another.
Another way to address the conflict is to use `eslint-plugin-prettier`. It lets you run Prettier as if it were a rule in ESLint. However, doing this is [not recommended](https://prettier.io/docs/en/integrating-with-linters.html#notes).

### Template repositories

With the last few projects, you might have felt that setting up Webpack involved a fair few files and configuration, and that you may have had to look at what you configured before to copy and paste the configuration you want to reuse. You may also have noticed that whenever you create a new repository on Github, there is an option near the top for a `Repository template`.

This is where template repositories can come very much in handy. Any of your existing repositories can be converted to a template in its settings (right under where you can rename the repository, there is a checkbox for whether the repository is a template or not). If you check this box, congratulations, that's all you need to do! Now when you go to create a new repository, the `Repository template` dropdown will have any templates listed for you to select. Selecting one will mean your new repository will be a copy of the chosen template, not an empty one!

If you find yourself reusing a lot of setup code for multiple projects, you can make a new repository with all of the setup code you need then mark it as a template. Now you can select that template when creating a new project repository to save time getting set up, letting you dive into working on the project itself sooner!

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is linting?](https://mikecavaliere.com/javascript-linting-what-developers-need-to-know/)
- [Which problems can linting prevent?](https://mikecavaliere.com/javascript-linting-what-developers-need-to-know/)
- [Why should you use Prettier?](https://www.youtube.com/watch?v=hkfBvpEfWdA)
- [What is a template repository?](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
