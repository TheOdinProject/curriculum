# Lesson Title

JS Bundling

### Introduction

This lesson will go over the new jsbundling gem and some of the pros and cons of using this gem. jsbundling's role is to provide installers to set up esbuild, rollup, or Webpack to allow bundling. After the your bundler of choice is set up, your bundled output will use `app/assets/builds` to hold the bundle otput at which you can refer to it using the standard asset pipeline approach.

### Learning Outcomes

*   Understood why you might decide to use jsbundling.
*   Why you would use jsbundling over import maps.
*   Some of the downsides of using JS Bundling.
*   Why webpacker was used for Rails 6.
*   What are the JSBundling options.

### JSBundling options

Before we install jsbundling let's go over a few of the options. <span id='#bundle-options'></span>The three option are Esbuild, Rollup and Webpack. Esbuild is a fast lightweight bundler written in the GO language whereas other bundlers may be slower but, have more features as a cause. Esbuild manages to be fast through being built from scratch and a variety of methods such as utilizing parallelism to use all available CPU cores which if your interested in reading more about Esbuild you can find [here](https://github.com/rails/jsbundling-rails/blob/main/docs/comparison_with_webpacker.md). Rollup is another bundler that allows you to utilize a JavaScript syntax for importing and exporting functions and data so they can be shared between separate scripts then changing them to existing supported formats. If you want to take a deeper dive into how to utilize Rollup you can find the documentation[here](https://rollupjs.org/guide/en/#introduction). The final bundler provided through jsbundling is webpack which is a static module bundler that uses an entry point within your application to create a dependency graph that then combines every module your project needs into one or more bundles to be used by your application. If you want to take a deeper dive into Webpack go [here](https://webpack.js.org/concepts/). Now that you have been introduced into the bundlers provided through jsbundling let's go into setting up jsbundling.



### Setting up JSBundling

First ensure that you have Yarn and Node installed

1. Add jsbundling-rails to your Gemfile with 
~~~ruby
gem 'jsbundling-rails'
~~~
2. Run 
~~~bash 
./bin/bundle install
~~~

Remember the three options for the bundler are esbuild, rollup and webpack and you pick only one.
3. Run 
~~~bash
./bin/rails javascript:install:<replace the text and <> with your bundler choice>
~~~
You can also preconfigure your application to use a bundler through the command choosing one of the three options.

~~~bash
rails new myapp -j <replace the text and <> with your bundler choice>
~~~
### Why JSBundling

You may be wondering if we have import maps why we need JSBundling at all. One of the _most_ important things to remember is that this decision 
depends on the circumstances of your project and that while import maps does have the benefits of not needing to bundle or transpile you lose a 
few benefits you would have by using jsbundling. 
<span id="#react-check"></span>
Some frameworks like React which require compiling for JSX does not work with import maps which
leads to another important point. The Javascript system is a large ecosystem upon which bundling was introduced to reduce performance costs associated with HTTP 1. Being the case that HTTP 1 supported a limited amount of requests on a single connection, introducing many files carried a performance cost. While HTTP 2 reduced those performance costs much of the JS ecosystem _still_ requires explicit transpiling or bundling due to packages being built on the need for bundling for performance. For your project if you want to use some of these Frameworks you may want to reach for JSBundling over import maps.

This may make you wonder why use import maps at all. Being able to use all of the Javascript ecosystem would surely mean I don't need to use import maps at all? Not quite, all tools have their pros and cons. Going back to the days of HTTP 1 it is important to remember there _was_ a penalty performance to making multiple requests. Following the introduction of HTTP 2 that performance penalty no longer applied and a major advantage of using bundling no longer applied. <span id='#jsbundling-module'></span>Another downside to using JSBundling is that _any_ changes to the module will exipre the entire bundle forcing browser to redownload everything and parse it all over again. Taking a look at import maps each module is kept _separate_ which means you don't have to redownload every single module again. Just the kind of performance jump that may make you consider using import maps over JSBundling. Often times the answer to these kind of decisions is that there is no _right answer_. It all depends on what your looking for in your project. want to use the react with JSX and don't mind a dip in performance? consider JSBundling. Have some modules in mind you want to use that don't require transpiling or bundling and want a boost in performance? consider import maps. One thing to really stress is that one is not necessarily worse than the other. JSBundling gives you access to many frameworks such as react with JSX as well as certain features such as tree-shaking, whereas import maps does not require bundling and you don't need to update every module when updating a module.  


### Webpacker

Some of you may have heard of webpacker or can come across it in the wild so it's worth mentioning as it was used for quite a few years for Rails 6. <span id='#webpacker-introduction'></span>Webpacker was a ruby gem created to work with webpack itself which allowed Rails to use ES6 (short for ECMAScript 6 which was introduced to standardize javascript) as it required transpilation for use with browsers at that time. In the context of rails the webpacker builds a map of your Javascript code to build a dependency graph allowing it to generate bundles of code. Rails would grab a pack from app/javascript/packs and download it when that form is visited by the user. 

With Rubygems we use a Gemfile and with Webpacker we use a package.json to manage your Javascript libraries. The main difference is that with a Gemfile you need to open it and manually add the gem and version and then run bundle but with Webpack we can use Yarn from the terminal to add a library like so. 

~~~bash
yarn add bootstrap
~~~

You would then be able reference it within your pack file and now be able to use it! 

While you may come across this in the wild it is important to note that Rails 7 does not use it any longer and replaces with JSBundling. If you want to use bundling make sure to use one of the bundlers listed earlier in the lesson.

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.*

* https://world.hey.com/dhh/modern-web-apps-without-javascript-bundling-or-transpiling-a20f2755 good mention of why JSBundling is still a valid option by David Heinemeier Hansson.
* https://github.com/rails/jsbundling-rails/blob/main/docs/comparison_with_webpacker.md high level look over JSBundling versus webpacker if your interested in the differences.

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='bundle-options'>What are the three different options that JSBundling provides?</a>
- <a class="knowledge-check-link" href='react-check'>Does the react framework require bundling?</a>
- <a class="knowledge-check-link" href='jsbundling-module'>If I change one module when using JSBundling does every module need to be updated?</a>
- <a class="knowledge-check-link" href='webpacker-introduction'>Why was Webpacker introduced for Rails 6?</a>
