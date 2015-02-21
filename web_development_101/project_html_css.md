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
* [Andrej Dragojevic's solution](https://github.com/antrix1/google-home) | [View in browser](http://htmlpreview.github.io/?https://github.com/antrix1/google-home/blob/master/index.html)
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
* [Ryan Jordan's solution](https://github.com/krjordan/google-homepage) | [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/google-homepage/blob/master/index.html)
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
* [Tobiastp's solution](https://github.com/tobiastp/google-homepage) | [View it in browser](http://htmlpreview.github.io/?https://github.com/tobiastp/google-homepage/blob/master/index.html)
* Add your solution above this line!
* See [Julian Feliciano's solution here](https://github.com/JulsFelic/google-search-results)
* See [Nate Bennett's solution here](https://github.com/n8sb/odin-project/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/n8sb/odin-project/blob/master/google-homepage/index.html).
* See [David Becker's solution here](https://github.com/d88becker/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/d88becker/google-homepage/blob/master/index.html)
* See [Nate Bennett's solution here](https://github.com/n8sb/google-homepage) or [view it in the browser here](https://rawgithub.com/n8sb/google-homepage/master/index.html).
* See [Cedric Charly's solution here](https://github.com/Cedricgc/playground/tree/master/The%20Odin%20Project/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Cedricgc/playground/blob/master/The%20Odin%20Project/google-homepage/index.html).
* See [Cody Arsenault's solution here](https://github.com/codyarsenault/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/codyarsenault/google-homepage/blob/master/index.html).
* See [RebootJeff's solution here](https://github.com/RebootJeff/odinproject/blob/master/odin.html.google_clone) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/RebootJeff/odinproject/blob/master/odin.html.google_clone/google_clone.html).
* See [JesseNeal's solution here](https://github.com/jesseneal/Odin-Project/blob/master/GoogleClone/index.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jesseneal/Odin-Project/blob/master/GoogleClone/index.html)
* See [Neil Gehani's solution here](https://github.com/ngehani/htmlcss/blob/master/googlelogo) or [view it in the browser here](http://htmlpreview.github.io?https://github.com/ngehani/htmlcss/blob/master/googlelogo/index.html).
* See [Neil Gehani's bootstrap solution here](https://github.com/ngehani/htmlcss/blob/master/googlelogo-bootstrap/index.html) or [view it in the browser here](http://htmlpreview.github.io?https://github.com/ngehani/htmlcss/blob/master/googlelogo-bootstrap/index.html).
* See [Paul Dariye's solution here](https://github.com/pauldd91/theodinproject/tree/master/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/pauldd91/theodinproject/master/google_homepage/index.html).
* See [Joshua Gorchov's solution here](https://github.com/gorchov/odin/tree/master/01_02_HTML_CSS) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/gorchov/odin/blob/master/01_02_HTML_CSS/index.html).
* See [Afshin Mokhtari's implementation of the 'difficult' version](https://github.com/afshinator/OdinProject-GoogleSearchClone) with instructions on getting an API key to make it run.
* See [Bill Walker's solution here](https://github.com/mach1010/odin/tree/master/html_css) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/mach1010/odin/blob/master/html_css/google.html).
* See [Lamberto Diwa's solution here](https://github.com/LambertoD/odin_curricullum/tree/master/html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/LambertoD/odin_curricullum/blob/master/html/odin_google_page_project.html).
* See [Marina Sergeyeva's solution here](https://github.com/imousterian/OdinProject/blob/master/html_css/google-homepage/google-page.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/html_css/google-homepage/google-page.html).
* See [Arun Kumar's solution here](https://github.com/arun1595/google_homepage) or [view it in the browser ](http://htmlpreview.github.io/?https://github.com/arun1595/google_homepage/blob/master/google.html)
* See [Jeffery Garza's solution here](https://github.com/jgarza/odin-project-studies/tree/master/html_css/google_project1) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jgarza/odin-project-studies/blob/master/html_css/google_project1/index.html).
* See [Jeffery Garza's 'difficult' solution here](https://github.com/jgarza/odin-project-studies/tree/master/html_css/google_project2) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jgarza/odin-project-studies/blob/master/html_css/google_project2/index.html).
* See [Ricky Walker's solution here](https://github.com/Rwalk45/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Rwalk45/google-homepage/blob/master/index.html).
* See [Aniruddh Agarwal's solution here](https://github.com/aniruddhagarwal/odin-projects/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/aniruddhagarwal/odin-projects/blob/master/google-homepage/index.html).
* See [Jamie's solution (submitted: Mar-27,2014)](https://github.com/Jberczel/odin-projects/tree/master/google-homepage) or [view in browser](http://htmlpreview.github.io/?https://github.com/Jberczel/odin-projects/blob/master/google-homepage/index.html).
* See [Sergey Prihodko's solution here](https://github.com/sprihodko/odin-projects/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/sprihodko/odin-projects/blob/master/google-homepage/index.html).
* See [Angel Vargas's solution here](https://github.com/arioth/the-odin-project/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/arioth/the-odin-project/blob/master/google-homepage/index.html).
* See [Abrar Hussain's solution here](https://github.com/abrarisme/The-Odin-Project/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/abrarisme/The-Odin-Project/blob/master/google-homepage/index.html)
* See [Joe Barratt's solution here](https://github.com/Evilbazza/google) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Evilbazza/google/blob/master/thing.html)
* See [Sahil Agarwal's solution here](https://github.com/sahilda/the_odin_project/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/sahilda/the_odin_project/blob/master/google-homepage/google.html). Click the 'Google Search' button for the difficult version page.
* See [Chris Oldakowski's solution here](https://github.com/KrzysiekO/theodinproject/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/KrzysiekO/theodinproject/blob/master/google-homepage/index.html).
* See [Paul Casey's solution here](https://github.com/jpcasey/theodinproject/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jpcasey/theodinproject/blob/master/google-homepage/index.html).
* See [Ingi Kim's solution here](https://github.com/ingikim/The-Odin-Projects/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ingikim/The-Odin-Projects/blob/master/google-homepage/index.html).
* See [Ruben Mendez's solution here](https://github.com/ruben-socal/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ruben-socal/google-homepage/blob/master/index.html).
* See [Alan Russell's solution here](https://github.com/ajrussellaudio/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ajrussellaudio/google-homepage/blob/master/index.html).
* See [Arman Ghassemi's solution here](https://github.com/ArmanG/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ArmanG/google-homepage/blob/master/index.html).
* See [Bryan's solution here](https://github.com/bryan42690/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/bryan42690/google-homepage/blob/master/index.html).
* See [Gibran Garcia's solution here](https://github.com/Satimidus/OdinProject/tree/master/GoogleHomePage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Satimidus/OdinProject/blob/master/GoogleHomePage/index.html).
* See [Jesreal Arcillas's solution here](https://github.com/jigogwapo/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jigogwapo/google-homepage/blob/master/index.html).
* See [Will Slone's solution here](https://github.com/willslone/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/willslone/google-homepage/blob/master/index.html).
* See [Sam's solution here](https://github.com/jimbroski/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jimbroski/google-homepage/blob/master/index.htm).
* See [Mohdhar's solution here](https://github.com/theummah/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/theummah/google-homepage/blob/master/homepage.html)
* See [Afonso's solution here](https://github.com/h4v1nfun/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/h4v1nfun/google-homepage/blob/master/index.html)
* See [Jason Ellis's solution here](https://github.com/jason-ellis/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jason-ellis/google_homepage/blob/master/google.html)
* See [Scott Yu's solution here](https://github.com/scootcho/the_odin_project/blob/master/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/scootcho/the_odin_project/blob/master/google_homepage/index.html)
* See [Donald's solution](https://github.com/donaldali/odin-webdev101/tree/master/project_htmlcss) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/donaldali/odin-webdev101/blob/master/project_htmlcss/index.html)
* See [Tommy Noe's solution here](https://github.com/thomasjnoe/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/thomasjnoe/google-homepage/blob/master/index.html)
* See [Mazin Power's solution](https://github.com/muzfuz/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/muzfuz/google-homepage/blob/master/index.html)
* See [Yeon Seo's solution](https://github.com/yseoserious/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/yseoserious/google-homepage/blob/master/index.html)
* See [Conor Foley's solution](https://github.com/conchurofoghlu/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/conchurofoghlu/google-homepage/blob/master/index.html)
* See [Laurie Alaoui's solution](https://github.com/lalaouil/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/lalaouil/google-homepage/blob/master/index.html)
* See [Lui Joy's solution](https://github.com/lui8906/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/lui8906/google-homepage/blob/master/index.html)
* See [Michael Martinez's solution here](https://github.com/AZUREXANDER/The-Odin-Project/tree/master/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/AZUREXANDER/The-Odin-Project/blob/master/google-homepage/index.html)
* See [Ngoc Truong's (German) solution here](https://github.com/OleScheinfrei/google-homepage/blob/master/index.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/OleScheinfrei/google-homepage/blob/master/index.html)
* See [Colin Mason's solution here](https://github.com/skateboard34/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/skateboard34/google-homepage/blob/master/index.html)
* See [Melinda Sarnicki's solution here](https://github.com/msarnicki/The-Odin-Project/tree/master/Google%20Home%20Page) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/msarnicki/The-Odin-Project/blob/master/Google%20Home%20Page/index.html)
* See [Tomislav Mikulin's (Croatian) solution here](https://github.com/MrKindle85/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/MrKindle85/google-homepage/blob/master/index.html)
* See [Colin Mason's solution here](https://github.com/skateboard34/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/skateboard34/google-homepage/blob/master/index.html)
* See [Eric Gagnon's solution here](https://github.com/wickedRidge/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/wickedRidge/google-homepage/blob/master/index.html)
* See [Adam Skaggs solution here](https://github.com/skaggsa3/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/skaggsa3/google-homepage/blob/master/index.html)
* See [khalil Ait Brahim's solution here](https://github.com/Khalilw1/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Khalilw1/google-homepage/blob/master/Google_homepage.html)
* See [Will Cameron's solution here](https://github.com/camerow/google-homepage-recreate.git) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/camerow/google-homepage-recreate/blob/master/googleSearch.html)
* See [Michael Alexander's solution here](https://github.com/betweenparentheses/google-homepage/blob/master/google.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/betweenparentheses/google-homepage/blob/master/google.html)
* See [Tamim Sookoor's solution here](https://github.com/sookoor/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/sookoor/google-homepage/blob/master/index.html)
* See [Steve Mitchell's solution here](https://github.com/Ixpata/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Ixpata/google-homepage/blob/master/index.html)
* See [Benjamin Ratiarisolo's (French) solution here](https://github.com/ratiaris/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ratiaris/google-homepage/blob/master/google.html)
* See [John Miller's solution here](https://github.com/johndrmiller/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/johndrmiller/google-homepage/blob/master/index.html)
* See [Letsibogo Ramadi's solution here](https://github.com/letsboogey/google_homepage_project) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/letsboogey/google_homepage_project/blob/master/index.html)
* see [Kevin Mulhern's solution here](https://github.com/KevinMulhern/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/KevinMulhern/google-homepage/blob/master/index.html)
* see [Erik Margetis's solution here](https://github.com/emargetis/google-homepage.git) or [view it in the browser here](https://github.com/emargetis/google-homepage/blob/master/index.html)
* see [Farkhod Karimov's solution here](https://github.com/fkarimov/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/fkarimov/google-homepage/blob/master/index.html)
* see [Gerardo Ramirez's solution here](https://github.com/brbtheory/google-homepage) or [view it in the browser here](https://htmlpreview.github.io/?https://github.com/brbtheory/google-homepage/blob/master/index.html)
* see [Hira Javaid's solution here](https://github.com/h-i-r-a/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/h-i-r-a/google-homepage/blob/master/index.html)
* see [Jonathan Faulk's solution here](https://github.com/faulk49/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/faulk49/google-homepage/blob/master/index.html)
* see [David Ford's solution here](https://github.com/djfordz/google-homepage) or [view it in the browser here](http://djfordz.github.io/google-homepage/)
* see [Toph Jones' solution here](https://github.com/tophj/google-webpage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/tophj/google-webpage/blob/master/index.html)
* see [Devon Barcherding's solution here](https://github.com/stolicus/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/stolicus/google_homepage/blob/master/index.html)
* see [James MacIvor's solution here](https://github.com/RobotOptimist/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/RobotOptimist/google-homepage/blob/master/index.html)
* see [Colonel Bookclub's solution here](https://github.com/Remitius/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Remitius/google-homepage/blob/master/index.html)
* see [Kevin Mulhern's Difficult solution here](https://github.com/KevinMulhern/google-homepage-hard)
* see [Vincent's solution here](https://github.com/wingyu/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/wingyu/google-homepage/blob/master/index.html)
* see [Dorian Iacobescu's solution here](https://github.com/iacobson/Google-Home-Page-Design) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/iacobson/Google-Home-Page-Design/blob/master/google-home.html)
* see [Michelle Pepe's Easy Version Solution here](https://github.com/MichellePepe/google-homepage)
* see [Julie De Lorenzo's solution here](https://github.com/delorenzo/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/delorenzo/google-homepage/blob/master/index.html)
* see [Liam Greig's solution here](https://github.com/cutegoesboom/odin-01) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/cutegoesboom/odin-01/blob/master/index.html)
* see [Khaled Maher's solution here](https://github.com/maxios/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/maxios/google-homepage/blob/master/homepage.html)
* see [Stephanie Gurung's solution here](https://github.com/stephr3/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/stephr3/google-homepage/blob/master/index.html)
* see [Hunter Ducharme's soulution here](https://github.com/hgducharme/odinProjects/tree/master/webDev101/googleHomepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/hgducharme/odinProjects/blob/master/webDev101/googleHomepage/googleHomepage.html)
* See [Paula Lucci's solution here](https://github.com/paulalucai/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/paulalucai/google-homepage/blob/master/index.html)
* Read Drew Price's solution [here](https://github.com/drewprice/study/tree/master/odin-project/projects/google-search), or view it in your browser [here](http://drewprice.github.io/study/odin-project/google-search/).
* See [Nicholas Payne's solution here](https://github.com/ndpayne/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ndpayne/google-homepage/blob/master/index.html)
* Read Drew Price's solution [here](https://github.com/drewprice/study/tree/master/odin-project/projects/google-search), or view it in your browser [here](http://drewprice.github.io/study/odin-project/google-search/)
* see [Raul Tecar's soulution here](https://github.com/raultecar/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/raultecar/google-homepage/Google_HTML.html)
* See [Jamie Nardini's solution here](https://github.com/jamienardini/google-homepage) or [view it in the browser here (easy)](http://htmlpreview.github.io/?https://github.com/jamienardini/google-homepage/blob/master/home_page/index.html) or [view it in the browser here (difficult)](http://htmlpreview.github.io/?https://github.com/jamienardini/google-homepage/blob/master/search_page/index.html).
* See [Bob Dobbs' solution here](https://github.com/KingHippo/google-homepage) or [View it in the browser here](http://htmlpreview.github.io/?https://github.com/KingHippo/google-homepage/index.html)
* see Sam Kham's soulution [here](https://github.com/samkham/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/samkham/google-homepage/blob/master/index.html)
* see [Chasmani's soulution here](https://github.com/chasmani/GoogleHomepage) or [view it in the browser here](http://www.chasmani.com/odin/google/google.html)
* see [John Quarles' soulution here](https://github.com/johnwquarles/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/johnwquarles/google-homepage/blob/master/index.html)
* see [Chris Rinaldi's soulution here](https://github.com/cgrinaldi/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/cgrinaldi/google-homepage/blob/master/index.html)
* see [Rafael Ruiz Moreno's solution here](https://github.com/rruimor/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/rruimor/google-homepage/blob/master/index.html)
* see [Antonio Augusto's solution here](https://github.com/antoniosb/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/antoniosb/google-homepage/blob/master/index.html)
* see [Andrej Dragojevic's solution here](https://github.com/antrix1/google-home) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/antrix1/google-home/blob/master/index.html)
* see [Lara Finnegan's solution here](https://github.com/lcf0285/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/lcf0285/google-homepage/blob/master/google-homepage.html)
* see [Artur Janik's Difficult solution (in Polish) here](https://github.com/ArturJanik/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ArturJanik/google-homepage/blob/master/index.html)
* see [Rik's (Dutch) solution here](https://github.com/frbz/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/frbz/google-homepage/blob/master/index.html)
* see [Nicole Erkis's solution here](https://github.com/nerkis/google-homepage) or view ['easy'](http://htmlpreview.github.io/?https://github.com/nerkis/google-homepage/blob/master/google.html) or ['difficult'](http://htmlpreview.github.io/?https://github.com/nerkis/google-homepage/blob/master/results.html) solutions in the browser
* see [Jatin Bhatia's solution here](https://github.com/JatinBhatia/google-homepage/tree/master/code)
* see [Anonymous' solution here](https://github.com/akshaykb/google-homepage)
* see [Jack Nguyen's solution here](https://github.com/jnguyen85/google_homepage_html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jnguyen85/google_homepage_html/blob/master/index.html)
* see [Cyrus Xi's solution here](https://github.com/Suryc11/TheOdinProject/tree/master/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Suryc11/TheOdinProject/blob/master/google_homepage/index.html)
* see [Richard Dickinson's solution here](https://github.com/rpd/google-homepage/blob/master/index.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/rpd/google-homepage/blob/master/index.html)
* see [Erin Yaylali's solution here](https://github.com/eyaylali/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/eyaylali/google-homepage/master/googlehomepage.html)
* see [Akshay Kumar Bhushan's solution here](https://github.com/akshaykb/google-homepage)
* see [Alice Rhomieux's solution here](https://github.com/arhx/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/arhx/google-homepage/blob/master/index.html)
* see [Jen Best's solution here](https://github.com/jenthebest/google-homepage)
[Faisal Muhammad Solution here 'Simple'](https://github.com/rahb20/google-homepage/blob/master/index.html)
['Difficult'](https://github.com/rahb20/google-homepage/blob/master/Search%20Result.html)
* see [Alex Ramin's solution here](https://github.com/theloniusmonkey/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/theloniusmonkey/google-homepage/blob/master/googlehomepage.html)
* see [Andrea Kulbaba's solution here](https://github.com/akulbaba/google-homepage) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/akulbaba/google-homepage/blob/master/index.html)
* see [Panagiotis Karatakis' solution here](https://github.com/BlackSpirit96/the-odin-project_solutions/tree/master/web-101/google-homepage) or [ see the difficult version here](https://github.com/BlackSpirit96/the-odin-project_solutions/tree/master/web-101/google-search-results)
* see [Julian De Ocampo's solution here](https://github.com/JCDJulian/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/JCDJulian/google-homepage/blob/master/homepage.html)
* see [Cedric Kisema's solution here](https://github.com/cnak/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/cnak/google-homepage/blob/master/index.html)
* see [AyeSea's solution here](https://github.com/AyeSea/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://raw.githubusercontent.com/AyeSea/google-homepage/master/index.html)
* See [Victorino Machava's solution here](https://github.com/vitolob/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/vitolob/google-homepage/blob/master/index.html)
* See [Richard Stewart's solution here](https://github.com/rickstewart/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/rickstewart/google-homepage/blob/master/index.html)
* See [Eleanor Weigert's solution here](https://github.com/mixophrygian/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/mixophrygian/google-homepage/blob/master/index.html)
* See [Alberto Marin's solution here](https://github.com/alberto-marin/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/alberto-marin/google-homepage/index.html)
* See [Tony Vumbaca's solution here](https://github.com/tvumbaca/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/tvumbaca/google-homepage/blob/master/index.html)
* See [Delphine Foo's solution here](https://github.com/delphinefoo/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/delphinefoo/google-homepage/index.html)
* See [Alberto Marin's solution here](https://github.com/alberto-marin/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/alberto-marin/google-homepage/index.html)
* See [Jitendra Jogeshwar's solution here](https://github.com/jogjitu/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jogjitu/google-homepage/blob/master/index.html)
* See [Alberto Marin's solution here](https://github.com/alberto-marin/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/alberto-marin/google-homepage/index.html)
* See [Josh Thompson's solution here](https://github.com/jtwebdev/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/jtwebdev/google-homepage/blob/master/index.html)
* See [Tommy Rodriguez's google-search page solution here](https://github.com/trodrigu/odinproject/tree/master/google-search) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/trodrigu/odinproject/blob/master/google-search/public/index.html)
* See [Asish Prabhakar's solution here](https://github.com/akottal/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/akottal/google-homepage/blob/master/google.html)
* See [Sami Bashraheel's solution here](https://github.com/sami/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/sami/google-homepage/blob/master/index.html)
* See [Monisha's solution here] (https://github.com/em55/Google-homepage) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/em55/google-homepage/blob/master/index.html)
* See [Ricardo Villegas' solutions here](https://github.com/claricardo/google-homepage) or view them in the browser here: [Easy version](http://htmlpreview.github.io/?https://github.com/claricardo/google-homepage/blob/master/index.html) or [Difficult version](http://htmlpreview.github.io/?https://github.com/claricardo/google-homepage/blob/master/search_index.html)
* See [Tyler Travers' "difficult" solution here](https://github.com/ttravers17/the_odin_project/tree/master/google_search_results) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ttravers17/the_odin_project/blob/master/google_search_results/index.html)
* See [Stetson Nash's solution here](https://github.com/StetsonN/google-homepage/blob/master/GoogleUM(alt).html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/StetsonN/google-homepage/blob/master/GoogleUM(alt).html)
* See [Chris Hall's Easy solution here](https://github.com/Concretechris/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Concretechris/google-homepage/blob/master/index.html)
* See [Ryan Jordan's solution here](https://github.com/krjordan/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/krjordan/google-homepage/blob/master/index.html)
* See [Dominik Stodolny's solutions here](https://github.com/dstodolny/google-homepage) or view them in the browser here: [Easy version](http://htmlpreview.github.io/?https://github.com/dstodolny/google-homepage/blob/master/index.html) or [Difficult version](http://htmlpreview.github.io/?https://github.com/dstodolny/google-homepage/blob/master/results.html)
* See [Sergio Martin's solution here](https://github.com/ShiroiZero/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ShiroiZero/google-homepage/blob/master/index.html)
* See [Onome Ovedje's solution here](https://github.com/Onome1/google_homepage) or [view it in the brower here](file:///Users/nomskiez/Desktop/the_odin_project/myindex.html)
* See [Kevin Weir's solution here] (https://github.com/IDCrisis2/the_odin_project/tree/master/google_homepage)
* See [Rafal Wojcik's solution here] (https://github.com/ProfoundKillah/google-homepage) or [view it in the brower here](http://htmlpreview.github.io/?https://github.com/ProfoundKillah/google-homepage/blob/master/index.html)
* See [Kate McFaul's solution here] (https://github.com/craftykate/odin-project/tree/master/Chapter_02-Web_Development_101/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/craftykate/odin-project/blob/master/Chapter_02-Web_Development_101/google_homepage/index.html)
* See [Nicholas Leoutsakos's solution here](https://github.com/nleoutsa/google-homepage)
* See [Jimmy Herward's solution here] (https://github.com/Onesizefitzall/google-homepage.git)
* See [Patrick Sullivan's solution here] (https://github.com/patsul12/google-copy) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/patsul12/google-copy/blob/master/index.html.erb)
* See [Alberto Marin's solution here] (https://github.com/alberto-marin/google-homepage) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/alberto-marin/google-homepage/index.html)
* See [Muhammad Salman's solution here] (https://github.com/salmanmanekia/google-homepage) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/salmanmanekia/google-homepage/blob/master/index.html)
* See [Vahe Hayrapetyan's solution here] (https://github.com/vahe1/google-homepage) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/vahe1/google-homepage/blob/master/index.html)
* See [Greg Park's solution here] (https://github.com/gregoryjpark/google-homepage) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/gregoryjpark/google-homepage/blob/master/index.html)
* See [Dylan Bailey's solution here] (https://github.com/dylancbailey/google-homepage.git) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/dylancbailey/google-homepage/blob/master/index.html)
* See [Adam Lecuyer's solution here] (https://github.com/antisense/google-homepage.git) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/antisense/google-homepage/blob/master/index.html)
* * See [Matt Kimball's solution here](https://github.com/mattj-kimball/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/mattj-kimball/google-homepage/blob/master/index.html)
* See [Emil Kaaen's solution here] (https://github.com/daulaus/google-homepage.git)
* See [Zane Bilous's solution here](https://github.com/Zane-/googleHomepage/blob/master/index.html) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Zane-/googleHomepage/blob/master/index.html)
* See [Benjamin Wilhelms's solution here] (https://github.com/Nimorgs/google-homepage.git) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/Nimorgs/google-homepage/blob/master/index.html)
* See [Jason Matthews' solution here](https://github.com/fo0man/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/fo0man/google-homepage/blob/master/index.html)
* See [Victor Sagrista's solution here] (https://github.com/citizenvsl/google_homepage_CSS.git) [view it in the browser here](http://htmlpreview.github.io/?https://github.com/citizenvsl/google_homepage_CSS/blob/master/index.html)
* See [Nick Kessler's solution here] (https://github.com/nakessler/google-homepage) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/nakessler/google-homepage/blob/master/index.html)
* See [Cherlaine Ordona's solution here] (https://github.com/soupersushi/google_homepage) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/soupersushi/google_homepage/blob/master/index.html)
* See [Mark Pearyer's solution here] (https://github.com/marcusp619/google-homepage) or [view it in browser here] (http://codepen.io/Marcusp619/pen/YPxJaR)
* See [Joseph Henry's solution here] (https://github.com/josephcode773/google-homepage) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/josephcode773/google-homepage/blob/master/index.html)
* See [Psidium's solution here] (https://github.com/Psidium/google-homepage) or [view it in the browser here (dificult version)](http://htmlpreview.github.io/?https://raw.githubusercontent.com/Psidium/google-homepage/master/google.html)
* See Saurabh Sikchi's solution [here (easy version)](https://github.com/Khamba/Google-clone) and [here (hard version)](https://github.com/Khamba/Google-search-results-clone) or view it in the browser [here (easy version)](http://htmlpreview.github.io/?https://github.com/Khamba/Google-clone/blob/master/index.html) and [here (hard version)](http://htmlpreview.github.io/?https://github.com/Khamba/Google-search-results-clone/blob/master/index.html)
* See [Sue Robbins' solution here] (https://github.com/shrobbins/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/shrobbins/google-homepage/blob/master/index.html)
* See [Pezz18's solution here] (https://github.com/Pezz18/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Pezz18/google-homepage/blob/master/Google.html)
* See [Robert Juall's solution here](https://github.com/RJuall/the_odin_project/tree/master/google_site)
* See [Taylor Buchheit's solution here](https://github.com/7aylor/google-homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/7aylor/google-homepage/blob/master/index.html)
* See [Don Price's solution here](https://github.com/KingHippo/the_odin_project/tree/master/google-homepage) or [view it in the browser here](http://kinghippo.github.io/the_odin_project/google-homepage/)
* See [Michelle CV's solution here](https://github.com/michellecv/google_homepage) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/michellecv/google_homepage/blob/master/index.html)
* See [trump's soluction here](https://github.com/trump812/google-homepage)
* See [Tobiastp's solution here](https://github.com/tobiastp/google-homepage) or [view it in browser here](http://htmlpreview.github.io/?https://github.com/tobiastp/google-homepage/blob/master/index.html)
* See [Jeremy Mauzy's solution here](https://github.com/apositivejam/google-homepage) or [view it in browser here](http://htmlpreview.github.io/?https://github.com/apositivejam/google-homepage/blob/master/google.html)
* Put your solution above this line!


## Additional Resources


*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

If you still feel shaky on your understanding of HTML and CSS, that's okay! You don't need to be an expert by any means yet. These resources should help if you want to shore up your understanding of things:

* Watch all the [free HTML videos](http://teamtreehouse.com/library/websites/html/introduction) from Treehouse and take the quiz.
* Check out the [quickie CSS introduction](http://teamtreehouse.com/library/websites/build-a-simple-website/website-basics/introduction-to-css) from the same people as well.
* If you want to see the art of CSS, check out the [CSS Zen Garden](http://www.csszengarden.com/), which collects submissions that use identical HTML and modify only the CSS but turn out wildly different (and beautiful).
* Read through [Shay Howe's HTML&CSS Tutorial](http://learn.shayhowe.com/html-css/terminology-syntax-intro).  Lesson 1 gives a solid overview and you can do the whole thing for a more in-depth understanding.
* Learn more about github using this tutorial: https://try.github.io or read more in this article: http://readwrite.com/2013/09/30/understanding-github-a-journey-for-beginners-part-1
