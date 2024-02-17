### Introduction

So far, you've learned how to create a grid, adjust the sizes of the tracks, and position grid elements in specific rows and columns. Right now, you have all the tools you need to be able to create any kind of static grid layout, but what do you do when you want your grid to be more responsive, dynamic, or reusable?

In this lesson, you will learn about some more advanced Grid properties that can help you do this.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Create multiple grid tracks more easily using the `repeat` function.
- Create grid tracks using `fr` units instead of an explicit size.
- Set minimum, maximum, and ideal track size boundaries.
- Use `auto-fit` and `auto-fill` to create a grid with a dynamic number of rows or columns.
- Use `auto-fit`/`auto-fill` along with `minmax()` to create responsive grids.

### Setup

We're going to approach this lesson hands-on. Let's set up a grid with five columns and two rows and apply some styling so everything is easy to see.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="wvrBBXK" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/wvrBBXK">
  Advanced Properties | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

In this example, the HTML is pretty straightforward, but let's talk really quick about some of the CSS being used that *isn't* related to the lesson so you can understand why it is being used.

#### grid-item, p, img selectors

All the properties here are to make our grid items look a bit nicer. They are all relatively straightforward, so no need to dive into specifics.

#### grid-container

For our container, we are obviously using `display: grid` to render the container as a CSS Grid. But the next property might be unfamiliar to you: `resize: both`. This is a property that allows the user to resize the container by clicking and dragging from the bottom right corner. This will be beneficial to us when we start using properties that resize our grid tracks based on the size of the grid.

**Change zoom levels:** Make sure to view the CodePen embeds at 0.5x or 0.25x so that there's room to resize the container.

We use `overflow: auto` to enable scrolling if we resize the container to be smaller than our grid can accommodate.

We use the properties `gap` and `padding` to establish a "gutter" area to be able to visualize the grid items better.

The `border` and `background-color` are included to make the container look nicer.

```css
grid-template-rows: 150px 150px;
grid-template-columns: 150px 150px 150px 150px 150px;
```

Here is where we want to begin our focus for this lesson. In order to make two rows and five columns, we manually define each row and column's track size individually.

Ugh, so tedious!

Okay, so maybe it wasn't THAT tedious. But in this case, we only made a 2x5 grid, which can hold a total of ten items. Imagine using this method of defining every column and row for a grid that can hold hundreds of items!

Enter, `repeat()`.

### Repeat

`repeat()` is a CSS function available to the CSS Grid template properties that allows us to define a number of rows or columns and the size we want them to be without having to manually type out each individual track's size. For example, in our setup above:

```css
.grid-container {
  grid-template-rows: 150px 150px;
  grid-template-columns: 150px 150px 150px 150px 150px;
}
```

can be rewritten as:

```css
.grid-container {
  grid-template-rows: repeat(2, 150px);
  grid-template-columns: repeat(5, 150px);
}
```

Check it out for yourself!

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="wvrBBxK" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/wvrBBxK">
  repeat | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Fractional units

Now that we know how to quickly create many grid tracks, it's time to learn how to start making them *dynamic*. Dynamic, in this context means "flexible" or "responsive in some way." The opposite of dynamic is *static*, or fixed at a certain defined height, like `150px`, which we used in the setup of this sample grid.

The most basic way to make our grid items dynamic is by using **fractional units**, also known as `fr`.

The `fr` unit is a way of distributing whatever *remaining space* is left in the grid. For example, if we have a four-column grid with a total width of `400px` and four grid items each on a column track assigned `1fr` as their size, all of the grid items should be given **one fraction** of that `400px` of space, which is 100 pixels.

Let's take a look at what happens if we give our column and row tracks in the sample grid we created a dynamic width of `1fr` instead of a static width of 150px:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="WNZbbgG" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/WNZbbgG">
  fr Unit 1 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Notice how all of our grid items now fill up the entire width and height of the grid? Neat, right? Now, try resizing that example and see what happens. Even cooler!

We can also tell our grid items to distribute the remaining space disproportionately. For example, if we divide the 5 columns up by giving the first two a track size of `2fr` and the remaining three a track size of `1fr`, the first two tracks will be given twice as much remaining space as the others. Compare this example to the previous one:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="QWqwwJG" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/QWqwwJG">
  fr Unit 2 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

In this example, there's a lot going on in our `grid-template-columns`, but take a minute to understand what is written:

```css
grid-template-columns: repeat(2, 2fr) repeat(3, 1fr);
```

<div class="lesson-note" markdown="1">
We continue to use the `repeat()` function here, but this could be written the old-fashioned way too!
</div>

The key here is that the first two columns are assigned `2fr` units and the remaining three are assigned `1fr`. This means that as the grid grows and shrinks dynamically, the space will be distributed in different amounts between these columns, specifically, twice as many pixels to the first two columns as the remaining three.

Notice that when you resize, the grid items grow proportionately to how many `fr` units they are allocated, as mentioned above.

You can also mix static units (like `px`) and dynamic units (like `fr`):

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="RwLNNqX" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/RwLNNqX">
  fr and px Units | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

You may have noticed at this point that when you resize the grid as large as possible, there is no limit to how large the grid items will become. However, when you resize it as small as possible, there is a distinct "smallest" size the grid will allow its items to go. In this case, it's the smallest size either the `<p>` or `<img>` element can be without overflowing. This breakpoint is the item's `min-content` value. This CSS keyword is **very** useful, but it is beyond the scope of this lesson. For more info, check out the [docs](https://developer.mozilla.org/en-US/docs/Web/CSS/min-content).

### Minimum and maximum track sizes: min() and max()

When we resize our grid super small, it is reassuring to know that the browser will stop the item from shrinking beyond the `min-content` value. However, we really don't want to rely on that most of the time. It's much better for you to explicitly decide as a developer how small and large your content should be, even in the most extreme situations.

We learned about `min()` and `max()` in our previous [lesson on CSS functions](https://www.theodinproject.com/lessons/intermediate-html-and-css-css-functions), but a bit of review can't hurt. Both of these functions will return a value based on the arguments you supply them. `min()` will return the smallest of all the values passed in, and `max()` will return the largest. For example, `min(100px, 200px)` will return a value of `100px` every time, while `max(100px, 200px)` will return a value of `200px` every time.

You can supply as many arguments to these functions as you want:

```css
.grid-container {
  grid-template-rows: repeat(2, min(100px, 200px, 300px, 400px, 500px));
  grid-template-columns: repeat(5, max(100px, 200px, 300px, 400px, 500px));
}
```

Of course, it's silly to give these functions static units because the calculation is meaningless: the smallest or largest value will always be returned. In the above example, the grid rows will always have a size of `100px` (the smallest of the five values) and the grid columns will always have a size of `500px` (the largest of the five). But when we provide a dynamic value as one of these arguments, we unlock the real potential of these functions, especially in the context of Grid:

```css
.grid-container {
  grid-template-rows: repeat(2, min(200px, 50%));
  grid-template-columns: repeat(5, max(120px, 15%));
}
```

In this case, the grid row size will be calculated from the values `200px` and `50%` grid container's height. In realtime, the browser will compare both of these values and apply whichever is smallest to the size of our grid row. Essentially, what this tells this grid is that the track size should be 50% of the grid's total vertical space (because we are defining a row size), *unless* that number would exceed `200px`. Essentially, you're setting a max-height for the track.

Conversely, the grid column size will be calculated based on the larger of the two values `120px` and `15%` of the grid container's width. In doing so, we are essentially setting a *minimum* width of our grid column size at `120px`. Check out the example here, and try clicking and dragging to change the grid's dimensions to see how the grid items respond:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="PoJwwLq" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/PoJwwLq">
  min and max | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Dynamic minimum and maximum sizes

#### minmax()

`minmax()` is a CSS function that is specifically used with Grid. It can only be used with the following CSS properties:

- `grid-template-columns`
- `grid-template-rows`
- `grid-auto-columns`
- `grid-auto-rows`

It is a relatively straightforward function that only takes in two arguments:

1. The minimum size the grid track can be
1. The maximum size the grid track can be

Unlike `min()` and `max()`, it *can* make sense to use static values for both arguments. Here is an example of the grid we've been using written with `minmax()` and some static values:

```css
.grid-container {
  grid-template-rows: repeat(2, 1fr);
  grid-template-columns: repeat(5, minmax(150px, 200px));
}
```

With our `grid-template-columns` set with `minmax()` values, each grid item's width will grow and shrink with the grid container as it resizes horizontally. However, as the grid shrinks, the column tracks will stop shrinking at `150px`, and as the grid grows, they will stop growing at `200px`. Talk about flexibility! Check it out for yourself below:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="poWvvmr" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/poWvvmr">
  minmax | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### clamp()

Unlike `minmax()`, `clamp()` is a CSS function that can be used anywhere, not just within a grid container. As with `min()` and `max()`, we learned about it in a previous lesson, but let's do a quick review. The syntax is as follows:

`clamp(minimum-size, ideal-size, maximum-size)`

What this does is allow our item to resize itself until it reaches one of the minimum or maximum threshold values.

Since `clamp()`'s purpose is to create a flexibly sized track with constraints, we want to use a dynamic value for the "ideal size" argument, and *typically* a static size for the minimum and maximum size, although it is possible to use a dynamic value here too.

Here is a non-grid example. We will look back at our grid in a moment:

```css
.non-grid-example {
  width: clamp(500px, 80%, 1000px);
}
```

This element, which we can pretend is just a `div`, will render with a width equal to 80% of its parent's width, unless that number is lower than `500px` or higher than `1000px`, in which case it will use those numbers as its width.

Okay, now back to our grid:

```css
.grid-container {
  grid-template-columns: repeat(5, clamp(150px, 20%, 200px));
}
```

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="dyVPPEL" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/dyVPPEL">
  clamp | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Notice how the tracks stay at `20%` of the width of the container until they hit the minimum or maximum thresholds?

Using `clamp()` and `minmax()` are fantastic methods for making grids more responsive while ensuring we don't hit critical breakpoints that make our website look bad. This is imperative when using images and elements that may have a tendency to overflow or render in undesirable ways when pushed to extreme sizes.

### auto-fit and auto-fill

These two values are actually a part of the `repeat()` function specification, but they were saved for the end of the lesson because their usefulness is not apparent until after you understand the `minmax()` function. Here's the use case: You want to give your grid a number of columns that is flexible based on the size of the grid. For example, if our grid is only `200px` wide, we may only want one column. If it's `400px` wide, we may want two, and so on. Solving this problem with media queries would be a *lot* of typing. Thankfully, `auto-fit` and `auto-fill` are here to save the day!

According to the [W3 specification on auto-fill and auto-fit](https://www.w3.org/TR/css-grid-1/#auto-repeat), both of these functions will return "the largest possible positive integer" without the grid items overflowing their container. Here is an example:

```css
.example {
  display: grid;
  width: 1000px;
  grid-template-columns: repeat(auto-fit, 200px);
}
```

For this grid, we have a set width of `1000px` and we are telling it to fill in our columns with tracks of `200px` each. As long as there are at least five grid items, this will result in a 5-column layout no matter what. In this case, `auto-fill` would actually do the same thing. We will get into the difference soon.

The real magic of `auto-fit` and `auto-fill` comes when we incorporate `minmax()` into the equation. With `minmax()`, we can tell our grid that we want to have as many columns as possible, using the constraints of our `minmax()` function to determine each column's size, without it overflowing our grid. Check out how cool our grid looks when we resize it now!

```css
.grid-container {
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
}
```

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="abLzzgR" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/abLzzgR">
  autofit 1 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Notice how when we resize, the columns automagically know how many will fit across without any media queries whatsoever. If you don't think *that's* cool, you better check your pulse!

So what's going on here specifically with `repeat(auto-fit, minmax(150px, 1fr));`? Remember that `auto-fit` will return the **highest positive integer** without overflowing the grid. So first, the browser has to know how wide our grid is: in this case, it's just the window's width (minus margins) because we didn't explicitly set it. For the sake of this example, let's pretend like our window is currently `500px` wide. Second, the browser needs to know how many grid column tracks could possibly fit in that width. To do this, it uses the minimum value in our `minmax()` function, since that will yield the highest number of items, which is `150px`. If our window is `500px` wide, this means our grid will render 3 columns. But wait, there's more! Once the browser has determined how many columns we can fit, it then resizes our columns up to the maximum value allowed by our `minmax()` function. In this case, our max size is `1fr`, so all three columns will be given an equal allotment of the space available. As we resize our window, these calculations happen in realtime and the result is what you see in the above example!

#### What about auto-fill?

In most cases, `auto-fill` is going to work exactly the same way as `auto-fit`. The difference is only noticeable when there are fewer items than can fill up the entirety of the grid row once. When the grid is expanded to a size where another grid item *could* fit, but there aren't any left, `auto-fit` will keep the grid items at their `max` size. Using `auto-fill`, the grid items will snap back down to their `min` size once the space becomes available to add another grid item, even if there isn't one to be rendered. They will continue their pattern of growing to `max` and snapping back to their `min` as the grid expands and more room becomes available for new grid tracks.

To see this in action, look at the following 2 examples, the first with `auto-fit` and the second with `auto-fill` and see what happens when you resize the grid horizontally:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="mdByJyJ" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/mdByJyJ">
  autofit 2 | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="KKXwpwX" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/KKXwpwX">
  autofill | CSS Grid</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

And that's about it! Congratulations, if you've made it this far, you are well on your way to becoming a Grid Master!

### Assignment

<div class="lesson-content__panel" markdown="1">
When doing the following exercises, please use all the documentation and resources you need to accomplish them. You are _not_ intended to have any of this stuff memorized at this point. Check the docs, use google, do what you need to do (besides checking the solutions) to get them done.

Go back to our [CSS exercises repository](https://github.com/TheOdinProject/css-exercises) (you've done these previously, but don't forget that the instructions are in the README). Do the exercises in the 'grid' directory in the following order:

1. grid-layout-2
1. grid-layout-3

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How do you create several grid tracks of the same size without manually typing each one out?](#repeat)
- [What is the difference between a static and dynamic size value?](#fractional-units)
- [How can you assign a grid track a flexible value that changes depending on the remaining space available in the grid?](#fractional-units)
- [How can you assign grid tracks an uneven distribution of the remaining space in a grid?](#fractional-units)
- [Which CSS functions will return the *smallest* or *largest* value supplied to them?](#minimum-and-maximum-track-sizes-min-and-max)
- [Which CSS Grid-only function allows you to supply a minimum and maximum track size that is calculated in realtime?](#dynamic-minimum-and-maximum-sizes)
- [Which global CSS function allows you to supply a minimum, ideal, and maximum value that is calculated in realtime?](#dynamic-minimum-and-maximum-sizes)
- [What attribute of `repeat()` can be used to fill in as many grid tracks as possible, given certain constraints?](#auto-fit-and-auto-fill)
- [What is the difference between `auto-fit` and `auto-fill`?](#auto-fit-and-auto-fill)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Learn more about the [differences](https://css-tricks.com/auto-sizing-columns-css-grid-auto-fill-vs-auto-fit/) between `auto-fit` and `auto-fill`.
- If videos are more your speed, check out this video on [auto-fit and auto-fill](https://www.youtube.com/watch?v=qjJR3qYCd54) by Kevin Powell.
- This video summarizes what you have learned so far in a [concise format](https://www.youtube.com/watch?v=EiNiSFIPIQE).
- Check out this beautiful [interactive guide to grid](https://www.joshwcomeau.com/css/interactive-guide-to-grid).
