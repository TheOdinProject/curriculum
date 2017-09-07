One of the most unique and useful abilities of javascript is it's ability to manipulate the DOM. But what *is* the DOM, and how do we go about changing it? Let's jump right in...

### Points to Ponder

1. Do you understand what the DOM is in relation to a webpage?
2. Do you understand the difference between a "node" and an "element"?
3. Do you understand how to target nodes with "selectors"?
4. Do you know the basic methods for finding/adding/removing and altering DOM nodes?
5. Likewise, do you know the difference between a "nodelist" and an "array of nodes"?
6. Do you understand how "events" and "listeners" work?

### DOM - Document Object Model

When working with HTML and JS, you'll often here mention of "the DOM". What the DOM is, on a high level, is a tree-like representation of the contents of a webpage or "document". A tree of "nodes" with different relationsships depending on how they're arranged in the HTML document.

```javascript
<div id="container">
  <div class="display"></div>
  <div class="controls"></div>
</div>
```

In the above example, the `<div class="display"></div>` is a "child" of `<div id="container"></div>` and a sibling to `<div class="controls"></div>`. To think of it like a DOM tree (which you can imagine like a family tree), `<div id="container"></div>` would be on the top level/hierarchy, and it's children would be on the next lower level, each with their own "branch".

That's a basic DOM example. But the truth is, that's only accounting for HTML elements. When you're working with the DOM, you're dealing with all of the "nodes" of the webpage. What's the difference? "Nodes" can include elements, text content inside an element, code comment blocks not visible to the user, the document itself and even abstract types like "fragments". **All "elements" are "nodes", but not all "nodes" are "elements".** 

### Targetting Nodes with Selectors

When working with the DOM, you use "selectors" to target the nodes you want to work with. You can use a combination of CSS-style selectors and relationship properties to target the nodes you want. Let's start with CSS-style selectors. In the above example, you could use the following selectors to refer to `<div class="display"></div>`:
* div.display
* .display
* #container > .display
* div#container > div.display
* more permutations etc

Those are just a few, but you probably notice the pattern. It's similar to CSS Style Selectors, right?

You can also use relational selectors with special properties owned by the nodes. 

```javascript
const container = document.querySelector('#container'); 
// select the #container div (don't worry about the syntax, we'll get there)

console.dir(container.firstChild);                      
// select the first child of #container => .display

const controls = document.querySelector('.controls');   
// select the .controls div

console.dir(controls.previousSibling);                  
// selects the prior sibling => .display
```

So you're using the node's relationships to the surrounding nodes to define it.

### DOM methods

The DOM spec adds many properties and methods to the nodes in a webpage. Let's get started with a couple that will be essential in your DOM learnings. We'll start with the query selectors - those that help you target nodes. These are avaiable on bject and element objects.

#### Query Selectors

* *element*.querySelector(*selector*) returns reference to the first match of *selector*
* *element*.querySelectorAll(*selectors*) returns a "nodelist" containing references to all of the matches of the *selectors*
\**There are several other, more specific queries, that offer potential (marginal) performance benefits, but we won't be going over them now.*

It's important to note that when using querySelectorAll, the return value is **not** an array. It looks like an array, and it somewhat acts like an array, but it's really a "nodelist". The big distinction is that several array methods are missing from nodelists. One solution, if problems arise, is to convert the nodelist into an array. With ES6 you can do this with Array.from(). Although browser support is not yet complete, polyfills are available.

#### Element Creation

* document.createElement(tagName[, options]) => creates a new element of tag type *tagName*

```javascript
const div = document.createElement('div');
```

\**An important note is that, although you've create an element. It's not yet visible or attached to the DOM. It's just kind of floating around.*

#### Append Elements

* *parentNode*.appendChild(*childNode*) => appends *childNode* as the last child of *parentNode*
* *parentNode*.insertBefore(*newNode*, *referenceNode*) => inserts *newNode* into *parentNode* before *referenceNode*

#### Remove Elements

* *parentNode*.removeChild(*child*) => removes *child* from *parentNode* on the DOM and returns reference to *child*

#### Altering Elements

When you have reference to an element, you can use that reference to alter the elements own properties. This provides allows you to do many useful alterations, like adding/removing and altering attributes, changing classes, adding inline style information and more.

```javascript
const div = document.createElement('div');                     
// create a new div referenced in the variable 'div'
```

#### Adding inline style

```javascript
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

```javascript
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

```javascript
div.classList.add('new');                                      
// adds class "new" to your new div

div.classList.remove('new');                                   
// remove "new" class from div

div.classList.toggle('active');                                
// if div doesn't have class "active" then add it, or if 
// it does, then remove it
```

Often times it's more efficient and creates cleaner code to toggle a style rather than adding and removing inline CSS.

#### Adding text content

```javascript
div.textContent = 'Hello World!'                               
// creates a text node containing "Hello World!" and 
// inserts it in div
```

#### Adding HTML content

```javascript
div.innerHTML = '<span>Hello World!</span>';                   
// renders the html inside div
```

 \**Note that textContent is preferable for adding text, and innerHTML should be used sparingly as it can create security risks if misused.*

### Events

Events are how you make the magic happen on your pages. There are a lot of events for most all situations you will encounter. Events fire when the page loads, when you click your mouse, when you push keys on your keybaord, when you leave the page, when you shift focus to or away from input forms, and many, many more. You can utilize these events as a trigger to run your code. There are three primary ways to go about this: you can attach scripts to event attributes on elements in the HTML document, you can set the "on*event*" property on ythe DOM object in your javascript, or you can attach event listeners to the nodes in your javascript.

We're going to create 3 buttons that all alert "BUTTON" when clicked. We'll use all 3 methods to achieve it and discuss.

```javascript
<button onclick="alert(this.tagName)">Click Me</button>
```

This solution is less than ideal. For one, we're cluttering out HTML with javascript. And two, we can only have 1 "onclick" event per element. Let's try another approach.

```javascript
<button id="btn">Click Me</button>
```

```javascript
var btn = document.querySelector('#btn');
btn.onclick = (e) => alert(e.target.tagName);

```

This is a little better. We've moved the JS out of the HTML and into a JS file, but we still have the problem that a DOM element can only have 1 "onclick" property. Let's try the last method.

```javascript
<button id="btn">Click Me Too</button>
```

```javascript
var btn = document.querySelector('#btn');
btn.addEventListener('click', (e) => {
  alert(e.target.tagName);
});
```

Now, we maintain separation of concerns, and we also allow multiple event listeners if need arise. Great!

There's some important things taking place here. That `e` being passed into our event listener callback, references the event itself. In the example, it's a click event. That event has a whole bundle of properties that we won't be discussing right now, but you're strongly encouraged to check out the links below for further study. The property we use in the example, is the "target" property. That's the element being clicked. Common practice is to call that event either "e" or "event" in your callback.

#### Attaching listeners to groups of nodes

This might seem like a lot of code if you're attaching lots of similar event listeners to many elements. There's a few ways to go about doing that more efficiently.

We want to create an alert when the buttons are clicked. We'll try first by iterating over a group of elements.

```javascript
<div id="container">
    <button id="1">Click Me</button>
    <button id="2">Click Me</button>
    <button id="3">Click Me</button>
</div>
```

```javascript
var buttons = document.querySelectorAll('button');
buttons.forEach((button) => {
  button.addEventListener('click', (e) => {
    alert(button.id);
  });
});
```

This works just fine, but an easier solution would be to utilize the "bubbling" mechanic of event propagation. Everytime a event fires, it potentially goes through 3 phases:

1. Capture Phase - the event checks all nodes along the branch from the window all the way down to the event.target checking for additional listeners. *This phase is turned off by default*.
2. Target Phase - Checks event.target for an event listener.
3. Bubbling Phase - The event checks all the nodes along the branch from the event.target all the way up to the window or root. *It "bubbles" to the top*.

So how can we utilize this in our example? 

```javascript
var container = document.querySelector('#container');
container.addEventListener('click', (e) => {
  if (e.target.tagName !== 'BUTTON') return;
  alert(e.target.id);
});
```

With a simple equality check, we can put 1 event listener on the parent (or any ancestor really), and allow the event to bubble up to that listener. This technique is called "event delegation". You can read more about it [here](https://javascript.info/event-delegation).

-----

This is just the tip of the iceberg when it comes to DOM manipulation and event handling, but I think it's enough to get you started with some exercises.

### Exercises

#### JavaScript Drum Kit:

We'll be doing the first exercise in Wes Bos's JavaScript30 program. You'll need to clone the repo at https://github.com/wesbos/JavaScript30. Check out the [Video Tutorial](https://www.youtube.com/watch?v=VuN8qwZoego) for instructions on the project. When you've completed the Drum Kit exercise, you can move on to the next section.

### Additional Resources

* [Eloquent JS - DOM](http://eloquentjavascript.net/13_dom.html)
* [Eloquent JS - Handling Events](http://eloquentjavascript.net/14_event.html)
* [DOM Enlightenment](http://domenlightenment.com/)
* [JavaScript30](https://JavaScript30.com)
* If you've already learned jQuery then [this website](https://plainjs.com/javascript/) will help you figure out how to do things without it.
