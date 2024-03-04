### Introduction

Any exciting application you build is likely to change over the time the user is exploring it. The changes could be as basic as toggling a dropdown menu or as complex as fetching data from an API. React provides primitives to manipulate the state of your apps, more specifically components, to make them dynamic. In this lesson, we will learn how to use state in React.  

Read  [What is State? by Academind](https://academind.com/tutorials/what-is-state) before we get started.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What is state?
- How to use state in React.
- What happens when the state changes in React?

### What is state in React?

We write components in React, A LOT of components, and many times we want them to undergo visual changes as a result of user or computer interactions. For this purpose, a component needs to "remember" things about itself. This is where state comes in. **State is a component's memory.**

Let's take a look at how we can use state in our code.

<iframe style="border: 1px solid rgba(0, 0, 0, 0.1);border-radius:2px;" width="100%" height="450" src="https://codesandbox.io/p/sandbox/unruffled-pasteur-6h36wf?file=%2Fsrc%2FApp.jsx%3A10%2C27&embed=1" allowfullscreen></iframe>

An app that changes its background color based on the clicked button. Take your time reading the code as we'll jump right in.

#### The useState hook

<span id="useState-hook">The `useState` hook is a built-in hook (we'll talk about hooks later) in React that allows you to define state in a functional component. It takes an initial value as a parameter and returns an array with two elements that we can destructure to get:</span>

1. The current state value
1. A function to update the state value

State definition with `useState` commonly follows this pattern:

```js
const [stateValue, setStateValue] = useState(initialValue);

// adapted for our use case:
const [backgroundColor, setBackgroundColor] = useState(initialColor);
```

Even without much knowledge of React, you can, to some extent, understand what's going on. The `backgroundColor` state is defined with the hook. Then on every button, we set up a *click* event handler that calls the `setBackgroundColor` function with the corresponding value. Then, magically the new color is applied to the background.

Adding more state variables should be as easy as adding more `useState` calls.

Great, you can now use state! But, what's going on under the hood?

### How does state work in React?

Let's hit you with some theory.

In React, when a component's state or props change, the component is destroyed and recreated from scratch. Yes, you heard that right: *destroyed*. This includes the variables, functions, and React nodes. The entire component is recreated but this time the latest state value will be returned from `useState`. This process is called rerendering. Rerendering is a key feature of React that enables it to efficiently update the user interface in response to changes in the underlying data.

<div class="lesson-note" markdown="1">

#### React reconciliation algorithm

The process of rerendering generates a new virtual DOM (Document Object Model) tree. The virtual DOM is a lightweight representation of the actual DOM that React uses to keep track of the current state of the UI. React then compares the new virtual DOM tree to the previous one and calculates the minimal set of changes needed to update the actual DOM. This is the reconciliation algorithm.

</div>

#### Explaining rerendering with the example above

Whenever `setBackgroundColor` is called, our `App` component is rerendered. Essentially, the component is recreated which means the `onButtonClick` function and our `div` and `button`'s are recreated as well. You might wonder, shouldn't the `backgroundColor` state be recreated as well? Well, React takes the responsibility of keeping track of the latest state and providing it to the component. The initial state value is only used for the component's first render and is ignored on subsequent renders.

![code illustration of rerendering](https://cdn.statically.io/gh/TheOdinProject/curriculum/abf5962ab36c951bab907a9952d09400651eab10/react/states_and_effects/introduction_to_state/imgs/00.png)

What we covered in this section is just a brief overview of a portion of React internals. You may be curious to learn more, but be advised, this is a deep rabbit hole. What we covered above is enough to get you through the React course.

### Hooks

Hooks are functions that let you use React features. All hooks are recognizable by the `use` prefix. For example, `useState` is a hook. We'll use more of these as we get further into the course. For now, remember that hooks have rules that we need to abide by:

1. Hooks can only be called from the top level of a functional component.
1. Hooks can't be called from inside loops or conditions.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read the following articles from the React docs:
    1. [State: A Component's Memory](https://react.dev/learn/state-a-components-memory)
    1. [Render and Commit](https://react.dev/learn/render-and-commit)
1. Read this [article on React Reconciliation Algorithm](https://medium.com/javarevisited/react-reconciliation-algorithm-86e3e22c1b40) for a great explanation.
1. Add a new state variable to keep track of the number of times the background color has been changed. Display the number of times the background color has been changed on the page.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- <a class="knowledge-check-link" href="#what-is-state-in-react">What is state?</a>
- <a class="knowledge-check-link" href="#useState-hook">What is the `useState` hook and how to use it?</a>
- <a class="knowledge-check-link" href="#how-does-state-work-in-react">What happens to the component when one of its state is changed?</a>
- <a class="knowledge-check-link" href="#hooks">What are some of the rules of hooks?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- You can go through the [GeeksforGeeks article on reconciliation](https://www.geeksforgeeks.org/reactjs-reconciliation/) for an in-depth look into the algorithm.
