We've already introduced webpack in a previous lesson. It is the go-to tool across the web for bundling and compiling javascript code. There _are_ other options out there, but at this time none of them are as popular or widely used as webpack.

In our last lesson, we covered the first half of what webpack can do for you: bundling your modules. Another amazing feature is webpack's ability to process and manipulate your code during the compilation step. So, for example, if you would like to use [Sass](http://sass-lang.com/) to write your CSS, webpack can do that for you. Webpack can manage your images and compress and optimize them for use on the web. Webpack can [minify and uglify](https://stackoverflow.com/questions/33708197/does-it-make-sense-to-do-both-minify-and-uglify/33708348) your code. There are tons of things webpack can do, but to access these functions we need to learn more about loaders and plugins.

### Learning Outcomes
After completing this lesson, you will be able to:

 - Use webpack by following its documentation.
 - Load assets with webpack.
 - Manage output with webpack.

1. Go through [this tutorial](https://webpack.js.org/guides/asset-management/) to see examples of using webpack to manage your website's assets.
2. Read through [this tutorial](https://webpack.js.org/guides/output-management/) to learn how to let webpack automatically manage your index.html and insert your bundle into the page for you!
3. Finally, the first part of [this tutorial](https://webpack.js.org/guides/development/) talks about source maps, a handy way to track down which source file (index.js, a.js, b.js) an error is coming from when you use webpack to bundle them together. This is essential to debugging bundled code in your browser's DevTools. If the error comes from b.js the error will reference that file instead of the bundle. It also walks through an example of the `--watch` feature you _definitely_ should have taken note of above.
4. You don't need to do the rest of the webpack tutorials at this time, but take a look at what's offered on the sidebar of their [guides page](https://webpack.js.org/guides/). There are several sweet features that you might want to use in future projects such as code-splitting, lazy-loading, and tree-shaking. Now that you have a handle on webpack's configuration system adding these features is as easy as using the right plugins and loaders!

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="https://webpack.js.org/guides/asset-management/#loading-css">How do you load CSS using webpack?</a>
- <a class="knowledge-check-link" href="https://webpack.js.org/guides/asset-management/#loading-images">How do you load images using webpack?</a>
- <a class="knowledge-check-link" href="https://webpack.js.org/guides/asset-management/#loading-fonts">How do you load fonts using webpack?</a>
- <a class="knowledge-check-link" href="https://webpack.js.org/guides/asset-management/#loading-data">How do you load data using webpack?</a>
- <a class="knowledge-check-link" href="https://webpack.js.org/guides/development/">How would you track errors in bundled source code?</a>
