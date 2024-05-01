### Introduction

You have probably heard about reducers before. In this lesson we are going to
learn *what* they are, *when* to use them and *how* to use them in React with the `useReducer` hook.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What are reducers.
- When to use reducers.
- What is the `useReducer` hook.

### What are reducers?

Reducers are pure functions that take a previous state and an action to return a new state.

The action is an object with a *type* property describing what the user did. This object can also contain
any other properties that our reducer might need to produce the new state.

We can define a reducer that updates the state of a counter like this:

```js
function reducer(state, action) {
  switch (action.type) {
    case "incremented_count": {
      return { count: state.count + 1 };
    }
    case "decremented_count": {
      return { count: state.count - 1 };
    }
    case "set_count": {
      return { count: action.value };
    }
    default: {
      throw new Error("unknown action: " + action.type);
    }
  }
}
```

Remember, reducers are pure functions so we shouldn't mutate the state.

### When to use reducers?

If a component only needs to update its state in a couple of simple ways, you don't need to use reducers.
The opposite can be said when a component has become too big, hard to read or debug because of its state logic.

By using reducers, we can separate the state logic and even store it in a different file or directory, leading
to smaller components that are easier to read.

Since reducers use *actions*, we can easily track any state-related bugs back to the dispatched action,
and because our reducers are just pure functions, we can test them in isolation.

### The useReducer hook

React allows us to use reducers in our components through a hook called `useReducer`. This hook takes a reducer function and
an initial state as arguments, then returns an array with two values: the current state and a `dispatch` function.

This `dispatch` function receives an **action** object as argument, which is passed to our reducer function and
the returned value from it is used to update the state.

```js
const [state, dispatch] = useReducer(reducer, { count: 0 });

function handleClick() {
  dispatch({ type: "incremented_count" });
}
```

Similarly to the `set` function in `useState`, React *only updates the state in the next render* after calling the `dispatch` function.
Keep in mind that these functions use [`Object.is`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is) to determine if the state has changed, if it hasn't, then the component won't re-render.

Whether you use `useState` or `useReducer` is up to you, they're both equivalent and you might use them both in the same component.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read through the React docs [Extracting state logic into a reducer](https://react.dev/learn/extracting-state-logic-into-a-reducer) to learn more about how to use reducers in React and how to refactor `useState` into `useReducer`. Don't forget to complete the challenges at the end.

2. Read the [useReducer](https://react.dev/reference/react/useReducer) React docs to learn more about this hook. Pay close attention to the troubleshooting section for common problems that you might encounter.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [What are reducers?](#what-are-reducers)
- [How would you declare a reducer?](https://react.dev/reference/react/useReducer#writing-the-reducer-function)
- [What does the dispatch function do?](#the-usereducer-hook)
- [What steps can you follow to migrate from useState to useReducer?](https://react.dev/learn/extracting-state-logic-into-a-reducer#consolidate-state-logic-with-a-reducer)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
