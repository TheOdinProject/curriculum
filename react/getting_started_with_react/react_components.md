### Introduction

In this lesson we'll be going over the basics of React components - what they do, and how to write them. Make sure to use the project you set up in the previous lesson, but try not to copy and paste any code while you're coding along.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What are components?
- How are components created?
- Where do components live?

### What are components?

The beauty of React is that it allows you to break a UI (User Interface) down into independent reusable chunks, which we will refer to as components. The following picture should give you an idea of how to do that when building a very basic app.

![Component Example](https://cdn.statically.io/gh/TheOdinProject/curriculum/91485eec76445d86b29d35894e83324e2967f2fb/react/imgs/00.png)

For example, this website could be broken into the following components:

- `App`, which represents your main application and will be the parent of all other components.
- `Navbar`, which will be the navigation bar.
- `MainArticle`, which will be the component that renders your main content.
- `NewsletterForm`, which is a form that lets a user input their email to receive the weekly newsletter.

Think of these reusable chunks as JavaScript functions which can take some kind of input and return a React element.

### How to create components

To get the feel of working with components, we're going to practice creating functional components. What are functional components? Javascript functions! Let's have a look.

~~~jsx
function Greeting() {
  return <h1>&quot;I swear by my pretty floral bonnet, I will end you.&quot;</h1>;
}
~~~

This might look mostly familiar to you - it's a JavaScript function, which returns JSX. Open up the project you were working on, create a new file named `Greeting.jsx`, and in that file write your own handmade functional component. Name it whatever you wish, and have it return whatever JSX you wish.

Are you done? Check the naming of your function! Is it capitalized? Keep this key difference in mind. **React components must be capitalized** or they will not function as expected, which is why we capitalized `Greeting()`. More about that later.

<div class="lesson-note">

<h4>HTML escape code</h4>

In the above example, <code>&amp;quot;</code> is an escape code we use to render <code>"</code>. Your linter will greet you with an error if you use regular quotes. You can use <a href="https://www.lambdatest.com/free-online-tools/html-escape" target="_blank">this LambdaTest tool for escaping HTML characters</a> if you run into such errors, or read more about <a href="https://www.w3.org/wiki/Common_HTML_entities_used_for_typography" target="_blank">escape codes on w3.org</a>

</div>

#### What is HTML doing in my JavaScript?

It's JSX. It looks jarring at first, but soon we'll realize how cool it is. We'll learn all about it in the upcoming lessons!

### Where do components live

So remember how our component is just hanging out in its own dedicated file? This makes it independent from the rest of the codebase! That said, while independence is great, we do want the component to use functionality created elsewhere, and to share itself with other components. How can we do this? `import`ing and `export`ing! For a very long time in React development, it was necessary to `import` React in your JavaScript files that used React components, but since React v17.0 it is no longer required. Let's `export` our newly created component so that parent components can use it as a child throughout your project.

~~~jsx
function Greeting() {
  return <h1>&quot;I swear by my pretty floral bonnet, I will end you.&quot;</h1>;
}

export default Greeting;
~~~

Are we done? Well let's think about this - we've declared our component, and exported it, but does `main.jsx` know about it yet? Nope! Let's fix that. Let's look at `main.jsx`, we can see that `render()` is rendering the `App` component. Let's replace that `App` component with our newly created greeting, which we'll have to make sure is first imported properly. The end result should look something like this:

~~~jsx
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import Greeting from './Greeting.jsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Greeting />
  </React.StrictMode>,
)
~~~

Remember that `<Greeting />` should be capitalized! Try using lower case for the import, function name and component and see what happens! When the JSX is parsed, React uses the capitalization to tell the difference between an HTML tag and an instance of a React component. `<greeting />` would be interpreted as a normal HTML element with no special meaning, instead of your shiny new React component.

Otherwise, just like that, you've successfully imported and used your first custom-made component, congratulations!

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  It's time to create some new components! Use the same project, but play around with it, try displaying something like your favorite food.
    - While components normally get exported as defaults, try using some named exports instead of default exports. If you're unsure how to do this, consult your best friend: [the MDN documentation about export statements](https://developer.mozilla.org/en-US/docs/web/javascript/reference/statements/export#description)
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="#what-are-components">What does a React element look like?</a>
- <a class="knowledge-check-link" href="#how-to-create-components">How would you create a functional component?</a>
- <a class="knowledge-check-link" href="#where-do-components-live">How do you export and then import a component?</a>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- Geeks for Geeks has a quick [ReactJS Functional Components tutorial](https://www.geeksforgeeks.org/reactjs-functional-components/). It introduces some new ways of calling functional components you can play around with if you feel a burning desire to do so. For the time being don't worry too much about Class components, which the resource also goes into.
