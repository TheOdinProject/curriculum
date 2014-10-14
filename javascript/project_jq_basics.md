# Project: Manipulating the DOM with jQuery

Now that you've gotten your hands dirty and learned some real jQuery, it's time to apply it by generating an entire webpage using just Javascript and jQuery.  The webpage will be a simple restaurant home page but the principle of using Javascript to dynamically (re)render the page should stick with you.

## Your Task 

1. Set up a Github Repo for this project.  Follow the instructions atop the [Google Homepage project](/web-development-101/html-css) if you need help.
1. Set up a blank HTML document with just the `<html>` and `<body>` tags to begin with plus a single div called `<div id="content">`. Also, remember to include the jQuery library in your document within the '<head>'.
2. Go into the console (remember the developer tools at the bottom of your browser?) and manually use jQuery to add an image tag to the content div (just choose a random Internet image).  Remember that you can use the up arrow in the console to access your previous command.  Look at the [jQuery docs for the .append() function](https://api.jquery.com/append/) for inspiration.
3. Create a bare-bones home page for a restaurant.  Include an image, headline, and some copy about how wonderful the restaurant is.  It's okay to hard-code these into the HTML for now just to see how they look on the page.
2. Now remove those elements from the HTML (so leave only the `<html>`, `<body>`, and `<div id="content">` tags) and instead  create them by using Javascript only, e.g. by appending each new element to the `div#content` once the page is first loaded.
1. Next, set up your restaurant site to use tabbed browsing to access the Contact and Menu pages.  [Look at #7 on this hongkiat post](http://www.hongkiat.com/blog/50-nice-clean-css-tab-based-navigation-scripts/) for visual inspiration.  The key here is that each tab should NOT link to a different HTML page... it should instead trigger a Javascript function to wipe out the current page then create the desired page.  It might be easiest to first create three separate HTML pages and then convert them into Javascript.
2. Keep it simple!  When you click the next tab, your Javascript should automatically remove the "Menu" elements and add in the "Home" elements.
3. Push your project to Github and share the solution below.


*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

## Student Solutions
* jamie's [solution](https://github.com/Jberczel/odin-javascript/tree/master/restaurant) | [demo](http://htmlpreview.github.io/?https://github.com/Jberczel/odin-javascript/blob/master/restaurant/index.html)

* Afshin M's June '14 [solution](https://github.com/afshinator/js-tabbedPane) | [demo](http://htmlpreview.github.io/?https://github.com/afshinator/js-tabbedPane/blob/master/index.html)

* [Tom M's Solution](https://github.com/tim5046/projectOdin/tree/master/Javascript/Project2) | [demo] (http://htmlpreview.github.io/?https://github.com/tim5046/projectOdin/blob/master/Javascript/Project2/index.html) 

* [raystation's solution](http://raystation.github.io/odin-restaurant/)

* Marina Sergeyeva's [solution](https://github.com/imousterian/OdinProject/tree/master/Project5_2_DOM_jQuery) | [demo](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/Project5_2_DOM_jQuery/index.html)
* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/dom_manipulation) | [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/dom_manipulation/index.html)
* *Your solution here!*


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [How Browsers Work from HTML5Rocks](http://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)
