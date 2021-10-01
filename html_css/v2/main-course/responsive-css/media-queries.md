### Introduction
With media queries it is possible to completely restyle your web projects based on the size of a user's screen. All of the lessons we've had so far have focused on making sure that the individual elements of your layout are as flexible as possible, but sometimes you will just need to shift things in your layout, or adjust values such as font-size or margins to accommodate specific sizes.

### Learning Outcomes
* You'll learn how to implement media queries

### Media Query Syntax

The basic syntax for media queries is actually very simple.
~~~css
body {
  margin: 24px;
}

@media (max-width: 600px) {
  body {
    margin: 8px;
  }
}
~~~

In the above example, margin is changed based on screen size.  Specifically, on all screens _below or equal to_ 600px, the margin will be `8px`, and on all screens _above_ 600px, it will be `24px`.

Really, that's all there is to it. You can create some complex shifting layouts with just this knowledge alone. You can create an unlimited number of media queries in a single document (Click the 'Edit on CodePen' button so you can resize your screen and see the changes):

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="PojgWGL" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/PojgWGL">
  media queries 1</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

You can also put any number of style definitions inside a media query:

<p class="codepen" data-height="300" data-default-tab="css,result" data-slug-hash="PojgWaM" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/PojgWaM">
  media queries 2</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Tips

#### Other Queries
In all of the above examples our queries specify a `max-width` which will apply styles to any screen resolution _below_ the given style. Said another way: a `max-width` query will apply on any screen up to the defined `max-width`. It is also possible to define a `min-width`, which applies to screens that are _larger_ than the given value. `max-height` and `min-height` are also valid.

#### Limit Media Queries
As mentioned earlier, it is entirely possible to create an unlimited number of media queries effecting every possible screen size. It is best practice however to try to minimize your media-query usage and try to rely more on the natural flexibility of your layouts. Consider the second embedded example above ("my cool site"). Really, it only _needs_ one media query to accommodate all desktop and mobile sizes, and there's no real need to create more.

#### Common Breakpoints
'Breakpoint' is the term for the screen-size that triggers your media-query. You will find quite a lot of differing opinions on what exactly your breakpoints should be. In general though it's helpful to think about the kinds of devices and screens that your users will be using. Mobile phones are usually under 500px. Tablets are often between 500 and 1000px and anything larger than 1000px is likely to be a normal browser screen.

This does _not_ mean, however that you should just start your project with a media queries for each device. Each project is going to have different requirements based on the design you're trying to achieve. As mentioned above, try to limit your breakpoints to just what you _need_. With many relatively simple layouts, you can get by with only one mobile-centric breakpoint somewhere around `500`-`600px`. More complex layouts might benefit from doing a full sized layout above `1200px`, an altered "tablet" layout between `600px` and `1200px` and mobile below `600px`. The real takeaway here is that it doesn't really matter exactly where you set your breakpoints... just do what makes sense for your project.

#### Zooming!
Something to be aware of: in most browsers, zooming in on a webpage will change the effective resolution of that page. So if your browser windows is exactly `1000px` wide, zooming in will cause the page to behave as if the screen is _smaller_, and will trigger media-queries based on the simulated/zoomed screen resolution. Zooming _out_ can be handy for debugging issues that arise on screens that are larger than your actual computer screen... and forgetting that you've zoomed in or out on a webpage can cause some real confusion when breakpoints refuse to trigger at the correct points.

### Print Styles
You'll often see media queries defined with the `screen` keyword like so:

~~~css
@media screen and (max-width: 480px) {
}
~~~

This is mostly unnecessary, but points toward another very useful capability of media queries: changing styles based on media-type. Everything we've covered so far has been specifically intended for viewing on some kind of screen so specifying `screen` is somewhat redundant. It is possible, however, to create a different set of styles for your website when it is sent to your printer or viewed in print-preview mode by using the `print` keyword.

~~~css
@media print {
  /* print styles go here! */
}
~~~

This is not something we're going to focus on in this curriculum, but in some cases it may be something you want to consider taking advantage of. It's fairly common to change some colors (i.e. make things black/white) and add `display: none` to hide elements that are useless in a printed environment (buttons, nav-links etc.).

### Assignment
<div class="lesson-content__panel" markdown="1">
1. Look through [Using media queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries) on MDN. There are a few additional things you can do with media-queries that might be worth knowing about, though their usage is much less common.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something

* This [Media Query Tutorial](https://www.freecodecamp.org/news/css-media-queries-breakpoints-media-types-standard-resolutions-and-more/) on FreeCodeCamp covers the same items we've touched on here.

### Knowledge Check
* <a class="knowledge-check-link" href="#media-query-syntax">How do you define a media query to create a mobile layout for your site?</a>
* <a class="knowledge-check-link" href="#tips">What is the difference between `max-width` and `min-width` in a media query definition?</a>