### Introduction
JavaScript is a very powerful language. It is capable of creating complex web applications that work _everywhere_. But it is just as often used on a smaller scale. JavaScript is the glue that holds even less flashy websites together- it makes drop-downs drop down and image sliders slide.  

Fortunately, at this point, you already have all the tools you need to make these items without resorting to using a bloated framework like bootstrap. (Nothing against bootstrap... you just do _not_ need it! Good for you!)

We aren't presenting any new content in this lesson - just giving you the chance to practice some of the techniques that you're going to be using on a daily basis as a JavaScript programmer.

> Animations are typically handled by CSS which is a little out of the scope of this lesson, but interactive stuff like this is no fun without a little motion! If you want to take a break and learn more about making stuff move [go watch this video](https://www.youtube.com/watch?v=8kK-cA99SA0).

### Drop-down Menus

You know what we're talking about here. Picture a nav-bar or a button and when you click it the menu slides down nicely. As mentioned previously, you already know everything you need to create this element. Here are some things to keep in mind:

1. You can allow the menu to show up either on click or on hover.
2. You should hard-code the menu items into your HTML but hide/reveal them using JavaScript. You can do this either by adding a class (`visible` or something) or by manually setting the style in JS.
3. Make sure the code is reusable! You should be able to create multiple drop-downs on a page without repeating the JavaScript code.
4. If you bundle your code into a module you can [publish it to npm](https://docs.npmjs.com/getting-started/publishing-npm-packages) and then install and use it anytime you like! Nothing like publishing your own modules to make you feel like a pro 😎.

### Mobile menus

Mobile versions of your sites are almost definitely going to need their own menu implementation. Depending on how you decided to implement your drop-down, you _could_ reuse it here, but there are tons of more inventive options out there.

1. [Browse the web](https://dribbble.com/search?q=mobile+menu) for [some](http://trydevkit.com/blog-post/steal-these-responsive-navigation-menu-ideas/bc8bec8d-ef4e-60bc-456c-525ed6f88db8) [inspiration](https://medium.com/@kollinz/hamburger-menu-alternatives-for-mobile-navigation-a3a3beb555b8), pick something and try to implement it!

### Image slider

Again, there's not much instruction needed here - just practice.  

Create a simple image carousel. It should contain arrows on each side to advance the image forward or backward. It should automatically move forward every 5 seconds. It should contain the little navigation circles at the bottom that indicate which slide you are on (and they should be click-able to advance to that particular slide).

Don't spend too much time worrying about getting your images to display at the correct size -- it's more important to get the slider sliding.

1. This one is a little more involved than the last two, so think about how you would set up the different elements within the site.  
2. Set up a very wide div which will contain the individual "slides" of each image. By appropriately positioning that div inside a container div (which acts like a picture frame), you can choose which slide is visible at any given time.
3. Once you have the slider positioned properly, build functions for "next" and "previous" which will advance to the next or previous slide accordingly. Make the transitions smooth using simple effects.
4. Set up arrow buttons which activate those functions and play with cycling through the images.
5. Add in some navigation dots at the bottom of the slides. Make a horizontal series of empty circles with CSS immediately below the slideshow. Each circle represents a slide, so whenever a new slide is activated, its corresponding circle gets filled in so you can tell where in the show you are. Make each circle link to that particular slide, so you can click on the circle and it will jump to that slide.
6. Add a timeout which advances the slides every 5 seconds.
7. Play around with your slideshow!
