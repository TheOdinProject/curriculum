
TODO:
1. DONE make lessons into files
2. DONE Update file URLs
3. DONE Massage lessons into real lessons
4. DONE Rework the ordering to create more sections
5. DONE Fill in lesson descriptions
6. DONE Fill in projects
7. DONE Fill in Project descriptions
6. DONE SEO up the titles
7. DONE Finalize ordering
8. ??? P2P on javascript APIs
8. Add to seeds and Deploy
9. Flesh out incomplete projects

## The Basics and the Browser

### Description

We'll zoom through the basics of Javascript and how it's used in the browser with jQuery.  This where things get really fun, since you get to immediately see everything you're building in the browser.  By the end of this section, you'll actually know everything you need to build fun and interesting front-ends but, of course, it's really just the beginning.

1. How This Course Will Work
    /introduction.md
    Let's get you started on the right foot.
2. Javascript Basics
    /js_basics.md
    A deep dive back into the basics to make sure you've got the proper foundation for what's coming next.
3. PROJECT: On Screen Calculator
    /project_js_basics.md
    Get warmed up with some JS calisthenics and by building an on-screen calculator.
4. jQuery Basics
    /jq_basics.md
    Another deep dive into the basics, this time focusing on using jQuery to manipulate elements on the page.
5. PROJECT: Manipulating the DOM with jQuery
    /project_jq_basics.md
    Create a single-page restaurant app completely using Javascript and jQuery.
9. Organizing Your Code and More
    /organizing_code.md
    Here we'll cover everything from using best practices for organizing your code to helpful libraries and security.


## Events, Effects and Widgets

### Description
Events drive just about everything you'll do with Javascript in the browser. We'll take a closer look at how they work and the kinds of things that they allow you to do.

6. Working with Events and Effects
    /events_effects.md
    Learn how to use events to drive your user experience.
7. PROJECT: jQuery and the DOM
    /project_events_effects.md
    Build a Snake game, just like you probably played in 2-color on your first cell phone.
8. Using jQuery UI to Build Widgets
    /widgets.md
    See the fun side of jQuery by checking out some of the nifty widgets you can build with it.
9. PROJECT: Creating an Image Carousel/Slider
    /project_widgets.md
    Get some practice building widgets of your own by creating an image carousel just like what you find on many websites in the wild.

## Deeper into Javascript

### Description
You can do a lot with just basic Javascript, jQuery and a hacker mindset.  But this section will take you deeper into how Javascript is actually doing things and it will give you the tools to produce more advanced functionality for your sites.  Some of the previous projects have probably tested the boundaries of your understanding of Javascript, and here we'll fix that.

1. Objects, 'Classes', and Prototypes
    /objects_prototypes.md
    Learn how to effectively use Javascript objects and DRY up your code with Prototypes.
2. Scope and Closures
    /scope_closures.md
    Scope gets a bit tricky in Javascript because functions are being passed around and called in many different contexts.
3. PROJECT: Tic Tac Toe
    /project_scopes_closures.md
    Let's bring the classic Tic Tac Toe game to the browser.
4. Comparing Javascript and Ruby: Going Functional
    /comparing_to_ruby.md
    A brief primer for translating your Ruby knowledge into Javascript 
5. Really Understanding Functions in Javascript
    /deep_dive_functions.md
    Functions are first class citizens in Javascript, and here you'll see why.
6. PROJECT: Minesweeper
    /project_functions.md
    It's time to get a bit more complex by bringing back minesweeper, the only decent game that used to come with Windows back in the day.

## Advanced Browser Work

### Description
There's a whole lot more to using Javascript in the browser than just manipulating simple DOM elements with jQuery.  If you want to grab data from external sites or your own back end, submit forms, or handle more complicated games, you'll need to dig deeper into how Javascript handles things like callbacks.  Here we'll also cover how to build games using HTML5's `<canvas>` element, which lets you use Javascript logic to draw shapes.  

1. Loading Javascript in the Browser
    /js_to_browser.md
    A very quick look at how and when to load Javascript.
2. Callbacks: Living in an Event-Driven World
    /event_driven.md
    This will connect what you know about events with a standard pattern for hooking into those events -- the callback.
4. PROJECT: Callbacks
    /project_callbacks.md
    A chance to apply what you've learned about callbacks by building another in-browser app.
5. Using Canvas to Draw and More
    /canvas.md
    Once you can use canvas, you're only limited by your creativity (and maybe your geometry skills).
6. PROJECT: Building Games with Canvas
    /project_canvas.md
    You'll see how much fun it can be to build with canvas as we bring back the classics with Missile Command!

## Better Forms with jQuery and AJAX

### Description
In this section you'll learn about AJAX, the technology which allows you to send data from the browser to your web application without needing to refresh the page.  It's commonly used with forms, but really represents a whole world of possibility for crafting performant user experiences.

1. Validating Form Inputs Using jQuery
    /jquery_forms.md
    You're an expert in forms by now, but here we'll focus on using jQuery to hook into them.
2. PROJECT: Validating a Form with jQuery
    /project_forms.md
    A chance to use jQuery's Validate plugin and then roll your own form validation.
3. Submitting a Form Without Reloading by Using AJAX
    /ajax.md
    AJAX is the missing link between a seamless client-side experience and your server-side code.
4. PROJECT: Infinite Scroll and Submitting a Form with AJAX
    /project_ajax_forms.md
    We'll play with using AJAX calls to an open API called the OMDB, creating a simple submission form and a movies display that never stops giving you movies when you scroll down.

## Linking to APIs and Your Rails Back End

### Description
A real web app needs a back end in order to persist its data and do sensitive operations.  Here you'll learn how to handle use AJAX to send data requests to your Rails back end.  You'll also get a chance to work with external APIs like Google Maps, which is something you'll probably find yourself doing quite frequently as you build your own projects in the future.

1. Working with Javascript APIs
    /javascript_apis.md
    Working with external APIs from the client side can be a great way to easily add varied and dynamic functionality to your sites.
2. PROJECT: Putting Google Maps Onto Your Site
    /project_apis.md
    Just about every business has a contact page with a map pointing to their location.  Build one with the Google Maps API.
3. Using Ruby on Rails For Your Back End
    /rails_backend.md
    You've got experience working with APIs, now it's time to treat your Rails app like one.
4. PROJECT: Where's Waldo (A Photo Tagging App)
    /project_rails_backend.md
    Pull together everything you've learned so far to create a \"Where's Waldo?\" game.

## Server Side Javascript and Javascript Frameworks

### Description
This is an **OPTIONAL** section where you will learn about using Javascript to run your server (instead of Ruby) and also about Javascript frameworks which let you build a full website as a single page run by Javascript to create blazing fast user experiences.

1. Node.js and Server-Side Javascript
    /server_side_js.md
    These days you never have to leave your beloved Javascript behind because now it can run on the server side too with Node.
2. PROJECT: Node.js
    /project_node.md
    Fire up a Node server and play around with it, because that's how we learn.
3. Using Templates
    /templating.md
    Templating brings the magical re-usability of layouts to the client side.
4. Javascript MV* Frameworks Like Angular.js and Backbone.js
    /js_frameworks.md
    The new crop of Javascript frameworks will help organize your tangled mess of AJAX calls, templates, and jQuery updates and will turbo charge your ability to produce excellent front ends.
5. PROJECT: Building Single Page Websites with Angular.js and Backbone.js
    /project_js_frameworks.md
    Take a framework of your choice for a test drive with these established tutorials.
6. Workflow Tools, Tech Stacks and Dependency Management
    /workflow_tools.md
    A few tools that are meant to clean up your worfklows.

## Finishing Up with Javascript

### Description
You've learned everything you need and all that remains to do is apply that knowledge to a worthy task.  In this section, we'll briefly cover how to test Javascript using Jasmine and then get you started with your capstone project so you can show off your range of skills.

7. Javascript Testing with Jasmine
    /js_testing.md
    ...because if you can't test it, you won't know when you've broken it.
8. PROJECT: Final Project
    /project_final_js.md
    Tie everything you've learned from every course so far into one project where you'll build your favorite website from scratch.
9. Conclusion
    /conclusion.md
    Well, that was easy, right?




























