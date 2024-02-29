### Introduction

In this lesson, we will cover keys in React. Keys are special props for our components and we'll learn why they are used.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What are keys and why does React need them?
- What are good and bad examples of keys?

### Why does React need keys?

In the upcoming lessons as you learn more about the internal workings of React, more specifically the rerendering process, you will understand the importance of keys. For now, we will keep it short.

In the previous lesson on rendering lists, we used the `.map()` method to iterate over an array of data and return a list of elements. Now imagine, if any of the items in the list were to change, how would React know which item to update?

If the list were to change, one of two things *should* happen:

1. we completely re-render the entire list, or:
1. we hunt down the specific items that were changed and only re-render those.

Assuming we want to hunt down that one specific item that was changed and NOT re-render the entire list. We need something to track that specific item. We can track down a specific item by using a `key`.

When the list is updated for whatever reason, (either from a server or a user interaction), React matches the `keys` of each of the previous list to the updated list. If there were any changes, React will only update the items that have changed.

As long as `keys` remain consistent and unique, React can handle the DOM effectively and efficiently.

### Using keys

<div class="lesson-note" markdown="1">
We will be using `props` here, and you will learn more about them in the next lesson. For now, you just need to know that `props` are arguments that are passed into components.
</div>

Keys are passed into the component or a DOM element as a prop. You should already be familiar with the syntax.

```jsx
<Component key={keyValue} />
//or
<div key={keyValue} />
```

<span id="keys-from-data">Now that we know the syntax, the next question is: what should be used as a key? Ideally, they should be some identifier that is unique to each item in the list. Most databases assign a unique id to each entry, so you shouldn't have to worry about assigning an id yourself. If you are defining data yourself, it is good practice to assign a unique `id` to each item. You may use the [uuid](https://www.npmjs.com/package/uuid) package to generate a unique id. Let's look at an example:</span>

```jsx
// a list of todos, each todo object has a task and an id
const todos = [
  { task: "mow the yard", id: uuid() },
  { task: "Work on Odin Projects", id: uuid() },
  { task: "feed the cat", id: uuid() },
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
      // here we are using the index as key
      {months.map((month, index) => (<li key={index}>{month}</li>))}
    </ul>
  );
}
```

<span id="anti-pattern">Keys are straightforward to use, though there is an anti-pattern you should be aware of. Keys should never be generated on the fly. Using `key={Math.random()}` or `key={uuid()}` *while* rendering the list defeats the purpose of the list, as now a new `key` will get created for every render of the list. As shown in the above example, `key` should be inferred from the data itself.</span>

```jsx
const todos = [
  { task: "mow the yard", id: uuid() },
  { task: "Work on Odin Projects", id: uuid() },
  { task: "feed the cat", id: uuid() },
];

function TodoList() {
  return (
    <ul>
      {todos.map((todo) => (
        // DON'T do the following i.e. generating keys during render
        <li key={uuid()}>{todo.task}</li>
      ))}
    </ul>
  );
}
```

### Conclusion

Don't fret if some of the terms covered in the lesson don't make sense yet. What's crucial right now is knowing how to use keys effectively in React. As mentioned earlier, the more you learn about React, that's when you will realize why keys are so important. Furthermore, using keys is not limited to rendering lists. You might encounter use cases where keys are needed, we'll leave that for you to discover.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read this [section on keys in the React docs](https://react.dev/learn/rendering-lists#keeping-list-items-in-order-with-key).

1. Watch this short video demonstrating [index as key being an anti-pattern](https://youtu.be/xlPxnc5uUPQ).

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [Why does React need keys?](#why-does-react-need-keys)
- [How do you use keys?](#using-keys)
- [Where should the key value ideally come from?](#keys-from-data)
- [When can we use an array index as the key value?](#index-as-key)
- [What is an anti-pattern when using keys?](#anti-pattern)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- This article on [React key attribute by Nadia Makarevich](https://www.developerway.com/posts/react-key-attribute) takes an in-depth look into keys.
