# Project: HTML/CSS
<!-- *Estimated Time: 4-8 hrs* -->

For this mini-project, you'll deconstruct an existing web page and rebuild it.  Don't worry if the links don't go anywhere and the search box doesn't do anything when you submit it. The goal is to start thinking about how elements get placed on the page and roughly how they get styled and aligned. For some of you, this may be the first time you've actually tried to "build" something in HTML (very exciting!).

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

These instructions will be the same for every project we do.  They may seem strange or odd at first (especially if you haven't officially learned about Git yet, which we do later), but don't worry -- you'll get it because you'll do it dozens of times.  If you're really frustrated, skip it the first time -- building is more important than Git right now!

1. If you haven't already, create a folder on your computer called `the_odin_project` which will house all your projects .
2. Go to your Github.com account and log in.
3. Create a new repo for this project on Github.com [by following the instructions on Github.](https://help.github.com/articles/create-a-repo) and call it `google-homepage` (instead of `Hello-World`).  Make your repository "Public" instead of "Private".
4. Go to your new repository on Github (`http://github.com/YOUR_USERNAME/google-homepage`) and take a look at it.  If you scroll down, you'll see that the `README` file you just created is what is displayed by default.
5. Download your repository to your local computer by using the `$ git clone` command.  [This should be a helpful article](http://git-scm.com/book/en/Git-Basics-Getting-a-Git-Repository)(see the second section). Basically, you'll need to get the URL for your repository (it will end with `.git`) so the `clone` knows where to grab that repo from.  You can find your repo's clone URL by checking on the right-hand column (called "HTTPS clone URL") on the repo's main page on Github.  The full command would look something like `$ git clone https://github.com/theodinproject/curriculum.git`.  It pulls your repo from your Github account down onto your local computer.
6. `cd` into your project directory on your local computer and open the `README` file in your text editor.  Change its text to include the title of the project and a link to this project on theodinproject.com.
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

*When you're building your project, you will probably end up doing several `git add` + `git commit` cycles before being ready to push it up to Github with `git push`.*

You should be able to see the changes to your README on Github if you refresh the page.

*If you're not comfortable yet with using Git from the command line, you can actually just click into the README file on Github's web interface and then click the Edit button at the top to edit directly on the website.  This is covered in the second part of [the above-mentioned article](https://help.github.com/articles/create-a-repo) on creating a repo*

Note: All Git commands need to be run from inside your project's folder (the one where you typed `$ git init`) or you'll get an error!

Okay, that's enough Git for the moment -- time to actually build stuff!

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


* [Nate Bennett's solution](https://github.com/n8sb/odin-project/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/n8sb/odin-project/blob/master/google-homepage/index.html)
* [Cedric Charly's solution](https://github.com/Cedricgc/playground/tree/master/The%20Odin%20Project/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Cedricgc/playground/blob/master/The%20Odin%20Project/google-homepage/index.html)
* [RebootJeff's solution](https://github.com/RebootJeff/odinproject/blob/master/odin.html.google_clone) | [View in browser](http://htmlpreview.github.io/?https://github.com/RebootJeff/odinproject/blob/master/odin.html.google_clone/google_clone.html)
* [JesseNeal's solution](https://github.com/jesseneal/Odin-Project/blob/master/GoogleClone/index.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/jesseneal/Odin-Project/blob/master/GoogleClone/index.html)
* [Neil Gehani's solution](https://github.com/ngehani/htmlcss/blob/master/googlelogo) | [View in browser](http://htmlpreview.github.io?https://github.com/ngehani/htmlcss/blob/master/googlelogo/index.html)
* [Neil Gehani's bootstrap solution](https://github.com/ngehani/htmlcss/blob/master/googlelogo-bootstrap/index.html) | [View in browser](http://htmlpreview.github.io?https://github.com/ngehani/htmlcss/blob/master/googlelogo-bootstrap/index.html)
* [Paul Dariye's solution](https://github.com/pauldd91/theodinproject/tree/master/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/pauldd91/theodinproject/master/google_homepage/index.html)
* [Afshin Mokhtari's 'difficult' solution](https://github.com/afshinator/OdinProject-GoogleSearchClone) with instructions on getting an API key to make it run.
* [Bill Walker's solution](https://github.com/mach1010/odin/tree/master/html_css) | [View in browser](http://htmlpreview.github.io/?https://github.com/mach1010/odin/blob/master/html_css/google.html)
* [Lamberto Diwa's solution](https://github.com/LambertoD/odin_curricullum/tree/master/html) | [View in browser](http://htmlpreview.github.io/?https://github.com/LambertoD/odin_curricullum/blob/master/html/odin_google_page_project.html)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/html_css/google-homepage/google-page.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/html_css/google-homepage/google-page.html)
* [Arun Kumar's solution](https://github.com/arun1595/google_homepage) | [View in browser ](http://htmlpreview.github.io/?https://github.com/arun1595/google_homepage/blob/master/google.html)
* [Jeffery Garza's 'easy' solution](https://github.com/jgarza/odin-project-studies/tree/master/html_css/google_project1) | ['Difficult' solution](https://github.com/jgarza/odin-project-studies/tree/master/html_css/google_project2) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/jgarza/odin-project-studies/blob/master/html_css/google_project1/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/jgarza/odin-project-studies/blob/master/html_css/google_project2/index.html)
* [Ricky Walker's solution](https://github.com/Rwalk45/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Rwalk45/google-homepage/blob/master/index.html)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Jberczel/odin-projects/blob/master/google-homepage/index.html)
* [Sergey Prihodko's solution](https://github.com/sprihodko/odin-projects/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/sprihodko/odin-projects/blob/master/google-homepage/index.html)
* [Angel Vargas's solution](https://github.com/arioth/the-odin-project/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/arioth/the-odin-project/blob/master/google-homepage/index.html)
* [Abrar Hussain's solution](https://github.com/abrarisme/The-Odin-Project/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/abrarisme/The-Odin-Project/blob/master/google-homepage/index.html)
* [Joe Barratt's solution](https://github.com/Evilbazza/google) | [View in browser](http://htmlpreview.github.io/?https://github.com/Evilbazza/google/blob/master/thing.html)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/sahilda/the_odin_project/blob/master/google-homepage/google.html). Click the 'Google Search' button for the difficult version.
* [Chris Oldakowski's solution](https://github.com/KrzysiekO/theodinproject/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/KrzysiekO/theodinproject/blob/master/google-homepage/index.html)
* [Paul Casey's solution](https://github.com/jpcasey/theodinproject/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/jpcasey/theodinproject/blob/master/google-homepage/index.html)
* [Ingi Kim's solution](https://github.com/ingikim/The-Odin-Projects/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ingikim/The-Odin-Projects/blob/master/google-homepage/index.html)
* [Ruben Mendez's solution](https://github.com/ruben-socal/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ruben-socal/google-homepage/blob/master/index.html)
* [Alan Russell's solution](https://github.com/ajrussellaudio/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ajrussellaudio/google-homepage/blob/master/index.html)
* [Jesreal Arcillas's solution](https://github.com/jigogwapo/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/jigogwapo/google-homepage/blob/master/index.html)
* [Will Slone's solution](https://github.com/willslone/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/willslone/google-homepage/blob/master/index.html)
* [Mohdhar's solution](https://github.com/theummah/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/theummah/google-homepage/blob/master/homepage.html)
* [Afonso's solution](https://github.com/h4v1nfun/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/h4v1nfun/google-homepage/blob/master/index.html)
* [Jason Ellis's solution](https://github.com/jason-ellis/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/jason-ellis/google_homepage/blob/master/google.html)
* [Scott Yu's solution](https://github.com/scootcho/the_odin_project/blob/master/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/scootcho/the_odin_project/blob/master/google_homepage/index.html)
* [Donald's solution](https://github.com/donaldali/odin-webdev101/tree/master/project_htmlcss) | [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-webdev101/blob/master/project_htmlcss/index.html)
* [Tommy Noe's solution](https://github.com/thomasjnoe/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/thomasjnoe/google-homepage/blob/master/index.html)
* [Yeon Seo's solution](https://github.com/yseoserious/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/yseoserious/google-homepage/blob/master/index.html)
* [Conor Foley's solution](https://github.com/conchurofoghlu/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/conchurofoghlu/google-homepage/blob/master/index.html)
* [Laurie Alaoui's solution](https://github.com/lalaouil/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/lalaouil/google-homepage/blob/master/index.html)
* [Lui Joy's solution](https://github.com/lui8906/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/lui8906/google-homepage/blob/master/index.html)
* [Michael Martinez's solution](https://github.com/AZUREXANDER/The-Odin-Project/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/AZUREXANDER/The-Odin-Project/blob/master/google-homepage/index.html)
* [Ngoc Truong's (German) solution](https://github.com/OleScheinfrei/google-homepage/blob/master/index.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/OleScheinfrei/google-homepage/blob/master/index.html)
* [Colin Mason's solution](https://github.com/skateboard34/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/skateboard34/google-homepage/blob/master/index.html)
* [Melinda Sarnicki's solution](https://github.com/msarnicki/The-Odin-Project/tree/master/Google%20Home%20Page) | [View in browser](http://htmlpreview.github.io/?https://github.com/msarnicki/The-Odin-Project/blob/master/Google%20Home%20Page/index.html)
* [Tomislav Mikulin's (Croatian) solution](https://github.com/MrKindle85/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/MrKindle85/google-homepage/blob/master/index.html)
* [Adam Skaggs' solution](https://github.com/skaggsa3/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/skaggsa3/google-homepage/blob/master/index.html)
* [Khalil Ait Brahim's solution](https://github.com/Khalilw1/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Khalilw1/google-homepage/blob/master/Google_homepage.html)
* [Will Cameron's solution](https://github.com/camerow/google-homepage-recreate.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/camerow/google-homepage-recreate/blob/master/googleSearch.html)
* [Michael Alexander's solution](https://github.com/betweenparentheses/google-homepage/blob/master/google.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/betweenparentheses/google-homepage/blob/master/google.html)
* [Tamim Sookoor's solution](https://github.com/sookoor/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/sookoor/google-homepage/blob/master/index.html)
* [Steve Mitchell's solution](https://github.com/Ixpata/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Ixpata/google-homepage/blob/master/index.html)
* [Benjamin Ratiarisolo's (French) solution](https://github.com/ratiaris/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ratiaris/google-homepage/blob/master/google.html)
* [John Miller's solution](https://github.com/johndrmiller/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/johndrmiller/google-homepage/blob/master/index.html)
* [Letsibogo Ramadi's solution](https://github.com/letsboogey/google_homepage_project) | [View in browser](http://htmlpreview.github.io/?https://github.com/letsboogey/google_homepage_project/blob/master/index.html)
* [Kevin Mulhern's 'easy' solution](https://github.com/KevinMulhern/google-homepage) | ['Difficult' solution](https://github.com/KevinMulhern/google-homepage-hard) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/KevinMulhern/google-homepage/blob/master/index.html)
* [Erik Margetis's solution](https://github.com/emargetis/google-homepage.git) | [View in browser](https://github.com/emargetis/google-homepage/blob/master/index.html)
* [Farkhod Karimov's solution](https://github.com/fkarimov/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/fkarimov/google-homepage/blob/master/index.html)
* [Gerardo Ramirez's solution](https://github.com/brbtheory/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/brbtheory/google-homepage/blob/master/index.html)
* [Hira Javaid's solution](https://github.com/h-i-r-a/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/h-i-r-a/google-homepage/blob/master/index.html)
* [Jonathan Faulk's solution](https://github.com/faulk49/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/faulk49/google-homepage/blob/master/index.html)
* [David Ford's solution](https://github.com/djfordz/google-homepage) | [View in browser](http://djfordz.github.io/google-homepage/)
* [Toph Jones' solution](https://github.com/tophj/google-webpage) | [View in browser](http://htmlpreview.github.io/?https://github.com/tophj/google-webpage/blob/master/index.html)
* [Devon Barcherding's solution](https://github.com/stolicus/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/stolicus/google_homepage/blob/master/index.html)
* [James MacIvor's solution](https://github.com/RobotOptimist/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/RobotOptimist/google-homepage/blob/master/index.html)
* [Colonel Bookclub's solution](https://github.com/Remitius/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Remitius/google-homepage/blob/master/index.html)
* [Vincent's solution](https://github.com/wingyu/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/wingyu/google-homepage/blob/master/index.html)
* [Dorian Iacobescu's solution](https://github.com/iacobson/Google-Home-Page-Design) | [View in browser](http://htmlpreview.github.io/?https://github.com/iacobson/Google-Home-Page-Design/blob/master/google-home.html)
* [Michelle Pepe's solution](https://github.com/MichellePepe/google-homepage)
* [Julie De Lorenzo's solution](https://github.com/delorenzo/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/delorenzo/google-homepage/blob/master/index.html)
* [Liam Greig's solution](https://github.com/cutegoesboom/odin-01) | [View in browser](http://htmlpreview.github.io/?https://github.com/cutegoesboom/odin-01/blob/master/index.html)
* [Khaled Maher's solution](https://github.com/maxios/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/maxios/google-homepage/blob/master/homepage.html)
* [Stephanie Gurung's solution](https://github.com/stephr3/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/stephr3/google-homepage/blob/master/index.html)
* [Paula Lucci's solution](https://github.com/paulalucai/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/paulalucai/google-homepage/blob/master/index.html)
* [Drew Price's solution](https://github.com/drewprice/study/tree/master/odin-project/projects/google-search) | [View in browser](http://drewprice.github.io/study/odin-project/google-search/)
* [Nicholas Payne's solution](https://github.com/ndpayne/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ndpayne/google-homepage/blob/master/index.html)
* [Raul Tecar's solution](https://github.com/raultecar/google-homepage)
* [Jamie Nardini's solution](https://github.com/jamienardini/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/jamienardini/google-homepage/blob/master/home_page/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/jamienardini/google-homepage/blob/master/search_page/index.html)
* [Bob Dobbs' solution](https://github.com/KingHippo/google-homepage)
* [Sam Kham's solution](https://github.com/samkham/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/samkham/google-homepage/blob/master/index.html)
* [Chasmani's solution](https://github.com/chasmani/GoogleHomepage) | [View in browser](http://www.chasmani.com/odin/google/google.html)
* [John Quarles' solution](https://github.com/johnwquarles/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/johnwquarles/google-homepage/blob/master/index.html)
* [Chris Rinaldi's solution](https://github.com/cgrinaldi/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/cgrinaldi/google-homepage/blob/master/index.html)
* [Rafael Ruiz Moreno's solution](https://github.com/rruimor/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/rruimor/google-homepage/blob/master/index.html)
* [Antonio Augusto's solution](https://github.com/antoniosb/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/antoniosb/google-homepage/blob/master/index.html)
* [Andrej Dragojevic's solution](https://github.com/antrix1/The-Odin-Project/tree/master/Web%20Development%20101/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/antrix1/The-Odin-Project/blob/master/Web%20Development%20101/google_homepage/index.html)
* [Lara Finnegan's solution](https://github.com/lcf0285/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/lcf0285/google-homepage/blob/master/google-homepage.html)
* [Artur Janik's (Polish) 'difficult' solution](https://github.com/ArturJanik/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ArturJanik/google-homepage/blob/master/index.html)
* [Rik's (Dutch) solution](https://github.com/frbz/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/frbz/google-homepage/blob/master/index.html)
* [Nicole Erkis's solution](https://github.com/nerkis/google-homepage) | [View in broswer (easy)](http://htmlpreview.github.io/?https://github.com/nerkis/google-homepage/blob/master/google.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/nerkis/google-homepage/blob/master/results.html)
* [Jatin Bhatia's solution](https://github.com/JatinBhatia/google-homepage/tree/master/code)
* [Anonymous' solution](https://github.com/akshaykb/google-homepage)
* [Jack Nguyen's solution](https://github.com/jnguyen85/google_homepage_html) | [View in browser](http://htmlpreview.github.io/?https://github.com/jnguyen85/google_homepage_html/blob/master/index.html)
* [Cyrus Xi's solution](https://github.com/Suryc11/TheOdinProject/tree/master/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Suryc11/TheOdinProject/blob/master/google_homepage/index.html)
* [Richard Dickinson's solution](https://github.com/rpd/google-homepage/blob/master/index.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/rpd/google-homepage/blob/master/index.html)
* [Erin Yaylali's solution](https://github.com/eyaylali/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/eyaylali/google-homepage/master/googlehomepage.html)
* [Akshay Kumar Bhushan's solution](https://github.com/akshaykb/google-homepage)
* [Alice Rhomieux's solution](https://github.com/arhx/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/arhx/google-homepage/blob/master/index.html)
* [Jen Best's solution](https://github.com/jenthebest/google-homepage)
* [Faisal Muhammad's 'easy' solution](https://github.com/rahb20/google-homepage/blob/master/index.html) | ['Difficult' solution](https://github.com/rahb20/google-homepage/blob/master/Search%20Result.html)
* [Alex Ramin's solution](https://github.com/theloniusmonkey/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/theloniusmonkey/google-homepage/blob/master/googlehomepage.html)
* [Andrea Kulbaba's solution](https://github.com/akulbaba/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/akulbaba/google-homepage/blob/master/index.html)
* [Panagiotis Karatakis' solution](https://github.com/BlackSpirit96/the-odin-project_solutions/tree/master/web-101/google-homepage) | ['Difficult' solution](https://github.com/BlackSpirit96/the-odin-project_solutions/tree/master/web-101/google-search-results)
* [Julian De Ocampo's solution](https://github.com/JCDJulian/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/JCDJulian/google-homepage/blob/master/homepage.html)
* [Cedric Kisema's solution](https://github.com/cnak/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/cnak/google-homepage/blob/master/index.html)
* [AyeSea's solution](https://github.com/AyeSea/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://raw.githubusercontent.com/AyeSea/google-homepage/master/index.html)
* [Victorino Machava's solution](https://github.com/vitolob/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/vitolob/google-homepage/blob/master/index.html)
* [Richard Stewart's solution](https://github.com/rickstewart/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/rickstewart/google-homepage/blob/master/index.html)
* [Eleanor Weigert's solution](https://github.com/mixophrygian/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/mixophrygian/google-homepage/blob/master/index.html)
* [Tony Vumbaca's solution](https://github.com/tvumbaca/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/tvumbaca/google-homepage/blob/master/index.html)
* [Delphine Foo's solution](https://github.com/delphinefoo/google_homepage)
* [Jitendra Jogeshwar's solution](https://github.com/jogjitu/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/jogjitu/google-homepage/blob/master/index.html)
* [Alberto Marin's solution](https://github.com/alberto-marin/google-homepage)
* [Josh Thompson's solution](https://github.com/jtwebdev/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/jtwebdev/google-homepage/blob/master/index.html)
* [Tommy Rodriguez's solution](https://github.com/trodrigu/odinproject/tree/master/google-search) | [View in browser](http://htmlpreview.github.io/?https://github.com/trodrigu/odinproject/blob/master/google-search/public/index.html)
* [Asish Prabhakar's solution](https://github.com/akottal/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/akottal/google-homepage/blob/master/google.html)
* [Sami Bashraheel's solution](https://github.com/sami/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/sami/google-homepage/blob/master/index.html)
* [Monisha's solution](https://github.com/em55/Google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/em55/google-homepage/blob/master/index.html)
* [Ricardo Villegas' solution](https://github.com/claricardo/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/claricardo/google-homepage/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/claricardo/google-homepage/blob/master/search_index.html)
* [Tyler Travers' 'difficult' solution](https://github.com/ttravers17/the_odin_project/tree/master/google_search_results) | [View in browser](http://htmlpreview.github.io/?https://github.com/ttravers17/the_odin_project/blob/master/google_search_results/index.html)
* [Stetson Nash's solution](https://github.com/StetsonN/google-homepage/blob/master/GoogleUM(alt).html) | [View in browser](http://htmlpreview.github.io/?https://github.com/StetsonN/google-homepage/blob/master/GoogleUM(alt).html)
* [Chris Hall's Easy solution](https://github.com/Concretechris/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Concretechris/google-homepage/blob/master/index.html)
* [Ryan Jordan's solution](https://github.com/krjordan/odin-project/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/odin-project/tree/master/google-homepage/index.html)
* [Dominik Stodolny's solutions](https://github.com/dstodolny/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/dstodolny/google-homepage/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/dstodolny/google-homepage/blob/master/results.html)
* [Sergio Martin's solution](https://github.com/ShiroiZero/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ShiroiZero/google-homepage/blob/master/index.html)
* [Onome Ovedje's solution](https://github.com/Onome1/google_homepage)
* [Kevin Weir's solution](https://github.com/IDCrisis2/the_odin_project/tree/master/google_homepage)
* [Rafal Wojcik's solution](https://github.com/ProfoundKillah/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ProfoundKillah/google-homepage/blob/master/index.html)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_02-Web_Development_101/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/craftykate/odin-project/blob/master/Chapter_02-Web_Development_101/google_homepage/index.html)
* [Nicholas Leoutsakos's solution](https://github.com/nleoutsa/google-homepage)
* [Jimmy Herward's solution](https://github.com/Onesizefitzall/google-homepage.git)
* [Patrick Sullivan's solution](https://github.com/patsul12/google-copy) | [View in browser](http://htmlpreview.github.io/?https://github.com/patsul12/google-copy/blob/master/index.html.erb)
* [Muhammad Salman's solution](https://github.com/salmanmanekia/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/salmanmanekia/google-homepage/blob/master/index.html)
* [Vahe Hayrapetyan's solution](https://github.com/vahe1/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/vahe1/google-homepage/blob/master/index.html)
* [Greg Park's solution](https://github.com/gregoryjpark/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/gregoryjpark/google-homepage/blob/master/index.html)
* [Dylan Bailey's solution](https://github.com/dylancbailey/google-homepage.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/dylancbailey/google-homepage/blob/master/index.html)
* [Adam Lecuyer's solution](https://github.com/antisense/google-homepage.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/antisense/google-homepage/blob/master/index.html)
* [Matt Kimball's solution](https://github.com/mattj-kimball/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/mattj-kimball/google-homepage/blob/master/index.html)
* [Emil Kaaen's solution](https://github.com/daulaus/google-homepage.git)
* [Zane Bilous's solution](https://github.com/Zane-/googleHomepage/blob/master/index.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/Zane-/googleHomepage/blob/master/index.html)
* [Benjamin Wilhelms's solution](https://github.com/Nimorgs/google-homepage.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/Nimorgs/google-homepage/blob/master/index.html)
* [Jason Matthews' solution](https://github.com/fo0man/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/fo0man/google-homepage/blob/master/index.html)
* [Victor Sagrista's solution](https://github.com/citizenvsl/google_homepage_CSS.git)
* [Nick Kessler's solution](https://github.com/nakessler/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/nakessler/google-homepage/blob/master/index.html)
* [Cherlaine Ordona's solution](https://github.com/soupersushi/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/soupersushi/google_homepage/blob/master/index.html)
* [Mark Pearyer's solution](https://github.com/marcusp619/google-homepage) | [View it in browser](http://codepen.io/Marcusp619/pen/YPxJaR)
* [Joseph Henry's solution](https://github.com/josephcode773/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/josephcode773/google-homepage/blob/master/index.html)
* [Psidium's solution](https://github.com/Psidium/google-homepage) | [View in browser (dificult)](http://htmlpreview.github.io/?https://raw.githubusercontent.com/Psidium/google-homepage/master/google.html)
* [Saurabh Sikchi's 'easy' solution](https://github.com/Khamba/Google-clone) | ['Difficult' solution](https://github.com/Khamba/Google-search-results-clone) | [View in browser  (easy)](http://htmlpreview.github.io/?https://github.com/Khamba/Google-clone/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/Khamba/Google-search-results-clone/blob/master/index.html)
* [Sue Robbins' solution](https://github.com/shrobbins/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/shrobbins/google-homepage/blob/master/index.html)
* [Pezz18's solution](https://github.com/Pezz18/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Pezz18/google-homepage/blob/master/Google.html)
* [Robert Juall's solution](https://github.com/RJuall/the_odin_project/tree/master/google_site)
* [Taylor Buchheit's solution](https://github.com/7aylor/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/7aylor/google-homepage/blob/master/index.html)
* [Don Price's solution](https://github.com/KingHippo/the_odin_project/tree/master/google-homepage) | [View in browser](http://kinghippo.github.io/the_odin_project/google-homepage/)
* [Michelle CV's solution](https://github.com/michellecv/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/michellecv/google_homepage/blob/master/index.html)
* [trump's solution](https://github.com/trump812/google-homepage)
* [Tobiastp's solution](https://github.com/tobiastp/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/tobiastp/google-homepage/blob/master/index.html)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/tree/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/apositivejam/the_odin_project/blob/master/google-homepage/google.html)
* [Vladimir M Romeo's solution](https://github.com/vmr1981/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/vmr1981/google-homepage/blob/master/index.html)
* [Faraj Daoud's solution](https://github.com/GHOSTRID8R/Google-Homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/GHOSTRID8R/Google-Homepage/blob/master/index.html)
* [Nicole Wong's solution](https://github.com/reneos/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/reneos/google-homepage/blob/master/index.html)
* [Luke Savage's solution](https://github.com/lsavage92/google-homepage/blob/master/homepage.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/lsavage92/google-homepage/blob/master/homepage.html)
* [Colton Savage's solution](https://github.com/csavage1994/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/csavage1994/google-homepage/blob/master/homepage.html)
* [Chironian's solution](https://github.com/ChironZone/google-homepage/) | [View in browser](http://htmlpreview.github.io/?https://github.com/ChironZone/google-homepage/blob/master/main.html)
* [Luke Whitehead's solution](https://github.com/lukew1982/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/lukew1982/google_homepage/blob/master/index.html)
* [Josh Klein's solution](https://github.com/kleinjoshuaa/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/kleinjoshuaa/google-homepage/blob/master/index.html)
* [Chris McIntyre's solution](https://github.com/leamerluck/google-homepage) | [View in browser](http://htmlpreview.github.com/?https://github.com/leamerluck/google-homepage/blob/master/index.html)
* [Sarah McManus's solution](https://github.com/sarahmcmanus/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/sarahmcmanus/google-homepage/blob/master/index.html)
* [Micah Obal's solution](https://github.com/Hacima/google-homepage-clone) | [View in browser](http://htmlpreview.github.io/?https://github.com/Hacima/google-homepage-clone/blob/master/index.html)
* [Dmytro Bystrovzorov's solution](https://github.com/dimutro/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/dimutro/google-homepage/blob/master/index.html)
* [Sami0's solution](https://github.com/Sami0/google-homepage) |  [View in browser](http://htmlpreview.github.io/?https://github.com/Sami0/google-homepage/blob/master/index.html)
* [Rob Pennington's solution](https://github.com/rPen/The.Odin.Project/tree/master/google-homepage) |  [View in browser](http://htmlpreview.github.io/?https://github.com/rPen/The.Odin.Project/blob/master/google-homepage/index.html)
* [Courtney Roberson's (Easy) Solution](https://github.com/coro121/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/coro121/google-homepage/blob/master/google%20homepage.html)
* [Craig LaBruno's Solution](https://github.com/CLaBruno/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/CLaBruno/google-homepage/blob/master/index.html)
* [ATTrindade's Solution](https://github.com/attrindade/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/attrindade/google-homepage/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/attrindade/google-homepage/blob/master/results-page.html)
* [Eddie's solution](https://github.com/feek1g/theodinproject/tree/master/buildGoogle) |  [View in browser](http://htmlpreview.github.io/?https://github.com/feek1g/theodinproject/blob/master/buildGoogle/index.html)
* [Chris Peers' solution](https://github.com/ChrisPeers/google-homepage/blob/master/Index.html) | ['Difficult' solution](https://github.com/ChrisPeers/google-homepage/blob/master/Search.html)| [View in browser (difficult)](https://htmlpreview.github.io/?https://github.com/ChrisPeers/google-homepage/blob/master/Search.html)
* [Matthew's solution](https://github.com/financetech/google-homepage/) |  [View in browser](http://htmlpreview.github.io/?https://github.com/financetech/google-homepage/blob/master/index.html)
* [Jason's solution](https://github.com/wellsj/google-homepage/) |  [View in browser](http://htmlpreview.github.io/?https://github.com/wellsj/google-homepage/blob/master/index.html)
* [Gb69010p's solution (easy)](https://github.com/gb69010p/google-homepage) | [Difficult solution](https://github.com/gb69010p/google-search-results) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/gb69010p/google-homepage/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/gb69010p/google-search-results/blob/master/searchresults.html)
* [Dush's Solution(easy)](https://github.com/De-Cay/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/De-Cay/google-homepage/blob/master/Google.html)
* [Adrian Kelly's solution](https://github.com/adriankelly/google-homepage) | [View in browser](https://adriankelly.net/google-homepage/)
* [Nayar Ali's Solution(easy)](https://github.com/nayar-ali/google-homepage) | [View in browser(easy)](http://htmlpreview.github.io/?https://github.com/nayar-ali/google-homepage/blob/master/html/index.html)
* [Sandeep's solution](https://github.com/sand33pn/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/sand33pn/google-homepage/blob/master/index.html)
* [Brendon's solution](https://github.com/brendonsoto/theOdinProjectLog/tree/master/webDev101/frontEnd/htmlCssBasics/htmlProject) | [View in browser](http://htmlpreview.github.io/?https://github.com/sand33pn/google-homepage/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/brendonsoto/theOdinProjectLog/blob/master/webDev101/frontEnd/htmlCssBasics/htmlProject/results.html)
* [Razzakun's solution](https://github.com/RazzaFrazza/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/RazzaFrazza/google-homepage/blob/master/index.html)
* [Alex Perez's solution](https://github.com/alex-perez7/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/alex-perez7/google-homepage/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/alex-perez7/odin_google-homepage/blob/master/googleResultsPage.html)
* [Swati Kumar's solution](https://github.com/swatikumar16/google-homepage) | [View in browser](http://swatikumar16.github.io/google-homepage/)
* [Seab Jackson's solution](https://github.com/seabjackson/google-homepage.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/seabjackson/google-homepage/blob/master/index.html)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/tree/master/web101/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/hiendinhngoc/TheOdinProject/blob/master/web101/google_homepage/html/google.html)
* [Maia Petee's solution](https://github.com/movetomars/google-homepage) | [View in browser](https://github.com/movetomars/google-homepage/blob/master/index.html)
* [Dan Hoying's solution](https://github.com/danhoying/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/danhoying/google-homepage/blob/master/index.html)
* [John Lampe's solution](https://github.com/jlampe1985/google-homepage/blob/master/index.html) | [View in browser](https://rawgit.com/jlampe1985/google-homepage/master/index.html)
* [Sasikala's solution](https://github.com/Sasikala-Ravichandran/odin-project/tree/master/Google)| [View in browser](http://htmlpreview.github.io/?https://github.com/Sasikala-Ravichandran/odin-project/blob/master/Google/index.html)
* [Mateusz Staszczyk's solution](https://github.com/sleaz0id/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/sleaz0id/google-homepage/blob/master/index.html) | [View in browser (Difficult Version)](http://htmlpreview.github.io/?https://github.com/sleaz0id/google-homepage/blob/master/results.html)
* [Adan Camacho's solution](https://github.com/Adancode/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Adancode/google-homepage/blob/master/index.html)
* [Kira McLean's solution](https://github.com/kiramc/google-homepage) | [View in browser](https://rawgit.com/kiramc/google-homepage/master/index.html)
* [Chris Fullinwider's solution](https://github.com/Fully34/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Fully34/google-homepage/blob/master/Homepage.html)
* [Max nynd's solution](https://github.com/nynd/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/nynd/google-homepage/blob/master/googlehomepage.html)
* [Drew Horge's solution](https://github.com/remlyfe/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/remlyfe/google-homepage/blob/master/index.html)
* [Jason Symons' solution](https://github.com/jsymons/the-odin-project/blob/master/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/jsymons/the-odin-project/blob/master/google-homepage/index.html)
* [Javeed Ishaq's solution](https://github.com/JaveedIshaq/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/JaveedIshaq/google-homepage/blob/master/google-homepage.html)
* [SiriusBlak's solution](https://github.com/SiriusBlak/google-homepage)
* [Pedro Amaral's solution](https://github.com/lockemind/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://raw.githubusercontent.com/lockemind/google-homepage/master/index.html)
* [dwhitebud's solution](https://github.com/dwhitebud/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/dwhitebud/google-homepage/blob/master/index.html)
* [Porx's solution](https://github.com/porx/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/porx/google-homepage/blob/master/index.html)
* [ninja-ml's solution](https://github.com/ninja-ml/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/ninja-ml/google-homepage/blob/master/homepage.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/ninja-ml/google-homepage/blob/master/index_search.html)
* [Tumanako's solution](https://github.com/tumanako-r/google-homepage)
* [Bob Blake's solution](https://github.com/Hari96/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Hari96/google-homepage/blob/master/index.html)
* [Mamun Hossain's solution](https://github.com/mamun2015/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/mamun2015/google-homepage/blob/master/index.html)
* [Igor Unzer's solution](https://github.com/cynexyl/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/cynexyl/google-homepage/blob/master/index.html)
* [Karl Keller's solution](https://github.com/Georgy5/google-homepage)
* [Glenn Crosby's solution](https://github.com/glennc15/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/glennc15/google-homepage/blob/master/index.html)
* [Dylan Araps' solution](https://github.com/therealvdeadline/google) | [View in browser](http://therealvdeadline.github.io/google) (Functional)
* [Carlos Rojas' solution](https://github.com/sadhu89/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/sadhu89/google-homepage/blob/master/index.html)
* [Arshaan Bhimani's solution](https://github.com/ArshaanB/custom-google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ArshaanB/custom-google-homepage/blob/master/index.html)
* [Adam Coleman's solution](https://github.com/adamcoleman/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/adamcoleman/google_homepage/blob/master/index.html)
* [Alan Daniels's solution](https://github.com/AlanDaniels101/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/AlanDaniels101/google-homepage/blob/master/index.html)
* [Arthur Vieira's solution](https://github.com/arthur-vieira/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/arthur-vieira/google-homepage/blob/master/index.html)
* [Tammy Pop's solution](https://github.com/smurfik/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/smurfik/google-homepage/blob/master/index.html)
* [Kelly Williams' solution](https://github.com/kellymarjorie/google-homepage.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/kellymarjorie/google-homepage/blob/master/index.html)
* [Calandra Zellner's solution](https://github.com/calandraz/google-homepage)
* [AtActionPark 'easy' solution](https://github.com/AtActionPark/google-homepage) | ['Difficult' solution](https://github.com/AtActionPark/google-homepage-2) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/AtActionPark/google-homepage/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/AtActionPark/google-homepage-2/blob/master/index.html)
* [Thulasi Arasu's solution](https://github.com/ThulasiA/google_homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/ThulasiA/google_homepage/blob/master/index.html)
* [Nick Foster's solution](https://github.com/NickFS/Google.com-Homepage-Odin)
* [Jeffrey Bartels' 'easy' solution](https://github.com/jitterboggle/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/jitterboggle/google-homepage/blob/master/index.html)
* [Nathan's solution](https://github.com/viggie79/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/viggie79/google-homepage/blob/master/google.html)
* [Tarun Johnson's solution](https://github.com/tnt007tarun/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/tnt007tarun/google-homepage/blob/master/index.html)
* [Alex Hanger's solution](https://github.com/hanger129/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/hanger129/google-homepage/blob/master/index.html)
* [Pon K brown's solution](https://github.com/ponkbrown/google-homepage) | [View in browser](https://rawgit.com/ponkbrown/google-homepage/master/index.html)
* [Daniel Rojas's solution](https://github.com/RojoD89/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/RojoD89/google-homepage/blob/master/index.html)
* [A.Caroline's solution](https://github.com/acaroline/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/acaroline/google-homepage/blob/master/index.html)
* [Chris Chi's solution](https://github.com/chrischi90/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/chrischi90/google-homepage/blob/master/index.html)
* [Cory Graddy's solution](https://github.com/corygraddy/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://raw.githubusercontent.com/corygraddy/google-homepage/master/index.html)
* [Shawn Stovall's solution](https://github.com/Corune/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Corune/google-homepage/blob/master/index.html)
* [Josh Archer's solution](https://github.com/PuffinBlue/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/PuffinBlue/google-homepage/blob/master/index.html)
* [iBinbar's solution](https://github.com/iBinbar/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/iBinbar/google-homepage/blob/master/index.html)
* [Shawn-Paul's solution](https://github.com/SP422/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/SP422/google-homepage/blob/master/index.html)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/tree/master/1-google-homepage) | [View in browser](https://cdn.rawgit.com/markviola/the-odin-project/master/1-google-homepage/index.html)
* [Nate Beck's solution](https://github.com/nbeck91/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/nbeck91/google-homepage/blob/master/index.html)
* [kushtrimmh's solution](https://github.com/kushtrimmh/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/kushtrimmh/google-homepage/blob/master/index.html)
* [John Meguerian's solution](https://github.com/jmegs/the-odin-project/tree/master/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/jmegs/the-odin-project/blob/master/google-homepage/index.html)
* [Joseph McConnell's solution](https://github.com/JJMcConnell/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/JJMcConnell/google-homepage/blob/master/index.html)
* [M. Edgar Joel's solution](https://github.com/edgar-/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/edgar-/google-homepage/blob/master/index.html)
* [Alex Tsiras' solution](https://github.com/arialblack14/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/arialblack14/google-homepage/blob/master/google.html)
* [Scott Bobbitt's solution](https://github.com/sco-bo/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/sco-bo/google-homepage/blob/master/index.html)
* [MagicMamba's solution](https://github.com/magicmamba/odin/tree/master/google%20homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/magicmamba/odin/blob/master/google%20homepage/index.html)
* [Ethan Rips's solution](https://github.com/anonRegions/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/anonRegions/google-homepage/blob/master/index.html)
* [Patrick Doane's easy solution](https://github.com/patrickdoane/the_odin_project/blob/master/google-homepage/homepage-easy.html) | [Difficult solution](https://github.com/patrickdoane/the_odin_project/blob/master/google-homepage/homepage-hard.html) | [View in browser (easy)](https://htmlpreview.github.io/?https://github.com/patrickdoane/the_odin_project/blob/master/google-homepage/homepage-easy.html)
* [Gerard Jorgensen's solution](https://github.com/gerardjorgensen/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/gerardjorgensen/google-homepage/blob/master/index.html)
* [Jake Nelken's solution](https://github.com/J3uddha/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/J3uddha/google-homepage/blob/master/index.html)
* [Connor Allen's solution](https://github.com/callen139/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/callen139/google-homepage/blob/master/index.html)
* [Cgipson06's solution](https://github.com/Cgipson06/Google-Homepage.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/Cgipson06/Google-Homepage/blob/master/google-homepage.html)
* [JTomlin's solution](https://github.com/JTomlin/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/JTomlin/google-homepage/blob/master/index.html)
* [Xavier Reid's sloution](https://github.com/xreid/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/xreid/google-homepage/blob/master/google-homepage.html)
* [Francis Ngo's solution](https://github.com/francisngo/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/francisngo/google-homepage/blob/master/index.html)
* [Adrian Clark's Solution](https://github.com/AdrianClark/The_Odin_Project/tree/master/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/AdrianClark/The_Odin_Project/blob/master/google_homepage/index.html)
* [Lisandro Bertoli's solution](https://github.com/lichab/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/lichab/google-homepage/blob/master/index.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/lichab/google-homepage/blob/master/google-search.html)
* [Ho Won Cheng's solution](https://github.com/chenghw/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/chenghw/google_homepage/blob/master/google_homepage.html)
* [Kevin Sen's solution](https://github.com/Kevin-Sen/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/Kevin-Sen/google-homepage/blob/master/index.html)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/web-development-101/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/florianmainguy/theodinproject/blob/master/web-development-101/google-homepage/index.html)
* [Geetha's solution](https://github.com/rock626/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/rock626/google-homepage/blob/master/index.html)
* [Fernando Forero's solution](https://github.com/BlandoNando/googleClone) | [View in browser](https://htmlpreview.github.io/?https://github.com/BlandoNando/googleClone/master/index.html)
* [Ricardo Monteiro's solution](https://github.com/rpmonteiro/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/rpmonteiro/google-homepage/blob/master/index.html)
* [Ethan Nevidomsky's solution](https://github.com/Ethan-N/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/Ethan-N/google-homepage/blob/master/index.html)
* [Lucy Yu's solution](http://github.com/lucyyu24/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/lucyyu24/google-homepage/blob/master/google-homepage.html)
* [Julian Patton's solution](https://github.com/Tamale-stalker/google-homepage) [View in browser](http://htmlpreview.github.io/?https://github.com/Tamale-stalker/google-homepage/blob/master/index.html)
* [Ben Howlett's solution](https://github.com/bluetint/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/bluetint/google-homepage/blob/master/google.html)
* [Siddharth Gupta's solution](https://github.com/sidgupta234/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/sidgupta234/google-homepage/blob/master/index.html)
* [Harvey Singh's solution](https://github.com/harveysingh1/google-homepage)[View in browser (easy)](http://htmlpreview.github.io/?https://github.com/harveysingh1/google-homepage/blob/master/index.html) | [View in browser (difficult)](https://htmlpreview.github.io/?https://github.com/harveysingh1/google-homepage-hard/blob/master/google.html)
* [Nana Owusu's solution (Easy Version)](https://github.com/nanaowusunyamekye/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/nanaowusunyamekye/google-homepage/blob/master/index.html)
* [Telios's solution](https://github.com/oakinogundeji/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/oakinogundeji/google-homepage/blob/master/index.html)
* [WCope's solution](https://github.com/wcope80/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/wcope80/google-homepage/blob/master/index.html)
* [Thomas Vaeth's solution](https://github.com/thomasvaeth/the_odin_project/tree/master/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/thomasvaeth/the_odin_project/blob/master/google-homepage/index.html)
* [djhart's solution](https://github.com/djhart/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/djhart/google-homepage/blob/master/index.html)
* [Łukasz Łocki's solution](https://github.com/vrch/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/vrch/google-homepage/blob/master/index.html)
* [Wayne Ho's solution](https://github.com/wayneho/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/wayneho/google-homepage/blob/master/index.html)
* [Stanley Ye's 'easy' solution](https://github.com/stanleyye/Google-Homepage) | ['Difficult' solution](https://github.com/stanleyye/Google-Searchpage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/stanleyye/Google-Homepage/blob/master/Googlehomepage.html) | [View in browser (difficult)](http://htmlpreview.github.io/?https://github.com/stanleyye/Google-Searchpage/blob/master/index.html)
* [Panashe M. Fundira's solution](https://github.com/munyari/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/munyari/google-homepage/blob/master/easy.html)
* [Damian Machnik's solution](https://github.com/machnior/google_homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/machnior/google_homepage/blob/master/index.html)
* [Brian Burke's solution](https://github.com/sanora/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/sanora/google-homepage/blob/master/index.html)
* [Curtis Barnard Jr. solution](https://github.com/oregoncurtis/google-homepage) | [View in browser (easy)](https://htmlpreview.github.io/?https://github.com/oregoncurtis/google-homepage/blob/master/index.html)
* [Lisa Dean's solution](https://github.com/LisaZD/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/LisaZD/google-homepage/blob/master/index.html)
* [Anurag Shendge's Solution](https://github.com/anuragshendge/google-homepage)| [View in browser](http://htmlpreview.github.io/?https://github.com/anuragshendge/google-homepage/blob/master/index.html) |
* [Amir Aminfar's Solution](https://github.com/amiraa127/google-homepage)| [View in browser](https://htmlpreview.github.io/?https://github.com/amiraa127/google-homepage/blob/master/index.html) |
* [Songbird's Solution](https://github.com/eaglesong/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/eaglesong/google-homepage/blob/master/index.html) |
* [Pratheeksha's Solution](https://github.com/Prat-123/google-homepage)
* [Brian Garrison's Solution](https://github.com/mizakiharuno/google-homepage)
* [Anurag Shendge's Solution](https://github.com/anuragshendge/google-homepage)| [View in browser](http://htmlpreview.github.io/?https://github.com/anuragshendge/google-homepage/blob/master/index.html) |
* [Giacomo R's Solution](https://github.com/giacomor/google-homepage) | [View in browser (EASY)](https://htmlpreview.github.io/?https://github.com/giacomor/google-homepage/blob/master/index.html) | [View in browser (DIFFICULT) ](https://htmlpreview.github.io/?https://github.com/giacomor/google-homepage/blob/master/google-search-page.html)
* [Anurag Shendge's Solution](https://github.com/anuragshendge/google-homepage)| [View in browser](http://htmlpreview.github.io/?https://github.com/anuragshendge/google-homepage/blob/master/index.html) |
* [Amir Aminfar's Solution](https://github.com/amiraa127/google-homepage)| [View in browser](https://htmlpreview.github.io/?https://github.com/amiraa127/google-homepage/blob/master/index.html) |
* [Songbird's Solution](https://github.com/eaglesong/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/eaglesong/google-homepage/blob/master/index.html) |
* [Nin Salde's Solution](https://github.com/ninyeah/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ninyeah/google-homepage/blob/master/index.html)  |
* [Dago Henriquez's solution](https://github.com/theDagobahSystem/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/theDagobahSystem/google-homepage/blob/master/index.html) |
* [Parker Boyes' solution](https://github.com/boyestrous/google-homepage) | [Easy View in browser](http://htmlpreview.github.io/?https://github.com/boyestrous/google-homepage/blob/master/index.html) | [Difficult View in browser](http://htmlpreview.github.io/?https://github.com/boyestrous/google-homepage/blob/master/results.html)
* [Kirk D. Shelton's 'Easy' solution](https://github.com/kirkdshelton/google-hompage) | ['Difficult' solution](https://github.com/kirkdshelton/google-hompage/tree/master/google_search_results) | [View in browser (Easy)](http://htmlpreview.github.io/?https://github.com/kirkdshelton/google-hompage/blob/master/google_search/index.html) | [View in browser (Difficult)](http://htmlpreview.github.io/?https://github.com/kirkdshelton/google-hompage/blob/master/google_search_results/index.html)
* [Max Platt's solution](https://github.com/makxks/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/makxks/google-homepage/blob/master/index.html) |
* [5K0T's solution](https://github.com/5K0T/Learning_Projects/tree/master/The_Odin_Project/1_Web_Development_101/Google_Homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/5K0T/Learning_Projects/blob/master/The_Odin_Project/1_Web_Development_101/Google_Homepage/google.html)
* [Noah Prescott's solution](https://github.com/npresco/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/npresco/google_homepage/blob/master/google_homepage.html)
* [Swordscoper's easy solution](https://github.com/Swordscoper/Google) | [Easy in browser](https://htmlpreview.github.io/?https://github.com/Swordscoper/Google/blob/master/index.html) | [Swordscoper's difficult solution](https://github.com/Swordscoper/Google-Results) | [Difficult in browser](https://htmlpreview.github.io/?https://github.com/Swordscoper/Google-Results/blob/master/index.html)
* [Chris Watland's solution](https://github.com/watlandc/odin-project/tree/master/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/watlandc/odin-project/blob/master/google-homepage/index.html)
* [Greyden Scott's solution](https://github.com/groydis/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/groydis/google-homepage/blob/master/index.html)
* [Adrian Manteza's solution](https://github.com/AdManteza/Google-Homepage-ver.2) | [View in browser](http://htmlpreview.github.io/?https://github.com/AdManteza/Google-Homepage-ver.2/blob/master/index.html)
* [Davis Campbell's solution](https://github.com/davis-campbell/google-homepage) | [View in browser](https://rawgit.com/davis-campbell/google-homepage/master/index.html)
* [Patrick Li's EASY solution](https://github.com/PatrickLi727/google-homepage) | [Easy in browser](https://htmlpreview.github.io/?https://github.com/PatrickLi727/google-homepage/blob/master/index.html) | [Patrick Li's DIFFICULT solution](https://github.com/PatrickLi727/google-searchpage) | [Difficult in browser](https://htmlpreview.github.io/?https://github.com/PatrickLi727/google-searchpage/blob/master/index.html)
* [Kanchan Bhattacharyya's solution](https://github.com/kkbhattachary/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/kkbhattachary/google-homepage/blob/master/index.html)
* [Rohit Suvarna's solution](https://github.com/rohitsuv/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/rohitsuv/google-homepage/blob/master/index.html)
* [dchen71's EASY solution](https://github.com/dchen71/the_odin_project/blob/master/Web%20Development%20101/google-homepage/home.html) | [View in browser](https://htmlpreview.github.io/?https://github.com/dchen71/the_odin_project/blob/master/Web%20Development%20101/google-homepage/home.html) | [HARD solution](https://github.com/dchen71/the_odin_project/blob/master/Web%20Development%20101/google-homepage/gsearch.html) | [View in browser](https://htmlpreview.github.io/?https://github.com/dchen71/the_odin_project/blob/master/Web%20Development%20101/google-homepage/gsearch.html)
* [Paweł Cichoń solution](https://github.com/beovulf/google_homepage/) | [View in browser](https://rawgit.com/beovulf/google_homepage/master/index.html)
* [Rellbows' Easy Solution](https://github.com/rellbows/google-homepage/blob/master/index.html) | [View in browser](https://htmlpreview.github.io/?https://github.com/rellbows/google-homepage/blob/master/index.html)
* [Anthony Duran's solution](https://github.com/adduran17/google-homepage/blob/master/Index.html) | [View in browser](https://htmlpreview.github.io/?https://github.com/adduran17/google-homepage/blob/master/Index.html)
* [Jacob Stoebel's solution](https://github.com/jstoebel/google_homepage.git) | [View in browser](https://htmlpreview.github.io/?https://github.com/jstoebel/google_homepage/blob/master/index.html)
* [dchen71's EASY solution](https://github.com/dchen71/the_odin_project/blob/master/Web%20Development%20101/google-homepage/home.html) | [View in browser](https://htmlpreview.github.io/?https://github.com/dchen71/the_odin_project/blob/master/Web%20Development%20101/google-homepage/home.html) (HARD solution) (https://github.com/dchen71/the_odin_project/blob/master/Web%20Development%20101/google-homepage/gsearch.html) | [View in browser](https://htmlpreview.github.io/?https://github.com/dchen71/the_odin_project/blob/master/Web%20Development%20101/google-homepage/gsearch.html)
* [kfoxb's solution](https://github.com/kfoxb/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/kfoxb/google-homepage/blob/master/index.html)
* [Prayatna's solution](https://github.com/prayatna/google_homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/prayatna/google_homepage/blob/master/index.html)
* [Arnold Libunao's EZ solution](https://github.com/arnlib/google-homepage.git) | [View EZ in browser](https://htmlpreview.github.io/?https://github.com/arnlib/google-homepage/blob/master/index.html)
* [Vojin Djukic's solution](https://github.com/vojindjukic/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/vojindjukic/google-homepage/blob/master/google%20clone.html#)
* [Shady's solution](https://github.com/cupcakehunter/google_homepage)  | [View in browser](https://htmlpreview.github.io/?https://github.com/cupcakehunter/google_homepage/blob/master/index.html)
* [Arnold Libunao's EZ solution](https://github.com/arnlib/google-homepage.git) | [View EZ in browser](https://github.com/arnlib/google-homepage/blob/master/index.html)
* [thetomja's solution](https://htmlpreview.github.io/?https://github.com/thetomja/google-homepage/blob/master/index.html)
* [Moiz Hasan's solution](https://github.com/MoizHasan/Google-Homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/MoizHasan/Google-Homepage/blob/master/index.html)
* [Kelvin Stone's solution](https://github.com/KelvinStone/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/KelvinStone/google-homepage/blob/master/index.html)
*[Nicholas Evans's solution](https://github.com/nicholasjamesevans/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/nicholasjamesevans/google-homepage/blob/master/index.html)
* [Petros Kalogiannakis's solution](https://github.com/kalpetros/TheOdinProject/tree/master/google_homepage) | [View in browser](https://rawgit.com/kalpetros/TheOdinProject/master/google_homepage/index.html)
* [Alberto Madrazo's solution](https://github.com/otreblatercero/my_google) | [View in browser](https://htmlpreview.github.io/?https://github.com/otreblatercero/my_google/blob/master/search.html)
* [Segrey Pikin's solution](https://github.com/pikinkz/google-homepage) | [View in browser](https://github.com/pikinkz/google-homepage/blob/master/index.html)
* [Defgarden's solution](https://github.com/Defgarden/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/Defgarden/google-homepage/blob/master/index.html)
* [Jasmine Batchellor-Sequeira's solution](https://github.com/jasminebs/google-homepage) | [View in browser](https://github.com/jasminebs/google-homepage/blob/master/index.html)
* [Austin Mason's EASY solution](https://github.com/CouchofTomato/google-homepage.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/CouchofTomato/google-homepage/blob/master/index.html) | [HARD solution](https://github.com/CouchofTomato/google-homepage-difficult.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/CouchofTomato/google-homepage-difficult/blob/master/index.html)
* [E. Wilson's solution](http://github.com/Wilcott321/Google_Homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/Wilcott321/Google_Homepage/blob/master/index.html)
* [Will Hayslett's solution](https://github.com/willhayslett/google-homepage) | [View in browser](https://rawgit.com/willhayslett/google-homepage/master/index.html)
* [Sean McDonnell's solution](https://github.com/spmcdonnell/google-homepage) | [View in browser (easy)](https://htmlpreview.github.io/?https://github.com/spmcdonnell/google-homepage/blob/master/googlehp.html) | [View in browser (difficult)](https://htmlpreview.github.io/?https://github.com/spmcdonnell/google-homepage/blob/master/googlesearchpage.html)
* [Seth C. Perera's Solution](https://github.com/sethcperera/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/sethcperera/google-homepage/blob/master/index.html)
* [Carlos Rodrigo's solution (spanish)](https://github.com/xack83/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/xack83/google-homepage/blob/master/index.html)
* [Nisarg Rawal's solution (easy)](https://github.com/justiceleague1729/the_odin_project/tree/master/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/justiceleague1729/the_odin_project/blob/master/google-homepage/index.html)
* [Dennis Lin's solution](https://github.com/dbanx/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/dbanx/google-homepage/blob/master/index.html)
* [Drew Hall's solution](http://github.com/13337/google-homepage) | [View in browser](https://htmlpreview.github.com/?https://github.com/13337/google-homepage/blob/master/index.html)
* [Pablo Bordons Estrada's solution](https://github.com/pboest/the_odin_project/tree/master/02_WebDevelopment101/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/pboest/the_odin_project/blob/master/02_WebDevelopment101/google_homepage/index.html)
* [Sarabeth's difficult solution](https://github.com/sarabethz/google_search_pg) | [View in browser](http://htmlpreview.github.io/?https://github.com/sarabethz/google_search_pg/blob/master/index.html)
* [ekrul's solution](https://github.com/ekrul/google_page) | [View in browser](http://htmlpreview.github.io/?https://github.com/ekrul/google_page/blob/master/index.html)
* [Ashley Lewis's solution](https://github.com/ashleymichal/the_odin_project/tree/master/the-odin-project/html/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ashleymichal/the_odin_project/tree/master/the-odin-project/html/google-homepage/index.html)
*[Sarabeth's difficult solution](https://github.com/sarabethz/google_search_pg) | [View in browser](http://htmlpreview.github.io/?https://github.com/sarabethz/google_search_pg/blob/master/index.html)
* [Joe Pfohl's solution](https://github.com/japfohl/google-homepage) | [View in browser: ](http://japfohl.github.io/google-homepage/)
* [Corey Kazaks's easy solution](https://github.com/ck626/google-homepage) | [View in browser: ](http://htmlpreview.github.io/?https://github.com/ck626/google-homepage/blob/master/index.html)
* [Novneet's Solution](https://github.com/novneetnov/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/novneetnov/google-homepage/blob/master/index.html) | [Difficult version](http://htmlpreview.github.io/?https://github.com/novneetnov/google-homepage/blob/master/searchResults.html)
* [Alo Tauaese's Solution](https://github.com/McHammercakes/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/McHammercakes/google-homepage/blob/master/index.html)
* [Alex Martin's solution](https://github.com/AlexGM07/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/AlexGM07/google-homepage/blob/master/index.html)
* [Ryan Chang's Solution](https://github.com/chang-ryan/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/chang-ryan/google-homepage/blob/master/index.html)
* [CodeRobot's Solution](https://github.com/iashraful/top-google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/iashraful/top-google-homepage/blob/master/index.html)
* [Jim Lin's solution](https://github.com/miljinx/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/miljinx/google-homepage/blob/master/index.html)
* [Patrick Ryan's solution](https://github.com/arist0cles/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/arist0cles/google-homepage/blob/master/index.html)
* [Muhammad Faizan Chaki's solution](https://github.com/mfaizanchaki/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/mfaizanchaki/google-homepage/blob/master/index.html)
* [Simon Kraus' solution](https://github.com/simonkrausgit/the_odin_project/blob/master/google_homepage/index.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/simonkrausgit/the_odin_project/blob/master/google_homepage/index.html)
* [Andrea L's solution](https://github.com/xAndreaLx/top-google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/xAndreaLx/top-google-homepage/blob/master/index.html)
* [Cecilia Avery's solution](https://github.com/cilavery/google-homepage/tree/master/CSS_HTML) | [View in browser](https://htmlpreview.github.io/?https://github.com/cilavery/google-homepage/blob/master/CSS_HTML/index.html)
* [Ethan Harner's solution](https://github.com/ethanharner/odin-project/tree/master/google-homepage) | [View in Browser](http://htmlpreview.github.io/?https://github.com/ethanharner/odin-project/blob/master/google-homepage/index.html)
* [Adrian Szima's solution](https://github.com/AdrianSzima/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/AdrianSzima/google-homepage/blob/master/Google.html)
* [Pras Kumar's solution](https://github.com/apkkadam/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/apkkadam/google-homepage/blob/master/index.html)
* [Bas Langenberg's solution](https://github.com/BasLangenberg/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/BasLangenberg/google-homepage/blob/master/index.html)
* [Michael Sotkin's solution](https://github.com/msotkin/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/msotkin/google-homepage/blob/master/index.html)
* [Jason Harris' solution](https://github.com/jasonharris1/recreate-google/blob/gh-page/index.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/jasonharris1/recreate-google/master/index.html)
* [Chethan Bhat's solution](https://github.com/chethanbhat/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/chethanbhat/google-homepage/blob/master/index.html)
* [Angel A. Martinez's A. solution](https://github.com/aama79/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/aama79/google-homepage/blob/master/index.html)
* [Angel A. Martinez's A. solution](https://github.com/aama79/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/aama79/google-homepage/index.html)
* [trekkabout](https://github.com/trekkabout/google-homepage) | [View in Browser](http://htmlpreview.github.io/?https://github.com/trekkabout/google-homepage/blob/master/index.html)
* [Francisco Carlos da Silva's solution](https://github.com/fcarlosdev/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/fcarlosdev/google-homepage/master/index.html)
* [Ella Chiang's solution](https://github.com/ellatronic/the-odin-project/tree/master/web-development-101/google-homepage-easy) | [View in browser](http://htmlpreview.github.io/?https://github.com/ellatronic/the-odin-project/blob/master/web-development-101/google-homepage-easy/index.html)
* [Giorgos Mitsis's solution](https://github.com/vinPopulaire/google_homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/vinPopulaire/google_homepage/blob/master/index.html)
* [Piotr Ejsmont's solution](https://github.com/PiotrEjsmont/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/PiotrEjsmont/google-homepage/blob/master/Google.html) | [View in browser (difficult solution)](http://htmlpreview.github.io/?https://github.com/PiotrEjsmont/google-homepage/blob/master/buildthiswebpage.html)
* [Troy Hubbell's solution](https://github.com/Socrates714/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/Socrates714/google-homepage/blob/master/googlepage.html)
* [Toby Aurelius' solution](https://github.com/sidewaysgiraffe/TheOdinProject/tree/master/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/sidewaysgiraffe/TheOdinProject/blob/master/google-homepage/index.html)
* [Karol Wójcik's solution](https://github.com/CharlesPL/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/CharlesPL/google-homepage/master/index.html)
* [Jason Bialick's solution](https://github.com/jbialick/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/jbialick/google-homepage/blob/master/google-homepage.html)
* [Richard Rosario's solution](https://github.com/rrosario2142/google-homepage.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/rrosario2142/google-homepage/blob/master/index.html)
* [Nitish Dayal's solution](https://github.com/nitishdayal/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/nitishdayal/google-homepage/blob/master/nitish-google.html)
* [Jack Deegan's solution](https://github.com/DidsyTurbo/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/DidsyTurbo/google-homepage/blob/master/index.html)
* [Tom Westerhout's easy solution](https://github.com/Westw00d/Google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/Westw00d/Google-homepage/blob/master/Google.html) | [Difficult solution] (https://github.com/Westw00d/Google-search-results) | [View in browser (difficult)] (http://htmlpreview.github.io/?https://github.com/Westw00d/Google-search-results/blob/master/Google%20search%20results.html)
* [Jeffrey Sabol's solution](https://github.com/libraryman/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/libraryman/google-homepage/blob/master/index.html)
* [Prasanth Louis solution](https://github.com/prasanthlouis/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/prasanthlouis/google-homepage/blob/master/Google.html)
* [Cornelius Edward's solution](https://github.com/corneal64/google-homepage) | [View in browser](http://corneal64.github.io/google-homepage)
* [Gamal Mekawy's solution](https://github.com/Nerdherdx/Google-Homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/Nerdherdx/Google-Homepage/blob/master/index.html)
* [Gabriel Ramos solution](https://github.com/GabrielusR/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/GabrielusR/google-homepage/blob/master/index.html)
* [Jake Hill's solution](https://github.com/JakeH91/Practice/tree/master/the_odin_project/project_html%2Bcss) | [View in browser](http://htmlpreview.github.io/?https://github.com/JakeH91/Practice/blob/master/the_odin_project/project_html+css/index.html)
* [Andrew Park's solution](https://github.com/akpark93/the_odin_project/tree/master/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/akpark93/the_odin_project/blob/master/google-homepage/index.html)
* [Ivy Olamit's solution](https://github.com/ivyr/google-homepage) | [View in browser](http://ivyr.github.io/google-homepage)
* [Dan Gerdes' solution](https://github.com/Entenhuegel/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/Entenhuegel/google-homepage/blob/master/index.html)
* [Guillermo Maiolo's solution (Spanish)](https://github.com/GMaiolo/The-Odin-Project/tree/master/Google-Homepage-Layout) | [View in browser](http://htmlpreview.github.io/?https://github.com/GMaiolo/The-Odin-Project/blob/master/Google-Homepage-Layout/index.html)
* [JFLX's solution](https://github.com/JFLX/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/JFLX/google-homepage/blob/master/index.html)
* [Jess Bullock's solution](https://github.com/jessbullock/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/jessbullock/google-homepage/blob/master/index.html)
* [Bijjjr's solution] (https://github.com/bijjjr/google-homepage) | [View in browser] (https://rawgit.com/bijjjr/google-homepage/master/bijjjr-google.html)
* [Kelly Downes' solution](https://github.com/kdow/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/kdow/google-homepage/blob/master/google.html)
* [Aryan Jabbari's solution](https://github.com/AryanJ-NYC/google-homepage) | [View in browser](http://aryanj-nyc.github.io/google-homepage/)
* [Prakhar Gautam's solution (Easy) ](https://github.com/prakhargautam/google-homepage) | [View in browser (easy)](http://htmlpreview.github.io/?https://github.com/prakhargautam/google-homepage/master/google.html) || [(Hard)](https://github.com/prakhargautam/google-homepage-hard-) | [View in browser (Hard)](http://htmlpreview.github.io/?https://github.com/prakhargautam/google-homepage-hard-/master/google.html)
* [DV's solution](https://github.com/dvislearning/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/dvislearning/google-homepage/blob/master/google.html)
* [Thomas's solution] (https://github.com/Tomkawa/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/Tomkawa/google-homepage/blob/master/index.html)
* [David Atcheson's solution](https://github.com/atchesond/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/atchesond/google-homepage/blob/master/index.html)
* [Skye Free's solution] (https://github.com/swfree/google-homepage) | [View in browser] (http://htmlpreview.github.io/?https://github.com/swfree/google-homepage/blob/master/index.html)
* [John Smalley's solution](https://github.com/johnsmalley/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/johnsmalley/google-homepage/blob/master/index.html)
* [Andrew Johnson's solution - easy](https://github.com/ad-johnson/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/ad-johnson/google-homepage/blob/master/homepage.html) | [Hard (view in browser)](http://htmlpreview.github.io/?https://github.com/ad-johnson/google-homepage/blob/master/results.html)
* [Jerrell Bryant's solution](https://github.com/codeNameJKB/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/codeNameJKB/google-homepage/blob/master/google-homepage/index.html)
* [Noman Karim's solution](https://github.com/nomankarim/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/nomankarim/the_odin_project/blob/master/index.html)
* [Harald Günther's solution](https://github.com/hguent2003/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/hguent2003/google-homepage/blob/master/index.html)
* [mfDK's Solution](https://github.com/mfDK/google-home) | [View in browser] (https://htmlpreview.github.io/?https://github.com/mfDK/google-home/blob/master/google.html)
* [Dexter's Solution] (https://github.com/dexterdorer/google-homepage.git) | [View in browser] (https://htmlpreview.github.io/?https://github.com/dexterdorer/google-homepage/blob/master/google_homepage)
* [Andrew Greene's Solution] (https://github.com/agreene71/google-homepage) | [View in Browser] (http://htmlpreview.github.io/?https://github.com/agreene71/google-homepage/blob/master/index.html)
* [CodyLBuffaloe's solution](https://github.com/CodyLBuffaloe/google-homepage) | [View in Browser (Easy)](https://htmlpreview.github.io/?https://github.com/CodyLBuffaloe/google-homepage/blob/master/google-homepage.html) | [View in Broswer (Difficult)](https://htmlpreview.github.io/?https://github.com/CodyLBuffaloe/google-homepage/blob/master/google-search-results.html)
* [Cody's Solution] (https://github.com/cody-the-coder/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/cody-the-coder/google-homepage/blob/master/index.html)
* [Terrib1e's Solution] (https://github.com/Terrib1e/google-clone.git) | [View in browser] (https://htmlpreview.github.io/?https://github.com/Terrib1e/google-clone/blob/master/google-clone.html)
* [Monique E's solution](https://github.com/MoniqueE/google-homepage-2) | [View in browser] (https://htmlpreview.github.io/?https://github.com/MoniqueE/google-homepage-2/blob/master/index.html)
* [Carlton's Solution] (https://github.com/carltonstith/google-homepage/tree/master) | [View in browser] (http://carltonstith.github.io/google-homepage/)
* [Raphael N's Solution] (https://github.com/raph-nov/google-homepage) | [View in browser] (http://htmlpreview.github.io/?https://github.com/raph-nov/google-homepage/blob/master/index.html)
* [Lee Knowlton's Solution] (https://github.com/leeknowlton/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/leeknowlton/google-homepage/blob/master/index.html)
* [Abeer Morssy's Solution] (https://github.com/abeermorssy/google\_homepage) | [View in browser] (https://cdn.rawgit.com/abeermorssy/google_homepage/master/index.html)
* [Nida's Solution] (https://github.com/nidafarooqui/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/nidafarooqui/google-homepage/blob/master/index.html)
* [Dominik's Solution] (https://github.com/hamstersky/google_homepage) | [View in browser] (http://htmlpreview.github.io/?https://github.com/hamstersky/google_homepage/blob/master/index.html)
* [Oleh's Solution] (https://github.com/OlehZiniak/google-homepage) | [View in browser] (http://htmlpreview.github.io/?https://github.com/OlehZiniak/google-homepage/blob/master/index.html)
* [Bryan's Solution] (https://github.com/BryanGigs/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/BryanGigs/google-homepage/blob/master/index.html)
* [Justin L's Solution] (https://github.com/just-n/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/just-n/google-homepage/blob/master/index.html)
* [Dante Kellys' solution](https://github.com/dantekelly/google-homepage) | [View in browser](https://htmlpreview.github.io/?https://github.com/dantekelly/google-homepage/blob/master/index.html)
* [Bahrul Ulum's Solution] (https://github.com/bhru/google-homepage) | [View in browser] (http://htmlpreview.github.io/?https://github.com/bhru/google-homepage/blob/master/index.html)
* [Alejandro Mesa's Solution] (https://github.com/alemesa1991/google-homepage) | [View in browser] (https://htmlpreview.github.io/?https://github.com/alemesa1991/google-homepage/blob/master/index.html)
* [Luke Walker's Solution] (https://github.com/ubershibs/google_homepage) | [View in browser] (http://htmlpreview.github.io/?https://github.com/ubershibs/google_homepage/blob/master/index.html)
* Add your solution above this line!


## Additional Resources


*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

If you still feel shaky on your understanding of HTML and CSS, that's okay! You don't need to be an expert by any means yet. These resources should help if you want to shore up your understanding of things:

* Watch all the [free HTML videos](http://teamtreehouse.com/library/websites/html/introduction) from Treehouse and take the quiz.
* Check out the [quickie CSS introduction](http://teamtreehouse.com/library/websites/build-a-simple-website/website-basics/introduction-to-css) from the same people as well.
* If you want to see the art of CSS, check out the [CSS Zen Garden](http://www.csszengarden.com/), which collects submissions that use identical HTML and modify only the CSS but turn out wildly different (and beautiful).
* Read through [Shay Howe's HTML&CSS Tutorial](http://learn.shayhowe.com/html-css/terminology-syntax-intro).  Lesson 1 gives a solid overview and you can do the whole thing for a more in-depth understanding.
* Learn more about github using this tutorial: (https://try.github.io) or read more in this article: (http://readwrite.com/2013/09/30/understanding-github-a-journey-for-beginners-part-1)
