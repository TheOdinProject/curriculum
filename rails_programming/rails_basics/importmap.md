# Rails Import Maps

### Introduction

Since Rails 6 we have been using Webpacker as the default bundler to manage application-like JavaScript. This was due to pressure for Rails to be able to work with NPM and have access to a huge collection of JavaScript libraries as soon as they were released. With Rails 7 we have `importmap`. This approach to managing JavaScript in your applications was chosen for a couple of reasons. First ES6 is now supported by all browsers that matter. Chrome, Edge, Safari, and Firefox. Secondly, HTTP2 is now the norm meaning you can have a single connection that responds to the client with multiple small files. Now you can get rid of your bundler for JavaScript.


### Learning Outcomes

*Look through these now and then use them to test yourself after doing the assignment*

*   What are Import maps?
*   How do Import maps work?
*   How do you use Import maps?
*   What are `pin`s?

### Import Maps

Import maps let you import JavaScript modules using logical names that map to versioned/digested files – directly from the browser. So you can build modern JavaScript applications using JavaScript libraries made for ES modules (ESM) without the need for transpiling or bundling. This frees you from needing Webpack, Yarn, npm, or any other part of the JavaScript toolchain. All you need is the asset pipeline that's already included in Rails.

With this approach, you'll ship many small JavaScript files instead of one big JavaScript file. Thanks to HTTP/2 that no longer carries a material performance penalty during the initial transport, and in fact offers substantial benefits over the long run due to better caching dynamics. Whereas before any change to any JavaScript file included in your big bundle would invalidate the cache for the whole bundle, now only the cache for that single file is invalidated.

#### How do import maps work?

Import maps are essentially string substitution for "bare module specifiers". If you're not familiar with "bare module specifiers" they look like this: `import React from "react"`. This IS NOT compatible with the ESM loader spec. In order to be ESM compatible, you must provide one of the following specifiers:

* Absolute path:
    `import React from "/Users/Odin/projects/TOP/node_modules/react"`

* Relative path:
    `import React from "./node_modules/react"`

* HTTP path:
    `import React from "https://ga.jspm.io/npm:react@17.0.1/index.js"`

The `importmap-rails` gem provides an API for mapping the "bare module specifiers" to 1 of the 3 ways of loading ESM JavaScript packages. 

Example: 
```Ruby
# config/importmap.rb
pin "react", to: "https://ga.jspm.io/npm:react@17.0.2/index.js"
```
This means "every time you see `import React from "react"` in the code change it to `import React from "https://ga.jspm.io/npm:react@17.0.2/index.js"`"

Without the import maps gem, you would have to manually go through your code and update the import statements to have each new digest name when your code updates.

#### Using Import Maps

When creating a new Rails 7+ application `importmap-rails` will be automatically added to your Gemfile. `importmap-rails` is doing a few things for you. First the `<%= javascript_importmap_tags %>` line is added to `views/layouts/application.html.erb` which will setup the JSON configuration inside of a `<script type="importmap">` tag. Then the [es-module-shim](https://github.com/guybedford/es-module-shims) is loaded. Finally, the application entry point is imported via `<script type="module">import "application"</script>`. Inside your `app/javascript/application.js` you set up the application by importing any modules that have been defined in the import map. It is good to use logical names that match the package names used by NPM, that way if you want to start transpiling or bundling your code you won't have to change any module imports.

You start the setup via the configuration file located `config/importmap.rb`. This file is automatically reloaded in development when anything changes. That being said, if you remove pins and need them gone from the rendered importmap or list of preloads you MUST restart the server. 

### Import Maps with NPM packages

`importmap-rails` is designed to be used with JavaScript CDNs for NPM package dependencies.

You can use the `./bin/importmap` command that's added as part of the install to `pin`, `unpin`, or `update` npm packages in your import map. This command resolves the package dependencies and adds the pins to your `config/importmap.rb`. Here is an example:

```JS
./bin/importmap pin react react-dom
Pinning "react" to https://ga.jspm.io/npm:react@17.0.2/index.js
Pinning "react-dom" to https://ga.jspm.io/npm:react-dom@17.0.2/index.js
Pinning "object-assign" to https://ga.jspm.io/npm:object-assign@4.1.1/index.js
Pinning "scheduler" to https://ga.jspm.io/npm:scheduler@0.20.2/index.js

./bin/importmap json

{
  "imports": {
    "application": "/assets/application-37f365cbecf1fa2810a8303f4b6571676fa1f9c56c248528bc14ddb857531b95.js",
    "react": "https://ga.jspm.io/npm:react@17.0.2/index.js",
    "react-dom": "https://ga.jspm.io/npm:react-dom@17.0.2/index.js",
    "object-assign": "https://ga.jspm.io/npm:object-assign@4.1.1/index.js",
    "scheduler": "https://ga.jspm.io/npm:scheduler@0.20.2/index.js"
  }
}
```

The two dependencies `react` and `react-dom` resolve to four total dependencies. Now you can use them in your `application.js`:

```JS
import React from "react"
import ReactDOM from "react-dom"
```

Using the `./bin/importmap` is just a convenience wrapper for resolving logical package names to CDN URLs. You can just look up the CDN URLs yourself and pin those in `config/importmap.rb`:

```Ruby
pin "react", to: "https://cdn.skypack.dev/react"
```

### Downloading vendor files

If you don't want to use a CDN in production, you can download vendored files from the CDN when you're setting up your pins. These packages are downloaded to your `vendor/javascript:

```
./bin/importmap pin react --download
Pinning "react" to vendor/react.js via download from https://ga.jspm.io/npm:react@17.0.2/index.js
Pinning "object-assign" to vendor/object-assign.js via download from https://ga.jspm.io/npm:object-assign@4.1.1/index.js
```

This will produce pins in your `config/importmap.rb` like so:

```ruby
pin "react" # https://ga.jspm.io/npm:react@17.0.2/index.js
pin "object-assign" # https://ga.jspm.io/npm:object-assign@4.1.1/index.js
```

If you want to remove a downloaded pin you can pass `--download` to the `unpin` command:
```
./bin/importmap unpin react --download
Unpinning and removing "react"
Unpinning and removing "object-assign"

```

#### Preloading pinned modules

To avoid having the browser load one file after another before it can get to the deepest nested import, `importmap-rails` supports [modulepreload](https://developers.google.com/web/updates/2017/12/modulepreload) links. Pinned modules can be preloaded by appending `preload: true` to the pin. Like so:

```ruby
# config/importmap.rb
pin "@github/hotkey", to: "https://ga.jspm.io/npm:@github/hotkey@1.4.4/dist/index.js", preload: true
pin "md5", to: "https://cdn.jsdelivr.net/npm/md5@2.3.0/md5.js"

# app/views/layouts/application.html.erb
<%= javascript_importmap_tags %>

# will include the following link before the importmap is setup:
<link rel="modulepreload" href="https://ga.jspm.io/npm:@github/hotkey@1.4.4/dist/index.js">
```

### Assignment

<div class="lesson-content__panel" markdown="1">
Since Rails 7 is relatively new there aren't a ton of resources available yet. That being said here are some that are worth taking a look at:

1. First things first. [Briefly look over the `importmap-rails` gem Readme on github](https://github.com/rails/importmap-rails). This has A LOT of the information here plus more. Straight from the horse's mouth.
2. Read [David Heinemeier Hansson's article](https://world.hey.com/dhh/modern-web-apps-without-javascript-bundling-or-transpiling-a20f2755) on Modern web apps without JavaScript bundling or transpiling. He describes the why and how of the `importmap` addition to Rails 7.
</div>

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

1. [Additional reading on Rails 7 `importmap`](https://noelrappin.com/blog/2021/09/rails-7-and-javascript/)
2. [Blog post on using `importmap`](https://blog.kiprosh.com/rails-7-brings-import-maps-into-the-limelight/)

### Knowledge Check

*This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, clicking the small arrow to the left of the question will reveal the answers.*

* <a class="knowledge-check-link" href="#import-maps-with-npm-packages">Can you use import maps with npm packages?</a>
* <a class="knowledge-check-link" href="#downloading-vendor-files">How do you download vendor files using import maps?</a>
* <a class="knowledge-check-link" href="#preloading-pinned-modules">How can you preload pinned modules?</a>