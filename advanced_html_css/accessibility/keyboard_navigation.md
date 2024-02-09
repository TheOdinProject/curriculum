### Introduction

Some users aren't able to use a mouse to navigate or operate their computer, and by extension the websites they visit. These users may instead rely on using a keyboard or another assistive technology that can simulate keyboard inputs, such as voice recognition software. Other users may even just prefer using a keyboard over a mouse, or may use a mix of both. These users require proper keyboard navigation, something that can easily be overlooked when developing a website.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Know the two things that interactive elements must have for keyboard users.
- Understand what focus styles are and why you shouldn't completely remove them.
- Understand what the tab order is.
- Know how to properly hide hidden content from assistive technologies.

### Focus

Remember our Rock, Paper, Scissors example that *didn't* use semantic HTML from the... well, Semantic HTML lesson? Another issue with using `<div>` and `<span>` elements is that, by default, they aren't focusable and they don't have any event handling by default. In order to fix our non-semantic Rock, Paper, Scissors example for keyboard users, we would need to take some extra steps, similar to the below code snippets:

```html
<!-- The `tabindex` attribute makes the `<div>` elements focusable. -->
<div class='button-container'>
  <div class='rock button' tabindex='0'>Rock</div>
  <div class='paper button' tabindex='0'>Paper</div>
  <div class='scissors button' tabindex='0'>Scissors</div>
</div>
```

```javascript
// We also need to manually add in event handling for both mouse and keyboard events.
const buttons = document.querySelectorAll('.button');

function nameAlerter(e) {
  if (e.type === 'click' || e.key === ' ' || e.key === 'Enter') {
    alert(e.target.textContent);
  }
}

buttons.forEach(button => {
  button.addEventListener('click', nameAlerter)
  button.addEventListener('keydown', nameAlerter)
})
```

Of course, this example then makes it *less* understandable for screen reader users (remember, these "buttons" won't provide any context). Not only does using the `<button>` element provide the context screen reader users need, but they're focusable and have event handling for keyboards *by default*: pressing the <kbd>Space</kbd> or <kbd>Enter</kbd> keys on a keyboard when a `<button>` has focus will trigger the "click" event.

<span id="interative-elements-keyboard">The point is that you need to make sure that any interactive elements are focusable by and have event handling for keyboards. Using the correct semantic HTML can make this a lot easier of a goal to accomplish, but if you ever need to use an element that isn't focusable or doesn't have any event handling by default, then you need to add both of those functionalities in manually.</span>

### Focus styles

Another aspect of focusable elements is their focus styles, which are usually an outline or border surrounding the element when it receives focus. One of the things you may have done, or may still do, is completely remove these focus styles by using CSS rules similar to the example below:

```css
/* These are so ugh-ly! Let's get rid of them. */
*:focus {
  outline: none;
  border: none;
}
```

You probably assume that you're about to be told not to do this. Well... **You should never completely remove focus styles**. You should either leave these default focus styles alone, or you should replace them with your own focus styles. Whether it's adding a `transform: scale()` CSS property to a button, adding an outline to a link, or increasing the border width and opacity on an input, adding your own focus styles is the only alternative you should consider to the default focus styles.

<span id="focus-never-remove">Why? Completely removing focus styles can make a page impossible for keyboard users to navigate and operate, as they have no visual indication what element actually has focus. It would force them to have to manually keep track of how many times they've pressed the Tab key while also trying to guess what elements are *actually* focusable. Imagine trying to browse a website with an invisible cursor and without any visual indication of when the cursor was hovering over interactive elements like links or buttons. Doesn't sound too fun, does it?</span>

### Tab order

The tab order is the order in which elements on the page will receive focus when pressing the <kbd>Tab</kbd> key, and is by default in the same order as the order of elements listed in the HTML file:

```html
<!-- This element is first in the tab order. -->
<div tabindex='0'>This is the first element listed in the HTML.</div>

<!-- This element is second in the tab order. -->
<div tabindex='0'>This is the second element listed in the HTML.</div>
```

Sometimes you may find it necessary to either change the visual order of elements on a page using CSS (the `float` or `order` properties, for example), or the tab order of elements themselves using the `tabindex` attribute. Regardless of which method you may use, you should make sure the tab order matches the visual order of elements. If the tab order is different from the visual order, users could be left confused or frustrated trying to navigate the page with a keyboard, expecting one element to receive focus based on the visual layout and instead another element receives focus.

The best way to avoid this issue is to just place elements in your HTML file in the order that you want them to actually receive focus.

### Hidden content

Sometimes you may want to hide some content until a specific event occurs, such as a user clicking on a button to open a menu or a modal box. When you want to hide content for this sort of purpose, you need to make sure the content is not only visually hidden, but also hidden from assistive technologies until that content is meant to be visible.

If you don't properly hide such content, then keyboard users would be able to tab into that content before they're meant to, but in doing so they would lose track of any visual focus on the page. These users would be left confused or even frustrated when they're trying to tab through a page, only for their focus indicator to disappear into that hidden content.

One way to prevent this frustrating behavior is to give each individual item in that hidden content a `tabindex` value of -1, since that prevents an element from receiving focus via the keyboard (though you can still give it focus with JavaScript's `focus()` method). While this fixes the issue for keyboard users, other assistive technologies would still have access to and could still announce this hidden content.

<span id="best-way-hide-content">A better solution is giving the container for the hidden content itself either the `display: none` or `visibility: hidden` CSS property when it's hidden, and removing or overriding that property when it's meant to be visible. This not only removes the menu items from the tab order, but it also prevents assistive technologies from announcing them.</span>

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Watch [What is Focus?](https://www.youtube.com/watch?v=EFv9ubbZLKw&list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g&index=3) to see some issues that occur when trying to change the tab order, then watch [Controlling focus with tabindex](https://www.youtube.com/watch?v=Pe0Ce1WtnUM&list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g&index=4) to see how using the `tabindex` attribute can affect the tab order.
</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are two things that interactive elements must have for keyboard users?](#interative-elements-keyboard)
- [What are focus styles?](#focus-styles)
- [Why should you never completely remove focus styles from an element?](#focus-never-remove)
- [What is the tab order?](#tab-order)
- [What is the best way to hide hidden content from assistive technologies?](#best-way-hide-content)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- [Skip Links](https://webaim.org/techniques/skipnav/) are another form of accessibility for keyboard users and can be especially helpful for those who require more effort to tab through the contents of a page.
