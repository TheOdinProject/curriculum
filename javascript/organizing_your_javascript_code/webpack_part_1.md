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

In the previous lesson, we learnt what an **entry point** was, what a **dependency graph** was, and how to add an entry point file to HTML as a module script. With bundling, the same concepts of entry points and dependency graphs apply. We provide the bundler with an entry point and it builds a dependency graph from that file, combines all relevant files together, then outputs a single file with all the necessary code included.

While it does this, we could also get it to do a whole bunch of other things, such as [minifying our code](https://en.wikipedia.org/wiki/Minification_(programming)), image optimizations, or even ["tree shaking"](https://developer.mozilla.org/en-US/docs/Glossary/Tree_shaking) (detecting and removing unused code within a bundle). Most of these extra optimizations are out of the scope of this course; we will instead be focusing on getting a bundler called Webpack set up to bundle JavaScript, and handle HTML, CSS, and assets (such as images).

### Webpack



### HTML-webpack-plugin

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

-

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
