# The Best Free Resources for Learning HTML and CSS

Though this course is currently under construction, there are tons of great resources out there for learning HTML and CSS and we've started laying them out for you below.  The first place to start is definitely in the [Web Development 101 lesson on HTML and CSS](/web-development-101/html-and-css-basics), which covers a lot of ground to get you up to speed on the basics.  In fact, most of what you need to know to build effective websites is covered there.  

This course will be designed to follow that introductory material with more depth so you can start to flex your design muscles to produce more appealing and easy-to-use websites.  Luckily for you, there are an enormous amount of resources available on the web to learn front end development, so if you ever get stuck, Google is your friend.

## The Path Forward

Here are a list of things you'll want to understand to get a good handle on HTML5 and CSS3 and the best places we've found to read up on them.

## HTML5

### Basics

Most of this should be review since you've already completed [the Web Development 101 HTML/CSS Lesson (Right??)](/web-development-101/html-and-css-basics) but it's a good idea to make sure you've got it covered so you make sure you're starting from a strong base.  It's impossible to separate HTML from CSS, so there will be some overlap before we get heavily into the CSS in later sections.

#### Points to Ponder

* How is an HTML5 document structured?  
* What are elements/tags? 
* What are element attributes?  
* How do you link to external files?  
* When should you use IDs vs Classes? 
* What attributes are required by image and links for them to be effective and accessible?  
* Where should your CSS live?

#### Links

* [Shay Howe's introduction to Terminology & Syntax](http://learn.shayhowe.com/html-css/terminology-syntax-intro)
* [Shay Howe on the HTML Basics](http://learn.shayhowe.com/html-css/elements-semantics)
* [Shay Howe on Best Practices](http://learn.shayhowe.com/html-css/coding-practices)

### Lists

Ordered and unordered lists are heavily used in most websites.  It's not just for bullet-points and numbers... they are also used in creating horizontal navbars and long collections of objects (like a list of pictures of items for sale).

#### Points to Ponder

* What is the basic list syntax?
* How do you nest lists inside each other?

#### Links

* [Shay Howe on Lists (including CSS)](http://learn.shayhowe.com/html-css/ordered-unordered-definition-lists)
* [HTMLGoodies' rapid fire guide to different list types](http://www.htmlgoodies.com/tutorials/getting_started/article.php/3479461)
* [HTML docs on lists](http://www.w3schools.com/html/html_lists.asp)

### Linking

Links are the glue holding the web together, so make sure you understand how to properly link to external websites AND internal files.

#### Points to Ponder

* What's the difference between internal links (/somepage) and external links (http://www.somesite.com/somepage)?
* When on a webpage should you use the full URI (with the `http://yoursite.com/somepath`) and when should you use the relative path (`/somepath`)?
* How do you navigate the document tree with links (../../someotherpage)?
* How do you open links in external windows?
* What are all the possible pseudo-states (e.g. `:hover`) of a link and when are they actually activated?  How do you change styles based on them?

#### Links

* [Jeffrey Barke explains the difference between absolute and relative paths and why you should use each](http://jeffreybarke.net/2013/06/paths-and-urls-relative-and-absolute/)
* [Boogie Jack on link paths](http://www.boogiejack.com/server_paths.html)
* [About.com on linking](http://webdesign.about.com/od/beginningtutorials/a/aa040502a.htm)

### Images and Media

Images and other media are an essential part of providing a good user experience and they are ubiquitous on websites today.  They are also your biggest, clunkiest set of assets and can ruin your page load times if you're not careful.  When your site is slow, the easiest way to get it running faster is to optimize your image sizes and filetypes.  

There is also a big difference between each of the image filetypes, so pay attention to the use cases for each.  Remember, the goals are usually image size vs quality (though sometimes you want animation or clear backgrounds too), so figure out the differences between `gif` and `jpg` and `bmp` and `png` and `svg`.

#### Points to Ponder 

* What are common attributes of image tags?
* How do you load a smaller version of an image?
* How do you get an image to fill up an element?
* How do you save load times by using appropriately sized images?  
* When should you store images externally vs on your server?
* What are the main types of image files and how are they different?
* Which file types let you use animation?
* Which file types let you use transparent colors?
* Which file types are best for photos?  Graphics?
* Which file type lets you scale an image as big as you want without affecting file size (and why)?
* What's the difference between raster and vector images?
* How do you add video to your page? (please don't autoplay...)
* How do you add audio to your page? (please don't autoplay...)

#### Links

* [Shay Howe on Images and Media (includes CSS)](http://learn.shayhowe.com/html-css/images-audio-video)
* [Differences between image types (see first answer) from SO](http://stackoverflow.com/questions/2336522/png-vs-gif-vs-jpeg-when-best-to-use)
* [Another look at differences between image types](http://www.practicalecommerce.com/articles/1821-Image-Formats-What-s-the-Difference-Between-JPG-GIF-PNG-)
* [Raster vs Vector images explained simply by YouTheDesigner.com](http://www.youthedesigner.com/2012/08/12/how-to-explain-raster-vs-vector-to-your-clients/)
* [YouTube video about adding video to your page](https://www.youtube.com/watch?v=4I1WgJz_lmA)

### Tables

Tables used to be pretty much the only game in town -- when you had data of any sort, you pretty much had to use one to display it.  You also had to use tables to wrangle the layout of your page into some semblance of order.  Thankfully, those days are behind us (thanks to CSS) and now tables can often be more of a hindrance than a benefit for any but the core use cases.  That said, they are still the go-to way to get structured data onto the page.

#### Points to Ponder

* When should you use tables?
* What is the structure of a table?
* What are the special tags that dictate certain parts of a table, e.g. headers or captions?
* How can you combine cells in a table?
* Why do you need to be careful about your padding and borders in tables?
* How do you align text within cells in a table?

#### Links

* [Shay Howe on Tables](http://learn.shayhowe.com/html-css/organizing-data-tables)
* [HTML Docs on Tables](http://www.w3schools.com/html/html_tables.asp)
* [An older tutorial on Tables from HTML Goodies](http://www.htmlgoodies.com/tutorials/tables/article.php/3479851)

### Forms

Forms are one of the most important parts of your site.  They are your user's gateway into your back end -- the user provides data using a form and you do stuff with it.  Hopefully you've been through the [Rails Course](/ruby-on-rails) and this is all review, but if not make sure to pay attention!  

Forms are important to get right not just because you want the correct data getting sent to your back end but also because you want the experience of interacting with the form to be as dead-stupid-simple as humanly possible so you don't lose users while they are doing it.  You need to specify the proper types of inputs for each possible data item, since there are often multiple ways to collect a piece of data but only one way which is easiest for your user and eliminates the chances of that user inputting erroneous data.

#### Points to Ponder

* Why are forms probably the most important part of your site?
* How do you construct a basic form?
* How do you specify which path the form gets submitted to?
* When would you want to submit using `GET` vs `POST` requests?
* What are all the possible form element types?
* When should you use check boxes instead of radio buttons?
* When should you use a combobox/dropdown instead of a text field?
* How do you make a very large text field?
* How do you link elements with their labels?
* How do you link element selections together (e.g. check boxes) so they are nicely formatted when your server receives them?
* What should your "submit" button probably say instead of "submit"?

#### Links

* [Shay Howe on Forms](http://learn.shayhowe.com/html-css/building-forms)
* [Form Basics from MDN](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/My_first_HTML_form)
* [HTML Form Walkthrough](http://docs.webplatform.org/wiki/guides/html_forms_basics)
* [HTML Forms Docs](http://www.w3schools.com/html/html_forms.asp)

### New Stuff in HTML5

HTML5 brought in a lot of nice new features, many geared specifically towards giving webpages the ability to display media and interactive features more easily.  The downside is that there are still browser compatibility issues with some functionality, but that will get sorted over time.  Another set of new features is the use of more semantic tags in your markup so you don't need to put a `div` around everything (you can use the `aside` or `footer` etc).

#### Points to Ponder

* What are semantic tags and how are there more of them in HTML5?
* What does the canvas element do for you?
* Seriously, why is canvas potentially amazing?
* What are the new video control features?
* What are the new audio control features?
* What is local storage and how is it used?
* What are data attributes and how are they used?
* For people who have already done Rails and maybe some JS, how can data attributes be used to pass off data from your back end to your front end?
* What are the compatibility trade-offs of the new features?
* Are there any performance trade-offs with the new features?
* How does HTML5 fix the problem of needing Flash installed to play movies on many devices?

#### Links

* [Dive into HTML5](http://diveintohtml5.info) is a website and book on the cool stuff about HTML5.
* [What's new in HTML5 from W3 schools](http://www.w3schools.com/html/html5_new_elements.asp)
* [What's new in HTML5 from About](http://webdesign.about.com/od/html5/a/html_5_whats_new.htm)
* [25 must-know HTML5 tips and techniques from tutsplus](http://net.tutsplus.com/tutorials/html-css-techniques/25-html5-features-tips-and-techniques-you-must-know/)
* [How HTML5 and CSS3 Will Change Web Design from Virtuosimedia.com](http://www.virtuosimedia.com/dev/html/how-html5-and-css3-will-change-web-design) is a nice 2011 article looking forward to the coming changes.
* [Testing compliance of various tags in HTML5 with CanIUse?](http://caniuse.com)

## CSS3 

### Basics

This again should represent a review from what you've already covered in the [Web Development 101 Lesson on HTML/CSS](/web-development-101/html-and-css-basics), but you could probably benefit from the review of the basic stuff.

#### Points to Ponder

* What are selectors?
* In general, how specific should you be when targeting elements using selectors?
* What's the difference between using `%`, `em` and `rem` to specify sizes?
* How do you select an element inside another element?
* How can you shorten up a long batch of CSS that's doing the same thing to many different elements by putting them all in one line?
* How do you target the immediate child of an element?
* How do you target a class inside a class?
* How do you target a class inside an ID?
* How would you target "all the links inside `li` elements that have the class `bunny` which are inside the unordered list with the id `things-that-hop`"?
* What are the three ways to include CSS in your project?
* How do you import an external stylesheet?
* What is the browser's default stylesheet?
* What is a "CSS Reset" file and why is it helpful?
* Which stylesheet has preference if you import multiple ones and there are overlapping styles?
* What is the order of priority of selectors (e.g. if you specify that the `<body>` has color `black` but `<h1>` tags have the color `blue` but class `main-title` has the color `red`, which will be used by `<body style="color:yellow"><h1 class="main-title" style="color:green">Howdy!</h1><body>`?)

#### Links

* [Shay Howe on the Basics of HTML/CSS](http://learn.shayhowe.com/html-css/terminology-syntax-intro)
* [Smashing Magazine on Taming Advanced CSS Selectors](http://coding.smashingmagazine.com/2009/08/17/taming-advanced-css-selectors/)

### Box Model review

To do CSS correctly, you need to have a model in your head for how everything fits together on the page.  Otherwise, you're just randomly guessing and checking what works to move things around.  The Box Model is that model.  It defines how every element on the page gets placed and how they relate to each other.  You can't be shaky on how it works if you want to be efficient with your work flow.

#### Points to Ponder

* What's the difference between margin and padding?
* How do borders affect the size of the box?
* How can margins be used to center an element horizontally on the page?
* What does it mean that "margins are collapsed"?
* What is the difference between `block`, `inline-block` and `inline` elements when thinking about the box model?
* When are you required to specify the width of an element vs letting the browser figure it out for you?
* How do box shadows affect element box sizing?
* How can you check an element's box model in your developer tools (it's a helpful graphic)?

#### Links

* [CSS Box Model from Shaye Howe (gets into floats and positioning a bit too)](http://learn.shayhowe.com/html-css/box-model)
* [The CSS Box Model from CSS-Tricks](http://css-tricks.com/the-css-box-model/)
* [CSS Box Model Docs](http://www.w3schools.com/css/css_boxmodel.asp)

### Floats and Positioning

A major question all CSS-ers have again and again is "how can I get this stupid element where exactly on the page I want it to go!?!?!".  Usually, the answer lies in using floats and/or position attributes in combination with margins.  You'll need to develop a mental model for what's happening on the page when you float elements and when you use the different positioning types.  
Pay particular attention to which element acts as the parent of the element you're messing with -- there are some rules about that which get a bit confusing and can cause hair-pulling frustration.  If you absolutely position an element inside an absolutely positioned element, where does the first element go?

#### Points to Ponder

* What is the DOM?
* How do elements get placed in the DOM by default?
* How can you override element positioning using the `position` attribute?
* When are you able to use the `top` `left` `right` and `bottom` attributes?
* What is the difference between `float` and `position`?
* Which element acts as the parent for a floated element?
* What is the difference between floating right and floating left?
* If you have a bunch of elements floated next to each other and you make the browser narrower, what happens?
* What's the practical difference between relative and absolute positioning?
* Which element acts as the parent for an absolutely or relatively positioned element?
* How would you set up a grid of 20x20 boxes on the page using floats?  Using lists?
* What are negative margins useful for?

#### Links

* [CSS Floats 101 from A List Apart](http://alistapart.com/article/css-floats-101)
* [CSS Positioning 101 from A List Apart](http://alistapart.com/article/css-positioning-101)
* [Positioning Tutorial / Widget from BarelyFitz Designs](http://www.barelyfitz.com/screencast/html-training/css/positioning/)
* [Absolute Horizontal and Vertical Positioning in CSS from Smashing Magazine](http://coding.smashingmagazine.com/2013/08/09/absolute-horizontal-vertical-centering-css/)
* [CSS Float docs](http://www.w3schools.com/css/css_float.asp)
* [CSS Position docs](http://www.w3schools.com/css/css_positioning.asp)

### Best practices for page layouts

This is a catch-all section designed to make sure you understand not just what elements and selectors and attributes you **CAN** use, but which ones you **SHOULD** use in each situation.  When you go visit "normal" webpages (preferably one that isn't too massively corporate, since they do some abnormal stuff), there are a lot of similarities in the way they are structured (which you can see in your developer tools).  They all tend to judiciously use container divs for grouping elements and they use classes and IDs as necessary to determine styles.

You'll also get the chance to review what was covered in previous sections by checking out [LearnLayout](http://www.learnlayout.com) and doing their exercises.

#### Points to Ponder

* What is a "container `<div>`"?
* When should you use `<span>` vs `<div>`?
* When should you use `id` vs `class`?
* What are good situations for breaking out styles into multiple classes?
* How can you use margins for alignment?

#### Links

* [Learning CSS Layouts](http://learnlayout.com/)


### Backgrounds and Gradients

Backgrounds are usually ignored until they become a problem and then you're left trying to figure out why your elements are coming out looking so odd.  This brief section should get you thinking properly about backgrounds and the kinds of things you can do with them by just using regular old CSS.

#### Points to Ponder

* How do you set the background color?
* Which color is used when elements are stacked on top of each other (on the z-axis)?
* How do you set a partially transparent color? (rgba anyone?)
* Where are gradients most commonly used in "real world" websites?
* How do you set a gradient background?
* How do you make an image the background of an element?
* Why is it useful to make the image the background of an element instead of using a regular `<img>` tag?
* How do you make a background image of a fixed size?
* How do you make a background image repeat?
* How do you get your page's background image to fill the page even when you resize the browser?

#### Links

* [Shay Howe on Backgrounds & Gradients](http://learn.shayhowe.com/html-css/backgrounds-gradients)
* [HTML Goodies' brief guide to backgrounds and gradients](http://www.htmlgoodies.com/tutorials/getting_started/article.php/3866901)

#### Additional Resources

* [Background Patterns and Designs from Awwwards](http://www.awwwards.com/background-patterns-designs-and-resources-for-websites.html)

### A Lightening Intro to Design and UX Principles

You can't code the front end and ignore design and user experience (UX).  Not everyone is cut out to be an artist and you don't have to be.  But you do have to actually use your design brain a little bit if you want a site your users actually care about visiting.  That doesn't mean just having beautiful graphics, which is a common misconception about design.

User Experience is really about focusing on three things -- can the user get done what he/she is trying to do **effectively**, **efficiently**, and with **satisfaction**.  Half the battle is just having the mindset of trying to optimize those three things by talking to your users.  The other half is about actually building and measuring those things.

Web design is more than just building "pretty" things; it's about crafting useful and effective experiences for your users.  It starts with making your site fast and reliable.  Then you need to properly set up the structure and information architecture of the page so users have a logical schema for navigation.  Then you will build your user interfaces for optimal user experience.  Only then, finally, can you worry about aesthetics.

Given the focus web design has on crafting an effective user experience, which is the only way to have a successful website, it's probably worth spending a little time to absorb the high level stuff, huh?  You don't want to go too crazy, though -- this is definitely a rabbit hole where you can spend way too much time trying to learn everything there is to know about UX or Design.  

Remember that your goal here is to absorb the most important concepts and continue on your way.  You can always come back when you've got enough experience to start asking the right questions.

#### Points to Ponder

* What is design?
* What is user experience?
* What's the difference between UX and UI?
* What are the three things UX is meant to focus on?
* What is visual hierarchy and why is it so important for websites?
* What are the primary ways to achieve visual hierarchy?
* What is the design hierarchy pyramid?
* What are the CRAP factors of effective layout and what are they used for?

#### Links

* [Startups, This is How Design Works](http://startupsthisishowdesignworks.com/)
* [UX 101 -- What is User Experience from Dashburst.com](http://dashburst.com/infographic/ux-101-what-is-user-experience/)
* [A more detailed look at what UX really is from Smashing Magazine](http://uxdesign.smashingmagazine.com/2010/10/05/what-is-user-experience-design-overview-tools-and-resources/).  Don't worry about absorbing all the tools and techniques... focus on the high level stuff at the top.
* [A very simple overview of Visual Hierarchy from 52weeksofUX](http://52weeksofux.com/post/443828775/visual-hierarchy)
* [Introduction to Visual Hierarchy from Formed Function](http://blog.formedfunction.com/post/3029763425/on-visual-hierarchy)
* [Understanding Visual Hierarchy in Web Design from TutsPlus](http://webdesign.tutsplus.com/articles/design-theory/understanding-visual-hierarchy-in-web-design/)
* [The Hierarchy of Design Elements from Jesse James Garrett](http://www.jjg.net/elements/pdf/elements_ch02.pdf)
* [C.R.A.P Design Principles](http://www.presentationzen.com/chapter6_spread.pdf)

#### Additional Resources

*...For if you just can't get enough UX/Design.  Don't get too sidetracked... eye on the prize! Eye on the prize!*

* [Hack Design's full 52-week free design course](http://hackdesign.org)
* [52 Weeks of UX's free 52 weeks of UX articles](http://52weeksofux.com/)
* [Videos from an Adobe Dev Evangelist](http://designupdate.com/) that describe various aspects of design.
* [Part 1 of TutsPlus.com's 15-part Web Design series](http://webdesign.tutsplus.com/articles/design-theory/understanding-visual-hierarchy-in-web-design/) (with links to the others)
* [Using Photoshop to Design Interfaces](http://nathanbarry.com/how-to-use-photoshop-to-design-interfaces/)
* [A more abstract article on "Learning to See" from ia.net](http://ia.net/blog/learning-to-see/)
* [Usability 101 for Startups from Ripul Kumar](https://medium.com/design-ux/dc849621262f)

### Fonts and Typography

Something like 95% of the web is text and yet most web developers don't pay any heed whatsoever to typography -- it's this mysterious esoteric subject reserved for designer geeks and their lattes.  You are not most web developers.

Typography is important stuff!  It can have a major effect on how your page *feels* when the user is reading through it and can also influence how easy the page is to digest, both major factors in your user deciding to continue or turn back.  You got introduced to it in the section on Design and UX, and here you'll see it implemented.

Do what you can to get at least a familiarity with the high level decisions involved with choosing a typeface and font sizes.  You don't need to dive into kerning and what ligatures are, but you should understand when it's appropriate to use serif vs sans-serif fonts and how font weights and line heights impact readability (recall how to build a good visual hierarchy).

#### Points to Ponder

* Why do fonts matter?
* What's the difference between a serif and sans-serif font?
* What are `font-family` attributes used for?  
* How is the active font determined in a `font-family`?
* Where does the browser actually get its fonts from?
* Where can you get additional fonts from and how do you get them onto your page?
* What are the disadvantages of using web fonts? Of loading your own?
* What are the important properties of fonts that you can specify using CSS?

#### Links

* [Shay Howe on Fonts and Typography](http://learn.shayhowe.com/html-css/typography)
* [Importing your own fonts](http://www.html5rocks.com/en/tutorials/webfonts/quick/)
* [A Beginner's Guide to Using Google Web Fonts by DesignShack](http://designshack.net/articles/css/a-beginners-guide-to-using-google-web-fonts/)
* [Google Web Fonts](http://www.google.com/fonts)

### CSS Grids

Grids are another extension of the design world.  There's just something much more pleasing about navigating through a site that properly uses a grid to lay out the content than one which has ignored all the C.R.A.P principles and put things in place willy-nilly.

In this section, you'll get a look at how to use CSS to lay out the elements of your page using a grid.  

#### Points to Ponder

* Why are grids effective for helping site layout?
* What are the major different types of grids in use today?
* How could you design your own grid (on paper)?
* How can you implement your own grid in CSS?

#### Links

* [Basic Grids from CSS-Tricks](http://css-tricks.com/dont-overthink-it-grids/)
* [Fluid Grids from A List Apart](http://alistapart.com/article/fluidgrids)
* [Supplemental reading on the history of grids and why they're awesome](http://www.subtraction.com/pics/0703/grids_are_good.pdf)
* [CSS Grids Lessons](https://hackdesign.org/lessons/32)
* [Getting images to display fluidly in fluid grids, from A List Apart](http://alistapart.com/article/fluid-images)
* [The 960 grid system](http://960.gs/) is a basic grid system which can be really useful for building layouts.  They have downloadable templates too so you can print them out and use them for designing your site.  Other than that, just look through the site; we'll be covering the Bootstrap and Foundation grid systems later.

### Responsive Design

Responsive design is creating websites that respond to the user's context, whether that is the device they are viewing on, the size of their browser, or their accessibility needs.  Lucky for you, there are lots of good tools that help you easily start making websites responsive.  It's not rocket science to do a pretty good job at a responsive site, though it's a lot more work to get one that really nails it.

#### Points to Ponder

* What is responsive design?
* Why is responsive design important to your users?
* How do you make a "fluid" layout?
* What are Media Queries?
* How do you use media queries to make your website responsive?

#### Links

* [Smashing Magazine's comprehensive introduction to responsive design](http://alistapart.com/article/responsive-web-design)
* [Responsive Web Tutorial from Lingulo](http://www.lingulo.com/tutorials/css/how-to-build-a-html5-website-from-scratch)
* [Responsive Grids Tutorial from TutsPlus](http://webdesign.tutsplus.com/tutorials/htmlcss-tutorials/a-basic-responsive-grid-plus-handy-css3-media-query-reporter/)
* [Responsive Navigation Patterns from Brad Frost](http://bradfrostweb.com/blog/web/responsive-nav-patterns/)
* [Techniques for Gracefully Degrading Media Queries](http://coding.smashingmagazine.com/2011/08/10/techniques-for-gracefully-degrading-media-queries/)

### CSS Frameworks

You've spent plenty of time building up a great base of knowledge of HTML and CSS and even design.  But it's still a pain in the butt to lay out everything manually and keep repeating yourself all the time when writing your code.  If only there was a way to save yourself all kinds of effort...

Frameworks to the rescue!  Frameworks like [Twitter Bootstrap](http://getbootstrap.com) and [Zurb Foundation](http://foundation.zurb.com) have done all the heavy lifting of packaging up commonly used CSS code and even icons and interactions (like menu dropdowns) for you.  All you have to do is understand how they expect you to lay out your site and which classes they use to designate particular batches of styles.  

Frameworks let you focus more on building great sites and less on how they are actually coded up on the front end.  They are great for learning and great for rapidly producing sites.  Once you've taken a tour through Bootstrap, you'll start looking at every site you see (especially startup ones) and notice an awful lot of similarities... one of the downsides of the frameworks.

#### Points to Ponder

* What are CSS frameworks?
* How do frameworks actually work?
* How do you interact with the framework to get the look you want?
* What is Twitter Bootstrap?
* What is Zurb Foundation?
* What other frameworks can you find out there?
* What are the disadvantages of using frameworks?

#### Links

* [From A List Apart, Building Twitter Bootstrap](http://alistapart.com/article/building-twitter-bootstrap)
* [If you're used to using Bootstrap 2, here's what changed in version 3](http://stackoverflow.com/questions/17952571/how-has-twitter-bootstrap-3-changed-over-version-2-3-2)
* [Getting Started with Foundation](http://foundation.zurb.com/docs/)
* [Choosing Bootstrap or Foundation](https://medium.com/frontend-and-beyond/8b3812c7007c)
* [Bootstrap Docs](http://getbootstrap.com/)
* [Foundation Docs](http://foundation.zurb.com/)

### Neat tweaks, animations and cross-browser compatibility

CSS3 offers a whole lot of interesting functionality that you didn't know about but will really help you make your sites into something special.  Just be conscious of browser compatibility issues -- some of these aren't available on older browsers.

#### Points to Ponder

* How do you round corners of a box?
* How do you add a shadow to a box?
* How do you rotate an element a specified amount?
* What interesting animations can you use in CSS3?
* What are pseudo-elements and what are they useful for?

#### Links

* [CSS Transitions from A List Apart](http://alistapart.com/article/understanding-css3-transitions)
* [CSS3 Animation Cheat Sheet](http://www.justinaguilar.com/animations/)
* [CSS Animated Loading Icons](http://tobiasahlin.com/spinkit/)
* [Learning To Use The `:before` and `:after` Pseudo-Elements in CSS from Smashing Magazine](http://coding.smashingmagazine.com/2011/07/13/learning-to-use-the-before-and-after-pseudo-elements-in-css/)

### Preprocessors/Precompilers

Preprocessors/precompilers can make your life much easier by eliminating code repetition and providing all sorts of yummy time-saving and code-saving features.  If you've been using Rails, you'll be familiar with SASS already since it's baked in.  If you're not using Rails, you may need to add some additional steps to your work flow to get your preprocessor set up but it's worth it.

#### Points to Ponder

* What is a preprocessor?
* Why do preprocessors rock?
* What does it mean that a preprocessor "compiles to CSS"?
* What is SASS/SCSS?
* How can you use SASS to nest CSS?
* How can you use SASS to work with variables in your code?
* Why is it awesome to use mix-ins with SASS?
* If you're not using Rails, how do you set up SASS?
* What is LESS and how is it different from SASS?
* What other preprocessors are out there?

#### Links

* [Introduction to CSS Preprocessors from Steven Bradley](http://www.vanseodesign.com/css/css-preprocessors/)
* [10 Reasons You Should be Using a Preprocessor](http://www.urbaninsight.com/2012/04/12/ten-reasons-you-should-be-using-css-preprocessor)
* [Choosing the Right CSS Preprocessor from Treehouse](http://blog.teamtreehouse.com/how-to-choose-the-right-css-preprocessor)
* [SASS's getting started guide provides a brief look at its awesome features](http://sass-lang.com/guide)
* [A List Apart walks through specifically how you should be using SASS (lots of best practices in there)](http://alistapart.com/article/getting-started-with-sass)
* [SASS's main website](http://sass-lang.com/)
* [LESS's main website](http://www.lesscss.org/)

### Automatic Build tools

Sometimes you end up with a chain of different files and assets like images and stylesheets and javascript files and it's a real pain to get them all mashed together the way you need to in order to ship the site, especially if you're adding in preprocessors and uglifiers.  Luckily people have created build tools like [Grunt](http://gruntjs.com/) whose sole purpose is to make this work flow easier for you.  

Most of these tools use Javascript and are built to help people programming with Javascript, so you don't really need to know them right off the bat.  I'll probably move this into the Javascript section at some point.  Just browse through the articles and try to get an understanding of what's going on.

One good reason to use Rails when you're learning?  It gives you all this for free with the [Asset Pipeline](/ruby-on-rails/the-asset-pipeline).

#### Points to Ponder

* Why are automatic build tools useful?
* Why would you want to concatenate your CSS and Javascript files?
* Why would you want to minify/uglify your files?
* What is a work flow like which includes build tools?
* What are the common build tools?

#### Links

* [Grunt for People Who Think Things Like Grunt are Weird and Hard by Chris Coyier](http://24ways.org/2013/grunt-is-not-weird-and-hard/)
* [Workflow Orchestration for the Wary from A List Apart](http://alistapart.com/column/workflow-orchestration-for-the-wary)
* [Get up and Running with Grunt from Smashing Magazine](http://coding.smashingmagazine.com/2013/10/29/get-up-running-grunt/)
* [SO answer on using the Grunt automatic build tool](http://stackoverflow.com/questions/13713273/how-to-concatenate-and-minify-multiple-css-and-javascript-files-with-grunt-js)
* [Grunt docs](http://gruntjs.com/)
* [Yeoman docs](http://yeoman.io/).  Yeoman is a workflow tool that uses Grunt, a scaffolding tool called "yo" and "Bower", which manages dependencies among scripts in your app.

## Conclusion

HTML and CSS are actually surprisingly large topics, who would have thought?  If you've made it this far, though, you're more than well on your way to front end development magic.  You can start with a wireframe and blaze through how to actually build it.  You might even be comfortable enough to skip the wireframe and just mock things up in HTML.  

The real point of this course isn't to make you into a full-on front-end wizard, it's to give you the tools necessary to tackle any visual layout problems and to make you aware of the extend of your toolbox going forward.  You may not use everything in your first few weeks, but you'll end up putting it to work eventually.  Refer back to this stuff when you've moved on to better and brighter things.

Speaking of better and brighter things, you are probably chomping at the bit for the final piece of the puzzle which will empower you to make everything dynamic... Javascript.  Luckily, that's the next course!  Onwaaaaaaard!!!



## Supplemental Stuff: Possible Projects

* Build Facebook's profile page
* Build your own basic grid framework
* Rebuild Bootstrap or Foundation 

## Additional Resources

* [HTML5 Rocks knowledge base](http://www.html5rocks.com/en/)... tons of links to articles specific to your goals.
* [Codecademy's HTML/CSS track](http://www.codecademy.com/tracks/web)
* [Shay Howe's Beginner's Guide to HTML and CSS](http://learn.shayhowe.com/html-css/)
* [HTML5 Tutorial](http://www.html-5-tutorial.com/start-html5-tutorial.htm)
* [Responsive Prototyping with Foundation](http://alistapart.com/article/dive-into-responsive-prototyping-with-foundation)
* [Equal Height Columns in CSS from Smashing Magazine](http://coding.smashingmagazine.com/2010/11/08/equal-height-columns-using-borders-and-negative-margins-with-css/)
* [HTML tutorials and help docs](http://www.webplatform.org/)
* [Awwwards is a great place to go for design inspiration](http://www.awwwards.com/)
* PS.. "tags" don't really exist, they're always technically called "elements"
