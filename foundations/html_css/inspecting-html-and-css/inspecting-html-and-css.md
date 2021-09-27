### Introduction

Being able to inspect and debug your HTML and CSS is critical to frontend development. This lesson will take us through the Chrome Dev Tools which allow you to see detailed information about your elements and CSS rules, as well as assist you in finding and fixing problems in your code. If you're using Firefox or some other browser, you can follow along as the majority of the tools look and function similarly, but you may need to Google a bit or check out the documentation for your browser of choice if you get stuck.

### Learning Outcomes

- You will know how to access the element inspector
- You will know how to select and inspect specific elements
- You will know how to test out HTML and CSS in the inspector

### The Inspector

To open up the inspector, you can right click on any given element in a webpage and click "Inspect Element", or F12. For example, if you navigate to [our homepage](https://theodinproject.com/) and open the inspector, you might see something that looks a little bit like the below.

![Chrome Inspector](https://cdn.statically.io/gh/TheOdinProject/curriculum/594984d7c9f9e744577f19ea475b3864e8cc7c91/html_css/v2/foundations/inspecting-html-and-css/imgs/00.png)

Don't get overwhelmed with all of the tools you're now seeing! For this lesson, we want to focus on the Elements and Styles panes.

### Inspecting Elements

In the Elements pane, you can see the entire HTML structure of your page. You can click on any of the elements in this pane to select that specific element. Alternatively, you may click the blue-highlighted icon below and hover over any element on the page.

![Inspector Icon](https://cdn.statically.io/gh/TheOdinProject/curriculum/594984d7c9f9e744577f19ea475b3864e8cc7c91/html_css/v2/foundations/inspecting-html-and-css/imgs/01.png)

When an element is selected, the Styles tab will show all of the currently applied styles, as well as any styles that are being overwritten. For example, if you use the inspector to click on the "Web Development Starts Here" header on the TOP homepage, on the right hand side you'll see all of the styles that are currently affecting the element, as seen below:

![Styles Pane](https://cdn.statically.io/gh/TheOdinProject/curriculum/594984d7c9f9e744577f19ea475b3864e8cc7c91/html_css/v2/foundations/inspecting-html-and-css/imgs/02.png)

### Testing Styles In The Inspector

The Styles pane also allows you to edit styles directly in the browser. You can click inside of any individual selector to add a new rule, or click on an existing attribute or value to alter it.

In the below image, we have altered the value of `margin-bottom` in the `.hero__main-heading` class, and the webpage responds with the changes in real time. This won't affect your source code in your text editor, but it is extremely useful to quickly test out various attributes and values without needing to reload the page over and over again.

![Changed styles](https://cdn.statically.io/gh/TheOdinProject/curriculum/594984d7c9f9e744577f19ea475b3864e8cc7c91/html_css/v2/foundations/inspecting-html-and-css/imgs/03.png)

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Go through the following sections of the [official Chrome DevTools docs](https://developers.google.com/web/tools/chrome-devtools):

- [Overview](https://developer.chrome.com/docs/devtools/overview/): don't navigate to any other pages linked here, just get familiar with _what_ tools are available in the DevTools rather than how to use all of them right now.
- [Open Chrome DevTools](https://developer.chrome.com/docs/devtools/open/): similar to what we went over above, but with some nice extras.
- [CSS](https://developer.chrome.com/docs/devtools/#css): be sure to follow along with any interactive instructions!
- [Get Started With Viewing And Changing The DOM](https://developer.chrome.com/docs/devtools/dom/): skip through any part that uses the JavaScript console.

For Firefox users:

- [Firefox Dev Tools](https://developer.mozilla.org/en-US/docs/Tools)
- [Style Editor](https://developer.mozilla.org/en-US/docs/Tools/Style_Editor)
- [Page Inspector](https://developer.mozilla.org/en-US/docs/Tools/Page_Inspector)
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something

### Knowledge Check

- How do you select a specific element on your page with your browser’s developer tools?
- What does a strikethrough in a CSS element mean in your browser’s developer tools?
- How do you change CSS in real time on specific elements of a web page with your browser’s developer tools?
