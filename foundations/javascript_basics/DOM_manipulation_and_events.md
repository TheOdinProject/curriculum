### Introduction

One of the most unique and useful abilities of JavaScript is its ability to manipulate the DOM. But what *is* the DOM, and how do we go about changing it? Let's jump right in...

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain what the DOM is in relation to a webpage.
- Explain the difference between a "node" and an "element".
- Explain how to target nodes with "selectors".
- Explain the basic methods for finding, adding, removing, and altering DOM nodes.
- Explain the difference between a "NodeList" and an "array of nodes".
- Explain what "bubbling" is and how it works.

### Document Object Model

The DOM (or Document Object Model) is a tree-like representation of the contents of a webpage - a tree of "nodes" with different relationships depending on how they're arranged in the HTML document.

```html
<div id="container">
  <div class="display"></div>
  <div class="controls"></div>
</div>
```

In the above example, the `<div class="display"></div>` is a "child" of `<div id="container"></div>` and a "sibling" to `<div class="controls"></div>`. Think of it like a family tree. `<div id="container"></div>` is a **parent**, with its **children** on the next level, each on their own "branch".

### Targeting nodes with selectors

When working with the DOM, you use "selectors" to target the nodes you want to work with. You can use a combination of CSS-style selectors and relationship properties to target the nodes you want. Let's start with CSS-style selectors. In the above example, you could use the following selectors to refer to `<div class="display"></div>`:

- `div.display`
- `.display`
- `#container > .display`
- `div#container > div.display`

You can also use relational selectors (i.e., `firstElementChild` or `lastElementChild`, etc.) with special properties owned by the nodes.

```javascript
// selects the #container div (don't worry about the syntax, we'll get there)
const container = document.querySelector("#container");

// selects the first child of #container => .display
console.dir(container.firstElementChild);

// selects the .controls div
const controls = document.querySelector(".controls");

// selects the prior sibling => .display
console.dir(controls.previousElementSibling);
```

So you're identifying a certain node based on its relationships to the nodes around it.

### DOM methods

When your HTML code is parsed by a web browser, it is converted to the DOM, as was mentioned above. One of the primary differences is that these nodes are JavaScript objects that have many properties and methods attached to them. These properties and methods are the primary tools we are going to use to manipulate our webpage with JavaScript. We'll start with the query selectors - those that help you target nodes.

#### Query selectors

- `element.querySelector(selector)` - returns a reference to the first match of *selector*.
- `element.querySelectorAll(selectors)` - returns a "NodeList" containing references to all of the matches of the *selectors*.

<div class="lesson-note">

There are several other, more specific queries, that offer potential (marginal) performance benefits, but we won't be going over them now.

</div>

It's important to remember that when using querySelectorAll, the return value is **not** an array. It looks like an array, and it somewhat acts like an array, but it's really a "NodeList". The big distinction is that several array methods are missing from NodeLists. One solution, if problems arise, is to convert the NodeList into an array. You can do this with `Array.from()` or the [spread operator.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator)

#### Element creation

- `document.createElement(tagName, [options])` - creates a new element of tag type tagName. `[options]` in this case means you can add some optional parameters to the function. Don't worry about these at this point.

```javascript
const div = document.createElement("div");
```

This function does NOT put your new element into the DOM - it creates it in memory. This is so that you can manipulate the element (by adding styles, classes, ids, text, etc.) before placing it on the page. You can place the element into the DOM with one of the following methods.

#### Append elements

- `parentNode.appendChild(childNode)` - appends *childNode* as the last child of *parentNode*.
- `parentNode.insertBefore(newNode, referenceNode)` - inserts *newNode* into *parentNode* before *referenceNode*.

#### Remove elements

- `parentNode.removeChild(child)` - removes *child* from *parentNode* on the DOM and returns a reference to *child*.

#### Altering elements

When you have a reference to an element, you can use that reference to alter the element's own properties. This allows you to do many useful alterations, like adding, removing, or altering attributes, changing classes, adding inline style information, and more.

```javascript
// creates a new div referenced in the variable 'div'
const div = document.createElement("div");
```

#### Adding inline style

```javascript
// adds the indicated style rule to the element in the div variable
div.style.color = "blue";

// adds several style rules
div.style.cssText = "color: blue; background: white;";

// adds several style rules
div.setAttribute("style", "color: blue; background: white;");
```

When accessing a kebab-cased CSS property like `background-color` with JS, you will need to either use camelCase with dot notation or bracket notation. When using bracket notation, you can use either camelCase or kebab-case, but the property name must be a string.

```javascript
// dot notation with kebab case: doesn't work as it attempts to subtract color from div.style.background
// equivalent to: div.style.background - color
div.style.background-color;

// dot notation with camelCase: works, accesses the div's background-color style
div.style.backgroundColor;

// bracket notation with kebab-case: also works
div.style["background-color"];

// bracket notation with camelCase: also works
div.style["backgroundColor"];
```

#### Editing attributes

```javascript
// if id exists, update it to 'theDiv', else create an id with value "theDiv"
div.setAttribute("id", "theDiv");

// returns value of specified attribute, in this case "theDiv"
div.getAttribute("id");

// removes specified attribute
div.removeAttribute("id");
```

See MDN's section on [HTML Attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes) for more information on available attributes.

#### Working with classes

```javascript
// adds class "new" to your new div
div.classList.add("new");

// removes "new" class from div
div.classList.remove("new");

// if div doesn't have class "active" then add it, or if it does, then remove it
div.classList.toggle("active");
```

It is often standard (and cleaner) to toggle a CSS style rather than adding and removing inline CSS.

#### Adding text content

```javascript
// creates a text node containing "Hello World!" and inserts it in div
div.textContent = "Hello World!";
```

#### Adding HTML content

```javascript
// renders the HTML inside div
div.innerHTML = "<span>Hello World!</span>";
```

<div class="lesson-note lesson-note--tip" markdown="1">

Note that using textContent is preferred over innerHTML for adding text, as innerHTML should be used sparingly to avoid potential security risks.
To understand the dangers of using innerHTML, watch this [video about preventing the most common cross-site scripting attack](https://youtube.com/watch?v=ns1LX6mEvyM).

</div>

Let's take a minute to review what we've covered and give you a chance to practice this stuff before moving on. Check out this example of creating and appending a DOM element to a webpage.

```html
<!-- your HTML file: -->
<body>
  <h1>THE TITLE OF YOUR WEBPAGE</h1>
  <div id="container"></div>
</body>
```

```javascript
// your JavaScript file
const container = document.querySelector("#container");

const content = document.createElement("div");
content.classList.add("content");
content.textContent = "This is the glorious text-content!";

container.appendChild(content);
```

In the JavaScript file, first we get a reference to the `container` div that already exists in our HTML. Then we create a new div and store it in the variable `content`. We add a class and some text to the `content` div and finally append that div to `container`. After the JavaScript code is run, our DOM tree will look like this:

```html
<!-- The DOM -->
<body>
  <h1>THE TITLE OF YOUR WEBPAGE</h1>
  <div id="container">
    <div class="content">This is the glorious text-content!</div>
  </div>
</body>
```

Keep in mind that the JavaScript does *not* alter your HTML, but the DOM - your HTML file will look the same, but the JavaScript changes what the browser renders.

<div id="important-note" class="lesson-note" markdown="1">

Your JavaScript, for the most part, is run whenever the JS file is run or when the script tag is encountered in the HTML. If you are including your JavaScript at the top of your file, many of these DOM manipulation methods will not work because the JS code is being run *before* the nodes are created in the DOM. The simplest way to fix this is to include your JavaScript at the bottom of your HTML file so that it gets run after the DOM nodes are parsed and created.

Alternatively, you can link the JavaScript file in the `<head>` of your HTML document. Use the `<script>` tag with the `src` attribute containing the path to the JS file, and include the `defer` keyword to load the file *after* the HTML is parsed, as such:

```html
<head>
  <script src="js-file.js" defer></script>
</head>
```

Find out more about the [`defer` attribute for script tags](https://javascript.info/script-async-defer#defer).

</div>

### Exercise

Copy the example above into files on your own computer. To make it work, you'll need to supply the rest of the HTML skeleton and either link your JavaScript file or put the JavaScript into a script tag on the page. Make sure everything is working before moving on!

Add the following elements to the container using ONLY JavaScript and the DOM methods shown above:

1. a `<p>` with red text that says "Hey I'm red!"
1. an `<h3>` with blue text that says "I'm a blue h3!"
1. a `<div>` with a black border and pink background color with the following elements inside of it:
   - another `<h1>` that says "I'm in a div"
   - a `<p>` that says "ME TOO!"
   - Hint for this one: after creating the `<div>` with createElement, append the `<h1>` and `<p>` to it before adding it to the container.

### Events

Now that we have a handle on manipulating the DOM with JavaScript, the next step is learning how to make that happen dynamically or on demand! Events are how you make that magic happen on your pages. Events are actions that occur on your webpage, such as mouse-clicks or key-presses. Using JavaScript, we can make our webpage listen to and react to these events.

There are three primary ways to go about this:

- You can specify function attributes directly on your HTML elements.
- You can set properties in the form of `on<eventType>`, such as `onclick` or `onmousedown`, on the DOM nodes in your JavaScript.
- You can attach event listeners to the DOM nodes in your JavaScript.

Event listeners are definitely the preferred method, but you will regularly see the others in use, so we're going to cover all three.

We're going to create three buttons that all alert "Hello World" when clicked. Try them all out using your own HTML file or using something like [CodePen](https://codepen.io/).

#### Method 1

```html
<button onclick="alert('Hello World')">Click Me</button>
```

This solution is less than ideal because we're cluttering our HTML with JavaScript. Also, we can only set one "onclick" property per DOM element, so we're unable to run multiple separate functions in response to a click event using this method.

#### Method 2

```html
<!-- the HTML file -->
<button id="btn">Click Me</button>
```

```javascript
// the JavaScript file
const btn = document.querySelector("#btn");
btn.onclick = () => alert("Hello World");
```

<div class="lesson-note lesson-note--tip" markdown="1">

If you need to review the arrow syntax `() =>`, check this [article about arrow functions](http://javascript.info/arrow-functions-basics).

</div>

This is a little better. We've moved the JS out of the HTML and into a JS file, but we still have the problem that a DOM element can only have one "onclick" property.

#### Method 3

```html
<!-- the HTML file -->
<button id="btn">Click Me Too</button>
```

```javascript
// the JavaScript file
const btn = document.querySelector("#btn");
btn.addEventListener("click", () => {
  alert("Hello World");
});
```

Now, we maintain separation of concerns, and we also allow multiple event listeners if the need arises. Method 3 is much more flexible and powerful, though it is a bit more complex to set up.

Note that all three of these methods can be used with named functions like so:

```html
<!-- the HTML file -->
<!-- METHOD 1 -->
<button onclick="alertFunction()">CLICK ME BABY</button>
```

```javascript
// the JavaScript file
// METHOD 1
function alertFunction() {
  alert("YAY! YOU DID IT!");
}
```

```html
<!-- the HTML file -->
<!-- METHODS 2 & 3 -->
<button id="btn">CLICK ME BABY</button>
```

```javascript
// the JavaScript file
// METHODS 2 & 3
function alertFunction() {
  alert("YAY! YOU DID IT!");
}
const btn = document.querySelector("#btn");

// METHOD 2
btn.onclick = alertFunction;

// METHOD 3
btn.addEventListener("click", alertFunction);
```

Using named functions can clean up your code considerably, and is a *really* good idea if the function is something that you are going to want to do in multiple places.

With all three methods, we can access more information about the event by passing a parameter to the function that we are calling. Try this out on your own machine:

```javascript
btn.addEventListener("click", function (e) {
  console.log(e);
});
```

<div class="lesson-note lesson-note--tip" markdown="1">

When we pass in `alertFunction` or `function (e) {...}` as an argument to `addEventListener`, we call this a `callback`. A callback is simply a function that is passed into another function as an argument.

</div>

The `e` parameter in that callback function contains an object that references the **event** itself. Within that object you have access to many useful properties and methods (functions that live inside an object) such as which mouse button or key was pressed, or information about the event's **target** - the DOM node that was clicked.

Try this:

```javascript
btn.addEventListener("click", function (e) {
  console.log(e.target);
});
```

and now this:

```javascript
btn.addEventListener("click", function (e) {
  e.target.style.background = "blue";
});
```

Pretty cool, eh?

#### Attaching listeners to groups of nodes

This might seem like a lot of code if you're attaching lots of similar event listeners to many elements. There are a few ways to go about doing that more efficiently. We learned above that we can get a NodeList of all of the items matching a specific selector with `querySelectorAll('selector')`. In order to add a listener to each of them, we need to iterate through the whole list, like so:

```HTML
<div id="container">
  <button id="1">Click Me</button>
  <button id="2">Click Me</button>
  <button id="3">Click Me</button>
</div>
```

```javascript
// buttons is a node list. It looks and acts much like an array.
const buttons = document.querySelectorAll("button");

// we use the .forEach method to iterate through each button
buttons.forEach((button) => {
  // and for each one we add a 'click' listener
  button.addEventListener("click", () => {
    alert(button.id);
  });
});
```

This is just the tip of the iceberg when it comes to DOM manipulation and event handling, but it's enough to get you started with some exercises. In our examples so far, we have been using the 'click' event exclusively, but there are *many* more available to you.

Some useful events include:

- click
- dblclick
- keydown
- keyup

You can find a more complete list with explanations of each event on [W3Schools JavaScript Event Reference page](https://www.w3schools.com/jsref/dom_obj_event.asp).

### Assignment

<div class="lesson-content__panel" markdown="1">

Manipulating web pages is the primary benefit of the JavaScript language! These techniques are things that you are likely to be messing with *every day* as a front-end developer, so let's practice!

1. Complete [MDN's Active Learning sections on DOM manipulation](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Client-side_web_APIs/Manipulating_documents#active_learning_a_dynamic_shopping_list) and test your skills!
1. Read the following sections from JavaScript Tutorial's series on the DOM to get a broader idea of how events can be used in your pages. Note that some of the methods like `getElementById` are older and see less use today.

   As you read, remember that the general ideas can be applied to any event, not only the ones used in examples - but information specific to a certain event type can always be found by checking documentation.

   - [JavaScript events](https://www.javascripttutorial.net/javascript-dom/javascript-events/)
   - [Page load events](https://www.javascripttutorial.net/javascript-dom/javascript-page-load-events/)
   - [Mouse events](https://www.javascripttutorial.net/javascript-dom/javascript-mouse-events/)
   - [Keyboard events](https://www.javascripttutorial.net/javascript-dom/javascript-keyboard-events/)
   - [Event delegation](https://www.javascripttutorial.net/javascript-dom/javascript-event-delegation/)
   - [The dispatchEvent method](https://www.javascripttutorial.net/javascript-dom/javascript-dispatchevent/)
   - [Custom events](https://www.javascripttutorial.net/javascript-dom/javascript-custom-events/)

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is the DOM?](#document-object-model)
- [How do you target the nodes you want to work with?](#targeting-nodes-with-selectors)
- [How do you create an element in the DOM?](#element-creation)
- [How do you add an element to the DOM?](#append-elements)
- [How do you remove an element from the DOM?](#remove-elements)
- [How can you alter an element in the DOM?](#altering-elements)
- [When adding text to a DOM element, should you use textContent or innerHTML? Why?](https://www.youtube.com/watch?v=ns1LX6mEvyM)
- [Where should you include your JavaScript tag in your HTML file when working with DOM nodes?](#important-note)
- [How do "events" and "listeners" work?](#events)
- [What are three ways to use events in your code?](#events)
- [Why are event listeners the preferred way to handle events?](#attaching-listeners-to-groups-of-nodes)
- [What are the benefits of using named functions in your listeners?](#method-3)
- [How do you attach listeners to groups of nodes?](#attaching-listeners-to-groups-of-nodes)
- [What is the difference between the return values of `querySelector` and `querySelectorAll`?](#query-selectors)
- [What does a "NodeList" contain?](#query-selectors)
- [Explain the difference between "capture" and "bubbling".](https://www.youtube.com/watch?v=F1anRyL37lE)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Eloquent JS - DOM](http://eloquentjavascript.net/13_dom.html)
- [Eloquent JS - Handling Events](http://eloquentjavascript.net/14_event.html)
- [DOM Enlightenment](http://domenlightenment.com/)
- [Plain JavaScript](https://plainjs.com/javascript/) is a reference of JavaScript code snippets and explanations involving the DOM, as well as other aspects of JS. If you've already learned jQuery, it will help you figure out how to do things without it.
- This [W3Schools](https://www.w3schools.com/js/js_htmldom.asp) article offers easy-to-understand lessons on the DOM.
- [JS DOM Crash Course](https://www.youtube.com/watch?v=0ik6X4DJKCc&list=PLillGF-RfqbYE6Ik_EuXA2iZFcE082B3s) is an extensive and well explained 4 part video series on the DOM by Traversy Media.
- [Understanding The Dom](https://www.digitalocean.com/community/tutorial_series/understanding-the-dom-document-object-model) is an aptly named article-based tutorial series by DigitalOcean.
- [Introduction to events](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events) by MDN covers the same topics you learned in this lesson on events.
- [Wes Bos's Drumkit](https://www.youtube.com/watch?v=VuN8qwZoego) JavaScript30 program reinforces the content covered in the assignment. In the video you will notice that a deprecated [keycode](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/keyCode) keyboard event is used, replace it with the recommended [code](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/code) keyboard event and replace the `data-key` tags accordingly.
- [Event Capture, Propagation and Bubbling video](https://www.youtube.com/watch?v=F1anRyL37lE) from Wes Bos's JavaScript30 program.
- [Understanding Callbacks in JavaScript](https://dev.to/i3uckwheat/understanding-callbacks-2o9e) for a more in-depth understanding of callbacks.
