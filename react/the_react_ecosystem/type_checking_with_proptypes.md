### Introduction

Type Checking is a process of verifying that a piece of code is using the correct data types for variables, function parameters and return values. In the context of React applications, we are going to use PropTypes to do that job.

PropTypes is a way to type check the props that a React component receives. It helps to catch potential type errors during development, making it easier to spot and fix bugs. If you have used a linter in your previous React projects, there's a good chance it ended up yelling at you about certain props missing in prop validation, however if that isn't the case- well, lucky you!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Setting up PropTypes.
- Using common PropTypes features.

### Getting started

To start using PropTypes in our React projects, we first need to install the corresponding library. We can do that with `npm`. In your React project run the following command:

~~~
npm install --save prop-types
~~~

Next, we want to import the PropTypes package in the component whose props we want to validate.

~~~javascript
import PropTypes from 'prop-types';
~~~

### Using propTypes

Here is a very basic example of how we would use it in a component that renders out a name prop.

~~~javascript
import PropTypes from 'prop-types';
import React from 'react';

const RenderName = (props) => {
  return <div>{props.name}</div>;
};

RenderName.propTypes = {
  name: PropTypes.string,
};

export default RenderName;
~~~

In this example, the component RenderName expects to receive a prop called `name` which is a string. If this prop is not a string, a warning will be displayed. If you want to make sure a prop is being passed in, use isRequired like so:

~~~javascript
RenderName.propTypes = {
  name: PropTypes.string.isRequired,
}
~~~

### Using defaultProps

Another cool thing we can do in combination with PropTypes is passing in default props:

~~~javascript
import React from 'react';
import PropTypes from 'prop-types';

const RenderName = (props) => {
  return <div>{props.name}</div>;
};

RenderName.propTypes = {
  name: PropTypes.string,
};

RenderName.defaultProps = {
  name: 'Zach',
};

export default RenderName;
~~~

In this example, with the help of the defaultProps property we are defining a default value for the `name` prop. This way, if the `RenderName` component is called without passing in the `name` prop, it will default to "Zach". When you do pass in props, they will take precedence over the default props.

### What about TypeScript?

Now is also a good time to mention [TypeScript](https://www.typescriptlang.org/) - a strongly typed language that builds on JavaScript. We do not cover it in our curriculum and thus do not recommend looking into it now, but in the future, it may be worth learning if you’d like more type safety while writing your code.

Learning TypeScript can be a lot of overhead when you’re already learning React and the best way to prepare for this is to continue developing your JavaScript fundamentals. [Even the TypeScript team advises this!](https://www.typescriptlang.org/docs/handbook/typescript-from-scratch.html#learning-javascript-and-typescript) In the future however, if you do decide to go in the direction of learning TypeScript, our recommendation would be picking up a previous project and refactoring the components one by one to TypeScript.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read through the [PropTypes documentation](https://reactjs.org/docs/typechecking-with-proptypes.html). It shows all of the types you can specify and some other useful things that can be done with it!
   - You may notice this resource suggests using TypeScript over PropTypes in modern React. This may well be true for production apps but for our purposes, we are solely interested in the concept of type checking within React, where TypeScript is out of scope.
1. You can even set up custom validators in PropTypes. Read [this article on using PropTypes on LogRocket](https://blog.logrocket.com/validate-react-props-proptypes/) for a more in-depth look into the benefits and use cases of PropTypes.
1. [This StackOverflow thread goes into the differences of TypeScript and PropTypes. ](https://stackoverflow.com/questions/41746028/proptypes-in-a-typescript-react-application)Give it a read!

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="#using-proptypes">How would we set up a basic implementation of PropTypes?</a>
- <a class="knowledge-check-link" href="#using-defaultprops">If we pass in a prop to a component that has a defaultProp defined, what would happen?</a>
- <a class="knowledge-check-link" href="https://stackoverflow.com/questions/41746028/proptypes-in-a-typescript-react-application">What is the difference between PropTypes and TypeScript?</a>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
