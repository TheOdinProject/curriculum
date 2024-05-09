### Introduction

In the previous lesson, we introduced ES6 modules (ESM) and npm. While the introduction of ESM greatly mitigated some of the issues with managing individual script files and dependencies, there would still be performance issues to consider the more module files the browser would have to download individually (especially as more third party libraries would be imported). Fortunately, more recent web technologies have greatly improved these aspects, but bundlers still provide us with a lot of power to process and optimize our code in various ways. This power, however, does come with a small cost of needing to configure a bundler. For now, our needs are few and simple, and we can look at the basic things one at a time.

Awareness of and basic experience with bundlers are valuable. While in recent years, new build tools have come out that handle a lot of basic configuration for us, in the real world, you may not always get a chance to use these tools. It's very reasonable to end up working with codebases that use tools that require more manual configuration. Even if you did get to work with tools that handle more things for you, it's useful to understand what those tools are actually doing for you.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain the purpose of bundlers and how they work.
- Configure Webpack to bundle JavaScript modules.
- Configure Webpack to deal with non-JavaScript files during bundling, including with HtmlWebpackPlugin.
- Set up Webpack's development server.

### Bundling

In the previous lesson, we learned what an **entry point** is, what a **dependency graph** is, and how to add an entry point file to HTML as a module script. With bundling, the same concepts of entry points and dependency graphs apply: we provide the bundler with an entry point and it builds a dependency graph from that file, combines all relevant files together, then outputs a single file with all the necessary code included.

While it does this, we could also get it to do a whole bunch of other things, such as [minifying our code](https://en.wikipedia.org/wiki/Minification_(programming)), image optimizations, or even ["tree shaking"](https://developer.mozilla.org/en-US/docs/Glossary/Tree_shaking). Most of these extra optimizations are out of the scope of this course; we will instead be focusing on basic bundling of JavaScript, while handling HTML, CSS, and assets (such as images).

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

Note that we included the `--save-dev` flag (you can also use `-D` as a shortcut), which tells npm to record our two packages as development dependencies. We will only be using Webpack during development. The actual code run that makes Webpack run will not be a part of the code that the browser will run.

Also notice that when these finished installing, a `node_modules` directory and a `package-lock.json` got auto-generated. `node_modules` is where Webpack's actual code (and a whole bunch of other stuff) lives, and `package-lock.json` is just another file npm uses to track package information.

<div class="lesson-note" markdown="1">

#### src and dist

When dealing with Webpack (and often with any other bundler or build tool), we have two very important directories: `src` (short for "source") and `dist` (short for "distribution"). We could technically call these directories whatever we want, but these names are convention.

`src` is where we keep all of our website's source code, essentially where all of our work will be done (with an exception being altering any configuration files in the root of the project). When we run Webpack to bundle our code, it will output the bundled files into the `dist` directory. The idea is that if someone was to fork or clone the project, they would not need the `dist` directory, as they'd just be able to run Webpack to build from `src` into their own `dist`. Similarly, to deploy our website, we would only need the `dist` code and nothing else. Keep that in mind! Work inside `src`, build into and deploy from `dist`!

</div>

### Bundling JavaScript

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

Great, now we have an `index.js` that imports from, and so depends on, `greeting.js`. In order to bundle this, we'll also want a Webpack configuration file which will contain all the details we need for bundling, such as the entry point, the output destination, and anything like plugins and loaders (which we will cover shortly).

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

Yes, you may have noticed this file uses CommonJS (CJS) syntax instead of ESM. That's because this file (and Webpack itself) runs in NodeJS and not the browser. By default, NodeJS uses CJS syntax, and the configuration file also contains some CJS-specific things. We need not worry about this - this is just stuff we need for Webpack to do it's thing.

You'll notice the exported object containing a few key sections:

- `mode`: For now, we will just leave this in development mode, as it will be more useful to us. We will revisit this and production mode in a later lesson.
- `entry`: A file path from the config file to whichever file is our entry point, which in this case is `src/index.js`.
- `output`: An object containing information about the output bundle.
  - `filename`: The name of the output bundle - it can be anything you want.
  - `path`: The path to the output directory, in this case, `dist`. If this directory doesn't already exist when we run Webpack, it will automatically create it for us as well. Don't worry too much about why we have the `path.resolve` part - this is just the way Webpack recommends we specify the output directory.
  - `clean`: If we include this option and set it to `true`, then each time we run Webpack to bundle, it will empty the output directory first before bundling the files into it. This helps us keep `dist` clean so it only contains the files produced by the most recent bundling.
  
With these files all in place, let's run Webpack and see what happens!

```bash
npx webpack
```

You should see that Webpack has created a `dist` directory for us containing a `main.js` file! Inside this file is...a lot of stuff... Don't worry, most of this stuff is just for development tools we will use later. If you go ahead and run this file with `node dist/main.js`, you should see `Hello, Odinite!` get logged in the terminal.

Congratulations! You've just made your first bundle with Webpack!

### Handling HTML

Let's actually include some HTML. After all, we're interested in making websites! Since HTML isn't JavaScript, Webpack can't just bundle it straight away, but there's a nifty tool we can use called `HtmlWebpackPlugin` that's just perfect for us.

Run the following command to install HtmlWebpackPlugin (also as a dev dependency):

```bash
npm install --save-dev html-webpack-plugin
```

We should also create a `template.html` inside `src` (you can name this file whatever you want), and fill that with the usual HTML boilerplate. **We do not need to add a script tag in this file!** HtmlWebpackPlugin will automatically add our output bundle as a script tag. We wouldn't want to double up by including our own one too! Inside our `webpack.config.js`, we can add a few little bits.

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
    new HtmlWebpackPlugin({ template: "./src/template.html" }),
  ],
};
```

All we're doing here is making sure our Webpack configuration has access to HtmlWebpackPlugin, then we add it as a plugin to the configuration object. Inside HtmlWebpackPlugin function call, we pass in any options. For now, we're only interested in the `template` option.

If we provide the path to our `src/template.html` file as a template, when we run `npx webpack` again, you'll notice our `dist` directory not only contains a `main.js` file but an `index.html` file as well. You'll also notice that HtmlWebpackPlugin has automatically added a deferred script tag to our `main.js` bundle file - what a darling! If you open this file in the browser and check the browser console, you should see our lovely `"Hello, Odinite!"` string logged.

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
    new HtmlWebpackPlugin({ template: "./src/template.html" }),
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

#### Loader order matters!

Notice how we put `css-loader` **at the end** of the array. We **must** set this order and not the reverse.

Webpack will run the loaders starting at the end, so we want it to read the CSS file into a string with `css-loader` first, then use `style-loader` to inject the JavaScript that applies the CSS in that string to the page. It wouldn't work the same if we told it to do things back-to-front now.

</div>

Now that Webpack knows what to do with imported CSS files, let's add some CSS! Create a `src/styles.css` with the following:

```css
// styles.css
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

Once again, rebundle with Webpack using `npx webpack`, then open `dist/index.html` and enjoy the beautiful purple screen!

### Loading images

### Webpack dev server

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

-

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
