### Introduction

JavaScript is a very powerful language. It is capable of creating complex web applications that work *everywhere*. But it is just as often used on a smaller scale. JavaScript is the glue that holds even less flashy websites together- it makes drop-downs drop down and image sliders slide.

Fortunately, at this point, you already have all the tools you need to make these items without resorting to using a bloated framework like Bootstrap. (Nothing against Bootstrap... you just do *not* need it! Good for you!)

We aren't presenting any new content in this lesson - just giving you the chance to practice some of the techniques that you're going to be using on a daily basis as a JavaScript programmer.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- General techniques that are used by JavaScript programmers everyday.

### Drop-down menus

A dropdown is something you've most likely encountered on various other websites you've visited or apps you've used. Imagine any time you've clicked a button (usually one that contained an icon of 3 horizontal or vertical dots or lines) and a list of items suddenly appeared (you could even say these items... dropped down from the button).

Dropdowns are typically comprised of two main parts:

1. A button that toggles the dropdown content's visibility.
1. The dropdown contents itself.

The dropdown toggle button should typically only trigger the visibility of the dropdown content on click, while the dropdown contents should typically only contain items that will trigger an action upon clicking them. Actions can include things like "Edit", "Copy", or "Delete", or linking you to another part of the site, such as in a navbar.

### Image carousel

Image carousels are very common across various types of websites, including online stores, news sites, and many more. They're great for advertising, showcasing things, showing several things using limited screen size, and can actually be made using things you've already learned! They are also highly customizable - you can make them auto-scroll, allow users to manually cycle between slides, skip to certain slides, etc.

Typically, they consist of a div that acts as the "picture frame", where behind that div, there is another much wider div containing the carousel's images. This strip of images can then move behind the picture frame, showing a different image depending on what part of the strip is visible. Any additional controls or features can then be placed on top of the entire thing.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Build a dropdown menu

1. You can allow the menu to show up either on click or on hover.
1. You should hard-code the menu items into your HTML but hide/reveal them using JavaScript. You can do this either by adding a class (`visible` or something) or by manually setting the style in JS.
1. Make sure the JavaScript code is reusable! You should be able to create multiple drop-downs on a page using HTML and reuse the JavaScript logic to hide/reveal them.
1. If you bundle your code into a module you can [publish your package to npm](https://docs.npmjs.com/getting-started/publishing-npm-packages), and then install and use it anytime you like! Nothing like publishing your own modules to make you feel like a pro 😎.

#### Build an image carousel

Create an image carousel. It should contain arrows on each side to advance the image forward or backward. It should automatically move forward every 5 seconds. It should contain the little navigation circles at the bottom that indicate which slide you are on (and they should be clickable to advance to that particular slide).

Don't spend too much time worrying about getting your images to display at the correct size -- it's more important to get the carousel rotating.

1. This one is a little more involved than the last two, so think about how you would set up the different elements within the site.
1. Set up a very wide `div` which will contain the individual "slides" of each image. By appropriately positioning that `div` inside a container `div` (which acts like a picture frame), you can choose which slide is visible at any given time.
1. Once you have the slider positioned properly, build functions for "next" and "previous" which will advance to the next or previous slide accordingly. The transition *doesn't* need to be smooth or animated. Only make it switch to the correct slide.
1. Set up arrow buttons which activate those functions and play with cycling through the images.
1. Add in some navigation dots at the bottom of the slides. Make a horizontal series of empty circles with CSS immediately below the slideshow. Each circle represents a slide, so whenever a new slide is activated, its corresponding circle gets filled in so you can tell where in the show you are. Make each circle link to that particular slide, so you can click on the circle and it will jump to that slide.
1. Add a timeout which advances the slides every 5 seconds.
1. Play around with your slideshow!

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the two main parts that a dropdown menu consists of?](#drop-down-menus)
- [When might you want to use dropdown menus in a website?](#drop-down-menus)
- [What are the benefits of using image carousels?](#image-carousel)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
