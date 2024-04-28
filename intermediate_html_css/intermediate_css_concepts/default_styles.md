### Introduction

Browsers apply a set of default styles to every webpage. You may not have thought about this directly, but you have undoubtedly encountered it.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn about default browser styles.
- You'll learn how to use a CSS reset to remove or change those default styles.

### What are default styles and where do they come from?

As you have worked on projects, you likely observed default styles applied to certain elements, such as larger and bolder headings on `h1` elements, and blue, underlined links on `a' elements. There is also a good chance you struggled with things like default margins and padding. These styles are part of the user-agent stylesheets, ensuring basic styling for webpages without CSS. Each browser has its own set of user-agent stylesheets so the default styles do vary slightly between browsers.

### What if I don't like the defaults?

With very few exceptions you can simply write your own CSS rules. The rules you write in your stylesheet have higher precedence than the user-agents rules, and therefore overwrite the defaults. However, there is another option.

To address inconsistencies across browsers and establish a consistent starting point for styling, some developers started using CSS resets. These resets are stylesheets containing CSS rules aimed at altering or removing the defaults set by user-agent stylesheets. Using them can help achieve consistency, and can provide a clean slate for developers to apply their styles without interference.

<span id="resets-optional"></span>While CSS resets are still commonly used, they are not mandatory. Some developers opt not to use them, while others create their own or utilize prebuilt resets. It's important to understand that resets are subjective and opinionated, reflecting the preferences of the developer who created them. You can decide how you wish to do things yourself.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [Reboot, Resets, and Reasoning](https://css-tricks.com/reboot-resets-reasoning/) for an excellent history of resets and what it means for a reset to be opinionated.
1. Read [Making the case for CSS normalize and reset stylesheets in 2023](https://mattbrictson.com/blog/css-normalize-and-reset). It does an excellent job of discussing the differences in various resets and why you might choose to use them.
1. [Josh Comeau's custom CSS reset](https://www.joshwcomeau.com/css/custom-css-reset/) also includes a great breakdown of his thought process behind each rule he uses, giving you an idea of how to reason about these ideas.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why would you want to use a CSS reset?](#what-are-default-styles-and-where-do-they-come-from)
- [Are resets required?](#resets-optional)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Browser Default Styles](https://browserdefaultstyles.com/) allows you to view the user-agent applied rules for each element.
- [The Fabulous Styleboard](https://fabulousgk.github.io/fabulous-styleboard/) contains a few resets you can select and deselect to see how they affect various HTML elements.
