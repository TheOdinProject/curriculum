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

Lets imagine you take notes while working through The Odin Project.

Maybe you use index cards, or lined paper.

Now if these notes are in a pile, we can think of them as an `array` and each one having a particular `index` in the list.

The paper at the bottom of the pile is the first note you made or `note[0]`, the one directly on top of it being the second note or `note[1]`.

What happens if we want to reorder the list, or remove a note from the list. Maybe we need to find an old note in the middle of the pile.

If `note[4]` was removed, does that mean `note[5]` just became `note[4]`? does every note after `note[5]` have to be re indexed?

If we reorder or _sort_ the notes, we might end up in a situation where our previous `note[14]` might become our new `note[3]`.

It gets a bit confusing to manage and keep track of which papers are still in order.

One solution might be to add a unique summary or `key` of some kind to each page.

This way no matter where that specific `note` moves to in the pile, we know which note it is.

Similarly `keys` help React to keep track of the items in a list. `keys` allow React to know when to render, what to render, when to re render, and when not to re render.

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

### What to use as a key

- Data from a database _most databases will generate a unique id on entry creation_

- Generated IDs on item creation. This could be an incrementing counter, or a package like `uuid`.

### Rules for using keys

- Each item in a list should have a unique key

- Key should never change between renders

- Keys should be added when and where the `.map()` method is used.

### When is it ok to use index as a key?

- List is static

- Items are only ever added to the END of the list

- Items are never removed, reordered or changed within a list

- List is never filtered

### What to avoid or watch out for when using keys

- Using index as a key should be a last resort

- do NOT use `!! key={uuid()} !!` **unless** you are absolutely sure you know what you are doing, and want this particular behavior. This is marked as an `anti-pattern` in React docs.

`key={Math.random()}` or `key={uuid()}` will force a re render of the entire list every time any item in the list is changed. This is extremely slow, and inefficient and should be considered an `anti-pattern` in React.

### Examples

Ideal situation.

Iterating over a list of objects that have a unique identifier.

Best practice would be to add a unique ID when the item is created.

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

Using index correctly

If a list will never be modified **or** stictly manipulated by `push()` + `pop()` we can use index.

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

bad

this approach will cause a complete re work of every list item any time one changes.

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

Also bad

This will cause unintended behavior when modifying, or filtering array element positions.
Considering that todos would likely be updated, changed, filtered or etc, we would NOT want to use index as our key.

```jsx
const todos = ["mow the yard", "Work on Odin Projects", "feed the cat"];

const iterateTodos = todos.map((todo, index) => <div key={index}>{todo}</div>);

function TodoList() {
  return <div>{iterateTodos}</div>;
}
```

This next example should be avoided and can be considered an anti-pattern in React.
generating keys in this way will cause the `keys` to never match up between renders, leading to all your components and DOM being recreated every time. Not only is this slow, but it will also lose any user input inside the list items. Instead, use a stable ID based on the data.

DO NOT DO:

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

DO:

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

- [What are keys](#what-are-keys)
- [What are the rules for using keys?](#rules-for-using-keys)
- [When can we use index as a key?](#when-is-it-ok-to-use-index-as-a-key)
- [Why does React need keys](#why-does-react-need-keys)
- [How to use keys](#examples)
- [How do keys impact rendering, and re-rendering](#what-does-it-matter-if-the-keys-match-or-do-not-match)
- [Where to get keys](#what-to-use-as-a-key)
- [Patterns to avoid when using keys](#what-to-avoid-or-watch-out-for-when-using-keys)

### Additional Resources

<a href="https://beta.reactjs.org/learn/rendering-lists#keeping-list-items-in-order-with-key
">React Beta Docs</a>
