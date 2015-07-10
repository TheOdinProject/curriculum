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
* [jamie's solution](https://github.com/Jberczel/odin-javascript/tree/master/restaurant) | [View in browser](http://htmlpreview.github.io/?https://github.com/Jberczel/odin-javascript/blob/master/restaurant/index.html)
* [Afshin M's solution](https://github.com/afshinator/js-tabbedPane) | [View in browser](http://htmlpreview.github.io/?https://github.com/afshinator/js-tabbedPane/blob/master/index.html)
* [Tom M's Solution](https://github.com/tim5046/projectOdin/tree/master/Javascript/Project2) | [View in browser](http://htmlpreview.github.io/?https://github.com/tim5046/projectOdin/blob/master/Javascript/Project2/index.html)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project5_2_DOM_jQuery) | [View in browser](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/Project5_2_DOM_jQuery/index.html)
* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/dom_manipulation) | [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/dom_manipulation/index.html)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_06-JavaScript_and_jQuery/restaurant) | [View in browser](https://cdn.rawgit.com/craftykate/odin-project/master/Chapter_06-JavaScript_and_jQuery/restaurant/index.html)
* [Meher Chandan's solution](https://github.com/meherchandan/Restaurant) | [View in browser](https://myrestaurantwebsite.herokuapp.com/)
* [Michelle Pepe's solution](https://github.com/MichellePepe/Garden_Of_Eden_Restaurant) | [View in browser](https://github.com/MichellePepe/Garden_Of_Eden_Restaurant/blob/master/index.html)
* [Rodić's solution](https://github.com/Rodic/TOP---js-assignments/tree/master/Project%20-%20Manipulating%20the%20DOM%20with%20jQuery)
* [Nikola Čvorović's solution](https://github.com/cvorak/restaurant) | [View in browser](http://htmlpreview.github.io/?https://github.com/cvorak/restaurant/blob/master/index.html)
* [Ryan Jordan's solution](https://github.com/krjordan/jquery-basics) | [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/jquery-basics/blob/master/index.html)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPJS/tree/master/Project2) | [View in browser](https://htmlpreview.github.io/?https://github.com/ArturJanik/TOPJS/blob/master/Project2/index.html)
* [Jon Yorg's solution] (https://github.com/Yorgg/Javascript/tree/master/menu) | [View in browser](https://jsfiddle.net/qprk1daL/)
* [AtActionPark's solution] (https://github.com/AtActionPark/odin_dom_manipulation_with_jquery) | [View in browser](http://htmlpreview.github.io/?https://github.com/AtActionPark/odin_dom_manipulation_with_jquery/blob/master/main.html)
* Add your solution above this line!



## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [How Browsers Work from HTML5Rocks](http://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)
