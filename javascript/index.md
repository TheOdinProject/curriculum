# Javascript

## This section is collecting resources right now

## Path

You've already learned Ruby, so many comparisons will be made with that.  If you haven't, hopefully you will still gain from seeing the two languages compared.  We won't assume you know Ruby, but it will be used for comparisons.  Later in the course, though, the project work will require you to use your Rails backends

This isn't a full course and you're not meant to follow every link! It's a suggested roadmap of content and then groupings of resources that can help you get there.

Reverse path??? Go to browser ASAP THEN work on fundies?  Probably best to do basic JS, then basic canvas, then deeper dive, then more advanced canvas?  lots of chicken-and-egg problems.

TODO:
* Points to Ponder for each section
* Intro for each section with high level coverage
* Smashing and AListApart magazines audit for resources
* Overall intro and conclusion
* Check and deploy

******************************************************************************
# SECTION: The Basics and the Browser

## Basic Javascript
  
Javascript is here to stay and, if you want to be a full-stack developer, you're going to need to learn more than just simple looping and DOM manipulation with jQuery.  You will need to understand how Javascript actually works in the same way you did with Ruby in order to learn Rails.  It's quite easy to get by hacking together simple browser interactions using a bit of Javascript and a healthy dose of jQuery.  

Your mission, though, is to be able to do a lot more than just hack together simple pages -- you need to feel comfortable building out completely new functionality in Javascript and working within large and established frameworks and code bases.  That means digging deep into what makes the language tick and what patterns get used again and again in the real world.

You should already have completed the [Web Development 101 Javascript lesson](/courses/web-development-101/lessons/javascript-basics), and this will really be a deeper coverage of each of those issues (much like Ruby Basics was for Ruby).

### Points to Ponder

* 
You've already done most of this...  Why you should care about JS.  Searching in strings, getting lengths of strings

### Links

(Everything after Codecademy is supplemental)

* [The entire Codecademy Javascript track](http://www.codecademy.com/tracks/javascript) (you already did up to lesson 5).
* [Javascript is Super Sexy](http://javascriptissexy.com/javascript-is-super-sexy/) is a good post for getting fired up to learn Javascript.
* [Javascript 101 from learn.jquery.com](http://learn.jquery.com/javascript-101/)
* [Javascript is Sexy](http://javascriptissexy.com/how-to-learn-javascript-properly/) is a blog that covers great technical depth on fundamental JS concepts.  We will use it often in the coming lessons.
* [Javascript and jQuery: The Missing Manual](http://mirror7.meh.or.id/Programming/JavaScript.and.jQuery.The.Missing.Manual.2nd.Edition.pdf) is a great book about JS.
* [Best Javascript Books](http://www.tripwiremagazine.com/2012/11/best-javascript-jquery-books.html)
* [Effective Javascript by David Herman](http://effectivejs.com/) is a concise but in-depth look at the concepts and patterns of Javascript.  It's got some great challenge problems as well.
* [JSNinja by John Resig](http://jsninja.com) covers advanced concepts aimed at the intermediate JS developer
* Stanford's iTunes U Javascript course ([link to find it here](http://itunes.stanford.edu/content/quickstart.html))
* [SuperheroJS, A great collection of advanced links](http://superherojs.com/)

## Project: Javascript Basics
  Drill-style bite-sized challenges

* [Tutorials for Javascript and jQuery from Jumpstart Lab](http://tutorials.jumpstartlab.com/)

## jQuery Basics

You should already have completed the [Web Deveploment 101 jQuery lesson](/courses/web-development-101/lessons/jquery-basics), and this will really be a deeper coverage of each of those issues (much like Ruby Basics was for Ruby).

  Overview, Selectors review, $, Document ready, selecting elements and implicit iteration of that, what's returned by DOM searches, creating elements, DOM traversal, getters and setters for attributes, chaining methods, using data attributes, 

* [jQuery Fundamentals from jqfundamentals.com](http://jqfundamentals.com) 
* [Learning jQuery from jquery.com](http://learn.jquery.com/)
* [jQuery docs](http://api.jquery.com) will be your savior again and again.  You'll probably find them via Google most of the time, but get used to the format they present information in because you'll be seeing a lot of it.
* [jQuery Reference Guide from Oscar Otero](http://oscarotero.com/jquery/)
* Watch people code cool stuff with [The Code Player](http://thecodeplayer.com/)
* [Working with the core of jQuery from learn.jquery.com](http://learn.jquery.com/using-jquery-core/)
* [jQuery FAQ from learn.jquery.com](http://learn.jquery.com/using-jquery-core/faq/)

## Project: Messing with the DOM
  Grab and change DOM elements dynamically and automatically alter text the user enters... generate a full page using just Javascript/jQuery (so just `<body>` tags and a `<div>` container to start with)

* [How Browsers Work from HTML5Rocks](http://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)

## Working with Events and Effects
  events binding, namespacing events, bubbling, (stopping) default actions, browser effects like fade(), using good CSS selectors and attributes,  delegating events for the DOM to listen to instead (for new element creation), building a model in your head of the order of operations for the browser loading and doing stuff, unbinding events

  * [jQuery Fundamentals from jqfundamentals.com](http://jqfundamentals.com)
  * [An Introduction to DOM Events](http://coding.smashingmagazine.com/2013/11/12/an-introduction-to-dom-events/)
  * [Events from learn.jquery.com](http://learn.jquery.com/events/)
  * [Effects from learn.jquery.com](http://learn.jquery.com/effects/)

## Project: jQuery and the DOM

Build a game that shuffles the DOM all over the place...  SNAKE!!!!  Remember that grid you created in Web dev 101...?

* [TheCodePlayer's Snake game with HTML5 canvas and jQuery](http://thecodeplayer.com/walkthrough/html5-game-tutorial-make-a-snake-game-using-html5-canvas-jquery)

## Building Widgets

jQuery is fun... here's why! Tooltips, modals, image sliders

* [jQuery UI from learn.jquery.com](http://learn.jquery.com/jquery-ui/)
* [jQuery for Designers from Web Designer Wall](http://www.webdesignerwall.com/demo/jquery/)
* [jQuery for Designers -- broken link?](http://jqueryfordesigners.com/)

## Project: Widgets

jQuery image carousel / slider with previews on hover, a tabbed website interface


******************************************************************************
# SECTION: Deeper into Javascript
  You can do a lot with just basic JS and jQuery and a hacker mindset.  But this section will take you deeper into how Javascript is actually doing things and will give you the tools to produce more advanced functionality for your sites.

## Comparing Javascript and Ruby: Going Functional
  Blocks are like anonymous functions, functions can be saved to variables (like Methods) and passed around, functions as "unchained" from their spot in Ruby.  Event-driven high level ideas.

### Links

* [Javascript for Ruby Programmers Video](https://www.youtube.com/watch?v=wWIGEM4E9iw&list=PLxNY6twFc_xCxdSPLlxUS4C0VO3sni2DA)

## Javascript Objects and "Classes" and Prototypes
  Similar to Ruby objects, functions can be variables in objects! Classes use ConstructorFunctions, using prototypes to share class methods and inherit and DRY up code, climbing the chain of prototypes until `null`

* [Understanding Objects in JS from JSIS](http://javascriptissexy.com/javascript-objects-in-detail/)
* [OOP in Javascript from JSIS](http://javascriptissexy.com/oop-in-javascript-what-you-need-to-know/)
* [Javascript Prototypes from JSIS](http://javascriptissexy.com/javascript-prototype-in-plain-detailed-language/)
* [Prototypes in Javascript from MSDN](http://msdn.microsoft.com/en-us/magazine/ff852808.aspx)

## Javascript Scopes and Closures
  With all these functions going around, we've got to keep track of scope!  setting `this` and replacing `self` from Ruby, use `that` and `bind`. Getting variables to helper functions that don't take them with implicit scoping.  Be careful of referencing variables outside your scope!  A function should ideally return the same thing all the time... but not in JS.  _privateVars that are not really private.  Another foreshadowing of event_driven/callbacks.  WHEN you call the function (method style or function style) matters for This.

  * [SO on "How do Javascript Closures Work?"](http://stackoverflow.com/questions/111102/how-do-javascript-closures-work)
  * [Understanding Javascript's `this` keyword from JSIS](http://javascriptissexy.com/understand-javascripts-this-with-clarity-and-master-it/)
  * [Javascript's `apply` `call` and `bind` methods](http://javascriptissexy.com/javascript-apply-call-and-bind-methods-are-essential-for-javascript-professionals/)

## Project: Javascript Scopes and Closures
  Redo the Ruby basic projects using Javascript.  Review running JS code (jsfiddle).  A basic OOP project that makes people define classes and prototypes. Build a simple game (with `prompt` for `gets`).  Note the run environment can't really be browser for a run loop.

* [Understanding JS Closures Completely from JSIS](http://javascriptissexy.com/understand-javascript-closures-with-ease/)
* [Understanding JS Variable Scope and Hoisting from JSIS](http://javascriptissexy.com/javascript-variable-scope-and-hoisting-explained/)

## Deep Dive into Functions
  Method-style vs function-style vs apply vs call vs constructors, arguments not required or overflowing, more inheritance and surrogates, 

* [Namespacing and using Modules in JS](http://www.codethinked.com/preparing-yourself-for-modern-javascript-development)
* [Another post on module patterns](http://www.adequatelygood.com/2010/3/JavaScript-Module-Pattern-In-Depth)
* [Common Javascript "Gotchas" from jbotus.com](http://www.jblotus.com/2013/01/13/common-javascript-gotchas/) is useful review of some of the things we've already covered.

## Project: Not-So-Basic Javscript
  More games and OOP projects that require fun callbacks

## Random Stuff: Functional Programming
  function args via currying

**************************************************************************
# SECTION: Advanced Browser Work

## Taking Javascript to the Browser
  Loading it in, playing nice with jQuery, blocking the browser or going async

## Living in an Event-Driven World
  JS as asynchronous in the browser, the importance of scope, Callbacks using Closures, ability to setTimeouts and why it's actually useful vs Ruby and async, why callbacks are more important than returns, 
  
  * [Understanding Callback Functions in Javascript by Recurial](http://recurial.com/programming/understanding-callback-functions-in-javascript/)
  * [Understanding Callback Functions in JS from JSIS](http://javascriptissexy.com/understand-javascript-callback-functions-and-use-them/)
  * [Callbacks, Listeners and Promises](http://sporto.github.com/blog/2012/12/09/callbacks-listeners-promises/)
  * [Using Deferred Functions and Promises (Video)](http://www.youtube.com/watch?v=juRtEEsHI9E)

## Organizing Your Code

* [Organizing your Code from learn.jquery.com](http://learn.jquery.com/code-organization/)

## Project: Browser-Based Gaming Intro
  Use callbacks and prompts instead of game loops

## Using Canvas to Draw and More

Canvas in the browser, Drawing with shapes, Using other canvas functionality

*[Canvas Deep Dive book](http://joshondesign.com/p/books/canvasdeepdive/toc.html) is the best explanation I've seen.  Do chapters 1-6.
* [Canvas Deep Dive book](http://joshondesign.com/p/books/canvasdeepdive/toc.html) chapters 7-14 get deep into how you can use Canvas as a sweet graphics and gaming tool.  Out of scope for this course, but could be fun if that's your thing.

## Project: Browser Games with Canvas
  Bring back one of the classics.  Find a tutorial ideally.


**************************************************************************
# SECTION: Linking the Browser to your Back End

## Front End Forms
working with forms (esp inputs), selecting elements, determining if elements are checked, validations, focusing, disabling, remembering security, styling error messages, 

## Project: Front End Forms

## AJAX
  AJAX, Async and JSON, convenience methods, maybe-Async functions, formatting and receiving formatted data from the server, handling errors, digging into JSON objects, 

* [AJAX from learn.jquery.com](http://learn.jquery.com/ajax)


## Project: AJAX and Forms
  Warmup: AJAX loading icon, work with a form-heavy project passing data back to... a Rails backend? hmm...  Form validations.  The OMDB API maybe?

## Working with Javascript APIs
  Flickr and Google Maps APIs

## Project: Putting Google Maps Onto Your Site
  Follow a tutorial to do so? GoMap?

## Additional Helpful Stuff

The Underscore library to make JS more Ruby-like, the jQuery methods that operate similarly, Rails' CSRF token grabbing, templating using underscore (ERB!), best practices: don't make a bunch of DOM calls (save to vars), basic Regex usage, Fast loading JS, Security

* [Underscore.js Documentation](http://underscorejs.org)
* ["Thinking Inside the Box with Vanilla Javascript" from Smashing Magazine](http://coding.smashingmagazine.com/2013/10/06/inside-the-box-with-vanilla-javascript/) provides a few helpful JS functions
* [(Video) Principles of Security by Douglas Crockford](http://www.youtube.com/watch?v=zKuFu19LgZA)

### Style Guides

* [AirBnB's JS Style Guide](https://github.com/airbnb/javascript) is very readable and helpful
* [Google's JS Style Guide](http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml)
* [Github's JS Style Guide](https://github.com/styleguide/javascript)
* [Contributing to jQuery Style Guide](http://contribute.jquery.org/style-guide/js/)

## Passing Data to the DOM
  Saving page loads using Async data AJAX-style

  *[Bootstrapping JSON data into a Rails View](http://jfire.io/blog/2012/04/30/how-to-securely-bootstrap-json-in-a-rails-view)


## Working with a Rails Backend and API
  Reread Rails lesson on building an API!

## Project: Working with Rails
  Build a simple Rails API to pass data to your app.  Something like that photo tagging app we did way back.

******************************************************************************
# SECTION: Single Page Apps and Server Side Javascript

## Node.js and Server-Side Javascript

* [Learn Node.js Completely from JSIS](http://javascriptissexy.com/learn-node-js-completely-and-with-confidence/)


## Javascript Templating and MVC Frameworks
  The basics of JS MVC's.  Too much additional scope to teach a framework, but we can go high level and follow a tutorial

* [Learn Backbone Completely from JSIS](http://javascriptissexy.com/learn-backbone-js-completely/)
* [Learning about Handlebars Templating from JSIS](http://javascriptissexy.com/handlebars-js-tutorial-learn-everything-about-handlebars-js-javascript-templating/)
* [Client-side Templating from Smashing Magazine](http://coding.smashingmagazine.com/2012/12/05/client-side-templating/)
* [Angular Learning Checklist](http://www.thinkster.io/pick/GtaQ0oMGIl/a-better-way-to-learn-angularjs)
* [An Introduction to Full Stack Javascript](http://coding.smashingmagazine.com/2013/11/21/introduction-to-full-stack-javascript/)
* [Seven Frameworks of JS from Steven Anderson](http://blog.stevensanderson.com/2012/08/01/rich-javascript-applications-the-seven-frameworks-throne-of-js-2012/)
* [Backbone.js on Ruby on Rails screencasts and example apps](http://www.backbonerails.com/)
* [Backbone.js tutorials](http://backbonetutorials.com/)
* [Building a Wine Cellar with Backbone.js](http://coenraets.org/blog/2011/12/backbone-js-wine-cellar-tutorial-part-1-getting-started/)
* [Angular.js video training resources](http://www.egghead.io)
* [The absolute beginner's guide to Node.js](http://blog.modulus.io/absolute-beginners-guide-to-nodejs)
* [Learn Node.js from the command line](https://github.com/rvagg/learnyounode)
* [Node.js Explained](http://kunkle.org/nodejs-explained-pres/)
* [Introduction to Full Stack Javascript from Smashing Magazine](http://coding.smashingmagazine.com/2013/11/21/introduction-to-full-stack-javascript/)
* [In-Depth Introduction to Ember.js from Smashing Magazine](http://coding.smashingmagazine.com/2013/11/07/an-in-depth-introduction-to-ember-js/)

## Project: Angular.js

Do an established Angular tutorial (backup: Backbone)

* [Angular Learning Checklist](http://www.thinkster.io/pick/GtaQ0oMGIl/a-better-way-to-learn-angularjs)

## Javascript Build Tools and Dependencies

* [http://javascriptissexy.com/learn-intermediate-and-advanced-javascript/)
* ["Can you help me understand the benefit of `require.js`?"](https://gist.github.com/desandro/4686136)

## Javascript Testing

* [Test-first javascript for testing](http://test-first.org)
* [Writing Testable Frontend JS -- Anti-patterns from Shane Tomlinson](https://shanetomlinson.com/2013/testing-javascript-frontend-part-1-anti-patterns-and-fixes/)
* [Writing Testable JS from Ben Cherry](http://www.adequatelygood.com/2010/7/Writing-Testable-JavaScript)
* [Make Tests Read like a Book from Wolfram Kriesing](http://uxebu.com/blog/2013/01/08/make-tests-read-like-a-book/)
* [(Video) Javascript Testing: The Holy Grail](http://www.youtube.com/watch?v=YdFQ29oK50M
* )

## Final Project
  It's big.

* [(Video) Development Workflow of 2013 by Paul Irish](http://www.youtube.com/watch?v=f7AU2Ozu8eo)

## Conclusion
  We can't teach you every single trick or tip for designing neat UI elements or scalable Javascript architectures, but at this point you should have a great base and you should be able to figure out how to do pretty much anything but Googling, looking at docs, and cruising through Stack Overflow posts.  
  Going from here: jQuery mobile for mobile, D3 for data vis, frameworks for performance, node for full stack, 

## Additional Resources

* [jQuery Mobile from learn.jquery.com](http://learn.jquery.com/jquery-mobile/)
* [PAID training webcasts on pretty much anything](https://www.bitcast.io/)
* [Giant meta-list of screencasts by Avdi Grimm](http://devblog.avdi.org/2013/06/21/a-list-of-programming-screencast-series/)
* [appendTo's Javascript track (incomplete)](http://learn.appendto.com/lesson/javascript-101)
* [Front End Programming best practices from betterfrontend](http://betterfrontend.com/)
* [D3 and other visualization tool examples](http://tributary.io)






