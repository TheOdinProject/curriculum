### Introduction

This lesson will go over the new [jsbundling-rails](https://github.com/rails/jsbundling-rails) gem and some of the pros and cons of using this gem.

The role of jsbundling-rails is to provide installers to set up esbuild, rollup, or webpack to allow bundling. After your bundler of choice is set up, your bundled output will use `app/assets/builds` to hold the bundle output at which you can refer to it using the standard asset pipeline approach.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

-  How to use a bundler with an import map based Rails app.
-  Why you might use JS bundling over import maps.
-  Some of the downsides of using JS Bundling.
-  Why Webpacker was used for Rails 6.
-  What the JS bundling options are.

### JS bundling options

Before we install the jsbundling-rails gem let's go over a few of the options. <span id='bundle-options'></span>The three options are:

#### Esbuild
Esbuild is a fast lightweight bundler written in [Go](https://go.dev/doc/). Whereas other bundlers may be slower, but have more features which can make the bundler take longer to run. Esbuild manages to be fast with variety of methods such as utilizing parallelism to use all available CPU cores.

If you're interested in reading more about esbuild you can find the documentation [here](https://esbuild.github.io/).

#### Rollup
 Rollup is another bundler that allows you to utilize a JavaScript syntax for importing and exporting functions and data so they can be shared between separate scripts then changing them to existing supported formats.

 If you want to take a deeper dive into how to utilize Rollup you can find the documentation [here](https://rollupjs.org/guide/en/#introduction).

#### Webpack
The final bundler provided through jsbundling-rails is webpack which is a static module bundler that uses an entry point within your application to create a dependency graph that then combines every module your project needs into one or more bundles to be used by your application. If you want to take a deeper dive into webpack go [here](https://webpack.js.org/concepts/).

Now that you have been introduced into the bundlers provided through jsbundling-rails let's go into setting it up.

### Using yarn build watch

Before we introduce utilizing jsbundling-rails let's introduce a powerful new command with yarn.

~~~bash
yarn build --watch
~~~

This command  starts by calling yarn with the build command which processes all of the entry points to your JavaScript into  `app/assets/builds/application.js`.

The `--watch` flag allows the bundler to watch for changes to JavaScript files within your project. When these changes happen it starts the process of bundling those entry points into your JavaScript and updating your project.

When doing this you need to be running `rails server` in another terminal as well. You will notice when you enter the command that the program will still be running and say `[watch] build finished, watching for changes...`. That is the intended behavior.

It will wait for changes to occur in your JavaScript files and proceed to rebundle them which will update the bundled file that is delivered to the asset pipeline.

Another useful command you can use is `./bin/dev` which will start the `yarn build --watch` and `rails server` at the same time. <span id="yarn-build-command"></span>That means not having to switch between terminal windows for developing. In development mode the command `./bin/dev` is useful since it allows your JavaScript bundle watcher and Rails server to update without needing to manually update it as yarn watches for those changes automatically.

### Using jsbundling-rails

First ensure that you have Yarn and Node installed. Run `yarn -v` and `node -v` in the terminal. Both of these should return a number indicating the version.

<span id="bundler-check"></span>Now let's go through these steps with a new app and for the last step select esbuild for your JavaScript. Run the command below.

~~~bash
rails new testapp
~~~

Add the jsbundling-rails gem to your Gemfile.

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

You should now see this error and a few other ones but don't fear!

~~~bash
✘ [ERROR] Could not resolve "@hotwired/turbo-rails"

app/javascript/application.js:2:7:
2 │ import "@hotwired/turbo-rails"
╵        ~~~~~~~~~~~~~~~~~~~~~~~
~~~

It's quite explicit in the issue. Resolve is just a fancy word for saying the bundler wasn't able to do anything with this import. Which makes sense as our testapp was set up initially with import maps instead of with esbuild or another bundler.

Now let's see if we can resolve this in our `app/javascript/application.js`. It looks fine so what gives? Remember that this Rails app was started with _import maps_ not a bundler. We need to install the package so that way it can be bundled appropriately.

Now let's run the command below.

~~~bash
yarn add @hotwired/turbo-rails
~~~

Next, run the build command.

~~~bash
yarn run build
~~~

The error is gone which means esbuild was able to resolve it since it was properly formatted. However that still leaves the `✘ [ERROR] Could not resolve "controllers"`.

Let's see if we can solve that too! Remember what we said earlier about this error `✘ [ERROR] Could not resolve "@hotwired/turbo-rails"`. We need to download the appropriate package so that esbuild can bundle it. Go ahead and enter the command below!

~~~bash
yarn add stimulus
~~~

Now let's run `yarn run build` in the terminal. Woah! We still get the error below despite adding the stimulus package for esbuild. What gives?

~~~bash

[ERROR] Could not resolve "@hotwired/stimulus-loading"

app/javascript/controllers/index.js:6:41:
6 │ import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
~~~

_Remember we ran this with import maps_ so the setup is different. Let's go back into our `app/javascript/application.js` and change `import "./controllers"` to `import "./controllers/hello_controller.js"`.

Now when we run `yarn run build` we should get the proper outcome! Now that we have walked through how to install a Rails app with import maps let's make our life a little bit easier and set it up with jsbundling-rails!

Go ahead and enter the below command.

~~~bash
rails new myapp -j <replace the text and <> with your bundler choice>
~~~

Let's walk through an example with esbuild. In the terminal entering this command will start the Rails app creation process.

~~~bash
rails new bundling -j esbuild
~~~

When running the build app you will see different output than the output shown in the Rails installation lesson. You should see something like this at the end.

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

A key difference here is that within the terminal output you will see more output as well as that info output from esbuild as this command is ran. Let's take a look at the results for our Rails application.

In our `package.json` file that is where our script build is kept. Here you will see the command that was run by Rails when building app. Going into the `app/javascript/application.js` you can see what was imported.

An important caveat with esbuild is that in `app/javascript/controllers/index.js` you need to run a command to add all your controllers to the `index.js` file. That command is

~~~bash
./bin/rails stimulus:manifest:update
~~~

With that you will be able to add your controllers to the bundling process and use them. However _make sure_ you run this command or else not all controllers will be included.

### Why use JS bundling

You may be wondering why we even need JS bundling when we have import maps. One of the _most_ important things to remember is that this decision depends on the circumstances of your project and that while import maps eliminates the need for bundling and transpiling, you lose out on some of the benefits of using JS bundling.

Some frameworks like React, which require compiling for JSX, do not work with import maps which leads to another important point. The JavaScript ecosystem is vast, and bundling was introduced to mitigate performance costs associated with HTTP 1. Because HTTP 1 limited the number of requests per connection, sending many files carried a performance cost.

Although HTTP 2 has reduced these costs, many JS packages still require explicit transpiling or bundling for performance or because of framework requirements. If you plan to use such frameworks for your project, it may be best to choose JS bundling over import maps.

### When to use JS bundling

At this point, you might be wondering why import maps are even necessary. Being able to use all of the JavaScript ecosystem would surely mean you don't need to use import maps at all, right? Not quite. All tools have their pros and cons.

It is important to remember that, in the days of HTTP 1, there _was_ a performance penalty associated with making multiple requests. Since the introduction of HTTP 2, that performance penalty no longer applies. Therefore, one of the main benefits of using bundling, which was to mitigate the costs associated with HTTP 1, has become less significant.

<span id='jsbundling-module'></span>Another downside to using JS bundling is that any changes to a module will expire the entire bundle, requiring the browser to redownload and parse everything from scratch.

In contrast, import maps keeps the modules separate, so you don't have to redownload every single module anytime something changes. Just the kind of performance jump that may make you consider using import maps over JS bundling.

Oftentimes, the answer to these kinds of decisions is that there is no _right answer_. It all depends on what you're looking for in your project. Want to use React with JSX and don't mind a dip in performance? Consider JS bundling. Have some modules in mind you want to use that don't require transpiling or bundling and want a boost in performance? Consider import maps.

One thing to really stress is that one is not necessarily worse than the other and it very much depends on your project needs. JS bundling gives you access to many frameworks such as React with JSX as well as certain features such as tree-shaking, whereas import maps does not require bundling and you don't need to update every module when updating a module.


### Webpacker

You may have heard of Webpacker or have come across it in the wild so it's worth mentioning as it was used for quite a few years for Rails 6.

<span id='webpacker-introduction'> </span>Webpacker was a Ruby gem created to work with webpack itself which allowed Rails to use ES6 (short for ECMAScript 6 which was introduced to standardize JavaScript) as it required transpilation for use with browsers at that time.

In the context of Rails, Webpacker builds a map of your JavaScript code to build a dependency graph allowing it to generate bundles of code. Rails would grab a pack from app/javascript/packs and download it when that form is visited by the user.

With Ruby gems we use a Gemfile and with Webpacker we use a package.json to manage your JavaScript libraries. The main difference is that with a Gemfile you need to open it and manually add the gem and version and then run bundle but with webpack we can use Yarn from the terminal to add a library like so.

~~~bash
yarn add bootstrap
~~~

You would then be able to reference it within your pack file and now be able to use it!

While you may come across this in the wild it is important to note that Rails 7 does not use it any longer and replaces it with jsbundling-rails. If you want to use bundling make sure to use one of the bundlers listed earlier in the lesson.

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [What are the three different options that jsbundling-rails provides?](#bundle-options)
- [What are the steps to including a bundler for an import map based project?](#bundler-check)
- [What is one downside to using JS bundling?](#jsbundling-module)
- [Why was Webpacker introduced for Rails 6?](#webpacker-introduction)
- [Why is the `./bin/dev` command useful in development mode?](#yarn-build-command)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [good mention of why JS bundling is still a valid option by David Heinemeier Hansson](https://world.hey.com/dhh/modern-web-apps-without-javascript-bundling-or-transpiling-a20f2755).
- [high level look over jsbundling-rails versus webpacker if your interested in the differences](https://github.com/rails/jsbundling-rails/blob/main/docs/comparison_with_webpacker.md).
