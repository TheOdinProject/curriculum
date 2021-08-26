# Inspecting HTML and CSS

### Introduction

Being able to inspect and debug your HTML and CSS is critical to frontend development. This lesson will take us through the DevTools which allow you to see detailed information about your elements and CSS rules, as well as assist you in finding and fixing problems in your code.

### Learning Outcomes

_Look through these now and then use them to test yourself after doing the assignment_

what the student is expected to know or be able to do by the end of this lesson

- How to access the element inspector
- How to select and inspect specific elements
- How to test out HTML and CSS in the inspector

### The Inspector

To open up the inspector, you can right click on any given element in a webpack and click "Inspect Element", or F12. For example, if you navigate to [this website's homepage](https://theodinproject.com/) and open the inspector, you might see something that looks a little bit like the below.

INSERT IMAGE

Don't get overwhelmed! For this lesson, we want to focus on the Elements and Styles panes.

### Inspecting Elements

In the Elements pane, you can see the entire HTML structure of your page. You can click on any of the elements in this pane to select that specfic element. Alternatively, you may click the icon below and hover over any element on the page.

INSERT IMAGE

When an element is selected, the Styles tab will show all of the currently applied styles, as well as any styles that are being overwritten. Every selector and its rules affecting the element are displayed. This is a key tool that will assist in debugging your CSS, especially when you are attempting to set styles that are not being applied, and easily allows you to see if another selector may be affecting your rule.

### Testing Styles In The Inspector

The Styles pane also allows you to edit styles directly in the browser. This won't affect your source code in your text editor, but it is extremley useful to quickly test out various attributes and values without needing to reload the page over and over again. You can click inside of any individual selector to add a new rule, or click on an existing attribute or value to alter it.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Skim through the [official Chrome DevTools docs](https://developers.google.com/web/tools/chrome-devtools) [(or Firefox’s!)](https://developer.mozilla.org/en-US/docs/Tools). For Chrome users, read through "Overview", "Open Chrome DevTools", and "CSS" sections. You should also read the "Get Started With Viewing And Changing The DOM" section, but skim through any part that uses the JavaScript console. For Firefox users you should skim through the linked page, but specifically look at the "Style Editor" section under "More Tools", and the [Page Inspector](https://developer.mozilla.org/en-US/docs/Tools/Page_Inspector). 
2. 
</div>

### Additional Resources

_This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something_

Link to no more than three additional resources to avoid this section becoming too cluttered.

### Knowledge Check

_This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, clicking the small arrow to the left of the question will reveal the answers._

Should repeat learning outcomes with answers.

<details markdown="block">
  <summary>How do you select a specific element on your page with your browser’s developer tools?</summary>

- Learning outcome 1 answer
- Learning outcome 1 answer

</details>

<details markdown="block">
  <summary>What does a strikethrough in a CSS element mean in your browser’s developer tools?</summary>

- Learning outcome 2 answer

</details>

<details markdown="block">
  <summary>How do you change CSS in real time on specific elements of a web page with your browser’s developer tools?</summary>

- Learning outcome 2 answer

</details>
