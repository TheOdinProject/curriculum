Before we get into frameworks, it's useful to learn about templating tools.  Basically, these will let you set up a template (like a Rails layout/view) and insert basic dynamic elements (like loops) into it with minimal effort and without the need to build out a sophisticated back end to handle it.  You'll find that most templates feel a whole lot like ERB did in Rails views -- a way of passing snippets of dynamic code and variables into your HTML.

Some of the more common templating languages include [Mustache](http://mustache.github.io/) and [Handlebars](http://handlebarsjs.com/) (so named because they typically use curly braces {{to surround}} inserted code).

### Points to Ponder

* What is a client-side template?
* How is this similar to ERB you used in Rails?
* How do you include Mustache.js in your project?
* How do you use Mustache to display a group of `<div>`'s?

### Your Assignment

1. Read [Smashing Magazine on Client Side Templating](http://coding.smashingmagazine.com/2012/12/05/client-side-templating/), which starts from scratch and gives lots of examples
2. Read [Learning about Handlebars Templating from JSIS](http://javascriptissexy.com/handlebars-js-tutorial-learn-everything-about-handlebars-js-javascript-templating/) to get an in-depth guide on Mustache.  You can skip the early stuff if you've already got a good handle on the theory of templating.

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* Glance over [An overview of JS templates from Creative Bloq](http://www.creativebloq.com/web-design/templating-engines-9134396) for more examples.
* [Introduction to Javascript Templating with Mustache](http://iviewsource.com/codingtutorials/introduction-to-javascript-templating-with-mustache-js/)
* [Why LinkedIn chose Dust.js for Templating](http://engineering.linkedin.com/frontend/client-side-templating-throwdown-mustache-handlebars-dustjs-and-more) (includes a breakdown of the other popular choices)
