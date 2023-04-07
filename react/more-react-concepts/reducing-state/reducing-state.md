### Introduction

You have probably heard about reducers before. In this lesson we are going to
learn _what_ they are, _when_ to use them and _how_ to use them in React with the useReducer hook.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- What are reducers.
- When to use reducers.
- What is the useReducer hook.

### What are reducers?

Reducers are pure functions that take a _previous state_, an _action_ and return
a _new state_.

The action is usually an object with two properties, a _type_ describing what the user did
and a _payload_ that can be anything our reducer might need to produce the new state.

In React reducers can be very useful when we have components that update their state in complex or many ways,
allowing us to separate the state logic from the component itself.

### The useReducer hook

React allows us to use reducers in our components through a hook called `useReducer`. This hook takes a reducer function and
an initial state as arguments, then returns an array with two values: the current state and a `dispatch` function.

We can use this `dispatch` function to send actions to our reducer and update our state.

~~~js
const [state, dispatch] = useReducer(reducer, { count: 0 });

function handleClick() {
  dispatch({ type: 'incremented_count' });
~~~

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  A RESOURCE ITEM
    - AN INSTRUCTION ITEM
2.  A PRACTICE ITEM \* A TASK ITEM
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="A KNOWLEDGE CHECK URL">A KNOWLEDGE CHECK QUESTION.</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
