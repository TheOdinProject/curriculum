### Introduction

As you'll learn, there are _many_ ways to move elements around on a web page. Over the years, new methods have been developed, and older things have fallen out of style. Flexbox is a [relatively new](https://medium.com/@BennyOgidan/history-of-css-grid-and-css-flexbox-658ae6cfe6d2) way of manipulating elements in CSS, and when introduced, it was _revolutionary_.

Because it is somewhat new as a technology, many resources put it near the end of their curriculum. But at this point, it has become the default way of positioning elements for many developers. Flexbox will be one of the most used tools in your toolbox, so why not learn it first?

### Learning Outcomes

In the following lessons: 

*   You will learn how to position elements using flexbox.
*   You will learn about flex containers and flex items.
*   You will learn how to create useful components and layouts that go beyond just stacking and centering items.

### Before we get started

Flexbox layouts can get a little complicated. In a previous lesson, you learned how to inspect and debug things using your browser's developer tools. Those tools will be _crucial_ for you in the following lessons. If something isn't behaving the way you expect, inspecting it in the developer tools should be your first step _every time_.

### Let's Flex!

Flexbox is a way to arrange items into rows or columns. These items will flex (i.e. grow or shrink) based on some simple rules that you can define. To get started, let's look at a simple demonstration. For all the exercises here, take your time to inspect the code and really understand what's going on. In fact, playing with the code yourself will make it much easier to retain this information.

<p class="codepen" data-height="400" data-default-tab="html,result" data-slug-hash="QWgNxrp" data-editable="true" data-user="TheOdinProjectExamples" style="height: 400px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/QWgNxrp">
  first flex example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

We'll get into exactly what's going on here soon enough. But for now, uncomment the two flex related lines in the above CSS and check out the result. All 3 divs should now be arranged horizontally. If you resize the results frame with the "1x", ".5x" and ".25x" buttons you'll also see that the divs will 'flex'. They will fill the available area and will each have equal width.

If you add another div to the HTML, inside of `.flex-container`, it will show up alongside the others, and everything will flex to fit within the available area.

> #### Note
> If it's hard to see what's going on in the small embedded CodePen, feel free to click the "Edit on CodePen" or "Fork on CodePen" button. This will bring the example into a full-sized environment. Some of the later examples might especially benefit from doing this.

#### Flex Containers and Flex Items

As you've seen, flexbox is not just a single CSS property but a whole toolbox of properties that you can use to put things where you need them. Some of these properties belong on the _flex container_, while some go on the _flex items_. This is a simple yet important concept.

<span id="flex-container-item-knowledge-check">A flex container is any element that has `display: flex` on it. A flex item is any element that lives directly inside of a flex container.</span>

<span id="how-to-create-flex-item-knowledge-check">![container-vs-child](https://cdn.statically.io/gh/TheOdinProject/curriculum/495704c6eb6bf33bc927534f231533a82b27b2ac/html_css/v2/foundations/flexbox/imgs/03.png)</span>

Somewhat confusingly, any element can be both a flex container _and_ a flex item. Said another way, you can also put `display: flex` on a flex item and then use flexbox to arrange _its_ children.

![nesting flex containers](https://cdn.statically.io/gh/TheOdinProject/curriculum/495704c6eb6bf33bc927534f231533a82b27b2ac/html_css/v2/foundations/flexbox/imgs/04.png)

Creating and nesting multiple flex containers and items is the primary way we will be building up complex layouts. The following image was achieved using _only_ flexbox to arrange, size, and place the various elements. Flexbox is a _very_ powerful tool.

![complex example](https://cdn.statically.io/gh/TheOdinProject/curriculum/495704c6eb6bf33bc927534f231533a82b27b2ac/html_css/v2/foundations/flexbox/imgs/05.png)

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

*   <a class="knowledge-check-link" href="#flex-container-item-knowledge-check">What's the difference between a flex container and a flex item?</a>
*   <a class="knowledge-check-link" href="#how-to-create-flex-item-knowledge-check">How do you create a flex item?</a>
