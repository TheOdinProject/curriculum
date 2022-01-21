### Introduction

We've learned testing our vanilla JavaScript applications in the previous section. Testing is indeed a powerful tool that allows to write maintainable and flexible code. If you've followed along our lessons, we've been using the [Jest](https://jestjs.io/) framework. For React, we'll keep using Jest and add more capabilities to our tests using the React Testing library.

Read the [introduction](https://testing-library.com/docs/react-testing-library/intro) page of the library before we get started.

### Learning Outcomes

By the end of this lesson, you should be able to do the following:

TODO

### Setting Up

We'll need to import some packages atop our test file:

~~~javascript
import React from "react"
import { ... } from "@testing-library/react"
import "@testing-library/jest-dom"  // optional
import userEvent from "@testing-library/user-event" 
import TestComponent from "path-to-test-component"
~~~

* `@testing-library/react` will give us access to useful functions like `render` which we'll demonstrate later on.

* `@testing-library/jest-dom` includes some handy custom matchers (assertive functions) like `toBeInTheDocument` and more. (complete list [here](https://github.com/testing-library/jest-dom)). Jest already has a lot of matchers so this package is not compulsory to use. 

* `@testing-library/user-event` provides the `userEvent` API that simulates user interactions with the webpage. Alternatively, we could import the `fireEvent` API from `@testing-library/react`. 

  > _Note: `fireEvent` is an inferior counterpart to `userEvent` and `userEvent` should always be preferred in practice._

* No need to import `jest` since it will automatically detect test files (`*.test.js` or `*.test.jsx`).

That's a lot of setup. But good news! If you're initializing your React repositories with `create-react-app`, then all the above packages come preinstalled and the scripts preconfigured in `package.json`. 

### Our First Query

First, we'll render the component using `render`. The API will return an object and we'll use destructuring syntax to obtain a subset of the methods required. You can read all about what `render` can do [here](https://testing-library.com/docs/react-testing-library/api/#render).

~~~javascript
// App.js

import React from "react"

const App = () => <h1>Our First Test</h1>

export default App
~~~

~~~javascript
// App.test.js

import React from "react"
import { render } from "@testing-library/react"
import App from "./App"

test("correct heading renders", () => {
    const { getByRole } = render(<App />)
    expect(getByRole("heading").textContent).toMatch(/our first test/i)
})
~~~

Execute `npm test App.js` on the terminal and you'll see that test pass. `getByRole` is just one of the dozen query methods that we could've used. Essentially, queries are classified into three types: `getBy`, `queryBy` and `findBy`. Read about their differences [here](https://testing-library.com/docs/queries/about/).  

### Simulating User Events

There are numerous ways a user can interact with a webpage. Even though live user feedback and interaction is irreplaceable, we can still build some confidence in our components through tests. Here's a button which changes the heading of the App:

~~~javascript
// App.js

import React, { useState } from "react";

const App = () => {
  const [heading, setHeading] = useState("Magnificent Monkeys");

  const clickHandler = () => {
    setHeading("Radical Rhinos");
  };

  return (
    <>
      <button type="button" onClick={clickHandler}>
        Click Me
      </button>
      <h1>{heading}</h1>
    </>
  );
};

export default App;
~~~

Let's test if the button works as intended:

~~~javascript
// App.test.js

import React from "react";
import { render } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import App from "./App";

test("magnificent monkeys renders", () => {
  const { container } = render(<App />);
  expect(container).toMatchSnapshot();
});

test("radical rhinos renders after button click", () => {
  const { getByRole } = render(<App />);
  const button = getByRole("button");

  userEvent.click(button);

  expect(getByRole("heading").textContent).toMatch(/radical rhinos/i);
});
~~~

The tests speak for themselves. In the first test, we utilize snapshots to check whether all the nodes render as we expect them to. In the second test, we simulate a click event. Then we check if the heading changed. `toMatch` is one of the various assertions we could have made. 

It's also important to note that after every test, React Testing Library unmounts the rendered components. That's why we render for each test. For a lot of tests for a component, the `beforeEach` jest function could prove handy.

### What are Snapshots?

Snapshot testing is just comparing our rendered component with an associated snapshot file. For example, the snapshot file which was automatically generated after we ran the _"magnificent monkeys renders"_ test was:

~~~javascript
// App.test.js.snap

// Jest Snapshot v1, https://goo.gl/fbAQLP

exports[`magnificent monkeys render 1`] = `
<div>
  <button
    type="button"
  >
    Click Me
  </button>
  <h1>
    Magnificent Monkeys
  </h1>
</div>
`;
~~~

It's an HTML representation of the `App` component. And it will be compared against the `App` in future snapshot assertions. If the `App` changes even slightly, the test fails. 

Snapshot tests are fast and easy to write. One assertion saves us from writing multiple lines of code. For example, with a `toMatchSnapshot`, we're spared of asserting the existence of the button and the heading. They also don't let unexpected changes creep into our code. Read all about what can be achieved with snapshots [here](https://jestjs.io/docs/snapshot-testing)

Snapshots might seem the best thing that has happened to us while testing thus far. But we are forced to wonder, _what_ exactly are we testing? What's being validated? If a snapshot passes, what does it convey about the correctness of the component? 

Snapshot tests may cause false positives. Since we cannot ascertain the validity of the component from a snapshot test, a bug might go undetected. Over-reliance on snapshots can make developers more confident about their code than they should be. 

The other issue with snapshots is false negatives. Even the most insignificant of changes compel the test to fail. Fixing punctuation? Snapshot will fail. Replacing an HTML tag to a more semantic one? Snapshot will fail. This might cause us to lose our confidence in the test suite altogether. Snapshots aren't inherently bad; they do serve a purpose. But it's beneficial to understand when to snapshot, and when not to snapshot. 

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Take a glance at all of the available [query methods](https://testing-library.com/docs/dom-testing-library/cheatsheet/). There's no need to use them all, but it's optimal to employ a specific method for a specific query. If none of the query methods suffice, there's an option to use [test ids](https://testing-library.com/docs/queries/bytestid/).

2. Read the [userEvent](https://testing-library.com/docs/ecosystem-user-event/) API docs to get a feel of how to achieve user simulation. 

3. This [article](https://tsh.io/blog/pros-and-cons-of-jest-snapshot-tests/) goes in depth regarding the pros and cons of snapshot testing. And [this](https://www.sitepen.com/blog/snapshot-testing-benefits-and-drawbacks) one does an excellent job of explaining what is snapshot testing in programming in general.

</div>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- This [tutorial](https://academind.com/tutorials/testing-react-apps) is a great overview of what you've learned. It goes into testing async code and callbacks which we haven't covered yet. Though you should be able to follow along using your previous knowledge.

- [This video](https://www.youtube.com/watch?v=YQLn7ycfzEo) for a hands-on tutorial.


### Knowledge Check 

This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

TODO
