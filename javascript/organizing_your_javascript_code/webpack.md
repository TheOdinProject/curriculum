### Introduction
We've already introduced webpack in a previous lesson. It is the go-to tool across the web for bundling and compiling JavaScript code. There _are_ other options out there, but at this time none of them are as popular or widely used as webpack.

In our last lesson, we covered the first half of what webpack can do for you: bundling your modules. Another amazing feature is webpack's ability to process and manipulate your code as it bundles this. So, for example, if you would like to use [Sass](http://sass-lang.com/) or [PostCSS](https://postcss.org/) to write your CSS, webpack can allow you to do that. Webpack can manage your images and compress and optimize them for use on the web. Webpack can [minify and uglify](https://stackoverflow.com/questions/33708197/does-it-make-sense-to-do-both-minify-and-uglify/33708348) your code. There are tons of things webpack can do, but to access these functions we need to learn more about loaders and plugins.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

 - Use webpack by following its documentation.
 - Load assets with webpack.
 - Manage output with webpack and HtmlWebpackPlugin.
 - Configure webpack with useful features for development.

### Bundling

As briefly introduced in the previous lesson, if you give webpack a file as an entry point, it will build a dependency graph based on all the imports/exports starting there, before bundling everything into a single `.js` file in `dist`. If for whatever reason you needed it to output multiple bundles (e.g. you have multiple html pages that each need their own), then each entry point you give Webpack will produce its own output bundle.

If you are only dealing with bundling JavaScript then this is fairly straightforward. But what if your project also includes CSS or assets like images or fonts? For CSS, you can import your `.css` file directly into your JavaScript and for assets like images, they might be used inside your CSS or imported directly into your JavaScript. When you tell Webpack to bundle your files, it will come across these files and try to bundle them together or process any assets like images and copy them into `dist`.

Since these sorts of files are not JavaScript, however, Webpack will not know how to process them unless you tell it how to by including the correct loaders and rules. If you really wanted to, with the right loaders/plugins/rules, you could even do things such as image optimization when you build your project into `dist`. In the assignment links below, you will get to see how you can install and configure these loaders and rules for CSS and assets.

### Html-webpack-plugin

Since we would like to keep all of our development work within `src` and leave `dist` for the production build (the code that you will actually deploy), what about handling HTML files?

Similarly to how we will need loaders and rules for CSS and assets, we can use a plugin called `html-webpack-plugin` which will automatically build an HTML file in `dist` for us when we build our project. It will also then automatically add certain things to the HTML like our output bundle in a `<script>` tag, or the code to use a favicon if we configured it to use one.

By default, it will create this from a blank template, so the resulting HTML file will essentially be the usual boilerplate with our script and perhaps any other options we add in the configuration. If we had our own `dist/index.html` then it would be overwritten! In order to preserve our own HTML, we can tell it to use a template and provide a path to our own HTML file that is in `src`. You will see more examples of how to set up `html-webpack-plugin` appropriately in the assignment links below, but an example of how to set the template option within your webpack configuration file is as follows:

```javascript
// webpack.config.js

const HtmlWebpackPlugin = require('html-webpack-plugin');

// ...
    plugins: [
        new HtmlWebpackPlugin({
            template: './src/template.html',
        }),
    ],
// ...
```

<div class="lesson-note lesson-note--tip" markdown="1">

#### A note if your fonts are not loading

  If you have any issues loading fonts with Webpack, the issue is not with Webpack, but how you declare the CSS rule.

  Check out the answer on this question from Stack Overflow if you get stuck: [Webpack can't load fonts (ttf)](https://stackoverflow.com/questions/49877149/webpack-cant-load-fonts-ttf/68838464#68838464)
</div>


### Assignment

<div class="lesson-content__panel" markdown="1">

1. Code along with [this tutorial](https://webpack.js.org/guides/asset-management/) to learn how to use webpack to manage your website's assets.
2. [This short article and video](https://rapidevelop.org/webpack/setup-html-webpack-plugin) demonstrate how to install `html-webpack-plugin` and set different options on it (note that you do not need to include some of the options mentioned as they are already the [default settings](https://github.com/jantimon/html-webpack-plugin#options) if you leave them out). Whilst the written instructions do not show any code unlike the video, any options would be set just like the `template` option example shown above.
    1. This [tutorial](https://webpack.js.org/guides/output-management/) on output management also gives an example of using `html-webpack-plugin` but does not demonstrate using the template option. It also starts by demonstrating how to configure multiple entry points - you are unlikely to need this feature for the projects in this part of the course.
3. The first part of [this tutorial](https://webpack.js.org/guides/development/) (up until "Choosing a Development Tool") talks about source maps, a handy way to track down which source file (index.js, a.js, b.js) an error is coming from when you use webpack to bundle them together. This is essential to debugging bundled code in your browser's DevTools. If the error comes from b.js the error will reference that file instead of the bundle. It also walks through an example of the `--watch` feature and `webpack-dev-server` package, either of which will prove invaluable when working with webpack.
    1. Note that if you decide to use `webpack-dev-server`, the tutorial example sets it to serve from `dist`. If you are using `html-webpack-plugin`, you will want to change this to serve from `src` instead. This will make development much easier as all of your work and any file paths you use can be kept within `src` (Webpack will adjust all of these file paths when bundling if you set the correct loaders and asset rules).
    2. You can ignore the last option on `webpack-dev-middleware` as we will not be working with our own Express server for this part of the course.
4. Setting our webpack configuration to development mode is naturally most suitable for our development work, but when we come to build our projects for deployment (production), the dedicated production mode optimises this for us. Instead of manually switching between modes in the configuration file as needed, [this tutorial](https://webpack.js.org/guides/production/) introduces `webpack-merge`. This can be quite useful as a quick setup can allow us to have a dedicated npm script for development builds/dev server, and another specifically for our production build.
    1. You'll notice the above tutorial does not have a `webpack.config.js` file. If you do use `webpack-merge`, make sure that any webpack commands you run (including in an npm script) follow the tutorial and use the `--config` option to specify which webpack configuration file to use. If you do not specify one, webpack will try to look for `webpack.config.js` and if it does not find one, it will not be able to bundle correctly!
5. You don't need to do the rest of the webpack tutorials at this time, but take a look at what's offered on the sidebar of their [guides page](https://webpack.js.org/guides/). There are several sweet features that you may want to use in future projects such as code-splitting, lazy-loading, and tree-shaking, so being aware of some of these features can come in handy. Now that you have a handle on webpack's configuration system adding these features is as easy as using the right plugins and loaders!

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [How do you load CSS using webpack?](https://webpack.js.org/guides/asset-management/#loading-css)
- [How do you load images using webpack?](https://webpack.js.org/guides/asset-management/#loading-images)
- [How do you load fonts using webpack?](https://webpack.js.org/guides/asset-management/#loading-fonts)
- [How do you automatically build HTML files in `dist` using webpack?](https://webpack.js.org/guides/output-management/#setting-up-htmlwebpackplugin)
- [How do you automatically build an HTML file in `dist` using a custom template in `src`?](https://rapidevelop.org/webpack/setup-html-webpack-plugin)
- [How would you track errors in bundled source code?](https://webpack.js.org/guides/development/)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
