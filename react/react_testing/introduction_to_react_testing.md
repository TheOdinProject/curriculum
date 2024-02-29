### Introduction

We've learned how to test our vanilla JavaScript applications in a previous section. Testing is a powerful tool that allows us to write maintainable and flexible code. If you've followed along with our lessons, so far we've been using the [Jest](https://jestjs.io/) framework. However, since we're using [Vite](https://vitejs.dev/) we'll switch over to [Vitest](https://vitest.dev/) as our test runner since it integrates nicely with Vite. We'll add more capabilities to our tests using the [React Testing library (RTL)](https://testing-library.com/docs/react-testing-library/intro/).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to set up a React testing environment.
- How to test UI elements.
- Understanding snapshot tests.

### Setting up a React testing environment

Follow along [Robin Wieruch's guide on setting up Vitest with RTL](https://www.robinwieruch.de/vitest-react-testing-library/). Once you've completed the setup, let's meet back here.

Phew, that was a lot of setup. But there's one more tiny package to install before we can begin:

~~~
npm install @testing-library/user-event --save-dev
~~~

Now that we have everything we need, let's briefly go over what some of those packages do. We'll primarily focus on the `@testing-library` packages. 

* `@testing-library/react` will give us access to useful functions like `render` which we'll demonstrate later on.

* `@testing-library/jest-dom` includes some handy custom matchers (assertive functions) like `toBeInTheDocument` and more. (complete list on [jest-dom's github](https://github.com/testing-library/jest-dom)). Jest already has a lot of matchers so this package is not compulsory to use. 

* <span id="user-event">`@testing-library/user-event` provides the `userEvent` API that simulates user interactions with the webpage.</span> Alternatively, we could import the `fireEvent` API from `@testing-library/react`. 

  <div class="lesson-note" markdown="1">

  `fireEvent` is an inferior counterpart to `userEvent` and `userEvent` should always be preferred in practice.

  </div>

### Our first query

First, we'll render the component using `render`. The API will return an object and we'll use destructuring syntax to obtain a subset of the methods required. You can read all about what `render` can do in [the React Testing Library API docs about render](https://testing-library.com/docs/react-testing-library/api/#render).

~~~javascript
// App.jsx

const App = () => <h1>Our First Test</h1>;

export default App;
~~~

~~~javascript
// App.test.jsx

import { render, screen } from "@testing-library/react";
import App from "./App";

describe("App component", () => {
  it("renders correct heading", () => {
    render(<App />);
    expect(screen.getByRole("heading").textContent).toMatch(/our first test/i);
  });
});

~~~

Execute `npm test App.test.jsx` on the terminal and see the test pass. `getByRole` is just one of the dozen query methods that we could've used. Essentially, queries are classified into three types: `getBy`, `queryBy` and `findBy`. Go through [the React Testing Library docs page about queries](https://testing-library.com/docs/queries/about/). Pay extra attention to the "Types of Queries" and "Priority" sections. 

<span id="by-role-methods">As stated by the React Testing Library docs, `ByRole` methods are favored methods for querying, especially when paired with the `name` option. For example, we could improve the specificity of the above query like so: `getByRole("heading", { name: "Our First Test" })`. Queries that are done through `ByRole` ensure that our UI is accessible to everyone no matter what mode they use to navigate the webpage (i.e. mouse or assistive technologies).</span>

### Simulating user events

There are numerous ways a user can interact with a webpage. Even though live user feedback and interaction is irreplaceable, we can still build some confidence in our components through tests. Here's a button which changes the heading of the App:

~~~javascript
// App.jsx

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

Let's test if the button works as intended. In this test suite, we'll use a separate utility to query our UI elements. React Testing Library provides the `screen` object which has all the methods for querying. With `screen`, we don't have to worry about keeping `render`'s destructuring up-to-date. Hence, it's better to use `screen` to access queries rather than to destructure `render`.

~~~javascript
// App.test.jsx

import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import App from "./App";

describe("App component", () => {
  it("renders magnificent monkeys", () => {
    // since screen does not have the container property, we'll destructure render to obtain a container for this test
    const { container } = render(<App />);
    expect(container).toMatchSnapshot();
  });

  it("renders radical rhinos after button click", async () => {
    const user = userEvent.setup();

    render(<App />);
    const button = screen.getByRole("button", { name: "Click Me" });

    await user.click(button);

    expect(screen.getByRole("heading").textContent).toMatch(/radical rhinos/i);
  });
});
~~~

The tests speak for themselves. In the first test, we utilize snapshots to check whether all the nodes render as we expect them to. In the second test, we simulate a click event. Then we check if the heading changed. `toMatch` is one of the various assertions we could have made. 

It's also important to note that after every test, React Testing Library unmounts the rendered components. That's why we render for each test. For a lot of tests for a component, the `beforeEach` Jest function could prove handy.

Notice that the callback function for the second test is asynchronous. This is because `user.click()` simulates the asynchronous nature of user interaction, which is now supported by the latest version of the testing library's user-event APIs. 
As of [version 14.0.0](https://github.com/testing-library/user-event/releases/tag/v14.0.0), the user-event APIs have been updated to be asynchronous. It's worth noting that some examples from other resources or tutorials might still use the synchronous `userEvent.click()` method

~~~javascript
// This is the old approach of using userEvent.
it("renders radical rhinos after button click", () => {
  render(<App />);
  const button = screen.getByRole("button", { name: "Click Me" });

  userEvent.click(button);

  expect(screen.getByRole("heading").textContent).toMatch(/radical rhinos/i);
});
~~~

The `setup()` is internally triggered here. This is still supported by React Testing Library to ease the transition from v13 to v14.

### What are snapshots?

Snapshot testing is just comparing our rendered component with an associated snapshot file. For example, the snapshot file which was automatically generated after we ran the _"magnificent monkeys renders"_ test was:

~~~javascript
// Vitest Snapshot v1, https://vitest.dev/guide/snapshot.html

exports[`App component > renders magnificent monkeys 1`] = `
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

<span id="advantage-snapshot-tests">Snapshot tests are fast and easy to write. One assertion saves us from writing multiple lines of code. For example, with a `toMatchSnapshot`, we're spared of asserting the existence of the button and the heading.</span> They also don't let unexpected changes creep into our code. Read all about what can be achieved with snapshots in the [Vitest snapshot docs](https://vitest.dev/guide/snapshot.html).

Snapshots might seem the best thing that has happened to us while testing thus far. But we are forced to wonder, _what_ exactly are we testing? What's being validated? If a snapshot passes, what does it convey about the correctness of the component? 

<span id="disadvantage-snapshot-tests">Snapshot tests may cause false positives. Since we cannot ascertain the validity of the component from a snapshot test, a bug might go undetected. Over-reliance on snapshots can make developers more confident about their code than they should be.</span> 

The other issue with snapshots is false negatives. Even the most insignificant of changes compel the test to fail. Fixing punctuation? Snapshot will fail. Replacing an HTML tag to a more semantic one? Snapshot will fail. This might cause us to lose our confidence in the test suite altogether. Snapshots aren't inherently bad; they do serve a purpose. But it's beneficial to understand when to snapshot, and when not to snapshot. 

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Take a glance at all of the available query methods on [the React Testing Library's cheatsheet page](https://testing-library.com/docs/dom-testing-library/cheatsheet/). There's no need to use them all, but it's optimal to employ a specific method for a specific query. If none of the query methods suffice, there's an option to use test ids. Learn about test ids on [the React Testing Library's test id docs](https://testing-library.com/docs/queries/bytestid/).

2. Read [the userEvent API docs](https://testing-library.com/docs/user-event/intro) to get a feel of how to achieve user simulation. 

3. This article on the [Pros and Cons of Snapshot Tests](https://tsh.io/blog/pros-and-cons-of-jest-snapshot-tests/) goes in depth regarding the advantages and disadvantages of snapshot testing. Even though the articles use Jest, the concepts should be transferrable. And this one, [Snapshot Testing: Benefits and Drawbacks](https://www.sitepen.com/blog/snapshot-testing-benefits-and-drawbacks), does an excellent job of explaining what snapshot testing is for programming in general.

</div>

### Knowledge check 

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* [What packages are required for React testing?](#setting-up)
* [What is the significance of the user-event package?](#user-event)
* [What does the `render` method do?](https://testing-library.com/docs/react-testing-library/api/#render)
* [What is the most preferred method for querying?](#by-role-methods)
* [How would you test for a click event with `userEvent`?](#simulating-user-events)
* [What is the advantage of snapshot tests?](#advantage-snapshot-tests)
* [What are the disadvantages of snapshot tests?](#disadvantage-snapshot-tests)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- This [tutorial on Testing React Apps by Academind](https://academind.com/tutorials/testing-react-apps) is a great overview of what you've learned. It goes into testing async code and callbacks which we haven't covered yet. Though you should be able to follow along using your previous knowledge.
- This [Intro to React Testing Library video](https://www.youtube.com/watch?v=YQLn7ycfzEo) for a hands-on tutorial.
