### Introduction

Prior to Rails 7, there was a long running issue with how JavaScript third-party packages should be managed in a Rails application. The original approach was to wrap the JavaScript in a Ruby Gem and release it. While this did bring about versioning and stability, it also made it slow to update to the latest releases of libraries as you needed to wait for the maintainers of the Ruby Gem to update it, test it, and release a new version of the gem.

Rails 6 tried to fix this solution by creating a wrapper Gem around [webpack](https://webpack.js.org/). The gem, called Webpacker, used Rails' famous convention over configuration to give the ability to use the latest JS libraries but with some sensible defaults. This wasn't without issue though, the main one being that you needed to have a deeper understanding of Webpacker if you wanted to move away from those conventions. Unfortunately it didn't solve the issues it was meant to and a new approach was needed.

With Rails 7 we have [importmap](https://github.com/rails/importmap-rails). This approach to managing JavaScript in your applications was chosen for a couple of reasons. First ES6 is now supported by all browsers that matter. Chrome, Edge, Safari, and Firefox. Secondly, HTTP/2 is now the norm meaning you can have a single connection that responds to the client with multiple small files. Now you can get rid of your bundler for JavaScript.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What Import maps are.
- How Import maps work.
- How to use Import maps.
- What `pin`s are.

### Import maps

Import maps let you import JavaScript modules using logical names that map to versioned/digested files – directly from the browser. So you can build modern JavaScript applications using JavaScript libraries made for ES modules (ESM) without the need for [transpiling](https://en.wikipedia.org/wiki/Source-to-source_compiler) or [bundling](https://www.dottedsquirrel.com/bundling-javascript/). This frees you from needing Webpack, Yarn, npm, or any other part of the JavaScript toolchain. All you need is the asset pipeline that's already included in Rails.

With this approach, you'll ship many small JavaScript files instead of one big JavaScript file. Thanks to HTTP/2 that no longer carries a material performance penalty during the initial transport, and in fact offers substantial benefits over the long run due to better caching dynamics. Whereas before any change to any JavaScript file included in your big bundle would invalidate the cache for the whole bundle, now only the cache for that single file is invalidated.

#### How do import maps work?

The first thing to know is that import maps are not a Rails specific solution. They are an existing solution that the Rails team thought would be the best way to bring JavaScript to Rails applications as a sane default. The basic premise is that you can import JavaScript libraries into your application just referencing them by name rather than having to reference the exact location of where the library can be found. Import maps are essentially string substitution for "bare module specifiers". If you're not familiar with "bare module specifiers" they look like this: `import React from "react"`. However just writing imports this way isn't something currently valid as a way to load in JavaScript code to the current file. The valid ways to do this currently are defined under something called the ESM loader spec which if you really want to, you can read more about from the [Node docs](https://nodejs.org/api/esm.html)

In order to be ESM compatible, you must provide one of the following specifiers when loading JavaScript code

- Absolute path:
    `import React from "/Users/Odin/projects/TOP/node_modules/react"`

- Relative path:
    `import React from "./node_modules/react"`

- HTTP path:
    `import React from "https://ga.jspm.io/npm:react@18.2.0/index.js"`

The `importmap-rails` gem provides an API for mapping the "bare module specifiers" to 1 of the 3 ways of loading ESM JavaScript packages.

Example

```Ruby
# config/importmap.rb
pin "react", to: "https://ga.jspm.io/npm:react@18.2.0/index.js"
```

This means that every time you see `import React from "react"` in the code it will actually be like writing `import React from "https://ga.jspm.io/npm:react@18.2.0/index.js"`.

#### Using import maps

When creating a new Rails 7+ application `importmap-rails` will be automatically added to your Gemfile. `importmap-rails` is doing a few things for you. First the `<%= javascript_importmap_tags %>` line is added to `views/layouts/application.html.erb` which will set up the JSON configuration inside of a `<script type="importmap">` tag. Then the [es-module-shim](https://github.com/guybedford/es-module-shims) is loaded. Finally, the application entry point is imported via `<script type="module">import "application"</script>`. Inside your `app/javascript/application.js` you set up the application by importing any modules that have been defined in the import map. It is good to use logical names that match the package names used by NPM, that way if you want to start transpiling or bundling your code you won't have to change any module imports.

You start the setup via the configuration file located `config/importmap.rb`. This file is automatically reloaded in development when anything changes. That being said, if you remove pins and need them gone from the rendered importmap or list of preloads you MUST restart the server.

### Import maps with NPM packages

`importmap-rails` downloads and vendors your npm package dependencies via JavaScript CDNs.

You can use the `./bin/importmap` command that's added as part of the install to `pin`, `unpin`, or `update` npm packages in your import map. This command resolves the package dependencies and adds the pins to your `config/importmap.rb`.

```bash
$ ./bin/importmap pin react react-dom
Pinning "react" to vendor/javascript/react.js via download from https://ga.jspm.io/npm:react@18.2.0/index.js
Pinning "react-dom" to vendor/javascript/react-dom.js via download from https://ga.jspm.io/npm:react-dom@18.2.0/index.js
Pinning "scheduler" to vendor/javascript/scheduler.js via download from https://ga.jspm.io/npm:scheduler@0.23.0/index.js
```

This will produce pins in your `config/importmap.rb` like this:

```Ruby
pin "react" # @18.2.0
pin "react-dom" # @18.2.0
pin "scheduler" # @0.23.0
```

The packages are downloaded to `vendor/javascript`, which you can check into your source control, and they will be available through your application's asset pipeline.

Now you can import them in your JavaScript code.

```JS
import React from "react"
import ReactDOM from "react-dom"
```

If you want to remove a downloaded pin:

```bash
$ ./bin/importmap unpin react
Unpinning and removing "react"
```

#### Preloading pinned modules

To avoid having the browser load one file after another before it can get to the deepest nested import, `importmap-rails` uses [modulepreload](https://developers.google.com/web/updates/2017/12/modulepreload) by default. If you don't want to preload a dependency, add `preload: false` to the pin.

```Ruby
# config/importmap.rb
pin "@github/hotkey", to: "@github--hotkey.js" # file lives in vendor/javascript/@github--hotkey.js
pin "md5", preload: false # file lives in vendor/javascript/md5.js

# app/views/layouts/application.html.erb
<%= javascript_importmap_tags %>

# will include the following link before the importmap is setup:
<link rel="modulepreload" href="/assets/javascript/@github--hotkey.js">
```

### Importmap considerations

While importmaps are a great way to get started with Rails, and will allow you to quickly make use of JavaScript libraries without having to worry about bundling and transpiling, there are some wider considerations you need to be aware of.

The first  consideration is dependency management. This is when the package you are using depends on other packages for their use. Using importmaps locks the version of dependencies as required by the package you are using, but what if you add another package that relies on the same dependency but a different version? You'll start getting errors and tracking them down can be tricky. At this stage, importmaps don't manage dependencies and so are best used when your reliance on third party packages is minimal.

Dependency management also feeds into the next consideration. How do you manage versioning of your libraries to keep them up to date? If you use something like webpack that requires an explicit package.json file that maps libraries to version and then a lock file to manage all the dependencies you can then rely on services such as GitHub's [Dependabot](https://github.com/dependabot) to keep those packages up to date for you by submitting pull requests against your GitHub repo to update the packages. When using importmaps there isn't currently a way to do this, so you'll need to manage those updates yourself. If there's a security critical update for a library you rely on and you aren't aware of that? You can leave your app exposed to anyone who can exploit that.

One other main consideration is when using importmaps you have much less control over asset bundling, so if you do require anything more complicated than just importing the third party package code to your app then importmaps won't work. It can't transpile or bundle any code. In that case you'll need another option which we cover in a later lesson.

All of the above may have you wondering why you'd use importmaps all things considered. We'd say they actually reflect the Rails way really well. Have a default option that you can use for as long as possible and then when your requirements grow outside of that you have other options to reach for which will add another layer of complexity but will be justified. With Webpacker that complexity was thrown at you even if you didn't require it. So start with importmaps for all of your applications and only look to change that when you need to.

### Assignment

<div class="lesson-content__panel" markdown="1">
Since Rails 7 is relatively new there aren't a ton of resources available yet. That being said here are some that are worth taking a look at:

1. First things first. [Briefly look over the `importmap-rails` gem README on GitHub](https://github.com/rails/importmap-rails). This has A LOT of the information here plus more. Straight from the horse's mouth.
1. Read [David Heinemeier Hansson's article](https://world.hey.com/dhh/modern-web-apps-without-javascript-bundling-or-transpiling-a20f2755) on Modern web apps without JavaScript bundling or transpiling. He describes the why and how of the `importmap` addition to Rails 7.
1. Appsignal produce a good [Importmaps under the hood](https://blog.appsignal.com/2022/03/02/import-maps-under-the-hood-in-rails-7.html) article that is well worth a read to get a bit more information on what we covered above.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- <a class="knowledge-check-link" href="#import-maps-with-npm-packages">Can you use import maps with npm packages?</a>
- <a class="knowledge-check-link" href="#downloading-vendor-files">How do you download vendor files using import maps?</a>
- <a class="knowledge-check-link" href="#preloading-pinned-modules">How can you preload pinned modules?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Additional reading on Rails 7 `importmap`](https://noelrappin.com/blog/2021/09/rails-7-and-javascript/)
- [Blog post on using `importmap`](https://blog.kiprosh.com/rails-7-brings-import-maps-into-the-limelight/)
- [The import map specification](https://github.com/WICG/import-maps) should cover any other questions you may have on the subject.
