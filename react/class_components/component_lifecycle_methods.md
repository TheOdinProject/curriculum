### Introduction

In the previous section, you've learned about a component's lifecycle. In functional components, we've primarily used the `useEffect` hook to perform tasks throughout the lifecycle, but in class components we have to use specific lifecycle methods instead.

We'll start with a short recap of what a components lifecycle is. There are three stages to a component's life: mounting, updating, and unmounting. Each of these have a method assigned to them within class components, which is what we are going to cover in this lesson.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to use lifecycle methods in a class component

### render()

The render function is the most used lifecycle method, and one that you've come across in the last class components lesson. It is the only required lifecycle method in a class component. It runs on mount and update of a component. Render should be pure, meaning it doesn't modify component state, returns the same thing each time it's called (given the same inputs), and doesn't directly interact with the browser.

### componentDidMount()

This method is run after the component is mounted (inserted in the DOM tree). You should make any calls to fetch data that is needed for the component here. It is also a good place to do anything that is reliant on the component, such as drawing on a canvas element that you just rendered.

### componentDidUpdate()

This method is run after a component re-renders. Because of this, you have to be careful about what you update in this method, as if you're updating state indiscriminately, a re-render is caused, and you'll end up in an endless loop. You can avoid this issue by using conditional statements about the equality of previous and current props when updating state.

In this method you should be updating anything that needs to be changed in response to either the DOM changing, or any states that you might want to act on upon change. For example, you'd want to refetch user data if the user changes.

### componentWillUnmount()

This is the last lifecycle method, which is called before a component is unmounted and destroyed. In this method you should be performing cleanup actions, so that would be cancelling network requests, clearing timers, etc.

### How useEffect() combines the lifecycle methods

Now that we've learnt about class lifecycle methods, it's useful to understand that the `useEffect` hook used in functional components is essentially a combination of `componentDidMount`, `componentDidUpdate`, and `componentWillUnmount`. Which method/methods it relates to varies based on it's dependency array, and if it returns anything.

- An empty dependency array would be equivalent to `componentDidMount`.
- A dependency array with a value/values in it would be a combination of `componentDidMount` and `componentDidUpdate`, but only updating when dependencies change.
- No dependency array would be equivalent to `componentDidMount` and `componentDidUpdate` combined.
- A return function inside of a `useEffect()` hook would be equivalent to `componentWillUnmount`.

For example:

```js
  useEffect(() => {
    placeholderFunction();
    return () => cleanupFunction();
  }, [])
```

In this snippet, the useEffect contains the functionality of `componentDidMount`, and `componentWillUnmount` via the return function. This example doesn't have the `componentDidUpdate` functionality because of an empty dependency array.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Check out this [lifecycle diagram](https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/) to see a good visual representation of a components lifecycle methods.

1. Read this [component lifecycle documentation](https://reactjs.org/docs/react-component.html#the-component-lifecycle) by the people who made react!
    - You only have to worry about the methods in bold, but you can read up on the others if you're curious - they're uncommon and you likely won't need them in
      most of your apps.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is the only required lifecycle method?](#render)
- [What lifecycle method should you use for initial data fetching?](#componentdidmount)
- [When you want to act upon change of the DOM, or of state, what lifecycle method would you use?](#componentdidupdate)
- [When performing cleanup actions, what lifecycle method should be used?](#componentwillunmount)
- [How does the useEffect hook combine some of the lifecycle methods?](#how-useeffect-combines-the-lifecycle-methods)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
