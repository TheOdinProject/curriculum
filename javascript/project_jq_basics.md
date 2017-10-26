### Introduction
Now that you've gotten your hands dirty and learned some real jQuery, it's time to apply it by generating an entire webpage using just Javascript and jQuery.  The webpage will be a simple restaurant home page but the principle of using Javascript to dynamically (re)render the page should stick with you.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Set up a Github Repo for this project.  Follow the instructions atop the [Google Homepage project](/courses/web-development-101/lessons/html-css) if you need help.
2. Set up a blank HTML document with just the `<html>` and `<body>` tags to begin with plus a single div called `<div id="content">`. Also, remember to include the jQuery library in your document within the `<head>`.
3. Go into the console (remember the developer tools at the bottom of your browser?) and manually use jQuery to add an image tag to the content div (just choose a random Internet image).  Remember that you can use the up arrow in the console to access your previous command.  Look at the [jQuery docs for the .append() function](https://api.jquery.com/append/) for inspiration.
4. Create a bare-bones home page for a restaurant.  Include an image, headline, and some copy about how wonderful the restaurant is.  It's okay to hard-code these into the HTML for now just to see how they look on the page.
5. Now remove those elements from the HTML (so leave only the `<html>`, `<body>`, and `<div id="content">` tags) and instead  create them by using Javascript only, e.g. by appending each new element to the `div#content` once the page is first loaded.
6. Next, set up your restaurant site to use tabbed browsing to access the Contact and Menu pages.  [Look at #7 on this hongkiat post](http://www.hongkiat.com/blog/50-nice-clean-css-tab-based-navigation-scripts/) for visual inspiration.  The key here is that each tab should NOT link to a different HTML page... it should instead trigger a Javascript function to wipe out the current page then create the desired page.  It might be easiest to first create three separate HTML pages and then convert them into Javascript.
7. Keep it simple!  When you click the next tab, your Javascript should automatically remove the "Menu" elements and add in the "Home" elements.
8. Push your project to Github and share the solution below.
</div>


### Student Solutions
Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.

* Add your solution below this line!
* [Flint Mayers' solution](https://github.com/FlintMayers/odin-jquery-dom-manipulation) - [View in browser](https://flintmayers.github.io/odin-jquery-dom-manipulation/)
* [Rhys B's solution](https://github.com/105ron/js-restaurant) - [View in browser](https://105ron.github.io/js-restaurant/)
* [Austin's solution](https://github.com/CouchofTomato/restaurant) - [View in browser](https://couchoftomato.github.io/restaurant/)
* [Axel's solution](https://github.com/afuh/react-browsing) - [View in browser](https://afuh.github.io/react-browsing/)
* [jamie's solution](https://github.com/Jberczel/odin-javascript/tree/master/restaurant) - [View in browser](http://htmlpreview.github.io/?https://github.com/Jberczel/odin-javascript/blob/master/restaurant/index.html)
* [Afshin M's solution](https://github.com/afshinator/js-tabbedPane) - [View in browser](http://htmlpreview.github.io/?https://github.com/afshinator/js-tabbedPane/blob/master/index.html)
* [Tom M's Solution](https://github.com/tim5046/projectOdin/tree/master/Javascript/Project2) - [View in browser](http://htmlpreview.github.io/?https://github.com/tim5046/projectOdin/blob/master/Javascript/Project2/index.html)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project5_2_DOM_jQuery) - [View in browser](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/Project5_2_DOM_jQuery/index.html)
* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/dom_manipulation) - [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/dom_manipulation/index.html)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_06-JavaScript_and_jQuery/restaurant) - [View in browser](https://cdn.rawgit.com/craftykate/odin-project/master/Chapter_06-JavaScript_and_jQuery/restaurant/index.html)
* [Meher Chandan's solution](https://github.com/meherchandan/Restaurant) - [View in browser](https://myrestaurantwebsite.herokuapp.com/)
* [Michelle Pepe's solution](https://github.com/MichellePepe/Garden_Of_Eden_Restaurant) - [View in browser](https://github.com/MichellePepe/Garden_Of_Eden_Restaurant/blob/master/index.html)
* [Rodić's solution](https://github.com/rodic/TOP---js-assignments/tree/master/Project%20-%20Manipulating%20the%20DOM%20with%20jQuery)
* [Nikola Čvorović's solution](https://github.com/cvorak/restaurant) - [View in browser](http://htmlpreview.github.io/?https://github.com/cvorak/restaurant/blob/master/index.html)
* [Ryan Jordan's solution](https://github.com/krjordan/odin-project/tree/master/jquery-basics) - [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/odin-project/tree/master/jquery-basics/index.html)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPJS/tree/master/Project2) - [View in browser](https://htmlpreview.github.io/?https://github.com/ArturJanik/TOPJS/blob/master/Project2/index.html)
* [Jon Yorg's solution](https://github.com/Yorgg/Javascript/tree/master/menu) - [View in browser](https://jsfiddle.net/qprk1daL/)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_dom_manipulation_with_jquery) - [View in browser](http://htmlpreview.github.io/?https://github.com/AtActionPark/odin_dom_manipulation_with_jquery/blob/master/main.html)
* [dchen71's solution](https://github.com/dchen71/odin-dom_manipulation) - [View in browser](https://rawgit.com/dchen71/odin-dom_manipulation/master/Index.html)
* [AyeSea's solution](https://github.com/AyeSea/odin-dom-manipulation) - [View in browser](https://htmlpreview.github.io/?https://github.com/AyeSea/odin-dom-manipulation/blob/master/index.html)
* [Dan's solution](https://github.com/vickerdj/dommanip) [View in browser](http://vickerdj.github.io/dommanip/)
* [Pauline Judge's solution](https://github.com/chumswap/restaurantSite) - [View in browser](https://htmlpreview.github.io/?https://github.com/chumswap/restaurantSite/blob/master/restaurant.html)
* [Trajanson's solution](https://github.com/Trajanson/jquery-restaurant-js) - [View in browser](http://projects.trajanson.com/js-restaurant/)
* [Cameron Kelley's solution](https://github.com/cameronjkelley/the_odin_project/tree/master/javascript/restaurant) - [View in browser](https://htmlpreview.github.io/?https://github.com/cameronjkelley/the_odin_project/blob/master/javascript/restaurant/index.html)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/javascript/dom-manipulation) - [View in browser](https://rawgit.com/cdouglass/odin-project-exercises/master/javascript/dom-manipulation/tabs.html)
* [Patrick Mallee's solution](https://github.com/patmallee/menu) - [View in browser](http://htmlpreview.github.io/?https://github.com/patmallee/menu/blob/master/menu.html)
* [J-kaizen's solution](https://github.com/J-kaizen/TheOdinProject/tree/master/JS/re_render) - [View in browser](http://htmlpreview.github.io/?https://github.com/J-kaizen/TheOdinProject/blob/master/JS/re_render/index.html)
* [Miguel Herrera's solution](https://github.com/migueloherrera/restaurant) - [View in browser](http://htmlpreview.github.io/?https://github.com/migueloherrera/restaurant/blob/master/index.html)
* [Cyprium (Stefan)'s solution](https://github.com/dev-cyprium/Restaurant) - [View in browser](https://htmlpreview.github.io/?https://github.com/dev-cyprium/Restaurant/blob/master/index.html)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/dom-manipulation) - [View in Browser](http://htmlpreview.github.io/?https://github.com/ShalaQweghen/dom-manipulation/blob/master/index.html)
* [Mayowa Pitan's solution](https://github.com/andela-mpitan/jquery-restaurant) - [View in Browser](https://andela-mpitan.github.io/jquery-restaurant/)
* [David Chapman's solution](https://github.com/davidchappy/odin_training_projects/tree/master/jq_restaurant)
* [Daunenok's solution](https://daunenok.github.io/restaurant/) - [View in Browser](https://daunenok.github.io/restaurant/)
* [Pat's solution](https://github.com/Pat878/Restaurant) - [View in Browser](https://pat878.github.io/Restaurant/)
* [smilesr's solution](https://github.com/smilesr/op-jj-bb-35-restaurant-jquery) - [View in Browser](https://htmlpreview.github.io/?https://github.com/smilesr/op-jj-bb-35-restaurant-jquery/blob/master/index.html)
* [Neil Cudden's solution](https://github.com/ncud4bloc/Diner/) - [View in Browser](https://ncud4bloc.github.io/Diner/HTML/index.html)
* [Alan Cruse's solution](https://github.com/ADECruse/restaurant_homepage)


### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [How Browsers Work from HTML5Rocks](http://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)
