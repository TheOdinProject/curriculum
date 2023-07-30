### Introduction

Before we dive all the way into the Code, we are going to take a moment to improve your editor setup. Doing this now will make things much easier for you going forward. This lesson will give you some information about code style, and then give you some tools to help you maintain consistent code-style throughout your projects.  In some cases it can even help adjust things like indentation for you!

### Style guides

Code style is important! Having a consistent set of style rules for things such as indentation or preferred quote style makes your code more maintainable and easier to read. There are several popular JavaScript style guides on the net that set standards for these types of things, and a little time spent reading them _will_ make you a better developer. 

1. The [Airbnb Style Guide](https://github.com/airbnb/javascript) is one of the most popular. It is also very well formatted and easy to read.
2. Google also has their own [style guide](https://google.github.io/styleguide/jsguide.html) for JavaScript.
3. The [JavaScript Standard Style](https://standardjs.com/rules.html). Used by companies like NPM and GitHub, among [others](https://standardjs.com/index.html#who-uses-javascript-standard-style).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Set up a linter and prettier to make your code better.

### Linting

The style guides we mentioned above are full of really helpful advice for formatting, organizing and composing your code. But there are a _lot_ of rules - it can be difficult to internalize them all. **Linters** are tools that will scan your code with a set of style rules and will report any errors to you that they find. In some cases, they can even auto-fix the errors! The following articles explain in more detail the benefits of using a linter while you code.

1. [This article](https://gomakethings.com/javascript-linters/) gets right to the point... start here!
2. [This article](https://hackernoon.com/how-linting-and-eslint-improve-code-quality-fa83d2469efe) goes a little further by discussing exactly _how_ linters do what they do.

There are multiple options for linting your JavaScript, but the most popular (and most common in the industry) is [eslint](https://eslint.org/). Getting it installed and the initial set-up is fairly simple.

1. [The official 'Getting Started' page](https://eslint.org/docs/user-guide/getting-started) is a good place to start. It covers installation and basic setup. The basic way to use this tool is to simply run the `eslint` command in your terminal with a specific file.
2. Far more useful are linting plugins for your favorite text editor. Most editor plugins allow you to automatically lint your code as you are writing it, and will show the errors right in the editor, which makes resolving them _much_ simpler. We can't cover _every_ editor installation but some of the more popular are:
   1. Visual Studio Code - [The Plugin](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) and [a tutorial](https://www.digitalocean.com/community/tutorials/linting-and-formatting-with-eslint-in-vs-code).
   2. Sublime Text - [The Plugin](https://github.com/roadhump/SublimeLinter-eslint) and [a tutorial](http://jonathancreamer.com/setup-eslint-with-es6-in-sublime-text/).
   3. Atom - [The Plugin](https://atom.io/packages/linter-eslint) and [a tutorial](https://medium.freecodecamp.org/how-to-set-up-eslint-in-atom-to-contribute-to-freecodecamp-3467dee86e2c).
   4. Vim - [Use the ALE plugin](https://github.com/dense-analysis/ale). If you use Vim you already know what you're getting into. ALE is a great plugin, but the setup and configuration can be a little tricky.

### Prettier

Prettier is _awesome_. It is similar to a linter, but serves a slightly different function. Prettier will take your JS code and then automatically format it according to a set of rules. Unlike a linter, it's not looking for style errors, but specifically targeting the layout of your code and making intelligent decisions about things like spaces, indentation levels and line-breaks.

1. [This quick talk](https://www.youtube.com/watch?v=hkfBvpEfWdA) from Prettier's creator is a great introduction.
2. Give it a test drive [here](https://prettier.io/playground). Go ahead and copy/paste some of your old JavaScript code into that editor and see what happens.
3. Setup is simple. [The homepage](https://prettier.io/) links to tutorials for most popular editors.

Using prettier makes coding faster and easier! You don't have to worry about nailing things like indentation, or remembering every semi-colon because prettier will take care of those details for you.

### Using ESLint and Prettier

We **highly** recommend that you install ESlint and Prettier and use them for all future projects. It will make your code easier to read, both for yourself and for anyone else looking at it.
However, using ESLint and Prettier together causes conflicts. To fix that follow the instructions to install [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier#installation). It turns off all ESLint rules that are unnecessary or might conflict with Prettier. Doing just this is enough to resolve the conflict and get them both working smoothly with one another.
Another way to address the conflict is to use `eslint-plugin-prettier`. It lets you run Prettier as if it were a rule in ESLint. However, doing this is **not recommended**. You can learn more about it [here](https://prettier.io/docs/en/integrating-with-linters.html#notes).

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [What is linting?](https://mikecavaliere.com/javascript-linting-what-developers-need-to-know/)
- [Which problems can linting prevent?](https://mikecavaliere.com/javascript-linting-what-developers-need-to-know/)
- [Why should you use Prettier?](https://www.youtube.com/watch?v=hkfBvpEfWdA)
