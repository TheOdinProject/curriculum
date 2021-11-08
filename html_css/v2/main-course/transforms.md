### Introduction

The `transform` property is a powerful tool to change the appearance of elements without affecting the natural document flow.

You have likely seen it in action on many of your favorite websites! Transforms are very commonly used for animated effects. While we are sure you'll like to create sleek animations of your own, we first need to understand how transforms work.

### Learning Outcomes

By the end of this lesson, you will know:

- How to use 2D transforms.
- How to use 3D transforms.
- How to chain multiple transforms.
- The benefits of using the `transform` property.

### Basics of Transforms

The `transform` property takes in one or more CSS transform functions as its values.

> Important note: The `transform` property only works on transformable elements. Pretty much all elements can be transformed except for `<col>`, `<colgroup>`, and non-replaced inline boxes such as `<span>`. If you are not sure what "non-replaced" means, you can read up on [replaced elements](https://developer.mozilla.org/en-US/docs/Web/CSS/Replaced_element) and inverse its definition. You do not have to memorize this. This knowledge is useful for when you try to apply `transform` to an element and aren't sure why it isn't working.

### 2D Transforms

In this section, we'll go through 2D transforms with the following transform functions: `rotate`, `scale`, `skew`, and `translate`.

#### Rotate

This is the transform function value to rotate an element on a 2D plane.

```css
.element {
  transform: rotate();
}
```

Below is a CodePen that shows how the value affects the target element.

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="vYJdmxo" data-editable="true" data-user="fortypercenttitanium" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/fortypercenttitanium/pen/vYJdmxo">
  Untitled</a> by Alex Younger (<a href="https://codepen.io/fortypercenttitanium">@fortypercenttitanium</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Scale

These are the transform function values to scale an element on a 2D plane.

```css
.element {
  transform: scaleX();
  transform: scaleY();
  transform: scale();
}
```

Below is a CodePen that shows how each value affects the target element.

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="OJjQmwR" data-editable="true" data-user="fortypercenttitanium" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/fortypercenttitanium/pen/OJjQmwR">
  Scale</a> by Alex Younger (<a href="https://codepen.io/fortypercenttitanium">@fortypercenttitanium</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Skew

These are the transform function values to skew an element on a 2D plane.

```css
.element {
  transform: skewX();
  transform: skewY();
  transform: skew();
}
```

Below is a CodePen that shows how each value affects the target element.

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="wveNmbJ" data-editable="true" data-user="shiroinegai" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/shiroinegai/pen/wveNmbJ">
  Skew | CSS 2D Transforms</a> by Shiroi Negai (<a href="https://codepen.io/shiroinegai">@shiroinegai</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Translate

These are the transform function values to translate an element on a 2D plane.

```css
.element {
  transform: translateX();
  transform: translateY();
  transform: translate();
}
```

Below is a CodePen that shows how each value affects the target element.

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="dyzdWEP" data-editable="true" data-user="fortypercenttitanium" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/fortypercenttitanium/pen/dyzdWEP">
  Translate</a> by Alex Younger (<a href="https://codepen.io/fortypercenttitanium">@fortypercenttitanium</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Chaining Multiple Transforms

Now that you have a grasp of 2D transforms, we will learn how to chain them. Chaining multiple transforms is as simple as adding more transform functions with a space between each one. Take a look at the code below:

```html
<div class="red-box"></div>
<div class="blue-box"></div>
```

```css
.red-box,
.blue-box {
  position: absolute;
  width: 100px;
  height: 100px;
}

.red-box {
  background: red;
  transform: rotate(45deg) translate(200%);
}

.blue-box {
  background: blue;
  transform: translate(200%) rotate(45deg);
}
```

There are two boxes located at the same position. We chained `rotate` and `translate` function values to both boxes but in different orders. Make a guess on what happens to each box then open up [this CodePen](https://codepen.io/fortypercenttitanium/pen/OJjQgLm) to see if you were right.

If you guessed correctly, congratulations! Otherwise, you will now learn that when chaining multiple transforms, each transform function is applied from right to left.

While you can generally chain multiple transforms in any order for various results, there is one exception: `perspective`. This brings us nicely to the next section where `perspective` is involved.

### 3D Transforms

In the earlier section, `rotate`, `scale`, and `translate` transform functions aren't limited to just the 2D plane. They work for the 3D plane as well!

However, to perceive a 3D effect on some of these function values, `perspective` is required.

From here on, the examples get more complicated, so there will be more links to external resources which do an excellent job describing how each property works. Play around with these properties until you feel comfortable with them, but be careful not to fall down the [CSS Animation rabbit-hole](https://www.youtube.com/watch?v=CG__N4SS1Fc).

#### Perspective

This is the transform function value to set the distance from the user to the z = 0 plane. Essentially, by setting a `perspective` value, we are telling the object to render as if we were viewing it from a specific distance on the z-axis. If this sounds confusing, don't worry, it will be covered more later.

```css
.element {
  transform: perspective();
}
```

Unlike other transform function values, `perspective` must be declared first (leftmost) when there are multiple transform function values. In the upcoming examples for `rotate`, `scale`, and `translate`, we will be able to see how it affects the target element.

For more details on how `perspective` works in regards to 3d transforms, [check out this CSS Tricks article.](https://css-tricks.com/how-css-perspective-works/).

#### Rotate

These are the additional transform function values to rotate an element on a 3D plane.

```css
.element {
  transform: rotateX();
  transform: rotateY();
  transform: rotateZ();
  transform: rotate3d();
}
```

Below is a CodePen that shows how the first three values affects the target element.

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="yLojYgK" data-editable="true" data-user="fortypercenttitanium" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/fortypercenttitanium/pen/yLojYgK">
  Rotate</a> by Alex Younger (<a href="https://codepen.io/fortypercenttitanium">@fortypercenttitanium</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

To learn about how `rotate3d` works, check out this great demonstration (<https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate3d()>) on MDN and [this one](https://www.quackit.com/css/functions/css_rotate3d_function.cfm) on Quackit.

#### Scale

These are the additional transform function values to scale an element on a 3D plane.

```css
.element {
  transform: scaleZ();
  transform: scale3d();
}
```

See MDN's 3d cube in action with `scaleZ` [here](<https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scaleZ()>) and `scale3d` [here](<https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scale3d()>).

#### Translate

These are the additional transform function values to translate an element on a 3D plane.

```css
.element {
  transform: translateZ();
  transform: translate3d();
}
```

`translateZ` doesn't do much without `perspective`. Instead, `perspective` and `translateZ` work together to create the illusion of 3-dimensional distance from the rendered object. See a simple example below:

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="yLojYjq" data-editable="true" data-user="fortypercenttitanium" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/fortypercenttitanium/pen/yLojYjq">
  3d rotate</a> by Alex Younger (<a href="https://codepen.io/fortypercenttitanium">@fortypercenttitanium</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

For a great demonstration on `translate3d` checkout the the [MDN cube again](<https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate3d()>)!

#### More on Perspective

`perspective` is an incredibly powerful function for CSS animations. As was mentioned earlier, the value set in perspective is essentially the distance on the z-axis from which the viewer is looking at the object in question. To get a better grasp on how it works, take some time to [read this article](https://css-tricks.com/how-css-perspective-works/) and even try to code along with it. You will get a better grasp of how it works once you try it out for yourself.

#### Matrix

While not strictly a 3D transform function, matrix is mentioned last in this lesson due to how uncommonly used it is. These are the transform function values for it.

```css
.element {
  transform: matrix();
  transform: matrix3d();
}
```

Below is a CodePen that shows how the value affects the target element.

TODO

Matrix is seldom used due to its poor readability. Unless you have a very complex transformation to apply, you should use other transform function values instead.

### Benefits of Transforms

In order to understand why the `transform` property is great, you have to be aware of CSS triggers. You can learn about about it in [The Pixel Pipeline](https://developers.google.com/web/fundamentals/performance/rendering/#the_pixel_pipeline) section from Google's Web Fundamentals.

The key benefit of using `transform` is that it occurs during **composition**. This makes it cheaper to use compared to many other CSS properties. You can see a table of what triggers are executed with each CSS property [here](https://csstriggers.com/).

Another benefit of `transform` is that it can be hardware-accelerated via a device's [GPU](https://en.wikipedia.org/wiki/Graphics_processing_unit) (you don't have to understand how a GPU works but it is good to be aware of the term and what it means). This benefit is more prominent when it comes to transitions and animations which you will learn about in an upcoming lesson.

### Additional Resources

- Here's a good resource that summarizes [most common transform functions with some additional insight](https://www.joshwcomeau.com/css/transforms/) to how you may use them.
- For a full reference, there's always [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function).
- For more on the 3d transform functions, [W3Schools](https://www.w3schools.com/css/css3_3dtransforms.asp) has a good article demonstrating how they work.

### Knowledge Check

TODO
