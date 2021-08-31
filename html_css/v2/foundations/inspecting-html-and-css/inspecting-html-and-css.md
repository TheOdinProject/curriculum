### Introduction

Being able to inspect and debug your HTML and CSS is critical to frontend development. This lesson will take us through the Chrome Dev Tools which allow you to see detailed information about your elements and CSS rules, as well as assist you in finding and fixing problems in your code. If you're using Firefox or some other browser, you can follow along as the majority of the tools look and function similarly, but you may need to Google a bit or check out the documentation for your browser of choice if you get stuck.

### Learning Outcomes

- You will know how to access the element inspector
- You will know how to select and inspect specific elements
- You will know how to test out HTML and CSS in the inspector

### The Inspector

To open up the inspector, you can right click on any given element in a webpage and click "Inspect Element", or F12. For example, if you navigate to [our homepage](https://theodinproject.com/) and open the inspector, you might see something that looks a little bit like the below.

INSERT IMAGE 00

Don't get overwhelmed with all of the tools you're now seeing! For this lesson, we want to focus on the Elements and Styles panes.

### Inspecting Elements

In the Elements pane, you can see the entire HTML structure of your page. You can click on any of the elements in this pane to select that specific element. Alternatively, you may click the blue-highlighted icon below and hover over any element on the page.

INSERT IMAGE 01

When an element is selected, the Styles tab will show all of the currently applied styles, as well as any styles that are being overwritten. For example, if you use the inspector to click on the "Web Development Starts Here" header on the TOP homepage, on the right hand side you'll see all of the styles that are currently affecting the element, as seen below:

INSERT IMAGE 02

### Testing Styles In The Inspector

The Styles pane also allows you to edit styles directly in the browser. You can click inside of any individual selector to add a new rule, or click on an existing attribute or value to alter it.

In the below image, we have altered the value of `margin-bottom` in the `.hero__main-heading` class, and the webpage responds with the changes in real time. This won't affect your source code in your text editor, but it is extremely useful to quickly test out various attributes and values without needing to reload the page over and over again.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Skim through the [official Chrome DevTools docs](https://developers.google.com/web/tools/chrome-devtools):

- "Overview"
- "Open Chrome DevTools"
- "CSS"
- "Get Started With Viewing And Changing The DOM", but skim through any part that uses the JavaScript console.

For Firefox users:

- [Firefox Dev Tools](https://developer.mozilla.org/en-US/docs/Tools)
- [Style Editor](https://developer.mozilla.org/en-US/docs/Tools/Style_Editor)
- [Page Inspector](https://developer.mozilla.org/en-US/docs/Tools/Page_Inspector)
</div>

### Additional Resources

_This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something_

### Knowledge Check

- How do you select a specific element on your page with your browser’s developer tools?
- What does a strikethrough in a CSS element mean in your browser’s developer tools?
- How do you change CSS in real time on specific elements of a web page with your browser’s developer tools?
