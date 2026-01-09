### Introduction

We've learned how to test our vanilla JavaScript applications in a previous section. Testing is a powerful tool that allows us to write maintainable and flexible code. If you've followed along with our lessons, so far we've been using the [Jest](https://jestjs.io/) framework. However, since we're using [Vite](https://vitejs.dev/) we'll switch over to [Vitest](https://vitest.dev/) as our test runner since it integrates nicely with Vite. We'll add more capabilities to our tests using the [React Testing library (RTL)](https://testing-library.com/docs/react-testing-library/intro/).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Why UI testing is valuable.
- How to set up a React testing environment.
- How to test UI elements.
- Understanding snapshot tests.

### UI testing

By now, you'll have had some experience already with TDD and the idea of testing in general. You may remember in the Battleship project, you will have written tests limited to the underlying Battleship game, but without involving the DOM at all. You may have made non-UI changes, caused tests to fail, then resolved whatever was needed so you had tests that were relevant and passed.

Despite this, you may have run into bugs in the UI because your tests only involved the underlying logic. You may have a working Battleship game, but that does not mean the UI actually displays what you intend nor lets users interact with the game as intended. And let's be honest, every time you make a change to any part of your code (whether related to UI or not), you're not going to remember to recheck every related UI aspect to make sure everything still works as you expect. i.e., this is no different to before, we're just involving the UI now.

UI tests give us more confidence that our websites contain the intended contents and behave as we want, and notify us when something no longer satisfies our requirements. Perhaps you decide to change the exact structure of a state, such as changing from a plain object to an array, but now a list does not contain the text you intend. Or maybe you add a condition somewhere in a component and now suddenly, only the last three drop targets for your drag and drop cards are no longer valid targets. As your websites get more complex, the value of good tests (both UI and non-UI) will only increase.

### Setting up a React testing environment

Follow along [Robin Wieruch's guide on setting up Vitest with RTL](https://www.robinwieruch.de/vitest-react-testing-library/). Once you've completed the setup, let's meet back here.

Phew, that was a lot of setup. But there's one more tiny package to install before we can begin:

```bash
npm install @testing-library/user-event --save-dev
```

Now that we have everything we need, let's briefly go over what some of those packages do. We'll primarily focus on the `@testing-library` packages.

- `@testing-library/react` will give us access to useful functions like `render` which we'll demonstrate later on.

- `@testing-library/jest-dom` includes some handy custom matchers (assertive functions) like `toBeInTheDocument` and more. (complete list on [jest-dom's github](https://github.com/testing-library/jest-dom)). Jest already has a lot of matchers so this package is not compulsory to use.

- <span id="user-event">`@testing-library/user-event` provides the `userEvent` API that simulates user interactions with the webpage.</span>

### Our first query

First, we'll render the component using `render` (you can read all about what the function can do in [the React Testing Library API docs about `render`](https://testing-library.com/docs/react-testing-library/api/#render)). We say "render", but you won't see any screen. Back in the RTL setup article just now, one of the packages installed is `jsdom`, which simulates the DOM (including events) in memory without actually laying anything out visually like in a browser, and that allows us to parse its contents for our tests. This is different to and much less complex than other libraries that actually run a real browser environment for more complex end-to-end tests - that's out of scope here.

```jsx
// App.jsx

const App = () => <h1>Our First Test</h1>;

export default App;
```

```jsx
// App.test.jsx

import { describe, it, expect } from "vitest";
import { render, screen } from "@testing-library/react";
import App from "./App";

describe("App component", () => {
  it("renders correct heading", () => {
    render(<App />);
    // using regex with the i flag allows simpler case-insensitive comparison
    expect(screen.getByRole("heading").textContent).toMatch(/our first test/i);
  });
});
```

<div class="lesson-note" markdown="1">

#### Vitest globals and ESLint

Even if you set `globals: true` in `vite.config.js` like in the setup tutorial, ESLint will still yell at you, as it will not recognize these globals without some extra configuration in your `eslint.config.js` file. The most straightforward resolution would be to explicitly import the globals you'd need instead. You can omit `globals: true` from `vite.config.js` in this case.

</div>

Execute `npm test App.test.jsx` on the terminal and see the test pass. `getByRole` is just one of the dozen query methods that we could've used. Essentially, queries are classified into three types: `getBy`, `queryBy` and `findBy`. Go through [the React Testing Library docs page about queries](https://testing-library.com/docs/queries/about/). Pay extra attention to the "Types of Queries" and "Priority" sections.

<span id="by-role-methods">As stated by the React Testing Library docs, `ByRole` methods are favored methods for querying, especially when paired with the `name` option. For example, we could improve the specificity of the above query like so: `getByRole("heading", { name: "Our First Test" })`. Queries that are done through `ByRole` ensure that our UI is accessible to everyone no matter what mode they use to navigate the webpage (i.e. mouse or assistive technologies).</span>

### Simulating user events

There are numerous ways a user can interact with a webpage. Even though live user feedback and interaction is irreplaceable, we can still build some confidence in our components through tests. Here's a button which changes the heading of the App:

```jsx
// App.jsx

import { useState } from "react";

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
```

Let's test if the button works as intended. In this test suite, we'll use a separate utility to query our UI elements. React Testing Library provides the `screen` object which has all the methods for querying. With `screen`, we don't have to worry about keeping `render`'s destructuring up-to-date. Hence, it's better to use `screen` to access queries rather than to destructure `render`.

```jsx
// App.test.jsx

import { describe, it, expect } from "vitest";
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
```

The tests speak for themselves. In the first test, we utilize snapshots to check whether all the nodes render as we expect them to. In the second test, we simulate a click event. Then we check if the heading changed. `toMatch` is one of the various assertions we could have made. Notice that the callback function for the second test is an `async` one, as we need this in order to `await user.click()`.

It's also important to note that after every test, React Testing Library unmounts the rendered components. That's why we render for each test. For a lot of tests for a component, a custom `setup` function could prove handy.

### What are snapshots?

Snapshot testing is just comparing our rendered component with an associated snapshot file. For example, the snapshot file which was automatically generated after we ran the *"renders magnificent monkeys"* test was:

```jsx
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
```

It's an HTML representation of the `App` component. And it will be compared against the `App` in future snapshot assertions. If the `App` changes even slightly, the test fails.

<span id="advantage-snapshot-tests">Snapshot tests are fast and easy to write. One assertion saves us from writing multiple lines of code. For example, with a `toMatchSnapshot`, we're spared of asserting the existence of the button and the heading.</span> They also don't let unexpected changes creep into our code. Read all about what can be achieved with snapshots in the [Vitest snapshot docs](https://vitest.dev/guide/snapshot.html).

Snapshots might seem the best thing that has happened to us while testing thus far. But we are forced to wonder, *what* exactly are we testing? What's being validated? If a snapshot passes, what does it convey about the correctness of the component?

<span id="disadvantage-snapshot-tests">Snapshot tests may cause false positives. Since we cannot ascertain the validity of the component from a snapshot test, a bug might go undetected. Over-reliance on snapshots can make developers more confident about their code than they should be.</span>

The other issue with snapshots is false negatives. Even the most insignificant of changes compel the test to fail. Fixing punctuation? Snapshot will fail. Replacing an HTML tag to a more semantic one? Snapshot will fail. This might cause us to lose our confidence in the test suite altogether. Snapshots aren't inherently bad; they do serve a purpose. But it's beneficial to understand when to snapshot, and when not to snapshot.

### Assignment

<div class="lesson-content__panel" markdown="1">

<div class="lesson-note" markdown="1">

#### Focus on the concepts

Even though some articles use Jest and the Enzyme testing library, the concepts should be transferable.

</div>

1. [Testing Implementation Details](https://kentcdodds.com/blog/testing-implementation-details) by Kent C. Dodds shows us how we can reduce false test results and inflexible tests by avoiding testing the implementation of things.
1. Take a glance at all of the available query methods on [the React Testing Library's cheatsheet page](https://testing-library.com/docs/dom-testing-library/cheatsheet/). There's no need to use them all, but it's optimal to employ a specific method for a specific query. If none of the query methods suffice, there's an option to use test ids. Learn about test ids on [the React Testing Library's test id docs](https://testing-library.com/docs/queries/bytestid/).
1. Read [the userEvent API docs](https://testing-library.com/docs/user-event/intro) to get a feel of how to achieve user simulation.
1. This article on the [Pros and Cons of Snapshot Tests](https://tsh.io/blog/pros-and-cons-of-jest-snapshot-tests/) goes in depth regarding the advantages and disadvantages of snapshot testing. And this one, [Snapshot Testing: Benefits and Drawbacks](https://www.sitepen.com/blog/snapshot-testing-benefits-and-drawbacks), does an excellent job of explaining what snapshot testing is for programming in general.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why might you want to test your UI?](#ui-testing)
- [What packages are required for React testing?](#setting-up-a-react-testing-environment)
- [What is the significance of the user-event package?](#user-event)
- [What does the `render` method do?](https://testing-library.com/docs/react-testing-library/api/#render)
- [What is the most preferred method for querying?](#by-role-methods)
- [How would you test for a click event with `userEvent`?](#simulating-user-events)
- [What is the advantage of snapshot tests?](#advantage-snapshot-tests)
- [What are the disadvantages of snapshot tests?](#disadvantage-snapshot-tests)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- This [Intro to React Testing Library video](https://www.youtube.com/watch?v=YQLn7ycfzEo) for a hands-on tutorial.
