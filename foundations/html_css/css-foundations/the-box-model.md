### Introduction

Now that you understand the basic syntax of HTML and CSS, we're going to get serious. The most important skills you need to master with CSS are *positioning* and *layout*. Changing fonts and colors is a crucial skill, but being able to put things exactly where you want them on a webpage is even more crucial. After all, how many webpages can you find where absolutely every element is just stacked one on top of another?

Learning to position elements on a webpage is not that difficult once you understand just a few key concepts. Unfortunately, many learners race through learning HTML and CSS to get to JavaScript and end up missing these fundamental concepts. This leads to frustration, pain, ([and funny gifs](https://giphy.com/gifs/css-13FrpeVH09Zrb2)) because all the JavaScript skills in the world are meaningless if you can't stick your elements on the page where you need them to be. So with that in mind, let's get started.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn all about *the box model*.
- You'll learn how to make sure elements are just the right size with `margin`, `padding`, and `borders`.

### The box model

The first important concept that you need to understand to be successful in CSS is the box model. It isn't complicated, but skipping over it now would cause you much frustration down the line.

Every single thing on a webpage is a rectangular box. These boxes can have other boxes in them and can sit alongside one another. You can get a rough idea of how this works by applying an outline to every element on the page like this:

```css
* {
  outline: 2px solid red;
}
```

![boxes](https://cdn.statically.io/gh/TheOdinProject/curriculum/main/foundations/html_css/css-foundations/the-box-model/imgs/boxes.png)

You can use the browser's inspector to add the CSS above to this web page if you want. Boxes in boxes!

![lines](https://cdn.statically.io/gh/TheOdinProject/curriculum/main/foundations/html_css/css-foundations/the-box-model/imgs/odin-lined.png)

OK, so there might be some circles in the above image... but when it comes to layout, they fit together like rectangular boxes and not circles. In the end, laying out a webpage and positioning all its elements is deciding how you are going to nest and stack these boxes.

The only real complication here is that there are many ways to manipulate the size of these boxes, and the space between them, using `padding`, `margin`, and `border`. The assigned articles go into more depth on this concept, but to sum it up briefly:

- `padding` increases the space between the border of a box and the content of the box.
- `margin` increases the space between the borders of a box and the borders of adjacent boxes.
- `border` adds space (even if it's only a pixel or two) between the margin and the padding.

Be sure to study the diagrams carefully.

![the box model](https://cdn.statically.io/gh/TheOdinProject/curriculum/main/foundations/html_css/css-foundations/the-box-model/imgs/box-model.png)

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [This video](https://www.youtube.com/watch?v=rIO5326FgPE) is a straightforward overview of the box model, padding and margin. Go ahead and watch this now; it informs everything else.
1. Because the box model concept is so incredibly fundamental, let's dig a bit deeper with [this lesson from MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model). It covers the same material as the video above and will introduce you to inline boxes that we will explore in the next lesson. Pay close attention to the examples and take the time to experiment with their in-browser editor!
1. [This CSS Tricks page](https://css-tricks.com/almanac/properties/m/margin/) has some further information about the `margin` property that you'll find useful. Specifically, the sections about `auto` and margin collapsing contain things you'll want to know.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [From inside to outside, what is the order of box-model properties?](#the-box-model)
- [What does the `box-sizing` CSS property do?](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model#the_alternative_css_box_model)
- [What is the difference between the standard and alternative box model?](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model#the_alternative_css_box_model)
- [Would you use `margin` or `padding` to create more space between 2 elements?](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model#margins_padding_and_borders)
- [Would you use `margin` or `padding` to create more space between the contents of an element and its border?](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model#margins_padding_and_borders)
- [Would you use `margin` or `padding` if you wanted two elements to overlap each other?](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model#margins_padding_and_borders)
- [How do you set the alternative box model for all of your elements?](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model#the_alternative_css_box_model)
- [How do you center an element horizontally?](https://css-tricks.com/almanac/properties/m/margin/#aa-auto-and-centering)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- For a more interactive explanation and example, try this [Scrim on the box model](https://scrimba.com/scrim/cof3d488184abe24ec6258ab4).
