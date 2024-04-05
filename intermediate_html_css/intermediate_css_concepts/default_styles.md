### Introduction

Browsers apply a set of default styles to every webpage. You may not have thought about this directly, but you have undoubtedly encountered it.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn about default browser styles.
- You'll learn how to use a CSS reset to remove or change those default styles.

### Default styles

As you have worked on projects, you likely observed default styles applied to certain elements, such as larger and bolder headings on `h1` elements and blue, underlined links on `a' elements. There is a good chance you struggled with default margins and padding. These styles are part of the user-agent stylesheets, ensuring basic styling for webpages without CSS. However, you may often need to override these styles as a developer. It's worth noting that user-agent stylesheets can vary slightly between browsers, though the differences are less significant today compared to older versions.

To address inconsistencies across browsers and establish a consistent starting point for styling, some developers started using CSS resets. These resets are stylesheets containing CSS rules aimed at altering or removing the defaults set by user-agent stylesheets. Using them can help achieve consistency, and can provide a clean slate for developers to apply their styles without interference.

<a id="resets-optional"></a>While CSS resets are still commonly used, they are not mandatory. Some developers opt not to use them, while others create their own or utilize prebuilt resets. It's important to understand that resets are subjective and opinionated, reflecting the preferences of the developer who created them. You may choose to adopt a reset, develop your own based on your specific styling needs and preferences, or decide not to use one at all.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [Reboot, Resets, and Reasoning](https://css-tricks.com/reboot-resets-reasoning/) for an excellent history of resets and what it means for a reset to be opinionated.
1. Read [Making the case for CSS normalize and reset stylesheets in 2023](https://mattbrictson.com/blog/css-normalize-and-reset). It does an excellent job of discussing the differences in various resets and why you might choose to use them.
1. Elad Schecter takes a fresh approach to using resets in [The New CSS Reset](https://elad.medium.com/the-new-css-reset-53f41f13282e), including the use of a reset and normalization. The reset illustrates how resets change as browsers implement new CSS tools.
1. The always amazing Josh Comeau does a great job of explaining his thought process behind each rule he uses in [his reset](https://www.joshwcomeau.com/css/custom-css-reset/), giving you an idea of how to reason about these ideas.
1. Look at [The Fabulous Styleboard](https://fabulousgk.github.io/fabulous-styleboard/), which contains a few resets you can select and deselect to see how they affect various HTML elements.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why would you want to use a CSS reset?](#default-styles)
- [Are resets required?](#resets-optional)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Browser Default Styles](https://browserdefaultstyles.com/): This allows you to view the user-agent applied rules for each element.
- [Firefox user-agent stylesheets](https://searchfox.org/mozilla-central/source/layout/style/res), [Chrome user-agent stylesheets](https://chromium.googlesource.com/chromium/blink/+/refs/heads/main/Source/core/css/?filter=css), and [Webkit user-agent stylesheets](https://trac.webkit.org/browser/webkit/trunk/Source/WebCore/css)
- A non-definitive listing of resets:
  1. [Meyer Reset](https://meyerweb.com/eric/tools/css/reset/) —The granddaddy of resets, the Meyer reset has been around a long time. It is a bit old and gray at this point, but it is very well known and used frequently.
  1. [modern-normalize](https://github.com/sindresorhus/modern-normalize) - Maintained by a powerhouse in the webdev community, this updates the venerable [Normalize.css](https://necolas.github.io/normalize.css/) which is no longer being maintained.
  1. [A (more) Modern CSS Reset](https://piccalil.li/blog/a-more-modern-css-reset/) - This is another reset with great explanations about why each rule exists.
