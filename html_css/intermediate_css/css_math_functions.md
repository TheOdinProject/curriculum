### Introduction

You may have noticed that some property values you’ve worked with in CSS have a slightly different syntax. When the value is a word followed by a pair of parentheses () containing information between them - as in background-color: `rgb(0, 0, 0)` - you’re using CSS functions.

In this lesson, we’ll cover the basics of what a function is and some common ways they’re used in CSS.

### Learning outcomes

- Recognize the basic parts of a CSS function
- Learn about the `calc()`, `min()`, `max()`, and `clamp()` functions and how to use each one

#### What is a function and how are they used in CSS?

As in other programming languages, functions are reusable pieces of code which perform specific tasks. Functions are passed “arguments” between parentheses, each of which is used by the function in a specific way. Some common examples are:

~~~css
color: rgb(0, 42, 255);
background: linear-gradient(90deg, blue, red);
~~~

Here, the value of `color` is the function `rgb()`, which accepts arguments in the form of numbers. It processes those numbers to calculate the rgb color corresponding to the three values given. Similarly, the `background` property has a value of `linear-gradient(90deg, blue, red)`, which calculates the angle, starting color, and ending color of a gradient.

Unlike other programming languages you’ll use in TOP, CSS does not allow us to create our own functions. Instead, the language comes bundled with a list of premade functions that will help you solve the most common styling problems.

Besides defining colors, there are several CSS functions that are useful when designing a website’s layout and sizing. These become important when thinking about responsive design.

Let’s go over a few of these functions: `calc()`, `min()`, `max()`, and `clamp()`.

#### calc()

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

~~~css
:root {
--header: 3rem;
--footer: 40px;
--main: calc(100vh - calc(var(--header) + var(--footer)));
}
~~~

Setting main to equal the outcome of: `100vh - (3rem + 40px)`.
To put it another way:  `main = 100vh - (header + footer)`.
`calc()` is handling the math for us even though we are mixing vh, rem and px units.
Combined with CSS variables, `calc()` can save us from the headache of repeating CSS rules.

**Note:** The above is just an example of how `calc()` can affect a layout, but keep in mind that `calc()` is likely not the best way to go about it. We will talk more about layouts in future lessons.

I encourage you to take a moment and edit the codepen. Play around with the different units and sizes of the elements by clicking here: <a href="https://codepen.io/TheOdinProjectExamples/pen/OJxNxya" target="_blank"><img src="https://i.imgur.com/W8SfelB.png" alt="editCodePen"></a>

#### min()

`min()` does an excellent job of helping us create responsive websites. Take a look at this example:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="RwLaLay" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/RwLaLay">
  min() | CSS Functions</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

~~~css
#odinPicture {
  max-height: 150px;
  width: min(150px, 100%);
}
~~~

Focus on this line `width: min(150px, 100%);` we can make several observations:
If there are `150px` available to the image, it will take up all `150px`.
If there are not `150px` available, the image will switch to `100%` of the parent's width.
<br>You are able to do basic math inside a `min ( )` => for example: `width: min(80ch, 100vw - 2rem);`

#### max()

Max works the same way as min, only in reverse. It will select the largest possible value from within the parentheses.

The max function is most useful when the viewing window is either exceptionally large, or the user increases the content size by using the browser’s zoom feature. Specifying the maximum possible size of a given element, for example, will prevent that element from infinitely filling the page as it expands.

Consider the following property of a given element:

~~~css
width: max(100px, 1rem, 4em, 50%)
~~~

From this list of given sizes, max will select the largest that will possibly fit within the viewing window.

You may not find a lot of use for max at first, but it is good tool to be aware of for projects where accessibility is important.

#### clamp()

`clamp()` is a great way to make elements fluid and responsive.
`clamp()` takes 3 values.
`font-size: clamp(320px, 80vw, 60rem);`

1. `the smallest value`, 2. `the ideal value`, 3. `the largest value`

You can find more about clamp from this interactive website [here](https://web.dev/min-max-clamp/).

### Assignment

<div class="lesson-content__panel" markdown="1">
[Take a look at the complete list](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Functions) of all CSS functions and how they are used so you have an idea of what is possible.
</div>

### Additional Resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

[Check out this article](https://web.dev/min-max-clamp/) for a more in-depth look `min`, `max`, and `clamp` in action, with animated examples.

[This article](https://moderncss.dev/practical-uses-of-css-math-functions-calc-clamp-min-max/) contains some specific use cases for all four functions, including color palette generation, background size responsiveness, and accessibility settings.

### Knowledge Check

- What are the four CSS math functions we covered above?
- How do we use CSS math functions in our CSS?
- How can CSS functions help make websites and applications more responsive?
