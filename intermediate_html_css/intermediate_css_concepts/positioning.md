### Introduction

By now you have had quite a bit of practice moving elements around the screen using things like margin, padding, and flexbox. These techniques have all relied on CSS's default "positioning-mode". This default positioning-mode is intuitive, and you'll continue using it for almost all of your layout needs. However, there are other methods at your disposal that can be very useful in some situations.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn how to use absolute positioning.
- You'll learn how to use fixed positioning.
- You'll learn how to use sticky positioning.
- You'll know the difference between each property and how to combine them.

### Static and relative positioning

The default positioning mode that you've gotten used to is ``position: static``. The difference between static and relative is fairly simple. Static is the default position of every element, and properties ``top``, ``right``, ``bottom``, and ``left`` do not affect the position of the element. Relative on the other hand is pretty much the same as static, but properties  ``top``, ``right...(etc.)`` displace the element relative to its normal position in the flow of the document.

### Absolute positioning

``position: absolute`` allows you to position something at an exact point on the screen without disturbing the other elements around it. More specifically, using absolute positioning on an element will remove that element from the normal document flow while being positioned relative to an ancestor element. To put it in other words: elements that are removed from the normal flow of the document don't affect other elements and are also not affected by other elements. Using absolute positioning allows you to position elements anywhere on the screen using  ``top``, ``right``, ``bottom``, and ``left`` properties. This property is really useful when you want to position something at an exact point on the screen, without disturbing any of the other elements. A couple of good use cases for absolute positioning are:

- modals
- image with a caption on it
- icons on top of other elements

In the following example, we are using absolute positioning to display text over an image.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="poWyWeJ" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">

  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/poWyWeJ">
  Absolute Position | CSS Positioning</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>

</p>

<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Disclaimer: absolute positioning has very specific use cases and if possible, using flexbox or grid should be prioritized. Absolute positioning shouldn't be used to do entire page layouts.

### Fixed positioning

Fixed elements are also removed from the normal flow of the document and are positioned relative to the ``viewport``. You basically use  ``top``, ``right``, ``bottom``, and ``left`` properties to position it, and it will stay there as the user scrolls. This is especially useful for things like navigation bars and floating chat buttons.

### Sticky positioning

Sticky elements will act like normal elements until you scroll past them, then they start behaving like fixed elements. They are also not taken out of the normal flow of the document. It might sound confusing, so check out this [example of sticky positioning](https://codepen.io/theanam/pen/MPLBYy) example might clear things up for you. It's useful for things like section-headings. Remember being able to still see what category you're looking at while scrolling through a shop? This is how it's done!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Web Dev Simplified's [Learn CSS Position](https://www.youtube.com/watch?v=jx5jmI0UlXU) video is fast-paced but provides a good visual representation of different positioning behaviors. Go ahead and watch it.
1. [MDN's docs on `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) covers all of the conceptual details about positioning.
1. CSS trick's page [Absolute, Relative, Fixed Positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/) should give you a different insight on the topic. You should read it as well.
1. Finally, Kevin Powell's article discusses the [difference between fixed and sticky positioning](https://www.kevinpowell.co/article/positition-fixed-vs-sticky/). It’s a great read to understand the difference better.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is the difference between static and relative positioning?](#static-and-relative-positioning)
- [What is absolute positioning useful for?](#absolute-positioning)
- [What is the difference between fixed and sticky positioning?](https://www.kevinpowell.co/article/positition-fixed-vs-sticky/)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Understand the CSS Position Property With Practical Examples](https://www.makeuseof.com/css-position-property-practical-examples/) provides some different CSS methods for positioning elements.
