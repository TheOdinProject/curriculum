### Introduction

How can we do DOM manipulations that we usually do in vanilla JavaScript? Is it even possible in React because of its declarative nature? How about performance optimization? As we all know, when a state has been changed, React will try to re-render the component, which means that it will destroy all local variables not controlled by React and re-execute them. This mental model also works for a regular function that you create, as a component is just a function. Since this is the case, wouldn't it slow down the app if we have a very expensive calculation re-executed with each re-render?

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explore `useRef` hook and its use cases.
- Explain memoization and how `useCallback` and `useMemo` can be used.

### The useRef hook

The `useRef` hook lets you manage a value that's not needed for rendering. They are an alternative to state, as when you want a component to “remember” some information, but you don't want that information to trigger new renders, you can use this hook.

They are often used when performing imperative actions or accessing specific elements rendered in the DOM. Refs can also *persist* values throughout the component's lifecycle, meaning that the value of the ref will not be destroyed every time a component re-renders. This is very useful when you want to store a value that you want to persist throughout the component's lifecycle without storing it in a state.

#### DOM manipulation

When building web applications, sometimes you need more direct control over specific elements in the DOM. The `useRef` hook comes to the rescue by providing a way to access and interact with those elements.

Imagine a button on a web page, and you want to focus on that button when the page loads. You could achieve this using the `useRef` hook. Here's how it works:

~~~jsx
import { useRef, useEffect } from "react";

function ButtonComponent() {
  const buttonRef = useRef(null);

  useEffect(() => {
    buttonRef.current.focus();
  }, []);

  return <button ref={buttonRef}>Click Me!</button>;
}
~~~

The implementation is straightforward:

1. We imported `useRef` and `useEffect` in the `react` module.
1. We created a ref object `buttonRef` with a `current` property initially set to `null`. Yes, passing an argument to `useRef` sets the value of `current` to `null` just like `useState`. This argument is ignored in subsequent renders.
1. Created a `useEffect` to be executed once on the mount of the component that will try to call the `focus` method of the button element.
1. We've attached `buttonRef` to the `ref` attribute of the button element. This establishes the connection between the `buttonRef` and the button in the DOM.

Whenever your website loads, it will automatically focus on the button element. You might ask, how can it have the `focus` method when the initial value is `null`? You should by now know that `rendering` and `painting of the screen` comes first before React runs the `useEffect`. It has already established the connection between the ref and the button before the effect is executed.

Also, remember that `useRef` hook isn't just limited to focusing elements. It can be used for various other DOM manipulation scenarios, such as scrolling to a specific position, measuring the dimensions of an element, triggering animations, and basically *any* DOM manipulation that you've done before with vanilla JavaScript. The possibilities are endless! For example, we can change the `useEffect` in the above snippet to do the following. Change the button's text, and after 2 seconds, change the text back. You **should not** do this and only use `useRef` for non-destructive DOM operations, but just an example:

~~~jsx
useEffect(() => {
  buttonRef.current.focus();
  buttonRef.current.textContent = "Hey, I'm different!";
  let timeout = setTimeout(() => {
    buttonRef.current.textContent = "Click Me!";
  }, 2000);

  return () => {
    clearTimeout(timeout);
  };
}, []);
~~~

The interesting thing about this is that this will **never** trigger a component re-render!

Another question that might pop up in your mind is, "Why not just use `querySelector` or other DOM manipulation methods that we've done previously in vanilla JavaScript?" Dealing with the DOM ourselves defeats the purpose of using React, and wherever possible we should let React *commit* to the DOM itself.

We can also see that it's similar to the `useState` hook in that it can store some values. The main difference is that `useRef` creates a mutable reference, allowing you to update its value without triggering a re-render. But, `useState` manages an immutable state that triggers re-renders when updated.

### The useMemo hook

In all of the examples, we would advise you to use the [Profiler component](https://react.dev/reference/react/Profiler) that is provided in the `react` module. If you want a more interactive alternative, use the `Profiler` in the [React Developer Tools](https://react.dev/learn/react-developer-tools). To measure rendering performance. Note that sometimes you don't need to optimize anything because of how fast things are already. As the famous saying goes in software development:

> Premature optimization is the root of all evil -- The Art of Computer Programming by Donald Knuth

The `useMemo` hook provides a way to add memoization inside our components. It's used to optimize expensive or complex calculations where it caches the result of a function call and stores it to be used later without recalculating it. The memoized value is, however, recalculated *only* when the dependencies of the `useMemo` hook change. And yes, this hook's parameters are the same as the `useEffect` hook you already know. The hook takes in two arguments: a `calculateValue` callback and a `dependencies` array.

#### Memoizing expensive calculations

In our previous projects, namely the Shopping Cart Project. You have some logic where you calculate the total price of the products added to the cart. You might or might not have a `Cart` component that functions as a drawer, where the user can open the cart every time they either click on the `Add to Cart` button or the Cart icon in the header.

An example of a `Cart` component:

~~~jsx
function Cart({ products }) {
  const totalPrice = products.reduce(
    (total, product) => total + product.price * product.quantity,
    0
  );

  return (
    <div>
      {/* Some other content in the cart */}
      {/* Products to display */}
      <p>
        Total Price: <strong>${totalPrice}</strong>
      </p>
      {/* Some button to checkout */}
    </div>
  );
}
~~~

In our `Cart` component, we have the total price of the products calculated directly inside the component. Every time the component is rendered or updated, the calculation is performed from scratch! That doesn't sound good... What if the user has added hundreds of thousands of products to the cart? Then it will lead to a sluggish user experience.

The `reduce` method iterates over each product and performs multiplication and addition for every item in the cart. This operation becomes *increasingly* time-consuming as the number of products increases.

Now imagine a user who frequently opens/closes the cart. Every time the drawer is opened, the `Cart` component is rendered, executing everything inside the component. This results in unnecessary recomputations of the same value even if the cart's content hasn't changed.

Let's see how we can use `useMemo` to address this:

~~~jsx
import { useMemo } from "react";

function Cart({ products }) {
  const totalPrice = useMemo(() => {
    return products.reduce(
      (total, product) => total + product.price * product.quantity,
      0
    );
  }, [products]);

  return (
    <div>
      {/* Some other content in the cart */}
      {/* Products to display */}
      <p>
        Total Price: <strong>${totalPrice}</strong>
      </p>
      {/* Some button to checkout */}
    </div>
  );
}
~~~

In the example above, we can easily memoize the calculated value by wrapping it in a `useMemo`, as the syntax is pretty much the same as `useEffect` and almost works the same. Where `useMemo` will also *execute* the callback on mount, and on subsequent re-renders, it will only *re-execute* the callback whenever one of the dependencies *changes*. In our case, whenever the `products` prop changes.

This way, whenever a user opens/closes the cart multiple times, it will not recalculate the `totalPrice` and use the cached value as long as`products` did not change.

#### Referential equality checks

For this example, we will use the `Profiler` component in the `react` module to measure the component's performance. We will also introduce `memo`.

You do not need to start a React application for this. We've already got you covered a bit later, we will be sharing an interactive example, but for now, think through the code on what you think will happen, what could happen, and so on. This could also be a great exercise in reading code and visualizing how it works.

Do note that this is just a very basic example. You will encounter a lot of passing of values to other components as prop, components that are very heavy to render.

~~~jsx
import React, { useState } from 'react';

const ButtonComponent = ({ children, onClick }) => {
  let i = 0;
  let j = 0;
  const ITERATION_COUNT = 10_000;
  while (i < ITERATION_COUNT) {
    while (j < ITERATION_COUNT) {
      j += 1;
    }
    i += 1;
    j = 0;
  }

  return (
    <button type="button" onClick={onClick}>
      {children}
    </button>
  );
};

function Counter() {
  const [count, setCount] = useState(0);

  const handleClick = () => {
    setCount((prevState) => prevState + 1);
  };

  return (
    <div>
      <h1>{count}</h1>
        <ButtonComponent onClick={handleClick}>Click me!</ButtonComponent>
    </div>
  );
}
~~~

You will likely want to have a separate button component where you can handle stylings and other things in it. So we have created a component called `ButtonComponent` as an example. This component takes the `children` and `onClick` props.

We can see that the click handler is defined in the `Counter` component, and we've passed it to the `onClick` prop of the `ButtonComponent`.

We know that a component renders whenever either state changes or prop changes. Anything inside that is not controlled by React is destroyed and re-executed. Functions, variables, etc. As a result, the function `handleClick` is re-created each time, and the prop `onClick` of the `ButtonComponent` also changes. Alright, so how can `useMemo` help in here?

We already know we can memoize a value using `useMemo`, right? Then we can just cache the function reference and use an empty dependency array so that it won't change.

Let's create a new function and name it `memoizedHandleClick`:

~~~jsx
const memoizedHandleClick = useMemo(() => handleClick, []);
~~~

We don't need to create a new function, but this is just to test these two functions. You can also directly do the following:

~~~jsx
// Syntax might be weird, but just remember that `useMemo` can take any value, and a function is also just a value `() => setCount((prevState) => prevState + 1)`

const handleClick = useMemo(
  // first arrow function is useMemo's callback
  // second arrow function is our function that will be called later, this one is going to be the cached value and what's going to be stored in `handleClick`
  () => () => setCount((prevState) => prevState + 1),
  []
);
~~~

Great, `useMemo` should help us here right? It shouldn't possibly re-render the `ButtonComponent` again correct? Nope, it will still re-render because whenever a component's `state` changes, it will also re-render its children, which could also be said differently - a component will re-render itself if its parent re-renders. Is there a way to fix this? Yes, there is! React in one of its APIs provides the [memo](https://react.dev/reference/react/memo) function that lets you skip re-rendering a component when its props are unchanged (yes, even if the parent re-renders). We can use this `memo` and wrap the `ButtonComponent` in it.

~~~jsx
import React, { useState, memo } from 'react';

const ButtonComponent = memo(({ children, onClick }) => {
  let i = 0;
  let j = 0;
  const ITERATION_COUNT = 10_000;
  while (i < ITERATION_COUNT) {
    while (j < ITERATION_COUNT) {
      j += 1;
    }
    i += 1;
    j = 0;
  }

  return (
    <button type="button" onClick={onClick}>
      {children}
    </button>
  );
});
~~~

Wrapping the component with a `memo` prevents the downward update that is triggered above the component. So, this component will only re-render when its `props` change or if its own `state` changes.

With all that said and done, test and break things in our interactive example:

<iframe style="border: 1px solid rgba(0, 0, 0, 0.1);border-radius:2px;" width="100%" height="450" src="https://codesandbox.io/p/sandbox/github/TheOdinProject/react-examples/tree/main/memoization-lesson-example?embed=1" allowfullscreen></iframe>

These are the scenarios that could happen:

1. If you've passed `handleClick` and the `ButtonComponent` has a `memo`. It will still re-render. Referential equality check fails (previous prop is *not equal* to the current prop).
1. If you've passed `memoizedHandleClick` and the `ButtonComponent` has a `memo`. It will not re-render. Referential equality check passes (previous prop is *equal* to the current prop).

This works with all values that will be passed as a prop. You might see it being used frequently with the Context API:

~~~jsx
const value = useMemo(
  () => ({ someState, someFunction }),
  [someState, someFunction]
);

return <Context.Provider value={value}>{children}</Context.Provider>;
~~~

### The useCallback hook

The `useCallback` hook provides another way to memoize a value, not just **any** value like `useMemo`. It can only memoize a function. Did you see the previous snippet that we have with memoizing a function reference with `useMemo`?

~~~jsx
const handleClick = useMemo(
  () => () => setCount((prevState) => prevState + 1),
  []
);
// or
const memoizedHandleClick = useMemo(() => handleClick, []);
~~~

With `useCallback`, we don't need to do that. It's specifically made for functions:

~~~jsx
import { useCallback } from "react";

// Inside a component
// Without useCallback
const handleClick = () => setCount((prevState) => prevState + 1);
// With useCallback
const handleClick = useCallback(
  () => setCount((prevState) => prevState + 1),
  []
);
// or
const memoizedHandleClick = useCallback(handleClick, []);
~~~

<span id="usememo-or-usecallback"></span>
Yay, there's only one arrow function, and it's simpler to read. There's nothing extra to `useCallback` other than it only memoizes functions. So the main difference between `useMemo` and `useCallback` is just the type of value it returns.

Which one should we use, then? Use `useMemo` for *any* value types, and use `useCallback` specifically for functions. At the end of the day, they both do similar things with a tiny difference, so use whatever you prefer.

### Conclusion

Phew, this was a long lesson. Refs and memoization are difficult concepts to grasp, but we're sure you'll understand them with practice. Refs particularly are really useful for some use-cases, as for memoization, only reach out to it when you absolutely need it. These topics also make for great interview questions, so make sure you know the difference between `useMemo` and `useCallback`!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. The article [When to useMemo and useCallback](https://kentcdodds.com/blog/usememo-and-usecallback) by Kent C. Dodds further introduces more examples of when to use `useMemo` and `useCallback` and why you shouldn't bother using it.
1. We've only learned about a basic implementation of the `useRef` hook. For more examples about its usage and why we should be wary of using the hook (more on the links they provided in the guide), check out the [interactive guide of the React documentation](https://react.dev/reference/react/useRef) for `useRef`.
1. The article [useRef instead of querySelector in React](https://meje.dev/blog/useref-not-queryselector) by Caleb Olojo briefly tells some unexpected behaviors when trying to manipulate the DOM directly with DOM manipulation methods and why we should prefer `useRef` over other DOM manipulation methods like `querySelector`. Check it out!
1. As we have learned, the `useRef` hook has other uses other than what we've primarily covered which is DOM Manipulation. Get to know more about its use-cases in this great article by Dan Abramov [Making setInterval Declarative with React Hooks](https://overreacted.io/making-setinterval-declarative-with-react-hooks/).

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you're having trouble answering a question, click it and review the material it links to.

- [Why should you prefer useRef hook over other DOM manipulation methods like querySelector?](https://meje.dev/blog/useref-not-queryselector)
- [What is the difference between useMemo and useCallback?](#usememo-or-usecallback)
- [How do useMemo and useCallback help optimize the performance of React components?](#useMemo)
- [When should you memoize a value?](https://kentcdodds.com/blog/usememo-and-usecallback)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- The `memo` function is straightforward that's why we didn't cover it too much, but if you want to know more about it, especially if you want to create your own logic for the `memo` function go to the [documentation for memo](https://react.dev/reference/react/memo).
