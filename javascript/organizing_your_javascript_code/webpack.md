### Introduction

In the previous lesson, we introduced ES6 modules (ESM) and npm. The introduction of ESM greatly mitigated some of the issues with managing individual script files and dependencies. However, downloading a large number of module files individually can reduce performance, especially as more third party files are imported.

Fortunately, more recent web technologies have greatly improved these aspects, but bundlers still provide us with a lot of power to process and optimize our code in various ways. This power, however, does come with the small cost of needing to configure a bundler. For now, our needs are few and simple, and we can look at the basic things one at a time.

Awareness of bundlers and basic experience with them is valuable. While in recent years, new build tools have come out that handle a lot of basic configuration for us, in the real world, you may not always get a chance to use these shiny new tools. It's very reasonable to end up working with codebases that use tools that require more manual configuration. Even if you did get to work with tools that handle more things for you, it's useful to understand what those tools are actually doing for you.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain the purpose of bundlers and how they work.
- Configure Webpack to bundle JavaScript modules.
- Configure Webpack to handle non-JavaScript files during bundling, including using HtmlWebpackPlugin.
- Set up Webpack's development server.

### Bundling

In the ES6 modules lesson, we learned what an **entry point** is, what a **dependency graph** is, and how to add an entry point file to HTML as a module script. With bundling, the same concepts of entry points and dependency graphs apply: we provide the bundler with an entry point. It then builds a dependency graph from that file, combines all relevant files together, and then outputs a single file with all the necessary code included.

While it does this, we could also get it to do a whole bunch of other things, such as [minifying our code](https://en.wikipedia.org/wiki/Minification_(programming)), image optimizations, or even ["tree shaking"](https://developer.mozilla.org/en-US/docs/Glossary/Tree_shaking). Most of these extra optimizations are out of the scope of this course; we will instead be focusing on basic bundling of JavaScript, and handling HTML, CSS, and images.

### Webpack

Webpack is one of the most popular JavaScript bundlers, if not the most popular one, and has been for a long time. Let's get started with bundling!

We'll first need to make a new directory for our practice app, then create a `package.json` file in it for npm to record information about packages we use (like Webpack). Run the following in your terminal:

```bash
mkdir webpack-practice &&
cd webpack-practice &&
npm init -y
```

Once inside your new directory, we can go ahead and install Webpack, which involves two packages.

```bash
npm install --save-dev webpack webpack-cli
```

Note that we included the `--save-dev` flag (you can also use `-D` as a shortcut), which tells npm to record our two packages as development dependencies. We will only be using Webpack during development. The actual code that makes Webpack run will not be part of the code that the browser will run.

Also notice that when these finished installing, a `node_modules` directory and a `package-lock.json` got auto-generated. `node_modules` is where Webpack's actual code (and a whole bunch of other stuff) lives, and `package-lock.json` is just another file npm uses to track package information.

<div class="lesson-note" markdown="1">

#### src and dist

When dealing with Webpack (and often with any other bundler or build tool), we have two very important directories: `src` (short for "source") and `dist` (short for "distribution"). We could technically call these directories whatever we want, but these names are conventions.

`src` is where we keep all of our website's source code, essentially where all of our work will be done (with an exception being altering any configuration files in the root of the project). When we run Webpack to bundle our code, it will output the bundled files into the `dist` directory. The idea is that if someone were to fork or clone the project, they would not need the `dist` directory, as they'd just be able to run Webpack to build from `src` into their own `dist`. Similarly, to deploy our website, we would only need the `dist` code and nothing else. Keep that in mind! Work inside `src`, build into `dist`, then deploy from there!

</div>

### Bundling JavaScript

<div class="lesson-note" markdown="1">

#### Import file extensions

Normally, with ESM, we need to specify file extensions when we import from other files (e.g. `"./greeting.js"`). With Webpack and many other bundlers, some file extensions like `.js` are optional, as Webpack will automatically check extensionless file paths for `.js` files by default (e.g. `"./greeting"`).

This is a feature of Webpack, not ESM.

In this lesson, examples with imports will always include the file extension where appropriate to be explicit.

</div>

Now that we've installed Webpack in our project directory, let's create a `src` directory with two JavaScript files inside it: `index.js` and `greeting.js`.

```bash
mkdir src && touch src/index.js src/greeting.js
```

Inside our two JavaScript files, we'll have the following:

```javascript
// index.js
import { greeting } from "./greeting.js";

console.log(greeting);
```

```javascript
// greeting.js
export const greeting = "Hello, Odinite!";
```

Great, now we have an `index.js` that imports from, and so depends on, `greeting.js`. In order to bundle this, we'll also want a Webpack configuration file, which will contain all the details we need for bundling, such as the entry point, the output destination, and anything like plugins and loaders (which we will cover shortly).

Back in your project root (so outside of `src`), create a `webpack.config.js` file that contains the following:

```javascript
// webpack.config.js
const path = require("path");

module.exports = {
  mode: "development",
  entry: "./src/index.js",
  output: {
    filename: "main.js",
    path: path.resolve(__dirname, "dist"),
    clean: true,
  },
};
```

Yes, you may have noticed this file uses CommonJS (CJS) syntax instead of ESM. That's because this file (and Webpack itself) runs in NodeJS and not the browser. By default, NodeJS uses CJS syntax, and the configuration file also contains some CJS-specific things. We need not worry about this - this is just stuff we need for Webpack to do its thing.

You'll notice the exported object contains a few key sections:

- `mode`: For now, we will just leave this in development mode, as it will be more useful to us. We will revisit this and production mode in a later lesson.
- `entry`: A file path from the config file to whichever file is our entry point, which in this case is `src/index.js`.
- `output`: An object containing information about the output bundle.
  - `filename`: The name of the output bundle - it can be anything you want.
  - `path`: The path to the output directory, in this case, `dist`. If this directory doesn't already exist when we run Webpack, it will automatically create it for us as well. Don't worry too much about why we have the `path.resolve` part - this is just the way Webpack recommends we specify the output directory.
  - `clean`: If we include this option and set it to `true`, then each time we run Webpack to bundle, it will empty the output directory first before bundling the files into it. This helps us keep `dist` clean, so it only contains the files produced by the most recent bundling.
  
With these files all in place, let's run Webpack and see what happens!

```bash
npx webpack
```

You should see that Webpack has created a `dist` directory for us containing a `main.js` file! Inside this file is...a lot of stuff... Don't worry, most of this stuff is just for development tools we will use later. If you go ahead and run this file with `node dist/main.js`, you should see `Hello, Odinite!` logged in the terminal.

Congratulations! You've just made your first bundle with Webpack!

### Handling HTML

Let's actually include some HTML. After all, we're interested in making websites! Since HTML isn't JavaScript, Webpack can't just bundle it straight away, but there's a nifty tool we can use called `HtmlWebpackPlugin` that's just perfect for us.

Run the following command to install HtmlWebpackPlugin (also as a dev dependency):

```bash
npm install --save-dev html-webpack-plugin
```

We should also create a `template.html` inside `src` (you can name this file whatever you want) and fill that with the usual HTML boilerplate. **We do not need to put a script tag in this file!** HtmlWebpackPlugin will automatically add our output bundle as a script tag. We wouldn't want to double up by including our own one as well! Inside our `webpack.config.js`, we can add a few little bits.

```javascript
// webpack.config.js
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  mode: "development",
  entry: "./src/index.js",
  output: {
    filename: "main.js",
    path: path.resolve(__dirname, "dist"),
    clean: true,
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "./src/template.html",
    }),
  ],
};
```

All we're doing here is making sure our Webpack configuration has access to HtmlWebpackPlugin, then adding it as a plugin to the configuration object. Inside the HtmlWebpackPlugin constructor call, we pass in any options. For now, we're only interested in the `template` option.

If we provide the path to our `src/template.html` file as a template, when we run `npx webpack` again, you'll notice our `dist` directory not only contains a `main.js` file but an `index.html` file as well (it can't combine them into one file). You'll also notice that HtmlWebpackPlugin has automatically added a deferred script tag to our `index.html` file - what a darling! If you open this file in the browser and check the browser console, you should see our lovely `"Hello, Odinite!"` string logged.

We've now successfully configured Webpack to handle our HTML file and inject the appropriate script tag. Any changes to HTML we make, we can just rerun Webpack to generate fresh `dist` code.

Let's see how we'd handle CSS.

### Loading CSS

We don't just need one new package for CSS, we need *two*. Gosh, what a greedy little thing... Let's install them.

```bash
npm install --save-dev style-loader css-loader
```

`css-loader` will read any CSS files we import in a JavaScript file and store the result in a string. `style-loader` then takes that string and actually adds the JavaScript code that will apply those styles to the page. Therefore, we need both.

Back in our `webpack.config.js`, we need to add these loaders so Webpack knows what to do. Since these aren't plugins, they go in a separate section:

```javascript
// webpack.config.js
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  mode: "development",
  entry: "./src/index.js",
  output: {
    filename: "main.js",
    path: path.resolve(__dirname, "dist"),
    clean: true,
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "./src/template.html",
    }),
  ],
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ["style-loader", "css-loader"],
      },
    ],
  },
};
```

All this does is tell Webpack that if it encounters an imported file ending with `.css`, it should use the listed loaders to process that CSS file.

<div class="lesson-note lesson-note--warning" markdown="1">

#### Loader order matters for CSS!

Notice how we put `css-loader` **at the end** of the array. We **must** set this order and not the reverse.

Webpack will run the loaders starting at the end, so we want it to read the CSS file into a string with `css-loader` first, then use `style-loader` to inject the JavaScript that applies the CSS in that string to the page. It wouldn't work the same the other way round.

</div>

Now that Webpack knows what to do with imported CSS files, let's add some CSS! Create a `src/styles.css` with the following:

```css
/* styles.css */
body {
  background-color: rebeccapurple;
}
```

You can now import your CSS file into one of your JavaScript files. `src/index.js` makes sense. We don't need anything from the imported CSS file itself. Since our CSS and style loaders will handle all of that for us, we can just use a [side effect import](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import#import_a_module_for_its_side_effects_only).

```javascript
import "./styles.css";
import { greeting } from "./greeting.js";

console.log(greeting);
```

Once again, bundle with Webpack using `npx webpack`, then open `dist/index.html` and enjoy the beautiful purple screen!

#### What about link tags?

Notice how we don't link our CSS file in our HTML template like we would've done before. While you could do this with one of the loaders from the next section, in the real world, projects often contain many moving parts and many modules. Eventually, it becomes easier to work with multiple smaller CSS files that you import in the modules they're needed. There are even ways those files can be scoped only to those modules and not globally!

We're only introducing the minimum to allow you to import your CSS into your JavaScript, but many build tools and more sophisticated bundler configurations will do a lot more to imported CSS than what we're showing here.

### Loading images

We're nearly done with the main Webpack configuration! If we have any local image files we want to include within our website, they will also require a little extra configuration since they're not JavaScript files.

There are three different ways you could be dealing with local image files:

1. **Image files used in our CSS inside `url()`**

   Lucky us! `css-loader` already handles this for us, so there's nothing extra to do for image paths in CSS!

1. **Image files we reference in our HTML template, e.g. as the `src` of an `<img>`**

   We need to install and tell Webpack to use something called `html-loader`, which will detect image file paths in our HTML template and load the right image files for us. Without this, `./odin.png` would just be a bit of text that will no longer reference the correct file once we run Webpack to build into `dist`. Let's install it:

   ```bash
   npm install --save-dev html-loader
   ```

   Then, add the following object to the `modules.rules` array within `webpack.config.js`:

   ```javascript
   {
     test: /\.html$/i,
     loader: "html-loader",
   }
   ```

1. **Images we use in our JavaScript, where we will need to import the files**

   If we need to use a local image file in our JavaScript (such as when manipulating the DOM to create or edit `img` elements and set their `src` attribute), we need to import the images into our JavaScript module. Since images aren't JavaScript, we need to tell Webpack that these files will be assets by adding an `asset/resource` rule. No need to install anything here. Just add the following object to the `modules.rules` array within `webpack.config.js`:

   ```javascript
   {
     test: /\.(png|svg|jpg|jpeg|gif)$/i,
     type: "asset/resource",
   }
   ```

   You can always edit the regex in the `test` property to remove any file extensions you don't need or add any extensions you do need. What's shown above is straight from [Webpack's Asset Management guide](https://webpack.js.org/guides/asset-management/#loading-images) and will recognize most of the common image file extensions.

   Then, in whatever JavaScript module we want to use that image in, we just have to default import it.

   ```javascript
   import odinImage from "./odin.png";
   
   const image = document.createElement("img");
   image.src = odinImage;
   
   document.body.appendChild(image);
   ```

   We have to import it so that the `odinImage` variable contains the correct file path, even when we bundle into `dist`. If we just wrote `image.src = "./odin.png";`, then the "file path" would just be a plain string. When we bundle into `dist`, Webpack will not magically recognize that this string in our JavaScript references a file and so will not include it in the bundle. When we import it and set the correct `asset/resource` rule, Webpack will recognize the import, include the image file when we bundle, and also make sure the imported variable contains the correct file path at the end.

After all that, if we added both `html-loader` and the image `asset/resource` rule, our `webpack.config.js` would look something like this:

```javascript
// webpack.config.js
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  mode: "development",
  entry: "./src/index.js",
  output: {
    filename: "main.js",
    path: path.resolve(__dirname, "dist"),
    clean: true,
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "./src/template.html",
    }),
  ],
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ["style-loader", "css-loader"],
      },
      {
        test: /\.html$/i,
        loader: "html-loader",
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: "asset/resource",
      },
    ],
  },
};
```

You might notice that when images are included when bundling, the output image file in `dist` has a different file name (it will likely be some jumble of numbers and letters). By default, Webpack gives your bundled image files a new name by hashing their contents. You do not need to know how this works, nor do you need to dig into the details of why, nor how to change it. You just need to be aware that this is expected behavior (it's to do with preventing issues with the browser cache and matching file names).

<div class="lesson-note lesson-note--tip" markdown="1">

#### You only need to configure what you need

You may not need everything we've mentioned. If your project does not have images with local file path sources in your HTML template, you do not need `html-loader` set up. If you aren't using any local images in your JavaScript, you won't need the image `asset/resource` rule set up.

Similarly, in the future, you may end up working with things that need a special loader or plugin, such as custom fonts or preprocessors. You can always use Google or reference Webpack's documentation for instructions on what you'd need when that time comes.

</div>

### Webpack dev server

During this lesson, did you get a bit annoyed with having to run `npx webpack` to rebundle with every change? Fortunately, there are multiple solutions for this, and we will focus on what we think is the most useful option: `webpack-dev-server`. Install it as follows:

```bash
npm install --save-dev webpack-dev-server
```

You may have used something like the Live Preview VSCode extension before, where it automatically refreshes your web page whenever you save a change. `webpack-dev-server` is very similar, meaning we won't have to keep running `npx webpack` after each change we make.

It works by bundling your code behind the scenes (as if we ran `npx webpack`, but without saving the files to `dist`), and it does this every time you save a file that's used in the bundle. We can also use something called a **source map** so that any error messages reference files and lines from our development code and not the jumbled mess inside our single bundled `.js` file!

Once installed, in our `webpack.config.js`, we only need to add a couple more properties somewhere in the configuration object (the order of these properties does not matter):

```javascript
// webpack.config.js
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  mode: "development",
  entry: "./src/index.js",
  output: {
    filename: "main.js",
    path: path.resolve(__dirname, "dist"),
    clean: true,
  },
  devtool: "eval-source-map",
  devServer: {
    watchFiles: ["./src/template.html"],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "./src/template.html",
    }),
  ],
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ["style-loader", "css-loader"],
      },
      {
        test: /\.html$/i,
        loader: "html-loader",
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: "asset/resource",
      },
    ],
  },
};
```

<span id="source-maps"></span>

Firstly, we add a [source map](https://webpack.js.org/configuration/devtool/) by setting `eval-source-map` as a `devtool` option. If we don't do this, any error messages we get won't necessarily match up to the correct files and line numbers from our development code. In the devtools "Sources" tab, we also won't be able to find our original untouched code, making the Chrome debugger harder to use. Adding this source map will solve both of these problems for us.

Secondly, by default, `webpack-dev-server` will only auto-restart when it detects any changes to files we import into our JavaScript bundle, so our HTML template will be ignored! All we need to do is add it to the dev server's array of watched files - nice and simple!

Once set up, `npx webpack serve` will host our web page on `http://localhost:8080/`, which we can open in our browser and start working!

<div class="lesson-note" markdown="1">

Note that the webpack-dev-server only reads your webpack configuration when you start it. If you change the webpack config file while the dev server is running, it will not reflect those config changes. Use <kbd>Ctrl</kbd> + <kbd>C</kbd> in the terminal to kill it then rerun `npx webpack serve` to apply the new config.  

</div>

### Rounding up

Yes, yes, this all might seem like a lot. You've gone from just having some basic HTML, CSS and JS files, and not needing much else to suddenly needing this loader, that plugin, this configuration file, etc. In the real world, as apps get more complex, we need tools that can improve our development experience while optimizing things in production. Even though we're not using all of the features available to us right now, a general understanding of what these sorts of tools are doing for us is valuable. Later in the curriculum, you will use different tools that abstract a lot of these underlying mechanisms away from us. Using them and having no clue what they're actually doing for you can make things harder for you when you eventually encounter a situation that actually needs some kind of manual configuration.

In a later lesson, we will introduce some extra things that can make setting up and working with Webpack much quicker and more straightforward. For now, however, it's good to get a little manual practice in.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Start by reading the [Webpack concepts](https://webpack.js.org/concepts/) page to get a general understanding of some of the main terms.
1. [Webpack's Asset Management guide](https://webpack.js.org/guides/asset-management/) goes through some examples of how to handle various kinds of assets, like CSS, images, and fonts. You'll see that its examples use `npm run build` to bundle the files; in these examples, that's the equivalent of `npx webpack`. We will go through npm scripts in a later lesson.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is a bundler?](#bundling)
- [What is Webpack?](#webpack)
- [How do you bundle JavaScript?](#bundling-javascript)
- [How do you load CSS using Webpack?](#loading-css)
- [How do you automatically build HTML files in `dist` using Webpack?](#handling-html)
- [How would you handle assets like local image files?](#loading-images)
- [What Webpack tool could you use during development to view changes to your website live?](#webpack-dev-server)
- [How does using a source map help with development?](#source-maps)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
