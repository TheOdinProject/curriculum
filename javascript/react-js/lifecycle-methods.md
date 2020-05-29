### Introduction

Now that we're done with your first project, you start getting quite advanced with React. So let's talk about some more advanced topics. The first to start with will be **lifecycle methods**. This is an incrediblly important topic, so pay close attention and make sure you understand everything.

Lifecycle methods are methods, defined by the React team, which are provided to us programmers, so you don't need to define them yourself. They are called when a component reaches a certain lifecycle. For example when the component mounts, renders or updates. You actually already know the most important lifecycle method, the `render` method. Soon you will know a few more, with a good understanding of when to use them and what tasks should be done within them.

One important thing to notice is, that lifecycle methods can **only** be used in `class components`. In functional components we have other options. But more to that in the next lesson. Let's start.

### Learning Outcomes

- Understanding the lifecycle of a component
- Knowing the most important lifecycle methods
- Understanding which tasks should be done in the different lifecycles

### Lifecycle

So lifecycle refere to litterally what the name suggests, a components lifecycle. What could a components lifecycle look like? Let me give you a quick example:

1. Creation of the component (componentDidMount)
2. Render of the component (render)
3. (Optional) Update of the component (componentDidUpdate)
4. Death of the component (componentWillUnmount)

A component can be in different states of his "life", and in react we can use those states to handle certain tasks.

### Render

We are already familiar with the render method in react, each class component needs to contain a render method, and it is fairly simple to understand. The render method contains all the logic your component should display on the screen. It might also contain a null, if you don't want to show anything.

### ComponentDidMount

As the name already suggests this method is run when the component is mounted, meaning when it is inserted in the DOM tree.

Common tasks that are done in this method are:

- Connect to web APIs or JavaScript frameworks.
- Set Timers using setTimeout or setInterval.
- Add event listeners.

### ComponentDidUpdate

This method is not called for the initial render, but any other time when the component updates. This method is a great place to work and operate on the DOM when the component has updated. For example you could do network requests. Just make sure to compare it to the current props.

### ComponentWillUnmount

This is the last lifecycle method, which will be called when the component is removed from the DOM tree. Usually you would do cleanup tasks in this method. This often incldues cleaning up what you added in the componentDidMount method.

A few examples are:

- Remove event listeners
- Cancelling network requests

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read [this](https://programmingwithmosh.com/javascript/react-lifecycle-methods/) article for a great overview over lifecycle methods in React
2. The React official documentations is also always a good source, it's well structured. In [this](https://reactjs.org/docs/react-component.html) article you can read more about lifecycle methods if you feel not secure yet.
3. Code along with [this](https://www.youtube.com/watch?v=m_mtV4YaI8c) video, it gives you a practical example about how those methods work and when React calls them.
</div>

### Additional Resources

- [Here](https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1) is another great resource for understanding React Lifecycle methods
