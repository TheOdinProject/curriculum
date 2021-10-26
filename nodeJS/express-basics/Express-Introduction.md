In the previous lessons, you got up and running with Node. You learned how to serve up a multi-page website and read/write data from files on the server. You probably found that while it wasn't too difficult, the code was verbose and a little complicated.  However, you can easily see how complicated and hard to maintain things would get if you decided to start adding more features. [Express](https://expressjs.com/) is a tiny and simple framework that makes the things you did in the previous lessons even quicker and simpler, and does so in a way that makes projects even more easily extensible.

In this unit, we are going to be following the [express tutorial](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs) on MDN.  We'll go one lesson at a time, occasionally supplementing with a little deeper explanation or side projects to help you deepen your understanding of the material. There is a *ton* of information there, so be sure to take your time and READ EVERYTHING. The blue "notes" that are scattered throughout the tutorial often link to articles or other tutorials that will definitely improve your understanding of the content. Don't be lazy!

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

#### Express web framework

- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction#introducing_node" title="Permalink to Introducing Node"> Describe Express and Node's main benefits.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction#introducing_express" title="Permalink to Introducing Express"> Describe the relationship between Node and Express.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction#importing_and_creating_modules" title="Permalink to Importing and creating modules"> Explain what a module is and how Express fits in.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction#importing_and_creating_modules" title="Permalink to Importing and creating modules"> Import and create modules.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction/#using_asynchronous_apis" title="Permalink to Using asynchronous APIs"> Describe asynchronous APIs.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction/#creating_route_handlers" title="Permalink to Creating route handlers"> Describe and create route handlers.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction/#using_middleware" title="Permalink to Using middleware"> Describe and use middleware.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction/#handling_errors" title="Permalink to Handling errors"> Describe error handling in Express.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction/#file_structure" title="Permalink to File structure"> Describe what the main parts of an Express app might look like.</a>

#### Setting up a Node development environment

- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/development_environment#what_is_the_express_development_environment" title="Permalink to What is the Express&nbsp;development environment?"> Describe Express development environment.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/development_environment#adding_dependencies" title="Permalink to Adding dependencies"> Import Express into an application using NPM.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/development_environment#installing_the_express_application_generator" title="Permalink to Installing the Express Application Generator"> Create and run applications using the Express application generator tool.</a>
- <a class='knowledge-check-link' href="https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/development_environment" title="Permalink to Installing the Express Application Generator"> Set up a development environment for Express on your computer.</a>


### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read the [introductory lesson](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction) on the MDN website.  It is long but its main purpose is to show you the various bits and pieces that you'll be learning in the rest of the tutorial.  If you want you can code along a bit, but most of the examples aren't really intended for you to follow 100%.
*DO* read the entire thing!  Some of it will be a review, but that's OK! Follow the links that they give and at least look at them.  They are a vital part of this lesson and will often direct you to the relevant portion of the official express docs (which are quite good)! You'll want to be somewhat familiar with them when it comes time to do your own projects.
2. If you've gotten this far, you should already have node and npm set up and running smoothly. The second lesson on MDN's website walks you through setting them up and goes on to talk about a couple of ways to install and get started with Express. Read the [second half](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/development_environment#using_npm) of that article.
3. Once you're all set up, take a look at the simple Node site you created in our first project. Rewrite it using express! You should be able to do this with just one app.js file and a few `app.get()`s. 
</div>


### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

- The book [Express in Action](https://www.manning.com/books/express-in-action?a_bid=fe3fcff7&a_aid=express-in-action) by Evan M. Hahn is an incredible resource for Express beginners.
- [This](https://www.youtube.com/watch?v=L72fhGm1tfE) video crash course provides you with all the basic concepts.