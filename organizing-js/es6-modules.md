# ES6 modules

Separate from the __module pattern__ that we discussed in an earlier lesson, "modules" is a feature that arrived with ES6.  Browser support for this feature is quite slim at this point, but is slowly improving and until all modern browsers support it, we can make it work using an external module bundler.  ES6 modules are starting to appear in many codebases around the net and getting them and running will give us a chance to explore some new parts of the JavaScript ecosystem, so it's going to be a worthy excursion!

Don't be fooled! We're going to cover much more than just the new module syntax in this lesson!  Before we can really _use_ these modules we're going to have to learn about __npm__ and __webpack__ which  are both topics that will be _very_ useful to you even beyond this lesson.  In the end the modules themselves are simple to implement, so we're going to take this chance to learn about a few other things.

## first things first

Why do we even need or want this stuff?  What do you gain from all of this added complexity?  These are good questions.. with good answers.

- Read [this article](https://medium.com/the-node-js-collection/modern-javascript-explained-for-dinosaurs-f695e9747b70) for a bit of a history lesson.  It's long, but it puts what we're doing here in great perspective.  You don't _have_ to code along with the examples - the tutorials we cover later will go through basically the same process. But it's good practice and going through the same process multiple times will help it stick faster.
- Seriously.. spend some time with that article it really clarifies the 'WHY' of the rest of this lesson.

## npm

The __node package manager__ is a command line tool that gives you access to a gigantic repository of plugins, libraries and tools.  If you have done our Fundamentals course, you will likely have encountered it when you installed the Jasmine testing framework to do our exercises.

1. Take a couple minutes to watch [this video](https://docs.npmjs.com/getting-started/what-is-npm) - a great introduction to npm.
2. [This video](https://docs.npmjs.com/getting-started/installing-npm-packages-locally) teaches you how to install packages with npm.
3. [This tutorial](https://docs.npmjs.com/getting-started/using-a-package.json) covers the `package.json` file, which you can use to manage your project's dependencies
4. If you run into trouble at any point you can check out [the official docs page](https://docs.npmjs.com/) for more tutorials and documentation.

### Yarn?

At some point you will probably run into [Yarn](https://yarnpkg.com/en/) - a replacement for the default `npm`.  For the most part it does the same things, though it _does_ have a few more features.  Recent versions of `npm` have incorporated some of the best features of Yarn, so using it won't offer you any real advantages at this point in your career.  It _is_ a fine project, however, and may be worth your consideration in the future.

## webpack

Webpack is simply a tool for bundling modules.  There is a lot of talk across the net about how difficult and complex it is to set up and use, but at the moment our needs are few and the setup is simple enough.  In fact, you can see an example of getting it up and running on the front page of [their website](https://webpack.js.org/).

Webpack _is_ a very powerful tool, and with that power comes a decent amount of complexity - just look at the sample config file on [this page](https://webpack.js.org/configuration/) 😱. Don't let it scare you off!  The basic configuration is not difficult and proficiency with webpack looks _amazing_ on resumes.

To get us started we are going to refer to the official documentation.

1. Code along with the first four steps of [this tutorial](https://webpack.js.org/guides/getting-started/) ("Basic Setup" through "Using a Configuration")

Lets discuss what's going on there. After installing webpack using npm we set up a simple project that required an external library (lodash - check it out [here](https://lodash.com/) if it's new to you) using a simple `script` tag.  The site lists a few reasons why this is probably _not_ ideal and then steps through using webpack to accomplish the same thing.

There are a couple of key concepts to understanding how webpack works - __entry__ and __output__.  In this example, we rearranged the files into a `src` and `dist` folder.  Technically we could have called those folders anything, but those names are typical.  `src` is our _source_ directory.  In other words, `src` is where we write all of the code that webpack is going to bundle up for us.  When webpack runs, it goes through all of our files looking for any `import` statements and then compiles _all_ of the code we need to run our site into a single file inside of the `dist` folder (short for _distrubution_).  Our __entry__ file, then is the main application file that links (either directly or indirectly) to all of the other modules in our project.  In this example it is `/src/index.js`.  The __output__ file is the compiled version - `dist/bundle.js`.

- browse [this document](https://webpack.js.org/concepts/) for more details.  We'll talk plugins and loaders in another lesson.

## ES6 Modules (finally!)

Now that we (sorta) understand what webpack is doing it's time to discuss the module syntax.  There are only 2 components to it - __import__ and __export__.

- Take a moment to look at the docs for [import](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import) and [export](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export).

Of course, the import statement is the same thing that you used during the webpack tutorial!  These things are simple to use.

~~~javascript
// a file called functionOne.js
const functionOne = () => console.log('FUNCTION ONE!')

export functionOne
~~~

~~~javascript
// another JS file
import functionOne from './functionOne'

functionOne() //this should work as expected!
~~~

There are _many_ benefits to writing your code in modules.  One of the most compelling is code reuse.  If, for instance, you have written some functions that manipulate the DOM in a specific way, putting all of those into their own file as a 'module' means that you can copy that file and re-use it very easily!

Other benefits include all of the benefits to wrapping your code in factory functions or using the module pattern (the module pattern and es6 modules are not the same thing.. this naming convention is frustrating).  By using es6 modules you can keep different parts your code cleanly separated, which makes writing and maintaining your code much easier and less error prone.  Keep in mind that you can _definitely_ export constructors, classes and factory functions from your modules.

To pull it all together, let's write a simple module and then include it in our code.  We are going to continue from where the webpack tutorial left off.  Before beginning your file directory should look something like this:

~~~
├── dist
│   ├── bundle.js
│   └── index.html
├── src
│   └── index.js
├── package-lock.json
├── package.json
└── webpack.config.js
~~~

and you should be able to bundle and run webpack by simply typing `webpack` in the terminal.

Add a new file to the `src` directory called `myName.js` with the following contents:

~~~ javascript
const myName = (name) => 'Hi! My name is ' + name;

export default myName
~~~

and then in `src/index.html` import and use your new function.

~~~javascript
// import your function
import myName from './myName';

function component() {
  var element = document.createElement('div');
  
  // use your function!
  element.innerHTML = myName('Cody');
  return element;
}

  document.body.appendChild(component());

~~~

Easy!  Now, if you run `webpack` in your project directory your page should show our new function being used.

There are 2 different ways to use exports in your code - named exports and default exports.  Which option you use depends on what you're exporting.  As a general rule if you want to export multiple functions use named exports with this pattern:

~~~javascript
const functionOne = () => 'ONE'
const functionTwo = () => 'TWO'

export {
	functionOne,
  	functionTwo
}
~~~

and to import them:

~~~javascript
import {functionOne, functionTwo} from './myModule'
~~~

Using this pattern gives you the freedom to only import the functions you need in the various files of your program. So it's perfectly fine to only import `functionOne` if that's the only one you need.

The various import/export methods are best explained in the docs that we linked earlier - [import](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import) and [export](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export).

## Practice

Lets use what we've learned and take a chance to continue practicing DOM manipulation - dynamically rendering a simple restaurant homepage!  By the end of it we are going to be using only JavaScript to generate the entire contents of the website!

1. Start the project the same way you began the webpack tutorial project.
   1. run `npm init` in your project directory to generate a `package.json` file
   2. run `npm install --save-dev webpack` to install webpack to the node_modules directory of your project.
   3. Create a `src` and `dist` directory with the following contents:
      1. an `index.js` file in `src`
      2. an `index.html` file in `dist`.  Go ahead and link the `bundle.js` file in a script tag.  `bundle.js` is the file that will be generated by webpack.
   4. create a `webpack.config.js` file that looks just like our file from the tutorial.
2. Set up an HTML skeleton inside of `dist/index.html` with single `<div id="content">`.
3. Inside of `src/index.js` write a simple console.log or alert statement and then run `webpack`.  Load up `dist/index.html` in a browser to make sure everything is working correctly.
4. Create a bare-bones home page for a restaurant. Include an image, headline, and some copy about how wonderful the restaurant is. It’s okay to hard-code these into the HTML for now just to see how they look on the page.
5. Now remove those elements from the HTML (so leave only the `<html>`, `<body>`, and `<div id="content">` tags) and instead create them by using Javascript only, e.g. by appending each new element to the `div#content`once the page is first loaded.  Since we're all set up to write our code in multiple files write this initial page-load function inside of it's own module and then import and call it inside of `index.js`
6. Next, set up your restaurant site to use tabbed browsing to access the Contact and Menu pages. [Look at #7 on this hongkiat post](http://www.hongkiat.com/blog/50-nice-clean-css-tab-based-navigation-scripts/) for visual inspiration. 
   1. Put the contents of each 'tab' inside of it's own module. Each module will export a function that creates a div element, adds the appropriate content and styles to that element and then appends it to the DOM
   2. Write the tab-switching logic inside of `index.js`.  You should have event listeners for each tab that wipes out the current contents and then runs the correct 'tab module' to populate it again.
7. If you are using GitHub pages to host your completed page you need to do a tiny bit more work to get it to show up.  After running `webpack` the full bundled version of your site is available in the `dist` folder, but GH pages is looking for an index.html in the root directory of your project.
   1. Make a new git branch called `gh-pages`.  In that branch simply move the `dist` folder to the root directory.  Feel free to delete the rest of the files on that branch.. all you need is the `index.html` and `bundle.js`.
   2. When you tell GitHub to set up GH pages simply direct it to your `gh-pages` branch instead of master.