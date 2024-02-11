### Introduction

Now that you are equipped with the necessary knowledge to make your websites more accessible to many users, the question arises: How can we verify the correct implementation of a11y features? Are there any mistakes to be corrected, or potential improvements to be made?  In this lesson, we will answer those questions to help push your a11y skills over the top.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Open the accessibility section within your browser's DevTools.
- Audit a web page with a third-party auditing tool.

### Accessibility DevTools

Using your browser's DevTools is beyond useful for several things, from checking the styles applied to a page to debugging code, but you already know that! Here's something you may not know: you can even use the DevTools to look at various accessibility features as well, which can be great as a sort of "quick audit". You can check contrast ratios (as we mentioned in a previous lesson), view various accessibility properties, and view the accessibility tree, to name a few features.

### Accessibility auditing

There are plenty of third-party tools to audit the accessibility of a web page, each with its own pros and cons. Here, we're only going to mention three of those tools. By getting into the habit of auditing your web pages, you'll be able to track down any outstanding a11y issues that you may have missed. Whether you decide to utilize one of these tools or any other auditing tool you prefer, you should only focus on fixing issues related to the concepts introduced in this portion of the curriculum for now. 

* [axe DevTools for Chrome](https://chrome.google.com/webstore/detail/axe-devtools-web-accessib/lhdoppojpmngadmnindnejefpokejbdd?hl=en-US) is an extension-based tool that returns a list of issues ranked by severity level, and will note any issues for you to manually check.

* <span id="chrome-default-tool-knowledge-check">[Lighthouse for Chrome](https://developers.google.com/web/tools/lighthouse) is available in the Chrome DevTools by default (it might also be listed as the Auditing tab) or it can be run from the command line. Lighthouse provides more than just a11y auditing, including performance, best practices, search engine optimization (SEO), and progressive web app (PWA) if applicable. Issues are separated by category, and like the axe DevTools, there may be a list of issues for you to manually check.</span>

* [WebAIM's WAVE](https://wave.webaim.org/) is a website-based tool where you enter the URL of the page you want to audit. There are also browser extensions and API options. WAVE will return a preview of the page with an overlay of icons on it, and issues are separated into categories of alerts, warnings, and contrast errors. Unfortunately, the icons that are placed on the page may cause the layout to break, but that could be a minor issue if you're more focused on the a11y issues that are found.

Of course, one of the best ways to check the accessibility of your websites is to get feedback from users who rely on these accessibility features. This isn't always an easy option, but it's worth hearing from those who may be affected by your site's accessibility (or lack of it). 

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read the following resources:
    * [Accessibility features reference](https://developer.chrome.com/docs/devtools/accessibility/reference/#pane), starting from the Accessibility pane section, provides a brief overview of Chrome's accessibility features in the DevTools. 
    * [Emulate vision deficiencies](https://developer.chrome.com/blog/new-in-devtools-83/#vision-deficiencies) from the Chrome 83 update page. 
    * The [Open the Issues tab](https://developer.chrome.com/docs/devtools/issues/#open) section. You can ignore any mentions of anything that isn't accessibility-related on this page, as we just want you to know how to open this tab in your DevTools. Once you do, you'll be able to see a11y issues in addition to any other issues found.
    * Although there will be differences between different browsers, such as the value of the role property or how a11y properties are presented, check out [the "Features of the Accessibility panel" section in MDN's documentation](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/index.html#features-of-the-accessibility-panel). There is useful information that, while more tailored to Firefox, may still be useful for Chrome users.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* [What are some of the various accessibility features available in your browser's DevTools?](https://developer.chrome.com/docs/devtools/accessibility/reference/#pane)
* [Which third-party accessibility auditing tool is available in the Chrome DevTools by default?](#chrome-default-tool-knowledge-check)

### Additional resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

* [Involving Users in Evaluating Web Accessibility](https://www.w3.org/WAI/test-evaluate/involving-users/) goes over some helpful steps to take when you can get feedback from users.
* The [WCAG Quick Reference](https://www.w3.org/WAI/WCAG21/quickref/) provides a list of success criteria along with techniques for how to satisfy them and links to understanding them in more detail. This tool is a great go-to when you're really ready to push your website to the next accessible level. If you often use animations, success criterion 2.2.2 ("Play, Stop, Hide") and all of the 2.3 success criteria are definitely worth reading.
* [A11ycasts Playlist](https://www.youtube.com/playlist?list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g). We've included several videos from this playlist in these lessons, but there are other videos worth checking out for various accessibility topics.
* [screenreader-outputs](https://github.com/thatblindgeye/screenreader-outputs) is a GitHub repo that contains many examples of screen reader outputs. Sometimes nested elements or certain combinations of attributes and native labeling may result in accessible names or descriptions that are difficult to make sense of, so checking out this repo may help clear things up.
