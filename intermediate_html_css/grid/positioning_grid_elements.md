### Introduction

In this lesson we will examine the different parts of a grid and explore common properties that can be used to position grid items.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe the differences between tracks, lines, and cells.
- Position items by defining their start and end lines.
- Use shorthand notation.

### Reviewing tracks

Before we dive straight into positioning, let's establish some terminology to better understand the different parts of a grid. In the previous lesson you learned that when you define a grid using `grid-template`, you are defining the *tracks* the grid will have. You can think of a grid track as any single row or column on a grid.

To give an example, if we wanted to create a 3x3 grid with 100 pixel rows and 100 pixel columns, we need to define 3 horizontal tracks with a height of 100 pixels and 3 vertical tracks with a width of 100 pixels:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="poWvJXQ" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/poWvJXQ">
  3x3 Layout | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

You will notice two CSS lines have been commented out in this CodePen. Uncomment the property in the `.first-row` class selector to see the grid track between the first and second-row grid lines.

Next, uncomment the property in the `.last-column` class selector to see the grid track between the third and fourth-column grid lines.

### Lines

Whenever we create grid tracks, grid lines are created *implicitly*. This is important. Grid lines are only created after our grid tracks have been defined. We can not explicitly create grid lines.

Every track has a start line and an end line. The lines are numbered from left to right and top to bottom starting at 1. So our 3x3 grid above has vertical lines for columns ranging from 1 to 4 and horizontal lines for rows ranging from 1 to 4.

Grid lines are what we use to position grid items. We'll get to that in a minute, but first let's take a deeper look at grid lines using our developer tools.

If you open up developer tools in Chrome, you can navigate to the Layout pane and find the Grid overlay display settings. Make sure that _show line numbers_ is enabled. Select the correct element from the Grid overlays (e.g. this might be our `div.container` if you are inspecting our CodePen.) You should now see an overlay of the grid lines.

Notice that the developer tools also show negative lines opposite from the positive lines. You don't have to worry about the negative lines for now, but know that this gives you another option to use when positioning the grid items.

### Cells

The space in a grid shared by a single row track and a single column track is called a grid *cell*. You can think of a grid cell like a cell in a spreadsheet: a space defined by a *row, column* coordinate.

By default, each child element of a grid container will occupy one cell. In the example above, we have 9 cells in our grid (3 rows x 3 columns), each with one automatically positioned child element inside. The element marked with the letter "A" is occupying a cell that lies in row track 1 (between row grid lines 1 and 2) and column track 1 (between column grid lines 1 and 2). The item marked with the letter "H" is in a cell at row track 3 (between row grid lines 3 and 4) and column track 2 (between column grid lines 2 and 3).

But what happens if we wanted to change the order of our grid items? Or if we want items to occupy more than one cell?

### Positioning

To get a feel for how items can be positioned we will create a mock floor plan for an apartment. Let's start with a total area of our apartment (the grid container) divided into a 5x5 grid. To make this example a little clearer, we'll use a background color to distinguish our container space. Note that we're also using `display: inline-grid` here so that our container does not stretch to take up space the way a block-level box would. This will just help us better visualize the space.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="rNGaOxB" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/rNGaOxB">
  Positioning 1 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

As it stands this is a pretty sad unit. To make it less of an empty box and more of a home we are going to add some items to our grid container that will represent different rooms.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="poWvjgY" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/poWvjgY">
  Positioning 2 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Most of our rooms represent a single grid cell. But we have given ourselves a large living room. (Yay!) We positioned this item using `grid-column-start` and `grid-column-end`. Their property values represent the column grid lines we wish it to start and end with.

You will also notice we have commented out property values for this item's grid row positioning. Uncomment the `grid-row-start` and `grid-row-end` properties to see how our living room can get even bigger by taking up the grid track between the first and third-row grid lines.

These properties allow us to use our existing grid lines to tell items how many rows and columns each item should span across. Take a minute to play around with the property values here. If the line numbers are confusing, inspect the container using your dev tools to show the grid overlay.

Next, we need to use our space more efficiently. We will make the rest of our rooms span multiple grid cells and fill out the rest of our apartment.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="jOGEbrX" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/jOGEbrX">
  Positioning 3 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Now we have the blueprints for our full apartment. If you take a look at the `#kitchen` selector you will see we used shorthand properties here. `grid-column` is just a combination of `grid-column-start` and `grid-column-end` with a slash between the two values. And `grid-row` is the shorthand version for setting an item's row positioning.

One problem with our floor plan is that the bathroom and kitchen are on opposite ends of the apartment. We would save money on the plumbing by placing these two rooms back to back. Take a minute now and see if you can change the starting and ending positions for the bathroom, bedroom and closet so that the bathroom is right next to the kitchen. You can use either the long or shorthand properties here.

### grid-area

You now know how to position your grid items using row and column lines. But there are other ways to position items and this is where things can get a little confusing.

There is an even shorter shorthand for positioning grid items with start and end lines. You can combine `grid-row-start` / `grid-column-start` / `grid-row-end` / `grid-column-end` into one line using `grid-area`.

Our living room above can be written out like this:

```css
/* styles.css */

#living-room {
  grid-area: 1 / 1 / 3 / 6;
}
```

But `grid-area` can also refer to a few different things.

Instead of using the grid lines to position all the items in a grid, we can create a visual layout of the grid in words. To do this we give each item on the grid a name using `grid-area`.

So our living room can be written just like this:

```css
/* styles.css */

#living-room {
  grid-area: living-room;
}
```

We could do this to all of our grid items and give each room a `grid-area` value as a name. Then we can map out the whole structure with the grid container using `grid-template-areas`.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="dyVPYpv" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/dyVPYpv">
  grid-template-areas 1 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Wow! You might want to open up the CodePen browser and make it large enough to really read the `grid-template-areas` layout line by line. But this tool gives us a completely different way to position items.

We can even use `.` to indicate empty cells. Say our apartment might be getting a water heater and washer/dryer. We might not be sure of the exact layout but we can visualize some space easily by removing more room in the bathroom and kitchen:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="ZEXYbpg" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/ZEXYbpg">
  grid-template-areas 2 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

So now you know two very different ways of using `grid-area` on a grid item. You might even see the term "grid area" refer to a group of cells. For example, all the grid cells of the living room together is a grid area. The apartment analogy should help. A grid item can take up multiple cells forming an area of the grid much like a room with four walls in an apartment.

### Wrapping up

As you go through the assignments you will come across more terminology like `span` and `auto` when positioning grid items across tracks. There are also properties to justify and align grid items similar to Flexbox. The best way to learn all this terminology and how to position items is with lots of practice!

### Assignment
<div class="lesson-content__panel" markdown="1">
- Read MDN's [Line-based Placement with CSS Grid.](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Line-based_Placement_with_CSS_Grid)
- Review [Part 4 on Grid Properties](https://css-tricks.com/snippets/css/complete-guide-grid/#grid-properties) from CSS-Tricks.
</div>

### Practice

> When doing the following exercises, please use all the documentation and resources you need to accomplish them. You are _not_ intended to have any of this stuff memorized at this point. Check the docs, use google, do what you need to do (besides checking the solutions) to get them done.

Go back to our [CSS exercises repository](https://github.com/TheOdinProject/css-exercises) (you've done these previously, but don't forget that the instructions are in the README). Do the first exercise in the 'grid' directory:

1. grid-layout-1

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [Explain the difference between a track and a line.](#reviewing-tracks)
- [What is the smallest unit on a grid?](#cells)
- [What kind of value do we give to the `grid-column-start` or `grid-column-end` properties?](#positioning)
- [Which property can we use to combine all the start and end values for a grid item?](#grid-area)
- [Which grid container property can map out a visual structure of grid items?](#grid-area)

### Additional resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

- Play through levels 1 - 17 of [CSS Grid Garden](https://cssgridgarden.com/) to practice positioning items. Note the rest of the levels go beyond the scope of this lesson.
- If you want to know more about using `grid-template-areas` check out this [Smashing Magazine article from Rachel Andrew.](https://www.smashingmagazine.com/understanding-css-grid-template-areas)
- To learn more about alignment and centering items read through these MDN Docs on [Box Alignment in CSS Grid Layout.](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Box_Alignment_in_CSS_Grid_Layout)
