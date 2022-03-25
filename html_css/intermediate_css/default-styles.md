### Introduction
Browsers, by default, inject a little bit of style into your web projects. You may not have thought about this specifically, but you  have definitely encountered it.

### Learning Outcomes
- You'll learn about default browser styles
- You'll learn how to use a CSS reset to remove, or change those default styles. 

### Default Styles

When you did the first [HTML Recipes project](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/recipes), you would have noticed that some elements already have a little bit of style applied to them. An `h1`, for instance, is bigger and bolder than regular text. Links (`a`) are blue and underlined. Lists (`ul` and `ol`) both have a bunch of padding surrounding them. Browsers accomplish this by inserting a little bit of CSS into every webpage. ([Here is Chrome's default HTML stylesheet](https://chromium.googlesource.com/chromium/blink/+/refs/heads/main/Source/core/css/html.css))

The problem with this is that there is no guarantee that different browsers will style everything the same. In general, inconsistencies are going to be pretty minor, but they DO exist. Also, in many cases as a developer you're going to end up undoing or redoing all of this default styling to make your site look exactly how you envision it.

To counter this, many developers start their projects with a "CSS Reset"; a file that undoes browser defaults, so that every element behaves the same in every browser. 

You don't _have_ to use a CSS reset. In many cases you're going to end up undoing, or redoing a lot of the styles that a reset will provide for you. You can decide whether or not you want to use one on a regular basis, but it's worth taking the time to dig through a couple now. Understanding exactly how they're doing what they're doing is a useful exercise!

### Assignment
<div class="lesson-content__panel" markdown="1">
1. [The Meyer Reset](https://meyerweb.com/eric/tools/css/reset/) is almost certainly the most popular. It's very simple and basically removes every default style.
2. [Normalize.css](http://nicolasgallagher.com/about-normalize-css/) is another popular one. It's a little different in that it doesn't remove all the default styles, but tweaks them slightly to ensure that browsers are consistent.
3. [Reboot, Resets and Reasoning](https://css-tricks.com/reboot-resets-reasoning/) is a CSS tricks article that goes a little more in depth, and mentions a few other popular resets.
4. Maybe more trivial than useful, this [Browser Default Styles](https://browserdefaultstyles.com/) site is fun to play with.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something

* [A Look at CSS Resets in 2018](https://bitsofco.de/a-look-at-css-resets-in-2018/) is another article that talks about the various resets out there.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='#default-styles'>Why would you want to use a CSS reset?</a>
