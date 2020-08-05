### Introduction

The last lesson has given you a quick overview about the three most popular Frontend Frameworks (Vue.js, Angular, React.js). This section aims to provide you with all you need to know about React, to feel the power of a Frontend Framework and also to help you create highly scalable React applications as well as beautiful websites. But before we jump right into it we need to answer one question.

### Why React?

As you already know from the previous section, React is one of the most powerful and widely used Frontend frameworks. If you have done the previous lesson and are here because you decided react is the framework to go for, you can skip this "Why React?" part of this lesson. However if you just stumbled over this, or if you are still unsure about weather to learn react or not, let me convince you.

The landscape for frontend frameworks has been changing a lot over the last few year, so it is totaly understandable to be "scared" of going for the "wrong" one.
[This](https://stackoverflow.blog/2018/01/11/brutal-lifecycle-javascript-frameworks/) article shows the recent development of frontend frameworks quite well.

However, once you started diving deeper into a Framework you will start loving it, I promise. It makes your coding scalable, much more readable and probably a thousand times more efficient (just my modest estimation).

Just to name a few reasons why to learn React.js:

- Reusability of components
- Amazing community
- React is unopinionated, which means that it won't force you to follow any specific patterns or logics, it's all up to you.
- Pretty easy to learn, especially when you already have a good grasp of JavaScript and Html, which you do when you followed the previous courses
- React uses the virtual DOM, which makes it extremely fast and efficient

If you need more convincing this 2020 [stackoverflow developer survey](https://insights.stackoverflow.com/survey/2020#technology-web-frameworks-all-respondents2) should be reason enough to get excited about learning React. Still unsure? Check out [this](https://medium.com/@SilentHackz/top-10-reasons-why-you-should-learn-react-right-now-f7b0add7ec0d) article.

_convinced and excited? Great, because it's gonna change your life. Let's dive right into it._

### Components

Everything in React is made of (reusable) components, they are your building blocks in react. In order to be confident using react, you should learn to divide your application or project into components. The following picture gives you an idea on how to do that with a very basic app.

![Simple Homepage](./assets/BlogPost.png)

For example this simple website could be divided into the following sections (components):

- `App` which represents your main application and which will be the parent of all the other components
- `Navbar` which will the the Navigation bar
- `MainArticle` which will be the component that renders your content
- `NewsletterForm` which is a simple form, that let's a user input his email to receive the weekly Newsletter

In React each component is an own ES6 module, which is per se independent. But through the in ES6 introduced `import` statement you can import components into other components like so:
`import ExampleComponent from "./components/ExampleComponent`. This allowes us to write each component as an own module in a seperate file, and later on import all modules to the file that contains them. (In our case that would be App.js)

At the beginning it might be a little bit difficult to find out the best component structure, especially when state and props come into play, but that's the topic for the next sections. Don't worry too much about the component structur for now, this comes with experience, you'll figure it out. React components in general can and usually have parent- or child components. This system of structuring your applications component-base helps to keep your code structured and makes it easy to keep track of your components relationships with each other.

To give you an example of a very basic component, it could looks like this:

```javascript
import React, { Component } from 'react'

class App extends Component {
    constructor() {
        super()
    }

    {/* Javascript functions can we written here */}

    render() {
        return (
            <div className="App">
            Hello World!
            </div>
        )
    }
}

export default App
```

Don't get overwhelmed it isn't as difficult as it might look at the beginning. Let's walk through it step by step.

```javascript
import React, { Component } from "react";
```

With the above `import` startement we are importing React and the Components module from React, which allows us to create a class component. If you are wondering why we have to wrap `Component` into curly brackets and `React` not, this is due to the way they are exported from the `react` module. Everything exported as a default can be imported without curly brackets, everything else has to be imported wrapped in curly brackets. Don't worry about this too much, we will get back at it shortly.

```javascript
class App extends Component {
    {/* Some logic we haven't yet talked about. */}
}
```

Secondly we are declaring the class component, which really is just a Javascript class, that extends Component, which we imported earlier. One thing to notice is that React components should always be declared with a capital letter at the beginning. This is just a naming convemtion used by most of the developers and recommended by React core team at Facebook.

```javascript
constructor() {
    super()
}
```

Next is the constructor, which we also have in a javascript class. A Constructor is not obligatory in a class component, but most likely you will encounter one, because it gets quite important when we get to concepts like inheritance and state. So to get used to it, it's already included here. You will usually see developers passing `props` as an argument to the constructor and also to the `super()` call which has to be called in any constructor. However, you will not learn about props here, we discuss this in the next lesson, but in short, props are used in react to pass properties from a parent component to child components. But as I said, don't worry too much about that now, we will talk about it in full later on.

```javascript
{/* Some logic we haven't yet talked about. */}
```

This syntax might look a little bit weird at first, but it is nothing else than a simple comment. In React you write comments within curly brackets and quotes.

```javascript
render() {
    return (
        <div className="App">
        Hello World!
        </div>
    )
}
```

And the probably most unfamiliar thing is the render function, which returns something that looks like HTML, but is actually JSX. And that's already one of the main things about react, the ability to combine Javascript and JSX. JSX is really nothing else than an HTML like syntax that will be transpiled by transpilers like babel into Javascript, in order for a browser to be able to read it. One thing you should know about JSX is that you can't use the in HTML protected words, such as "class" or "onchange". That's why instead of "class" you write "className" and instead of "onchange" you write "onChange". In general all attributes in JSX are written in camel-case. You should be fairly familiar with that naming convention from the naming of variables in Javascript. The render function you see is the most used React lifecycle function (more to that in another section). The only thing you should know for now is that every React class component needs a render function, which returns _one_ JSX element. So whatever you want to return needs to be wrapped in a single element.

Last but not least to be able to reuse this `App`component we just declared in other files in our project we have to export the component. In our example we export the component as the file's default export:

```javascript
export default App;
```

If you have mutliple components in one file, you could just export each component separately by adding the `export` keyword before the declaration of the component. Remember that initially we said the way we import components depends on the way we export it? That is exactly what we were talking about. If you export a component as a default, you can import it without wrapping curly brackets around it. If you export multiple components, you have to import them inside of curly brackets.

Great, so far so good! We have already learned a lot about components in React, and let me tell you, class components are just one way of defining components in React, another way is to use functional components.

A basic functional component looks like the following

```javascript
import React from "react";

const App = () => {
  return <div className="App">Hello World!</div>;
};

export default App;
```

As you can see, there are a couple differences of functional and class based components.

1. We don't have to import and extend "Component" from react;
2. We don't need a constructor.
3. We don't need the render function, but instead a return statement

There are more differences, which we will encounter when talking about props and state.

For a better basis of react components read [this](https://dev.to/sarah_chima/an-introduction-to-react-components-cke) short article, it provides a great overview.

For further understanding of the difference between functional and class based components read [this](https://medium.com/@Zwenza/functional-vs-class-components-in-react-231e3fbd7108) article. They are already talking about concepts like state and life-cycle methods, which we haven't talked about yet. However, you can already keep it in mind, because it will prove usefull later on.

### Create-react-app

Developers at facebook came up with a great tool called create-react-app, which sets up a complete react app for you, by just running one command it does all the necessary setup and configuration in order for you to start directly with your project.

If you want to see all the things we have discussed in action, go ahead an run `npx create-react-app my-first-react-app` in your terminal and cd into the project `cd my-first-react-app` then open it in your text editor of choice. If you want you can run the project through the command `npm start`

### Index.js and App.js

Two of the most important files create-react-app includes for you are index.js and App.js. Index.js is the entry point of your application by default. Open up you index.js file and check out this line:
``ReactDOM.render(<App />, document.getElementById('root'))`
In short, what this line of code does is that it tells react to render the App component into the DOM, exactly into the element with the id "root". Every create-react-app project has a root div, which is visible in the index.html file in your public directory. That means, should you decide to name your main application component different than App.js, make sure to change the index.js as well.

If you want to get a better understanding of how create-react-app works and which files it creates for you, make sure to check out [this](https://blog.logrocket.com/getting-started-with-create-react-app-d93147444a27/) great article and watch [this](https://www.youtube.com/watch?v=rUdtgnwrA14) video to really understand the file system create-react-app sets up for you.

### Learning Outcomes

- Why you should learn React?
- What is JSX?
- What is a React Component?
- What is the difference between a functional and a class based component
- How can you structure your application into components?
- Understanding create-react-app and the files it creates for you

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read the first couple of pages of the react.js documentation. In general their documentation is a great ressource for comming back at a later point if you have to get more familiar with certain concepts or have to fresh up something. So let's get started. Read [this](https://reactjs.org/docs/hello-world.html), [this](https://reactjs.org/docs/introducing-jsx.html), [this](https://reactjs.org/docs/rendering-elements.html) and [this](https://reactjs.org/docs/components-and-props.html) article. In the last one they already introduce the concept of props. We haven't looked at that yet, so don't worry too much about it, but it can't hurt having a look at it.
2. Watch [this](https://www.youtube.com/watch?v=JPT3bFIwJYA&list=PL55RiY5tL51oyA8euSROLjMFZbXaV7skS) video to get another quick explanation of react. And then watch those ([one](https://www.youtube.com/watch?v=G40iHC-h0c0&list=PL55RiY5tL51oyA8euSROLjMFZbXaV7skS&index=4), [two](https://www.youtube.com/watch?v=9wK4gHoOh1g&list=PL55RiY5tL51oyA8euSROLjMFZbXaV7skS&index=5)) videos from the same series, which focus on components. Feel free to code along with the whole course if you enjoy it.
</div>

### Additional Resources

- [This](https://www.youtube.com/watch?v=JPT3bFIwJYA&list=PL55RiY5tL51oyA8euSROLjMFZbXaV7skS) video series is a great introduction to react.
- [This](https://www.youtube.com/watch?v=QFaFIcGhPoM&list=PLC3y8-rFHvwgg3vaYJgHGnModB54rxOk3&index=1) video series really provides it all. Watch it for a greater understanding of the most important react concepts.
- [This](https://www.youtube.com/watch?v=deyxI-6C2u4) video shows you how to set up a react application, without using create-react-app
