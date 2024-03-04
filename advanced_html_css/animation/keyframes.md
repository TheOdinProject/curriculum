### Introduction

Now let's explore CSS animations using keyframes. This will expand upon your encounter with CSS transitions and delve into the differences between them.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- The differences between CSS transitions and CSS animations.
- How to configure animation sub-properties.
- How to sequence an animation using keyframes.

### Animations vs transitions

Animations let you animate elements from one style configuration to another. Does this sound familiar? You wouldn't be wrong for thinking, "Well, what's the point in learning animations if they are basically the same as transitions?", but animations greatly expand on some capabilities that transitions do not have. A few of the differences include:

- Transitions were designed to animate an element from one state to another. They *can* loop, but they weren't designed for that. Animations, on the other hand, *were* designed with the purpose of explicitly enabling loops.

- Transitions need a trigger, such as the use of pseudo-classes like `:hover` or `:focus`, or by adding/removing a class via JavaScript. Animations, on the other hand, do not need such a trigger. Once you have your elements in place and CSS defined, an animation will start running immediately if that's what you told it to do.

- Transitions are not as flexible as using animations. When you define a transition, imagine you are sending that element on a journey in a straight line from point A to point B. Yes, the `transition-timing-function` can add some variation to the timing of this change, but it doesn't compare to the amount of flexibility added by using animations.

All in all, both animations and transitions have their use, so in addition to considering the above differences you should also use your best judgment. For example, if you need to change the opacity of an element when it is active then an animation would be overkill, but if you need to carry out something more complicated, animations will provide you with the tools you need.

### Animation properties

Let's see an animation in action to see what we've been talking about.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="jOGENZz" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/jOGENZz">
  keyframes 1 longhand</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Note how the animation is already running and how it keeps repeating itself. We'll cover that `@keyframes` rule at the bottom of our example in a bit, so for now focus on the actual animation properties used in the example above:

```css
#ball {
  /* ... other CSS properties ... */
  animation-duration: 2s;
  animation-name: change-color;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
```

This is known as the configuration stage where we define our animation properties on the `#ball` element, and it is only the first half of defining an animation. In our example, we have:

- An `animation-duration` of two seconds. This means that it will take two seconds for the `#ball` element to complete one animation cycle.

- Defined the `animation-name` to be "change-color" which is essential for the `@keyframes` section coming up next. This is just a custom name that is not a particular CSS value. We could have called it "pineapples" if we so wished, but for our purposes "change-color" suits us well.

- Set the `animation-iteration-count` to `infinite`, which means this animation will run forever. You could set this to 1, 2, or as many iterations as you wish.

- Set the `animation-direction`  to `alternate`. This property decides if our animation should alternate direction on the completion of one cycle, or reset to the start point and repeat itself. Here it means that the `#ball` will smoothly change back to its original color instead of "jumping" straight back to red.

### Keyframes

Now it's time to tackle the second half of our animation definition by exploring the `@keyframes` at-rule.

```css
@keyframes change-color {
  from {
    background-color: red;
  }

  to {
    background-color: green;
  }
}
```

The `@keyframes` at-rule references the 'change-color' name we defined earlier. Then, we use the `from` and `to` properties to change the `background-color` of `#ball` from red to green.

It's important to know that keyframes use a percentage to indicate the times for an animation to take place and that the `from` and `to` statements are actually aliases for `0%` and `100%`, respectively. You can read `from/0%` as meaning 'at zero seconds' and `to/100%` as 'at 2 seconds' according to our `animation-duration` in our example from above. There is no hard and fast rule on whether or not you should use `from/to` or `0%/100%`. Just pick a style and be consistent with it.

The `@keyframes` at-rule also defines one animation cycle. So if we were to change our `animation-iteration-count` from earlier to 2 then the ball would change its `background-color` from red to green, then from green to red, and then the animation would stop. Be careful not to think of one iteration as a complete loop, but rather a single cycle from beginning to end (or end to beginning when alternating the direction).

Now it's time to introduce the shorthand notation for our animation properties and glimpse a little into the added flexibility of the keyframe notation. Check out the live example below then have a look at the notation.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="zYExOLQ" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/zYExOLQ">
  keyframes 2 shorthand</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

```css
#ball {
  /* ... other CSS properties ... */
  background-color: red;
  animation: 2s change-color infinite alternate;
}

@keyframes change-color {
  from {
    background-color: red;
  }
  
  50% {
    width: 200px;
    height: 200px;
    background-color: blue;
  }

  to {
    background-color: green;
  }
}
```

Here we added another keyframe for when the `animation-duration` is at 50%, or 1 second. This means as well as the `background-color` changing to an additional value, we have also specified that the ball double in size. Just be aware that additional keyframes are always defined in percentages. Only the `0%/100%` values may use the `from/to` alias.

Hopefully, this gives you a glimpse into the power the `@keyframes` syntax provides to you when it comes to controlling the animation of an element's properties. You can add keyframes whenever you want, control whatever CSS-animatable properties you want, and have the control to add some real creative flair to your website elements.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Code along with [this MDN article for using CSS animations](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations).
1. Read the [@keyframes reference](https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes) to gain a deeper understanding of how keyframes are implemented.
1. Read this [interactive guide to keyframes](https://www.joshwcomeau.com/animation/keyframe-animations/).
1. Now let's make some cool animations! Go to the `animation` folder in the [CSS exercises repository](https://github.com/TheOdinProject/css-exercises) and review each README file prior to completing the following exercises in order:
   - `01-button-hover`
   - `02-pop-up`
   - `03-dropdown-menu`
</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the long and short-hand notations for CSS animations?](https://developer.mozilla.org/en-US/docs/Web/CSS/animation)
- [How do you add keyframes to an animation?](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations#defining_the_animation_sequence_using_keyframes)
- [When would you use an animation over a transition (and vice versa)?](#animations-vs-transitions)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Video from DevTips on CSS Animations and Keyframes](https://www.youtube.com/watch?v=f1WMjDx4snI&list=PLqGj3iMvMa4LvJ8VctoXnPI0dtE40wfid&index=2&ab_channel=DevTips).
