### Introduction
The MDN box model article linked in the previous lesson mentions that different display types have subtly different box models, and that you can change how a box is calculated by changing the `display` property. We will explore the different display values you can use further in this lesson.

### Learning Outcomes
* You'll learn about "Normal flow."
* You'll learn the difference between `block` and `inline` elements.
* You'll learn which elements default to `block` and which elements default to `inline`.
* You'll learn what divs and spans are

### Block vs Inline
Most of the elements that you have learned about so far are block elements.  In other words, their default style is `display: block`. <span id="block-inline-difference"></span>By default, block elements will appear on the page stacked atop each other, each new element starting on a new line.

Inline elements, however, do not start on a new line. They appear in line with whatever elements they are placed beside. A clear example of an inline element is a link, or `<a>` tag. If you stick one of these in the middle of a paragraph of text, it will behave like a part of the paragraph. ([Like this...](https://www.youtube.com/watch?v=dQw4w9WgXcQ)) The link's text will sit alongside other words in that paragraph. Additionally, padding and margin behave differently on inline elements. In general, you do not want to try to put extra padding or margin on inline elements.

Inline-block elements behave like inline elements, but with block-style padding and margin. Inline-block is a useful tool to know about, but in practice you'll probably end up reaching for flexbox more often if you're trying to line up a bunch of boxes. Flexbox will be covered in depth in the next lesson.

### Divs and Spans
We can't talk about block and inline elements without discussing divs and spans. All the other HTML elements we have encountered so far give meaning to their content. For example, paragraph elements tell the browser the text it contains is to be displayed as a paragraph, and strong elements tell the browser the text within is important etc. Divs and spans, on the other hand, give no particular meaning to their content. They are just generic boxes that can contain anything.

Having elements like this available to us is a lot more useful than it may first appear. We will often need elements that serve no other purpose than to be "hook" elements we can give an id or class so we can target them for styling with CSS. Another use case we will face regularly is grouping related elements under one parent element to position them on the page correctly. Divs and spans provide us with the ability to do this.

Div is a block-level element by default. It is commonly used as a container element to group other elements. Divs allows us to _divide_ the page into different blocks and apply styling to those blocks.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="KKXXbwR" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/KKXXbwR">
  block-inline-lesson-div-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Span is an inline-level element by default. It is commonly used to group text content and inline HTML elements so we can apply styling to them.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="abLLPor" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/abLLPor">
  Untitled</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

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
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* [This tutorial](https://learnlayout.com/no-layout.html) is a little dated at this point, but its examples are clear. The first 6 slides cover the material we've seen so far.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* <a class="knowledge-check-link" href="#block-inline-difference">What is the difference between a block element and an inline element?</a>
* <a class="knowledge-check-link" href="https://www.samanthaming.com/pictorials/css-inline-vs-inlineblock-vs-block/">What is the difference between an inline element and an inline-block element?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/html/html_blocks.asp">Is an `h1` block or inline?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/html/html_blocks.asp">Is `button` block or inline?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/html/html_blocks.asp">Is `div` block or inline?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/html/html_blocks.asp">Is `span` block or inline?</a>
