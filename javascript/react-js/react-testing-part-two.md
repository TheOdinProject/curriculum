## Introduction

We've already covered some basics of React testing. Now's the time to dive deeper. 

In this lesson, we'll learn about mocking. Furthermore, we'll discuss a React component from this ([theodinproject.com](https://theodinproject.com)) website and understand how React tests are written in a real world application.

## Lesson Overview 

This section contains a general overview of topics that you will learn in this lesson.

* Carry out mocks in the context of React testing.

## What is Mocking?

If you've been following along our lessons, the concept of mocking has already been introduced in the earlier section and you might have even incorporated mocks in your [Battleship project in the Testing JavaScript section of this course](https://www.theodinproject.com/paths/full-stack-javascript/courses/javascript/lessons/battleship). Let's look at how mocks'll help in testing React components.

## Testing Callback Handlers

Callbacks are ubiquitous. Every avenue of user interaction involves callbacks. Sometimes they're passed in as props to alter state of the parent component. Consider this simple input component:

~~~javascript
// FavoriteInput.js

import React from "react";

const FavoriteInput = ({ onChange: onInputChange, id }) => {
  const inputHandler = (event) => onInputChange(event.target.value);

  return (
    <label htmlFor={id}>
      What is your favorite wild animal?
      <input id={id} onChange={inputHandler} />
    </label>
  );
};

export default FavoriteInput;
~~~

Nothing fancy. `FavoriteInput` is a simple component with a couple props passed in. We're interested in the `onChange` prop. We have no idea what the function does. We have no idea how the function will affect the application. All we know is it must be called when user types in the input box. Let's test it. 

~~~javascript
// FavoriteInput.test.js

import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import userEvent from "@testing-library/user-event";
import FavoriteInput from "./FavoriteInput";

describe("Favorite Input", () => {
  it("calls onChange correct number of times", () => {
    const onChangeMock = jest.fn();
    render(<FavoriteInput onChange={onChangeMock} />);
    const input = screen.getByRole("textbox");

    userEvent.type(input, "Lion");

    expect(onChangeMock).toHaveBeenCalledTimes(4);
  });

  it("calls onChange with correct argument(s) on each input", () => {
    const onChangeMock = jest.fn();
    render(<FavoriteInput onChange={onChangeMock} />);
    const input = screen.getByRole("textbox");

    userEvent.type(input, "Ox");

    expect(onChangeMock).toHaveBeenNthCalledWith(1, "O");
    expect(onChangeMock).toHaveBeenNthCalledWith(2, "Ox");
  });

  it("input has correct values", () => {
    const onChangeMock = jest.fn();
    render(<FavoriteInput onChange={onChangeMock} />);
    const input = screen.getByRole("textbox");

    userEvent.type(input, "Whale");

    expect(input).toHaveValue("Whale");
  });
});
~~~

Three tests and we are done with this component. Take some time to figure out what functions come from which package. 
We mock the `onChange` handler using one of jest features, `jest.fn()`. For the first test, we assert that the mock function is invoked correct number of times. While the second test ensures that the mock function is called with the correct arguments. The third test seems redundant, and it is; it's just here to show what other ways we could've tested the component.   

But what if you want to set up your mocks in a `beforeEach` block rather than in every test? That's fine in some cases. Though, having all of the setup for a test in the same block as the test itself makes it easier to understand any particular test as it eliminates the need to check the whole file for context. This makes the reviewing of subsequent changes in a project down the road substantially easier. Additionally, it decreases the chance of having leakage create problems throughout the test suite. Unless your test file is getting really long and the test prep itself is dozens of lines in length, default to setting up in each test case; otherwise, you may use `beforeEach`.

## Mocking Child Components

You might have come across the concept of mocking modules. In React, when the component tree gets large, tests can become convoluted. Especially for components higher up the tree. That's why we mock child components. This is not something you'll come across often, nevertheless, it's beneficial to realize the concept in case you might need it in your own testing pursuits. 

## React Testing in the Real World

If you're a logged in on this ([theodinproject.com](https://theodinproject.com)) website, you've probably come across the project submissions list under every project. Those components are written in React and tested with the React Testing Library. This'll be fun. Your task is simple:

Read and try to comprehend the [submissions-list.jsx](https://github.com/TheOdinProject/theodinproject/blob/main/app/javascript/components/project-submissions/components/submissions-list.jsx) component. It's okay if you don't understand everything. And the good news is we don't have to understand it all to follow along this lesson!

#### submissions-list.jsx

We start by importing a bunch of stuff like any other decent React component. There might be a couple of unfamiliar things on there; we don't have to worry too much about them. If we glance at the props, there are some functions in there, presumably event handlers. Let's look at what the component renders.

1. If there's a `userSubmission`, it renders the `Submission` component
2. If `hasSubmission` is true, sort the submissions and render them with `Submission`. Otherwise, a heading that says "No Submissions yet, be the first!"
3. If  `allSubmissionsPath` is true, it renders a `<p>` tag.

By just going through the code, it should give us some idea of what to test. It will be rewarding if you take a couple of seconds to map out what tests we could need for `SubmissionList`.

Go through its test file, [submissions-list.test.jsx](https://github.com/TheOdinProject/theodinproject/blob/main/app/javascript/components/project-submissions/components/__tests__/submissions-list.test.jsx). Again, don't worry if all of it doesn't make sense, we'll chew over it shortly.

#### submissions-list.test.jsx

We notice there are two child components of `SubmissionsList`. One of them is from a package called `react-flip-move`. External Code. We'll mock it. 

<span id="mock-child-component">Notice how we mock the `Submission` component</span>:

~~~javascript 
jest.mock('../submission', () => ({ submission, isDashboardView }) => (
  <>
    <div data-test-id="submission">{submission.id}</div>
    <div data-test-id="dashboard">{isDashboardView.toString()}</div>
  </>
));
~~~

We only render the bare minimum to realize the validity of the component we're testing. Next, we set up our props with fake data and mocked functions.

Let's move towards our first assertion. Don't worry too much about the `ProjectSubmissionContext.Provider`. In the context of this test, it's purpose is to act as a route to pass in the `allSubmissionsPath` prop. We've already identified the three points of interest that we want to test. We divide them into three test suites for readability purposes using `describe`.

In the first suite, we make some assertions if the user has a submission and then some assertions if the user does not. The other suites follow a similar pattern.

## Exploring Further

Feel free to flick through the other components and its tests. You'll see mocked functions. You'll see some unseen functions like `act`. You'll see custom render functions. It's fine if you don't understand it all, the goal is to gain familiarity.

The other important thing to note is almost all the tests follow a certain pattern in terms of the way they're written. They follow the [Arrange-Act-Assert](http://wiki.c2.com/?ArrangeActAssert) pattern. It's a good idea to adopt the pattern sooner or later to make your tests more readable and ultimately better.

## Assignment

<div class="lesson-content__panel" markdown="1">

1. Read about the [secrets of act(...) api](https://github.com/mrdulin/react-act-examples/blob/master/sync.md). Especially pay attention to the last bit about testing asynchronous code. You won't be using it everyday, but it's nice to be familiar.

2. Read this article about [mocking child components](https://medium.com/@taylormclean15/jest-testing-mocking-child-components-to-make-your-unit-tests-more-concise-18691ef6a0c2). It extensively covers the "how" of mocking child components. (You might need to sign up to read)
 
</div>

## Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* <a class="knowledge-check-link" href="#testing-callback-handlers">How can you mock a callback handler?</a>
* <a class="knowledge-check-link" href="#mock-child-component">How can you mock a child component?</a>

## Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

* It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
