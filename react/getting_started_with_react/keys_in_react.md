### Introduction

In this lesson, we will cover keys in React. Keys are special props for our components and we'll learn why they are used.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What keys are and how React uses them.
- Good and bad usage of keys in React applications.

### Why does React need keys?

You may recall that React uses a "virtual DOM" under the hood to decide what things in the real DOM to update, minimising unnecessary actions. When a re-render occurs, it firset recreates this virtual DOM, diffs (compares changes) the new and previous virtual DOMs, then makes real DOM updates only to the things that actually did change.

React needs to be able to tell the difference between each of these components, as they'll each have their own props and states. Therefore, every component will be given an ID under the hood - a **key**. For example, if you update state, it's still the same instance of the component and React will know this because the component's key hasn't changed, and it can avoid unnecessary action. If the key changes, however, React knows this is now a brand new instance of that component and can build a new one with fresh states.

Normally, you do not need to manually give components keys, as React will handle this automatically. However, there are a couple of cases where we can make use of them.

### Keys when rendering lists

In the previous lesson, we used the `.map()` method to iterate over an array of data and return a component, rendering a list of components. Now imagine, if any of the items in the list were to change, how would React know which item to update behind the scenes?

If the list were to change, we might want one of two things to happen:

1. Completely re-render the entire list
1. Hunt down the specific items that were changed and only re-render those

We want React to hunt down only the changed item(s) and NOT re-render the entire list (to avoid unnecessary work). Therefore, each item in that list needs a key.

If we hard-coded the components in JSX, we can leave React to handle keys automatically, as instructions are explicit and static; across re-renders, there's no ambiguity between one component and another.

However, if we were to render a list via mapping over an array, things are dynamic. We'd write only a single return value for the `.map()` method but the end result could be 2, 3 or even 100 instances of that return component, and both the count and order of these could change between renders. React would not be able to automatically provide keys for each of these components in a way that lets it reliably match specific instances across re-renders. What if the count and/or order of items change? How will it know for certain which components need to be remade from scratch with new state and which are existing instances that keep/update their state?

This is why we must provide our own key when dynamically rendering lists, so that when the list is updated for whatever reason (either from a server or a user interaction), React matches the keys of each of the previous list items to the updated list. If there were any changes, React will only update the items that have changed.

As long as `keys` remain consistent and unique, React can handle the DOM effectively and efficiently.

### Using keys

Keys are passed into the component or a DOM element as a prop. You should already be familiar with the syntax.

```jsx
<Component key={keyValue} />
<div key={keyValue}></div>
```

An important difference to note is that the `key` prop is private, used only for internal React stuff. It is not passed to the component itself via the `props` param object.

<span id="keys-from-data">Now that we know the syntax, the next question is: what should be used as a key? Ideally, there should be some identifier that is unique to each item in the list. Most databases assign a unique id to each entry, so you shouldn't have to worry about assigning an id yourself. If you are defining data yourself, it is good practice to assign a unique `id` to each item. For example, you can use the [crypto.randomUUID() function](https://developer.mozilla.org/en-US/docs/Web/API/Crypto/randomUUID) to generate a unique id. Let's look at an example:</span>

```jsx
// a list of todos, each todo object has a task and an id
const todos = [
  { task: "mow the yard", id: crypto.randomUUID() },
  { task: "Work on Odin Projects", id: crypto.randomUUID() },
  { task: "feed the cat", id: crypto.randomUUID() },
];

function TodoList() {
  return (
    <ul>
      {todos.map((todo) => (
        // here we are using the already generated id as the key.
        <li key={todo.id}>{todo.task}</li>
      ))}
    </ul>
  );
}
```

<span id="index-as-key">Additionally, if you're sure the list will remain unchanged throughout the application's life,  you can use the array index as a key. However, this is not recommended since it can lead to confusing bugs if the list changes when items are deleted, inserted, or rearranged. You will learn more about this in the assignment section's linked article.</span>

```jsx
const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

function MonthList() {
  return (
    <ul>
      {/* here we are using the index as key */}
      {months.map((month, index) => (<li key={index}>{month}</li>))}
    </ul>
  );
}
```

<span id="anti-pattern">Keys are straightforward to use, though there is an anti-pattern you should be aware of. Keys should never be generated on the fly. Using `key={Math.random()}` or `key={crypto.randomUUID()}` *while* rendering the list defeats the purpose of the key, as now a new `key` will get created for every render of the list. As shown in the above example, `key` should be inferred from the data itself.</span>

```jsx
const todos = [
  { task: "mow the yard", id: crypto.randomUUID() },
  { task: "Work on Odin Projects", id: crypto.randomUUID() },
  { task: "feed the cat", id: crypto.randomUUID() },
];

function TodoList() {
  return (
    <ul>
      {todos.map((todo) => (
        // DON'T do the following i.e. generating keys during render
        <li key={crypto.randomUUID()}>{todo.task}</li>
      ))}
    </ul>
  );
}
```

### Keys and state

Dynamically rendering lists is definitely the most common situation where you'd need to manually provide a key, but it's certainly not the only time. Since keys are just internal IDs for React to differentiate between component instances, we can also provide our own keys if we purposely want control over when a specific component should be the same instance as its state updates or a brand new instance with fresh state.

Imagine you have a game and when it ends, you want to be able to reset it to its original state. Refreshing the page is probably not sensible, especially if there are other components with their own states you want to keep untouched. You could write a function that will set each of the relevant states to its initial value, but then you'd have to make sure you didn't miss any states or set the wrong values, and you'd need to keep this up to date should you add or remove any states.

What if we had a much simpler way of telling React "render this component from scratch with fresh state"? Well, we can just update the key. For example:

```jsx
function GamePage() {
  const [key, setKey] = useState(0);

  return <Game key={key} resetGame={() => setKey(key + 1)} />;
}
```

`Game` will have its own states and render its own components. When it re-renders, it's still the same instance of `Game` because its key hasn't changed, so its states are preserved/updated. If we have a button somewhere inside `Game` that calls `resetGame()` when clicked, clicking it would cause the `key` state to change. `GamePage` then re-renders and because `Game` now has a new key, React sees it as a brand new instance of `Game`, and will make a fresh one with new states.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read this [section on keys in the React docs](https://react.dev/learn/rendering-lists#keeping-list-items-in-order-with-key).
1. Watch this short video demonstrating [index as key being an anti-pattern](https://youtu.be/xlPxnc5uUPQ).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why does React need keys?](#why-does-react-need-keys)
- [Why does React need keys when rendering lists?](#keys-when-rendering-lists)
- [How do you use keys?](#using-keys)
- [Where should the key value ideally come from?](#keys-from-data)
- [When can we use an array index as the key value?](#index-as-key)
- [What is an anti-pattern when using keys?](#anti-pattern)
- [How are keys related to state?](#keys-and-state)
