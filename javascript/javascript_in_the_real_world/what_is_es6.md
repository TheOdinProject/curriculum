### Introduction

We've been throwing around the term **ES6** since our very first lessons, but we haven't taken the time to properly explain what it means or to investigate the implications of it in our code.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what ES6 is.
- Describe the current ECMAScript release system.
- Explain some potential issues with browser support for newer JavaScript features.
- Explain what Babel is.

### ECMAScript

ES6 is a version of JavaScript that was officially released in the summer of 2015. It included *many* new features that make writing JavaScript much easier and cleaner. If you have been following our lessons you have already been learning these new features because, well, ES6 is *just JavaScript*.

You have probably also come across articles talking about features in ES7 or ES8 or ES2015 or ES2017 etc. Part of the confusion here is that right after the release of ES6, the committee that makes these decisions changed the naming scheme from 'version numbers' (ES5, ES6, ES7 etc.) to 'release years' (ES2015, ES2016, ES2017 etc.)

- The following article provides a nice [timeline of the various ECMAScript releases](https://codeburst.io/javascript-wtf-is-es6-es8-es-2017-ecmascript-dca859e4821c).
- Read about all the [new features that showed up in ES6 (a.k.a. ES2015)](https://github.com/lukehoban/es6features). You've already been using many of these, although there are a few we haven't specifically covered yet.

The *problem* with JavaScript constantly updating and adding features is that it sometimes takes web-browsers a while to catch up and implement new features once they've been released. At the current time all modern browsers (Chrome, Firefox, Safari and Edge) support *all* of ES6, and *most* of ES7, but older browsers (various versions of Internet Explorer for instance) do not. This means, unfortunately, that if you write code that uses these new features it **will not run** in browsers that do not support it.

For most of us, this has not been an issue because you are almost definitely using a new browser that automatically updates itself when a new version is released. But in the real world, if you're selling products to customers you can't control which browsers people will use to connect to your site.

Fortunately there *is* a solution to this problem. [Babel](http://babeljs.io/) is a tool that takes your modern JavaScript code and **transpiles** it to code that older browsers can understand. It can be used from the command line with a single command, and can also easily be added to your webpack configuration with the babel-loader.

In all honesty, this is not something that you are going to *need* to worry about on every project you're starting. All the ES6 features are present in the large majority of browsers used worldwide. But JavaScript is constantly changing, and as new features are announced and released, you can use Babel to try them out, often before they're available in *any* browser!

- Here are some instructions for [installing `babel-loader` for use with webpack](https://github.com/babel/babel-loader) if you wanted to try it out. If you've already got webpack up and running in a project, adding babel is a cinch!
- Read about [presets and plugins in Babel](https://blog.jakoblind.no/babel-preset-env/). It will also show you how to target specific browser versions you want to support.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- []()

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
