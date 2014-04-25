# Project: HTML/CSS
*Estimated Time: 4-8 hrs*

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

## Setting Up Your Project's Github Repository (optional)

You'll want to organize all your projects as you go through the course, and the best way to do so is using Github.  It's like a file storage system for code that lives in the cloud and that can be seen by others. You already set up your Github account in the [Installations Project](/web-development-101/installations), so here we're going to put it to use.

1. If you haven't already, create a folder on your computer called `The Odin Project` which will house all your projects .
2. Go to your Github.com account and log in.
3. Create a new repo for this project [by following the instructions on Github.](https://help.github.com/articles/create-a-repo ) and call it `google-homepage` (instead of `Hello-World`).  Make your repository "Public" instead of "Private".
4. Go to your new repository on Github (`http://github.com/YOUR_USERNAME/google-homepage`) and take a look at it.  If you scroll down, you'll see that the `README` file you just created is what is displayed by default.
5. Open the `README` file on your local computer and change its text to include the title of the project and a link to this project on theodinproject.com.
6. Commit the updated `README` to your Github repository using the commands below on your command prompt:

    ```language-bash
    # adds all files that are in your current directory and which you've
    # recently changed to the "staging area" (ie. they're "ready to commit")
    $ git add -A

    # commits all the "staged" files into your local repository
    $ git commit -m "update README"

    # pushes your local repository up to your remote one on Github
    $ git push origin master
    ```

When you're building your project, you will probably end up doing several `git add` + `git commit` cycles before being ready to push it up to Github with `git push`.

Note: All Git commands need to be run from inside your project's folder (the one where you typed `$ git init`) or you'll get an error!

## Easy Version: Build the [Google.com](http://www.google.com) homepage
(the simple one with just a search box).

Inside your project folder, create your index.html file

  1. Tips:
      * DONT BE A PERFECTIONIST!  You're just trying to make it *look* like google.com, not actually function like it and it doesn't have to be spaced exactly the same way to the pixel.  Any dropdown menus or form submissions or hover-highlighting should be ignored.
      * USE GOOGLE! You'll probably run into roadblocks where you can't figure out how to do something so do what all good devs do... Google it!
      * If you're frustrated with trying to get buttons or inputs to style the way you want (for instance, they seem to just not respond to any styles), look into the css property `-webkit-appearance: none;` or `-moz-appearance` if you're using Firefox.
  2. Start with just putting the main elements on the page (the logo image and search form), then get them placed horizontally.  You can either download the Google logo or link directly to its URL on the web in your `<img>` tag.
  3. Next do the navbar across the top, first building the content and then trying to position it.  Check out [how to build a horizontal CSS navbar](http://www.w3schools.com/css/css_navbar.asp) if you're lost.
  4. Finally, put in the footer, which should be very similar to the top navbar.
  5. In general, do as much on your own as you can before relying on the developer tools (or viewing the page's source code) to help you along.
  6. Push your project to Github using the instructions above!

## Difficult Version (optional): Build the [Google.com search results page](https://www.google.com/search?q=build+this+webpage)

You should be able to reuse much of your code from before if you started with that project.  Again, don't worry about links to nowhere and forms that won't submit and hard coding the search results (which you'll have to do of course), just focus on placement and order of items on the page.

Note: All the classes and id's and names of elements that you inspect on Google's home page are nonsensical strings (like `<div class='srg'>`).  This is because the code was **Minified** ([see the Wikipedia entry here](http://en.wikipedia.org/wiki/Minification_(programming))), which removes or shortens unnecessary characters and names to help the page load faster.  The HTML (or Javascript or CSS) file will be smaller but the browser can still read it just fine.

## Student Solutions

*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

* See [RebootJeff's solution here](https://github.com/RebootJeff/odinproject/blob/master/odin.html.google_clone) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/RebootJeff/odinproject/blob/master/odin.html.google_clone/google_clone.html).
* See [JesseNeal's solution here](https://github.com/jesseneal/Odin-Project/blob/master/GoogleClone/index.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jesseneal/Odin-Project/blob/master/GoogleClone/index.html)
* See [Neil Gehani's solution here](https://github.com/ngehani/htmlcss/blob/master/googlelogo) or [view it in the browser here](http://htmlpreview.github.io?https://github.com/ngehani/htmlcss/blob/master/googlelogo/index.html).
* See [Neil Gehani's bootstrap solution here](https://github.com/ngehani/htmlcss/blob/master/googlelogo-bootstrap/index.html) or [view it in the browser here](http://htmlpreview.github.io?https://github.com/ngehani/htmlcss/blob/master/googlelogo-bootstrap/index.html).
* See [Paul Dariye's solution here](https://github.com/pauldd91/theodinproject/tree/master/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/pauldd91/theodinproject/master/google_homepage/index.html).
* See [Joshua Gorchov's solution here](https://github.com/gorchov/odin/tree/master/01_02_HTML_CSS) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/gorchov/odin/blob/master/01_02_HTML_CSS/index.html).
* See [Afshin Mokhtari's implementation of the 'difficult' version](https://github.com/afshinator/OdinProject-GoogleSearchClone) with instructions on getting an API key to make it run.
* See [Bill Walker's solution here](https://github.com/mach1010/odin/tree/master/html_css) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/mach1010/odin/blob/master/html_css/google.html).
* See [Lamberto Diwa's solution here](https://github.com/LambertoD/odin_curricullum/tree/master/html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/LambertoD/odin_curricullum/blob/master/html/odin_google_page_project.html).
* See [Marina Drigo's solution here](https://github.com/mousterian/OdinProject/blob/master/html_css/google-homepage/google-page.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/mousterian/OdinProject/blob/master/html_css/google-homepage/google-page.html).
* See [Jeffery Garza's solution here](https://github.com/jgarza/odin-project-studies/tree/master/html_css/google_project1) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jgarza/odin-project-studies/blob/master/html_css/google_project1/index.html).
* See [Jeffery Garza's 'difficult' solution here](https://github.com/jgarza/odin-project-studies/tree/master/html_css/google_project2) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jgarza/odin-project-studies/blob/master/html_css/google_project2/index.html).
* See [Ricky Walker's solution here](https://github.com/Rwalk45/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Rwalk45/google-homepage/blob/master/index.html).
* See [Aniruddh Agarwal's solution here](https://github.com/aniruddhagarwal/odin-projects/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/aniruddhagarwal/odin-projects/blob/master/google-homepage/index.html).
* See [Jamie's solution (submitted: Mar-27,2014)](https://github.com/Jberczel/odin-projects/tree/master/google-homepage) or [view in browser](http://htmlpreview.github.io/?https://github.com/Jberczel/odin-projects/blob/master/google-homepage/index.html).
* See [Sergey Prihodko's solution here](https://github.com/sprihodko/odin-projects/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/sprihodko/odin-projects/blob/master/google-homepage/index.html).
* See [Angel Vargas's solution here](https://github.com/arioth/the-odin-project/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/arioth/the-odin-project/blob/master/google-homepage/index.html).
* See [Abrar Hussain's solution here](https://github.com/abrarisme/The-Odin-Project/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/abrarisme/The-Odin-Project/blob/master/google-homepage/index.html)
* See [Joe Barratt's solution here](https://github.com/Evilbazza/google) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Evilbazza/google/blob/master/thing.html)
* See [Sahil Agarwal's solution here](https://github.com/sahilda/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/sahilda/google-homepage/blob/master/google.html). Click the 'Google Search' button for the difficult version page.
* See [Chris Oldakowski's solution here](https://github.com/KrzysiekO/theodinproject/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/KrzysiekO/theodinproject/blob/master/google-homepage/index.html).
* See [Paul Casey's solution here](https://github.com/jpcasey/theodinproject/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jpcasey/theodinproject/blob/master/google-homepage/index.html).
* See [Ingi Kim's solution here](https://github.com/ingikim/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ingikim/google-homepage/blob/master/index.html).
* See [Ruben Mendez's solution here](https://github.com/ruben-socal/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ruben-socal/google-homepage/blob/master/index.html).
* * See [Alan Russell's solution here](https://github.com/ajrussellaudio/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ajrussellaudio/google-homepage/blob/master/index.html).


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

If you still feel shaky on your understanding of HTML and CSS, that's okay! You don't need to be an expert by any means yet. These resources should help if you want to shore up your understanding of things:

* Watch all the [free HTML videos](http://teamtreehouse.com/library/websites/html/introduction) from Treehouse and take the quiz.
* Check out the [quickie CSS introduction](http://teamtreehouse.com/library/websites/build-a-simple-website/website-basics/introduction-to-css) from the same people as well.
* If you want to see the art of CSS, check out the [CSS Zen Garden](http://www.csszengarden.com/), which collects submissions that use identical HTML and modify only the CSS but turn out wildly different (and beautiful).
* Read through [Shay Howe's HTML&CSS Tutorial](http://learn.shayhowe.com/html-css/terminology-syntax-intro).  Lesson 1 gives a solid overview and you can do the whole thing for a more in-depth understanding.

