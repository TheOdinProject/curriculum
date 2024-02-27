### Introduction

The first step to making responsive websites is using techniques that are *naturally* flexible. In a later lesson you'll learn how to completely rearrange items on a page based on screen size, but in most cases, it's preferable to rely on tools like flexbox and grid to make your pages work on a wide range of screens first.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn a few tips for keeping your sites naturally responsive.

Plain HTML, with no CSS is responsive. [Make sure to read the page](https://codyloyd.github.io/responsive-html/), and shrink your browser down to the size of a phone. It works perfectly! You could read that site on an apple watch.

It's not realistic for every website you create to be as basic as plain text on a page, but it is important to keep in mind that most of the elements you're using to build your project are responsive until **you** change that with CSS. If you approach your project with this mindset and do your best to maintain that natural responsiveness, you might find that there isn't *that* much extra you need to do to make your sites properly responsive.

The rest of this lesson is a list of tips you can use to maintain natural responsiveness.

### The viewport meta tag

When mobile phones first started getting web browsers, most websites were *not* optimized for such small screen resolutions. To get around this, most phone browsers simulated a larger screen and displayed a zoomed-out version of the page. These days, however, we almost never want that behavior so we have to specify that we want our websites to be viewed at the actual non-zoomed screen resolution.

For this reason, you should add this snippet into the `<head>` of your HTML file in just about every project you work on.

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

It sets the initial width of the webpage to the size of the actual screen you're viewing it on, and telling it not to zoom in or out. Easy!

### Avoid fixed width and height

The number one enemy of flexibility is a fixed width on an element. If you put `width: 600px` on anything, then it will never be able to shrink below that width, which ruins your chances of getting that thing to fit on most phone screens. Likewise, sticking a fixed height on an element can cause issues if the contents of that element run out of room.

Obviously the context will determine what works in a given situation, but an easy fix in many cases is replacing `width` or `height` with `max-width` or `min-height` (`min-width` and `max-height` are also valid and may be useful depending on the context).

In the following example, notice how the <span id='fixed-width'>fixed width</span> causes our div to overflow the screen! Change it to `max-width` and watch it shrink down to fit the preview screen! Click 'Fork on CodePen', then 'Save', and navigate to the 'Open Live View in a New Window' icon at the bottom to see it in full window size. Try changing the size of the window to see how `max-width` works. When a `max-width` is defined, the element will not exceed that width but will shrink if the screen is too small to accommodate it.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="GRMpreM" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/GRMpreM">
  max-width | CSS Responsiveness</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

This example shown below demonstrates the problem with <span id='fixed-height'>static heights.</span> On a full-sized screen the text would fit inside the pink box just fine, but here on this cramped embed, it overflows! What we want here is for the div to be `300px` in most cases, but to grow instead of causing an overflow when the text gets cramped. In this case changing `height: 300px` to `min-height: 300px` will fix the issue.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="qBjxVYg" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/qBjxVYg">
  height | CSS Responsiveness</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Avoid heights altogether

In *most* cases, you should avoid setting a height altogether. There are some exceptions to this rule (headers and footers perhaps) but you should prefer using margin and padding to increase space around your content. Using margin and padding will keep your elements flexible no matter what the content inside does.

#### When fixed widths are appropriate

Obviously there are cases when a fixed width is appropriate. It's hard to make a universal rule, but in general the smaller your widths the more likely it's fine to make them fixed. For example, a `32px` icon on your page isn't going to benefit from using `max-width` because you probably *don't* want it to shrink. Likewise a `250px` sidebar probably needs to *always* be `250px`. As with anything you just need to consider your options and pick what seems to be the most appropriate.

### Use flex and grid

Here's a statement so obvious that it sounds like a joke: flexbox was *created* to enable the creation of flexible layouts. Using flex and grid doesn't necessarily guarantee perfect responsiveness, but they are really helpful tools. You've already learned about the relevant properties here, but things like `flex-wrap` and grid's `minmax`, `auto-fill` and similar properties can make some impressively responsive layouts without much extra work.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read ["Using the viewport meta tag"](https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag) on MDN to get a little more background and detail about the viewport meta tag and the nature of screen resolutions.
2. [Using Percentages in CSS](https://codyloyd.com/2021/percentages/) is an article that tackles another common pitfall.
3. [minmax() in auto-fill repeating tracks](https://gridbyexample.com/examples/example28/) demonstrates a really nice responsive grid feature.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [Why should you avoid fixed width?](#fixed-width)
- [Why should you avoid fixed height?](#fixed-height)
- [In what situations might it be appropriate to use a fixed height or width?](#when-fixed-widths-are-appropriate)
- [Why should you avoid percentages?](https://codyloyd.com/2021/percentages/)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [This free course on Conquering Responsive Layouts](https://courses.kevinpowell.co/conquering-responsive-layouts) by Kevin Powell provides great practice to work on your responsive layout chops.  
