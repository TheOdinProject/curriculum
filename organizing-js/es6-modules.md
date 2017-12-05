# ES6 modules

Separate from the __module pattern__ that we discussed in an earlier lesson, "modules" is a feature that arrived with ES6.  Browser support for this feature is quite slim at this point, but is slowly improving and until all modern browsers support it, we can make it work using an external module bundler.  ES6 modules are starting to appear in many codebases around the net and getting them and running will give us a chance to explore some new parts of the JavaScript ecosystem, so it's going to be a worthy excursion!

Don't be fooled! We're going to cover much more than just the new module syntax in this lesson!  Before we can really _use_ these modules we're going to have to learn about __npm__ and __webpack__ which  are both topics that will be _very_ useful to you even beyond this lesson.  In the end the modules themselves are simple to implement, so we're going to take this chance to learn about a few other things.

## npm

The __node package manager__ is a command line tool that gives you access to a gigantic repository of plugins, libraries and tools.  If you have done our Fundamentals course, you will likely have encountered it when you installed the Jasmine testing framework to do our exercises.

- Take a couple minutes to watch [this video](https://www.youtube.com/watch?v=x03fjb2VlGY) - a great introduction to npm.

There are multiple ways to install packages with npm onto your computer.  The nature of the package and how you intend to use it will determine which you use.  For now we are just going to install our packages globally so that we can use them directly from the command-line.  Later we will look at using npm packages directly in our code and will learn to install them directly into our project.

## webpack

Webpack is simply a tool for bundling modules.  There is a lot of talk across the net about how difficult and complex it is to set up and use, but at the moment our needs are few and the setup is simple enough.  In fact, you can see an example of getting it up and running on the front page of [their website](https://webpack.js.org/).