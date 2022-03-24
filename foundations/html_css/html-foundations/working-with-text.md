### Introduction

Most content on the web is text-based, so you will find yourself needing to work with HTML text elements quite a bit.

In this lesson, we will learn about the text-based elements you are likely to use the most.

### Learning Outcomes

- How to create paragraphs
- How to create headings
- How to create bold text
- How to create italicized text
- The relationships between nested elements
- How to create HTML comments

### Paragraphs

What would you expect the following text to output on an HTML page?

~~~html
<body>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua.

  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
  nisi ut aliquip ex ea commodo consequat.
</body>
~~~

It looks like two paragraphs of text, and so you might expect it to display in that way. However that is not the case, as you can see in the output below:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="xxrKqeV" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/xxrKqeV">
  no-paragraphs-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>


When the browser encounters new lines like this in your HTML, it will compress them down into one single space. The result of this compression is that all of the text is clumped together into one long line.

If we want to create paragraphs in HTML, <span id='create-paragraph-element'>we need to use the paragraph element</span>, which will add a newline after each of our paragraphs. A paragraph element is defined by wrapping text content with a `<p>` tag.

Changing our example from before to use paragraph elements fixes the issue:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="mdwbmdp" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/mdwbmdp">
  pargraph-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Headings

Headings are different from other HTML text elements: they are displayed larger and bolder than other text to signify that they are headings.

<span id='different-heading-levels'>There are 6 different levels of headings starting from `<h1>` to `<h6>`. The number within a heading tag represents that heading's level. h1 is the most important and is larger than the other headings, and h6 is the lowest level and therefore the smallest of the headings.</span>

Headings are defined much like paragraphs. For example, to create an h1 heading, we wrap our heading text in a `<h1>` tag.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="LYLPLbg" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/LYLPLbg">
  html-headings-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Using the correct level of heading is important as levels provide a hierarchy to the content. An h1 heading should always be used for the heading of the overall page, and the lower level headings should be used as the headings for content in smaller sections of the page.

### Strong Element

The `<strong>` element makes text bold. It also semantically marks text as important; this affects tools, like screen readers, that users with visual impairments will rely on to use your website. The tone of voice on a screen reader will change to communicate the importance of the text within a strong element. To define a strong element we wrap text content in a `<strong>` tag.

You can use strong on its own:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="qBjWXrB" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/qBjWXrB">
  html-single-strong-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

But you will probably find yourself using the strong element much more in combination with other text elements, like this:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="wvewqJr" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/wvewqJr">
  html-strong-with-paragraph-exmample</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Sometimes you will want to make text bold without giving it an important meaning. You'll learn how to do that in the CSS lessons later in the curriculum.

### Em Element

The em element makes text italic. It also semantically places emphasis on the text, which again affects things like screen readers. To define an emphasised element we wrap text content in a `<em>` tag.

To use em on its own:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="wvewqpp" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/wvewqpp">
  html-single-em-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Again, like the strong element, you will find yourself mostly using the em element with other text elements:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="VwWZzyj" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/VwWZzyj">
  html-em-with-paragraph-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Nesting and Indentation

You may have noticed that in all the examples in this lesson we indent any elements that are within other elements. This is known as nesting elements.

<span id='nested-relationship'>When we nest elements within other elements, we create a parent and child relationship between them. The nested elements are the children and the element they are nested within is the parent.</span>

In the following example, the body element is the parent and the paragraph is the child:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="oNwjEvO" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/oNwjEvO">
  html-nesting-parent-child</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Just as in human relationships, HTML parent elements can have many children.  <span id='elements-same-level'>Elements at the same level of nesting are considered to be siblings.</span>

For example, the two paragraphs in the following code are siblings, since they are both children of the body tag and are at the same level of nesting as each other:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="ZEybrYx" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/ZEybrYx">
  html-nesting-siblings</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

We use indentation to make the level of nesting clear and readable for ourselves and other developers who will work with our HTML in the future. It is recommended to indent any child elements by two spaces.

The parent, child, and sibling relationships between elements will become much more important later when we start styling our HTML with CSS and adding behavior with JavaScript. For now, however, it is just important to know the distinction between how elements are related and the terminology used to describe their relationships.

### HTML Comments

HTML comments are not visible to the browser; they allow us to *comment* on our code so that other developers or our future selves can read them and get some context about something that might not be clear in the code.

Writing an HTML comment is simple: we just put `<!--` and `-->` at either end of the comment. For example:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="abwoyBg" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/abwoyBg">
  html-comments-example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Watch Kevin Powell's [HTML Paragraph and Headings Video](https://www.youtube.com/watch?v=yqcd-XkxZNM&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=3)
2. Watch Kevin Powell's [HTML Bold and Italic Text Video](https://www.youtube.com/watch?v=gW6cBZLUk6M&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=4)
3. To get some practice working with text in HTML, create a plain blog article page which uses different headings, uses paragraphs, and has some text in the paragraphs bolded and italicized. You can use [Lorem Ipsum](https://loremipsum.io/) to generate dummy text, in place of real text as you build your sites.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.
 
- <a class="knowledge-check-link" href='#create-paragraph-element'>How do you create a paragraph in HTML?</a>
- <a class="knowledge-check-link" href='#headings'>How do you create a heading in HTML?</a>
- <a class="knowledge-check-link" href='#different-heading-levels'>How many different levels of headings are there and what is the difference between them?</a>
- <a class="knowledge-check-link" href='#strong-element'>What element should you use to make text bold and important?</a>
- <a class="knowledge-check-link" href='#em-element'>What element should you use to make text italicized to add emphasis to it?</a>
- <a class="knowledge-check-link" href='#nested-relationship'>What relationship does an element have with any nested elements within it?</a>
- <a class="knowledge-check-link" href='#elements-same-level'>What relationship do two elements have if they are at the same level of nesting?</a>
- <a class="knowledge-check-link" href='#html-comments'>How do you create HTML comments?</a>
<br />