### Introduction

Ready to add some animated flair to your website? CSS transitions and animations can add that "panache" to your elements so your websites will set you apart from the rest of the boring crowd. Animate your buttons, nav-bars, loading-bars, anything! Your imagination is your limit! Now let's dive in.  

### Learning Outcomes

* When should you use a CSS transition?
* When should you use a CSS animation?
* What are the long and short hand notations for both?
* What should you keep in mind regarding repaints?
* What are the two distinct parts of creating a keyframe animation?

### Transitions
CSS transitions let you animate a change from an element's initial state to an end state. Think of an ordinary button element with a white background. When your mouse is away from the button, it's just sitting there. Boring. Then when you hover your mouse cursor over the button the background color smoothly transitions from white, to grey, to black, over a period of time. This is a CSS transition.

When your mouse cursor was away from the button, the button was in the initial state. When you hovered over it you introduced the end state, the hover state, while the transition happened as the color smoothly faded from white to black.

In the above example we animated the CSS `background-color` property. While there are plenty of CSS properties you can animate, you can't animate them all. So keep [this list](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties) of "CSS animatable" properties handy so you can check whether or not you can do the transition you want.

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

Just kidding! A skim over that list to familiarize yourself with the CSS pseudo-classes will be enough. While you're there, you absolutely should read the MDN article for [using CSS transitions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions). Make sure to pay attention to the note about the `auto` value and some of the finer points around using transition on multiple properties at the same time. 

### Optimization

Optimization is a subject that can lead down quite a few rabbit-holes and is generally not worth focusing on at this intermediate stage. However there are a couple of things you need to keep in mind regarding CSS transitions and animations in general. Feel free to do your own research but if you've started to read about GPU threads regarding this particular topic then you've gone too far, although it is certainly interesting!

We will start with "stacking contexts". Basically, these are formed when certain element scenarios are in place. A relevant scenario for us would be to transition a `transform` property like below:

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

This has created a stacking context. If we were to make a bunch more stacking contexts through various other means (see [this article](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context) for definitions) then, when it comes to rendering our initial transform, we would repaint not only our `div` element but also **every element that is stacked on top of it in the stack context**. If left unchecked, this can cause your once buttery-smooth transition to become slow and rough. This article from [Dzhavat Ushev](https://dzhavat.github.io/2021/02/18/debugging-layout-repaint-issues-triggered-by-css-transition.html) is a great example of catching and debugging a repaint issue in the wild.

Also, you should keep your animations to only affecting `opacity` and `transform` if you want absolute best performance for animations on your web page. Yes, our first example above only carried out a simple `background-color` change, but even that was an expensive operation in itself. Have a read of this web.dev article for some handy hints on how to [create high-performance CSS animations](https://web.dev/animations-guide/). It also has a link to [CSS Triggers](https://csstriggers.com/) which will help you see how a CSS property will affect other elements on the page if it is animated. Look at the difference between the `background-color` and `transform` properties.

Like we said earlier, optimization is a rabbit-hole so don't get too bogged down in the details here. What's important is that you have a solid understanding of these concepts and can apply them when necessary because hey, if you need to turn a button into a rainbow when it's hovered over, you better be able to transition that rainbow!

### Keyframe Animations
Keyframe animations let you animate elements from one style configuration to another. Does this sound familiar? You wouldn't be wrong for thinking, "Well, what's the point in learning keyframes if they are basically the same as transitions?", but there are some aspects of keyframes that make them better suited to plenty of situations.

CSS transitions were designed to animate an element from one state to another. They *can* loop but they weren't designed for that, whereas keyframes were designed with the purpose of explicitly enabling loops.

Transitions need a trigger (remember the pseudo-classes?) but keyframes do not. Once you have your elements in place and CSS defined, an animation will start running immediately  if that's what you told it to do. 

Transitions are also not as flexible as using keyframes. When you define a transition, imagine you are sending that element on a journey in a straight line from point A to point B. Yes the `transition-timing-function` can add some variance to the timing of this change, but it doesn't compare to the amount of flexibility added by using keyframes.

There are more differences between the methods than those described above, but hopefully you have a clearer idea of the differences between them now. If you need to change the opacity of an element when it is active, then a keyframe animation would be overkill. But if you need to carry out something more complicated, keyframes provide you with the tools you need. 

Let's look at some keyframe animation syntax. Like transitions, there is a long and short form of using animations. We have used the long form here so you can get to grips with some of the main animation sub-properties that you will use to get started. 

~~~css
#ball {
  /* ... other css properties ... */
  animation-duration: 3s;
  animation-name: bounce;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

@keyframes bounce {
  from {
    margin-top: 100%;
  }

  to {
    margin-top: 0%;
  }
}
~~~

Note that this process has two distinct parts. The first part is the configuration stage where we define our animation sub-properties on the `#ball` element. Here we have an `animation-duration` of three seconds. This means that it will take three seconds for the `#ball` element to complete one animation cycle. Next we have defined the `animation-name` to be "bounce" which is essential for the `@keyframe` section coming up next. This is just a custom name that is not a particular CSS value. We could have called it "pineapples" if we so wished, but for our purposes "bounce" suits well. Then our `animation-iteration-count` is set to `infinite` which means this animation will run forever. You could set this to 1, 2, or as many iterations as you wish. Finally our `animation-direction` decides if our animation should alternate direction on the completion of one cycle, or reset to the start point and repeat itself. Here we set it to `alternate`, which means that the `#ball` will smoothly animate back along the path it came from in reverse as opposed to skipping straight back to its original point.  

Now we will cover defining the animation sequence itself using the `@keyframes` at-rule. You have seen that the `@keyframes` definition references the "bounce" name we defined earlier. Then, we use the `from` and `to` properties to change the `margin-top` of `#ball` from 100% to 0%. It's important to know that keyframes use a percentage to indicate the times for an animation to take place and that the `from` and `to` statements are actually aliases for `0%` and `100%` respectively. You can read `from/0%` as meaning "at zero seconds" and `to/100%` as "at 3 seconds" according to our `animation-duration`. There is no hard and fast rule on whether or not you should use `from/to` or `0%/100%`. Just pick a style and be consistent with it. The `from/to` statement also defines one animation cycle. So if we were to set our `animation-iteration-count` to 2 then the ball would change its `margin-top` from 100% to 0%, then from 0% to 100%, and then the animation would stop. Be careful not to think of one cycle as a 'round trip'. 

So far, so good, so now it's time to add another keyframe to our animation, introduce the shorthand notation and glimpse a little into the power of the keyframe notation:

~~~css
#ball {
  /* ... other css properties ... */
  width: 100px;
  height: 100px;
  animation: 3s bounce infinite alternate;
}

@keyframes bounce {
  from {
    margin-top: 100%;
  }

  50% {
    width: 200px;
    height: 200px;
  }

  to {
    margin-top: 0%;
  }
}
~~~

You've seen above that we added another keyframe for when the `animation-duration` is at 50%, or 1.5 seconds. This means that the `width` and `height` of `#ball` will double as they approach the middle of the animation and then shrink back to their original sizes as they near the end of one cycle. Just be aware that additional keyframes are always defined in percentages. Only the `0%/100%` values may use the `from/to` alias. Hopefully this gives you a glimpse into the power the `@keyframe` syntax provides to you when it comes to controlling the animation of an element's properties. You can add keyframes whenever you want, control whatever animatable properties you want, and have the control to add some real creative flair to your website elements.

Before we jump into building some cool animations, take some time to review the MDN documents for [Using CSS animations](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations) and then the [@keyframes reference](https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes) itself. Be sure to type and run the code examples yourself to become familiar with the syntax. 

### Practice

Now let's make some cool animations! Set up your skeleton HTML and CSS files and make an animation for each of the scenarios below.

1. Make a transition for when you hover your mouse cursor over a button element. You could transition the font, background-colour, or anything else animatable. Your imagination is the limit!
2. Make a transition/animation for animating a drop-down menu appearing when you hover your mouse over another element, or for when you click that element
3. Use everything you've learned to animate the appearance of a pop-up modal! 

For the above practice scenarios, make sure you do something different each time to truly stretch your animation legs i.e. if the animation for scenario one is triggered by a `:hover` pseudo-class, then use a different pseudo-class for scenario two, and so on. 

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties">Are all CSS properties animatable?</a>

- <a class="knowledge-check-link" href="https://www.geeksforgeeks.org/difference-between-animation-and-transition-in-css/">When would you use a transition over an animation (and vice versa)?</a>

- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/CSS/transition">What are the long and short-hand notations for transitions?</a>

- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/CSS/animation">What are the long and short-hand notations for CSS animations?</a>

- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context">What is the stacking context?</a>

- <a class="knowledge-check-link" href="https://dzhavat.github.io/2021/02/18/debugging-layout-repaint-issues-triggered-by-css-transition.html">Why do you need to keep an eye on repaints?</a>

- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations#defining_the_animation_sequence_using_keyframes">How do you add keyframes to an animation?</a>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.