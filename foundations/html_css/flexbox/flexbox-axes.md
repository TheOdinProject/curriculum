### Introduction

Let's see how the orientation of items within a flex container can be controlled using the `flex-direction` property.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

-   You'll learn about the 2 "axes" of a flex container.
-   You'll learn how to change those axes to arrange your content in columns instead of rows.

The most confusing thing about flexbox is that it can work either horizontally or vertically, and some rules change a bit depending on which direction you are working with.

The default direction for a flex container is horizontal, or `row`, <span id='flex-vertical'>but you can change the direction to vertical, or `column`. The direction can be specified in CSS like so:
</span>

~~~css
.flex-container {
  flex-direction: column;
}
~~~

### Axes

<span id='flex-axes'>No matter which direction you're using, you need to think of your flex-containers as having 2 axes: the main axis and the cross axis. It is the direction of these axes that changes when the `flex-direction` is changed. In _most_ circumstances, `flex-direction: row` puts the main axis horizontal (left-to-right), and `column` puts the main axis vertical (top-to-bottom).</span>

In other words, in our very first example, we put `display: flex` on a div and it arranged its children horizontally. This is a demonstration of `flex-direction: row`, the default setting. The following example is very similar. If you uncomment the line that says `flex-direction: column`, those divs will stack vertically.

<p class="codepen" data-height="400" data-default-tab="html,result" data-slug-hash="BaZKPdw" data-editable="true" data-user="TheOdinProjectExamples" style="height: 400px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen [flex-direction example](https://codepen.io/TheOdinProjectExamples/pen/BaZKPdw) by TheOdinProject ([@TheOdinProjectExamples](https://codepen.io/TheOdinProjectExamples))
  on [CodePen](https://codepen.io).</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

One thing to note is that in this example, `flex-direction: column` would not work as expected if we used the shorthand `flex: 1`. Try it out now (i.e. go change the flex value on the `flex: 1 1 auto;` line). Can you figure out why it does not work if `flex: 1` is used? The divs collapse, even though they _clearly_ have a `height` defined there.

The reason for this is that the <span id='row-flex-basis'> flex shorthand expands `flex-basis` to `0`, which means that all `flex-grow`ing and `flex-shrink`ing would begin their calculations from `0`.</span> Empty divs by default have 0 height, so for our flex items to fill up the height of their container, they don't actually need to have any height at all.

The example above fixed this by specifying `flex: 1 1 auto`, telling the flex items to default to their given `height`. We could also have fixed it by putting a height on the parent `.flex-container`, or by using `flex-grow: 1` instead of the shorthand.

Another detail to notice: when we changed the <span id='column-flex-basis'>flex-direction to `column`, `flex-basis` refers to `height` instead of `width`.</span> Given the context this may be obvious, but it's something to be aware of.

We've strayed from the point slightly... We were talking about flex-direction and axes. To bring it back home, the default behavior is `flex-direction: row` which arranges things horizontally. The reason this often works well without changing other details in the CSS is because block-level elements default to the full width of their parent. Changing things to vertical using `flex-direction: column` adds complexity because block-level elements default to the height of their content, and in this case there _is_ no content.

> There are situations where the behavior of flex-direction could change if you are using a language that is written top-to-bottom or right-to-left, but you should save worrying about that until you are ready to start making a website in Arabic or Hebrew.

For an interactive demo of how axes work with flexbox, check out this Scrim:

<iframe src="https://scrimba.com/learn/flexbox/main-axis-and-cross-axis-flexbox-tutorial-cz94MT8?embed=odin,mini-header,no-big-play,no-next-up" sandbox="allow-scripts allow-same-origin allow-popups" width="100%" height="400"></iframe>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

-   [How do you make flex items arrange themselves vertically instead of horizontally?](#flex-vertical)
-   [In a `column` flex-container, what does `flex-basis` refer to?](#column-flex-basis)
-   [In a `row` flex-container, what does `flex-basis` refer to?](#row-flex-basis)
-   [Why do the previous two questions have different answers?](#flex-axes)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   [This flexbox visual cheatsheet](https://flexbox.malven.co/) has some useful references to flex and its properties.
