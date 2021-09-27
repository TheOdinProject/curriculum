### Introduction
Images require a little special care on responsive websites. This lesson will present a few of the issues that arise when working with responsive images, and the options you have when dealing with them.

### Learning Outcomes
* You'll learn how to make your images behave properly when resizing them with CSS.
* You'll learn how to serve up different images based on screen-size.

### The Basics

The most basic problem that you are going to face when working with responsive images is the aspect-ratio, or the relationship between width and height. If you shrink the width of an image on smaller screens, and do not also manipulate the height the image will appear distorted!

The solution to this issue is incredibly easy, and we've already mentioned it in an earlier lesson: simply don't define both a width and a height. If an image is given a flexible width, and the height is set to `auto`, then it should retain it's aspect ratio correctly.

### background-size, background-position and object-fit
What if you don't want your image to simply shrink (in both height and width)? `background-size` and `object-fit` are two properties that can provide a little more flexibility (pun intended) with how aspect-ratios are handled.

`background-position` and `background-size` are properties that work on elements with a background image, and do not work on normal `img` tags. You'll see some examples and specifics in the reading assignment later, but you can get quite a lot of control over the display and placement of background images by working with these properties. For example, `background-position: center` will make sure the image is always centered in it's container, even if the container is too small to fit the whole image. `background-size: cover` will resize the image so that it is always completely filling it's container while cropping as little as possible.

Here's a little demo you can play with:
<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="powxJXV" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/powxJXV">
  background demo</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

`object-fit` works similarly, but is meant for `img` tags. With the `object-fit` property you _can_ specify a width and height for your images and then tell an image how it is supposed to fit itself to those dimensions. The default value for `object-fit` is `fill`, which simply stretches the image to fit the dimensions, but much like `background-size` you can also tell it to `cover` or `contain` the image.

Here's a demo of `object-fit` on an image. Open this one up on CodePen and resize the browser to see how the image reacts.
<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="NWgOGGX" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/NWgOGGX">
  object-fit</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Even _More_ Control!
It is also possible to literally use _different_ images for different screen sizes. This gives you the most control over exactly how your images are displayed at various resolutions. For example, instead of just trusting `object-fit` to keep the subject of a photograph in frame, you could present a cropped version of it on smaller screens. There are two ways of achieving this, but the most flexible is using the `<picture>` tag, which you'll see in the reading assignment.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. First check out the docs for [background-size](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size), [background-position](https://developer.mozilla.org/en-US/docs/Web/CSS/background-position), and [object-fit](https://developer.mozilla.org/en-US/docs/Web/CSS/object-fit). The demos on those pages should make their usage clear.
2. MDN's [Responsive Images](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images) is an introduction to serving up responsive images in HTML.
3. CSS Tricks's [Guide to the Responsive Images Syntax in HTML](https://css-tricks.com/a-guide-to-the-responsive-images-syntax-in-html/) is a great article that goes into more depth on how to actually implement responsive images.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Responsive Images 101](https://cloudfour.com/thinks/responsive-images-101-definitions/) is a good series of articles if you need another source.

### Knowledge Check
* What is the main difference between `object-fit` and `background-size`?
* How can you define a width and a height on an `img` without distorting it?
* Why would you want to provide different images at different screen resolutions?
* When would you want to use an `img` with a `srcset` vs a `picture`?