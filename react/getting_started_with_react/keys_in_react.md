### Introduction

In this lesson we will cover what keys are in React, rendering a list, and touch on when and how React knows to render or re render.

### Lesson Overview

By the end of the lesson you should be able to answer the following:

- Why does React need keys

- How to use keys

- How do keys impact rendering, and re-rendering.

- Where to get keys

- Patterns to avoid when using keys

- Can we use index as a key

### Why does React need keys?

Using an example, let's talk about taking notes for school or work.

Maybe you sort notes by date, subject, or topic order.

If a note is out of place, you can tell quickly by the way you have ordered them.

This is the same way react handles _keys_ and knowing when to RE-ORDER _(re-render)_ the _notes_

If notes taken on the 16th and 27th of the same month get swapped, you know very clearly which two notes are _out of place_

The same way react can tell if two elements move places, it uses _key_ as our _date_ to tell what has moved

If the _note_ taken on the 16th were to move, we will always know it has moved, and can deal with it appropriately.

So, how does this work in react?

React can see the _keys_ both before and after keys have changed.

If _key_ [0] were to move from the front of the list, to the middle of the list, react knows the _keys_ have changed, and to trigger a re-render. Very similar to how we know if a note has moved and to trigger us to take action (re-ordering).

### What does it matter if the keys match or do not match?

If an item in an array changes, keys help React decide which dom elements have changed.

If a single item in a list where to change, one of two things _should_ happen:
Either
We completely re render the entire list
Or
Hunt down that one specific item that was changed and only re render that item.

Assuming we want to hunt down that one specific item that was changed and NOT re render the entire list. We need something to _track_ that specific item.

We can _track_ or _hunt_ down a specific item by using a `key`.

If we were to give each item in the list an `identifier` and each item in the dom the corresponding `identifier` it becomes really easy to keep track of that element in both the logic and the dom.

When an item is changed, React uses that item's `key` to identify which item has changed, and which dom element to update.

If the `key` does NOT match the item being changed, react will leave that list item alone.
If React DOES find a match, it will update that item in the dom accordingly.

As long as `keys` remain consistent and unique, React can handle the dom effectively and efficiently.

### Using keys

What should you use as a key?:

- Data from a database _most databases will generate a unique id on entry creation_

- Generated IDs on item creation. This could be an incrementing counter, or a package like `uuid`.

Rules for using keys:

- Each item in a list should have a unique key

- Key should never change between renders

- Keys should be added when and where the `.map()` method is used.

When can you use index as a key?:

- List is static

- Items are only ever added to the END of the list

- Items are never removed, reordered or changed within a list

- List is never filtered

What to avoid when deciding what to use as a key:

- Using index as a key should be a last resort

- do NOT use `!! key={uuid()} !!` **unless** you are absolutely sure you know what you are doing, and want this particular behavior. This is marked as an `anti-pattern` in React docs.

`key={Math.random()}` or `key={uuid()}` will force a re render of the entire list every time any item in the list is changed. This is extremely slow, and inefficient and should be considered an `anti-pattern` in React.

Now let's dive into some examples of using keys.

This is an ideal situation, iterating over a list of objects that have a unique identifier.

Best practice would be to add a unique ID when that item is created.

```jsx
// In this example lets say when someone creates a new todo, the todo constructor adds `id: uuid()`
const todos = [
  { task: "mow the yard", id: "1j32b51bk" }, // `id: uuid()` on todo creation
  { task: "Work on Odin Projects", id: "41hgi12gi" },
  { task: "feed the cat", id: "12ih412b412b4" },
];

// here we are using the already generated id as the key.
const iterateTodos = todos.map((todo) => <div key={todo.id}>{todo.task}</div>);

function TodoList() {
  return <div>{iterateTodos}</div>;
}
```

Better than plain `index`.

When working with an array of primitive values, we won't have a unique id property to pass to key. One idea that would work better than just using `index` as the `key` would be to concatenate `array[index] + index` as this is more likely to be a unique value.

```jsx
const todos = ["mow the yard", "Work on Odin Projects", "feed the cat"];

const iterateTodos = todos.map((todo, index) => (
  <div key={`${todo}_${index}`}>{todo}</div>
));

function TodoList() {
  return <div>{iterateTodos}</div>;
}
```

Correctly using index as a key:

If a list will never be modified **or** stictly manipulated by `push()` + `pop()` we can use index.
<br>

```jsx
const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

function MonthList(){
    return (
        <ul>
            {months.map((month, index) => (<li key={index}>{month}</li>))}
        </ul>
    )
}

const
```

Incorrectly using index as a key:

this approach will cause a complete re work of every list item any time one changes.
<br>

```jsx
// !! this will cause the entire list to be destroyed and be re-created every render! !!
const todos = [
  { task: "mow the yard" },
  { task: "Work on Odin Projects" },
  { task: "feed the cat" },
];

const iterateTodos = todos.map((todo) => <li key={uuid()}>{todo.task}</li>);

function TodoList() {
  return <ul>{iterateTodos}</ul>;
}
```

Incorrectly using index as a key:

This will cause unintended behavior when modifying, or filtering array element positions.
Considering that todos would likely be updated, changed, filtered or etc, we would NOT want to use index as our key.
<br>

```jsx
const todos = ["mow the yard", "Work on Odin Projects", "feed the cat"];

const iterateTodos = todos.map((todo, index) => <div key={index}>{todo}</div>);

function TodoList() {
  return <div>{iterateTodos}</div>;
}
```

Incorrectly using keys:

This next example should be avoided and can be considered an anti-pattern in React.
generating keys in this way will cause the `keys` to never match up between renders, leading to all your components and DOM being recreated every time. Not only is this slow, but it will also lose any user input inside the list items. Instead, use a stable ID based on the data.

DO NOT DO:
<br>

```jsx
const todos = ["odin", "lunch", "more odin", "laundry"];
const RenderList = () => {
  return (
    <div>
      {todos.map((todo) => {
        return (
          <div key={uuid()}>
            <div>{todo}</div>
          </div>
        );
      })}
    </div>
  );
};
```

Correctly using keys:

DO:
<br>

```jsx
const newTodo = ({task, priority}) => {
  return {
    task,
    priority,
    id: uuid()  // id in included WHEN a todo is created
  }
}

const todos = [
  newTodo({task: 'odin', , priority: 'high'}), // id generated on creation
  newTodo({task: 'lunch', priority: 'low' }),
  newTodo({task: 'more odin', priority:'high'}),
  newTodo({task: 'laundry', priority:'medium' })
  ];

  const RenderList = () => {
    return (
      <div>
      {todos.map((todo) => {
        return (
          <div key={todo.id}>
            task: {todo.task}
            priority: {todo.priority}
          </div>
        )
      })}
      </div>
    )
  }
```

### Assignment

Read this article: <a href="https://www.developerway.com/posts/react-key-attribute">how to use correctly use keys with examples demonstrating performance and re-renders.</a>

Short video demonstrating <a href="https://youtu.be/xlPxnc5uUPQ">Index as Key being an Anti-pattern</a>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [What are keys](#what-are-keys)
- [What are the rules for using keys?](#rules-for-using-keys)
- [When can we use index as a key?](#when-is-it-ok-to-use-index-as-a-key)
- [Why does React need keys](#why-does-react-need-keys)
- [How to use keys](#examples)
- [How do keys impact rendering, and re-rendering](#what-does-it-matter-if-the-keys-match-or-do-not-match)
- [Where to get keys](#what-to-use-as-a-key)
- [Patterns to avoid when using keys](#what-to-avoid-or-watch-out-for-when-using-keys)

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- [React Beta Docs](https://beta.reactjs.org/learn/rendering-lists#keeping-list-items-in-order-with-key)
