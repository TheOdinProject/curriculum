One of the most unique and useful abilities of JavaScript is it's ability to manipulate the DOM. But what _is_ the DOM, and how do we go about changing it? Let's jump right in...


### Points to Ponder

1. What is DOM in relation to a webpage?
2. What's the difference between a "node" and an "element"?
3. How do you target nodes with "selectors"?
4. What are the basic methods for finding/adding/removing and altering DOM nodes?
5. What is the difference between a "nodelist" and an "array of nodes"?
6. How do "events" and "listeners" work?

### DOM - Document Object Model

When working with HTML and JS, you'll often hear mention of "the DOM". The DOM \(or Document Object Model\) is, on a high level, a tree-like representation of the contents of a webpage or "document". A tree of "nodes" with different relationships depending on how they're arranged in the HTML document.


```javascript
<div id="container">
  <div class="display"></div>
  <div class="controls"></div>
</div>
```


In the above example, the `<div class="display"></div>` is a "child" of `<div id="container"></div>` and a sibling to `<div class="controls"></div>`. Think of it like a DOM tree \(which you can imagine like a family tree\), `<div id="container"></div>` would be on the top level/hierarchy, and it's children would be on the next lower level, each with their own "branch".


That's a basic DOM example. But the truth is, that's only accounting for HTML elements. When you're working with the DOM, you're dealing with all of the "nodes" of the webpage. What's the difference? "Nodes" can include elements, text content inside an element, code comment blocks not visible to the user, the document itself and even abstract types like "fragments".

When your HTML and CSS code are rendered into a webpage the browser converts what you've written into a tree of these "Nodes" that contain everything they need \(html identifiers, styles, information about their parent and children nodes etc.\) and then paints them to the webpage.  Basically the main takeaway is that while you will mainly want to target the various `div`s `p`s and `h1`s that you've actually written into your html, you _do_ have access to more information once the code has been rendered in a browser.

### Targetting Nodes with Selectors

When working with the DOM, you use "selectors" to target the nodes you want to work with. You can use a combination of CSS-style selectors and relationship properties to target the nodes you want. Let's start with CSS-style selectors. In the above example, you could use the following selectors to refer to `<div class="display"></div>`:

* div.display
* .display
* container &gt; .display

* div\#container &gt; div.display

Those are just a few, but you have probably noticed the pattern. It's similar to CSS Style Selectors, right?

You can also use relational selectors\(i.e. `firstChild` or `lastSibling` etc.\) with special properties owned by the nodes.

```JavaScript
const container = document.querySelector('#container'); 
// select the #container div (don't worry about the syntax, we'll get there)

console.dir(container.firstChild);                      
// select the first child of #container => .display

const controls = document.querySelector('.controls');   
// select the .controls div

console.dir(controls.previousSibling);                  
// selects the prior sibling => .display
```

So you're identifing a certain node based on its relationships to the nodes around it. 

### DOM methods

The DOM spec adds many properties and methods to the nodes in a webpage. Let's get started with a couple that will be essential in your DOM learnings. We'll start with the query selectors - those that help you target nodes.

#### Query Selectors

* _element_.querySelector\(_selector_\) returns reference to the first match of _selector_
* _element_.querySelectorAll\(_selectors_\) returns a "nodelist" containing references to all of the matches of the _selectors_
  \*_There are several other, more specific queries, that offer potential \(marginal\) performance benefits, but we won't be going over them now._

It's important to note that when using querySelectorAll, the return value is **not** an array. It looks like an array, and it somewhat acts like an array, but it's really a "nodelist". The big distinction is that several array methods are missing from nodelists. One solution, if problems arise, is to convert the nodelist into an array. You can do this with Array.from\(\) or the [spread operator.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator)

#### Element Creation

* document.createElement\(tagName\[, options\]\) =&gt; creates a new element of tag type tagName.  `[options]` in this case means you can add some optional parameters to the function.  Don't worry about these at this point.

```JavaScript
const div = document.createElement('div');
```

\*_An important note is that, although you've created an element. It's not yet visible or attached to the DOM. It's just kind of floating around._

#### Append Elements

* _parentNode_.appendChild\(_childNode_\) =&gt; appends _childNode_ as the last child of _parentNode_
* _parentNode_.insertBefore\(_newNode_, _referenceNode_\) =&gt; inserts _newNode_ into _parentNode_ before _referenceNode_

#### Remove Elements

* _parentNode_.removeChild\(_child_\) =&gt; removes _child_ from _parentNode_ on the DOM and returns reference to _child_

#### Altering Elements

When you have a reference to an element, you can use that reference to alter the element's own properties. This allows you to do many useful alterations, like adding/removing and altering attributes, changing classes, adding inline style information and more.

```JavaScript
const div = document.createElement('div');                     
// create a new div referenced in the variable 'div'
```

#### Adding inline style

```JavaScript
div.style.color = 'blue';                                      
// adds the indicated style rule

div.style.cssText = 'color: blue; background: white';          
// adds several style rules

div.setAttribute('style', 'color: blue; background: white';    
// adds several style rules
```

See DOM Enlightenment's [section on CSS Style rules](http://domenlightenment.com/#6.2) for more info on inline styles.

Generally style rules are the same as in CSS with the exception that hyphenated rules are changed to camelCase. I.E. "background-color" becomes "backgroundColor".

#### Editing Attributes

```JavaScript
div.setAttribute('id', 'theDiv');                              
// if id exists update it to 'theDiv' else create an id 
// with value "theDiv"

div.getAttribute('id');                                        
// returns value of specified attribute, in this case 
// "theDiv"

div.removeAttribute('id');                                     
// removes specified attribute
```

See MDNs section on [HTML Attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes) for more info on available attributes.

#### Working with classes

```JavaScript
div.classList.add('new');                                      
// adds class "new" to your new div

div.classList.remove('new');                                   
// remove "new" class from div

div.classList.toggle('active');                                
// if div doesn't have class "active" then add it, or if 
// it does, then remove it
```

It is often standard \(and more clean\) to toggle a CSS style rather than adding and removing inline CSS.

#### Adding text content

```JavaScript
div.textContent = 'Hello World!'                               
// creates a text node containing "Hello World!" and 
// inserts it in div
```

#### Adding HTML content

```JavaScript
div.innerHTML = '<span>Hello World!</span>';                   
// renders the html inside div
```

\*_Note that textContent is preferable for adding text, and innerHTML should be used sparingly as it can create security risks if misused._

### Events


Events are how you make the magic happen on your pages. There are a lot of events for most situations you will encounter. Events fire when the page loads, when you click your mouse, when you push keys on your keyboard, when you leave the page, when you shift focus to or away from input forms, and many more. You can utilize these events as a trigger to run your code. There are three primary ways to go about this: you can attach scripts to event attributes on elements in the HTML document, you can set the "on_event_" property on the DOM object in your JavaScript, or you can attach event listeners to the nodes in your JavaScript.

We're going to create 3 buttons that all alert "BUTTON" when clicked. We'll use all 3 methods to achieve it and discuss.

```JavaScript
<button onclick="alert(this.tagName)">Click Me</button>
```

This solution is less than ideal. For one, we're cluttering out HTML with JavaScript. And two, we can only have 1 "onclick" event per element. Let's try another approach.

```JavaScript
// the html file
<button id="btn">Click Me</button>
```

```JavaScript
// the JavaScript file
var btn = document.querySelector('#btn');
btn.onclick = (e) => alert(e.target.tagName);
```

###### \(need to review arrow functions? [LINK\)](http://javascript.info/function-expressions-arrows#arrow-functions)

This is a little better. We've moved the JS out of the HTML and into a JS file, but we still have the problem that a DOM element can only have 1 "onclick" property. Let's try the last method.

```JavaScript
// the html file
<button id="btn">Click Me Too</button>
```

```JavaScript
// the JavaScript file
var btn = document.querySelector('#btn');
btn.addEventListener('click', (e) => {
  alert(e.target.tagName);
});
```

Now, we maintain separation of concerns, and we also allow multiple event listeners if need arise. Great!

There are some important things taking place here. That `e` being passed into our event listener callback, references the event itself. In the example, it's a click event. That event has a whole bundle of properties that we won't be discussing right now, but you're strongly encouraged to check out the links below for further study. The property we use in the example, is the "target" property. That's the element being clicked. Common practice is to call that event either "e" or "event" in your callback.

#### Attaching listeners to groups of nodes

This might seem like a lot of code if you're attaching lots of similar event listeners to many elements. There's a few ways to go about doing that more efficiently.

We want to create an alert when the buttons are clicked. We'll try first by iterating over a group of elements.

```JavaScript
<div id="container">
    <button id="1">Click Me</button>
    <button id="2">Click Me</button>
    <button id="3">Click Me</button>
</div>
```

```JavaScript
var buttons = document.querySelectorAll('button');
buttons.forEach((button) => {
  button.addEventListener('click', (e) => {
    alert(button.id);
  });
});
```

This works just fine, but an easier solution would be to utilize the "bubbling" mechanic of event propagation. Everytime an event fires, it potentially goes through 3 phases:

1. Capture Phase - the event checks all nodes along the branch from the window all the way down to the event.target checking for additional listeners. _This phase is turned off by default_.
2. Target Phase - Checks event.target for an event listener.
3. Bubbling Phase - The event checks all the nodes along the branch from the event.target all the way up to the window or root. _It "bubbles" to the top_.

So how can we utilize this in our example?

```JavaScript
// this line selects the #container div
var container = document.querySelector('#container');
// this line adds an eventListener to the CONTAINER (not the button)
container.addEventListener('click', (e) => {
  // here we check the tagname of the event target..
  // technically the listener will fire everytime someone clicks on the container
  // but this line filters out any clicks that aren't on the button itself.
  if (e.target.tagName !== 'BUTTON') return;
  alert(e.target.id);
});
```

With a simple equality check, we can put 1 event listener on the parent \(or any ancestor really\), and allow the event to bubble up to that listener. This technique is called "event delegation". You can read more about it [here](https://javascript.info/event-delegation).

---

This is just the tip of the iceberg when it comes to DOM manipulation and event handling, but I think it's enough to get you started with some exercises.

### Exercises

#### JavaScript Drum Kit:

We'll be doing the first exercise in Wes Bos's JavaScript30 program. You'll need to clone the repo at [https://github.com/wesbos/JavaScript30](https://github.com/wesbos/JavaScript30). Check out the [Video Tutorial](https://www.youtube.com/watch?v=VuN8qwZoego) for instructions on the project. When you've completed the Drum Kit exercise, you can move on to the next section.

### Additional Resources

* [Eloquent JS - DOM](http://eloquentjavascript.net/13_dom.html)
* [Eloquent JS - Handling Events](http://eloquentjavascript.net/14_event.html)
* [DOM Enlightenment](http://domenlightenment.com/)
* [JavaScript30](https://JavaScript30.com)
* If you've already learned jQuery then [this website](https://plainjs.com/javascript/) will help you figure out how to do things without it.



