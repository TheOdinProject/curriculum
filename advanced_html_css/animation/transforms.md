### Introduction

The `transform` property is a powerful tool to change the appearance of elements without affecting the natural document flow.

You have likely seen it in action on many of your favorite websites! Transforms are very commonly used for animated effects. While we are sure you'll like to create sleek animations of your own, we first need to understand how transforms work.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to use 2D transforms.
- How to use 3D transforms.
- How to chain multiple transforms.
- The benefits of using the `transform` property.

### Basics of transforms

The `transform` property takes in one or more CSS transform functions as its values, with those functions taking in their own value, usually an angle or a number.

Almost all elements can have the `transform` property applied to it, with the exceptions being `<col>`, `<colgroup>`, and non-replaced inline elements. "Non-replaced" refers to elements whose content is contained within the HTML document (`<span>`, `<b>`, and `<em>`, for example), as opposed to a "replaced" element's content being contained outside of the document (`<a>`, `<iframe>`, and `<img>`, for example). You do not need to memorize every element that is non-replaced, but rather keep this knowledge in mind should you try to apply the `transform` property to an element and aren't sure why it isn't working.

### Two-dimensional transforms

In this section, we'll go through 2D transforms with the following transform functions: `rotate`, `scale`, `skew`, and `translate`.

#### Rotate

This is the transform function value to rotate an element on a 2D plane:

```css
.element {
  transform: rotate();
}
```

Below is a CodePen that shows how the value affects the target element.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="GRMgKeE" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/GRMgKeE">
  2D Rotate | CSS Transform</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Scale

These are the transform function values to scale an element on a 2D plane:

```css
.element {
  transform: scaleX();
  transform: scaleY();
  transform: scale();
}
```

Below is a CodePen that shows how each value affects the target element.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="XWeJrGL" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/XWeJrGL">
  2D Scale | CSS Transform</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Skew

These are the transform function values to skew an element on a 2D plane:

```css
.element {
  transform: skewX();
  transform: skewY();
  transform: skew();
}
```

Below is a CodePen that shows how each value affects the target element.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="mdBybgm" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/mdBybgm">
  2D Skew | CSS Transform</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Translate

These are the transform function values to translate an element on a 2D plane:

```css
.element {
  transform: translateX();
  transform: translateY();
  transform: translate();
}
```

Below is a CodePen that shows how each value affects the target element.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="PoJwYrO" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/PoJwYrO">
  2D Translate | CSS Transform</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Chaining multiple transforms

Now that you have a grasp of 2D transforms, we will learn how to chain them. Chaining multiple transforms is done by adding more transform functions with a space between each one. Take a look at the code below:

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

There are two boxes located at the same position. We chained `rotate` and `translate` function values to both boxes, but in different orders. Make a guess on what happens to each box, then click the "Result" link in the Codepen below to see if you were right.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css" data-slug-hash="XWeJWWr" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/XWeJWWr">
  Chaining | CSS Transform</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

If you guessed correctly, congratulations! But this is a tricky concept. There is a bit of debate on how to read a chain of transform functions. According to [MDN's transform docs](https://developer.mozilla.org/en-US/docs/Web/CSS/transform#values): "The transform functions are multiplied in order from left to right, meaning that composite transforms are effectively applied in order from right to left."

While you can generally chain multiple transforms in any order for various results, there is one exception: `perspective`. This brings us nicely to the next section where `perspective` is involved.

### Three-dimensional transforms

The `rotate`, `scale`, and `translate` transform functions aren't limited to just 2D planes. They also work for 3D planes as well! However, to perceive a 3D effect on some of these function values, `perspective` is required.

From here on, the examples get more complicated, so there will be more links to external resources which do an excellent job describing how each property works. Play around with these properties until you feel comfortable with them, but be careful not to get too sidetracked with them.

#### Perspective

This is the transform function value to set the distance from the user to the z = 0 plane:

```css
.element {
  transform: perspective();
}
```

Essentially, by setting a `perspective` value, we are telling the object to render as if we were viewing it from a specific distance on the z-axis.

Unlike other transform function values, `perspective` must be declared first (leftmost) when there are multiple transform function values. In the upcoming examples for `rotate`, `scale`, and `translate`, we will be able to see how it affects the target element.

#### Rotate specific axis

These are the additional transform function values to rotate an element in a 3D space:

```css
.element {
  transform: rotateX();
  transform: rotateY();
  transform: rotateZ();
  transform: rotate3d();
}
```

Below is a CodePen that shows how the first three values affects the target element.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="PoJwozR" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/PoJwozR">
  3D Rotate | CSS Transform</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Scale specific axis

These are the additional transform function values to scale an element in a 3D space:

```css
.element {
  transform: scaleZ();
  transform: scale3d();
}
```

See MDN's 3D cube in action with [`scaleZ`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scaleZ()) and [`scale3d`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scale3d()).

#### Translate specific axis

These are the additional transform function values to translate an element in a 3D space:

```css
.element {
  transform: translateZ();
  transform: translate3d();
}
```

`translateZ` doesn't do much without `perspective`. Instead, `perspective` and `translateZ` work together to create the illusion of 3-dimensional distance from the rendered object, as shown in the example below.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="MWEYWpN" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/MWEYWpN">
  TranslateZ | CSS Transform</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### Matrix

While not strictly a 3D transform function, matrix is mentioned last in this lesson due to how uncommonly used it is. These are the transform function values for it.

```css
.element {
  transform: matrix();
  transform: matrix3d();
}
```

Matrix is a way of combining all transform functions into one. It is seldom used due to its poor readability, and almost never written by hand. Unless you have a very complex transformation to apply, you should use other transform function values instead.

It is enough for you to know *that* these functions exist and generally how they work. However, it is not important for you to feel comfortable building with them.

### Benefits of transforms

In order to understand why the `transform` property is great, you have to be aware of CSS triggers. You can learn about it in [The Pixel Pipeline](https://developers.google.com/web/fundamentals/performance/rendering/#the_pixel_pipeline) section from Google's Web Fundamentals.

The key benefit of using `transform` is that it occurs during **composition**. This makes it cheaper to use compared to many other CSS properties. You can see what triggers are executed with each CSS property in this [table of CSS triggers](https://web.archive.org/web/20220727225220/https://csstriggers.com/).

Another benefit of `transform` is that it can be hardware-accelerated via a device's [GPU](https://en.wikipedia.org/wiki/Graphics_processing_unit) (you don't have to understand how a GPU works but it is good to be aware of the term and what it means). This benefit is more prominent when it comes to transitions and animations which you will learn about in the following lessons.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. To learn about how `rotate3d` works, check out this great [demonstration on MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate3d()) and this [Quackit article](https://www.quackit.com/css/functions/css_rotate3d_function.cfm).
1. For more details on how `perspective` works in regards to 3D transforms, check out this [CSS Tricks article](https://css-tricks.com/how-css-perspective-works/).
1. For a great demonstration on `translate3d` checkout the [MDN cube again](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate3d())!
1. Go through [The World of CSS Transforms](https://www.joshwcomeau.com/css/transforms/) by Josh Comeau.
</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the four main functions of the `transform` property?](#two-dimensional-transforms)
- [Which function can be used to move an object through space on the X, Y, or Z axis?](#translate)
- [Which function can be used to make an object larger or smaller on the X, Y, or Z axis?](#scale)
- [What additional function is required for 3D transforms?](#three-dimensional-transforms)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Learn more about `matrix` by checking Quackit's article on the [matrix function](https://www.quackit.com/css/functions/css_matrix_function.cfm).
- For a full reference, there's always [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function).
- For more on the 3D transform functions, [W3Schools](https://www.w3schools.com/css/css3_3dtransforms.asp) has a good article demonstrating how they work.
