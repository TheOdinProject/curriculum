### Introduction

By now you should feel confident enough to start making your websites a little more accessible. To take things a step further, though, you'll need to learn how to view the accessibility tree in your dev tools and how to audit your web pages for any outstanding a11y issues.

This lesson assumes you are using the most up to date version of your preferred browser. If you are unable to find any features mentioned in this lesson within your browser, you may need to update it or enable an accessibility setting or an experimental feature within the dev tools.

Since Microsoft Edge is now Chromium-based (as of versions released in January 2020 and after), many if not all accessibility features for the Chrome dev tools mentioned in this lesson should also work in Edge.

### Learning Outcomes
By the end of this lesson, you should be able to:

* Inspect the accessibility tree.
* View ARIA and other computed properties for an object in the accessibility tree.
* Use the dev tools to check the contrast ratio of an element.
* Simulate what a web page would look like to users that are color blind.
* Audit a web page with a third party auditing tool.

### Firefox's Accessibility Tree

There are two ways to view the accessibility tree in Firefox: you can either right click on a page and select the "Inspect Accessibility Properties" option, or you can open the dev tools however you normally would and click the **Accessibility** tab. If you don't see this tab anywhere, then you will most likely need to enable it within the dev tools settings.

![Firefox's accessibility tree](https://user-images.githubusercontent.com/70952936/125674331-b8312e86-0453-42db-9f26-10ae18823918.jpg)

As you can see from the image above, the accessibility tree in Firefox looks sort of like a more bare-bones version of the DOM. The only information listed is the role and the name property of each element on the page. You can expand each object to see its children's role and name properties, and you can continue doing so until you reach the end of that "branch". If you right click anywhere within the accessibility tree, you can even select a "Print to JSON" option, which will open the contents of the tree as JSON in a new browser tab.

The accessibility tree itself isn't too complicated, so there's not actually a lot to go over. Did you notice anything different about the element picker tool, though?

![Firefox's picker tools comparison](https://user-images.githubusercontent.com/70952936/125674362-70bc34c9-73f2-46d2-bce5-877c8060327b.png)

When you're in the **Inspector** tab, you can use the "element picker" tool to hover over an element on the page to see a visual representation of its box model, or you can click on an element and it will select that element in the **Inspector** tab. When you're in the **Accessibility** tab, though, this tool becomes an "accessible object picker" tool. Once you activate this tool you can hover over elements on the page to view some a11y information or you can click on an element to select it in the accessibility tree.

### Chrome's Accessibility Tree

There's only one way to view the accessibility tree within Chrome: open the dev tools however you normally would, then within the **Elements** tab select the **Accessibility** pane on the right side of the window (it should be in the same area as the **Styles** pane, though you may have to open the overflow menu). If you don't see this pane anywhere, you may need to enable an experimental feature within the dev tools.

![Chrome's accessibility tree](https://user-images.githubusercontent.com/70952936/125674441-44095206-0508-45d0-ab2d-31ed4a2d00cb.jpg)

The first thing you'll notice about the accessibility tree in Chrome is that it's laid out a little differently compared to Firefox. It still lists the role and name property of each object, but it isn't separated into two separate columns. Another difference is how you're able to view the tree itself. In Firefox, regardless of which object you select, you'll still be able to see the entire tree at once. In Chrome, you only see one branch at a time. If you clicked on the `contentinfo` object from the image above, for example, the two `generic` branches would no longer be visible.

It is worth noting that you may be able to go into the Chrome dev tools settings and then into the **Experiments** section to check off the "Enable full accessibility tree view in the Elements panel" option. This will allow you to view an accessibility tree that is similar in style to Firefox's.

### Firefox's Accessibility Properties

Depending how you have your dev tools opened (as a separate window or docked), the **Properties** section will either be to the side or below the accessibility tree. There are several properties for each object in the accessibility tree, though we're only going to cover a few here. You should understand the name, role, description, and states properties from the previous lesson, but we'll go over them again as a refresher.

* **Name:** This is the next best way to check what may be announced by assistive technologies if you're unable to use a screen reader yourself, or just want to quickly check the property. Keep in mind that what a screen reader announces may still vary based on a number of factors, but this can still be a good place to start.

* **Role:** Depending on the role, assistive technologies may announce this property as well. Some roles listed in the dev tools may not be exactly the same as what gets announced, e.g. "pushbutton" is listed in the dev tools vs "button" actually getting announced for the `<button>` element.

* **Description:** Depending on the browser and brand of assistive technology, this property may also get announced. Similar to the name property, this is the next best way to check what may be announced if you aren't able to use a screen reader or just want to quickly check.

* **States:** A list of each accessible state an object currently has, both by default and any added via HTML or ARIA attributes. A link object, for example, may have states such as "focusable", "linked", and "enabled".

* **Relations:** A list of the accessible relationships between the selected object and other objects. If an object is getting its name property from another element, such as a `<label>` element or via the `aria-labelledby` attribute, you would see the relationship listed here. It's worth noting that only elements that are visible on the page may appear within this property, though visually hidden elements would still provide a label.

~~~html
<!-- The input element will still have a name property value of "Name" -->
<div id='label' style='display: none;'>Name:</div>
<input type='text' aria-labelledby='label'>
~~~

### Chrome's Accessibility Properties

Below the accessibility tree, Chrome has two important sections for accessibility properties. The **ARIA Attributes** section is, of course, where any ARIA attributes on an element are listed. This will include both the `role` attribute and any `aria-` attributes. Similar to how you are able to edit properties in the Styles pane, you can also edit the value of ARIA attributes listed here.

The **Computed Properties** section will vary depending on the element, though every element will usually have both the name and role property. The role property is self explanatory, though the roles for certain elements in Chrome may be different compared to Firefox ("generic" in Chrome vs "section" in Firefox, for example). 

The "name" property will show the final computed value next to it, and immediately beneath it there will be a list of the different sources of where that value could have come from (similar to Firefox's "Relations" property). `aria-labelledby`, `aria-label`, and `title` will usually always be listed, and the sources will be listed in order of precedence (with `aria-labelledby` having the highest precedence).

Any other property, however, will only appear when it is actually applied to an element. Most interactive elements will have a "Focusable" property, for example, and an element with the `aria-describedby` attribute will have both a "Description" and "Described by" property.

### Checking Contrast Ratios

In a previous lesson you were provided with a link to the WebAIM contrast checker tool as well as one way you could check the contrast ratio in your browser's dev tools, both of which you've hopefully tested out a little. Between both Chrome and Firefox, there are a couple more options available to us for checking the contrast ratios in the dev tools.

In **Firefox**, right above the **Properties** section of the **Accessibility** tab is the **Checks** section. This section will list any contrast ratios in addition to other checks, such as whether an interactive element has a focus style. In order to view the color contrast for text, you may have to travel down a branch of the accessibility tree until you select a "text leaf" object.

You can also go to the **Inspector** tab and within the **Styles** section, open the color picker tool for the "color" property on an element. You can also use the color picker tool for a "color" property within **Chrome**, except under the **Elements** tab and within the **Styles** pane.

### Additional A11y Features in Dev Tools

Along the top of the Accessibility tab in **Firefox**, there are three additional tools that you can use when checking or auditing accessibility:

* The "Check for issues" tool lets you display elements that have issues related to the contrast ratio, keyboard navigation, or text labels. This isn't too in depth of an audit, which is why we're mentioning it here, but it can still be handy as a sort of quick audit.
* The "Simulate" tool lets you simulate different types of color blindness as well as contrast loss. This can be a useful tool to check whether certain colors may look too similar to someone that is color blind. Remember when you were asked to find the red button in an image that was simulating total color blindness in a previous lesson?
* The "Show Tabbing Order" tool will display an overlay on the page, showing the order each tabbable element will receive focus when navigating the page with the Tab key.

At the bottom of the dev tools in **Chrome**, next to the "Console" tool (not the **Console** tab at the very top of the dev tools), you can open a menu of additional tools. If you don't see this section within your dev tools, try going into the **Console** tab and clicking the "Issues" button along the top (it will either be labeled "No Issues" or it will include a number, e.g. "2 Issues").

If you select the "Rendering" tool and scroll down, you'll be able to enable different "Emulate vision deficiencies" options. This allows you to simulate different types of color blindness or blurred vision on a page, similar to Firefox. There are some other options in the "Rendering" tool to check out as well. For example, the "Emulate CSS media feature prefers-reduced-motion" tool will simulate what your page would look like to a user who has enabled a setting on their browser or OS to prevent animations.

Another tool worth checking out is the "Issues" tool, which will list any potential issues on the page such as color contrasts.

### Accessibility Auditing

There are different ways to audit the accessibility of a web page, though we'll only cover a few in this lesson. By getting into the habit of auditing your web pages, you'll be able to track down any outstanding a11y issues that you may have missed or just didn't know existed.

* [axe DevTools for Chrome](https://chrome.google.com/webstore/detail/axe-devtools-web-accessib/lhdoppojpmngadmnindnejefpokejbdd?hl=en-US) and [axe for Firefox](https://addons.mozilla.org/en-US/firefox/addon/axe-devtools/) are extension-based tools. 

  Axe DevTools returns a list of any issues that are ranked by severity level, and it will also note any issues for you to manually check. For each issue, you'll be able to highlight the element on the page or inspect it within the DOM tree, and there will usually be a suggested way to resolve the issue.

* [Lighthouse for Chrome](https://developers.google.com/web/tools/lighthouse) is available in the Chrome dev tools by default (it might also be listed as the Auditing tab) or it can be ran from the command line. The [Lighthouse Firefox Addon](https://addons.mozilla.org/en-US/firefox/addon/google-lighthouse/) is also available.

  Lighthouse provides more than just a11y auditing, including performance, best practices, search engine optimization (SEO), and progressive web app (PWA) if applicable. Any issues will be separated by category, and like the axe DevTools there may be a list of issues for you to manually check.

* [WebAIM's WAVE](https://wave.webaim.org/) is a website based tool where you enter the URL of the page you want to audit, though there are also browser extension and API options. 

  WAVE will return a preview of the page with an overlay if icons on it, and issues are separated into categories of alerts, warnings, and contrast errors. Unfortunately the icons that are placed on the page may cause the layout to break, but that could be a minor issue if you're more focused on the a11y issues that are found.

Of course, one of the best ways to check the accessibility of your websites is to get feedback from users who rely on these accessibility features. Obviously this isn't always an option, but when you can it will be worth hearing from those who may be affected by your site's accessibility.

### Additional Resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental for if you need to dive deeper into something.

* The MDN [Accessibility Inspector](https://developer.mozilla.org/en-US/docs/Tools/Accessibility_inspector) page goes into more detail about using the **Accessibility** tab, including other properties each object in the accessibility tree has.
* Chrome's [Accessibility features reference](https://developer.chrome.com/docs/devtools/accessibility/reference/) goes over the accessibility features in their dev tools, including a little more information regarding checking contrast ratios with the color picker from the **Styles** pane.
* [Involving Users in Evaluating Web Accessibility](https://www.w3.org/WAI/test-evaluate/involving-users/) goes over some helpful steps to take when you can get feedback from users.
* [A11ycasts Playlist](https://www.youtube.com/playlist?list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g). We've included several videos from this playlist in these lessons, but there are other videos worth checking out for various accessibility reasons.
* [screenreader-outputs](https://github.com/thatblindgeye/screenreader-outputs) is a GitHub repo that contains many examples of screen reader outputs. Sometimes nested elements or certain combinations of attributes and native labeling may result in accessible names or descriptions that are difficult to make sense of, so checking out this repo may help clear things up.
