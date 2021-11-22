### Introduction

It's time to dive into the exciting world of CSS transitions and give your html elements some slick transformations! 

### Learning Outcomes

* What a CSS transition is and when to use it
* Know what CSS properties are animatable and which ones are not
* How to make sure your transitions are smooth and performant

### Transitions

CSS transitions let you animate a change from an element's initial state to an end state. Think of an ordinary button element with a white background. When your mouse is away from the button, it's just sitting there. Boring. Then when you hover your mouse cursor over the button the background color smoothly transitions from white, to grey, to black, over a period of time. This is a CSS transition. Have a look at the codepen below to see one in action.

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="WNENagG" data-editable="true" data-user="programmurrr" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/programmurrr/pen/WNENagG">
  Transition longhand</a> by programmurrr (<a href="https://codepen.io/programmurrr">@programmurrr</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

When your mouse cursor was away from the button, the button was in the initial state. When you hovered over it you introduced the end state, the hover state, while the transition happened as the color smoothly faded from white to black.

This was achieved using the `transition` property which is actually a shorthand property for `transition-property`, `transition-duration`, `transition-timing-function` and `transition-delay`.

~~~css
button {
  /* ... other CSS properties ... */
  transition-property: background-color;
  transition-duration: 1s;
  transition-timing-function: ease-out;
  transition-delay: 0.25s;
}
~~~

* `transition-property` - This tells us what CSS property will be animated. In this case it is the `background-color`

* `transition-duration` - This means the fade from white to black will gradually happen over 1 second

* `transition-timing-function` - This lets us change the speed of the transition over the course of its duration. Here it will `ease-out`, meaning the color change will be faster at the start than at the end of the transition. You may have heard of the Cubic Bézier function which is one of the ways you can control a timing function. Have a quick play around with one [here](https://matthewlein.com/tools/ceaser) to become more familiar with them. 

* `transition-delay` - Starts the transition a quarter of a second after the cursor rests on the button

The shorthand property looks like this:

~~~css
button {
  /* ... other CSS properties ... */
  background-color: white;
  transition: background-color 1s ease-out 0.25s;
}

button:hover {
  background-color: black;
}
~~~

The above transition will occur when the user hovers their mouse over the button as indicated by the `:hover` pseudo-class. In addition to `:hover`, or any of the other pseudo-classes, you can also trigger transitions by adding or removing classes with JavaScript. For example, clicking a button could append the "open" class to a dropdown menu, which would trigger the opening transition.

### Performance

Generally, keeping your CSS transitions performant will not be an issue. However there are a couple of things you need to keep in mind.

The first is the "stacking context". Basically, a stacking context is formed when certain element scenarios are in place. A relevant scenario for us would be to transition a `transform` property like below:

~~~css
div {
  width: 100px;
  height: 100px;
  transition: transform 2s 1s; 
}

div:hover {
  transform: rotate(180deg);
}
~~~

This has created a stacking context. If we were to make a bunch more stacking contexts through various other means then, when it comes to rendering our initial transform, we would repaint not only our `div` element but also **every element that is stacked on top of it in the stack context**. If left unchecked, this can cause your once buttery-smooth transition to become slow and rough.

The second issue to keep in mind is that you should keep your animations to only affecting `opacity` and `transform` if you want absolute best performance for animations on your web page. Yes, our first example above only carried out a simple `background-color` change, but even that was an expensive operation in itself.

What's important is that you have a solid understanding of these concepts and can apply them when necessary because hey, if you need to turn a button into a rainbow when it's hovered over, you better be able to transition that rainbow!

### Assignment

<div class="lesson-content_panel" markdown="1">
1. Read the MDN article for [using CSS transitions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions). Make sure you code along with it to become familiar with the syntax.
2. Check out this great article from [Dzhavat Ushev](https://dzhavat.github.io/2021/02/18/debugging-layout-repaint-issues-triggered-by-css-transition.html) about catching and debugging a repaint issue in the wild.
3. Read the MDN article about [the stacking context](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context) for a deeper understanding pf the stacking context.
4. Learn some handy hints on how to create performant CSS animations by reading [this article](https://web.dev/animations-guide/) and check out the link it provides to [CSS Triggers](https://csstriggers.com/) to see how an animatable CSS property may affect others. Look at the difference between the `background-color` and `transform` properties, for example.
5. Not all CSS properties are animatable. Keep [this list](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties) of CSS-animatable properties handy for future reference. 
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties">Are all CSS properties animatable?</a>

- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/CSS/transition">What are the long and short-hand notations for transitions?</a>

- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context">What is the stacking context?</a>

- <a class="knowledge-check-link" href="https://dzhavat.github.io/2021/02/18/debugging-layout-repaint-issues-triggered-by-css-transition.html">Why do you need to keep an eye on repaints?</a>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Learn more about timing functions [here](https://ageek.dev/css-easing-functions)