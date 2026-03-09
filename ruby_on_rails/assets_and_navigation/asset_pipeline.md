### Introduction

You've learned about Models, Views, and Controllers.  That's the nuts and bolts, but we've got plenty of neat stuff to cover which makes Rails much more useful to you.  In this lesson, we'll talk about the Asset Pipeline and a few other topics that don't necessarily fit well in other lessons but are important to cover nonetheless.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How files are processed in the Asset Pipeline.
- Organization of stylesheets and images in your app.

### The asset pipeline

Assets in your application are additional files that get called by the browser after your initial gob of HTML is received. The word "assets" is used to mean things like CSS stylesheets, JavaScript files, images, videos, etc.—basically anything that requires an additional request to grab.

The Asset Pipeline is one of a few different ways to handle assets in Rails. You will learn about other ways to manage CSS and JS as you move through this course. It may well depend on where you end up working what convention they follow, but as you learn more, you'll understand how the Asset Pipeline differs from alternatives as well as how to use any of the available methods to handle assets in your application. Here we will cover how the Asset Pipeline works, and in future lessons we will cover the alternatives. For your own projects we suggest using import maps for JavaScript code and the Asset Pipeline for other assets.

Getting back to the Asset Pipeline, often times, it's easiest to organize your code for development purposes into many different files so you can keep track of them better. But if the browser has to grab a dozen different CSS files, each one of those requests is going to slow things down. Too many requests and you've harpooned your user's experience with your application.

A similar organizational issue has to do with storing things like images. It's easier to keep them separated in your directory, but you want them to be really easy to link to so your image tags are robust.

The Asset Pipeline helps us tackle these issues.

### History

Before diving into the specifics of the Asset Pipeline, it can be nice to understand some of Rails's history with asset management. It used to be that the Asset Pipeline handled all assets, but it is now better practice to handle JavaScript assets through other JavaScript management tools that come with modern Rails applications. In the next lesson, you'll learn about "import maps," which became the standard way to add and manage JavaScript files with the release of Rails 7.

Prior to Rails 8, the Asset Pipeline was handled through a library called `sprockets`. `sprockets` had more capabilities than the current Asset Pipeline, offering features like minification, concatenation, transpiling, etc. The Rails team decided that these features came with a lot of maintenance overhead and weren't entirely necessary in a world with broad support for ES6 (which brought JS modules to the browser) and HTTP/2.0 (which brought the ability to serve multiple requests over a single TCP connection).

Now, the Asset Pipeline is handled through a library called `propshaft`, which has a more stripped down set of features but is also much simpler and requires less configuration. If developers have more complicated needs with serving CSS and/or JavaScript, they're encouraged to reach for solutions outside of the Asset Pipeline.

Knowing some of this history can be valuable as many apps that use Rails aren't necessarily going to be on the cutting edge. Many Rails apps will still be using `sprockets` to serve assets, and while this curriculum won't dive deep into it, it's good to at least be aware of it and how it's different from `propshaft`.

### Fingerprinting

Rails uses something called "fingerprinting" to add unique identifiers to asset filenames. When the browser goes to fetch `application.css` (for example), you may notice that it's called something like `application-1fc71ddbb281c144b2ee4af31cf0e308.css`. That big string of nonsense in the URL is the "fingerprint", and it's meant to assist with browser caching. Browsers automatically attempt to cache various assets based on their URL, which can speed up performance as the browser won't have to request an asset if it already has it stored. These fingerprints serve as a type of versioning for the browser. If you make a change to `application.css`, Rails will know it needs to change the fingerprint in the URL to that asset, and the browser, which won't find the new asset URL in its cache, will know that it has to fetch the new stylesheet.

This fingerprinting is automatically provided when using Rails's link helpers. So a CSS file linked in the `<head>` element of `app/views/layouts/application.html.erb` would look like:

```erb
<head>
  <%= stylesheet_link_tag "application" %>
</head>
```

### Images

For images, the asset pipeline keeps them in the `/assets` directory unless you've made your own subdirectories.  Use `image_tag`'s to avoid confusion, e.g. `<%= image_tag "fuzzy_slippers.jpg" %>` will look for a file named `fuzzy_slippers.png` in the `/assets/images` folder. You can also organize images into subdirectories, which is helpful as applications grow and use more images and icons.

### Assignment

Some necessary and straightforward reading on the Asset Pipeline:

<div class="lesson-content__panel" markdown="1">

  1. Read [Rails Guides on the Asset Pipeline](https://guides.rubyonrails.org/asset_pipeline.html) sections 1 to 3.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How does the Asset Pipeline help with browser caching of your assets?](#fingerprinting)
- [How do you include an asset in your views or layout?](https://guides.rubyonrails.org/asset_pipeline.html#digested-assets-in-views)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Ryan Bates' asset pipeline Railscast](http://railscasts.com/episodes/279-understanding-the-asset-pipeline?view=asciicast)
- [Schneems on the Asset Pipeline](https://www.youtube.com/watch?v=FYdBpNUVxuI)
