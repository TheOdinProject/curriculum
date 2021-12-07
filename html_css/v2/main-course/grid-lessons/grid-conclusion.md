### Introduction
Some may tell you there is a debate on the use of Grid vs. Flexbox and whether or not one is superior to the other. The reality is much simpler - these are complementary tools that can work together, and each has its own place in the world of CSS. 

### Learning Outcomes

By the end of this lesson, you should be able to:

* Know when you might want to use Flexbox over Grid
* Know when you might want to use Grid over Flexbox
* Know when you might want to use the two together

### Content First vs Layout First Design
One way to think about the different uses of Grid and Flexbox is to consider whether your design originates with the content, or from the overall layout. If starting with the content, and working from the smallest parts outwards, then a developer is using Content-First Design. This is a great opportunity to use Flexbox because of the flexibility it provides in manipulating code in one dimension - along either rows **or** columns. 

If, however, a developer is given a specific overall layout to adhere to and needs explicit placement of elements in two dimensions, using both rows **and** columns, then Grid would be much better suited. 

Content-First and Layout-First Design doesn't mean that the developer should limit themselves to only using Flexbox or Grid individually! Let's look at something that can happen when we attempt to create a one dimensional grid - a task many reserve for Flexbox.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="mdByJRV" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/mdByJRV">
  1-Dimensional Grid | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

It works and looks absolutely *beautiful*! However, if we have to move these individual boxes around in the future, doing so with Flexbox would be much simpler. 

### Combining Flexbox and Grid
If you have one-dimensional content, Flexbox can make it easier to control how that content is positioned in a Flex container. If, on the other hand, you want to accurately place content on a complex layout in two-dimensions, Grid can be simpler to use.

Say you want your overall layout to be a grid, but you want the grid items to act as flex parents. This way, the grid items can be moved around using the precise two-dimensional placement Grid allows for, while also allowing the content inside the grid items to be capable of freely moving around using Flex. Check out this example from CSS-Tricks.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="vYeEOxN" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/vYeEOxN">
  Combine Grid and Flexbox</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Closing opinion
This lesson includes recommendations, not the "right" or "wrong" way of using Flexbox or Grid. Ultimately, it comes down to personal preference and what a developer feels is easier for whatever the given task might be. At this point you have both of these tools in your toolbox and got a sneak peak at how they can be used together or one in place of the other. The best way to learn Flexbox and Grid is to build many projects with both of them and develop your own opinion about which to use in different circumstances.

### Assignments
<div class="lesson-content__panel" markdown="1">
1. If you haven't already, read through the previously mentioned [article by CSS-Tricks](https://css-tricks.com/css-grid-replace-flexbox/

2. To look at many different use cases for Grid, have a look at [this video by Wes Bos](https://www.youtube.com/watch?v=HYji_V2aYa0)

3. To gain some more insight on when to use Grid or Flexbox and why, read through this [article](https://webdesign.tutsplus.com/articles/flexbox-vs-css-grid-which-should-you-use--cms-30184)

### Additional Resources
This section contains helpful links to other content. It isn’t required, so consider it supplemental.

* MDN wrote an in-depth article on the relationship between Grid and other layout methods [here](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Relationship_of_Grid_Layout)

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='#content-first-vs-layout-first-design'>When might you use Flexbox over Grid?</a>
- <a class="knowledge-check-link" href='#ontent-first-vs-layout-first-design'>When might you use Grid over Flexbox?</a>
- <a class="knowledge-check-link" href='#combining-flexbox-and-grid'>When might you use the two of these tools together?</a>