### Introduction

A BRIEF INTRODUCTION.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- A LESSON OVERVIEW ITEM.

### The What's And Why's

In your previous lessons, you have already been introduced to functional components, and the basic patterns in which components get written now a days. However, React components did not look this way since React was introduced.

If you look into any older React codebase, you'll notice a lot of classes. These are known as class-based components. Prior to February 2019, functional components were also called state-less, as there was no way to manage state in them. This was changed when hooks were introduced, leading to less verbose and 'neater' components.

In your career, chances are, you will be dealing with legacy code, so there will be days where you would be dealing with class components. To meet this issue, we take a peek into the works and intricacies of a class-based component, and how they work.

### Building a Class Component

As we already know about functional components, let us build a class-based component from a functional one. Usually, you will want to divide the contents of a component, like the one we use, into smaller, re-usable components, but for the purposes of this exercise, we stick to one component. Below, we have a sample functional component:

~~~jsx
import React, { useState } from 'react';

const FunctionalInput = ({ name }) => {
  /* 
    We declare two state variables and their setters,
    one to store the To-Do's 
	and the other to store the value of the input field 
  */
  const [todos, setTodos] = useState([]);
  const [inputVal, setInputVal] = useState('');

  const handleInputChange = (e) => {
    setInputVal(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setTodos((todos) => [...todos, inputVal]);
    setInputVal('');
  };

  return (
    <section>
      <h3>{name}</h3>
      {/* The input field to enter To-Do's */}
      <form onSubmit={handleSubmit}>
        <label htmlFor='task-entry'>Enter a task: </label>
        <input
          type='text'
          name='task-entry'
          value={inputVal}
          onChange={handleInputChange}
        />
        <button type='submit'>Submit</button>
      </form>
      <h4>All the tasks!</h4>
      {/* The list of all the To-Do's, displayed */}
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

Now, we try to recreate it as a class-based component. The first thing it should have, is, _drumroll_, a class! But it cannot be just another class, it will need to have certain properties that qualifies it as a React component. React provides us with all those properties, and we can write components by simply extending the given class, as shown below:

~~~jsx
import React, { Component } from 'react';

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

A class is incomplete without a constructor, so let's add one.

The props, that get passed into this component, gets passed into the class' `constructor`. This, along with the `super` method, allows you to use the props in context to `this`, which, in _this_ case, refers to the component. If you’re really curious about what `super` actually does, [check out the docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/super).

If your component doesn't have any props, it is fine to leave the `constructor` and the `super` with no arguments.

~~~jsx
import React, { Component } from 'react';

class ClassInput extends Component {
  constructor(props) {
    super(props);
  }
  // Some more code goes here
}

export default ClassInput;
~~~

Now, we can access the props inside of our class component. Our next issue is to find a way to render our JSX.

Well, you can do that by returning your JSX from a `render` method! You can use the props that you declared in the constructor too!

~~~jsx
import React, { Component } from 'react';

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
          <label htmlFor='task-entry'>Enter a task: </label>
          <input type='text' name='task-entry' />
          <button type='submit'>Submit</button>
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

Notice how we used the props that `this` provides now, instead of just `name` as we did, initially?

Next comes the state. In a class-based component, the state gets initialized as a part of the constructor.

~~~jsx
import React, { Component } from 'react';

class ClassInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      todos: [],
      inputVal: '',
    };
  }
  // Some more code goes here

  render() {
    return (
      <section>
        <h3>{this.props.name}</h3>
        {/* The input field to enter To-Do's */}
        <form>
          <label htmlFor='task-entry'>Enter a task: </label>
          <input type='text' name='task-entry' />
          <button type='submit'>Submit</button>
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

We can now use the pre-defined `setState` method to set it again! Remember, state must not be mutated, so a new state must be set, every time.

Now, it is time to finish it off by adding all the functionality! It is nearly the same, except for a single difference. Whenever we declare a method, we must `bind` the `this` of the method to that of the class, in order to access it, as by default, the methods in a class are not bound by default. Usually, we do this inside the constructor and not at runtime [in the render method].

~~~jsx
import React, { Component } from 'react';

class ClassInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      todos: [],
      inputVal: '',
    };

    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInputChange(e) {
    this.setState({
      ...this.state,
      inputVal: e.target.value,
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.setState({
      todos: this.state.todos.concat(this.state.inputVal),
      inputVal: '',
    });
  }

  render() {
    return (
      <section>
        <h3>{this.props.name}</h3>
        {/* The input field to enter To-Do's */}
        <form onSubmit={this.handleSubmit}>
          <label htmlFor='task-entry'>Enter a task: </label>
          <input
            type='text'
            name='task-entry'
            value={this.state.inputVal}
            onChange={this.handleInputChange}
          />
          <button type='submit'>Submit</button>
        </form>
        <h4>All the tasks!</h4>
        {/* The list of all the To-Do's, displayed */}
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

1.  A RESOURCE ITEM
    *   AN INSTRUCTION ITEM
2. A PRACTICE ITEM
    * A TASK ITEM
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="A KNOWLEDGE CHECK URL">A KNOWLEDGE CHECK QUESTION.</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
