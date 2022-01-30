### Introduction

The Asset Pipeline is a great feature for Rails. It makes it easy to write CSS and Javascript and does the heavy lifting of bundling all your stylesheets and Javascript files together. It wasn't without drawbacks though. Often it took time to integrate the latest Javascript language features, and gems that loaded in popular Javascript libraries and frameworks weren't always at the cutting edge. This gave Rails a reputation for being reliable but outdated. Especially with big strides being made in the Javascript community of creating an ecosystem that was much easier to work with than it had a reputation for in the past.

Webpack was created as a static module bundler for modern Javascript applications which made Javascript much easier to work with, ensuring the code you wrote in development to be easy to read could be processed into something better suited for browsers in production. More importantly Webpack could work with the node package manager, giving access to a huge collection of Javascript libraries and as soon as they were released you could update.

This put pressure on Rails to offer up something similar. The solution was [Webpacker](https://github.com/rails/webpacker). A gem that provides a wrapper to work with Webpack itself. This allowed Rails to stick to their motto of convention over configuration with providing some sensible defaults for Webpack while still offering developers who used Rails access to the vast npm repository.

You can see on the Webpacker github readme that it is intended to work alongside the Asset Pipeline with the latter still handling stylesheets, images and even some small Javascript scripts. Webpack is seen as best suited to app-like Javascript. That is code used to write huge features for a web application in Javascript.

With Rails 6 and above Webpack is now the default but could be integrated into Rails 5 by adding the gem to the Gemfile and then initialising it.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment

* What is Webpack?
* How does Webpack differ from the Asset Pipeline?
* How do you add libraries to your Rails projects?
* How does Webpack build its dependency graph?

### Webpacker

As we mentioned above, Webpack is a static module bundler for modern Javascript applications. How this works is when Webpack processes your files, it builds a dependency graph which builds a map of your Javascript code, and the code it relies on such as third party libraries, and then generates bundles of code based on that.

With the Asset Pipeline you had Javascript files that lived in `app/assets/javascript` but with Webpack you have what are called "packs". They live in `app/javascript/packs` and are the entry point to Javascript code you want to use in your application.

This is one key difference between the Asset Pipeline and Webpacker. With the Asset Pipeline all Javascript code was bundled into one large file, with the small exception of code used to execute on Ajax requests which could be executed on at the time the request came in, and so all files had to be referenced in the `application.js` file. That file was downloaded to a client when it first connected to your server.

Using packs instead, we can have different pack files that can be downloaded only when needed. You can create an unlimited number of packs and just reference that pack on the page it is needed. For example if you had some code to handle form validations on the client side it might not be needed for somebody who never went to the page with the form. With the Asset Pipeline that code would be downloaded at initial page load but using Webpack you can just reference that pack in the view where it is required and it will only download when somebody visits the form.

To see how this is done let's look at how we reference packs, and touch on how it used to be done using the asset pipeline. Before the Webpacker gem, when there was only the Asset Pipeline, if you started a new Rails application it would create the following lines in the `app/views/layouts/application.html.erb` file.

~~~ruby
<%= stylesheet_link_tag "application", media: "all", "data-turbolinks-track" => "reload" %>
<%= javascript_include_tag "application", "data-turbolinks-track" => "reload" %>
~~~

These lines took the `application.css` and `application.js` files in the `app/assets/stylesheets` or `app/assets/javascript` directories and bundled them together.

Using Webpack and "packs" in Rails 6 we instead get the following lines.

~~~ruby
<%= stylesheet_link_tag "application", media: "all", "data-turbolinks-track" => "reload" %>
<%= javascript_pack_tag "application", "data-turbolinks-track" => "reload" %>
~~~

Very similar, in fact the stylesheet link is identical because Rails by default still uses the Asset Pipeline for css, but now for Javascript we use `javascript_pack_tag` which by default looks in the `app/javascript/packs` directory, in this case for `"application"` which then loads the `application.js` pack file.

As mentioned earlier, unlike the Asset Pipeline which requires everything to be referenced in the `application` file, we can include one or several pack files into our app using Webpack. It only requires we place a pack file in the `packs` Javascript directory and then include it in whatever view it is required in.

As an example we may have some code we use to manage a contact form submission. We don't want it loaded on every page. So in the `packs` directory we create a `contact_form.js` pack file. Then in our form view we can place the following line at the bottom of the page...

~~~ruby
<%= javascript_pack_tag "contact_form", "data-turbolinks-track" => "reload" %>
~~~

You may have already wondered what makes a pack file different from a regular Javascript file. Why do I keep referring to them as pack files?

There's no real difference, pack files are just Javascript files. The difference really is in their intended use. A pack file should really just load in the Javascript code from elsewhere in your Javascript directory. If you take a look in your `application.js` pack file from the rails installation car project you can see it's only job is to require files from elsewhere and initialise them if necessary.

Going back to our contact_form pack file we might create a directory such as `app/javascript/contact_form/` which contains the actual code we use to manage our contact form and then in our pack file we simply `import` or `require` a file such as `../contact_form/whatever_file_we_need`. Note we use `../` because from our pack directory we will need to move one directory up to find our `contact_form` directory.

#### Installing libraries

With Rubygems we use a Gemfile and with Webpacker we use a `package.json` to manage your Javascript libraries. The main difference is that with a Gemfile you need to open it and manually add the gem and version and then run `bundle` but with Webpack we can use Yarn from the terminal to add a library. If we wanted to add bootstrap we could use

~~~bash
yarn add bootstrap
~~~

And it would take care of the rest for us and update the package.json file. Just like with gems where we can install them only for the testing or development groups we can install Javascript packages only to be used in the development environment and not our production one. A good example of this would be adding a testing library such as `jest` which we wouldn't need in production code. To do this just add the `--dev` option when installing the library

~~~bash
yarn add --dev jest
~~~

Packages are installed to the `node_modules` folder. Open that at your own peril as it's known for being a bit of a black hole for code. Due to the size it can take, the node_modules folder is by default excluded from being checked into by git. Instead, if you clone a project you just use the package.json and yarn to recreate the node_modules folder.

Once you have installed a library then you need to reference it in your pack file. Webpack references the `node_modules` folder as a top level directory to search for anything referenced so you aren't stuck trying to work your way backwards from the pack file when requiring a library with lines like `require ../../node_modules/etc` and instead you can just reference the library starting with its own folder in node_modules.

~~~javascript
require 'bootstrap/bootstrap'
~~~

#### Other Assets

Although Rails, for now, intends that Webpack is only used for app-like Javascript with other assets handled by the Asset Pipeline it is possible to use Webpack to handle all assets. In this case we can change the `stylesheet_link_tag` to `stylesheet_pack_tag`, such as...

~~~ruby
<%= stylesheet_pack_tag "application", media: "all", "data-turbolinks-track" => "reload" %>
<%= javascript_pack_tag "application", "data-turbolinks-track" => "reload" %>
~~~

In this case we can require any css into the `application.js` file and Rails will load it as css and bundle it together using Webpack.

If you do want to do this yourself then we would recommend you first take a deeper dive into Webpack itself and how it handles different assets. Until then just stick with the Asset Pipeline for anything but Javascript.

#### Dependency Graph

One key thing to note when you're using Webpacker is how it works out what code to load. With the Asset Pipeline, because all code was required to be loaded in the `application.js` file, Rails could build just one dependency graph of all the code and make sure no code was included twice. A good example of this might be if you used jquery in your application and then used a third party library that also uses jquery and was listed as one of its dependencies. The Asset Pipeline would then ensure it was only loaded once to prevent bloated code.

Webpack builds a dependency graph for each pack file so it's possible, if different pack files both require the same library, to bundle the same code twice into the different packs. This would make the client's necessary download size much larger overall. There are several ways to ensure you don't do this but the easiest way, at least when starting out, is to only use the default `application.js` pack file. If you only have one pack file where all the code you need is included, then the dependency graph will be built from that one file and Webpack will ensure it optimises the code required.

### Assignment
There isn't a huge amount of reading to do here. But a couple of links just to get you a better understanding of Webpack.

<div class="lesson-content__panel" markdown="1">
  1. Read [The Webpacker gem README](https://github.com/rails/webpacker/tree/5-x-stable#readme) to get an overview
  2. Read [This excellent article](https://rossta.net/blog/rails-apps-overpacking-with-webpacker.html) on some well known companies you've probably heard of who didn't create their dependency graphs well and ended up with huge Javascript downloads which slowed the initial load of their website. Something to keep in mind.
</div>

### Additional Resource
This section contains helpful links to other content. It isn't required, so consider it supplemental.

<div class='lesson-content__panel' markdown='1'>
  Webpacker has been officially retired since Rails v7, it can still be used with rails but won't come prepackaged with it and also will not have new version releases. For now, this will not matter to you but it's worth knowing about. Read [Webpacker-master README](https://github.com/rails/webpacker/tree/master#readme)
<div>

### Conclusion

Rails is all about convention over configuration so you should be able to get up and running with Webpacker and, through that, Webpack with minimum fuss. Just stick to a limited number of pack files while you're getting to grips with it and you should be handling all your Javascript code like a boss in no time.
