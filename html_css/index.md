# HTML and CSS Resources

Though this course is currently under construction, there are tons of great resources out there for learning HTML and CSS and we've started laying them out for you below.  The first place to start is definitely in the [Web Development 101 lesson on HTML and CSS](/courses/web-development-101/lessons/html-and-css-basics), which covers a lot of ground to get you up to speed on the basics.  In fact, most of what you need to know to build effective websites is covered there.  

This course will be designed to follow that introductory material with more depth so you can start to flex your design muscles to produce more appealing and easy-to-use websites.  Luckily for you, there are an enormous amount of resources available on the web to learn front end development, so if you ever get stuck, Google is your friend.

## The Path Forward

Here are a list of things you'll want to understand to get a good handle on HTML5 and CSS3 and the best places we've found to read up on them.

## HTML5

### Basics

Most of this should be review since you've already completed [the Web Development 101 HTML/CSS Lesson (Right??)](/courses/web-development-101/lessons/html-and-css-basics) but it's a good idea to make sure you've got it covered so you make sure you're starting from a strong base.  It's impossible to separate HTML from CSS, so there will be some overlap before we get heavily into the CSS in later sections.

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

Forms are one of the most important parts of your site.  They are your user's gateway into your back end -- the user provides data using a form and you do stuff with it.  Hopefully you've been through the [Rails Course](/courses/ruby-on-rails/lessons) and this is all review, but if not make sure to pay attention!  

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

* [What's new in HTML5 from W3 schools](http://www.w3schools.com/html/html5_new_elements.asp)
* [What's new in HTML5 from About](http://webdesign.about.com/od/html5/a/html_5_whats_new.htm)
* [25 must-know HTML5 tips and techniques from tutsplus](http://net.tutsplus.com/tutorials/html-css-techniques/25-html5-features-tips-and-techniques-you-must-know/)
* [How HTML5 and CSS3 Will Change Web Design from Virtuosimedia.com](http://www.virtuosimedia.com/dev/html/how-html5-and-css3-will-change-web-design) is a nice 2011 article looking forward to the coming changes.

## CSS3 

### Basics

Selectors, specificity principles, % vs EMs vs REMs.

* [Shay Howe on the Basics of HTML/CSS](http://learn.shayhowe.com/html-css/terminology-syntax-intro)
* [Smashing Magazine on Taming Advanced CSS Selectors](http://coding.smashingmagazine.com/2009/08/17/taming-advanced-css-selectors/)

### Box Model review

Margins vs padding vs borders.  Requiring widths.

* [CSS Box Model from Shaye Howe (gets into floats and positioning a bit too)](http://learn.shayhowe.com/html-css/box-model)
* [The CSS Box Model from CSS-Tricks](http://css-tricks.com/the-css-box-model/)
* [CSS Box Model Docs](http://www.w3schools.com/css/css_boxmodel.asp)

### Floats and Positioning

Deconstructing the float.  Clearing floats.  Positioning normal vs relative vs absolute.  Practice positioning.

* [CSS Floats 101 from A List Apart](http://alistapart.com/article/css-floats-101)
* [CSS Positioning 101 from A List Apart](http://alistapart.com/article/css-positioning-101)
* [Positioning Tutorial / Widget from BarelyFitz Designs](http://www.barelyfitz.com/screencast/html-training/css/positioning/)
* [Absolute Horizontal and Vertical Positioning in CSS from Smashing Magazine](http://coding.smashingmagazine.com/2013/08/09/absolute-horizontal-vertical-centering-css/)
* [CSS Float docs](http://www.w3schools.com/css/css_float.asp)
* [CSS Position docs](http://www.w3schools.com/css/css_positioning.asp)

### Best practices for page layouts

Container divs, semantic tags, specificity (span vs div, class vs id), using margins for alignment, 

* [Learning CSS Layouts](http://learnlayout.com/)

### Fonts and Typography

Why fonts matter, major differences, font families, font properties, where to find fonts, loading web fonts (speed hits)

* [Shay Howe on Fonts and Typography](http://learn.shayhowe.com/html-css/typography)
* [Importing your own fonts](http://www.html5rocks.com/en/tutorials/webfonts/quick/)
* [A Beginner's Guide to Using Google Web Fonts by DesignShack](http://designshack.net/articles/css/a-beginners-guide-to-using-google-web-fonts/)
* [Google Web Fonts](http://www.google.com/fonts)

### Backgrounds and Gradients

Background colors, gradients (linear and radial) and images.

* [Shay Howe on Backgrounds & Gradients](http://learn.shayhowe.com/html-css/backgrounds-gradients)
* [HTML Goodies' brief guide to backgrounds and gradients](http://www.htmlgoodies.com/tutorials/getting_started/article.php/3866901)

### A Lightening Intro to Design Principles

Visual hierarchy, CRAP (Context, Repetition, Alignment, Proximity), The design rabbit hole.

* [A very simple overview of Visual Hierarchy from 52weeksofUX](http://52weeksofux.com/post/443828775/visual-hierarchy)
* [Introduction to Visual Hierarchy from Formed Function](http://blog.formedfunction.com/post/3029763425/on-visual-hierarchy)
* [Understanding Visual Hierarchy in Web Design from TutsPlus](http://webdesign.tutsplus.com/articles/design-theory/understanding-visual-hierarchy-in-web-design/)

Additional Stuff:

* [Hack Design's full 52-week free design course](http://hackdesign.org)
* [52 Weeks of UX's free 52 weeks of UX articles](http://52weeksofux.com/)
* [Videos from an Adobe Dev Evangelist](http://designupdate.com/) that describe various aspects of design.
* [Part 1 of TutsPlus.com's 15-part Web Design series](http://webdesign.tutsplus.com/articles/design-theory/understanding-visual-hierarchy-in-web-design/) (with links to the others)
* [Using Photoshop to Design Interfaces](http://nathanbarry.com/how-to-use-photoshop-to-design-interfaces/)

### CSS Grids

Why grids, types of grids, building a grid of your own

* [Basic Grids from CSS-Tricks](http://css-tricks.com/dont-overthink-it-grids/)
* [Fluid Grids from A List Apart](http://alistapart.com/article/fluidgrids)
* [Supplemental reading on the history of grids and why they're awesome](http://www.subtraction.com/pics/0703/grids_are_good.pdf)
* [CSS Grids Lessons](https://hackdesign.org/lessons/32)
* [Getting images to display fluidly in fluid grids, from A List Apart](http://alistapart.com/article/fluid-images)

### Responsive Design

What responsive really means, Media Queries 

* [Smashing Magazine's comprehensive introduction to responsive design](http://alistapart.com/article/responsive-web-design)
* [Responsive Web Tutorial from Lingulo](http://www.lingulo.com/tutorials/css/how-to-build-a-html5-website-from-scratch)
* [Responsive Grids Tutorial from TutsPlus](http://webdesign.tutsplus.com/tutorials/htmlcss-tutorials/a-basic-responsive-grid-plus-handy-css3-media-query-reporter/)
* [Responsive Navigation Patterns from Brad Frost](http://bradfrostweb.com/blog/web/responsive-nav-patterns/)
* [Techniques for Gracefully Degrading Media Queries](http://coding.smashingmagazine.com/2011/08/10/techniques-for-gracefully-degrading-media-queries/)

### CSS Frameworks

Why frameworks, how they work, Bootstrap, Foundation, others

* [From A List Apart, Building Twitter Bootstrap](http://alistapart.com/article/building-twitter-bootstrap)
* [If you're used to using Bootstrap 2, here's what changed in version 3](http://stackoverflow.com/questions/17952571/how-has-twitter-bootstrap-3-changed-over-version-2-3-2)
* [Getting Started with Foundation](http://foundation.zurb.com/docs/)
* [Choosing Bootstrap or Foundation](https://medium.com/frontend-and-beyond/8b3812c7007c)
* [Bootstrap Docs](http://getbootstrap.com/)
* [Foundation Docs](http://foundation.zurb.com/)

### Neat tweaks, animations and cross-browser compatibility

Rounding corners. Shadows. Animations. Compatibility across browsers. Pseudo-elements.

* [CSS Transitions from A List Apart](http://alistapart.com/article/understanding-css3-transitions)
* [CSS3 Animation Cheat Sheet](http://www.justinaguilar.com/animations/)
* [CSS Animated Loading Icons](http://tobiasahlin.com/spinkit/)
* [Learning To Use The `:before` and `:after` Pseudo-Elements in CSS from Smashing Magazine](http://coding.smashingmagazine.com/2011/07/13/learning-to-use-the-before-and-after-pseudo-elements-in-css/)

### Preprocessors

What is a preprocessor, why preprocessors rock, compiling to CSS, SASS/SCSS and LESS preprocessors

* [Introduction to CSS Preprocessors from Steven Bradley](http://www.vanseodesign.com/css/css-preprocessors/)
* [10 Reasons You Should be Using a Preprocessor](http://www.urbaninsight.com/2012/04/12/ten-reasons-you-should-be-using-css-preprocessor)
* [Choosing the Right CSS Preprocessor from Treehouse](http://blog.teamtreehouse.com/how-to-choose-the-right-css-preprocessor)
* [SASS's getting started guide provides a brief look at its awesome features](http://sass-lang.com/guide)
* [A List Apart walks through specifically how you should be using SASS (lots of best practices in there)](http://alistapart.com/article/getting-started-with-sass)
* [SASS's main website](http://sass-lang.com/)
* [LESS's main website](http://www.lesscss.org/)

### Build tools

Build tools to help improve your workflow.


## Projects

* Build Facebook's profile page
* Build your own basic grid framework
* Rebuild Bootstrap or Foundation 

## Additional Resources

* [HTML5 Rocks knowledge base](http://www.html5rocks.com/en/)... tons of links to articles specific to your goals.
* [Codecademy's HTML/CSS track](http://www.codecademy.com/tracks/web)
* [Shay Howe's Beginner's Guide to HTML and CSS](http://learn.shayhowe.com/html-css/)
* [Treehouse's HTML/CSS learning adventure (PAID)](http://teamtreehouse.com/learning-adventures/learn-html-and-css)
* [LearnStreet](http://learnstreet.com)
* [HTML5 Tutorial](http://www.html-5-tutorial.com/start-html5-tutorial.htm)
* [Responsive Prototyping with Foundation](http://alistapart.com/article/dive-into-responsive-prototyping-with-foundation)
* [Equal Height Columns in CSS from Smashing Magazine](http://coding.smashingmagazine.com/2010/11/08/equal-height-columns-using-borders-and-negative-margins-with-css/)
* [HTML tutorials and help docs](http://www.webplatform.org/)
