### Introduction

All the components so far have been functional in style and syntax. This is common now, but you will see a different `class` based syntax too. In this lesson, we explore how a class-based component is written and how concepts like props and state are used in one.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Learn the structure of a class component and how they are written.
- How to use props and state in class components.
- Highlight the uses of `this` in class components.

### Historical React component patterns

In your previous lessons, you have already been introduced to functional components, and the basic patterns in which components get written nowadays. However, React components did not look this way when React was introduced.

If you look into any older React codebase, you'll notice a lot of classes. These are known as class-based components. Prior to February 2019, functional components were also called state-less, as there was no way to manage state in them. This was changed when hooks were introduced, leading to less verbose and 'neater' components.

In your career, chances are, you will be dealing with legacy code, so there will be days where you would be dealing with class components. Let's peek into the intricacies of a class-based component, and how they work.

### Building a class component

As we already know about functional components, let us build a class-based component from a functional one. Usually, you will want to divide the contents of a component, like the one we use, into smaller, reusable components, but for the purposes of this exercise, we stick to one component. Below, we have a sample functional component:

~~~jsx
import React, { useState } from "react";

const FunctionalInput = ({ name }) => {
  const [todos, setTodos] = useState(["Just some demo tasks", "As an example"]);
  const [inputVal, setInputVal] = useState("");

  const handleInputChange = (e) => {
    setInputVal(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setTodos((todo) => [...todo, inputVal]);
    setInputVal("");
  };

  return (
    <section>
      <h3>{name}</h3>
      <form onSubmit={handleSubmit}>
        <label htmlFor="task-entry">Enter a task: </label>
        <input
          type="text"
          name="task-entry"
          value={inputVal}
          onChange={handleInputChange}
        />
        <button type="submit">Submit</button>
      </form>
      <h4>All the tasks!</h4>
      <ul>
        {todos.map((todo) => (
          <li key={todo}>{todo}</li>
        ))}
      </ul>
    </section>
  );
};

export default FunctionalInput;
~~~

That was a solid chunk of code. Take a while, sip some water and read it a couple of times.

#### The start of a class-based component

Now, let's try to recreate it as a class-based component. The first thing it should have is, _drumroll_, a class! But it cannot be just another class, it will need to have certain properties that qualifies it as a React component. React provides us with all those properties on a class called `Component`, and we can write our components by extending the given class, as shown below:

~~~jsx
import React, { Component } from "react";

class ClassInput extends Component {
  // Some code goes here
}

/*
  This can also be written as:

  import React from 'react';
  class ClassInput extends React.Component {}
  export default ClassInput;

  instead of destructuring the `Component` during import
*/

export default ClassInput;
~~~

#### The use of a constructor and props

A class is generally incomplete without a constructor, so let's add one.

The props, that get passed into this component, gets passed into the class's `constructor`. This, along with the `super` method, allows you to use the props in context to `this`, which, in _this_ case, refers to the component. If you’re really curious about what `super` actually does, [check out the docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/super).

If your component doesn't have any props, it is fine to leave the `constructor` and the `super` with no arguments.

~~~jsx
import React, { Component } from "react";

class ClassInput extends Component {
  constructor(props) {
    super(props);
  }
  // Some more code goes here
}

export default ClassInput;
~~~

#### How you can render JSX

Now that the props can be accessed inside of the class component, the next issue is to find a way to render the JSX.

Well, you can do that by returning your JSX from a `render` method! You can use the props that you declared in the constructor too!

~~~jsx
import React, { Component } from "react";

class ClassInput extends Component {
  constructor(props) {
    super(props);
  }
  // Some more code goes here

  render() {
    return (
      <section>
        <h3>{this.props.name}</h3>
        {/* The input field to enter To-Do's */}
        <form>
          <label htmlFor="task-entry">Enter a task: </label>
          <input type="text" name="task-entry" />
          <button type="submit">Submit</button>
        </form>
        <h4>All the tasks!</h4>
        {/* The list of all the To-Do's, displayed */}
        <ul></ul>
      </section>
    );
  }
}

export default ClassInput;
~~~

Notice how the props get provided by `this`, unlike the functional component that we saw, initially?

#### How to use state and manage context

Next comes the state. In a class-based component, the state gets initialized as a part of the constructor.

~~~jsx
import React, { Component } from "react";

class ClassInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      todos: [],
      inputVal: "",
    };
  }
  // Some more code goes here

  render() {
    return (
      <section>
        <h3>{this.props.name}</h3>
        <form>
          <label htmlFor="task-entry">Enter a task: </label>
          <input type="text" name="task-entry" />
          <button type="submit">Submit</button>
        </form>
        <h4>All the tasks!</h4>
        <ul></ul>
      </section>
    );
  }
}

export default ClassInput;
~~~

The pre-defined `setState` method can be used to set it again! Remember, state must not be mutated, so a new state must be set, every time.

<span id="the-importance-of-bind">Now, it is time to finish it off by adding all the functionality! It is nearly the same, except for a single difference. Whenever a method is declared, you must `bind` the `this` of the method to that of the class in order to work with it, as by default, the methods in a class are not bound to it. Usually, you do this inside the constructor and not at runtime [in the render method].</span>

~~~jsx
import React, { Component } from "react";

class ClassInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      todos: [],
      inputVal: "",
    };

    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInputChange(e) {
    this.setState((state) => ({
      ...state,
      inputVal: e.target.value,
    }));
  }

  handleSubmit(e) {
    e.preventDefault();
    this.setState((state) => ({
      todos: state.todos.concat(state.inputVal),
      inputVal: "",
    }));
  }

  render() {
    return (
      <section>
        <h3>{this.props.name}</h3>
        <form onSubmit={this.handleSubmit}>
          <label htmlFor="task-entry">Enter a task: </label>
          <input
            type="text"
            name="task-entry"
            value={this.state.inputVal}
            onChange={this.handleInputChange}
          />
          <button type="submit">Submit</button>
        </form>
        <h4>All the tasks!</h4>
        <ul>
          {this.state.todos.map((todo) => (
            <li key={todo}>{todo}</li>
          ))}
        </ul>
      </section>
    );
  }
}

export default ClassInput;
~~~

And there we go, we have successfully made our first class-based component, as easy as that!

### Assignment

<div class="lesson-content__panel" markdown="1">

For the purposes of this assignment, we take the class-based component that we built and add additional functionality. There is an interactive example provided at the end to build upon.

1.  Implement a delete button for each task. The delete button should remove that specific task from the state array, thus deleting the task itself! Styling isn't a priority at this moment, but the button tag should be styled by default.

2.  Implement a new class component, `Count` that displays the count of the number of todos, at any given time.

3.  Implement an edit button for each task. It should replace the todo with an input field, and change the button itself to 'Resubmit', so the edits can be saved. This is a comparatively harder task, kudos for when you finish it!

<iframe src="https://codesandbox.io/embed/github/TheOdinProject/react-examples/tree/main/class-component-example?fontsize=14&hidenavigation=1&theme=dark"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="react-example"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [How do props get used in a class-based component?](#the-use-of-a-constructor-and-props)
- [How does JSX get displayed?](#how-you-can-render-jsx)
- [How do we deal with state in a class-based component?](#how-to-use-state-and-manage-context)
- [How do you restore the context of `this` in a method?](#the-importance-of-bind)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- In general, the React documentation on [thinking in react](https://reactjs.org/docs/thinking-in-react.html) is a really good place to look into, if you want more practice with class-based components, from scratch.
