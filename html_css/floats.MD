### Introduction
While today floats are mainly used for wrapping text around images, it's worthwhile to understand what they were previously used for and why we should steer away from using them for other purposes.

### Learning Outcomes
* You'll learn how to properly use floats. 
* You'll learn why to avoid using floats the way they were used in the past, and their history.

### Present Day Use of Floats
In the past `float` was commonly used to create entire webpage layouts. While we will discuss this later on in the lesson, it is important to know that in the present day `float` should **only** be used to wrap text around images. When working with layout, stick with Flexbox or Grid.

The way that `float` works is that it takes an element out of the normal layout flow of the document, puts that element to the side, and lets the other content flow around it. So if an our element is an image, and we give it the property `float: left;`, it will now be taken out of the normal layout flow and placed in the left-hand side of its container. The remaining content, such as a paragraph following the image, will now wrap around the image to the right of the image. 

Let's say we want a second paragraph to *not* wrap around the image, but to be displayed completely beneath the image. We can then use `clear: left;` to allow this second paragraph to clear a floated image. `clear`, and floatleft, right, or both to clear items which are floated to the left, right, or both directions.

### Problems with float
While `float` was first used to wrap text around an image, as developers realised that you can float *anything*, the property quickly became a commonplace tool for creating creating webpage layouts. This led to problems such as the one we're about to discuss'.

Say you want to take your image, and your first paragraph, and put them into a box that will wrap those two elements. If we attempt to `float` the image so that the first paragraph wraps around it, and then `clear` the second paragraph past the wrapper - it won't work! This happens because the float was taken out of the normal flow of the document, and even though the second paragraph comes after the first paragraph, it will no longer clear. The most modern solution to this problem is to use `display: flow-root`, which creates a miniture layout within the page, inside of which everything is contained.

Problems such as this one used to require various hacks to work around, and are part of the reason why using floats to create layouts is now considered a [legacy layout method](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Legacy_Layout_Methods).

### Shapes
Discuss how shapes are used with'shape-outside'.
Discuss how shapes are used with the chrome shape-editor. 
This is relatively niche behavior, but it is something fun that's worth mentioning!

### Assignment
<div class="lesson-content__panel" markdown="1">
1. For some really quick practice using [float](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats_skills), MDN created three quick exercises you can use to acquire familiarity with its proper use.
2. 
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something
* [For some practice using floats](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats_skills) MDN has some great quick exercises.

### Knowledge Check
* What is the main use for floats in the present day?
* Why should floats not be used for modifying the layout of a page?