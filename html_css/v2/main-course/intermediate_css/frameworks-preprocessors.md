### Introduction

At this point, you have written quite a bit of vanilla HTML and CSS, and learned many design techniques that you will continue to use as you grow as a developer. Through your experiences, you have no doubt encountered a CSS framework or two. You may have also learned about preprocessors (aka precompilers). Both of these types of tools can make writing CSS more streamlined and less tedious.

You should be aware that, at this point in your learning, both frameworks and preprocessors are options for you, but that neither of them is necessary.

An important reason to know about frameworks and preprocessors is that they are are commonly found in the workplace. In addition, many job requirements include Bootstrap, SASS, and related technology. So it's helpful for you to know what these tools are, and where to look for them once you've determined you need to learn them.

### Learning Outcomes

By the end of this lesson, you should:

- Know what a CSS framework is.
- Know some of the available frameworks.
- Know what a preprocessor is.
- Know some of the available preprocessors.

### Frameworks Overview

Frameworks like [Bootstrap]](https://getbootstrap.com/) and [Tailwind](https://tailwindcss.com/) do a lot of the heavy lifting of packaging up commonly used CSS code for you, even icons and interactions (like menu dropdowns). They are designed to abstract away the process of coding intuitive, reusable, and responsive elements. A CSS framework is ultimately just a bundle of CSS that you can use and access, using the classes defined by the framework. For example, many frameworks provide a class called .btn that will add all the needed styles to your buttons, without your having to write any CSS. In general, all you have to do to use a framework is understand how it expects you to lay out your site, and which classes it uses to designate its particular batch of styles.

You should be aware that there are quite a few frameworks available to choose from. Two other frameworks to know about are [Bulma](https://bulma.io/) and [Foundation](https://get.foundation). There are many more out there.

### Disadvantages of Frameworks

Frameworks are great for rapidly producing sites with interfaces that end users can easily interact with. However, once you've taken a tour through some of the more popular frameworks, you'll start noticing an awful lot of similarities between a lot of sites you encounter, due to similar use of frameworks. In addition to that issue, too many new developers also jump into learning frameworks too early in their education; the prospect of not having to practice writing vanilla CSS is very tempting. As a result, many developers do not get enough CSS practice under their belts to solidify the fundamentals of this very important language.

Additionally, the process of overriding a framework's styling or debugging style issues on your page becomes very difficult if you haven't really mastered CSS fundamentals. It is imperative to understand what a framework is doing "under the hood" so that you are equipped to handle these issues later (and trust us, you will have to).

Ultimately, frameworks can help you get up and running quickly - but they can constrain you in the long run. And once you've started a project using a framework it can be difficult to remove it. So whether or not you use frameworks for projects in the future is up to you! (And maybe up to your employer as well....)

### Preprocessors Overview

Preprocessors (aka precompilers) are languages that help you write CSS more easily. They reduce code repetition and provide all sorts of time-saving and code-saving features. A few examples: preprocessors allow you to write loops, join multiple stylesheets, and nest classes.

CSS preprocessors are extensions to vanilla CSS that provide some extra functionality such as nesting, mixins, and variables. When you run the processor, it takes your code and turns it into vanilla CSS that you can import into your project.

Preprocessors do have some unique and helpful tools, but many of their most helpful features have been implemented in vanilla CSS, so it might not be worth the overhead of learning one unless you think you really need these features.

Some of the standard preprocessors in use are [SASS](https://sass-lang.com/), [LESS](https://lesscss.org/)and [Stylus](https://stylus-lang.com/).

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read [this brief overview of frameworks](https://medium.com/html-all-the-things/what-is-a-css-framework-f758ef0b1a11).
2. Read [this article](https://www.smashingmagazine.com/2018/11/css-frameworks-css-grid/), which considers the pros and cons of using a framework vs. CSS grid.
3. Skim [this article](https://www.lambdatest.com/blog/css-preprocessors-sass-vs-less-vs-stylus-with-examples/), which gives an overview of SASS, LESS and Stylus.
4. Read [this brief article](https://medium.com/@LiliOuakninFelsen/what-is-a-css-pre-processor-why-should-you-use-one-ac3d4cd4b2c2), which gives some reasons for using a preprocessor.
5. For balance, read [this list of the disadvantages of using a preprocessor](https://adamsilver.io/blog/the-disadvantages-of-css-preprocessors/).
</div>

### Additional Resources

* [Bootstrap documentation](https://bootstrapdocs.com/v3.0.3/docs/getting-started/)
* [Tailwind documentation](https://tailwindcss.com/docs)
* [SASS documentation](https://sass-lang.com/documentation)

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* [What are some advantages of using a CSS framework?](https://www.smashingmagazine.com/2018/11/css-frameworks-css-grid/)
* [What are some disadvantages of using a CSS framework?](https://www.smashingmagazine.com/2018/11/css-frameworks-css-grid/)
* [What are some advantages of using a CSS preprocessor?](https://medium.com/@LiliOuakninFelsen/what-is-a-css-pre-processor-why-should-you-use-one-ac3d4cd4b2c2)
* [What are some disadvantages of using a CSS preprocessor?](https://adamsilver.io/blog/the-disadvantages-of-css-preprocessors/)
