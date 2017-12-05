One of the most unique and useful abilities of JavaScript is it's ability to manipulate the DOM. But what _is_ the DOM, and how do we go about changing it? Let's jump right in...


### Points to Ponder
<details>
  <summary>What is DOM in relation to a webpage?</summary>

  * The Document Object Model is a tree-like representation of the contents on a webpage or document.

</details>

<details>
  <summary>What's the difference between a "node" and an "element"?</summary>

  * A "node" is any object in the DOM hierarchy while an "element" is _one specific_ node.
  * "Nodes" can include elements, text content inside an element, code comment blocks not visible to the user, the document itself and even abstract types like "fragments".

</details>

<details>
  <summary>How do you target nodes with "selectors"?</summary>

  * There are several ways, with CSS style-selectors, to target a node.
    * `<div class="display"></div>` can be selected as follows:
      * div
      * div.display
      * .display
    * There are also relational selectors such as `firstChild` or `lastSibling`.
  * Combined with "Query Selectors", this is how you can target a node using JavaScript
    * i.e. `document.querySelector(".display");` would select the div above.

      ​
</details>

<details>
  <summary>What are the basic methods for finding/adding/removing and altering DOM nodes?</summary>

  * As mentioned above, you can find nodes in the DOM using query selectors.
  * To create an element, use document.createElement(tagName[, options])
    * i.e. `const div = document.createElement('div');` will create a div element. However, this div has not been added to the webpage yet.
  * To append this element, use _parentNode_.appendChild\(_childNode_\) =&gt; => appends _childNode as the last child of _parentNode_.
    * i.e. `parentNode.appendChild(div);`
  * To remove this element, _parentNode_.removeChild\(_child_\) =&gt; removes _child_ from _parentNode_ on the DOM and returns reference to _child_.
    * i.e. `parentNode.removeChild(div);`
  * Once you have a reference to an element, as above, you can alter it in many ways.
    * `div.style.color = 'blue';` adds the indicated style rule 
    * `div.setAttribute('id', 'theDiv');` sets the id attribute of our div to 'theDiv'.

</details>

<details>
  <summary>What is the difference between a "nodelist" and an "array of nodes"?</summary>

  * A "nodelist" looks like an array, but it is missing several methods that come with an Array.
  * A solution to this problem is to use the spread operator or Array.from() to convert a nodelist into an array.

</details>

<details>
  <summary>How do "events" and "listeners" work? What are three ways to use events in your code?</summary>

  * "Events" are how you make your webpage dynamic. They are triggered by "listeners", and can fire when the page loads, when you click your mouse, when you push keys on your keyboard, and many, many more.
  * The three primary ways to use events are:
    * By attaching scripts to event attributes on elements in the HTML document.
      * `<button onclick="alert(this.tagName)">Click Me</button>`
    * By setting the "on_event_" property on the DOM object in your JavaScript.

        ```JavaScript
        // the html file
        <button id="btn">Click Me</button>
        ```

        ```JavaScript
        // the JavaScript file
        var btn = document.querySelector('#btn');
        btn.onclick = (e) => alert(e.target.tagName);
        ```

    * By attaching event listeners to the nodes in your JavaScript.


        ​```JavaScript
        // the html file
        <button id="btn">Click Me Too</button>
        ​```
        
        ​```JavaScript
        // the JavaScript file
        var btn = document.querySelector('#btn');
        btn.addEventListener('click', (e) => {
          alert(e.target.tagName);
        });
        ​```

</details>

<details>
  <summary>How does "bubbling" work?</summary>

  *  Bubbling is a form of "event propegation". It is an efficient method for firing an event on multiple elements -- starting from the innermost element -- and "bubbling" up to outer elements.

</details>

###  DOM - Document Object Model


The DOM \(or Document Object Model\) is a tree-like representation of the contents of a webpage -  a tree of "nodes" with different relationships depending on how they're arranged in the HTML document.


~~~html
<div id="container">
  <div class="display"></div>
  <div class="controls"></div>
</div>
~~~ 


In the above example, the `<div class="display"></div>` is a "child" of `<div id="container"></div>` and a sibling to `<div class="controls"></div>`. Think of it like a family tree. `<div id="container"></div>`  is a __parent__, with it's __children__ on the next level, each on their own "branch".

###  Targeting Nodes with Selectors

When working with the DOM, you use "selectors" to target the nodes you want to work with. You can use a combination of CSS-style selectors and relationship properties to target the nodes you want. Let's start with CSS-style selectors. In the above example, you could use the following selectors to refer to `<div class="display"></div>`:

* div.display
* .display
* container &gt; .display

* div\#container &gt; div.display

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

## DOM methods

When your HTML code is parsed by a web browser, it is converted to the DOM as was mentioned above.  One of the primary differences is that these nodes are objects that have many properties and methods attached to them.  These properties and methods are the primary tools we are going to use to manipulate our webpage with JavaScript. We'll start with the query selectors - those that help you target nodes.

#### Query Selectors

* _element_.querySelector\(_selector_\) returns reference to the first match of _selector_
* _element_.querySelectorAll\(_selectors_\) returns a "nodelist" containing references to all of the matches of the _selectors_
  \*_There are several other, more specific queries, that offer potential \(marginal\) performance benefits, but we won't be going over them now._

It's important to note that when using querySelectorAll, the return value is **not** an array. It looks like an array, and it somewhat acts like an array, but it's really a "nodelist". The big distinction is that several array methods are missing from nodelists. One solution, if problems arise, is to convert the nodelist into an array. You can do this with Array.from\(\) or the [spread operator.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator)

#### Element Creation

* document.createElement\(tagName\[, options\]\) creates a new element of tag type tagName.  `[options]` in this case means you can add some optional parameters to the function.  Don't worry about these at this point.

```JavaScript
const div = document.createElement('div');
```

This function does NOT put your new element into the DOM - it simply creates it in memory.  This is so that you can manipulate the element (by adding styles, classes, ids, text etc.) before placing it on the page. You can place the element into the DOM with one of the following methods.

#### Append Elements

* _parentNode_.appendChild\(_childNode_\) appends _childNode_ as the last child of _parentNode_
* _parentNode_.insertBefore\(_newNode_, _referenceNode_\) inserts _newNode_ into _parentNode_ before _referenceNode_

#### Remove Elements

* _parentNode_.removeChild\(_child_\) removes _child_ from _parentNode_ on the DOM and returns reference to _child_

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

Let's take a minute to review what we've covered and give you a chance to practice this stuff before moving on.  Check out this example of creating and appending a DOM element to a webpage.

```html
// your html file:
<body>
  <h1>
    THE TITLE OF YOUR WEBPAGE
  </h1>
  <div id="container"></div>
</body>
```

```javascript
// your javascript file
const container = document.querySelector('#container');

const content = document.createElement('div');
content.classList.add('content');
content.textContent = 'This is the glorious text-content!';

container.appendChild(content);
```

In the JavaScript file, first we get a reference to the `container` div that already exists in our HTML.  then we create a new div and store it in the variable `content`.  We add a class and some text to the `content` div and finally append that div to `content`.   All in all it's a simple process.  After the JavaScript code is run, our DOM tree will look like this:

```html
// The DOM
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
```

Keep in mind that the JavaScript does _not_ alter your HTML, but the DOM - your HTML file will look the same, but the JavaScript changes what the browser renders.

### Exercise

Copy the example above into files on your own computer.  To make it work you'll need to supply the rest of the HTML skeleton and either link your javascript file, or put the javascript into a script tag on the page.  Make sure everything is working before moving on!

Add the following elements to the container using ONLY javascript - do not add any HTML or CSS code.

1. a `<p>` with red text that says "Hey I'm red!"
2. an `<h3>` with blue text that says  "I'm a blue h3!"
3. a `<div>` with a black border and pink background color with the following elements inside of it:
   1. another `<h1>` that says "I'm in a div"
   2. a `<p>` that says "ME TOO!"
   3. Hint for this one: after creating the div with createElement, append the `<h1>` and `<p>` to it before adding it to the container.

## Events

Now that we have a handle on manipulating the DOM with JavaScript, the next step is learning how to make that happen dynamically, or on demand!  Events are how you make that magic happen on your pages.  Events are actions that occur on your webpage such as mouse-clicks or keypresses, and using JavaScript we can make our webpage listen and react to these events.

There are three primary ways to go about this: you can attach functions attributes directly on your HTML elements, you can set the "on_event_" property on the DOM object in your JavaScript, or you can attach event listeners to the nodes in your JavaScript.  Event listeners are definitely the preferred method, but you will regularly see the others in use, so we're going to cover all three.

We're going to create 3 buttons that all alert "BUTTON" when clicked.  Try them all out using your own HTML file, or using something like [CodePen](https://codepen.io/).

#### method 1

```html
<button onclick="alert("Hello World")">Click Me</button>
```

This solution is less than ideal because we're cluttering our HTML with JavaScript. Also, we can only have 1 "onclick" event per element.

#### method 2

```HTML
// the html file
<button id="btn">Click Me</button>
```

```JavaScript
// the JavaScript file
var btn = document.querySelector('#btn');
btn.onclick = () => alert("Hello World");
```

###### \(need to review arrow functions? [LINK\)](http://javascript.info/function-expressions-arrows#arrow-functions)

This is a little better. We've moved the JS out of the HTML and into a JS file, but we still have the problem that a DOM element can only have 1 "onclick" property.

#### method 3

```html
// the html file
<button id="btn">Click Me Too</button>
```

```JavaScript
// the JavaScript file
var btn = document.querySelector('#btn');
btn.addEventListener('click', () => {
  alert("Hello World");
});
```

Now, we maintain separation of concerns, and we also allow multiple event listeners if need arise.  Method 3 is much more flexible and powerful, though it is a bit more complex to set up.

Note that all 3 of these methods can be used with named functions like so:

```html
// the html file
// METHOD 1
<button onclick="alertFunction()">CLICK ME BABY</button>
```

```javascript
function alertFunction() {
  alert("YAY! YOU DID IT!");
}

// METHOD 2
btn.onclick = alertFunction

// METHOD 3
btn.addEventListener('click', alertFunction);
```

Using named functions can clean up your code considerably, and is a _really_ good idea if the function is something that you are going to want to do in multiple places.

With all three methods we can access more information about the event by passing a parameter to the function that we are calling.  Try this out on your own machine:

```javascript
btn.addEventListener('click', function(e){
  console.log(e)
})
```

The `e` in that function is a object that references the __event__ itself.  Within that object you have access to many useful properties and functions such as which mouse button or key was pressed, or information about the event's __target__ - the DOM node that was clicked.

Try this:

```javascript
btn.addEventListener('click', function(e){
  console.log(e.target)
})
```

and now this:

```javascript
btn.addEventListener('click', function(e){
  e.target.style.background = 'blue'
})
```

pretty cool eh?

#### Attaching listeners to groups of nodes

This might seem like a lot of code if you're attaching lots of similar event listeners to many elements. There's a few ways to go about doing that more efficiently.  We learned above that we can get a nodelist of all of the items matching a specific selector with `querySelectorAll('selector')`.  In order to add a listener to each of them we simply need to iterate through the whole list like so:

```HTML
<div id="container">
    <button id="1">Click Me</button>
    <button id="2">Click Me</button>
    <button id="3">Click Me</button>
</div>
```

```JavaScript
// buttons is a node list. It looks and acts much like an array.
const buttons = document.querySelectorAll('button');

// we use the .forEach method to iterate through each button
buttons.forEach((button) => {
  
  // and for each one we add a 'click' listener
  button.addEventListener('click', (e) => {
    alert(button.id);
  });
});
```

This is just the tip of the iceberg when it comes to DOM manipulation and event handling, but it's enough to get you started with some exercises.  In our examples so far we have been using the 'click' event exclusively, but there are _many_ more available to you.  

Some useful events include:

- click
- dblclick
- keypress
- keydown
- keyup

You can find a more complete list with explanations of each event on [this page](https://www.w3schools.com/jsref/dom_obj_event.asp).

## Practice

Manipulating web pages is the primary benefit of the JavaScript language!  These techniques are things that you are likely to be messing with _every day_ as a front-end developer, so we're going to take time to practice using them.

### Warm Up

1. Do the first exercise in Wes Bos's JavaScript30 program by cloning the repo at [https://github.com/wesbos/JavaScript30](https://github.com/wesbos/JavaScript30). Check out the [Video Tutorial](https://www.youtube.com/watch?v=VuN8qwZoego) for instructions on the project.
2. Go back to your "Rock Paper Scissors" game from a previous lesson and give it a simple UI so that the player can play the game by clicking on buttons rather than typing their answer in a prompt.
   1. For each round display the user's selection, the computer's selection and the winner.
   2. Display the running score.
   3. You will likely have to refactor (rework/rewrite) your original code to make it work for this.  That's OK!  Reworking old code is an important part of the programmer's life.

### Project

In this project you'll be creating a pretty neat toy for your portfolio to flex your DOM manipulation skills.  You're going to build a browser version of something between a sketchpad and an Etch-A-Sketch.

This project should _not_ be easy for you.  You'll probably have to Google frequently to get the right JavaScript methods and CSS to use - in fact, that's the point!  You _can_ build this using the tools that you have already learned and there are plenty of resources on the net for learning stuff that we haven't covered yet if you decide you need it.  We'll walk you through the basic steps, but it will be up to you to actually implement them.

If you get totally stuck drop by the chatroom.. someone will be there to point you in the right direction.

1. [Follow the instructions atop Odin's Google Homepage project](https://www.theodinproject.com/courses/web-development-101/lessons/html-css) to setup a git repository for this project.
2. Create a webpage with a 16x16 grid of square divs
   1. Create the divs using JavaScript... don't try making them by hand with copy and pasting in your html file!
   2. Best to put your grid squares inside another "container" div \(that one can go directly in your html\)
   3. There are several different ways to make the divs appear as a grid \(verses just one on each line\) feel free to use any or play with each of them:
      1. float/clear
      2. inline-block
      3. flexbox
      4. CSS Grid
   4. Be careful with borders and margins, they can adjust the size of the squares!
   5. "OMG, Why isn't my grid being created???"
      1. Open your browser's developer tools
      2. Check if there are any errors in the JavaScript console
      3. Check your "elements" pane to see if the elements have actually shown up but are somehow hidden.
      4. Go willy-nilly and add  `console.log` statements in your JavaScript to see if it's actually being loaded.
3. Set up a "hover" effect so that the grid divs change color when your mouse passes over them, leaving a \(pixelated\) trail through your grid like a pen would.
   1. Hint: "hovering" is what happens when your mouse enters a div and ends when your mouse leaves it.. you can set up event listeners for either of those events as a starting point.
   2. There are multiple ways to change the color of the divs, including:
      1. adding a new class to the div
      2. changing the div's background color using JavaScript.
4. Add a button to the top of the screen which will clear the current grid and send the user a popup asking for how many squares per side to make the new grid.  Once entered the new grid should be generated _in the same total space as before_ \(e.g. 960px wide\) and now you've got a new sketch pad.
   1. Research `button` tags in HTML and how you can make a JavaScript function run when one is clicked.
   2. Also check out `prompt`s
   3. You should be able to enter `64` and have a brand new 64x64 grid pop up without changing the total amount of pixels used
5. \(Optional\): Instead of just changing the color of your grid from black to white \(for example\) have each pass through it with the mouse change to a completely random RGB value.   Then try having each pass just add another 10% of black to it so that only after 10 passes is the square completely black.
6. Push your project to GitHub!

### Additional Resources

* [Eloquent JS - DOM](http://eloquentjavascript.net/13_dom.html)
* [Eloquent JS - Handling Events](http://eloquentjavascript.net/14_event.html)
* [DOM Enlightenment](http://domenlightenment.com/)
* [JavaScript30](https://JavaScript30.com)
* If you've already learned jQuery then [this website](https://plainjs.com/javascript/) will help you figure out how to do things without it.



