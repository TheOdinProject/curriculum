### Introduction

Now that you know what CSS Grid Layout is, you’ll learn how to create your own grid. This lesson will cover making a grid container, adding columns and rows, the explicit and implicit concept behind Grid and how to space out grid gaps.

### Learning Outcomes

By the end of this lesson, you should be able to:

* Make a grid container
* Define grid tracks
* Explain the difference between an implicit and explicit grid
* Set gaps between grid cells

### Setting Up a Grid

This lesson will show you how easy it is to make a grid layout without much work. In upcoming lessons, you will find out more about positioning and how to make complex grids, but for now we’ll start with something simple.

#### Grid Container

We can think about CSS Grid in terms of a container and items. Simply put, when you make an element a grid container, it will “contain” the whole grid. In CSS, an element is turned into a grid container with the property `display: grid` or `display: inline-grid`.

<div class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="MWodzag" data-editable="true" data-user="dm-murphy"  data-prefill='{"tags":[],"scripts":[],"stylesheets":[]}'>
  <pre data-lang="html">&lt;div class="container">
  &lt;div>Item 1&lt;/div>
  &lt;div>Item 2&lt;/div>
  &lt;div>Item 3&lt;/div>
  &lt;div>Item 4&lt;/div>
&lt;/div></pre>
  <pre data-lang="css">.container {
  display: grid;
}</pre></div>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

In this example, the parent element marked `class="container"` becomes a grid container and each of the direct child elements below it automatically become grid items. What’s easy about CSS Grid is that you don’t have to assign each child element a property.

Note that only the direct child elements will become grid items here. If we had another element as a child under one of *these* child elements it would not be a grid item. In the example below, the paragraph element is not a grid item:

~~~html
<!-- index.html -->

<div class="container">
  <div>Item 1</div>
  <div>Item 2</div>
    <p>I am not a grid item!</p>
  <div>Item 3</div>
  <div>Item 4</div>
</div>
~~~

But just as you learned in the flexbox lessons, grid items can *also* be grid containers. So you could make grids inside of grids if you wanted.

#### Lines and Tracks in Grids, Oh My!

Since you’re coding along with our example (right?) you will notice it doesn’t look very grid-ish yet. A lot of resources on CSS Grid like to show you boxes and outlined grid tables right from the start. But if your grid container and grid items don’t have any borders you won't actually see these lines on the page. So don’t worry, they’re still there!

If you inspect these elements on a webpage using developer tools, you will notice grid badges on the grid elements in the code. The Layout options of the dev tools allows you to select an overlay that can show these invisible lines, tracks and areas of the grid. You will read about using a browser’s developer tools in the assignment below and learn more on lines, tracks and areas in the next lesson.

#### Columns and Rows

Now that we have our grid container with several grid items all set up, it’s time to specify our columns and rows. This will define the grid track (the space between lines on a grid). So we could set a column track to give us space between our columns and a row track to give us space between our rows. We will get into the specifics on tracks and lines in the next lesson, but for now let’s just make some columns and rows.

The properties `grid-template-columns` and `grid-template-rows` make defining column and row tracks easy. For this lesson, we’ll stick to defining our columns and rows using pixels. In the upcoming lessons, you’ll learn more about defining with percentages and fractional units too.

Going back to our grid container from above, let’s define two columns and two rows to place our four grid items:

<div class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="mdwYQLG" data-editable="true" data-user="dm-murphy"  data-prefill='{"tags":[],"scripts":[],"stylesheets":[]}'>
  <pre data-lang="html">&lt;div class="container">
  &lt;div>Item 1&lt;/div>
  &lt;div>Item 2&lt;/div>
  &lt;div>Item 3&lt;/div>
  &lt;div>Item 4&lt;/div>
&lt;/div></pre>
  <pre data-lang="css">.container {
  display: grid;
  grid-template-columns: 50px 50px;
  grid-template-rows: 50px 50px;
}</pre></div>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

If we want to add more columns or rows to our grid, we can simply define these values to make another track. Let's say we wanted to add a third column to our example: 

<div class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="dyRBywm" data-editable="true" data-user="dm-murphy"  data-prefill='{"tags":[],"scripts":[],"stylesheets":[]}'>
  <pre data-lang="html">&lt;div class="container">
  &lt;div>Item 1&lt;/div>
  &lt;div>Item 2&lt;/div>
  &lt;div>Item 3&lt;/div>
  &lt;div>Item 4&lt;/div>
&lt;/div></pre>
  <pre data-lang="css">.container {
  display: grid;
  grid-template-columns: 50px 50px 50px;
  grid-template-rows: 50px 50px;
}</pre></div>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

CSS Grid also includes a shorthand property for defining rows and columns. In our previous example we can replace the properties for `grid-template-rows` and `grid-template-columns` with the shorthand `grid-template` property. Here we can define our rows and columns all at once. For this property, rows are defined before the slash and columns are defined after the slash. Let’s keep the same column and row values, but use the shorthand property instead:

~~~css
/* styles.css */

.container {
  display: grid;
  grid-template: 50px 50px / 50px 50px 50px;
}
~~~

Columns and rows don’t have to share all the same values either. Let’s change the property values of our columns so that the first column is five times as wide as the others:

<div class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="eYRaQLd" data-editable="true" data-user="dm-murphy"  data-prefill='{"tags":[],"scripts":[],"stylesheets":[]}'>
  <pre data-lang="html">&lt;div class="container">
  &lt;div>Item 1&lt;/div>
  &lt;div>Item 2&lt;/div>
  &lt;div>Item 3&lt;/div>
  &lt;div>Item 4&lt;/div>
&lt;/div></pre>
  <pre data-lang="css">.container {
  display: grid;
  grid-template: 50px 50px / 250px 50px 50px;
}</pre></div>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Explicit vs Implicit Grid

Let's go back to our original example of a simple 2x2 layout for four grid items. What happens if we add a fifth item to our container without changing our `grid-template-columns` or `grid-template-rows` properties?

<div class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="bGRyQQX" data-editable="true" data-user="dm-murphy"  data-prefill='{"tags":[],"scripts":[],"stylesheets":[]}'>
  <pre data-lang="html">&lt;div class="container">
  &lt;div>Item 1&lt;/div>
  &lt;div>Item 2&lt;/div>
  &lt;div>Item 3&lt;/div>
  &lt;div>Item 4&lt;/div>
  &lt;div>Item 5&lt;/div>
&lt;/div></pre>
  <pre data-lang="css">.container {
  display: grid;
  grid-template-columns: 50px 50px;
  grid-template-rows: 50px 50px;
}</pre></div>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

You’ll notice our fifth item was placed on the grid and it’s been slotted into a third row we did not define. This is because of the implicit grid concept and it’s how CSS Grid is able to automatically place grid items when we haven’t explicitly defined the layout for them.

When we use the `grid-template-columns` and  `grid-template-rows` properties, we are explicitly defining grid tracks to lay out our grid items. But when the grid needs more tracks for extra content, it will implicitly define new grid tracks. Additionally, the size values established from our `grid-template-columns` or `grid-template-rows` properties are not carried over into these implicit grid tracks. But we can define values for the implicit grid tracks.

We can set the implicit grid track sizes using the `grid-auto-rows` and `grid-auto-columns` properties. In this way we can ensure any new tracks the implicit grid makes for extra content are set at values that we defined. 

Let’s say we want any new rows to stay the same value as our explicit row track sizes:

~~~css
/* styles.css */

.container {
  display: grid;
  grid-template-columns: 50px 50px;
  grid-template-rows: 50px 50px;
  grid-auto-rows: 50px;
}
~~~

By default, CSS Grid will add additional content with implicit rows. This means the extra elements would keep being added further down the grid in a vertical fashion. It would be much less common to want extra content added horizontally along the grid, *but* that can be set using the `grid-auto-flow: column` property and those implicit track sizes can be defined with the `grid-auto-columns` property.

### Gap

The gap between grid rows and columns is known as the gutter or alley. Gap sizes can be adjusted separately for rows and columns using the `column-gap` and `row-gap` properties. The gap can also be set with the shorthand property `gap` if you want the row and column gap to be the same.

Before adding our grid gap properties let’s make things a little easier to see without relying on developer tools. We’ll go ahead and add a simple border around our grid items so we can get a better sense of their placement around each other:

<div class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="zYzQMbz" data-editable="true" data-user="dm-murphy"  data-prefill='{"tags":[],"scripts":[],"stylesheets":[]}'>
  <pre data-lang="html">&lt;div class="container">
  &lt;div>Item 1&lt;/div>
  &lt;div>Item 2&lt;/div>
  &lt;div>Item 3&lt;/div>
  &lt;div>Item 4&lt;/div>
&lt;/div></pre>
  <pre data-lang="css">.container {
  display: grid;
  grid-template-columns: 50px 50px;
  grid-template-rows: 50px 50px;
}

.container > div {
  border: 1px solid blue;
}</pre></div>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Next we’ll use a slight grid column gap to space out our two columns a bit:

<div class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="gORJQyE" data-editable="true" data-user="dm-murphy"  data-prefill='{"tags":[],"scripts":[],"stylesheets":[]}'>
  <pre data-lang="html">&lt;div class="container">
  &lt;div>Item 1&lt;/div>
  &lt;div>Item 2&lt;/div>
  &lt;div>Item 3&lt;/div>
  &lt;div>Item 4&lt;/div>
&lt;/div></pre>
  <pre data-lang="css">.container {
  display: grid;
  grid-template-columns: 50px 50px;
  grid-template-rows: 50px 50px;
  column-gap: 10px;
}

.container > div {
  border: 1px solid blue;
}</pre></div>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Finally we’ll add a lot of gap to our rows to highlight the difference:

<div class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="wvebQLw" data-editable="true" data-user="dm-murphy"  data-prefill='{"tags":[],"scripts":[],"stylesheets":[]}'>
  <pre data-lang="html">&lt;div class="container">
  &lt;div>Item 1&lt;/div>
  &lt;div>Item 2&lt;/div>
  &lt;div>Item 3&lt;/div>
  &lt;div>Item 4&lt;/div>
&lt;/div></pre>
  <pre data-lang="css">.container {
  display: grid;
  grid-template-columns: 50px 50px;
  grid-template-rows: 50px 50px;
  column-gap: 10px;
  row-gap: 100px;
}

.container > div {
  border: 1px solid blue;
}</pre></div>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

If we wanted the columns and rows to share the same gap value we could replace the `column-gap` and `row-gap` properties with something like `gap: 25px;`.

### Wrapping Up Our First Grid

Now that you’ve made a grid you can start to see how easy it is to control the layout of your elements with CSS Grid. You may also realize how CSS Grid can solve common layout problems. In the next couple lessons we will cover positioning elements and advanced grid attributes. But first, check out the links below that cover making the basics of a grid in more detail.

### Assignment
<div class="lesson-content__panel" markdown="1">
- Read Parts I, II and III from [CSS-Tricks Complete Guide to Grid.](https://css-tricks.com/snippets/css/complete-guide-grid/)
- Watch this [short video](https://www.youtube.com/watch?v=8_153Zz4YI8&ab_channel=WesBos) on Implicit vs Explicit Tracks from the Wes Bos CSS Grid course.
- Look through the [Inspect CSS Grid](https://developer.chrome.com/docs/devtools/css/grid/) guide that explains how to view grids on a webpage using Chrome DevTools.
- Also check out MDN's guide on using the [CSS Grid Inspector](https://developer.mozilla.org/en-US/docs/Tools/Page_Inspector/How_to/Examine_grid_layouts) to learn how to inspect grids using Firefox DevTools.
</div>

### Additional Resources
- The [MDN Basic Concepts of grid layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout) reviews many of the basics and introduces some additional concepts.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='#setting-up-a-grid'>Explain how to define a grid item.</a>
- <a class="knowledge-check-link" href='#setting-up-a-grid'>What is the space between lines on the grid?</a>
- <a class="knowledge-check-link" href='#grid-gaps'>How do you set gutters (also known as alleys) in the grid?</a>
- <a class="knowledge-check-link" href='#explicit-vs-implicit-grid'>Describe what happens when you have more content than defined tracks.</a>
- <a class="knowledge-check-link" href='#explicit-vs-implicit-grid'>How could you change the size for those undefined tracks?</a>
