### Introduction

INTRO

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand what npm is.
- Understand the purpose of the `package.json` file.

### npm

**npm** (no capitals!) is a package manager - a gigantic repository of plugins, libraries, and other tools, which provides us with a command-line tool we can use to install these tools (that we call "packages") in our applications. We will then have all our installed packages' code locally, which we can import into our own files. We could even publish our own code to npm!

You may recall installing npm in the Foundations course in order to install the Jest testing framework to do the JavaScript exercises. Funnily enough, [npm does not stand for "Node Package Manager"](https://www.npmjs.com/package/npm#is-npm-an-acronym-for-node-package-manager), though you will often see it referred to as such.

If you are in the Full Stack Ruby on Rails pathway, you will have already been introduced to Yarn, an alternative package manager. For this course, we will be using npm.

As our applications get more complex and more and more files are needed (whether they are our own files or files from packages we installed and imported), managing many of these dependencies can become rather troublesome, especially when packages get updated. This can get even more troublesome when we consider that we may end up sending *many* JavaScript files to the browser to download. In the next lesson, we will introduce bundlers, tools that lets us write multiple files that are better for us to work with, then bundle them together into fewer smaller files which will ultimately be sent to the browser instead.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read a bit about npm, packages, and dependencies:
   1. [Installing packages with npm](https://docs.npmjs.com/downloading-and-installing-packages-locally).
   1. Read about [the `package.json` file](https://docs.npmjs.com/creating-a-package-json-file), the file that stores much of the information for our app, including all the packages installed in it. npm uses this file to do things like install the right packages, update to the correct versions etc. Don't worry too much with the details, just know what its basic function is, as it will help with the next few lessons and beyond.
   1. Any packages we install are called "dependencies", but if any packages are only used during the development process and their code is not needed for the user-facing app (such as the Jest testing framework), we call them [development dependencies](https://dev.to/mshertzberg/demystifying-devdependencies-and-dependencies-5ege).
1. Here is a great little [history lesson about JavaScript and managing packages across multiple files](https://peterxjang.com/blog/modern-javascript-explained-for-dinosaurs.html). Only read up to "Using a JavaScript module bundler (webpack)", as we will cover bundlers and webpack in the next lesson.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is npm?](#npm)
- [What file does npm use that contains all information about dependencies?](https://docs.npmjs.com/creating-a-package-json-file)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
