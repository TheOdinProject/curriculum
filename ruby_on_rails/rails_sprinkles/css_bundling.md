### Introduction

You've already learned about the default way that Rails handles processing CSS as part of the Asset Pipeline. However with the continued growth of different CSS pre-processors and bundlers there was a gap to a conventional way to use these tools. As part of the Rails 7 release came an optional gem called [cssbundling-rails](https://github.com/rails/cssbundling-rails). This provides installers for the most common tools used for CSS. Here we'll learn how to use this gem to enhance the CSS we can use and write. We won't go into each tool as using that will depend on your needs but we will cover why you might reach for each of them.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What tools can be installed using the cssbundling-rails gem.
- Why you would use cssbundling over the standard asset pipeline way of handling stylesheets.
- The downsides of using cssbundling-rails.
- The cssbundling command line options.

### Cssbundling tooling options

Cssbundling-rails currently comes with installation support for five different tools for bundling and processing your CSS.

1. [Bootstrap](https://getbootstrap.com/)
This is probably one of the most famous libraries used to get going with the look and feel of a new application when you need a proof of concept.

2. [Bulma](https://bulma.io/)
An alternative to Bootstrap. Has opinionated styling to get you up and running when you don't have good CSS knowledge to design your own sites.

3. [Dart Sass](https://sass-lang.com/dart-sass)
The current hot flavour of processing sass files. A way to add additional CSS features to extend what you can do.

4. [PostCSS](https://postcss.org/)
A tool for transforming CSS by using Javascript. It allows you to do things like use future CSS features not supported in all browsers or use one of the many PostCSS plugins to enhance your CSS.

5. [Tailwind CSS](https://tailwindcss.com/)
A utility-first CSS framework. It works similarly to Bootstrap in that you add CSS to your application by adding classes to your HTML. Where it differs is Tailwind is not a way to avoid understanding CSS but instead allows you to build up your design by using reusable classes that do only one thing. It's moving the CSS to the markup instead of under a class name in your CSS files. You'll either love it or hate it.

### Installation

For a new Rails 7 app installation is as straightforward as a command line argument when creating the app

~~~bash
rails new myapp --css [tailwind|bootstrap|bulma|postcss|sass]
~~~

So if you wanted to use Bootstrap you'd run

~~~bash
rails new myapp --css bootstrap
~~~

For an existing application you just need to follow the following steps

* Add `gem 'cssbundling-rails'` to your Gemfile
* Run `bundle install` in the command line
* Use the generator provided by the gem to install the tooling you need `./bin/rails css:install:[tailwind|bootstrap|bulma|postcss|sass]`, so again using Bootstrap as an example you'd write `./bin/rails css:install:bootstrap`.

That's all there is to it.

### Build script

When you use cssbundling it does a couple of things for you. Firstly, no matter which option you choose, it installs the tools and files necessary to get it running and ensures the required import statements are added to your application. It then gives you instructions on the build script you need to use.

It's interesting to see how simple this gem is. If you see the [lib/install](https://github.com/rails/cssbundling-rails/tree/main/lib/install) directory for the gem you'll notice how few files there are. The `install.rb` file handles making sure all the necessary parts are in place to handle whichever install option you use, and then each tool has its own directory with the files required for that tool to work. Have a look at the [Bootstrap](https://github.com/rails/cssbundling-rails/blob/main/lib/install/bootstrap/install.rb) install file. Notice how short it is.

The build script is used to take the CSS you've written and process it through the tooling you've selected. So if you choose Tailwind it needs to take all those utility classes and make sure only those that you use are included to keep the Tailwind file as small as possible. The build script is placed in your package.json file which is why you do need nodejs installed to use this gem. In production, the build script is used to ensure all your assets are built correctly but in development you need to rebuild every time there is a change. Because of this the gem ships with a command used to watch your files and rebuild when necessary.

If you use the jsbundling or cssbundling gems you should always start your app by running `./bin/dev` in your terminal. This task will run the Rails server, and the JS and CSS watch commands to ensure your assets rebuild when needed.

The `./bin/dev` task uses a gem called [foreman](https://github.com/ddollar/foreman), which uses a Procfile to run lots of different processes in the same terminal, so that it can run the Rails server as well as watch over your assets for changes.

### Why use CSS bundling?

The CSS bundling gem isn't the only way to integrate tools such as Bulma into your application. There are gems just for those libraries, npm packages or you can even reference the minified files directly hosted on a CDN.

The README of the cssbundling-rails gem also mentions that for Tailwind and Dart Sass there are already gems to bring those into your application and avoid having to have Node.js installed to use them.

However, the CSS bundling gem allows us to seamlessly install and get those tools working in a Rails application with minimal configuration and effort. This is extremely powerful and lets you develop much faster without having to bring in the entire library, which helps reduce those build times.

If you find yourself wanting more than the standard Rails way of producing stylesheets mapped to controller names then this should be the first gem you reach for when looking for something else.

### Assignment

There isn't much more to what we've covered above but there are a couple of ideas below

<div class="lesson-content__panel" markdown="1">
  1. Read the [cssbundling-rails gem's README](https://github.com/rails/cssbundling-rails) as the FAQ has some information about using the gem and it gets updated from time to time with new information.
  2. If you are interested in using any of the tools it offers, go to the relevant website and see how you can get started using it in your own applications.
</div>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
