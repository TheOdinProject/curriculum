### Introduction
Floats are used predominantly for wrapping text around images, or various shapes as we will see later on in this lesson. It's also worth understanding what they were previously used for before the creation of CSS Grid and Flexbox. 

### Learning Outcomes
* You'll learn how to properly use floats. 
* Learn how floats work and how to use them
* Understand how floats were used in the past, and why to avoid these methods in the present

### The Basics
The `float` property works by taking an element out of the normal document flow, putting that element to the side, and letting other content flow around it. So if our element is a box and we give it the property `float: left;`, it will now be taken out of the normal document flow and placed in the left-hand side of its container. The remaining content, such as a paragraph following the box, will now wrap around the right side of the box. 

Let's say we want a second paragraph in the same container to *not* wrap around the box, but to be displayed beneath **both** the first paragraph and the floated box. We can then use `clear: left;` to allow this second paragraph to clear the box that has been floated left. `clear` can be assigned `left`, `right`, or `both` to clear items which have been floated to the left, right, or in both directions. Let's have a look at what this will look like below.

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="NWgoPdY" data-user="mgrigoriev8109" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/mgrigoriev8109/pen/NWgoPdY">
  </a> by mgrigoriev8109 (<a href="https://codepen.io/mgrigoriev8109">@mgrigoriev8109</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Now let's talk about a problem we might encounter using `float`, `clear`, and additional containers. Say you want to take your box and your first paragraph, and put them into a another box that will contain those two elements. If we attempt to `float: left;` the box so that the first paragraph is on its right, and then `clear` a second paragraph past the box container, you'll see below that the second box doesn't wrap around both the first box, and the second text doesn't clear properly! 

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="vYZbXKX" data-user="mgrigoriev8109" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/mgrigoriev8109/pen/vYZbXKX">
  </a> by mgrigoriev8109 (<a href="https://codepen.io/mgrigoriev8109">@mgrigoriev8109</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

This happens because the float was taken out of the normal flow of the document. The most modern solution to this problem is to use `display: flow-root`, which creates a miniature layout within the page, inside of which everything is contained. If we apply `display: flow-root` to the second box, we can see what happens below.

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="YzQBGQp" data-user="mgrigoriev8109" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/mgrigoriev8109/pen/YzQBGQp">
  float problem fix</a> by mgrigoriev8109 (<a href="https://codepen.io/mgrigoriev8109">@mgrigoriev8109</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Shapes
Wrapping text around boxes with float is relatively straightforward, but you can also have fun with other shapes by using `shapes-outside`. This property allows text to wrap around various shapes, which you can read about in [this article by css-tricks](https://css-tricks.com/almanac/properties/s/shape-outside/). 

While this may seem like it's not that different, things get really crazy when we have a look at [Chrome's CSS Shapes Editor Extension](https://chrome.google.com/webstore/detail/css-shapes-editor/nenndldnbcncjmeacmnondmkkfedmgmp?hl=en-US). Whoa! While by no means necessary, this is a fascinating interactive tool that lets you create and adjust the shapes with an interactive editor.

### History of Float
While `float` was first used to wrap text around an image, developers soon realized that you can float almost *anything*, and the property quickly became a commonplace tool for creating webpage layouts. However, this led to problems such as the one we previously discussed, which before the time of `display: flow-root` was fixed by various hacks. This is part of the reason why using floats to create layouts is now considered a [legacy layout method](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Legacy_Layout_Methods). When working with layouts, stick with Flexbox or Grid.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. For some really quick practice using `float`, MDN created [three quick exercises](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats_skills) you can use to acquire familiarity with its proper use.
</div>

### Additional Resources
This section contains helpful links to other content. It isn’t required, so consider it supplemental.
* [For a more in-depth look at float](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats) MDN has some great documentation.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* What is the main use for floats in the present day?
* Why should floats not be used for modifying the layout of a page?
* What other shapes can be created for text to wrap around?