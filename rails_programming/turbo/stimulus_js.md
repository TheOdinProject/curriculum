# Stimulus JS

### Introduction

Remember JavaScript? What did we learn that for? Well, sometimes you want a bit more interactivity in your browser, 
like hiding/showing a part of your page. Making a round trip to your server is impractical. That is where JavaScript
comes in. So Rails suggest using Stimulus to augment your html. Stimulus gives you a way of creating and using reusable 
controllers that give you that extra little bit of interactivity.

### Learning Outcomes

*Look through these now and then use them to test yourself after doing the assignment*

After going through this lesson you should be able to

* explain how to attach Stimulus controllers to your html
* how to use targets instead of query selectors
* how to use action attributes instead of event listeners
* where to keep state
* how to use lifecycle callbacks
* how to make your controllers reusable
* how to make your controllers customizable with attributes

### The idea

Stimulus is a modest framework. It leaves things mostly up to you, but gives you a consistent way of doing things.
It uses html `data-attributes` to attach and configure behavior on your html. Let us look an an html example
from the handbook:

```
<div data-controller="clipboard">
  PIN: <input data-clipboard-target="source" type="text" value="3737" readonly>
  <button data-action="click->clipboard#copy">Copy to Clipboard</button>
</div>
```

Read carefully through the example, and pay special attention to the data attributes! Can you guess what it does?

This example is using three data attributes: `data-controller`, `data-clipboard-target`, `data-action`. So what is their
purpose?

* **data-controller** is set to `clipboard`. Which means: Hey Stimulus, we want to enhance this html with some clipboard
behavior
* **data-clipboard-target** is set to `source`. Which says: this is the the `source` we are gonna use for our clipboard
controller
* **data-action** is set to `click->clipboard#copy`. Which means: On a click invoke the `copy`action the our clipboard
controller

So together these three attributes enable the following behavior: When a user `click`s on the button, use the function
`copy` of Stimulus controller `clipboard` with the input as a `source`. The yet-to-be-seen JavaScript controller will
then take care of the rest and will copy the value of the source target to the users clipboard.

Wasn't this supposed to be a JavaScript lesson? Yes, but the point is that Stimulus is a HTML first framework. 
It generally does not render html, instead it attaches behavior to your existing html with sprinkles of JavaScript.
Trough the consistent use of some data attributes we can read the html and can see where the html is enhanced.

Look this html without the special data-attributes Stimulus uses:
```html
<input id="pin-code value="1337" readonly>
<button id="pin-button">Copy to Clipboard</button>
```

Probably something is supposed to happen, when you click that button. However you can't tell from the html
alone how things are wired up. You have to search for some JavaScript that handles this behavior.

So let's got through the basic aspects of Stimulus controllers. Don't worry if you don't understand
everything on the first read through, the assignments will give more in depth information.

### The stimulus controller

A Stimulus controller gets attached to a dom element by declaring it with the `data-controller` attribute.

```html
<input data-controller="input">
```

This will attach a the Stimulus controller that is located in `app/javascript/controllers/input_controller.js`. 
If you want to add a new
controller, create a file `some_name_controller.js` and it will be automatically loaded.

An empty controller looks something like this:

```javascript
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {}
```

This controller does not do anything, it only shows how it imports the class `Controller` that we use as a basis.
As you see, there is no mention of the name of the controller, the name is inferred from the file name 
(`input_controller.js` becomes `input`).

This creates a scope, all the following attributes will only work within the scope of that controller / dom element.

### Triggering an action

You learned how to trigger events with event listeners, in Stimulus instead you use `data-action` attributes to
execute javascript to react to a user click or input.

So instead of `document.querySelector("button).addEventListener("click", showAlert)` we write the following html

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

You learned how to access dom elements with selectors, such as `document.querySelector` and `document.getElementById`.
Again Stimulus gives you a way to declare elements you want to select in the html:

```html
<div data-controller="greeter">
  <input type="text" 
         data-action="click->greeter#greet" 
         data-greeter-target="name">
    Alert me!
  </input>
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
        this.nameTarget.html = this.inputTarget.value     
    }
}
```

You need to declare your targets, but once you do, you can get the dom-element by using `this.nameTarget`.
If you have need multiple targets of the same kind, you can get an array of dom-elements with `this.nameTargets`.
If you need to make your controllers to be smart about targets, you can
also ask whether certain targets are available in the html with `this.hasNameTarget`.

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

Stimulus also lets you declare specific value attributes, that allow you to listen to changes:

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

So here we declare a count value that we then interact with it, the `countValueChanges` function will automatically be
called whenever the value changes. As we said Stimulus is html first. So the html actually shows the value on the 
element where the controller lives:

```html
<div data-controller="counter" data-counter-count-value="0"></div>
```

So the above html will always reflect the value of `this.countValue`. If you change the value through an action in the 
controller, the html value will be updated. But also if you change the value in the html, the `countValueChange`
callback is called.

This may be a bit abstract for now, but opens up really interesting possibilities for many use cases.

### Use class attributes to make your controllers more configurable

Stimulus controllers are best written in a way, that they are reusable. Often you will want to toggle, remove or add
a specific CSS class on an element. But the class might be different every time, for example you sometimes want
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

Often you will want to use Stimulus to use third party javascript libraries with your code. For example to turn your
normal select form input into a fancy interactive field with autocompletion and so forth. This means you want to execute
some JavaScript whenever you got such a field.

```html
<select name="foods" id="foods" data-controller="select">
  <option value="Pizza">Pizza</option>
  ...
</select>
```

In this situation you don't have a user do anything you could react to, he probably just came from another page. For
these situation you can use the lifecycle methods Stimulus. We'll cover only the most important one for now: `connect`

```javascript
import { Controller } from "@hotwired/stimulus"
import Choices from 'choices.js'

export default class extends Controller {
  connect() {
    new Choices(this.element)
  }
}
```
So connect is a special function, that gets called whenever an element with the `data-controller="controller-name"`
appears in the DOM. So the perfect solution to change things about the html that just appears on the page, that you
need to change somehow.

### Summary

Stimulus gives you a way to make your html more interactive, by using data attributes your html makes visible where
your Javascript will interact with your HTML. This was just a broad introduction, please follow the assignments that will
go more into depth.

### Assignment

<div class="lesson-content__panel" markdown="1">
* Read the [Stimulus Handbook](https://stimulus.hotwired.dev/handbook/origin) to get an overview of how to code
with Stimulus
* Watch this [Stimulus 2.0 Tutorial Video](https://www.driftingruby.com/episodes/the-stimulus-2-0-tutorial) it may give
you a bit of a feel on how to work with Stimulus controllers. You can ignore the part about installation with Webpacker
we will use the new rails standard of using import maps.
* Make sure to also read the [reference section](https://stimulus.hotwired.dev/reference/lifecycle-callbacks), if you 
haven't already, don't worry if not everything sticks, but you should know where to look up these things.
</div>

### Exercises

To practice you create a new standard rails application. Stimulus will be installed by default with Rails 7.0.

* Write some HTML that uses the example controller in `app/javascript/controllers/hello_controller.js`
* Create you own toggle controller and use it in your view. It should be able shows/hide elements upon clicking some
button.
* Make sure your toggle controller is reusable, try to make it do the following things:
  * Clicking a button, will show another element (like a dropdown menu)
  * Clicking an element, will hide the clicked element and show another
  * Clicking an checkbox, will highlight the element containing
* Write a controller for text inputs with a limited length. Warn a user when he is close or over the maximum character
count (imagine a user writing a tweet which has a maximum length of 280 characters)
* Project: In a new rails app, create a `car` model that `:has_many` `variants`, make up some attributes. Then 
create a form to edit a car, where you can dynamically add more variants using `:accepts_nested_attributes_for` and a
stimulus controller that adds the form fields you need for a new variant entry. Bonus points for destroying existing 
records when submitting.

### Additional Resources

* [Better Stimulus](https://www.betterstimulus.com/) a good resource that shows best practices around Stimulus
* [Stimulus Components](https://stimulus-components.netlify.app/) collection of reusable stimulus components to use
