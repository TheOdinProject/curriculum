### Introduction

With all the concepts we have learned in this section, you are more than ready to create your own React applications. However, there are a lot of other, more advanced concepts out there that we haven't discussed, but need to inform you of.

This lesson will be used to introduce you to a few advanced concepts and give you some tips on your path as a React developer.
This section isn't meant to teach these concepts, but to give you a high-level overview to enable you to research in the event you need them or wish to learn more.

This lesson is meant as a checklist. Once you are secure with the basics, come back to this lesson and work through the advanced concepts. This doesn't have to be now. If you first want to move ahead in the curriculum and apply your knowledge or feel like you do not need a particular concept right now, just skip it and come back another time when you are ready.

As a friendly reminder, Google and StackOverflow are your friends! We should be familiar with these tools at our disposal at this point.

Good Luck!

### Learning Outcomes

By the end of this lesson, you should be able to do the following:

- Explain PropTypes.
- Explain Styled Components.
- Explain Redux and state management systems.
- Explain how Context API works.
- Explain how to make your own React Hooks.

### Guide to Advanced React

#### <span id="prop-types">1. PropTypes</span>

One common discussion about JavaScript is whether it would be better if you could declare types for variables and properties. Many programmers agree that the pattern of declaring types, which you have in many other programming languages is preferable because it allows you to catch errors, such as passing a string to a variable that should be a number. Therefore, React recommends using the [prop-types](https://www.npmjs.com/package/prop-types) for runtime type checking for React props and similar objects. If that's not enough for you, you could also use [TypeScript](https://www.typescriptlang.org/) with React.

#### <span id="styled-components">2. Styled Components</span>

If you start writing larger applications you will, with certainty, encounter the problem that you might want to style buttons or anything else across your application similarly. One way you could solve this problem is through code duplication (writing even the most basic CSS for each button). However, this wouldn't be a very good (or clean) code. The [styled-components](https://styled-components.com/docs) package provides a cleaner way to do this. It allows you to give some default stylings to HTML elements, meaning you define a button with some basic styling and reuse this button throughout your application. This way there is no code duplication and it allows your application to be more scalable.

#### <span id="redux">3. Redux</span>

You might have already heard about Redux. [Redux](https://react-redux.js.org) is the most popular state management system out there. It is not a part of React, but the two can be very easily combined. Together, they make up an extremely powerful duo. The purpose is to store your application's state in a single place, commonly called a "store". You then dispatch actions to the store, where a reducer will handle the state changes. The primary benefit of using a state management library is to prevent having to pass props through multiple levels of the component tree. A state management library is often only recommended for larger applications.

#### <span id="context-api">4. Context API</span>

As your application becomes larger and you have multiple components to ensure reusability, you might find yourself passing props through a lot of components in the middle or you might have a lot of components that require the same props. This pattern is known as `prop drilling`. To help avoid this, React provides the Context API that lets a parent component provide data to all the components in its tree without having to pass props. Imagine that you have implemented an optional dark theme in your website and quite a few of your components require this theme data to correctly style itself - having a `context` of your theme will allow all children components to have access to this data.

The [Passing Data Deeply with Context webpage](https://react.dev/learn/passing-data-deeply-with-context) on React Docs does an excellent job of explaining on how to use the Context API. Furthermore, if you wish to learn more advanced concepts in React, [React Docs](https://react.dev/) is a great resource to dig into.

#### <span id="more-hooks">5. More Hooks</span>

There are a lot of [hooks](https://react.dev/reference/react) out there, with the number only increasing by the day (since you can write your own!). As you have seen in previous lessons, it seems like the React team wants us to use more functional components with hooks in the future, so it is definitely worth getting to know both the hooks that are built-in to React, as well as how to create your [own](https://react.dev/learn/reusing-logic-with-custom-hooks).

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* [What are PropTypes and why can it be beneficial to use them?](#prop-types)
* [What are Styled Components and how do they make your code cleaner?](#styled-components)
* [What is Redux and why are state management systems used in many large applications?](#redux)
* [What is prop drilling and how can you use Context API to avoid it?](#context-api)
* [How can you create your own Hooks?](#more-hooks)
