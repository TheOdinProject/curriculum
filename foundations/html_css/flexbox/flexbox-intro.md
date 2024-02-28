### Introduction

As you'll learn, there are _many_ ways to move elements around on a web page. New methods have been developed over the years and older things have fallen out of style. Flexbox is a [relatively new](https://medium.com/@BennyOgidan/history-of-css-grid-and-css-flexbox-658ae6cfe6d2) way of manipulating elements in CSS, and its debut was _revolutionary_.

Many resources put it near the end of their curriculum because it is somewhat new as a technology. But at this point, it has become the default way of positioning elements for many developers. Flexbox will be one of the most used tools in your toolbox, so why not learn it first?

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

-   You will learn how to position elements using flexbox.
-   You will learn about flex containers and flex items.
-   You will learn how to create useful components and layouts that go beyond just stacking and centering items.

### Before we get started

Flexbox layouts can get a little complicated. In a previous lesson, you learned how to inspect and debug things using your browser's developer tools. Those tools will be _crucial_ for you in the following lessons. If something isn't behaving the way you expect, inspecting it in the developer tools should be your first step _every time_.

Flexbox isn't necessarily any more difficult than the other concepts that we've covered so far, but it _does_ have a few more moving parts. It is going to be somewhat difficult to make use of any of the things you're learning in these first lessons until you get to the end and can put it all together. As we go, do yourself a favor and **play with all of the code examples.**

You will almost definitely need to come back and reference these lessons (or a couple of the resources we share with you) when you get to the assignments at the end of the section, but if you take your time and experiment with all the code examples we provide, you'll know better where to look when that time comes.

### Let's flex!

Flexbox is a way to arrange items into rows or columns. These items will flex (i.e. grow or shrink) based on some rules that you can define. To get started, let's look at a demonstration.

<div class="lesson-note" markdown="1">

We've embedded a lot of interactive examples in these lessons. Take your time to experiment with them as you go to cement the concepts in your mind!

</div>

<p class="codepen" data-height="400" data-default-tab="html,result" data-slug-hash="QWgNxrp" data-editable="true" data-user="TheOdinProjectExamples" style="height: 400px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/QWgNxrp">
  first flex example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

We'll get into exactly what's going on here soon enough. But for now, let's uncomment the two flex related CSS declarations in the above Codepen by removing the `/*` and `*/` tags surrounding them, then check out the result.

<div class="lesson-note" markdown="1">

Comments prevent the browser from interpreting lines as code, and are wrapped between specific tags. CSS uses `/*`as an opening comment tag and `*/` as a closing comment tag, while HTML and JavaScript have their own syntax. Commented out lines of code can be 're-enabled' by removing the comment tags surrounding the code.

</div>

All 3 divs should now be arranged horizontally. If you resize the results frame with the "1x", ".5x" and ".25x" buttons you'll also see that the divs will 'flex'. They will fill the available area and will each have equal width.

If you add another div to the HTML, inside of `.flex-container`, it will show up alongside the others, and everything will flex to fit within the available area.


<div class="lesson-note" markdown="1">

If it's hard to see what's going on in the small embedded CodePen, feel free to click the "Edit on CodePen" or "Fork on CodePen" button. This will bring the example into a full-sized environment. Some of the later examples might especially benefit from doing this.

</div>

#### Flex containers and flex items

As you've seen, flexbox is not just a single CSS property but a whole toolbox of properties that you can use to put things where you need them. Some of these properties belong on the _flex container_, while some go on the _flex items_. This is an important concept.

<span id="flex-container-item-knowledge-check">A flex container is any element that has `display: flex` on it. A flex item is any element that lives directly inside of a flex container.</span>

<span id="how-to-create-flex-item-knowledge-check">![container-vs-child](https://cdn.statically.io/gh/TheOdinProject/curriculum/8c0402439e1b0a9a156731bdab4ea64162688dab/foundations/html_css/flexbox/imgs/03.png)</span>

Somewhat confusingly, any element can be both a flex container _and_ a flex item. Said another way, you can also put `display: flex` on a flex item and then use flexbox to arrange _its_ children.

![nesting flex containers](https://cdn.statically.io/gh/TheOdinProject/curriculum/495704c6eb6bf33bc927534f231533a82b27b2ac/html_css/v2/foundations/flexbox/imgs/04.png)

Creating and nesting multiple flex containers and items is the primary way we will be building up complex layouts. The following image was achieved using _only_ flexbox to arrange, size, and place the various elements. Flexbox is a _very_ powerful tool.

![complex example](https://cdn.statically.io/gh/TheOdinProject/curriculum/495704c6eb6bf33bc927534f231533a82b27b2ac/html_css/v2/foundations/flexbox/imgs/05.png)

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

-   [What's the difference between a flex container and a flex item?](#flex-container-item-knowledge-check)
-   [How do you create a flex item?](#how-to-create-flex-item-knowledge-check)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

* [This Flexbox tutorial](https://internetingishard.netlify.app/html-and-css/flexbox/index.html) is a friendly tutorial for modern CSS layouts by Interneting Is Hard.

* For a more interactive explanation and example, try this [Scrim on Flexbox](https://scrimba.com/learn/flexbox/your-first-flexbox-layout-flexbox-tutorial-canLGCw). Note that this Scrim requires logging into Scrimba in order to view.
