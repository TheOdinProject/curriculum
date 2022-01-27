
### Introduction

This lesson will go over the new jsbundling-rails gem and some of the pros and cons of using this gem. The role of jsbundling is to provide installers to set up esbuild, rollup, or webpack to allow bundling. After your bundler of choice is set up, your bundled output will use `app/assets/builds` to hold the bundle output at which you can refer to it using the standard asset pipeline approach.

### Learning Outcomes

*  How to use a bundler with an import map based Rails app.
*  Understand why you might decide to use jsbundling.
*  Why you would use jsbundling over import maps.
*  Some of the downsides of using JS Bundling.
*  Why webpacker was used for Rails 6.
*  What are the JSBundling options.

### jsbundling options

Before we install the jsbundling gem let's go over a few of the options. <span id='bundle-options'></span>The three options are esbuild, rollup and webpack. esbuild is a fast lightweight bundler written in the GO language whereas other bundlers may be slower but, have more features which can make the bundler take longer to run. Esbuild manages to be fast through being built from scratch and a variety of methods such as utilizing parallelism to use all available CPU cores. If you're interested in reading more about Esbuild you can find the documentation [here](https://github.com/rails/jsbundling-rails/blob/main/docs/comparison_with_webpacker.md). Rollup is another bundler that allows you to utilize a JavaScript syntax for importing and exporting functions and data so they can be shared between separate scripts then changing them to existing supported formats. If you want to take a deeper dive into how to utilize Rollup you can find the documentation [here](https://rollupjs.org/guide/en/#introduction). The final bundler provided through jsbundling is webpack which is a static module bundler that uses an entry point within your application to create a dependency graph that then combines every module your project needs into one or more bundles to be used by your application. If you want to take a deeper dive into Webpack go [here](https://webpack.js.org/concepts/). Now that you have been introduced into the bundlers provided through jsbundling let's go into setting up jsbundling.


### Using Yarn Build Watch

Before we introduce utilizing jsbundling let's introduce a powerful new command with yarn. 

~~~bash
yarn build --watch
~~~

This command  starts by calling yarn with the build command which processes all of the entry points to your JavaScript into  ```app/assets/builds/application.js```. the ```--watch``` flag allows the bundler to watch for changes to JavaScript files within your project. When these changes happen it's starts the process of bundling those entry points into your JavaScript and updating your project. When doing this you need to be running ```rails server``` in another terminal as well. You will notice when you enter the command that the program will still be running and say ```[watch] build finished, watching for changes...```
that is the intended behavior. Then it will wait for changes to occur in your JavaScript files and proceed to rebundle them which will update the bundled file that is delivered to the asset pipeline. Another useful command you can use is ```./bin/dev``` which will start the ```yarn build --watch``` and ```rails server``` at the same time. <span id="yarn-build-command"></span>Meaning no having to enter to switch between terminal windows for developing. In development mode the command ```./bin/dev``` is useful since it allows your javascript bundle watcher and rails server to update without needing to manually update it as yarn watches for those changes automatically.</span>



### Using jsbundling-rails

First ensure that you have Yarn and Node installed. Run ```yarn -v``` and ```node -v``` in the terminal. Both of these should return a number indicating the version. 


<span id="bundler-check"></span>Now let's go through these steps with a new app and for the last step select esbuild for your JavaScript. Run the command below.</span>
~~~bash
rails new testapp
~~~
Add the jsbundling-rails gem to your Gemfile with.

~~~ruby
gem 'jsbundling-rails'
~~~

Then run the command below in the terminal within your Rails application folder.

~~~bash 
./bin/bundle install
~~~

Remember the three options for the bundler are esbuild, rollup and webpack and you pick only one. 

~~~bash
./bin/rails javascript:install:<replace the text and <> with your bundler choice>
~~~

You should have now see this error and a few other ones but don't fear!

~~~bash
✘ [ERROR] Could not resolve "@hotwired/turbo-rails"

    app/javascript/application.js:2:7:
      2 │ import "@hotwired/turbo-rails"
        ╵        ~~~~~~~~~~~~~~~~~~~~~~~
~~~ 

It's quite explicit in the issue. Resolve is just a fancy word for saying the bundler wasn't able to do anything with this import. Which makes sense as our testapp was set up initially with import maps instead of with esbuild or another bundler. Now let's see if we can resolve this in our ```app/javascript/application.js```. It looks fine so what gives? Remember that this Rails app was started with _import maps_ not a bundler. We need to install the package so that way it can be bundled appropriately. Now let's run the command below.

~~~bash
npm i @hotwired/turbo-rails
~~~

Now let's run 
~~~bash
yarn run build
~~~

The error is gone which means esbuild was able to resolve it since it was properly formatted. However that still leaves the ```✘ [ERROR] Could not resolve "controllers"```. Let's see if we can solve that to!. Remember what we said earlier about this error ```✘ [ERROR] Could not resolve "@hotwired/turbo-rails"```. We need to download the appropriate package so that esbuild can bundle it. Go ahead and enter the command below!

~~~bash
npm i stimulus
~~~

Now let's run ```yarn run build``` in the terminal. Woah we still get the error below despite adding the stimulus package for esbuild what gives?

~~~bash

 [ERROR] Could not resolve "@hotwired/stimulus-loading"

    app/javascript/controllers/index.js:6:41:
      6 │ import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
~~~

_Remember we ran this with import maps_ so the setup is different. Let's go back into our ```app/javascript/application.js``` and change ```import "./controllers"``` to ```import "./controllers/hello_controller.js"```.
Now when we run ```yarn run build``` we should get the proper outcome! Now that we have walked through how to install a Rails app with import maps let's make our life a little bit easier and set it up with jsbundling! 

Go ahead and enter the below command. 

~~~bash
rails new myapp -j <replace the text and <> with your bundler choice>
~~~

Let's walk through an example with ESBuild. In the terminal entering this command will start the Rails app creation process.

~~~bash
rails new bundling -j esbuild
~~~

When running the build app you will see different output than the output shown in the rails installation lesson. You should see something like this at the end.

~~~bash
info esbuild-windows-arm64@0.14.13: The CPU architecture "x64" is incompatible with this module.
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved lockfile.
success Saved 1 new dependency.
info Direct dependencies
└─ @hotwired/stimulus@3.0.1
info All dependencies
└─ @hotwired/stimulus@3.0.1
~~~

A key difference here is that within the terminal output you will see more output as well as that info output from ESBuild as this command is ran. Let's take a look at the results for our rails application.

In our ```package.json``` file that is where our script build is kept. Here you will see the command that was run by rails when building app. Going into the ```app/javascript/application.js``` you can see what was imported. A important caveat with ESBuild is that in ```app/javascript/controllers/index.js``` you need to run a command to add all your controllers to the ```index.js``` file. That command is 

~~~bash
./bin/rails stimulus:manifest:update
~~~

With that you will be able to add your controllers to the bundling process and use them. However _make sure_ you run this command or else not all controllers will be included.

### Why use jsbundling

You may be wondering if we have import maps why we need JSBundling at all. One of the _most_ important things to remember is that this decision 
depends on the circumstances of your project and that while import maps does have the benefits of not needing to bundle or transpile you lose a 
few benefits you would have by using jsbundling. Some frameworks like React which require compiling for JSX does not work with import maps which
leads to another important point. The Javascript system is a large ecosystem upon which bundling was introduced to reduce performance costs associated with HTTP 1. Being the case that HTTP 1 supported a limited amount of requests on a single connection, introducing many files carried a performance cost. While HTTP 2 reduced those performance costs much of the JS ecosystem _still_ requires explicit transpiling or bundling due to packages being built on the need for bundling for performance or a framework simply requiring it anyways. For your project if you want to use some of these Frameworks you may want to reach for JSBundling over import maps.

### When to use jsbundling

This may make you wonder why use import maps at all. Being able to use all of the Javascript ecosystem would surely mean I don't need to use import maps at all? Not quite, all tools have their pros and cons. Going back to the days of HTTP 1 it is important to remember there _was_ a penalty performance to making multiple requests. Following the introduction of HTTP 2 that performance penalty no longer applied and a major advantage of using bundling no longer applied. <span id='jsbundling-module'></span>Another downside to using jsbundling is that _any_ changes to the module will expire the entire bundle forcing browser to redownload everything and parse it all over again. Taking a look at import maps each module is kept _separate_ which means you don't have to redownload every single module again. Just the kind of performance jump that may make you consider using import maps over JSBundling. Often times the answer to these kind of decisions is that there is no _right answer_. It all depends on what your looking for in your project. want to use the react with JSX and don't mind a dip in performance? consider jsbundling. Have some modules in mind you want to use that don't require transpiling or bundling and want a boost in performance? consider import maps. One thing to really stress is that one is not necessarily worse than the other and it very much depends on your project needs. jsbundling gives you access to many frameworks such as react with JSX as well as certain features such as tree-shaking, whereas import maps does not require bundling and you don't need to update every module when updating a module.   


### Webpacker

Some of you may have heard of webpacker or can come across it in the wild so it's worth mentioning as it was used for quite a few years for Rails 6. <span id='webpacker-introduction'>webpacker was a ruby gem created to work with webpack itself which allowed Rails to use ES6 (short for ECMAScript 6 which was introduced to standardize javascript) as it required transpilation for use with browsers at that time. In the context of rails the webpacker builds a map of your Javascript code to build a dependency graph allowing it to generate bundles of code. Rails would grab a pack from app/javascript/packs and download it when that form is visited by the user. </span>

With Rubygems we use a Gemfile and with Webpacker we use a package.json to manage your Javascript libraries. The main difference is that with a Gemfile you need to open it and manually add the gem and version and then run bundle but with Webpack we can use Yarn from the terminal to add a library like so. 

~~~bash
yarn add bootstrap
~~~

You would then be able reference it within your pack file and now be able to use it! 

While you may come across this in the wild it is important to note that Rails 7 does not use it any longer and replaces with JSBundling. If you want to use bundling make sure to use one of the bundlers listed earlier in the lesson.

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.*

* [good mention of why JSBundling is still a valid option by David Heinemeier Hansson](https://world.hey.com/dhh/modern-web-apps-without-javascript-bundling-or-transpiling-a20f2755).
* [high level look over JSBundling versus webpacker if your interested in the differences](https://github.com/rails/jsbundling-rails/blob/main/docs/comparison_with_webpacker.md).

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='#bundle-options'>What are the three different options that JSBundling provides?</a>
- <a class="knowledge-check-link" href='#bundler-check'>What are the steps to including a bundler for a import map based project?</a>
- <a class="knowledge-check-link" href='#jsbundling-module'>What is one downside to using jsbundling?</a>
- <a class="knowledge-check-link" href='#webpacker-introduction'>Why was Webpacker introduced for Rails 6?</a>
- <a class="knowledge-check-link" href='#yarn-build-command'>Why is the ```./bin/dev``` command useful in development mode?</a>
