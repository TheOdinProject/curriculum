### Introduction

HTML (HyperText Markup Language) defines the structure and content of webpages. We use HTML elements to create all of the paragraphs, headings, lists, images, and links that make up a typical webpage. In this lesson, we will explore how HTML elements work.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain what HTML Tags are.
- Explain what HTML elements are.

### Elements and tags

Almost all elements on an HTML page are just pieces of content wrapped in opening and closing HTML tags.

Opening tags tell the browser this is the start of an HTML element. They are comprised of a keyword enclosed in angle brackets `<>`. For example, an opening paragraph tag looks like this: `<p>`.

Closing tags tell the browser where an element ends. They are almost the same as opening tags; the only difference is that they have a forward slash before the keyword. For example, a closing paragraph tag looks like this: `</p>`.

A full paragraph element looks like this:

```html
<p>some text content</p>
```

Let's break this down:

- `<p>` is the opening tag.
- `some text content` represents content wrapped within the opening and closing tags.
- `</p>` is the closing tag.

You can think of elements as containers for content. The opening and closing tags tell the browser what content the element contains. The browser can then use that information to determine how it should interpret and format the content.

HTML has a [vast list of predefined tags](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) that you can use to create all kinds of different elements. It is important to use the correct tags for content. Using the correct tags can have a big impact on two aspects of your sites: how they are ranked in search engines; and how accessible they are to users who rely on assistive technologies, like screen readers, to use the internet.

Using the correct elements for content is called semantic HTML. We will explore this in much more depth later on in the curriculum.

### Void Elements
Some HTML elements do not have a closing tag. These elements just have a single tag, like: `<br>` or `<img>`. They are known as void elements because they are void of any content, there is nothing inside of them. No closing tag means they can't wrap content like other tags do.

You might also see these referred to as self closing tags. But those are just void elements with a forward slash(/) at the end like: `<br />` or `<img />`. You're likely to see self-closing tags used often for historical reasons. Browsers will be able to render them just fine, but the latest version of the HTML specification discourages their use and considers them invalid.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [Watch Kevin Powell's Introduction to HTML Video](https://www.youtube.com/watch?v=LGQuIIv2RVA&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-)

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [What is an HTML tag?](#elements-and-tags)
- [What are the three parts of an HTML element?](#elements-and-tags)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- [Don't Fear the Internet's video about HTML](http://www.dontfeartheinternet.com/02-html)
