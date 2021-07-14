### Introduction

In the previous lesson you learned several ways to make websites more accessible. That lesson, however, was just the tip of the accessible iceberg. WAI-ARIA introduces attributes that can help make websites even more accessible by modifying the semantics and context of elements, which can give you greater control over how those elements are perceived by assistive technologies.

Not all ARIA attributes are supported by every version of every browser or assistive technology. Before using an attribute, you should look into how well supported it is or test it out with a screen reader yourself.

### Learning Outcomes
By the end of this lesson, you should be able to:

* Know the purpose of WAI-ARIA.
* Know what ARIA can't do.
* Understand what the accessibility tree is.
* Name the three ARIA attributes that can add labels and descriptions to elements.
* Understand what the `role` attribute does.
* Understand what live regions are.
* Understand what the `aria-atomic` attribute does.
* Name the five rules of ARIA use.

### What is WAI-ARIA?

WAI-ARIA stands for - *deep breath* - the Web Accessibility Initiative's Accessible Rich Internet Applications specification. The purpose of WAI-ARIA (often referred to as just ARIA) is to define a way to make web content more accessible when native HTML is unable to do so. Think of ARIA as something that fills in the accessible gaps left by native HTML.

It's important to note that ARIA can only modify the semantics or context of an element. ARIA *can't*:

* modify an element's appearance,
* modify an element's behavior,
* add focusability, or
* add keyboard event handling.

When you use ARIA, you must take additional steps to add in any missing semantics or functionality. We'll go over this in more detail later in the lesson.

### The Accessibility Tree

Before we get into some of the ARIA attributes available to us, it's important to know some basics of what the accessibility tree is, as it will help you understand just what those attributes are actually doing.

The accessibility tree is based on the DOM, something you should be very familiar with by now. While the DOM represents nodes and objects that make up a web page, the accessibility tree contains only the accessibility related information that will be used by assistive technologies. The way ARIA works is by modifying properties of the objects that make up this accessibility tree. Each of these objects has at least the following four properties:

* **Name**: Also known as the "accessible name", this is what assistive technologies announce to a user and what separates elements of the same type from one another. The name may be set by one or more native labels, including the text contents of an element, the `<label>` element, or the `alt` attribute, to name a few.
* **Description**: This is what assistive technologies announce in addition to its accessible name.
* **Role**: This is what an element's purpose is, or what kind of "thing" it is, e.g. a button, a checkbox, a list, etc.
* **State**: This is a list of any state the element may have, such as whether it's focusable, checked, expanded, etc.

### ARIA Labels

ARIA labels help users of assistive technologies better understand the content on a web page by overriding native labels or providing additional descriptive text. Unlike the `<label>` element, ARIA labels aren't limited to being used on only a select few elements, though they still have their own limitations.

#### `aria-label`

The `aria-label` attribute overrides any native label and modifies the name property in the accessibility tree, though it's best used when an element doesn't already have a native label. When you add `aria-label` to an element, you pass in a string as the value, which will become that elements accessible name. `aria-label` doesn't work on every HTML element, though. Adding the attribute to a plain `<div>` or a `<span>` will have no effect, unless you give those elements a role of some kind.

A common use for this attribute can be for the "close" button often seen in menus or modals:

~~~html
<button type='button' aria-label='Close modal'>X</button>
~~~

Instead of a screen reader announcing, "X, button", which wouldn't make any sense to the user, it would announce, "Close modal, button". The same thing can be done for the hamburger icon commonly used for mobile or hidden menus. Another way you could use `aria-label` is on landmark elements:

~~~html
<nav aria-label='main navigation'>...</nav>
~~~

The above HTML would be announced as, "Main navigation, navigation landmark". If you had multiple navigation elements on a page, you could give each a different `aria-label` value in order to separate them from one another, making them more understandable for screen reader users. Pretty neat, huh?

One thing you should avoid using `aria-label` for is trying to change how a word is phonetically announced. Certain words may not get announced correctly by a screen reader, and you may have a temptation to try and fix this. To put it simply: don't. You may end up fixing how a word is announced by a screen reader, but that "fix" could end up making no sense when announced by other assistive technologies like a braille reader.

#### `aria-labelledby`

The `aria-labelledby` attribute overrides both native labels as well as the `aria-label` attribute. When you use this attribute, you pass in a list of ID references as the value, somewhat similar to how the `<label>` element works with form inputs. This creates a relationship between elements, modifying the accessible name of the labeled element (the one with the `aria-labelledby` attribute) to a concatenated string of the text contents or `alt` attributes of the labeling elements (the ones whose ID are passed in). 

What's great about `aria-labelledby` is that you can pass in any number of ID references, and you can even have an element reference itself. One thing to keep in mind, though, is that you can't pass in the same reference multiple times, as any subsequent references after the first will be ignored.

~~~html
<h2 id='label'>Shirts</h2>
<button type='button' id='shop-btn' aria-labelledby='label shop-btn'>Shop Now</button>
~~~

The HTML above would be announced by a screen reader as, "Shirts, shop now, button". This can make multiple "shop now" buttons on a page unique from one another and thus provide additional context.

Another great thing about `aria-labelledby` is that even if a labeling element is visually hidden, either by the `hidden` HTML attribute or with CSS, it will still modify the accessible name of the labeled element. This can be useful if you want to label an element for users of assistive technologies, but you don't want that element's label to be visible to sighted users.

Although it may work somewhat similarly to the native `<label>` element, `aria-labelledby` does not have the same click event behavior. This is functionality you would have to add in yourself via JavaScript.

~~~html
<!-- Clicking the <label> element gives focus to the input element -->
<label for='name'>Name:</label>
<input id='name' type='text' />

<!-- Clicking the <div> element won't give focus to the input element -->
<div id='label'>Name:</div>
<input type='text' aria-labelledby='label' />
~~~

#### `aria-describedby`

The `aria-describedby` attribute modifies the description property in the accessibility tree. Similar to the `aria-labelledby` attribute, when you use this attribute you pass in a list of ID references as the value, and the elements whose ID are passed in can also be visually hidden.

~~~html
<label>Password:
  <input type='password' aria-describedby='password-requirements' />
</label>
<span id='password-requirements'>Password must be at least 10 characters long.</span>
~~~

When the `<input>` element receives focus, a screen reader would announce, "Password, edit protected, password must be at least ten characters long, blank." This immediately notifies a screen reader user of any requirements for the password they want to choose. If you're curious about the "blank" text at the end, it's simply the text content of the `<input>` being announced.

### ARIA Roles

As you learned in the previous lesson, every element has an implicit role. When you add the `role` attribute to an element, the role property in the accessibility tree gets modified. Adding a role is pretty easy:

~~~html
<div role='button'>Submit</div>
~~~

Now the `<div>` element has the role of a button, and a screen reader would announce, "Submit, button". However, remember what ARIA *can't* do. A screen reader may announce this element with the role of a button, but it doesn't have the functionality of a native `<button>`, it can't receive focus, and it has no keyboard event handlers. These issues are relatively easy to fix for such a simple example:

~~~html
<!-- HTML -->
<!-- Make the button focusable. -->
<div class='button' role='button' tabindex='0'>Submit</div>
~~~
~~~css
/* CSS */
/* Style the button when it has focus. */
.button:focus {
  outline: 1px solid black;
  outline-offset: 2px;
}
~~~
~~~javascript
// JavaScript
// Add event handling for keyboards.
const button = document.querySelector('.button');

function clickButton(e) {
  if (e.type === 'click' || e.key === ' ' || e.key === 'Enter') {
    alert('Submitted!')
  }
}

button.addEventListener('click', clickButton);
button.addEventListener('keydown', clickButton);
~~~

Now this custom button will actually *behave* like a button. Of course in this case it would have been better and easier to just use an actual `<button>` element, but now you have a better understanding of the extra steps that you may have to take when using ARIA.

#### A warning on roles

When adding a `role` attribute to an element, you should usually avoid redundancy. Though it most likely won't cause any unforeseen issues, there wouldn't be much point in adding `role='button'` onto an actual `<button>` element. 

There is a potential exception to this rule, however, and that's with list elements like `<ul>`. When a list element has its list markers removed with `list-style-type: none;` in CSS, some browsers (Safari) may remove the implicit role of the element, causing assistive technologies to not recognize it as a list. The role can be explicitly added back by doing `<ul role='list'>...</ul>`.

### ARIA States and Properties

There are many different ARIA attributes that modify the state property or otherwise add/modify some other property. Besides what they actually modify in the accessibility tree, the difference between ARIA states and properties is that properties are less likely to change over time, while states may change more often due to user interaction. The ARIA attributes you learned about from the ARIA Labels and ARIA Roles sections above are some examples of properties, while `aria-checked`, `aria-expanded`, and `aria-pressed` are a few examples of ARIA states. 

Whereas native HTML elements like the checkbox input have built in functionality to update its checked state when clicked on, elements you add ARIA states to don't automatically inherit this functionality. You would have to manually add this in via JavaScript, along with any other functionality similar to the custom button example from earlier.

~~~html
<!-- Clicking the custom checkbox won't cause the aria-checked attribute to update to "true" without any JavaScript. -->
<div role='checkbox' aria-checked='false' tabindex='0'></div>
~~~

#### Hiding Elements from the Accessibility Tree

Though there are too many ARIA attributes to go over in this lesson, there is one in particular that could be very useful to learn. Similar to how you can visually hide elements with the `hidden` HTMl attribute or the display and visibility CSS properties, you can use the `aria-hidden` attribute to hide certain elements, such as decorative images and icons, from the accessibility tree. The difference with `aria-hidden`, however, is that the element will remain visible for sighted users. This can be especially useful when you want to add an icon somewhere on your page. For example:

~~~html
<!-- Example 1 -->
<button type='button'>
  <span class='material-icons'>add</span>
  Add Book
</button>

<!-- Example 2 -->
<button type='button'>
  <span class='material-icons' aria-hidden='true'>add</span>
  Add Book
</button>
~~~

While both of the above examples would look visually identical, the button in Example 1 would be announced by a screen reader as, "Add add book, button". The text content of the `<span>` and the text content of the button itself are concatenated as the accessible name of the button. The button in Example 2, however, hides the `<span>` from the accessibility tree so its text contents isn't added to the button's accessible name, meaning a screen reader would correctly announce "Add book, button".

Be careful when using this attribute. When you give an element `aria-hidden='true'`, all children of that element will also become hidden to the accessibility tree. Adding `aria-hidden='false'` to a child element won't have any effect if one of its parents still has `aria-hidden='true'`.

### ARIA Live Regions

While assistive technologies can announce the content that is currently on the page or the content when a page has loaded, they won't be able to announce any dynamic changes. This includes websites that dynamically build "pages" with JavaScript (think back to the Restaurant Page project if you've completed it), React apps that use routes, or even just elements on a page that are dynamically built or updated.

Live regions make it possible to have these dynamic changes announced. You can explicitly create a live region by adding the `aria-live` attribute to an element, or you can add the `role` attribute and use a role that has an implicit live region. When an element becomes a live region, the assistive technology will "watch" for any dynamic updates to that element and then announce them. Some examples for where you could use live regions are:

* Status messages
* Progress bars
* Error alerts
* Social media notifications
* Scrolling ticker updates
* Entire landmark elements (such as the `<main>` element)

A live region can have one of three values:

1. `aria-live='off'` is the default behavior. You usually won't need to select this option, unless you want to prevent announcements from elements that have an implicit live region from the `role` attribute. `role='timer'`, `role='progressbar'`, and `role='marquee'` implicitly have this value for a live region. 

2. `aria-live='polite'` is the option you will want to use most of the time. When a polite live region is updated, the user will only be notified of the update when the assistive technology is no longer busy announcing anything else. If multiple updates occur while the assistive technology is busy, each update will be announced one by one rather than just the most recent update. `role='log'` and `role='status'` implicitly has this value for a live region.

3. `aria-live='assertive'` will interrupt the assistive technology immediately. Due to how disruptive this can be, you should use this live region sparingly. `role='alert'` implicitly has this value for a live region. Explicitly making an element an assertive live region may not work properly for the NVDA or JAWS screen readers, and instead the live region will act as though it were `aria-live='polite'`. Implicitly making an element an assertive live region with the `role='alert'` attribute should work as intended, however.

#### `aria-atomic`

Normally when there is an update to an ARIA live region, only the parts of the region that were actually updated would be announced. For example, let's say we had the following HTML:

~~~html
<div aria-live='polite'>The current number is <span>1</span>.</div>
~~~

If we had some JavaScript function that updated the number inside of the `<span>` element, a screen reader would only announce the new number, e.g. "two", "three", "four", etc.

The `aria-atomic` attribute determines whether only part of the updated live region gets announced, or if the entire live region does. By default, `aria-atomic` has a value of "false", meaning only part of the updated live region is announced like in the example above. If we changed the value to "true":

~~~html
<div aria-live='polite' aria-atomic='true'>
  The current number is <span>1</span>.
</div>
~~~

Now a screen reader would announce the entire live region: "The current number is two", "the current number is three", etc. Using `aria-atomic='true'` can be tricky if you have multiple dynamic changes happening in a single region at once, though.

~~~html
<div aria-live='polite' aria-atomic='true'>
  <p>The current number is <span id='current-number'>1</span>.</p>
  <p>The old number was <span id='old-number'>0</span>.</p>
</div>
~~~

If we had JavaScript updating both the current and old numbers at the same time, a screen reader might announce everything inside of the live region twice. Remember, `aria-atomic='true'` means the entire live region gets announced when there is a dynamic change, and in this case there are two dynamic changes.

Whether a user needs to be made aware of the entire live region or only part of it will depend on the situation. Ultimately, you'll need to consider whether a user will have enough context if only part of the live region is announced. A good way to try and determine this would be using a screen reader yourself on your projects.

### The Five Rules of ARIA

You've seen just how powerful ARIA can be when used correctly, but it can be equally as dangerous when used incorrectly. Because of this, you should keep in mind that **no ARIA is better than bad ARIA**, even when you have the best intentions. There are five rules that can help prevent you from using bad ARIA.

1. **Always use native HTML elements and attributes over ARIA when possible**. If you need to create a button, use the `<button>` element instead of changing the semantics of another element. The exceptions to this rule include:
    * The feature you want to implement does not have accessibility support implemented.
    * The native HTMl element cannot be styled as required.
    * The feature you want to implement is not currently available in HTML.

2. **Never change native semantics**, unless you have no other choice. For example, instead of doing `<h2 role='tab'>`, you would want to wrap your `<h2>` element inside of `<div role='tab'>`.

3. **All interactive ARIA controls must be usable with a keyboard**. If you absolutely need to change the role of a `<div>` in order to create a custom widget, you need to ensure the element can receive focus and has keyboard event handling.

4. **Never use `role='presentation'` or `aria-hidden='true'` on focusable elements**. Doing so can result in a user focusing on "nothing"; that is, their assistive technology won't announce anything when the element receives focus, which may cause confusion to the user. The exception to this rule is if the element cannot be seen or interacted with, and it's prevented from receiving focus at the time.

5. **All interactive elements must have an accessible name**. If a `<button>` has no accessible name, assistive technologies would only announce its role ("Button"), which wouldn't provide any useful context to the user.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* What purpose does WAI-ARIA serve?
* What are the four things ARIA can't do?
* What is the accessibility tree?
* What are the three types of ARIA labels?
* What are the differences between the ARIA labels?
* What does the `role` attribute do?
* What is the difference between a polite and an assertive ARIA live region?
* What does the `aria-atomic` attribute do?
* What are the five rules of ARIA?

### Additional Resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental for if you need to dive deeper into something.

* [ARIA, Accessibility APIs and coding like you give a damn](https://www.youtube.com/watch?v=qdB8SRhqvFc&list=PLOKfJQCx03akpT6vQQCd6o3_iWWVDIjLK&index=2&t=868s) is a 30 minute video that covers some concepts introduced in the previous lesson, the importance of ARIA attributes, and an example of how to add functionality to a custom ARIA button.
- [Accessibility Fundamentals with Rob Dodson](https://www.youtube.com/watch?v=z8xUCzToff8&list=PLOKfJQCx03akpT6vQQCd6o3_iWWVDIjLK&index=6) is another 30 minute video that covers some things mentioned in the previous lesson, but it also covers the accessibility tree, ARIA, and if you still need to be convinced, why using semantic HTML is important.
* [ARIA Authoring Practices](https://www.w3.org/TR/wai-aria-practices-1.1/) is a great ARIA cheat sheet. The page has several examples of design patterns and widgets created using ARIA, a section regarding accessible names and descriptions (including how they're calculated), and more.
* [Accessible Rich Internet Applications 1.1](https://www.w3.org/TR/wai-aria-1.1/) goes into greater detail regarding ARIA roles, states, and properties.
* [WAI-ARIA: aria-busy](https://www.digitala11y.com/aria-busy-state/) and [WAI-ARIA: aria-relevant](https://www.digitala11y.com/aria-relevant-properties/) are two other ARIA attributes that affect live regions. You may not need to use either, but they can still be useful to know about.
