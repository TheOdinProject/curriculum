### Introduction

You have probably heard about reducers before. In this lesson we are going to
learn _what_ they are, _when_ to use them and _how_ to use them in React with the `useReducer` hook.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

* What are reducers.
* When to use reducers.
* What is the useReducer hook.

### What are reducers?

Reducers are pure functions that take a _previous state_, an _action_ and return
a _new state_.

The action is an object with a _type_ property describing what the user did. This object can also contain
any other properties that our reducer might need to produce the new state.

We can define a reducer that updates the state of a counter like this:

~~~js
function reducer(state, action) {
  switch (action.type) {
      case 'incremented_count': {
        return { count: state.count + 1 }
        }
      case 'decreased_count': {
          return { count: state.count - 1 }
        }
      case 'set_count': {
          return { count: action.value }
        }
      default: {
          throw error('unkown action: ' + action.type);
        }
    }
}
~~~

Remember, reducers are pure functions so we shouldn't mutate the state.

In React reducers can be very useful when we have components that update their state in complex or many ways,
allowing us to separate the state logic from the component itself.

### The useReducer hook

React allows us to use reducers in our components through a hook called `useReducer`. This hook takes a reducer function and
an initial state as arguments, then returns an array with two values: the current state and a `dispatch` function.

This `dispatch` function receives an **action** object as argument, which is passed to our reducer function and 
the returned value from it is used to update the state.

~~~js
const [state, dispatch] = useReducer(reducer, { count: 0 });

function handleClick() {
  dispatch({ type: 'incremented_count' });
}
~~~

Similarly to `useState`, the `dispatch` function _only updates the state in the next render_, and it uses
`Object.is` to determine if the state has changed, if it hasn't, then it won't trigger a re-render.

Whether you use `useState` or `useReducer` is up to you, they're both equivalent and you might use them both in the same component.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read through the React docs [Extracting state logic into a reducer](https://react.dev/learn/extracting-state-logic-into-a-reducer) to learn more
about how to use reducers in React and how to refactor `useState` into `useReducer`. Don't forget to complete the challenges at the end.

2. Read the [useReducer](https://react.dev/reference/react/useReducer) React docs to learn more about this hook. Pay close attention to the
[troubleshooting](https://react.dev/reference/react/useReducer#troubleshooting) section for common problems that you might encounter.

</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#what-are-reducers">What are reducers?</a>
*   <a class="knowledge-check-link" href="https://react.dev/reference/react/useReducer#writing-the-reducer-function">How would you declare a reducer?</a>
*   <a class="knowledge-check-link" href="#the-usereducer-hook">What does the dispatch function do?</a>
*   <a class="knowledge-check-link" href="https://react.dev/learn/extracting-state-logic-into-a-reducer#consolidate-state-logic-with-a-reducer">What steps can you follow to migrate from useState to useReducer?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
