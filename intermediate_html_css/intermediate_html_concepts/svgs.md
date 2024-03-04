### Introduction

SVGs are a very common image format on the web. They can be a little confusing at first, but once you know how to use them, they are an incredibly powerful tool for creating high-quality, dynamic images for your website.

In this lesson, we will learn exactly what SVGs are, what they're used for, and how you can embed them in your websites.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

-   What SVGs, Vector Graphics, and XML are.
-   How to create simple SVGs and add them to your websites.
-   When to use SVGs, and when a different image format would be more appropriate.

### What are SVGs?

SVGs are a _scalable_ image format, which means they will easily scale to any size and retain their quality without increasing their filesize. They're also very useful if you need to create or modify your images programmatically, because you can change their properties through CSS and JavaScript.

SVGs are often used for:

1.  Icons
2.  Graphs/Charts
3.  Large, simple images
4.  Patterned backgrounds
5.  Applying effects to other elements via SVG filters

### Okay, but what are they?

"SVG" stands for "Scalable Vector Graphics". Vector graphics are images defined by math, as opposed to traditional "raster graphics", where your image is defined by a grid of pixels. With raster graphics, the detail is limited to the size of that pixel grid. If you want to increase the size of the image (_scale_ it), you have to increase the size of that grid. How do you decide what all those new pixels should look like? There's no simple solution. Additionally, the larger the grid, the bigger your filesize grows.

With vector graphics on the other hand, there's no grid. Instead, you have formulas for different shapes and lines. Since these are just formulas, it doesn't matter how large or small you want them to appear--they can scale to any size you want, and it will have no effect on the quality or the size of the file.

SVGs have another interesting aspect to them: they're defined using XML. XML (aka, "Extensible Markup Language") is an HTML-like syntax which is used for lots of things, from [APIs](https://en.wikipedia.org/wiki/API), to [RSS](https://en.wikipedia.org/wiki/RSS), to [spreadsheet and word editor software](https://en.wikipedia.org/wiki/Office_Open_XML).

The fact that SVG source-code is XML has a few key benefits.

First, it means that it is _human-readable_. If you were to open up a JPEG in a text editor, it would just look like gobbledygook. If you were to open up an SVG, however, it would look something like this:

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
    <rect x=0 y=0 width=100 height=50 />
    <circle class="svg-circle" cx="50" cy="50" r="10"/>
</svg>
```

It might still be confusing, but hey--those are words! Tags! Attributes! Compared to [binary file formats](https://en.wikipedia.org/wiki/Binary_file) like JPEG, we're definitely in familiar territory.

The second benefit of XML is that it's designed to be interoperable with HTML, which means you can put the above code directly in an HTML file, without any changes, and it should display the image. And because these can become elements in the DOM just like HTML elements, you can target them with CSS and create them using the [Element WebAPI](https://developer.mozilla.org/en-US/docs/Web/API/Element) you've already been using!

### Drawbacks

So, clearly SVGs are awesome! Time to go convert all of our images to SVG, right? Well, not quite. SVGs are _great_ for relatively simple images, but because every single detail of the image needs to be written out as XML, they are extremely inefficient at storing complex images. If your image is supposed to be photo-realistic, or it has fine detail or texture ("[grunge textures](https://unsplash.com/s/photos/grunge-texture)" are a great example), then SVGs are the wrong tool for the job.

### Anatomy of an SVG

Typically, you will not want to create SVGs from scratch in your code. Most often, you will download the file or copy the code either from a website or from an image editor that can create them (Adobe Illustrator and Figma are two popular apps that can create SVGs). However, it's pretty common to download an SVG and want to tweak or adjust it just a little bit, so knowing what all the bits and pieces are, and how they work is very useful.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="NWaGdmL" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/NWaGdmL">
  Simple SVG Example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

1.  `xmlns` - stands for "XML NameSpace". This specifies what _dialect_ of XML you're using. In our case, that dialect is the SVG language spec. Without it, some browsers will not render your image or will render it incorrectly. If you're interested in a full breakdown of what this attribute is and why it's necessary, check out [this excellent MDN article](https://developer.mozilla.org/en-US/docs/Web/SVG/Namespaces_Crash_Course).
2.  `viewBox` - defines the bounds of your SVG. When you have to define the positions of different points of the elements in your SVG, this is what that's referencing. It also defines the aspect ratio _and_ the origin of your SVG. So it's doing quite a lot! Be sure to play around with different values in the example above to get a feel for how it affects the shapes.
3.  `class`, `id` - these attributes function just like they do in HTML. Using these in SVGs allows you to easily target an element via CSS or JavaScript, or to reuse an element via the [`use` element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/use).
4.  Elements such as `<circle>`, `<rect>`, `<path>`, and `<text>` are defined by the SVG namespace. These are our basic building-blocks. Although you can make extremely complex images with SVG, they are mostly created with just a dozen or so of these basic elements. You can see a complete list of SVG elements [here](https://developer.mozilla.org/en-US/docs/Web/SVG/Element).
5.  Many SVG attributes, such as `fill` and `stroke`, can be [changed in your CSS](https://css-tricks.com/svg-properties-and-css/).

Play around with the code above and try to get a feel for what's happening. What happens when you change the viewBox dimensions? Or the attributes of an element?

### Embedding SVGs

There are two main approaches when deciding how to actually place the SVG in your document: linked, and inline.

Linking SVGs works basically the same way as linking any other image. You can use an HTML image element such as `<img>`, or link it in your CSS using `background-image: url(./my-image.svg)`. They will still scale properly, but the contents of the SVG will not be accessible from the webpage.

The alternative is to inline your SVGs by pasting their contents directly into your webpage's code, rather than linking to it as an image. It will still render correctly, but the SVG's properties will be visible to your code, which will allow you to alter the image dynamically via CSS or JavaScript.

Inlining SVGs allows you to unlock their full potential, but it also comes with some serious drawbacks: it makes your code harder to read, makes your page less cacheable, and if it's a large SVG it might delay the rest of your HTML from loading.

Some of the drawbacks of inlining SVG code can be avoided once you've learned a front-end JavaScript library like React, or a build-tool like webpack. We aren't quite ready to get into those yet, so just keep that in the back of your mind.

For now, just do whichever works best for your use-case. Linking is generally cleaner and simpler, so prefer that unless you need to tweak the SVG code alongside your HTML.

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

-   [What is the `xmlns` attribute?](#anatomy-of-an-svg)
-   [What are some situations where you _wouldn't_ want to use SVG?](#drawbacks)
-   [What are the benefits of "inlining" your SVGs? What are the drawbacks?](#embedding-svgs)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

1.  There are lots of great free SVG icon libraries. A few worth checking out: [Material icons](https://fonts.google.com/icons), [Feather icons](https://feathericons.com/), [The Noun Project](https://thenounproject.com/term/free/), and [Ionicons](https://ionic.io/ionicons).
2.  If you want a deep-dive into the details of SVGs and their elements, the [MDN tutorial](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial) is a great place to start.
3.  If you want to get started making your own SVGs, you'll want some sort of visual editor.
    1.  [This is a great little SVG editor](https://yqnn.github.io/svg-path-editor) for learning how the SVG markup works. It not only shows the XML, but also lets you see the "commands" you're using to generate the SVG. This website isn't really designed for making complex graphics, though.
    2.  For that, an excellent option is [Inkscape](https://inkscape.org/), which is not only free but open source!
    3.  And if you're really invested in creating your own SVGs, you might want to check out some of the powerful paid options out there, such as [Affinity Designer](https://affinity.serif.com/designer/).
4.  If you want to use SVGs to generate images programmatically, there are at least two major, modern libraries for that: [snap.svg](http://snapsvg.io/) and [SVG.js](https://svgjs.dev/docs/3.0/).
5.  For data visualization, [d3](https://d3js.org/) has been the standard for many, many years.
6.  If you're interested in some of the more advanced things you can do with SVGs, check out [this video on SVG animation](https://www.youtube.com/watch?v=UTHgr6NLeEw), and this article on [SVG Filters, and Why They're Awesome](https://www.smashingmagazine.com/2015/05/why-the-svg-filter-is-awesome/)!
