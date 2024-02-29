### Introduction

Remember JavaScript? What did we learn that for? Well, sometimes you want a bit more interactivity in your browser,
like hiding/showing a part of your page. Making a round trip to your server is impractical. That is where JavaScript
comes in: Rails suggests using the JS framework Stimulus to augment your HTML. Stimulus gives you a way of creating and using reusable
controllers that give you an extra little bit of interactivity.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to attach Stimulus controllers to your HTML.
- How to use targets instead of query selectors.
- How to use action attributes instead of event listeners.
- Where to keep state.
- How to use lifecycle callbacks.
- How to make your controllers reusable.
- How to make your controllers customizable with attributes.

### The idea

Stimulus is a modest framework. It leaves things mostly up to you, but gives you a consistent way of doing things.
It uses HTML `data-attributes` to attach and configure behavior on your HTML. Let us look at an HTML example
from the handbook:

```html
<div data-controller="clipboard">
  PIN: <input data-clipboard-target="source" type="text" value="3737" readonly>
  <button data-action="click->clipboard#copy">Copy to Clipboard</button>
</div>
```

Read carefully through the example, and pay special attention to the data attributes! Can you guess what the example does?

This example is using three data attributes: `data-controller`, `data-clipboard-target`, `data-action`. So what is their
purpose?

- **data-controller** is set to `clipboard`, which says "Hey Stimulus, we want to enhance this HTML with some clipboard
behavior."
- **data-clipboard-target** is set to `source`, which says "This is the `source` we are gonna use for our clipboard
controller."
- **data-action** is set to `click->clipboard#copy`, which says "On a click invoke the `copy` action from our clipboard
controller."

So together these three attributes enable the following behavior: When a user `click`s on the button, use the function
`copy` of Stimulus controller `clipboard` with the input as a `source`. The yet-to-be-seen JavaScript controller will
then take care of the rest and will copy the value of the source target to the user's clipboard.

Wasn't this supposed to be a JavaScript lesson? Yes, but the point is that Stimulus is a HTML first framework.
It generally does not render HTML; instead it attaches behavior to your existing HTML with sprinkles of JavaScript.
Through the consistent use of some data attributes, we can read the HTML and can see where the HTML is enhanced.

Look at this HTML without the special data-attributes Stimulus uses:

```html
<input id="pin-code" value="1337" readonly>
<button id="pin-button">Copy to Clipboard</button>
```

Probably something is supposed to happen when you click that button. However you can't tell from the HTML
alone how things are wired up. You have to search for some JavaScript that handles this behavior.

So let's go through the basic aspects of Stimulus controllers. Don't worry if you don't understand
everything on the first read through; the assignments will give more in depth information.

### The Stimulus controller

A Stimulus controller gets attached to a DOM element by declaring it with the `data-controller` attribute.

```html
<input data-controller="input">
```

This will attach the Stimulus controller that is located in `app/javascript/controllers/input_controller.js`.
If you want to add a new
controller, create a file `some_name_controller.js` and it will be automatically loaded.

An empty controller looks something like this:

```javascript
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {}
```

This controller does not do anything; it only shows how it imports the class `Controller` that we use as a basis.
As you see, there is no mention of the name of the controller. The name is inferred from the file name
(`input_controller.js` becomes `input`).

This creates a scope. All the following attributes will only work within the scope of that controller / DOM element.

### Triggering an action

You learned how to trigger events with event listeners; in Stimulus, instead, you use `data-action` attributes to
execute JavaScript to react to a user click or input.

So instead of `document.querySelector("button").addEventListener("click", showAlert)` we write the following HTML:

```html
<div data-controller="alert">
  <button data-action="click->alert#show">Alert me!</button>
</div>
```

Now clicking the button will trigger the action of the associated Stimulus controller:

```js
// app/javascript/controllers/alert_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    show() {
        alert("Hey from Stimulus");    
    }
}
```

### Selecting / targeting elements

You learned how to access DOM elements with selectors, such as `document.querySelector` and `document.getElementById`.
Again Stimulus gives you a way to declare elements you want to select in the HTML:

```html
<div data-controller="greeter">
  <input type="text" data-greeter-target="name">
  <button data-action="click->greeter#greet">Greet me</button>
  <div data-greeter-target="output"></div>
</div>
```

Notice the `data-greeter-target`. Targets can then be used in your controller:

```js
// app/javascript/controllers/greeter_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    static targets = ["name", "output"]
    greet() {
        this.outputTarget.innerHTML = `Hello ${this.nameTarget.value}!`
    }
}
```

You need to declare your targets, once you have Stimulus provides the following properties to you controller:

- `this.nameTarget` - the first DOM element of matching target name.
- `this.nameTargets` - An array of all targets matching name.
- `this.hasNameTarget` - Boolean indicator of whether target of name is in scope.

### Keeping state

A Stimulus controller can have its internal state, meaning you can keep data in the controller. Though usually you want
to keep this to a minimum.

So anything you define on `this` is available throughout the controller:

```js
export default class extends Controller {
    connect() {
        this.count = 0
    }
  
    addOne() {
        this.count++
    }
}
```

Stimulus also lets you declare specific value attributes that allow you to listen to changes:

```js
// app/javascript/controllers/counter_controller.js
export default class extends Controller {
    static values = { count: {type: Number, default: 0} }
  
    addOne() {
        this.countValue++
    }
    
    countValueChanged() {
        console.log(this.countValue)
    }
}
```

So here we declare a count value that we then interact with: the `countValueChanged` function will automatically be
called whenever the value changes. As we said Stimulus is HTML first. So the HTML actually shows the value on the
element where the controller lives:

```html
<div data-controller="counter" data-counter-count-value="0"></div>
```

So the above HTML will always reflect the value of `this.countValue`. If you change the value through an action in the
controller, the HTML value will be updated. But also if you change the value in the HTML, the `countValueChange`
callback is called.

This may be a bit abstract for now, but opens up really interesting possibilities for many use cases.

### Use class attributes to make your controllers more configurable

Stimulus controllers are best written so that they are reusable. Often you will want to toggle, remove or add
a specific CSS class on an element. But the class might be different every time. For example you sometimes want
to toggle a `hidden` class, but sometimes an `active` one. For these situations you can configure your controller
with an attribute to specify the CSS class to be used:

```html
<div data-controller="toggle" data-toggle-change-class="hidden"></div>
```

And in your controller:

```js
// app/javascript/controllers/toggle_controller.js
export default class extends Controller {
  static classes = [ "change" ]

  toggle() {
    this.element.classList.toggle(this.changeClass)
  }
}
```

### Set up stuff with the lifecycle functions

Often you will want to use Stimulus to use third party JavaScript libraries with your code. For example, to turn your
normal select form input into a fancy interactive field with autocompletion. This means you want to execute
some JavaScript whenever you got such a field.

```html
<select name="foods" id="foods" data-controller="select">
  <option value="Pizza">Pizza</option>
  ...
</select>
```

In this situation you don't have a user do anything you could react to, as they probably just came from another page. For
these situations you can use the lifecycle methods Stimulus. We'll cover only the most important one for now: `connect`

```javascript
import { Controller } from "@hotwired/stimulus"
import Choices from 'choices.js'

export default class extends Controller {
  connect() {
    new Choices(this.element)
  }
}
```

So connect is a special function that gets called whenever an element with the `data-controller="controller-name"`
appears in the DOM. So it's the perfect solution to change things about the HTML that just appeared on the page.

### A little hint on things containing multiple words

Because Stimulus lives between HTML and JavaScript it can be a bit confusing to sort out how to name controllers, actions and target.
Some things use `camelCase` and some `kebab-case`. This little snippet helps to figure out what you need:

```html
<div data-controller="reset-input">
  <input 
    data-reset-input-target="twoWords"
    data-action="keyup->reset-input#updateButton"
  >
</div>
```

### Summary

Stimulus gives you a way to make your HTML more interactive, by using data attributes your HTML makes visible where
your JavaScript will interact with your HTML. This was just a broad introduction; the assignments that follow will
go into more depth.

### Assignment

<div class="lesson-content__panel" markdown="1">
- Read the [Stimulus Handbook](https://stimulus.hotwired.dev/handbook/origin) to get an overview of how to code
with Stimulus.
- Watch this [Stimulus 2.0 Tutorial Video](https://www.driftingruby.com/episodes/the-stimulus-2-0-tutorial); it may give
you a bit of a feel on how to work with Stimulus controllers. You can ignore the part about installation with Webpacker as
we will use the new Rails standard of using import maps.
- Make sure to also read the [reference section](https://stimulus.hotwired.dev/reference/controllers), if you
haven't already. Don't worry if not everything sticks, but you should know where to look up what you need.
</div>

#### Exercises

To practice you need to create a new standard Rails application. Stimulus will be installed by default with Rails 7.0.

- Write some HTML that uses the example controller in `app/javascript/controllers/hello_controller.js`
- Create your own toggle controller and use it in your view. It should be able to show/hide elements upon clicking a
button.
- Make sure your toggle controller is reusable. Try to make it do the following things:
  - Clicking a button will show another element (like a dropdown menu)
  - Clicking an element will hide the clicked element and show another
  - Clicking a checkbox will highlight the element containing the checkbox
- Write a controller for text inputs with a limited length. Warn a user when they are close or over the maximum character
count (imagine a user writing a tweet which has a maximum length of 280 characters)
- **Project**:
Go back to you **Flight Booker** project and improve it:
  - Add a controller that allows the user to add another passenger by clicking on an "Add passenger" button, which adds another set of fields to enter the passenger details (hint: have a look at the [\<template\>](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template) tag)
  - Allow to remove existing passengers by clicking a "Remove" button, which removes the one set of passenger fields (make sure submissions to the server still works as expected)
  - Prevent removing the last set of passenger details.

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- <a class='knowledge-check-link' href='#introduction'>When do you use Stimulus?</a>
- <a class='knowledge-check-link' href='#selecting-targeting-elements'>How do you select a DOM element?</a>
- <a class='knowledge-check-link' href='#use-class-attributes-to-make-your-controllers-more-configurable'>How do you make your Stimulus controllers reusable?</a>
- <a class='knowledge-check-link' href='#triggering-an-action'>How do you trigger actions on an event?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Better Stimulus](https://www.betterstimulus.com/), a good resource that shows best practices around Stimulus
- [Stimulus Components](https://stimulus-components.netlify.app/), a collection of reusable Stimulus components
