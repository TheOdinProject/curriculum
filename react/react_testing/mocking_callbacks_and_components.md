### Introduction

We've already covered some basics of React testing. Now's the time to dive deeper.

In this lesson, we'll learn about mocking. Furthermore, we'll discuss a React component from this ([theodinproject.com](https://theodinproject.com)) website and understand how React tests are written in a real world application.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Carry out mocks in the context of React testing.

### What is mocking?

If you've been following along with our lessons so far, the concept of mocking has already been introduced in an earlier section and you might have even incorporated mocks in your [Battleship project in the Testing JavaScript section of this course](https://www.theodinproject.com/lessons/javascript-battleship). Let's look at how mocks will help in testing React components.

#### Testing callback handlers

Callbacks are ubiquitous. Every avenue of user interaction involves callbacks. Sometimes they're passed in as props to alter state of the parent component. Consider this button component:

~~~jsx
// CustomButton.jsx

const CustomButton = ({ onClick }) => {
  return (
    <button onClick={onClick}>Click me</button> 
  );
};

export default CustomButton;
~~~

Nothing fancy. `CustomButton` is a component with a prop passed in. We're interested in the `onClick` prop. We have no idea what the function does. We have no idea how the function will affect the application. All we know is it must be called when user clicks the button. Let's test it.

<span id="testing-callback-handlers">Notice how we mock and test the `onClick` function</span>:

~~~jsx
// CustomButton.test.jsx

import { vi } from 'vitest'
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import CustomButton from "./CustomButton";

describe("CustomButton", () => {
    it("should render a button with the text 'Click me'", () => {
        render(<CustomButton onClick={() => {}} />);

        const button = screen.getByRole("button", { name: "Click me" });

        expect(button).toBeInTheDocument();
    });
  
    it("should call the onClick function when clicked", async () => {
        const onClick = vi.fn();
        const user = userEvent.setup()
        render(<CustomButton onClick={onClick} />);

        const button = screen.getByRole("button", { name: "Click me" });

        await user.click(button);

        expect(onClick).toHaveBeenCalled();
    });

    it("should not call the onClick function when it isn't clicked", async () => {
        const onClick = vi.fn();
        render(<CustomButton onClick={onClick} />);

        expect(onClick).not.toHaveBeenCalled();
    });
});
~~~

Three tests and we are done with this component. You should be already familiar with how the first test works. Take some time to figure out what functions come from which package.

For the second and third tests, we mock the `onClick` handler using one of Vitest's functions, `vi.fn()`. Then we assert that it is called/not called when the button is clicked or not. 

You could also set up your mocks in a `beforeEach` block instead of in every test block. This may be suitable for some situations. However, for better readability, it is recommended that all setups be done in the same test block.  Doing so eliminates the need to search through the entire file for context, making it easier to review future changes. This also decreases the chance of having leakage create problems throughout the test suite. Unless your test file is particularly long and the test preparation takes up dozens of lines, it is recommended to set up your mocks in each test block; otherwise, you may use `beforeEach`.

It is recommended to invoke `userEvent.setup()` before rendering the component. It is discouraged to call renders and `userEvent` functions outside of the test itself, (for example, in a `beforeEach` block). If you find yourself repeating the same code in multiple tests, the recommended approach to shorten each test is to write a setup function, as [outlined in the documentation](https://testing-library.com/docs/user-event/intro/#writing-tests-with-userevent).

#### Mocking child components

You might have come across the concept of mocking modules. In React, when the component tree gets large, tests can become convoluted. Especially for components higher up the tree. That's why we mock child components. This is not something you'll come across often, nevertheless, it's beneficial to realize the concept in case you might need it in your own testing pursuits.

### React testing in the real world

If you're logged in on this ([theodinproject.com](https://theodinproject.com)) website, you've probably come across the project submissions list under every project. Those components were written in React and tested with the React Testing Library. They have since been removed, but they still serve as great examples. This'll be fun. Your task is:

Read and try to comprehend the [submissions-list.jsx](https://github.com/TheOdinProject/theodinproject/blob/0886578d5b27a967e6bba2b31f212efe284d9413/app/javascript/components/project-submissions/components/submissions-list.jsx) component. It's okay if you don't understand everything. And the good news is that we don't have to understand it all to follow along with this lesson!

#### submissions-list.jsx

We start by importing a bunch of stuff like any other decent React component. There might be a couple of unfamiliar things on there; we don't have to worry too much about them. If we take a glance at the props, there are some functions in there, presumably event handlers. Let's look at what the component renders.

1. If there's a `userSubmission`, it renders the `Submission` component
2. If `hasSubmissions` is true, sort the submissions and render them with `Submission`. Otherwise, a heading that says "No Submissions yet, be the first!"
3. If  `allSubmissionsPath` is true, it renders a `<p>` tag.

Just going through the code, it should give us some idea of what to test. It will be rewarding if you take a couple of seconds to map out what tests we could need for `SubmissionsList`.

Go through its test file, [submissions-list.test.jsx](https://github.com/TheOdinProject/theodinproject/blob/0886578d5b27a967e6bba2b31f212efe284d9413/app/javascript/components/project-submissions/components/__tests__/submissions-list.test.jsx). Again, don't worry if all of it doesn't make sense, we'll chew over it shortly.

<div class="lesson-note" markdown="1">

#### Note

While the test suite above uses `data-test-id` to identify mocked child components, it must be remembered that the React Testing Library instead uses `data-testid` by default.

</div>

#### submissions-list.test.jsx

We notice there are two child components of `SubmissionsList`. One of them is from a package called `react-flip-move`. External Code. We'll mock it.

<span id="mock-child-component">Notice how we mock the `Submission` component</span>:

~~~jsx
jest.mock('../submission', () => ({ submission, isDashboardView }) => (
  <>
    <div data-test-id="submission">{submission.id}</div>
    <div data-test-id="dashboard">{isDashboardView.toString()}</div>
  </>
));
~~~

We only render the bare minimum to realize the validity of the component we're testing. Next, we set up our props with fake data and mocked functions.

<div class="lesson-note" markdown="1">

#### Note - Vitest mocks

The test here used `jest.mock()`. If you followed along and set up your test using Vitest, you may use `vi.mock()` instead. See [`vi.mock()` API](https://vitest.dev/api/vi.html#vi-mock).

</div>

Let's move toward our first assertion. Don't worry too much about the `ProjectSubmissionContext.Provider`. In the context of this test, its purpose is to act as a route to pass in the `allSubmissionsPath` prop. We've already identified the three points of interest that we want to test. We divide them into three test suites for readability purposes using `describe`.

In the first suite, we make some assertions if the user has a submission and then some assertions if the user does not. The other suites follow a similar pattern.

#### Exploring further

Feel free to flick through the other components and their tests. You'll see mocked functions. You'll see some unseen functions like `act`. You'll see custom render functions. It's fine if you don't understand it all, the goal is to gain familiarity.

The other important thing to note is almost all the tests follow a certain pattern in terms of the way they're written. They follow the [Arrange-Act-Assert](http://wiki.c2.com/?ArrangeActAssert) pattern. It's a good idea to adopt this pattern sooner or later to make your tests more readable and ultimately better.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read about the [secrets of act(...) api](https://github.com/mrdulin/react-act-examples/blob/master/sync.md). Especially pay attention to the last bit about testing asynchronous code. You won't be using it everyday, but it's nice to be familiar. Please note that in the article, the React components are written within the tests.

2. Read this article about [mocking child components](https://medium.com/@taylormclean15/jest-testing-mocking-child-components-to-make-your-unit-tests-more-concise-18691ef6a0c2). It extensively covers the "how" of mocking child components. (You might need to sign up to read)

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* [How can you mock a callback handler?](#testing-callback-handlers)
* [How can you mock a child component?](#mock-child-component)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

* It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
