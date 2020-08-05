### Introduction

Uff, the last lesson was a lot of theory. There is just a little bit more that you have to understand in order to write your first React application. If you've done the previous lesson, you should now have a great foundation for the next concepts that you will learn here. Make sure you pay good attention in this lecture, because it's one of the most important concepts to get you started with react.

Let's dive right into it, feel free to code along with this lesson. Typing the code out can help you remember it significantly better.

### Props

In the previous lesson you learned a lot about components and how to structure your application component-based. But well, how do we pass values or even functionality between those components. Yes you guessed it right, the answer is `props`.

Let's take the following example:

```javascript
// MyComponent.js

import React, { Component } from "react";

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
```

```javascript
// App.js

import React, { Component } from "react";
import MyComponent from "./MyComponent";

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
```

Ok, so what is happening here. Above, there are two components, one is the `MyComponent` and the other one is the `App` component. As you can see `MyComponent` is a child component from `App`, which passes down a property called `title`, in this specific example the title is set to "React". In `MyComponent` we can access the title (React) that has been passed down with the syntax `this.props.title`. The curly brackets around it are always needed when you write JavaScript in React.
_IMPORTANT_: Make sure you pass `props` to the constructor of the child component (MyComponent) as well as the `super()` method, otherwise you will not be able to access `this.props.title` in `MyComponent`

Now you might be wondering how this works with functions. Actually, it works exactly the same.

```javascript
// MyComponent.js

import React, { Component } from "react";

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
```

```javascript
// App.js

import React, { Component } from "react";
import MyComponent from "./MyComponent";

class App extends Component {
  constructor(props) {
    super(props);

    this.onClickBtn = this.onClickBtn.bind(this);
  }

  onClickBtn() {
    console.log("Button has been clicked!");
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
```

Ok there is a little bit more going on here, but in the end it works exactly as in the example before. First there is the `MyComponent`, which is essentially the same. The only thing we added is the `{ this.props.onButtonClicked }` as an `onClick` event to the component. With this syntax you are already familiar. Now to the `App` component. First we defined the function `onClickBtn` above the `render` method. After that, we passed this function down to our `MyComponent` as a property, which we named onButtonClicked (Of course you could name it also onClickBtn, and then use the function in `MyComponent.js` by the name of onClickBtn, but I wanted to emphasise that you can rename the functions when passing them around). We do that the same way we have passed the title value last time. Now the only thing we have to do is bind the method to `this`, we do that in the constructor method at the top of our component, but below the `super()` call. The reason we have to bind the `this` keyword when passing a function to another component is because it needs to stay in the same context. So remember, you have to bind `this` for all functions in all **class components** when passing them to other components.

As you can see when you are passing many properties or functions to a component it can get quite exhausting to always refere to them with `this.props.somePropery`. Destructuring for the rescue. We can aternatively write the above as follows:

```javascript
// MyComponent.js

import React, { Component } from "react";

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
```

Here we are destructuring `title` and `onButtonClicked` from `this.props`, which lets us refer to them with just their names. Make sure to destructure the render method when using class components. In functional components you would destructure outside of the return statement.

Great! So far so good, you hopefully have understood the purpose and usage of `props` in React. Isn't that difficult is it?!

### State

Another very important concept in React is state. In short, all values that can change over time are handled through state.

And that's the way to define `state` in React:

```javascript
import React, { Components } from "react";

class App extends Component {
  constructor() {
    super();

    this.state = {
      count: 0,
    };
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
```

In the above component we declared a state. You **always** declare state in the constructor in a class component. Remember that for functional components it works a little bit different. The `setState` method we call sets the state to a new value. In React state is **immutable**, this means you should **never** change state directly, because it can lead to unexpected behavior or bugs. What exactly does that mean? Never do something like this: `this.state.count = 3`, instead always use the `setState` method React provides you to modify the state. Really keep that in mind, it can save you a lot of debugging when you are getting started with React. Take a look at [this](https://lorenstewart.me/2017/01/22/javascript-array-methods-mutating-vs-non-mutating/) article, which does a great job in analyzing many popular javascript methods concerning mutability.

As you have also seen in the `render` method, we access the current state through `this.state.count`. This syntax should look familiar to you by now, because it is the same way we accessed props. And yes, you can also destructure state.

### State and props in functional components

As you have learned already, React also provides the ability to create functional components. And well, they work a little bit different than the class components we discussed most of the time. The concept of props basically works the same, with the only difference, you don't pass `props` as an argument to the constructor, but instead you pass it as an argument to the component itself. And another major difference between functional and class components concerning props is the way you call the props. You learned that in a class component the props that have been passed down from the parent component will be called like so: `this.props.someFunction`, however in functional components, we don't need to call `this`, so we access `props` like so: `props.someFunction`. And that's already the whole difference about `props` between class and functional components. Let me give you a quick example to emphasise this.

```javascript
// MyComponent.js

import React from "react";

const MyComponent = (props) => {
  return <div>{props.title}</div>;
};

export default MyComponent;
```

```javascript
// App.js

import React from "react";
import MyComponent from "./MyComponent";

const App = () => {
  return (
    <div>
      <MyComponent title="Hello World" />
    </div>
  );
};

export default App;
```

Of course we can also destructure from props here. By adding this line `const {title} = props` above the return statement in `MyComponent.js` we can just refere to the title using `{title}`

For the state in functional components it is a little bit different. Before the end of 2018 developers were actually not able to access state in functional components at all. Functional components were therefore just used for returning JSX logic. However with the introduction of **React Hooks** this has changed. Now we can set and access state also in functional components, and often they are now prefered over class components. The way Hooks work is the topic of one of the following lectures, so don't worry about it too much right now. Just keep in mind it's an amazing feature.

### Learning Outcomes

- How to pass functions, state or values between components
- How to handle state and props in a functional component
- How to handle state and props in a class component
- Understanding setState()

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Got to the React homepage and go through the props [section](https://reactjs.org/docs/components-and-props.html) again. Also check out the next article, which talkes about State and Lifecycle Methods. Don't worry about the Lifecycle methods for now we will discuss it in the upcoming lections. However, if you are excited and want to learn more, feel free to already check it out.
2. Go through [those](https://www.geeksforgeeks.org/reactjs-props-set-1/) lessons. There are a couple of them linked at the bottom of the page. Go through all the ones relating state and props, to build a good foundation for the upcoming lectures. Of course also feel free to go through the ones we haven't discussed here yet, it won't harm you.
</div>

### Additional Resources

- [This](https://scrimba.com/g/glearnreact) course is a great way to get more familiar with all basic concepts of React in a very short time.
