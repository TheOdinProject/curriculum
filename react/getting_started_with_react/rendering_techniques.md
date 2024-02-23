### Introduction

Now that we have learned how JSX works and how to write it, this lesson will cover how we can render multiple elements and conditionally render UI in JSX.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Render a list of elements/components in JSX.
- Conditionally render UI.

### Rendering a list of elements in JSX

Let us say we want to create a component that lists multiple animals:

~~~javascript
function App() {
  return (
    <div>
      <h1>Animals: </h1>
      <ul>
        <li>Lion</li>
        <li>Cow</li>
        <li>Snake</li>
        <li>Lizard</li>
      </ul>
    </div>
  );
}
~~~

It is perfectly acceptable, but what if we want to render more than just four? It can be tedious and long, and most of the time, we will be dealing with a data structure (like a list) rather than hard-coding each animal. You have previously learned that we can embed expressions inside JSX with curly braces. So let us do just that:

~~~javascript
function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];

  return (
    <div>
      <h1>Animals: </h1>
      <ul>
        {animals.map((animal) => {
          return <li key={animal}>{animal}</li>;
        })}
      </ul>
    </div>
  );
}
~~~

We define an array called `animals`. Now inside our JSX, we use `map` to return a new array of `li` elements, adding `animal` as its text. It should now render the same as the previous snippet we wrote. This is because JSX has the ability to automatically render arrays. The following code is identical:

~~~javascript
function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];
  const animalsList = animals.map((animal) => <li key={animal}>{animal}</li>)

  return (
    <div>
      <h1>Animals: </h1>
      <ul>
        {animalsList}
      </ul>
    </div>
  );
}
~~~

You may be curious as to what the `key` is in our `<li>` element. We will dive into how keys work in the next lesson. But, to explain briefly, it is to let React know the identity of each element in the list. React must know this information if you are dealing with a dynamic list where you add or remove elements. Since we are only dealing with a static list, it does not matter for now.

### Rendering a list of components in JSX

<div class="lesson-note" markdown="1">
We will use `props` here, and you will learn more about them in a future lesson. For now, you just need to know that `props` are arguments that are passed into components. We will just be writing a short implementation.
</div>

~~~javascript
function ListItem(props) {
  return <li>{props.animal}</li>
}

function List(props) {
  return (
    <ul>
      {props.animals.map((animal) => {
        return <ListItem key={animal} animal={animal} />;
      })}
    </ul>
  );
}

function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
~~~

<div class="lesson-note lesson-note--tip" markdown="1">
  <h4>"Missing in props validation"</h4>
  You may notice squiggly lines under your props (for example under `color` and
  `fontSize` inside the Button component below). Hovering over these will tell
  you they are `missing in props validation`. For now, this can safely be
  ignored as it is just a default ESLint rule warning about prop types,
  something that will be covered later in the course.
</div>

We have moved our `<ul>` element to a different component called `<List />`. It still returns the `<ul>` element, but we can do a lot more with it as a component.

This component accepts a `props` which is an object containing the `animals` that we defined as a property when we wrote `<List animals={animals} />`. Do note that you can name it anything, for example, `<List animalList={animals} />`. You will still need to pass the animals to the property, but now you will use `props.animalList` instead of `props.animals`.

We have also created a different component for the `<li>` element called `<ListItem />`, which also accepts `props`, and uses `props.animal` to render the text. It should now render the same thing.

### Conditionally rendering UI

Let us make some decisions within our component. What if we only want to render an animal that starts with the letter L? To make these decisions, we would use some sort of conditional expression. Let us continue using the code above, but for brevity's sake, we will be removing the `<ListItem />` component.

#### Using the ternary operator

One way to conditionally render an element is with a ternary operator, using a boolean value to decide what to render:

~~~javascript
function List(props) {
  return (
    <ul>
      {props.animals.map((animal) => {
        return animal.startsWith("L") ? <li key={animal}>{animal}</li> : null;
      })}
    </ul>
  );
}

function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
~~~

We are using the [String method `startsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith) to check if the `animal` starts with the letter L. This method either returns true or false.

If the animal starts with the letter L, then we return the `<li>` element, which renders the particular animal. Otherwise, we return `null` to indicate that no element will be rendered.

#### Using the && operator

Another quick way of conditionally rendering an element is by using the `&&` operator.

~~~javascript
function List(props) {
  return (
    <ul>
      {props.animals.map((animal) => {
        return animal.startsWith("L") && <li key={animal}>{animal}</li>;
      })}
    </ul>
  );
}

function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
~~~

We will leverage the return value of `startsWith` with the `&&` operator. If the result of the `startsWith` function is `true`, then it returns the second operand, which is the `<li>` element, and renders it. Otherwise, if the condition is `false` it just gets ignored.

<div class="lesson-note lesson-note--warning" markdown="1" >

#### Falsy values in JSX, a common pitfall

In JSX, there can be some confusion regarding which values render content and which do not, especially when it comes to falsy values. It's important to note that while values like `null`, `undefined`, and `false` don't render anything, other falsy values such as `0` or `''` (an empty string) are perfectly valid in JSX and will be rendered as expected. To avoid any pitfalls, it's essential to understand that certain falsy values behave differently in JSX when compared to JS. 

</div>

#### Other ways to render conditionally

We can also use `if`, `if/else`, and `switch` to conditionally render something.

This time we will have two conditions:

1.  Check if the `animals` property is provided
2.  Check if the `animals` length is greater than 0

We will frequently be dealing with lists in the future, and we also need to consider what to render if the list is empty or does not exist at all. You certainly would not want to see a blank page, would you? Let us try to implement that:

~~~javascript
function List(props) {
  if (!props.animals) {
    return <div>Loading...</div>;
  }

  if (props.animals.length === 0) {
    return <div>There are no animals in the list!</div>;
  }

  return (
    <ul>
      {props.animals.map((animal) => {
        return <li key={animal}>{animal}</li>;
      })}
    </ul>
  );
}

function App() {
  const animals = [];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
~~~

In our `<List />` component, we have two `if` statements acting as a guard that immediately returns an element based on the condition.

One is to check if the property `animals` exists, and the other is to check if the length of the list is greater than 0. In this case, our list is empty, so the second if statement executes, it will immediately return the `<div>` element that contains the text "There are no animals in the list".

If we remove the `animals` property:

~~~javascript
function App() {
  const animals = [];

  return (
    <div>
      <h1>Animals: </h1>
      <List />
    </div>
  );
}
~~~

The first `if` statement will now execute and return a `<div>` with the text "Loading..." This is often the case when you are fetching from an API, since it might take some time to actually retrieve the data, it is good practice to show an indicator for that.

If none of those checks passed, then we have the data we need to render the list successfully. Try it out by adding items to the `animals` list and adding the property back.

You can, of course, also accomplish this with just the ternary and `&&` operators.

~~~javascript
function List(props) {
  return (
    <>
      {!props.animals ? (
        <div>Loading...</div>
      ) : props.animals.length > 0 ? (
        <ul>
          {props.animals.map((animal) => {
            return <li key={animal}>{animal}</li>;
          })}
        </ul>
      ) : (
        <div>There are no animals on the list!</div>
      )}
    </>
  );
}

// or
function List(props) {
  return (
    <>
      {!props.animals && <div>Loading...</div>}
      {props.animals && props.animals.length > 0 && (
        <ul>
          {props.animals.map((animal) => {
            return <li key={animal}>{animal}</li>;
          })}
        </ul>
      )}
      {props.animals && props.animals.length === 0 && <div>There are no animals in the list!</div>}
    </>
  );
}

function App() {
  const animals = [];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
~~~

Nested ternaries and multiple `&&` operators can be intimidating to look at, so be sure to test things out!

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  The React documentation has an excellent guide to [conditional rendering](https://react.dev/learn/conditional-rendering). Strengthen your understanding by reading through it and tackling all of the examples!
2.  From the same docs, explore more on what you can do with lists by working through the [Rendering Lists article](https://react.dev/learn/rendering-lists). You don't have to worry about the last part on keys, since we will be learning about them in the next lesson.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#rendering-a-list-of-elements-in-jsx">How do you render a list of elements/components in JSX?</a>
*   <a class="knowledge-check-link" href="#conditionally-rendering-ui">What are the ways you could render UI conditionally?</a>
*   <a class="knowledge-check-link" href="https://beta.reactjs.org/learn/conditional-rendering#conditionally-returning-jsx">How would you conditionally return JSX?</a>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
