### Introduction

You're likely somewhat familiar with JSX from previous react lessons, in this lesson we're going to explain _what_ it is, _why_ we use it, and _how_ to use it in your react apps.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- What JSX is.
- Why we use JSX.
- Differences between JSX and html.
- How to write and take advantage of JSX's features.

### What is JSX?

JSX is a syntax extension for Javascript that lets you write HTML-like markup inside a Javascript file. It's not required to use JSX when writing react components, but it does make writing them more simple and concise.

Under the hood, JSX elements compile down to react (try logging a JSX component in the console to see for yourself).

### Why do we use JSX?

Most of the time in apps, rendering logic and markup are inherently coupled, but we typically separate them by having our logic and markup in separate files. JSX allows React to separate concerns by containing both rendering logic and content in the same place (a component).

On top of this, it's a more intuitive, visual way to work with the UI inside your code, and allows react to show more useful error and warning messages.

### Converting HTML to JSX

If you were to take some valid HTML and copy it straight into your react component, it would not work. This is due to some of the rules JSX implements, that aren't present in HTML.

#### Rules of JSX:

1. Return a single root element.

   If you wish to return multiple elements in a component, you can do so by wrapping them in a parent tag. This can be a `<div>`, or, if you don't want the elements to have a container, you could use a [React fragment](https://beta.reactjs.org/apis/react/Fragment), like so: `<>Children</>`

   Correct:

   ~~~jsx
   function App() {
     return (
       <>
         <h1>Example h1</h1>
         <h2>Example h2</h2>
       </>
       // Could replace <></>with <div></div>f
     );
   }
   ~~~

   Incorrect:

   ~~~jsx
   function App() {
     return (
         <h1>Example h1</h1>
         <h2>Example h2</h2>
     );
   }
   ~~~

2. Close all tags.

   In HTML, many tags are self-closing and self-wrapping. In JSX however, we must explicitly close and wrap these tags.

   `<input>` would become `<input />`, and `<li>` would become `<li></li>`

   Correct:

   ~~~jsx
   function App() {
     return (
       <>
         <input />
         <li></li>
       </>
     );
   }
   ~~~

   Incorrect:

   ~~~jsx
   function App() {
     return (
         <>
          <input>
          <li>
         </>
     );
   }
   ~~~

3. camelCase **Most** things.

   JSX turns into JavaScript, and attributes of elements become keys of JavaScript objects, so you can't use dashes or reserved words such as `class`. Because of this, many HTML attributes are written in camelCase. Instead of `stroke-width`, you'd use `strokeWidth`, and instead of `class` you'd use `className`.

   Correct:

   ~~~jsx
   function App() {
     return (
       <>
         <div className="container">
           <svg>
             <circle cx="25" cy="75" r="20" stroke="green" strokeWidth="2" />
           </svg>
         </div>
       </>
     );
   }
   ~~~

   Incorrect:

   ~~~jsx
   function App() {
     return (
       <>
         <div class="container">
           <svg>
             <circle cx="25" cy="75" r="20" stroke="green" stroke-width="2" />
           </svg>
         </div>
       </>
     );
   }
   ~~~

Now that we've covered the Rules of JSX, we'll go through the conversion of a chunk of HTML to JSX.

~~~jsx
<h1>Test title</h1>
<ol class="test-list">
  <li>List item 1
  <li>List item 2
  <li>List item 3
</ol>
<svg >
   <circle cx="25" cy="75" r="20" stroke="green" stroke-width="2" />
</svg>
<form><input type="text"></form>
~~~

If you try to return this from a react component, you would get many errors, so we are going to fix that! I would recommend following along with this in your own react
environment.(If you don't want to create a new react app locally, go to [react.new](https://react.new/) to have a quick react environment up and going in your web browser.

The first issue we get is that this would not return a single root element, so let's give it a container.

~~~jsx
<div>
  <h1>Test title</h1>
  <ol class="test-list">
    <li>List item 1
    <li>List item 2
    <li>List item 3
  </ol>
  <svg >
     <circle cx="25" cy="75" r="20" stroke="green" stroke-width="2" />
  </svg>
  <form><input type="text"></form>
</div>
~~~

You should see that another error appears now that we've fixed the initial one. This doesn't mean we created the error with our previous changes, just that react wasn't showing this one yet.

Now, onto the second issue, which is that we haven't closed all of our tags, in particular, the `<li>` and the `<input>`.

~~~jsx
<div>
  <h1>Test title</h1>
  <ol class="test-list">
    <li>List item 1</li>
    <li>List item 2</li>
    <li>List item 3</li>
  </ol>
  <svg>
    <circle cx="25" cy="75" r="20" stroke="green" stroke-width="2" />
  </svg>
  <form>
    <input type="text" />
  </form>
</div>
~~~

If you are following along, at this point you will stop seeing an error being rendered on-screen, this time it will be in the console.

The last issue is that we haven't camelCased our attributes, and so are using invalid DOM properties for JSX, specifically the `class` and the `stroke-width`.

~~~jsx
<div>
  <h1>Test title</h1>
  <ol className="test-list">
    <li>List item 1</li>
    <li>List item 2</li>
    <li>List item 3</li>
  </ol>
  <svg>
    <circle cx="25" cy="75" r="20" stroke="green" strokeWidth="2" />
  </svg>
  <form>
    <input type="text" />
  </form>
</div>
~~~

Now that we've applied all of the fixes to the errors that react gave us, this is fully fledged JSX code that can be used in a react component without any issues.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  Read through the react beta docs [Writing markup with JSX page](https://beta.reactjs.org/learn/writing-markup-with-jsx) to review the content we have covered here, and complete the challenge at the end.

2.  Read through the react beta docs [Javascript in JSX page](https://beta.reactjs.org/learn/javascript-in-jsx-with-curly-braces) to introduce yourself to writing javascript logic and referencing dynamic values inside of your markup. Make sure you go through the challenges at the end.

</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="#what-is-jsx">What is JSX?</a>
- <a class="knowledge-check-link" href="#why-do-we-use-jsx">Why do we use JSX?</a>
- <a class="knowledge-check-link" href="#converting-html-to-jsx">What are the three rules of JSX?</a>
- <a class="knowledge-check-link" href="https://beta.reactjs.org/learn/javascript-in-jsx-with-curly-braces#using-curly-braces-a-window-into-the-javascript-world">How do you reference a dynamic value inside of your JSX?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
