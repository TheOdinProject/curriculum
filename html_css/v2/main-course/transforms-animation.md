### Introduction

Intro paragraph.

### Learning Outcomes

* When should you use a CSS transition?
* When should you use a CSS animation?
* What are the long and short hand notations for both?
* What should you keep in mind regarding repaints?
* What are keyframes and when are they used?

### Transitions
CSS transitions let you animate a change from an element's initial state to an end state. Think of an ordinary button element with a white background. When your mouse is away from the button, it's just sitting there. Boring. Then when you hover your mouse cursor over the button the background color smoothly transitions from white, to grey, to black, over a period of time. This is a CSS transition.

When your mouse cursor was away from the button, the button was in the inital state. When you hovered over it you introduced the end state, the hover state, while the transition happened as the color smoothly faded from white to black.

In the above example we animated the CSS `background-color` property. While there are plenty of CSS properties you can animate, you can't animate them all. So keep [this list](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties) of animatable CSS properties handy so you can check whether or not you can do the transition you want.

Now let's make a basic transition. There are two ways of writing a transition. One is the long form and the other is the short form. The long form looks like this:

~~~css
button {
  /* ... other css properties ... */
  background-color: white;
  transition-property: background-color;
  transition-duration: 2s;
  transition-timing-function: ease-out;
  transition-delay: 1s;
}

button:hover {
  background-color: black;
}
~~~

The `transition-property` tells us what CSS property will be animated. In this case it is the `background-color` which will change from white to black. The `transition-duration` means the fade from white to black will gradually happen over 2 seconds. The `transition-timing-function` lets us change the speed of the transition over the course of its duration. Here it will `ease-out`, meaning the color change will be faster at the start than at the end of the transition. The `transition-delay` means the transition will start 1 second after the cursor rests on the button. The short form of this is:

~~~css
button {
  /* ... other css properties ... */
  background-color: white;
  transition: background-color 2s ease-out 1s;
}

button:hover {
  background-color: black;
}
~~~

The above transition will occur when the user hovers their mouse over the button as indicated by the `:hover` pseudo-class. Different pseudo-classes may be used such as `:active` or `:focus` and you can find the [full list here](https://developer.mozifont-sizella.org/en-US/docs/Web/CSS/Pseudo-classes). We will now explore each of those pseudo-classes one by one.

Just kidding! A skim over that list to familiarise yourself with the CSS pseudo-classes will be enough. While you're there, you absolutely **should** read the MDN article for [using CSS transitions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions). Make sure to pay attention to the note about the `auto` value and some of the finer points around using transition on multiple properties at the same time. 

### Optimization

Optimization is a subject that can lead down quite a few rabbit-holes and is generally not worth focusing on at this intermediate stage. However there are a couple of things you need to keep in mind regarding CSS transitions and animations in general. Feel free to do your own research but if you've started to read about GPU threads regarding this particular topic then you've gone too far, although it is certainly interesting!

We will start with "stacking contexts". Basically, these are formed when certain element scenarios are in place. A releveant scenario for us would be to transition a `transform` property like below:

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

This has created a stacking context. If we were to make a bunch more stacking contexts through various other means (see [this article](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context) for definitions) then, when it comes to rendering our initial transform, we would repaint not only our `div` element but also *every element that is stacked on top of it in the stack context*. If left unchecked, this can cause your once buttery-smooth transition to become slow and rough. This article from [Dzhavat Ushev](https://dzhavat.github.io/2021/02/18/debugging-layout-repaint-issues-triggered-by-css-transition.html) is a great example of catching and debugging a repaint issue in the wild.

Also, you should keep your animations to only affecting `opacity` and `transform` if you want absolute best performance for animations on your web page. Yes, our first example above only carried out a simple `background-color` change, but even that was an expensive operation in itself. Have a read of this web.dev article for some handy hints on how to [create high-performance CSS animations](https://web.dev/animations-guide/). It also has a link to [CSS Triggers](https://csstriggers.com/) which will help you see how a CSS property will affect other elements on the page if it is animated. Look at the difference between the `opacity` and `background-color` properties.

Like we said earlier, optimization is a rabbit-hole so don't get too bogged down in the details here. What's important is that you have a solid understanding of these concepts and can apply them when necessary because hey, if you need to turn a button into a rainbow when it's hovered over, you better be able to transition that rainbow!

### Keyframe Animations

* Cover the animation name, duration, iteration count, direction in long and short form
* Longhand values can accept multiple values separated by commas
* @keyframes then animation name
* from (0%), to (100%), and then the % in between e.g. 75% 

Example idea:
* A ball in the center of a page
* Make it orbit the center of the page? Can call it "orbit"
* Make it orbit the center in one direction, then another, infinitely...




### Practice

Let's do something fun together! See foundations/javascript_basics/fundamentals-3.md on how to write a good practice area.

* Button hover
* Dropdown
* Popup modal

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* <a class="knowledge-check-link" href="https://www.link-to-question-answer.com">When would you use a transition over an animation?</a>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Can be left empty](https://www.canbeleftempty.com/)

