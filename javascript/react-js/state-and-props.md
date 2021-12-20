### Introduction

The last lesson was a lot of theory, but there is just a little bit more you have to learn in order to write your first React application. If you've done all the steps in the previous lesson, you should now have a great foundation for the concepts you will learn next. Make sure to pay close attention to this lesson because it covers two of the most important features of React.

Let's dive right into it. Feel free to code along with this lesson. Typing the code out will help you remember it significantly better.

### Learning Outcomes
By the end of this lesson, you should be able to:

- Demonstrate how to pass functions, state, or other values between components as `props`
- Describe the purpose of `state` in a React component
- Explain the importance of using `setState()` instead of mutating state directly
- Differentiate between class and functional components and the syntax with which they use props
- Demonstrate how to attach event listeners to elements in React components

### Props

In the previous lesson, you learned a lot about components and how to structure your application in a "React way". But how do we share values or even functionality between those components? Yes, you guessed it right, the answer is `props`. Props are one of the two major pillars of React, the very heart of what the framework was built on.

Let's take the following example:

~~~javascript
// MyComponent.js

import React, { Component } from 'react';

class MyComponent extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>{this.props.title}</h1>
      </div>
    );
  }
}

export default MyComponent;
~~~

~~~javascript
// App.js

import React, { Component } from 'react';
import MyComponent from './MyComponent';

class App extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <MyComponent title="React" />
      </div>
    );
  }
}

export default App;
~~~

Let's take a look at what is happening here. Above, there are two components, `MyComponent` and `App`. As you can see, `MyComponent` is imported into `App`, and then rendered as a child component of `App`. In the JSX where we implement `MyComponent`, we also pass down a property called `title`. This syntax should look familiar to you: it's the same way we assign attributes to HTML elements. In this specific example, we assign a "prop" (short for _property_, as in an object property) called `title` which we set to the value `"React"`. In `MyComponent`, we can access this "prop" from within `MyComponent` with the syntax `this.props.title`. This technique is called "passing props."

_IMPORTANT_: Make sure you pass `props` to the constructor of the child component (`MyComponent`) as well as the `super()` method, otherwise you will not be able to access `this.props.title` in `MyComponent`. You might be confused by this keyword since you may not yet have encountered it, but don't worry. For right now it's enough to just know that you **must** use it for your React component to function correctly. If you're really curious about what `super` actually does, [check out the docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/super).

Now, you might be wondering how props work with functions. Believe it or not, they work the same way!

~~~javascript
// MyComponent.js

import React, { Component } from 'react';

class MyComponent extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>{this.props.title}</h1>
        <button onClick={this.props.onButtonClicked}>Click Me!</button>
      </div>
    );
  }
}

export default MyComponent;
~~~

~~~javascript
// App.js

import React, { Component } from 'react';
import MyComponent from './MyComponent';

class App extends Component {
  constructor(props) {
    super(props);

    this.onClickBtn = this.onClickBtn.bind(this);
  }

  onClickBtn() {
    console.log('Button has been clicked!');
  }

  render() {
    return (
      <div>
        <MyComponent title="React" onButtonClicked={this.onClickBtn} />
      </div>
    );
  }
}

export default App;
~~~

Ok, there is a little bit more going on here, but in the end, it works exactly as in the example before. First, there is `MyComponent`, which is essentially the same except one key difference: `{this.props.onButtonClicked}` is assigned to the `onClick` event of the component. Essentially, what this means is:

- Our `MyComponent` component is expecting a prop to be passed into it named `onButtonClicked`
- The value of that prop should be some kind of function
- We want this function to be attached to the click event of our button.

**Special note 1:** In React, instead of using `addEventListener` to add event listeners, we assign them right in the JSX. Unlike adding them in HTML, these attributes must be camelCased! You can view a list of all supported events [here](https://reactjs.org/docs/events.html).

**Special note 2:** Did you notice how the function `this.props.onButtonClicked` was wrapped in curly braces? This is because JSX needs a way of knowing when you are using JavaScript, otherwise it will try to transpile your code into HTML elements, text nodes, or strings (or throw an error in some cases). In this case, we are referring to a JavaScript object property, which technically qualifies as "using JavaScript," so we must wrap it in curly braces.

Now onto the `App` component. First, we defined the method `onClickBtn` above the `render` method. After that, we passed this function down to our `MyComponent` as a prop, which we named `onButtonClicked` (of course, you could also name it `onClickBtn` and then use that function in `MyComponent.js` with the name of `onClickBtn`, but we wanted to emphasize that you can rename the functions when passing them around as props). We do that in the same way that we passed the title value previously, except instead of passing a string, we're just passing a function (and using curly braces to do so because it's a JavaScript variable).

Now the only thing we have to do is bind the method to `this`; we do that in the constructor method at the top of our component but below the `super()` call. The reason we have to bind the `this` keyword when passing a function to another component is that it needs to stay in the same context in which it was declared. Always remember: you **must** bind `this` for all methods in **class components** when passing them to other components.

As you can see when you are passing many properties or functions to a component, it can get quite exhausting to always refer to them with `this.props.someProperty`. [Destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment) to the rescue! We can alternatively write the above as follows:

~~~javascript
// MyComponent.js

import React, { Component } from 'react';

class MyComponent extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { title, onButtonClicked } = this.props;

    return (
      <div>
        <h1>{title}</h1>
        <button onClick={onButtonClicked}>Click Me!</button>
      </div>
    );
  }
}

export default MyComponent;
~~~

Here, we are destructuring `title` and `onButtonClicked` from `this.props`, which lets us refer to them with just their names. Make sure to destructure within the render method when using class components. In functional components, you would destructure outside of the return statement or inside the parameter parentheses of the functional component (more on those later).

Great! Hopefully, you have a better understanding of the purpose and usage of `props` in React. Not too shabby! At this point, if you're feeling overwhelmed, don't fret! Once you start using props in your projects, you'll understand them much better. Soon enough, you'll be a props master!

### State

The other main pillar of React is `state`. State is simply what we use to handle values that can change over time. For example, consider a very simple application that has a button and a counter. When the user clicks the button, the counter is incremented by 1. Since `count` will need to change on every click, we want to hold that value in `state`.

The following example of our simple counter app shows how to define `state` in React:

~~~javascript
import React, { Component } from 'react';

class App extends Component {
  constructor() {
    super();

    this.state = {
      count: 0,
    };

    this.countUp = this.countUp.bind(this);
  }

  countUp() {
    this.setState({
      count: this.state.count + 1,
    });
  }

  render() {
    return (
      <div>
        <button onClick={this.countUp}>Click Me!</button>
        <p>{this.state.count}</p>
      </div>
    );
  }
}
~~~

In the above component, we declared our state as an object with a property `count` set to an initial value of `0`. You **always** declare state in the constructor of a class component. Once again, this will work differently when we cover functional components later. The `setState` method we call inside the `countUp` method sets the state to a new value.

**IMPORTANT:** In React, state should be treated as **immutable**. This means you should **never** change state directly (i.e. without using `setState`) because it can lead to unexpected behavior or bugs.

In other words, you should never do something like: `this.state.count = 3`, or, `this.state.count++`. Instead, always use the [setState](https://reactjs.org/docs/react-component.html#setstate) method React provides to class components to modify the state. Keep this in mind - it can save you a lot of debugging when you are getting started with React. [This article](http://web.archive.org/web/20211101150139/https://lorenstewart.me/2017/01/22/javascript-array-methods-mutating-vs-non-mutating/) does a great job analyzing many popular JavaScript methods concerning mutability. Take some time to read it so you can understand how easy it can be to accidentally mutate state.

As we mentioned before, our `countUp()` method needs to be bound in our constructor (using `bind`), so it knows what context to operate in. This is a result of how `this` works in JavaScript, see [this article](https://www.freecodecamp.org/news/this-is-why-we-need-to-bind-event-handlers-in-class-components-in-react-f7ea1a6f93eb/) for a great explanation on why _this_ is the case.

In the `render` method, we access the current state through `this.state.count`. This syntax should look familiar to you by now because it is the same way we accessed props. And yes, you can also destructure state.

### What about passing state as a prop? Is that even legal?

Yes! One of the greatest and most powerful features of React is the ability to pass one component's state down to multiple children. When that piece of state is changed, each child component that uses it is automatically re-rendered with the new value!

Consider a webpage such as a forum where the "main" component of the site (we'll call that component `Forum`) needed to know the user's username so that when they are viewing a post or reply they wrote, the author is shown as "me" instead of "user123". You'd probably want to keep that username as a piece of data in `state` so each user that visited the site and logged in could have this functionality. Now let's say on that same site, you want the login button on the navigation bar to change into the user's username to visually indicate to them that they are logged in. Instead of keeping this piece of state in both the `NavBar` and `Forum` component, we can keep it in their parent, `App`, and pass it down as a prop to both like so:

~~~javascript
// in the render method of App.js
return (
  <div>
    <NavBar username={this.state.username} />
    <Forum username={this.state.username} />
    <Footer />
  </div>
);
~~~

Now, when the user logs in, both the `NavBar` and `Forum` components will update, but the `Footer` component (which doesn't need to know about that data) will not re-render. Pretty cool, right?

### State and props in functional components

As we learned in the previous lesson, and repeatedly made reference to in this lesson, React provides the ability to create components as _functions_ instead of classes. We call these functional components. They use somewhat different syntax than the class components we've discussed thus far, but they essentially do that same thing. In functional components, we don't pass `props` as an argument to the constructor, but instead just pass it as an argument to the component itself. Another major difference between functional and class components concerning props is the way you reference the props. You learned that in a class component, the props that have been passed down from the parent component can be used with this syntax: `this.props.someFunction`, however in functional components, we don't need to reference `this`, so we access `props` simply with: `props.someFunction`. That's the main difference with `props` between class and functional components. Let consider a quick example to solidify this:

~~~javascript
// MyComponent.js

import React from 'react';

function MyComponent(props) {
  return <div>{props.title}</div>;
}

export default MyComponent;
~~~

~~~javascript
// App.js

import React from 'react';
import MyComponent from './MyComponent';

function App() {
  return (
    <div>
      <MyComponent title="Hello World" />
    </div>
  );
}

export default App;
~~~

Of course, we can also destructure from props here. By adding the line `const {title} = props` above the return statement in `MyComponent.js` we can just refer to the title using `{title}`. Or, we can skip that line of code altogether if we destructure the prop inside the parameter parentheses like so:

~~~javascript
function MyComponent({ title }) {
  // rest of code
}
~~~

Using state in functional components is a bit different. Before the end of 2018, developers were not able to access state in functional components at all. Functional components were therefore just used for returning JSX logic with props. However, with the introduction of **React Hooks**, this changed. Now we can set and access state in functional components, and in the modern React landscape, they are often preferred over class components. React developers will be exposed to both kinds of components on the job, so it's imperative for us to be very familiar with both. The way React hooks work is the topic of one of the following lessons, so don't worry about it right now. We are setting you up to say "Hey! I remember that" when it's introduced.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Go to the React homepage and go through the [props section](https://reactjs.org/docs/components-and-props.html) again. Also, check out the next article, which talks about State and Lifecycle Methods. Don't worry about the lifecycle methods for now, we will discuss them in a future lesson. However, if you are excited and want to learn more, feel free to explore that on your own.
2. Starting with [this lesson on props,](https://www.geeksforgeeks.org/reactjs-props-set-1/) continue through each of the lessons relating to state and props to build a good foundation for the upcoming lessons. Once again, you're welcome to explore more on your own if you wish.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [This course](https://scrimba.com/g/glearnreact) is a great way to get more familiar with all basic concepts of React in a very short time.
- An [article](https://reactjs.org/docs/thinking-in-react.html) by the React team on the thought process that should go into the developer's minds while building a React based application.

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="#props">How do you pass functions, state, or other values between components?</a>
- <a class="knowledge-check-link" href="#state">What is the purpose of `state` in a React component?</a>
- <a class="knowledge-check-link" href="https://reactjs.org/docs/react-component.html#setstate">Explain the importance of using `setState()` instead of mutating state directly?</a>
- <a class="knowledge-check-link" href="#state-and-props-in-functional-components">What is the difference between functional and class components and how does their syntax for handling props differ?</a>
- <a class="knowledge-check-link" href="https://reactjs.org/docs/events.html">How do you attach event listeners to elements in React components?</a>
