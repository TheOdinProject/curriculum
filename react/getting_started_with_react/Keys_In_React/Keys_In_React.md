### Introduction

How to use keys in React effectively.

### Lesson Overview

by the end of the lesson you should be able to answer the following:

- How to use keys

- Patterns to avoid when using keys

- Can we use index as a key?

### What are keys?

When rendering a list in React, Keys are `strings` used to help React keep track of which item(s) in the list have changed, are added, or are removed.

### Rules for using keys

- Each item in a list should have a unique key.

- Key should never change between renders

### When is it ok to use index as a key?

- List is static

- List is never filtered

### What to avoid or watch out for when using keys

- Using index as a key should be a last resort.

- `!! do not do key={uniqid()} !!` **unless** you are absolutely sure you know what you are doing, and want this particular behavior. This is marked as an `anti-pattern` in React docs.

- Keys should typically be added when and where the `.map()` method is used.

### Examples

Ideal situation.

Iterating over a list of objects that have a unique identifier.

Best practice would be to add a unique ID when the item is created.

~~~jsx
// In this example lets say when someone creates a new todo, the todo constructor adds `id: uniqid()`
const todos = [
  { task: 'mow the yard', id: '1j32b51bk' }, // `id: uniqid()` on todo creation
  { task: 'Work on Odin Projects', id: '41hgi12gi' },
  { task: 'feed the cat', id: '12ih412b412b4' },
];

// here we are using the already generated id as the key.
const iterateTodos = todos.map((todo) => <div key={todo.id}>{todo.task}</div>);

function TodoList() {
  return <div>{iterateTodos}</div>;
}
~~~

Better than plain `index`.

When working with an array of primitive values, we wont have a unique id property to pass to key. One idea that would work better than just using `index` as the `key` would be to concatinate `array[index] + index` as this is more likely to be a unique value.

~~~jsx
const todos = ['mow the yard', 'Work on Odin Projects', 'feed the cat'];

const iterateTodos = todos.map((todo, index) => (
  <div key={`${todo}_${index}`}>{todo}</div>
));

function TodoList() {
  return <div>{iterateTodos}</div>;
}
~~~

Using index correctly

If a list will never be modified **or** stictly manipulated by `push()` + `pop()` we can use index.

~~~jsx
const months = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

function MonthList(){
    return (
        <ul>
            {months.map((month, index) => (<li key={index}>{month}</li>))}
        </ul>
    )
}

const
~~~

bad

this approach will cause a complete re work of every list item any time one changes.

~~~jsx
// !! this will cause the entire list to be destroyed and be re-created every render! !!
const todos = [
  { task: 'mow the yard' },
  { task: 'Work on Odin Projects' },
  { task: 'feed the cat' },
];

const iterateTodos = todos.map((todo) => (<li key={uniqid()}>{todo.task}</li>));

function TodoList() {
  return <ul>{iterateTodos}</ul>;
}
~~~

Also bad

This will cause unintended behavior when modifying, or filtering array element positions.
Considering that todos would likely be updated, changed, filtered or etc, we would NOT want to use index as our key.

~~~jsx
const todos = ['mow the yard', 'Work on Odin Projects', 'feed the cat'];

const iterateTodos = todos.map((todo, index) => (<div key={index}>{todo}</div>));

function TodoList() {
  return <div>{iterateTodos}</div>;
}
~~~

### Assignment

Read this article: <a href="https://www.developerway.com/posts/react-key-attribute">how to use correctly use keys with examples demonstrating preformance and re-renders.</a>

Short video demonstrating <a href="https://youtu.be/xlPxnc5uUPQ">Index as Key being an Anti-pattern</a>

### Knowledge Check

- [What are keys](#what-are-keys)
- [What are the rules for using keys?](#rules-for-using-keys)
- [When can we use index as a key?](#when-is-it-ok-to-use-index-as-a-key)

### Additional Resources

<a href="https://beta.reactjs.org/learn/rendering-lists#keeping-list-items-in-order-with-key
">React Beta Docs</a>
