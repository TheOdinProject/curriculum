### Introduction

Whenever you research either Flexbox or Grid, you’re sure to find many “experts” claiming one is better than the other. The reality is much simpler - each has its place in the world of CSS but they work best as complementary tools. In this lesson, we’ll go over what to consider when choosing a Flexbox or Grid based layout and how we can have the best of both worlds by using them together. 

### Learning Outcomes

By the end of this lesson, you should be able to:

* Know when you might want to use Flexbox over Grid
* Know when you might want to use Grid over Flexbox
* Know when you might want to use the two together

### Content First vs Layout First Design
One way to think about the different uses of Grid and Flexbox is to consider whether your design is based around the content or the overall layout. 

Content-first design bases a layout around the content being positioned. This means the exact positioning can vary based on the size of the content itself. Content-first designs usually work better with Flexbox as it creates a more fluid layout than a Grid.

Layout-first design emphasizes on the exact positioning of content within a webpage. This means you'll have more fine grain control over the design but will have to make sure your content fits within your layout. Layout-first designs usually work better with Grid as you can easily create an overarching design for your content with explict placement options. 

Though Content-first design usually work best with Flexbox and Layout-first designs usually work best with Grid, there's no need to restrict yourself with either. Let's look at an example of a one dimensional grid. Most people would rather use Flexbox for a design like this but Grid can get the job done as well! 

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="mdByJRV" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/mdByJRV">
  1-Dimensional Grid | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

It works and looks absolutely *beautiful*! However, if we ever want to move around these boxes in the future, it likely would be much easier to do with Flexbox. 

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

1. If you haven't already, read through the previously mentioned [article by CSS-Tricks](https://css-tricks.com/css-grid-replace-flexbox/)

2. To look at many different use cases for Grid, have a look at [this video by Wes Bos](https://www.youtube.com/watch?v=HYji_V2aYa0)

3. To gain some more insight on when to use Grid or Flexbox and why, read through this [article](https://webdesign.tutsplus.com/articles/flexbox-vs-css-grid-which-should-you-use--cms-30184)
</div>

### Additional Resources
This section contains helpful links to other content. It isn’t required, so consider it supplemental.

- MDN wrote an in-depth article on the relationship between Grid and other layout methods [here](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Relationship_of_Grid_Layout)

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='#content-first-vs-layout-first-design'>When might you use Flexbox over Grid?</a>
- <a class="knowledge-check-link" href='#content-first-vs-layout-first-design'>When might you use Grid over Flexbox?</a>
- <a class="knowledge-check-link" href='#combining-flexbox-and-grid'>When might you use the two of these tools together?</a>
