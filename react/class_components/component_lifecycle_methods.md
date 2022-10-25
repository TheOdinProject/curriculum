### Introduction

In the previous section, you've dealt with the component lifecycle through the useEffect function. This is how you've run code based on a components lifecycle stage so far, but in class components we have to use specific lifecycle methods instead.

We'll start with a short recap of what a components lifecycle is. There are three stages to a components life, mounting, updating and unmounting. Each of these have a method assigned to them within class components, which is what we are going to cover in this lesson.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

*   What the different lifecycle methods are.
*   How we can use these lifecycle methods in our app.

### Render
The render function is the most used lifecycle method, and one that you've come across in the last class components lesson. It is the only required lifecycle method in a class component. It runs on mount and update of a component. Render should be pure, meaning it doesn't modify component state, returns the same thing each time it's called (given the same inputs), and doesn't directly interact with the browser. 

### ComponentDidMount

This method is run after the component is mounted (inserted in the DOM tree). You should make any calls to fetch data that is needed for the component here. It is also a good place to do anything that is reliant on the component, such as drawing on a canvas element that you just rendered.

### ComponentDidUpdate

This method is run after a component re-renders. Because of this, you have to be careful about what you update in this method, as if you're updating state indiscriminately, a re-render is caused, and you'll end up in an endless loop. You can avoid this issue by using conditional statements about the equality of previous and current props when updating state.

In this method you should be updating anything that needs to be changed in response to either the DOM changing, or any states that you might want to act on upon change. For example, you'd want to refetch user data if the user changes.

### ComponentWillUnmount

This is the last lifecycle method, which is called before a component is unmounted and destroyed. In this method you should be performing cleanup actions, so that would be cancelling network requests, clearing timers, etc.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  Check out this [lifecycle diagram](https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/) to see a good visual representation of a components lifecycle methods.

2. Read this [component lifecycle documentation](https://reactjs.org/docs/react-component.html#the-component-lifecycle) by the people who made react!
    *   You only have to worry about the methods in bold, but you can read up on the others if you're curious - they're uncommon and you likely won't need them in 
        most of your apps. 
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#render">What is the only required lifecycle method?</a>
*   <a class="knowledge-check-link" href="#componentdidmount">What lifecycle method should you use for initial data fetching?</a>
*   <a class="knowledge-check-link" href="#componentdidupdate">When you want to act upon change of the DOM, or of state, what lifecycle method would you use?</a>
*   <a class="knowledge-check-link" href="#componentwillunmount">When performing cleanup actions, what lifecycle method should be used?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
