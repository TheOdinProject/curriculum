### Introduction

It's time to dive into the exciting world of CSS transitions and give your HTML elements some slick transformations!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What a CSS transition is and when to use it.
- Know what CSS properties are animatable and which ones are not.
- How to make sure your transitions are smooth and performant.

### Transitions

CSS transitions let you animate a change from an element's initial state to an end state. Think of an ordinary button element with a white background. When your mouse is away from the button, it's just sitting there. Boring. Then when you hover your mouse cursor over the button the background color smoothly transitions from white to grey to black over a period of time. This is a CSS transition. Have a look at the Codepen below to see one in action.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="eYGmYRm" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/eYGmYRm">
  CSS Transition (longhand)</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

When your mouse cursor is away from the button, the button is in the initial state. When you hover over it you introduce the end state, the hover state, causing the transition of the color smoothly fading from white to black to occur.

This was achieved using the `transition` property, which is actually a shorthand property for `transition-property`, `transition-duration`, `transition-timing-function` and `transition-delay`.

```css
button {
  /* ... other CSS properties ... */
  transition-property: background-color;
  transition-duration: 1s;
  transition-timing-function: ease-out;
  transition-delay: 0.25s;
}
```

- `transition-property` - This determines what CSS property will be transitioned. In this case it is the `background-color`.
- `transition-duration` - This determines the duration that the transition will occur over. In this case the color change will gradually happen over 1 second.
- `transition-timing-function` - This lets us change the speed of the transition over the course of its duration. Here it will `ease-out`, meaning the color change will be faster at the start than at the end of the transition.
- `transition-delay` - This determines the delay at which the transition will start. In this case, the color change starts a quarter of a second after the cursor rests on the button.

The shorthand property looks like this:

```css
button {
  /* ... other CSS properties ... */
  background-color: white;
  transition: background-color 1s ease-out 0.25s;
}

button:hover {
  background-color: black;
}
```

The above transition will occur when the user hovers their mouse over the button as indicated by the `:hover` pseudo-class. In addition to `:hover`, or any of the other pseudo-classes, you can also trigger transitions by adding or removing classes with JavaScript. For example, clicking a button could append the "open" class to a dropdown menu, which would trigger the opening transition.

### Performance

Generally, keeping your CSS transitions performant will not be an issue. However there are a couple of things you need to keep in mind.

The first is the "stacking context". Basically, a stacking context is formed when certain element scenarios are in place. A relevant scenario for us would be to transition a `transform` property like below:

```css
div {
  width: 100px;
  height: 100px;
  transition: transform 2s 1s; 
}

div:hover {
  transform: rotate(180deg);
}
```

This has created a stacking context. If we were to make a bunch more stacking contexts through various other means then, when it comes to rendering our initial transform, we would repaint not only our `div` element but also **every element that is stacked on top of it in the stack context**. If left unchecked, this can cause your once buttery-smooth transition to become slow and rough.

The second thing to keep in mind is that you should keep your animations to only affecting `opacity` and `transform` if you want absolute best performance for animations on your web page. Yes, our first example above only carried out a `background-color` change, but even that was an expensive operation in itself.

What's important is that you have a solid understanding of these concepts and can apply them when necessary because hey, if you need to turn a button into a rainbow when it's hovered over, you better be able to transition that rainbow!

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read the MDN article for [using CSS transitions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions), including the links in the [Defining transitions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions#defining_transitions) section of the article. Make sure you code along with any examples to become familiar with the syntax.
1. Read the MDN article about [the stacking context](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context) for a deeper understanding.
1. Learn some handy hints on how to create performant CSS animations by reading [this article](https://web.dev/animations-guide/) and check out the link it provides to [CSS Triggers](https://web.archive.org/web/20220727225220/https://csstriggers.com/) to see how an animatable CSS property may affect others. Look at the difference between the `background-color` and `transform` properties, for example.
1. Read this [interactive guide to transitions](https://www.joshwcomeau.com/animation/css-transitions/).
1. Learn how to catch and debug repaint issues with this great article from [Dzhavat Ushev](https://dzhavat.github.io/2021/02/18/debugging-layout-repaint-issues-triggered-by-css-transition.html).
</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Are all CSS properties animatable?](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties)
- [What are the long and short-hand notations for transitions?](https://developer.mozilla.org/en-US/docs/Web/CSS/transition)
- [What is the stacking context?](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context)
- [Why do you need to keep an eye on repaints?](https://dzhavat.github.io/2021/02/18/debugging-layout-repaint-issues-triggered-by-css-transition.html)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Up until now, you have only controlled the speed of your transitions with the help of keyword values like `ease` and `ease-in`. However, CSS allows you to define your own timing functions with the help of timing functions like `steps` and `cubic-bezier`. In specific, [the `cubic-bezier` function](https://developer.mozilla.org/en-US/docs/Web/CSS/easing-function#cubic_b%C3%A9zier_easing_function) is widely used.
- While the [`cubic-bezier`](https://blog.maximeheckel.com/posts/cubic-bezier-from-math-to-motion/) function has a ton of mathematics, you do not need to delve deep into it apart from a creating a basic idea about its purpose.
- You can play around with the [CSS Cubic Bezier Generator](https://www.cssportal.com/css-cubic-bezier-generator/) to not only view how the `cubic-bezier` value works in an editable demo, but also to compare the different `transition-timing-function` values side by side.
