### Introduction

At this point, you have written quite a bit of vanilla HTML and CSS, and learned many design techniques that you will continue to use as you grow as a developer. However, through your experiences, you have no doubt encountered a CSS framework or two. You may have also learned about preprocessors (aka precompilers). Both of these types of tools can make writing CSS more streamlined and less tedious.

You should be aware that at this point in your learning, both frameworks and preprocessors are options for you, but neither of them are necessary. In particular, you'll read a strong argument below AGAINST using frameworks at this point.

### Learning Outcomes

- What are CSS frameworks?
- How do frameworks actually work to get you the look you want?
- How do you interact with the framework to get the look you want?
- What are Bootstrap, Foundation, Tailwind and Bulma?
- What other frameworks are find out there?
- What are the disadvantages of using frameworks?

- What is a preprocessor?
- What are the advantages of using a preprocessor?
- What does it mean that a preprocessor "compiles to CSS"?
- What is SASS/SCSS?
- How can you use SASS to nest CSS?
- How can you use SASS to work with variables in your code?
- What are the advantages of using mix-ins with SASS?
- If you're not using Rails, how do you set up SASS?
- What is LESS and how is it different from SASS?
- What other preprocessors are out there?

### Frameworks Overview

Frameworks like [Bootstrap]](https://getbootstrap.com/) and [Foundation](https://get.foundation) do a lot of the heavy lifting of packaging up commonly used CSS code, even icons and interactions (like menu dropdowns), for you. They are designed to abstract away the process of coding intuitive, reusable, and responsive elements. They do this by creating these elements for you, and giving you the tools to inject styles into your HTML elements directly through class name keywords. All you have to do is understand how a framework expects you to lay out your site and which classes it uses to designate its particular batch of styles.

While the two frameworks mentioned above are heavy hitters that have been around for a while, you should be aware that there are quite a few others at this point, as evidenced by all of the lists of popular frameworks on the web. Two other extremely popular frameworks are [Tailwind](https://tailwindcss.com/) and [Bulma](https://bulma.io/). There are many more out there.

### Disadvantages of Frameworks

Frameworks are great for rapidly producing sites with interfaces that end users can easily interact with. However, once you've taken a tour through some of the more popular ones, like Bootstrap, you'll start noticing an awful lot of similarities between a lot of sites you encounter, due to similar use of frameworks. Another concern with frameworks is that too many new developers jump into learning frameworks too early in their education; the prospect of not having to keep practicing writing vanilla CSS is very tempting. As a result, these developers do not get enough CSS practice under their belts to solidify the fundamentals of that very important language.

Additionally, the process of overriding a framework's styling or debugging style issues on your page becomes very difficult if you haven't really mastered CSS fundamentals. It is imperative to understand what a framework is doing "under the hood" so you are equipped to handle these issues later (and trust us, you will).

For the reasons above, **we recommend that you continue to focus on the fundamentals of CSS as you continue through the curriculum.** This lesson is merely designed to teach you _about_ frameworks and their role.

### Preprocessors Overview

Preprocessors (aka precompilers) are languages that help you write CSS more easily. They  eliminate code repetition and provide all sorts of time-saving and code-saving features. Some of the standard preprocessors in use are [SASS](https://sass-lang.com/), [LESS](https://lesscss.org/)and [Stylus](https://stylus-lang.com/).

Note: If you've been using Rails, you'll be familiar with SASS already since it's baked in.  If you're not using Rails, you may need to add some additional steps to your workflow to get it set up, but it's usually worth it.

Some of the useful features of preprocessors include:

1. Programming in CSS but with more options available to you.
2. Including variables in your CSS (not an option in vanilla CSS).
3. Including loops in your CSS (again not an option in vanilla CSS).
4. Including if/else statement in your CSS (see the pattern here?).
5. Allowing you to create reusable code.
6. And a lot more features, depending on which preprocessor you use.

As you can see, preprocessors are extremely helpful tools; however, there are some potential disadvantages to using them. See the reading below for one list of disadvantages.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read [this brief overview of frameworks](https://medium.com/html-all-the-things/what-is-a-css-framework-f758ef0b1a11).
2. Check out [this article](https://www.smashingmagazine.com/2018/11/css-frameworks-css-grid/) on the pros and cons of using a framework vs. CSS grid.
3. Read [this brief article](https://blog.zipboard.co/do-i-need-to-start-using-css-preprocessors-a72b525c180a) that takes a look at the three preprocessors mentioned above, and why they are useful.
4. Read [this extremely brief article](https://medium.com/@LiliOuakninFelsen/what-is-a-css-pre-processor-why-should-you-use-one-ac3d4cd4b2c2) on why you should use a preprocessor.
5. For balance, read [this list of the disadvantages of using a preprocessor](https://adamsilver.io/blog/the-disadvantages-of-css-preprocessors/).
</div>

### Additional Resources

* [Bootstrap documentation](https://bootstrapdocs.com/v3.0.3/docs/getting-started/)
* [Foundation documentation](https://get.foundation/sites/docs/)
* [Tailwind documentation](https://tailwindcss.com/docs)
* [Bulma documentation](https://bulma.io/documentation/)
* [SASS documentation](https://sass-lang.com/documentation)
* [LESS documentation](https://lesscss.org/)
* [Stylus documentation](https://stylus-lang.com/)


### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* [In your own words, describe what a CSS framework does.](https://www.browserstack.com/guide/top-css-frameworks)
* [What are some popular CSS frameworks?](https://dev.to/thenerdydev/best-css-frameworks-in-2021-1f3p)
* [What are some advantages of using a CSS framework?](https://speckyboy.com/discussing-the-pros-and-cons-of-using-a-css-framework/)
* [What are some disadvantages of using a CSS framework?](https://speckyboy.com/discussing-the-pros-and-cons-of-using-a-css-framework/)
* [When might it be better to use vanilla CSS over a framework?](https://dev.to/shubambhasin/vanilla-css-vs-css-frameworks-3ol7)
* [In your own words, describe what a CSS preprocessor does.](https://developer.mozilla.org/en-US/docs/Glossary/CSS_preprocessor)
* [What are some popular CSS preprocessors?](https://developer.mozilla.org/en-US/docs/Glossary/CSS_preprocessor)
* [What are some of the useful features of CSS preprocessor?](https://www.freecodecamp.org/news/css-preprocessors/)
* [What are some disadvantages of using a CSS preprocessor?](https://adamsilver.io/blog/the-disadvantages-of-css-preprocessors/)
