### Introduction

In the previous lesson, we discovered that different display types have unique box models, and we can modify the box calculation by changing the `box-sizing` property. CSS has two box types: `block` and `inline` boxes, which determine element behavior and interaction. The `display` property controls how HTML elements appear on the webpage. We will explore its various options further in this lesson.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn about "Normal flow".
- You'll learn the difference between `block` and `inline` elements.
- You'll learn which elements default to `block` and which elements default to `inline`.
- You'll learn what divs and spans are.

### Block vs inline

Most of the elements that you have learned about so far are block elements.  In other words, their default style is `display: block`. <span id="block-inline-difference"></span>By default, block elements will appear on the page stacked atop each other, each new element starting on a new line.

Inline elements, however, do not start on a new line. They appear in line with whatever elements they are placed beside. A clear example of an inline element is a link, or `<a>` tag. If you stick one of these in the middle of a paragraph of text, [the link will behave like a part of the paragraph](https://www.youtube.com/watch?v=dQw4w9WgXcQ). Additionally, padding and margin behave differently on inline elements. In general, you do not want to try to put extra padding or margin on inline elements.

#### The middle ground inline-block

Inline-block elements behave like inline elements, but with block-style padding and margin. `display: inline-block` is a useful tool to know about, but in practice, you'll probably end up reaching for flexbox more often if you're trying to line up a bunch of boxes. Flexbox will be covered in-depth in the next lesson.

### Divs and spans

When building a web page, not every piece of content has a specific semantic tag. Sometimes, you just need a container you can style or position! That's where `div` and `span` come in.

A `div` is a generic **block-level** container. It behaves like a rectangular section that stretches across the full width of its parent and starts on a new line. Typically, developers use `div` to group related elements into larger chunks of the page, things like *cards*, *sections*, *sidebars*, or *navigation bars*.

In this case, wrapping content in a `div` and giving it a `class` or `id`, you create a convenient hook for CSS layout and styling!

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="KKXXbwR" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">

  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/KKXXbwR">
  block-inline-lesson-div-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>

</p>

<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

A `span` is a generic **inline** container. It sits inside a line of text and only takes up as much space as its content. Unlike `div`, it does **not** start on a new line. You use `span` when you want to style or target just part of a sentence.

For example, highlighting a single word or attaching a tooltip to a phrase. Again, you add a `class` or `id` so CSS can find and manipulate it.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="abLLPor" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">

  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/abLLPor">
  block-inline-lesson-span-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>

</p>

<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Neither `div` nor `span` adds meaning to the content the way semantic tags do, as they exist to give you flexible **building blocks**. The key difference is **how they behave in the layout**: `div` participates in the flow as a **block-level** element, while `span` behaves as an **inline** element.

Once you understand that, choosing between them becomes simple! You can use `div` when you're grouping and positioning **bigger blocks of content**, and use `span` when **you're styling or scripting small pieces** inside a line.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. The concept of "Normal flow" is implied in the box-model resources, but isn't laid out very specifically. Read ["Normal Flow" from MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Normal_Flow) to make sure you understand how elements lay themselves out by default.
1. W3 schools' ["HTML Block and Inline Elements"](https://www.w3schools.com/html/html_blocks.asp) has a description and a list of all the default block and inline elements.
1. The Digital Ocean tutorial ["Inline vs Inline-block Display in CSS"](https://www.digitalocean.com/community/tutorials/css-display-inline-vs-inline-block) has a couple of great examples that clarify the difference between `inline` and `inline-block`.
1. Do the exercises in our [CSS exercises repository's `foundations/block-and-inline` directory](https://github.com/TheOdinProject/css-exercises/tree/main/foundations/block-and-inline) (remember that the instructions are in the README) in the order:
   - `01-margin-and-padding-1`
   - `02-margin-and-padding-2`

   Note: Solutions for these exercises can be found in the `solution` folder of each exercise.
1. Remember the Recipe page you created as practice from the HTML Foundations section? Well, it's rather *plain* looking, isn't it? Let's fix that by adding some CSS to it!
   - How you actually style it is completely open, but you should use the external CSS method (for this practice and moving forward). You should also try to use several of the properties mentioned in the previous lesson (color, background color, typography properties, etc). Take some time to play around with the various properties to get a feel for what they do. For now, don't worry at all about making it look *good*. This is just to practice and get used to writing CSS, not to make something to show off on your resume.
   - We haven't covered how to use a custom font for the `font-family` property yet, so for now take a look at [CSS Fonts](https://www.w3schools.com/Css/css_font.asp) for a list of generic font families to use, and [CSS Web Safe Fonts](https://www.w3schools.com/cssref/css_websafe_fonts.asp) for a list of fonts that are web safe. Web safe means that these are fonts that are installed on basically every computer or device (but be sure to still include a generic font family as a fallback).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is the difference between a block element and an inline element?](#block-inline-difference)
- [What is the difference between an inline element and an inline-block element?](https://www.digitalocean.com/community/tutorials/css-display-inline-vs-inline-block)
- [Is an `h1` block or inline?](https://www.w3schools.com/html/html_blocks.asp)
- [Is `button` block or inline?](https://www.w3schools.com/html/html_blocks.asp)
- [Is `div` block or inline?](https://www.w3schools.com/html/html_blocks.asp)
- [Is `span` block or inline?](https://www.w3schools.com/html/html_blocks.asp)
