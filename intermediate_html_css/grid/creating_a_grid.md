### Introduction

Now that you know what CSS Grid Layout is, you’ll learn how to create your own grid. This lesson will cover making a grid container, adding columns and rows, the explicit and implicit concept behind Grid and how to space out grid gaps.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Make a grid container.
- Define grid tracks.
- Explain the difference between an implicit and explicit grid.
- Set gaps between grid cells.

### Setting up a grid

This lesson will show you how easy it is to make a grid layout without much work. In upcoming lessons, you will find out more about positioning and how to make complex grids, but for now we’ll start with something basic.

#### Grid container

We can think about CSS Grid in terms of a container and items. When you make an element a grid container, it will “contain” the whole grid. In CSS, an element is turned into a grid container with the property `display: grid` or `display: inline-grid`.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="ZEXYGGx" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/ZEXYGGx">
  My First Grid | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

In this example, the parent element marked `class="container"` becomes a grid container and each of the direct child elements below it automatically become grid items. What’s easy about CSS Grid is that you don’t have to assign each child element a property.

Note that only the direct child elements will become grid items here. If we had another element as a child under one of *these* child elements it would not be a grid item. In the example below, the paragraph element is not a grid item:

```html
<!-- index.html -->

<div class="container">
  <div>Item 1</div>
  <div>Item 2
    <p>I am not a grid item!</p>
  </div>
  <div>Item 3</div>
  <div>Item 4</div>
</div>
```

But just as you learned in the flexbox lessons, grid items can *also* be grid containers. So you could make grids inside of grids if you wanted.

#### Lines and tracks in grids, oh my!

Since you’re coding along with our example (right?) you will notice it doesn’t look very grid-ish yet. A lot of resources on CSS Grid like to show you boxes and outlined grid tables right from the start. But if your grid container and grid items don’t have any borders you won't actually see these lines on the page. So don’t worry, they’re still there!

If you inspect these elements on a webpage using developer tools, you will notice grid badges on the grid elements in the code. The Layout options of the dev tools allows you to select an overlay that can show these invisible lines, tracks and areas of the grid. You will read about using a browser’s developer tools in the assignment below and learn more about lines, tracks, and areas in the next lesson.

#### Columns and rows

Now that we have our grid container with several grid items all set up, it’s time to specify our columns and rows. This will define the grid track (the space between lines on a grid). So we could set a column track to give us space between our columns and a row track to give us space between our rows. We will get into the specifics on tracks and lines in the next lesson, but for now let’s just make some columns and rows.

The properties `grid-template-columns` and `grid-template-rows` make defining column and row tracks easy. For this lesson, we’ll stick to defining our columns and rows using pixels. In the upcoming lessons, you’ll learn more about defining with percentages and fractional units too.

Going back to our grid container from above, let’s define two columns and two rows to place our four grid items:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="yLzyNYp" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/yLzyNYp">
  Columns and Rows 1 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

If we want to add more columns or rows to our grid, we can define these values to make another track. Let's say we wanted to add a third column to our example:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="NWaPqxj" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/NWaPqxj">
  Columns and Rows 2 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

CSS Grid also includes a shorthand property for defining rows and columns. In our previous example we can replace the properties for `grid-template-rows` and `grid-template-columns` with the shorthand `grid-template` property. Here we can define our rows and columns all at once. For this property, rows are defined before the slash and columns are defined after the slash. Let’s keep the same column and row values, but use the shorthand property instead:

```css
/* styles.css */

.container {
  display: grid;
  grid-template: 50px 50px / 50px 50px 50px;
}
```

Columns and rows don’t have to share all the same values either. Let’s change the property values of our columns so that the first column is five times as wide as the others:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="LYzEVGo" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/LYzEVGo">
  Columns and Rows 3 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Explicit vs implicit grid

Let's go back to our original example of a 2x2 layout for four grid items. What happens if we add a fifth item to our container without changing our `grid-template-columns` or `grid-template-rows` properties?

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="qBPEdZw" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/qBPEdZw">
  Implicit Grid | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

You’ll notice our fifth item was placed on the grid and it’s been slotted into a third row we did not define. This is because of the implicit grid concept and it’s how CSS Grid is able to automatically place grid items when we haven’t explicitly defined the layout for them.

When we use the `grid-template-columns` and `grid-template-rows` properties, we are explicitly defining grid tracks to lay out our grid items. But when the grid needs more tracks for extra content, it will implicitly define new grid tracks. Additionally, the size values established from our `grid-template-columns` or `grid-template-rows` properties are not carried over into these implicit grid tracks. But we can define values for the implicit grid tracks.

We can set the implicit grid track sizes using the `grid-auto-rows` and `grid-auto-columns` properties. In this way we can ensure any new tracks the implicit grid makes for extra content are set at values that we defined.

Let’s say we want any new rows to stay the same value as our explicit row track sizes:

```css
/* styles.css */

.container {
  display: grid;
  grid-template-columns: 50px 50px;
  grid-template-rows: 50px 50px;
  grid-auto-rows: 50px;
}
```

By default, CSS Grid will add additional content with implicit rows. This means the extra elements would keep being added further down the grid in a vertical fashion. It would be much less common to want extra content added horizontally along the grid, *but* that can be set using the `grid-auto-flow: column` property and those implicit track sizes can be defined with the `grid-auto-columns` property.

### Gap

The gap between grid rows and columns is known as the gutter or alley. Gap sizes can be adjusted separately for rows and columns using the `column-gap` and `row-gap` properties. Furthermore, we can use a shorthand property called `gap` to set both `row-gap` and `column-gap`.

Before adding our grid gap properties let’s make things a little easier to see without relying on developer tools. We’ll go ahead and add a border around our grid items so we can get a better sense of their placement around each other:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="eYGmNzj" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/eYGmNzj">
  Gap 1 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Next we’ll use a slight grid column gap to space out our two columns a bit:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="wvrBazJ" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/wvrBazJ">
  Gap 2 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Finally we’ll add a lot of gap to our rows to highlight the difference:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="abLzOmX" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/abLzOmX">
  Gap 3 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

You can also try playing with the shorthand `gap` to set both the `row-gap` and `column-gap` in the above CodePen.

### Wrapping up our first grid

Now that you’ve made a grid you can start to see how easy it is to control the layout of your elements with CSS Grid. You may also realize how CSS Grid can solve common layout problems. In the next couple lessons we will cover positioning elements and advanced grid attributes. But first, check out the links below that cover making the basics of a grid in more detail.

### Assignment

<div class="lesson-content__panel" markdown="1">
- Read Parts I, II and III from [CSS-Tricks Complete Guide to Grid.](https://css-tricks.com/snippets/css/complete-guide-grid/)
- Watch this [short video](https://www.youtube.com/watch?v=8_153Zz4YI8&ab_channel=WesBos) on Implicit vs Explicit Tracks from the Wes Bos CSS Grid course.
- Look through the developer tools docs on inspecting CSS Grid for [Chrome.](https://developer.chrome.com/docs/devtools/css/grid/)
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [How does an HTML element become a grid item?](#setting-up-a-grid)
- [What is the space between lines on the grid?](#columns-and-rows)
- [How do you set gutters (also known as alleys) in the grid?](#gap)
- [Describe what happens when you have more content than defined tracks.](#explicit-vs-implicit-grid)
- [How could you change the size for those undefined tracks?](#explicit-vs-implicit-grid)

### Additional resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

- The [MDN Basic Concepts of grid layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout) reviews many of the basics and introduces some additional concepts.
- Watch this [short video](https://www.youtube.com/watch?v=0m5qgfX2TVQ&ab_channel=PeterSommerhoff) on grid terminology from PeterSommerhoff.
