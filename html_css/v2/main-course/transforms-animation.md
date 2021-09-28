### Introduction

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

### Learning Outcomes

By the end of this lesson, you should be able to:

* Do this
* This
* Maybe this

### Transitions
Transitions enable you to define the transition between two states of an element. Different states may be defined using pseudo-classes like :hover or :active or dynamically set using JavaScript.

* Long and short hand notation (with multiple values for both)
* What happens when property value lists are different lengths (longer or shorter)
* [List of animatable CSS properties](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties) Note that can change over time
* Avoid using `auto` as it can lead to unpredictable results
* Include warning about repaints and animating transforms/opacity.
  * [Stacking contexts](https://dzhavat.github.io/2021/02/18/debugging-layout-repaint-issues-triggered-by-css-transition.html) are made when certain element scenarios are in place. See [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context) for details. Basically, if an element has a transform with a value other than `none` and it's at the bottom of the stack, that will cause a "repaint" of that element and all the elements above it on the stack
  * An animation that moves an animation using something other than transform is likely to be [slow](https://web.dev/animations-guide/#layout)
  * Where possible restrict animations to opacity and transform in order to keep animations on the compositing stage of the rendering path. 
  * [CSS Triggers](https://csstriggers.com/) helps you see how a css property will affect other elements on the page if animated

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

* <a class="knowledge-check-link" href="https://www.a-website-that-answers-the-question.com">What are functions useful for?</a>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Can be left empty](https://www.canbeleftempty.com/)

