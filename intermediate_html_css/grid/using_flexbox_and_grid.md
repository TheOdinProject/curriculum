### Introduction

Some may tell you there is a debate on the use of Grid vs. Flexbox and whether or not one is superior to the other. The reality is these are complementary tools that can work together, and each has its own place in the world of CSS.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Know when you might want to use Flexbox over Grid.
- Know when you might want to use Grid over Flexbox.
- Know when you might want to use the two together.

### Content first vs layout first design

A way to decide between Grid and Flexbox is to consider if your design starts from the content, or from the layout.

In Content First Design, you begin with clarity of how the content should be, and the layout follows. This is a great opportunity to use Flexbox. Its flexible nature gives you control of the *behavior* of items through logical rules. How they grow, shrink, their ideal size and position in relation to each other, all make the layout dynamic. While Flexbox gives you control over its content, the final layout is only a consequence. Depending on the dimensions of the flex container, the general layout can change a lot.

In Layout First Design, you decide how you want the pieces arranged, then fill in the content. That is when Grid shines. Defining grid row and column tracks gives you full control of layout. Content in a grid can only fill the spaces of explicit or implicit tracks. So, when you have an idea of how the big picture of a container should look like, Grid is the clear choice.

Content or Layout First Design do not force us to use either Flexbox or Grid! Let's try laying out a one dimensional set of items – a task many reserve for Flexbox – using Grid.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="mdByJRV" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/mdByJRV">
  1-Dimensional Grid | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

It works and looks absolutely *beautiful*! But imagine we would like to move these boxes around in the future. Or, for instance, we wanted the third box to stretch in a second row so that the boxes didn't shrink too much to fit in only one. Both of these things would be *possible* in Grid. But if controlling the layout isn't our priority, Flexbox is more intuitive and fit for the task.

### Combining flexbox and grid
If you have one-dimensional content, Flexbox can make it easier to control how that content is positioned in a Flex container. If, on the other hand, you want to accurately place content on a complex layout in two-dimensions, Grid can be easier to use.

Say you want your overall layout to be a grid, but you want the grid items to act as flex parents. This way, the grid items can be moved around using the precise two-dimensional placement Grid allows for, while also allowing the content inside the grid items to be capable of freely moving around using Flex. Check out this example from CSS-Tricks.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="vYeEOxN" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/vYeEOxN">
  Combine Grid and Flexbox</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Closing opinion
This lesson includes recommendations, not the "right" or "wrong" way of using Flexbox or Grid. Ultimately, it comes down to personal preference and what a developer feels is easier for whatever the given task might be. At this point you have both of these tools in your toolbox and got a sneak peek at how they can be used together or one in place of the other. The best way to learn Flexbox and Grid is to build many projects with both of them and develop your own opinion about which to use in different circumstances.

### Assignments

<div class="lesson-content__panel" markdown="1">

1. If you haven't already, read through the previously mentioned [article by CSS-Tricks](https://css-tricks.com/css-grid-replace-flexbox/)

2. To look at many different use cases for Grid, have a look at [this video by Wes Bos](https://www.youtube.com/watch?v=HYji_V2aYa0)

3. To gain some more insight on when to use Grid or Flexbox and why, read through this [article](https://webdesign.tutsplus.com/articles/flexbox-vs-css-grid-which-should-you-use--cms-30184)
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [When might you use Flexbox over Grid?](#content-first-vs-layout-first-design)
- [When might you use Grid over Flexbox?](#content-first-vs-layout-first-design)
- [When might you use the two of these tools together?](#combining-flexbox-and-grid)

### Additional resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

- MDN wrote an in-depth article on the relationship between Grid and other layout methods [here](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Relationship_of_Grid_Layout)
- If you are a visual learner, [Flexbox30](https://www.samanthaming.com/flexbox30/) is a great resource for quick visual reference. 
