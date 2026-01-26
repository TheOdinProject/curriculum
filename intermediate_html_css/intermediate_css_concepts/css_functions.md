### Introduction

You may have noticed that some property values you’ve worked with in CSS have a slightly different syntax. When the value is a word followed by a pair of parentheses () containing information between them - as in background-color: `rgb(0, 0, 0)` - you’re using CSS functions.

In this lesson, we’ll cover the basics of what a function is and some common ways they’re used in CSS.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Recognize the basic parts of a CSS function.
- Learn about the `calc()`, `min()`, `max()`, and `clamp()` functions and how to use each one.

### What is a function and how are they used in CSS?

Similar to programming languages, functions in CSS are reusable pieces of code which perform specific tasks. Functions are passed “arguments” between parentheses, each of which is used by the function in a specific way. Some common examples are:

```css
color: rgb(0, 42, 255);
background: linear-gradient(90deg, blue, red);
```

Here, the value of `color` is the function `rgb()`, which accepts arguments in the form of numbers. It processes those numbers to calculate the rgb color corresponding to the three values given. Similarly, the `background` property has a value of `linear-gradient(90deg, blue, red)`. `linear-gradient` generates a gradient image using the parameters it's been given. It needs at least two color arguments: colors to transition between. Additionally, you can set the angle of direction of the gradient line (like we've done in the example), add more color values, etc.

Unlike programming languages you’ll use in TOP, CSS does not allow us to create our own functions. Instead, the language comes bundled with a list of premade functions that will help you solve the most common styling problems.

Besides defining colors, <span id='responsive-design-knowledge-check'>there are several CSS functions that are useful when designing a website’s layout and sizing<span>. These become important when thinking about responsive design.

Let’s go over a few of these functions: <span id='function-names-knowledge-check'>`calc()`, `min()`, `max()`, and `clamp()`.</span>

### calc()

The most powerful use cases for calc include:

- Mixing units
- The ability to nest `calc( calc () - calc () )`

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="OJxNxya" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">

  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/OJxNxya">
  calc() | CSS Functions</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>

</p>

<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Take a look at how `calc()` is being used here:

```css
:root {
--header: 3rem;
--footer: 40px;
--main: calc(100vh - calc(var(--header) + var(--footer)));
}
```

- `--header`, `--footer`, and `--main` are all examples of CSS variables. You will be learning about these in the next lesson.
  
Setting main to equal the outcome of: `100vh - (3rem + 40px)`.
To put it another way:  `main = 100vh - (header + footer)`.
`calc()` is handling the math for us even though we are mixing vh, rem and px units.
Combined with CSS variables, `calc()` can save us from the headache of repeating CSS rules.

You should be able to grasp how `calc()` is used in the above CodePen embed. We encourage you to play around with different units and sizes of the elements to see what results you get before moving on.

<div class="lesson-note lesson-note--tip" markdown=1>

#### calc() example

The above is just an example of how `calc()` can affect a layout, but keep in mind that `calc()` is likely not the best way to go about it. We will talk more about layouts in future lessons.

</div>

### min()

`min()` does an excellent job of helping us create responsive websites. Take a look at this example:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="RwLaLay" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">

  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/RwLaLay">
  min() | CSS Functions</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>

</p>

<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

```css
#iconHolder {
  width: min(150px, 100%);
  height: min(150px, 100%);
  box-sizing: border-box;
  border: 6px solid blue;
}
```

The `min()` function works just like JavaScript's `Math.min()` and Ruby's `Array#min` methods. It takes a list of values separated by commas and returns the smallest one.

This checks whether `100%` of the parent element’s width is smaller than `150px`. If `100%` would be narrower than `150px`, the element will take up the full width of the container (`100%`). Otherwise, it will be `150px` wide.

You are able to do basic math inside a `min()`. For example, `width: min(80ch, 100vw - 2rem);` (you don't even need `calc()` in this case).

### max()

`max()` works the same way as `min()`, only in reverse, and is like JavaScript's `Math.max()` and Ruby's `Array#max` methods. It will select the largest possible value from within the parentheses.

```css
width: max(100px, 4em, 50%);
```

The above compares all three values and sets the element's width to whichever is largest. If `50%` of the parent container is bigger than `100px` and `4em`, the width will be `50%`. If `4em` is larger than the others, it will use `4em`.

The max function is most useful when the viewing window is either exceptionally small, or the user increases the content size by using the browser’s zoom feature.
You may not find a lot of use for max at first, but it is a good tool to be aware of for projects where accessibility is important.

### clamp()

`clamp()` is a great way to make elements fluid and responsive.
`clamp()` takes 3 values:

```css
h1 {
  font-size: clamp(1.5rem, 5vw, 3rem);
}
```

1. the minimum value `1.5rem`
1. the scaling value `5vw`
1. the maximum value `3rem`

The `clamp()` CSS function uses these values to set the minimum value, scaling value and maximum value. In the above example, this would mean the minimum acceptable font-size would be `1.5rem` and the maximum would be `3rem`.

A font-size of `5vw` is set in-between. The value `5vw` allows the font-size to scale according to the viewport's width, but the size is restricted by the minimum and maximum values we've set.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Take a look at the [complete list of CSS functions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Functions) and how they are used so you have an idea of what is possible.
1. Have a more in-depth look at the [`min`, `max` and `clamp` CSS functions](https://web.dev/min-max-clamp/) in action.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the four CSS math functions we covered above?](#function-names-knowledge-check)
- [How do we use CSS math functions in our CSS?](#what-is-a-function-and-how-are-they-used-in-css)
- [How can CSS functions help make websites and applications more responsive?](#responsive-design-knowledge-check)
