### Introduction

One of the most unique and useful abilities of JavaScript is its ability to manipulate the DOM. But what _is_ the DOM, and how do we go about changing it? Let's jump right in...

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

* Explain what the DOM is in relation to a webpage.
* Explain the difference between a "node" and an "element".
* Explain how to target nodes with "selectors".
* Explain the basic methods for finding/adding/removing and altering DOM nodes.
* Explain the difference between a "nodelist" and an "array of nodes".
* Explain what "bubbling" is and how it works.

### DOM - Document Object Model


The DOM \(or Document Object Model\) is a tree-like representation of the contents of a webpage -  a tree of "nodes" with different relationships depending on how they're arranged in the HTML document.


~~~html
<div id="container">
  <div class="display"></div>
  <div class="controls"></div>
</div>
~~~


In the above example, the `<div class="display"></div>` is a "child" of `<div id="container"></div>` and a sibling to `<div class="controls"></div>`. Think of it like a family tree. `<div id="container"></div>`  is a __parent__, with its __children__ on the next level, each on their own "branch".

### Targeting Nodes with Selectors

When working with the DOM, you use "selectors" to target the nodes you want to work with. You can use a combination of CSS-style selectors and relationship properties to target the nodes you want. Let's start with CSS-style selectors. In the above example, you could use the following selectors to refer to `<div class="display"></div>`:

* div.display
* .display
* \#container &gt; .display
* div\#container &gt; div.display

You can also use relational selectors \(i.e. `firstElementChild` or `lastElementChild` etc.\) with special properties owned by the nodes.

~~~JavaScript
const container = document.querySelector('#container');
// select the #container div (don't worry about the syntax, we'll get there)

console.dir(container.firstElementChild);                      
// select the first child of #container => .display

const controls = document.querySelector('.controls');   
// select the .controls div

console.dir(controls.previousElementSibling);                  
// selects the prior sibling => .display
~~~

So you're identifying a certain node based on its relationships to the nodes around it.

### DOM methods

When your HTML code is parsed by a web browser, it is converted to the DOM as was mentioned above.  One of the primary differences is that these nodes are objects that have many properties and methods attached to them.  These properties and methods are the primary tools we are going to use to manipulate our webpage with JavaScript. We'll start with the query selectors - those that help you target nodes.

#### Query Selectors

* _element_.querySelector\(_selector_\) returns reference to the first match of _selector_
* _element_.querySelectorAll\(_selectors_\) returns a "nodelist" containing references to all of the matches of the _selectors_

\*_There are several other, more specific queries, that offer potential \(marginal\) performance benefits, but we won't be going over them now._

It's important to note that when using querySelectorAll, the return value is **not** an array. It looks like an array, and it somewhat acts like an array, but it's really a "nodelist". The big distinction is that several array methods are missing from nodelists. One solution, if problems arise, is to convert the nodelist into an array. You can do this with Array.from\(\) or the [spread operator.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator)

#### Element Creation

* document.createElement\(tagName, \[options\]\) creates a new element of tag type tagName.  `[options]` in this case means you can add some optional parameters to the function.  Don't worry about these at this point.

~~~JavaScript
const div = document.createElement('div');
~~~

This function does NOT put your new element into the DOM - it simply creates it in memory.  This is so that you can manipulate the element (by adding styles, classes, ids, text etc.) before placing it on the page. You can place the element into the DOM with one of the following methods.

#### Append Elements

* _parentNode_.appendChild\(_childNode_\) appends _childNode_ as the last child of _parentNode_
* _parentNode_.insertBefore\(_newNode_, _referenceNode_\) inserts _newNode_ into _parentNode_ before _referenceNode_

#### Remove Elements

* _parentNode_.removeChild\(_child_\) removes _child_ from _parentNode_ on the DOM and returns reference to _child_

#### Altering Elements

When you have a reference to an element, you can use that reference to alter the element's own properties. This allows you to do many useful alterations, like adding/removing and altering attributes, changing classes, adding inline style information and more.

~~~JavaScript
const div = document.createElement('div');                     
// create a new div referenced in the variable 'div'
~~~

#### Adding inline style

~~~JavaScript
div.style.color = 'blue';                                      
// adds the indicated style rule

div.style.cssText = 'color: blue; background: white';          
// adds several style rules

div.setAttribute('style', 'color: blue; background: white');    
// adds several style rules
~~~

See DOM Enlightenment's [section on CSS Style rules](http://domenlightenment.com/#6.2) for more info on inline styles.

Note that if you're accessing a kebab-cased css rule from JS, you'll either need to use camelcase or you'll need to use bracket notation instead of dot notation.

~~~JavaScript
div.style.background-color // doesn't work - attempts to subtract color from div.style.background
div.style.backgroundColor // accesses the divs background-color style
div.style['background-color'] // also works
div.style.cssText = "background-color: white" // ok in a string
~~~

#### Editing Attributes

~~~JavaScript
div.setAttribute('id', 'theDiv');                              
// if id exists update it to 'theDiv' else create an id
// with value "theDiv"

div.getAttribute('id');                                        
// returns value of specified attribute, in this case
// "theDiv"

div.removeAttribute('id');                                     
// removes specified attribute
~~~

See MDNs section on [HTML Attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes) for more info on available attributes.

#### Working with classes

~~~JavaScript
div.classList.add('new');                                      
// adds class "new" to your new div

div.classList.remove('new');                                   
// remove "new" class from div

div.classList.toggle('active');                                
// if div doesn't have class "active" then add it, or if
// it does, then remove it
~~~

It is often standard \(and more clean\) to toggle a CSS style rather than adding and removing inline CSS.

#### Adding text content

~~~JavaScript
div.textContent = 'Hello World!'                               
// creates a text node containing "Hello World!" and
// inserts it in div
~~~

#### Adding HTML content

~~~JavaScript
div.innerHTML = '<span>Hello World!</span>';                   
// renders the html inside div
~~~

\*_Note that textContent is preferable for adding text, and innerHTML should be used sparingly as it can create security risks if misused. Check out [this video](https://www.youtube.com/watch?v=ns1LX6mEvyM&ab_channel=WebDevSimplified) if you want to see an example of how._

Let's take a minute to review what we've covered and give you a chance to practice this stuff before moving on.  Check out this example of creating and appending a DOM element to a webpage.

~~~html
<!-- your html file: -->
<body>
  <h1>
    THE TITLE OF YOUR WEBPAGE
  </h1>
  <div id="container"></div>
</body>
~~~

~~~javascript
// your javascript file
const container = document.querySelector('#container');

const content = document.createElement('div');
content.classList.add('content');
content.textContent = 'This is the glorious text-content!';

container.appendChild(content);
~~~

In the JavaScript file, first we get a reference to the `container` div that already exists in our HTML.  Then we create a new div and store it in the variable `content`.  We add a class and some text to the `content` div and finally append that div to `container`.   All in all it's a simple process.  After the JavaScript code is run, our DOM tree will look like this:

~~~html
<!-- The DOM -->
<body>
  <h1>
    THE TITLE OF YOUR WEBPAGE
  </h1>
  <div id="container">
  	<div class="content">
      This is the glorious text-content!
    </div>
  </div>
</body>
~~~

Keep in mind that the JavaScript does _not_ alter your HTML, but the DOM - your HTML file will look the same, but the JavaScript changes what the browser renders.

> **Important note:**
> Your JavaScript, for the most part, is run whenever the JS file is run, or when the script tag is encountered in the HTML. If you are including your JavaScript at the top of your file, many of these DOM manipulation methods will not work because the JS code is being run *before* the nodes are created in the DOM. The simplest way to fix this is to include your JavaScript at the bottom of your HTML file so that it gets run after the DOM nodes are parsed and created.

### Exercise

Copy the example above into files on your own computer.  To make it work you'll need to supply the rest of the HTML skeleton and either link your javascript file, or put the javascript into a script tag on the page.  Make sure everything is working before moving on!

Add the following elements to the container using ONLY javascript and the DOM methods shown above.

1. a `<p>` with red text that says "Hey I'm red!"
2. an `<h3>` with blue text that says  "I'm a blue h3!"
3. a `<div>` with a black border and pink background color with the following elements inside of it:
   1. another `<h1>` that says "I'm in a div"
   2. a `<p>` that says "ME TOO!"
   3. Hint for this one: after creating the div with createElement, append the `<h1>` and `<p>` to it before adding it to the container.

### Events

Now that we have a handle on manipulating the DOM with JavaScript, the next step is learning how to make that happen dynamically, or on demand!  Events are how you make that magic happen on your pages.  Events are actions that occur on your webpage such as mouse-clicks or keypresses, and using JavaScript we can make our webpage listen and react to these events.

There are three primary ways to go about this: you can attach functions attributes directly on your HTML elements, you can set the "on_event_" property on the DOM object in your JavaScript, or you can attach event listeners to the nodes in your JavaScript.  Event listeners are definitely the preferred method, but you will regularly see the others in use, so we're going to cover all three.

We're going to create 3 buttons that all alert "Hello World" when clicked.  Try them all out using your own HTML file, or using something like [CodePen](https://codepen.io/).

#### method 1

~~~html
<button onclick="alert('Hello World')">Click Me</button>
~~~

This solution is less than ideal because we're cluttering our HTML with JavaScript. Also, we can only have 1 "onclick" event per element.

#### method 2

~~~HTML
<!-- the html file -->
<button id="btn">Click Me</button>
~~~

~~~JavaScript
// the JavaScript file
const btn = document.querySelector('#btn');
btn.onclick = () => alert("Hello World");
~~~

#### \(need to review arrow functions? [LINK](http://javascript.info/arrow-functions-basics)\)

This is a little better. We've moved the JS out of the HTML and into a JS file, but we still have the problem that a DOM element can only have 1 "onclick" property.

#### method 3

~~~html
<!-- the html file -->
<button id="btn">Click Me Too</button>
~~~

~~~JavaScript
// the JavaScript file
const btn = document.querySelector('#btn');
btn.addEventListener('click', () => {
  alert("Hello World");
});
~~~

Now, we maintain separation of concerns, and we also allow multiple event listeners if the need arises.  Method 3 is much more flexible and powerful, though it is a bit more complex to set up.

Note that all 3 of these methods can be used with named functions like so:

~~~html
<!-- the html file -->
<!-- METHOD 1 -->
<button onclick="alertFunction()">CLICK ME BABY</button>
~~~

~~~javascript
function alertFunction() {
  alert("YAY! YOU DID IT!");
}

// METHOD 2
btn.onclick = alertFunction;

// METHOD 3
btn.addEventListener('click', alertFunction);
~~~

Using named functions can clean up your code considerably, and is a _really_ good idea if the function is something that you are going to want to do in multiple places.

With all three methods we can access more information about the event by passing a parameter to the function that we are calling.  Try this out on your own machine:

~~~javascript
btn.addEventListener('click', function (e) {
  console.log(e);
});
~~~
\*_Note that `function (e)` is a callback from addEventListener. Further explanation of callbacks can be found [HERE](https://briggs.dev/blog/understanding-callbacks)._

The `e` in that function is an object that references the __event__ itself.  Within that object you have access to many useful properties and functions such as which mouse button or key was pressed, or information about the event's __target__ - the DOM node that was clicked.

Try this:

~~~javascript
btn.addEventListener('click', function (e) {
  console.log(e.target);
});
~~~

and now this:

~~~javascript
btn.addEventListener('click', function (e) {
  e.target.style.background = 'blue';
});
~~~

pretty cool eh?

#### Attaching listeners to groups of nodes

This might seem like a lot of code if you're attaching lots of similar event listeners to many elements. There's a few ways to go about doing that more efficiently.  We learned above that we can get a nodelist of all of the items matching a specific selector with `querySelectorAll('selector')`.  In order to add a listener to each of them we simply need to iterate through the whole list like so:

~~~HTML
<div id="container">
    <button id="1">Click Me</button>
    <button id="2">Click Me</button>
    <button id="3">Click Me</button>
</div>
~~~

~~~JavaScript
// buttons is a node list. It looks and acts much like an array.
const buttons = document.querySelectorAll('button');

// we use the .forEach method to iterate through each button
buttons.forEach((button) => {

  // and for each one we add a 'click' listener
  button.addEventListener('click', () => {
    alert(button.id);
  });
});
~~~

This is just the tip of the iceberg when it comes to DOM manipulation and event handling, but it's enough to get you started with some exercises.  In our examples so far we have been using the 'click' event exclusively, but there are _many_ more available to you.  

Some useful events include:

- click
- dblclick
- keypress
- keydown
- keyup

You can find a more complete list with explanations of each event on [this page](https://www.w3schools.com/jsref/dom_obj_event.asp).

### Practice

Manipulating web pages is the primary benefit of the JavaScript language!  These techniques are things that you are likely to be messing with _every day_ as a front-end developer, so let's practice!

1. Do the first exercise in Wes Bos's JavaScript30 program by cloning the repo at [https://github.com/wesbos/JavaScript30](https://github.com/wesbos/JavaScript30). Check out the [Video Tutorial](https://www.youtube.com/watch?v=VuN8qwZoego) for instructions on the project.
2. Go back to your "Rock Paper Scissors" game from a previous lesson and give it a simple UI so that the player can play the game by clicking on buttons rather than typing their answer in a prompt.
   1. Copy your original code into a new file so you don't lose it.
   2. For now, remove the logic that plays exactly five rounds.
   3. Create three buttons, one for each selection.  Add an event listener to the buttons that calls your `playRound` function with the correct `playerSelection` every time a button is clicked.  (you can keep the console.logs for this step)
   4. Add a `div` for displaying results and change all of your `console.log`s into DOM methods.
   5. Display the running score, and announce a winner of the game once one player reaches 5 points.
   6. You will likely have to refactor (rework/rewrite) your original code to make it work for this.  That's OK!  Reworking old code is an important part of the programmer's life.
   7. Don't forget to go back and add your new version to the original Rock Paper Scissors Project!
3. Watch the [Event Capture, Propagation and Bubbling video](https://www.youtube.com/watch?v=F1anRyL37lE) from Wes Bos's JavaScript30 program. If you want to code along with the video, you can use the contents of folder #25 from the repo you cloned above. 

### Additional Resources

* [Eloquent JS - DOM](http://eloquentjavascript.net/13_dom.html)
* [Eloquent JS - Handling Events](http://eloquentjavascript.net/14_event.html)
* [DOM Enlightenment](http://domenlightenment.com/)
* [JavaScript30](https://JavaScript30.com)
* [Plain JavaScript](https://plainjs.com/javascript/) is a reference of JavaScript code snippets and explanations involving the DOM, as well as other aspects of JS. If you've already learned jQuery, it will help you figure out how to do things without it.
* This [W3Schools](https://www.w3schools.com/js/js_htmldom.asp) article offers simple and easy-to-understand lessons on DOM.
* [JS DOM Crash Course](https://www.youtube.com/watch?v=0ik6X4DJKCc&list=PLillGF-RfqbYE6Ik_EuXA2iZFcE082B3s) is an extensive and well explained 4 part video series on the DOM by Traversy Media.
* [Understanding The Dom](https://www.digitalocean.com/community/tutorial_series/understanding-the-dom-document-object-model) is an aptly named article-based tutorial series by Digital Ocean.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* What is the DOM?
* How do you target the nodes you want to work with?
* How do you create an element in the DOM?
* How do you add an element to the DOM?
* How do you remove an element from the DOM?
* How can you alter an element in the DOM?
* When adding text to a DOM element, should you use textContent or innerHTML? Why?
* Where should you include your Javascript tag in your HTML file when working with DOM nodes?
* How do "events" and "listeners" work?
* What are three ways to use events in your code?
* Why are event listeners the preferred way to handle events?
* What are the benefits of using named functions in your listeners?
* How do you attach listeners to groups of nodes?
* What is the difference between the return values of `querySelector` and `querySelectorAll`?
* What does a "nodelist" contain?
* Explain the difference between "capture" and "bubbling".
