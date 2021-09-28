### Introduction
While floats are used predominantly for wrapping text around images, it's worth understanding what they were previously used for, and why we should steer away from using them for those purposes.

### Learning Outcomes
* You'll learn how to properly use floats. 
* You'll learn why to avoid using floats the way they were used in the past, and their history.

### Present Day Use of Floats
In the past `float` was commonly used to create entire webpage layouts. While we will discuss this later on in the lesson, it is important to know that in the present day `float` should **only** be used to wrap text around images. When working with layout, stick with Flexbox or Grid.

The `float` property works by taking an element out of the normal document flow, putting that element to the side, and letting other content flow around it. So if our element is an image and we give it the property `float: left;`, it will now be taken out of the normal document flow and placed in the left-hand side of its container. The remaining content, such as a paragraph following the image, will now wrap around the right side of the image. 

Now, let's say we want a second paragraph in the same container to *not* wrap around the image, but to be displayed beneath **both** the first paragraph and the floated image. We can then use `clear: left;` to allow this second paragraph to clear the image that has been floated left. `clear` can be assigned `left`, `right`, or `both` to clear items which have been floated to the left, right, or in both directions.

### Problems with float
While `float` was first used to wrap text around an image, as developers realised that you can float *anything* the property quickly became a commonplace tool for creating creating webpage layouts. This led to problems such as the one we're about to discuss'.

Say you want to take your image, and your first paragraph, and put them into a box that will contain those two elements. If we attempt to `float: left;` the image so that the first paragraph is on its right, and then `clear` the second paragraph past the box container - it won't work! This happens because the float was taken out of the normal flow of the document, and even though the second paragraph comes after the first paragraph, it will no longer clear. The most modern solution to this problem is to use `display: flow-root`, which creates a miniture layout within the page, inside of which everything is contained.

Problems such as this one used to require various hacks to work around, and are part of the reason why using floats to create layouts is now considered a [legacy layout method](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Legacy_Layout_Methods), and using CSS Grid or Flexbox is preferred.

### Shapes
Wrapping text around images with float is relatively straightforward, but you can also have fun with other shapes by using `shapes-outside`. This property allows text to wrap around various shapes, which you can read about in [this article by css-tricks](https://css-tricks.com/almanac/properties/s/shape-outside/). 

While this may seem like it's not that different, things get really crazy when we have a look at [Chrome's CSS Shapes Editor Extention](https://chrome.google.com/webstore/detail/css-shapes-editor/nenndldnbcncjmeacmnondmkkfedmgmp?hl=en-US). Whoa! While by no means necessary, this is a fascinating interactive tool that lets you create and adjust the shapes with an interactive editor.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. For some really quick practice using `float`, MDN created [three quick exercises](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats_skills) you can use to acquire familiarity with its proper use.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something
* [For a more in-depth look at float](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats) MDN has some great documentation on `float`.

### Knowledge Check
* What is the main use for floats in the present day?
* Why should floats not be used for modifying the layout of a page?
* What other shapes can be created for text to wrap around?