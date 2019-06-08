### Introduction

Sometimes you end up with a chain of different files and assets like images and stylesheets and javascript files and it's a real pain to get them all mashed together the way you need to in order to ship the site, especially if you're adding in preprocessors and uglifiers.  Luckily people have created build tools like [Grunt](http://gruntjs.com/) whose sole purpose is to make this work flow easier for you.

Most of these tools use Javascript and are built to help people programming with Javascript, so you don't really need to know them right off the bat.  **Consider this section optional**.  I'll probably move this into the Javascript section at some point.  Just browse through the articles and try to get an understanding of what's going on.

One good reason to use Rails when you're learning?  It gives you all this for free with the [Asset Pipeline](/ruby-on-rails/the-asset-pipeline).

### Learning Outcomes

* Why are automatic build tools useful?
* Why would you want to concatenate your CSS and Javascript files?
* Why would you want to minify/uglify your files?
* What is a work flow like which includes build tools?
* What are the common build tools?

### Assignment
Don't get carried away with this stuff yet -- try to absorb what you can but don't spend too much time on it right now.  You can always come back to this section later when your workflow needs it.

<div class="lesson-content__panel" markdown="1">
1. Read [Grunt for People Who Think Things Like Grunt are Weird and Hard by Chris Coyier](http://24ways.org/2013/grunt-is-not-weird-and-hard/)
3. [Get up and Running with Grunt from Smashing Magazine](http://coding.smashingmagazine.com/2013/10/29/get-up-running-grunt/)
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Workflow Orchestration for the Wary from A List Apart](http://alistapart.com/column/workflow-orchestration-for-the-wary)
* [SO answer on using the Grunt automatic build tool](http://stackoverflow.com/questions/13713273/how-to-concatenate-and-minify-multiple-css-and-javascript-files-with-grunt-js)
* [Grunt docs](http://gruntjs.com/)
* [Yeoman docs](http://yeoman.io/).  Yeoman is a workflow tool that uses Grunt, a scaffolding tool called "yo" and "Bower", which manages dependencies among scripts in your app.
