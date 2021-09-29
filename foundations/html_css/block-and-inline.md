### Learning Outcomes
* You'll learn about "Normal flow"
* You'll learn the difference between `block` and `inline` elements.
* You'll learn which elements default to `block` and which elements default to `inline`

### Block vs Inline
The MDN box-model article linked in the previous lesson mentions that different display types have subtly different box models, and that you can change how a box is calculated by changing the `display` property.

Most of the elements that you have learned about so far are block elements.  In other words, their default style is `display: block`. By default, block elements will appear on the page stacked atop each other, each new element starting on a new line.

Inline elements, however, do not start on a new line. They appear in-line with whatever else they are placed beside. A clear example of an inline element is a link, or `<a>` tag. If you stick one of these in the middle of a paragraph of text, it will behave like a part of the paragraph. ([Like this...](https://www.youtube.com/watch?v=dQw4w9WgXcQ)) The link's text will sit alongside other words in that paragraph. Additionally, padding and margin behave differently on inline elements. In general you do not want to try to put extra padding or margin on inline elements.

Inline-block elements behave like inline elements, but with block-style padding and margin. Inline-block is a useful tool to know about, but in practice you'll probably end up reaching for flexbox more often if you're trying to line up a bunch of boxes. Flexbox will be covered in depth in the next lesson.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. The concept of "Normal flow" is implied in the box-model resources, but isn't laid out very specifically. Read ["Normal Flow" from MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Normal_Flow) to make sure you understand how elements lay themselves out by default.
2. W3 schools' ["HTML Block and Inline Elements"](https://www.w3schools.com/html/html_blocks.asp) has a description and a list of all the default block and inline elements.
3. The Digital Ocean tutorial ["Inline vs Inline-block Display in CSS"](https://www.digitalocean.com/community/tutorials/css-display-inline-vs-inline-block) has a couple of great examples that clarify the difference between `inline` and `inline-block`.
</div>

### Practice
<div class="lesson-content__panel" markdown="1">
1. Go to our [CSS exercises repository](https://github.com/TheOdinProject/css-exercises) and do "margin-and-padding-1" and "margin-and-padding-2".
</div>


### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something

* [This tutorial](https://learnlayout.com/no-layout.html) is a little dated at this point, but its examples are clear. The first 6 slides cover the material we've seen so far.

### Knowledge Check
* What is the difference between a block element and an inline element?
* What is the difference between an inline element and an inline-block element?
* What does the `box-sizing` css property do?
* Is an `h1` block or inline?
* Is `span` block or inline?
* Is `button` block or inline?
* Is `div` block or inline?
* Would you use `margin` or `padding` to create more space between 2 elements?
* Would you use `margin` or `padding` to create more space between the contents of an element and its border?
