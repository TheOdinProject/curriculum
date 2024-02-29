### Introduction

By now you should be starting to understand just how powerful React and reusable components can be, but you may be left wondering ‘How can I share information between components?’ or ‘Am I able to customize the behavior of my components each time I use them?'. In this lesson, we will learn about React props (short for properties) and how to use props to pass data between components.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Passing data between components.
- Using data to create customizable reusable components.

### Data transfer in React

In React, data is transferred from parent components to child components via props. This data transfer is unidirectional, meaning it flows in only one direction. Any changes made to this data will only affect child components using the data, and not parent or sibling components. This restriction on the flow of data gives us more explicit control over it, resulting in fewer errors in our application.

### Using props in React

Now that we know *how* data transfers between components, let's explore *why* this might be a useful feature in React. Consider the following `Button` component, which then gets rendered multiple times within our `App` component.

~~~jsx
function Button() {
  return (
    <button>Click Me!</button>
  );
}

export default function App() {
  return (
    <div>
      <Button />
      <Button />
      <Button />
    </div>
  );
}
~~~
So far so good right? We have a beautiful reusable button that we can use as many times as we like, there is just one small problem.

What if we wanted the text within our second button to be “Don’t Click Me!’? Right now, we would have to create a second button component with this different text.

~~~jsx
function Button() {
  return (
    <button>Click Me!</button>
  );
}

function Button2() {
  return (
    <button>Don't Click Me!</button>
  );
}

export default function App() {
  return (
    <div>
      <Button />
      <Button2 />
      <Button />
    </div>
  );
}
~~~
This may not seem like a huge deal right now, but what if we had 10 buttons, each one having different text, fonts, colors, sizes, and any other variation you can think of. Creating a new component for each of these button variations would very quickly lead to a LOT of code duplication.

Let's see how by using props, we can account for any number of variations with a *single* button component.

~~~jsx
function Button(props) {
  const buttonStyle = {
    color: props.color,
    fontSize: props.fontSize + 'px'
  };

  return (
    <button style={buttonStyle}>{props.text}</button>
  );
}

export default function App() {
  return (
    <div>
      <Button text="Click Me!" color="blue" fontSize={12} />
      <Button text="Don't Click Me!" color="red" fontSize={12} />
      <Button text="Click Me!" color="blue" fontSize={20} />
    </div>
  );
}
~~~
There are a few things going on here.

- The `Button` functional component now receives `props` as a function argument. The individual properties are then referenced within the component via `props.propertyName`.
- When rendering the `Button` components within `App`, the `prop` values are defined on each component.
- Inline styles are dynamically generated and then applied to the `button` element.

### Prop destructuring

A very common pattern you will come across in React is prop [destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment). Unpacking your props in the component arguments allows for more concise and readable code. Check out prop destructuring in action in the example below.

~~~jsx
function Button({ text, color, fontSize }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return <button style={buttonStyle}>{text}</button>;
}

export default function App() {
  return (
    <div>
      <Button text="Click Me!" color="blue" fontSize={12} />
      <Button text="Don't Click Me!" color="red" fontSize={12} />
      <Button text="Click Me!" color="blue" fontSize={20} />
    </div>
  );
}
~~~

### Default props

You may have noticed in the above examples that there is some repetition when defining props on the `Button` components within `App`. In order to stop repeating ourselves re-defining these common values, and to protect our application from undefined values, we can define default props that will be used by the component in the absence of supplied values.

~~~jsx
function Button({ text, color, fontSize }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return <button style={buttonStyle}>{text}</button>;
}

Button.defaultProps = {
  text: "Click Me!",
  color: "blue",
  fontSize: 12
};

export default function App() {
  return (
    <div>
      <Button />
      <Button text="Don't Click Me!" color="red" />
      <Button fontSize={20} />
    </div>
  );
}
~~~
As you can see, we now only need to supply prop values to `Button` when rendering within `App` if they differ from the default values defined on `Button.defaultProps`.

You can also combine default props and prop destructuring. Here's how it looks in action.

~~~jsx
function Button({ text = "Click Me!", color = "blue", fontSize = 12 }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return <button style={buttonStyle}>{text}</button>;
}

~~~

### Functions as props

In addition to passing variables through to child components as props, you can also pass through functions. Consider the following example.

~~~jsx
function Button({ text = "Click Me!", color = "blue", fontSize = 12, handleClick }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return (
    <button onClick={handleClick} style={buttonStyle}>
      {text}
    </button>
  );
}

export default function App() {
  const handleButtonClick = () => {
    window.location.href = "http://www.google.com";
  };

  return (
    <div>
      <Button handleClick={handleButtonClick} />
    </div>
  );
}
~~~

- The function `handleButtonClick` is defined in the parent component.
- A reference to this function is passed through as the value for the `handleClick` prop on the `Button` component.
- The function is received in `Button` and is called on a click event.

There are a few things to note here.

- We only pass through a reference to `handleButtonClick`, i.e. we do not include parenthesis when passing the function to `Button`. If we were to do something like `handleClick={handleButtonClick()}` then the function would be called as the button renders.

- You can rename the function to whatever you like when passing through as props, the prop name and value do not need to be the same. We could just as easily write `superCoolFunction={handleButtonClick}`.

- Every `Button` calling this function will navigate to the same page. We can refactor the function and supply a parameter within `Button` to customize this functionality.

~~~jsx
function Button({ text = "Click Me!", color = "blue", fontSize = 12, handleClick }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return (
    <button onClick={() => handleClick('https://www.theodinproject.com')} style={buttonStyle}>
      {text}
    </button>
  );
}

export default function App() {
  const handleButtonClick = (url) => {
    window.location.href = url;
  };

  return (
    <div>
      <Button handleClick={handleButtonClick} />
    </div>
  );
}
~~~

When supplying a parameter to the function we can't just write `onClick={handleClick('www.theodinproject.com')}`, and instead must attach a reference to an anonymous function which then calls the function with the parameter. Like the previous example, this is to prevent the function being called during the render.

<div class="lesson-note" markdown="1" >

There are also other ways to implement this behavior. Hint: [curried functions!](https://javascript.info/currying-partials)

</div>

Hopefully you can now understand from the examples in this lesson, just how incredibly useful props are for writing reusable and customizable React components. However, we are still only scratching the surface of what React can offer us. Continue on to the next section to learn even more!

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  Read through the React docs on [Passing Props to a Component](https://react.dev/learn/passing-props-to-a-component). Make sure to edit the code examples and experiment with different prop values.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#data-transfer-in-react">How does data flow between React components? From child to parent? From parent to child? Both?</a>
*   <a class="knowledge-check-link" href="#using-props-in-react">Why do we use props in React?</a>
*   <a class="knowledge-check-link" href="#default-props">How do we define default properties on a React component? What are some benefits in doing so?</a>
*   <a class="knowledge-check-link" href="#functions-as-props">How can we pass functions as props?</a>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
