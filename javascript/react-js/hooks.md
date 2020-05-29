### Introduction

As already said in the previous lesson, the lifecycle methods such as `componentDidMount`, `componentDidUpdate` but also the `render` method can only be called in class components. This was a reason why functional components were for long refered to as "dumb" or "stateless" components. They were usually just used to return some JSX, because of their inability to have a state or lifecycle methods. But since the introduction of Hooks this has changed completeyly.

**Hooks allow functional components to also have a lifecycle as well as a state.**

Besides the basic hooks you will encounter in this section, there are many other hooks such as `useRef` or `useContext`, just to name two. React also provides the ability to write your own custom hooks. This changes the whole game between functional vs. class components. Now functional components are not the "dumb" components anymore, actually a lot of programmers even prefere functional components over class components now, and it seems like this trend is increasing. For more information have a look [here](https://dev.to/danielleye/react-class-component-vs-function-component-with-hooks-13dg)

So let's get to the most basic hooks. Create a `create-react-app` and use the App.js file for the following examples. We won't actually create a lot of functionality, but when coding along you will remember everything better. Thanks to muscle memory.

### useState

So finally, as already mentioned in an earlier section we will be coming back here to discuss how to use state in functional components. The `useState` hook makes it possible to declare a state in functional components. Here is an example on how to use it:

```javascript
import React, { useState } from "react";

const App = () => {
  const [count, setCount] = useState(0);

  const incrementCount = () => {
    setCount(count + 1);
  };

  return (
    <div>
      <div>{count}</div>
      <button onClick={incrementCount}>Increment</button>
    </div>
  );
};

export default App;
```

Go try this out in the browser.

Ok so what's going on here. First, we have to import the `useState` hook from react.
Then we can declare a state like this: `const [count, setCount] = useState(0)`. This is the syntax to declare a state. The name "count" and "setCount" is totally up to us, we could also call it "something" and "somethingElse" but this wouldn't be very good, because then "somethingElse" would be called to set "something" in the state. You see, it doesn't read easily. So there is a convention to always call the second value like the first, just with a "set" in front. The `useState(0)` call initializes our state with the value we set in brackets (0).
Afterwards we are declaring a function, which right now just sets a new count. In this case we are incrementing the current count with one. This function will be called anytime we click the button. And in the div above the button we are just displaying the current state. Easy right. So one thing to mention here is that setting the state is an asynchrones task, always keep that in mind. Another thing is, that setting the state calles a rerender. That's the reason we see the new count when clicking the button, if it wouldn't trigger a rerender then we would still see the old count. So after setting the state, our component updates. If you remeber the last lecture, we might want to use this opportunity of updating to do some tasks. But unfortunately we don't have any lifecycle methods in functional components right?

### useEffect

Well, we don't have any lifecycle methods such as `componentDidMount`, `componentDidUpdate` or `componentDidUnmount`, but we have something better. We have `useEffect`, which can actually do everything the above mentioned lifecycle methods can do. All that functionality just in one Hook, amazing right? Let's have a closer look.

```javascript
import React, { useState, useEffect } from "react";

const App = () => {
  const [color, setColor] = useState("black");

  useEffect(() => {
    document.addEventListener("click", changeColorOnClick);

    return () => {
      document.removeEventListener("click", changeColorOnClick);
    };
  }, [color]);

  const changeColorOnClick = () => {
    if (color === "black") {
      setColor("red");
    } else {
      setColor("black");
    }
  };

  return (
    <div>
      <div
        id="myDiv"
        style={{
          color: "white",
          width: "100px",
          height: "100px",
          position: "absolute",
          left: "50%",
          top: "50%",
          backgroundColor: color,
        }}
      >
        This div can change color. Click on me!
      </div>
    </div>
  );
};

export default App;
```

So maybe you try it out first, to see what is happening.
Once you've done that, let's go through it in all detail.
You should be already familiar with the `useState` logic implemented. So basically we are just saving a color in state and on click we are changing the color saved in state. Applied is this color to our div element. Don't worry about all the inline styles of the div, the only important thing within this styles object is where we set the background to the color that is currently saved in state.
Now the only thing we haven't looked at is the `useEffect` hook. And as I already said, this hook can do a lot. So let's look at it in detail.
The syntax is as follows:

`useEffect(() => {}, [])`

In the curly brackets you can write the code that will be executed. The dependency array in the end is optional. You have three different options for the dependency array.

1. Leave it empty. If you leave it empty the useEffect hook would look something like this:

```javascript
useEffect(() => {
  // Do something
}, []);
```

This option is equal to a `componentDidMount` lifecycle method, meaning the hook runs **one time** when the component mounts (is inserted in the DOM tree)

2. Add a dependency to the array. Like we did it in our example code.

```javascript
useEffect(() => {
  // Do something
}, [color]);
```

This way, the useEffect hook will re-run anytime the depenceny (color) changes. This is similar to a `componentDidUpdate` method, with the only difference that it only runs when a certain condition changed.

3. Leave out the dependency array.

```javascript
useEffect(() => {
  // Do something
});
```

You can also completely leave out the dependency array, this way the useEffect hook runs anytime the component is updated, **AND** right after the initial render. This is the difference to the `componentDidUpdate` lifecycle method, because it also runs after the initial render. This way it would be equal to a `componentDidMount` and `componenDidUpdate` method combined.

So far so good. But there is more we have to talk about. The return statement we are adding to our useEffect is acually equal to a `componentWillUnmount` method. Whaaat? Yes you heard that right.

```javascript
return () => {
  document.removeEventListener("click", changeColorOnClick);
};
```

If you write a return statement like the above in a useEffect, it will do the same as a `componentWillUnmount` method. Amazing right? You see, there is a lot to the useEffect hook. And in further projects you will use quite a bit. For now let's leave it like this. I hope you understood everything so far, and don't worry if not you will get some more input about the useEffect hook in the assignment section.

There are more hooks out there with great application areas, and it definitively makes a lot of sense to inform yourself about the other ones as well. You can also create your own custom hooks if desired. However, with the above mentioned hooks `useState` and `useEffect` you will be fine in most of your smaller projects. In the comming assignment you can read more about other hooks as well, make sure to at least grasp the basics, or come back later to learn more.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. The React documentation provides a whole section on hooks. Read through all steps [here](https://reactjs.org/docs/hooks-intro.html), but you can skip the parts where it goes in too much detail. You can always refere back to this page anytime. Just make sure you understand the concept. The goal here is to give you a good basic understanding of the most important concepts
2. Now go back to your CV Project and rewrite it using functional components and hooks.
</div>

### Additional Resources
