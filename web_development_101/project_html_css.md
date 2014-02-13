# Project: HTML/CSS
*Estimated Time: 2-4 hrs*

For this mini-project, you'll deconstruct an existing web page and rebuild it.  Don't worry if the links don't go anywhere and the search box doesn't do anything when you submit it.  The goal is to start thinking about how elements get placed on the page and roughly how they get styled and aligned.  For some of you, this may be the first time you've actually tried to "build" something in HTML (very exciting!).

Using the browser's developer tools (right clicking something on the page and clicking "inspect element" will get you there) will be your best friend.  Build the page in a .html text file and open it in your browser to check it out (or try using [CodePen](http://codepen.io/pen/) or [jsfiddle.net](http://www.jsfiddle.net)).


## Try These Before Starting

These skills will be helpful for you when you start building.  Either try them yourself or at least make sure you know how to do it:

1. Two ways to move a div around on the page
1. Stick a div onto the bottom or top of the page
1. Identify the background color of an existing webpage
1. Grab the URL for an image from an existing webpage
1. Center an element horizontally
1. Identify three ways you can include your CSS styles in a page
1. Understand how to use classes and ids to target CSS at specific elements on the page
1. Build a very basic form (even if it doesn't "go" anywhere)

## Easy Version: Build the [Google.com](http://www.google.com) homepage 
(the simple one with just a search box).

  1. Tips:
      * DONT BE A PERFECTIONIST!  You're just trying to make it *look* like google.com, not actually function like it and it doesn't have to be spaced exactly the same way to the pixel.  Any dropdown menus or form submissions or hover-highlighting should be ignored.
      * USE GOOGLE! You'll probably run into roadblocks where you can't figure out how to do something so do what all good devs do... Google it!
      * If you're frustrated with trying to get buttons or inputs to style the way you want (for instance, they seem to just not respond to any styles), look into the css property `-webkit-appearance: none;` or `-moz-appearance` if you're using Firefox.
  2. Start with just putting the main elements on the page (the logo image and search form), then get them placed horizontally.  You can either download the Google logo or link directly to its URL on the web in your `<img>` tag.
  3. Next do the navbar across the top, first building the content and then trying to position it.  Check out [how to build a horizontal CSS navbar](http://www.w3schools.com/css/css_navbar.asp) if you're lost.
  4. Finally, put in the footer, which should be very similar to the top navbar.
  5. In general, do as much on your own as you can before relying on the developer tools (or viewing the page's source code) to help you along.

## Difficult Version (optional): Build the [Google.com search results page](https://www.google.com/search?q=build+this+webpage)

You should be able to reuse much of your code from before if you started with that project.  Again, don't worry about links to nowhere and forms that won't submit and hard coding the search results (which you'll have to do of course), just focus on placement and order of items on the page.

Note: All the classes and id's and names of elements that you inspect on Google's home page are nonsensical strings (like `<div class='srg'>`).  This is because the code was **Minified** ([see the Wikipedia entry here](http://en.wikipedia.org/wiki/Minification_(programming\))), which removes or shortens unnecessary characters and names to help the page load faster.  The HTML (or Javascript or CSS) file will be smaller but the browser can still read it just fine.

## Student Solutions

*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

* See [RebootJeff's solution here](https://github.com/RebootJeff/odinproject/blob/master/odin.html.google_clone) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/RebootJeff/odinproject/blob/master/odin.html.google_clone/google_clone.html).

* See [Max Pleaner's solution here](https://github.com/macsplean/odin1_google_part1) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/macsplean/odin1_google_part1/blob/master/index.html).
* See [JesseNeal's solution here](https://github.com/jesseneal/Odin-Project/blob/master/GoogleClone/index.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jesseneal/Odin-Project/blob/master/GoogleClone/index.html)
* See [Neil Gehani's solution here](https://github.com/ngehani/htmlcss/blob/master/googlelogo) or [view it in the browser here](http://htmlpreview.github.io?https://github.com/ngehani/htmlcss/blob/master/googlelogo/index.html).
* *Your solution here...*

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


If you still feel shaky on your understanding of HTML and CSS, that's okay! You don't need to be an expert by any means yet. These resources should help if you want to shore up your understanding of things:

* Watch all the [free HTML videos](http://teamtreehouse.com/library/websites/html/introduction) from Treehouse and take the quiz.
* Check out the [quickie CSS introduction](http://teamtreehouse.com/library/websites/build-a-simple-website/website-basics/introduction-to-css) from the same people as well.
* If you want to see the art of CSS, check out the [CSS Zen Garden](http://www.csszengarden.com/), which collects submissions that use identical HTML and modify only the CSS but turn out wildly different (and beautiful).
* Read through [Shay Howe's HTML&CSS Tutorial](http://learn.shayhowe.com/html-css/terminology-syntax-intro).  Lesson 1 gives a solid overview and you can do the whole thing for a more in-depth understanding.

