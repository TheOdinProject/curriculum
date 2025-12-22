### Introduction

We've been throwing around the term **ES6** since our very first lessons, but we haven't taken the time to properly explain what it means or to investigate the implications of it in our code.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what ES6 is.
- Describe the current ECMAScript release system.
- Explain some potential issues with browser support for newer JavaScript features.
- Explain what Babel is.

### ECMAScript

JavaScript is just a programming language that conforms to the ECMAScript standard, made by Ecma International, and ES6 is a version of JavaScript that was officially released in the summer of 2015. It included *many* new features that make writing JavaScript much easier and cleaner. In this curriculum, you have already been learning many of these new features because, well, ES6 is *just JavaScript*.

#### Release schedule

You have probably also come across articles talking about features in ES7 or ES8 or ES2015 or ES2017 etc. Part of the confusion here is that right after the release of ES6, the committee that makes these decisions (known as TC39) changed the naming scheme from version numbers (ES5, ES6, ES7 etc.) to release years. ES6 is also known as ES2015, and what some articles refer to as ES7 is also known as ES2016 etc. Instead of a single new version containing a huge number of new features (as was the case with ES6 and before), versions are now released annually with a smaller set of additions per version.

### Browser support

The *problem* with JavaScript constantly updating and adding features is that it sometimes takes web browsers a while to catch up and implement new features once they've been released. It often takes a couple of years for a new feature to become "widely available" (supported across the majority of modern browsers and browser versions in use). This means, unfortunately, that if you write code using brand new features, it **will not run** in browsers that do not support it.

For most of us, this has not been an issue because you are almost definitely using a new browser that automatically updates itself when a new version is released. But in the real world, if you're selling products to customers, you can't control which browsers people will use to connect to your site.

#### Babel

Fortunately there *is* a solution to this problem. [Babel](http://babeljs.io/) is a tool that takes your modern JavaScript code and **transpiles** it to code that older browsers can understand. It can be set to transpile to meet any number of targets (e.g. minimum browser versions across various browsers), where the necessary targets depend on things like the product's purpose, its target audience etc. Some products may be fine with more recent browser support only whereas others may need to be much stricter and ensure support for much older browsers.

In all honesty, this is *not* something that you are going to need to worry about on every project you're starting, since the point of curriculum projects is to get practical experience with things and not delivering production-level products to customers. Still, it helps to be aware of the situation and what things may be necessary in the real world.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. To satisfy your curiosity, have a look at all the new [features that showed up in ES6 (a.k.a. ES2015)](https://github.com/lukehoban/es6features). Though you'll already have been using many of these, there are a few we haven't specifically covered yet (you do not need to explore these yet).
1. Have a brief look at the [timeline of the various ECMAScript releases](https://en.wikipedia.org/wiki/ECMAScript_version_history#14th_Edition_%E2%80%93_ECMAScript_2023) which includes small summaries of the annual versions since ES6. Again, some things you may have already used and others you will not recognize nor need to explore yet.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is ES6?](#ecmascript)
- [Since ES6, what release schedule has been used for new ECMAScript versions?](#release-schedule)
- [Why might someone need to be careful about using brand new JavaScript features?](#browser-support)
- [What tool can be used to transpile newer JavaScript for older browser support?](#babel)
