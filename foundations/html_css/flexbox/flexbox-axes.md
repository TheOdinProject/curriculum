### Learning Outcomes
* You'll learn about the 2 "axes" of a flex container.
* You'll learn how to change those axes to arrange your content in columns instead of rows.

The most confusing thing about flexbox is that it can work either horizontally or vertically, and the way some rules work changes a bit depending on which direction you are working with.

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
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/BaZKPdw">
  flex-direction example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

One thing to note is that in this example, `flex-direction: column` would not work as expected if we used the shorthand `flex: 1`. Try it out now (i.e. go change the flex value on the `flex: 1 1 auto;` line). Can you figure out why it does not work if `flex: 1` is used? The divs collapse, even though they _clearly_ have a `height` defined there.

The reason for this is that the <span id='row-flex-basis'> flex shorthand expands `flex-basis` to `0`, which means that all `flex-grow`ing and `flex-shrink`ing would begin their calculations from `0`.</span> Empty divs by default have 0 height, so for our flex items to fill up the height of their container, they don't actually need to have any height at all.

The example above fixed this by specifying `flex: 1 1 auto`, telling the flex items to default to their given `height`. We could also have fixed it by putting a height on the `.flex-container`, or by using `flex-grow: 1` instead of the shorthand.

Another detail to notice: when we changed the <span id='column-flex-basis'>flex-direction to `column`, `flex-basis` referred to `height` instead of `width`.</span> Given the context this may be obvious, but it's something to be aware of.

We've strayed from the point slightly... We were talking about flex-direction and axes. To bring it back home, the default behavior is `flex-direction: row` which arranges things horizontally. The reason this often works well without changing other details in the CSS is because block-level elements default to the full width of their parent. Changing things to vertical using `flex-direction: column` adds complexity because block-level elements default to the height of their content, and in this case there _is_ no content.

> There are situations where the behavior of flex-direction could change if you are using a language that is written top-to-bottom or right-to-left, but you should save worrying about that until you are ready to start making a website in Arabic or Hebrew.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='#flex-vertical'>How do you make flex items arrange themselves vertically instead of horizontally?</a>
- <a class="knowledge-check-link" href='#column-flex-basis'>In a `column` flex-container, what does `flex-basis` refer to?</a>
- <a class="knowledge-check-link" href='#row-flex-basis'>In a `row` flex-container, what does `flex-basis` refer to?</a>
- <a class="knowledge-check-link" href='#flex-axes'>Why do the previous two questions have different answers?</a>
