### Introduction

Certain components in React need to interact with things outside themselves. These things can be anything from querying data from a server to finding/changing the position of the component on the webpage or even sending some data to a server when necessary. This interaction with the _outside world_ is called a side-effect.

While we are already familiar with rendering code and adding event handlers, it is not enough for all uses, like when you want to connect to your server and fetch messages to show to a user. Effects let you run some code to synchronize your component as necessary, on rendering or a reactive/state value change rather than on a particular event.

Similar to how we have the `useState` hook, React offers us a handy `useEffect` hook to use effects in our components.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

*   What are effects?
*   How are effects used in React?
*   What are the different parts of an `useEffect` hook?
*   When should I use an effect?

### Using effect saves the day

#### The useEffect hook

Let us take a component in question. We want to make a `Clock` component that shows how many seconds have passed since the user has loaded the webpage. To update it every second, we can use our nifty `setInterval` function to add one to the `counter` state variable, every second. Let's try putting it in the body of our component.

~~~jsx
import React, { useState } from "react";

export default function Clock() {
  const [counter, setCounter] = useState(0);

  setInterval(() => {
    setCounter(count => count + 1)
  }, 1000);

  return (
    <p>{counter} seconds have passed.</p>
  );
}
~~~

Alas, we see our counter going berserk. The reason this occurs is that we try to **manipulate the state during render**. As we know, the component gets torn down and re-rendered every time the state updates, and we are updating the state every second, thus incrementing rapidly.

This is where the `useEffect` hook swoops in to save us. We can wrap this calculation inside an `useEffect` hook to move it outside the rendering calculation. It accepts a callback function with all the calculations.

~~~jsx
import React, { useEffect, useState } from "react";

export default function Clock() {
  const [counter, setCounter] = useState(0);

  useEffect(() => {
    setInterval(() => {
      setCounter(count => count + 1)
    }, 1000);
  })

  return (
    <p>{counter} seconds have passed.</p>
  );
}
~~~

But, it still keeps growing too fast! This is where another argument of the `useEffect` comes in: the dependency array.

#### The dependency array

By default, `useEffect` hook runs on every render. Since setting state tears the component down, we still get multiple setter calls on every render, which doesn't help us. 

Fortunately, the second argument accepts an array of dependencies allowing the hook to re-render **only when those dependencies are changed**. So if you have a state variable and want to have some side-effect occur any time the state changes, you can use this hook and mention the state variable in the dependency array.

We pass an empty array in this example because we do not want the `useEffect` hook to run anytime other than the initial component render.

~~~jsx
import React, { useEffect, useState } from "react";

export default function Clock() {
  const [counter, setCounter] = useState(0);

  useEffect(() => {
    setInterval(() => {
      setCounter(count => count + 1)
    }, 1000);
  }, [])

  return (
    <p>{counter} seconds have passed.</p>
  );
}
~~~

<div class="lesson-note" markdown="1">
Usually, you do not need to add dependencies to your `useEffect`hook manually. Your linter should let you know about the dependencies it expects. Letting the linter show errors and fixing them instead of suppressing them is usually the best idea. On a general note, the following block does a good job of summing this point up.

~~~jsx
useEffect(() => {
  // This runs after every render
});

useEffect(() => {
  // This runs only on mount (when the component appears)
}, []);

useEffect(() => {
  // This runs on mount *and also* if either a or b have changed since the last render
}, [a, b]);
~~~
</div>

#### The clean-up function

Oh, it's not going berserk anymore! We still have an issue with the counter updating twice every second though. That can be understood as a [behavior caused by the React StrictMode](https://react.dev/reference/react/StrictMode#strictmode). It is supposed to help us catch bugs, so what is that bug here?

Notice that every time the `useEffect` hook runs, a new `setInterval` is used.  When the component is unmounted, `setInterval` is not stopped, it keeps incrementing. This unnecessary behavior can be prevented by simply clearing the interval when the component is unmounted and that is where the third part of our `useEffect` hook comes in - the cleanup function.

You can return a function from the callback in the `useEffect` hook, which will be executed each time before the next effect is run, and one final time when the component is unmounted. In this case, let us clean up the interval with a cleanup function.

~~~jsx
import React, { useEffect, useState } from "react";

export default function Clock() {
  const [counter, setCounter] = useState(0);

  useEffect(() => {
    const key = setInterval(() => {
      setCounter(count => count + 1)
    }, 1000);

    return () => {
      clearInterval(key);
    }
  }, [])

  return (
    <p>{counter} seconds have passed.</p>
  );
}
~~~

Phew! It finally works! As the counter keeps merrily ticking on, let us sum up <span id="body-of-an-useEffect">what we know about the `useEffect` hook.</span>

~~~jsx
useEffect(
  () => {
    // execute side effect
    return () => {
      // cleanup function on unmounting or re-running effect
    }
  },
  // optional dependency array
  [/* 0 or more entries */]
)
~~~

### But do we need the effect?

`useEffect` is a mechanism outside the concepts that React usually applies, allowing you to sync your component with various external systems like a server, API, or browser DOM. The single question that you can ask yourself before you use an effect is if there are any such external systems that need to be synced with, apart from props or state. Unnecessary `useEffect` hooks are code-smell, error-prone, and cause unnecessary performance issues.

Let us address a few cases where `useEffect` does not need to be used.

*   You do not need to use an effect if you are only calculating something based on the state during rendering. For a change in a component, due to a change in the props, you can simply calculate and set it during rendering.

    ~~~jsx
    import React, { useState } from "react";

    export default function AdditionDisplay() {
      const [number1, setNumber1] = useState(0);
      const [number2, setNumber2] = useState(0);

      // This is all unnecessary.

      // const [sum, setSum] = useState(0);
      // useEffect(() => {
      //   setSum(number1 + number2);
      // }, [number1, number2]);

      const sum = number1 + number2;

      return (
        <p>{number1} + {number2} = {sum}</p>
      );
    }
    ~~~

*   You do not need effects for events. Code that runs when a component is **displayed** should be in effects, the rest should be in events.

    ~~~jsx
    import React, { useState } from "react";

    export default function App() {
      const [input, setInput] = useState("");

      const handleInput = (e) => {
        setInput(e.target.value);
      }

      // You should avoid direct manipulation when not necessary

      // useEffect(() => {
      //   document.getElementById("name").addEventListener("change", handleInput);
      //   return () => {
      //     document.getElementById("name").removeEventListener("change", handleInput);
      //   }
      // });
      
      return (
        <>
          {/* <input id="name" /> */}

          <input onChange={handleInput} value={input} />
          <p>{ input }</p>
        </>
      )
    }
    ~~~

*   You do not need an effect to reset the state based on a condition most of the time. You have learned about keys in React. Just like using a key on a list's item, adding one to a component, based on the state on which it should be reset creates a unique version of that component for each change in the value of the state.

*   If you are having issues with managing your state and want to use an effect to update the state of a parent or some other non-child component, consider <span id="lifting-the-state">**lifting the state**.</span> As we know, in React, the state flows in one direction, generally down the DOM. So the parents know of the data before passing it to the children. If multiple children are required to make use of a single state, it should be moved up to the parent that has all of the components that need it, instead of using escape hatches like an effect.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  [This lesson of the React docs](https://react.dev/learn/lifecycle-of-reactive-effects) talks about the life of a component, the different stages at which rendering takes place, and the role of `useEffect` in it.
2.  [Yet another article that explains a common mistake](https://dmitripavlutin.com/react-useeffect-infinite-loop) that beginners make, the infinite `useEffect` loop.
3.  [This article](https://dev.to/colocodes/6-use-cases-of-the-useeffect-reactjs-hook-282o) goes over some examples of the `useEffect` hook being used.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#introduction">What is an effect?</a>
*   <a class="knowledge-check-link" href="#body-of-an-useEffect">What constitutes an `useEffect` hook?</a>
*   <a class="knowledge-check-link" href="#but-do-we-need-the-effect">What is the one question we can ask to know when to use an effect?</a>
*   <a class="knowledge-check-link" href="#lifting-the-state">What do we mean by lifting up the state?</a>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   [This article, again from Epic React](https://epicreact.dev/myths-about-useeffect) goes over some common mistakes while using effects.
*   [This article from Epic React](https://epicreact.dev/why-you-shouldnt-put-refs-in-a-dependency-array) goes into how dependency arrays are supposed to be used.
