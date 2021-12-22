### Introduction

We've already covered some basics of React testing. Now's the time to dive deeper. 

In this lesson, we'll learn about mocking. Furthermore, we'll discuss a React component from this ([theodinproject.com](https://theodinproject.com)) website and understand how React tests are written in a real world application. To top it all off, we'll tackle the practice exercise at the end of this lesson to solidify what we've learned. 

### Learning Outcomes

By the end of this lesson, you should be able to do the following:

TODO

### What is Mocking?

If you've been following along our lessons, the concept of mocking has already been introduced in the earlier section and you might have even incorporated mocks in your [Battleship](https://www.theodinproject.com/paths/full-stack-javascript/courses/javascript/lessons/battleship) project. Let's look at how mocks'll help in testing React components.

#### Testing Callback Handlers

Callbacks are ubiquitous. Every avenue of user interaction involves callbacks. Sometimes they're passed in as props to alter state of the parent component. Consider this simple input component:

~~~javascript
// FavoriteInput.js

import React from "react";

const FavoriteInput = ({ onChange, id }) => (
  <label htmlFor={id}>
    What is your favorite wild animal?
    <input id={id} onChange={onChange} />
  </label>
);

export default FavoriteInput;
~~~

Nothing fancy. `FavoriteInput` is a simple component with a couple props passed in. We're interested in the `onChange` prop. We have no idea what the function does. We have no idea how the function will affect the application. All we know is it must be called when user types in the input box. Let's test it. 

~~~javascript
// FavoriteInput.test.js

import React from "react";
import { render } from "@testing-library/react";
import "@testing-library/jest-dom";
import userEvent from "@testing-library/user-event";
import FavoriteInput from "./FavoriteInput";

describe("Favorite Input", () => {
  let onChange;
  let getByRole;
  let input;

  beforeEach(() => {
    onChange = jest.fn();
    ({ getByRole } = render(<FavoriteInput onChange={onChange} />));
    input = getByRole("textbox");
  });

  test("calls onChange correct number of times", () => {
    userEvent.type(input, "Lion");
    expect(onChange).toHaveBeenCalledTimes(4);
  });

  test("calls onChange with correct argument", () => {
    userEvent.type(input, "Ox");

    expect(onChange.mock.calls[0][0].target.value).toMatch("O");
    expect(onChange.mock.calls[1][0].target.value).toMatch("x");
  });

  test("input has correct values", () => {
    userEvent.type(input, "Whale");
    expect(input).toHaveValue("Whale");
  });
});
~~~

Three tests and we are done with this component. Take some time to figure out what functions come from which package. 
We mock the `onChange` handler using one of jest features, `jest.fn()`. For the first test, we assert that the mock function is invoked correct number of times. While the second test ensures that the mock function is called with the correct arguments. The third test seems redundant, and it is; it's just here to show what other ways we could've tested the component. We use `beforeEach` to clump all the variable declarations in one place rather than defining them individually for each test.  

#### Mocking Child Components

You might have come across the concept of mocking modules. In React, when the component tree gets large, tests can become convoluted. Especially for components higher up the tree. That's why we mock child components. This is not something you'll come across often, nevertheless, it's beneficial to realize the concept in case you might need it in your own testing pursuits. 

Read [this](https://medium.com/@taylormclean15/jest-testing-mocking-child-components-to-make-your-unit-tests-more-concise-18691ef6a0c2). It extensively covers the "how" of mocking child components. (You might need to sign up to read)

### React Testing in the Real World

If you're a logged in on this ([theodinproject.com](https://theodinproject.com)) website, you've probably come across the project submissions list under every project. Those components are written in React and tested with the React Testing Library. This'll be fun. Your task is simple:

Read and try to comprehend the [submissions-list.jsx](https://github.com/TheOdinProject/theodinproject/blob/main/app/javascript/components/project-submissions/components/submissions-list.jsx) component. It's okay if you don't understand everything. And the good news is we don't have to understand it all to follow along this lesson!

#### submissions-list.jsx

We start by importing a bunch of stuff like any other decent React component. There might be a couple of unfamiliar things on there; we don't have to worry too much about them. If we glance at the props, there are some functions in there, presumeably event handlers. Let's look at what the component renders.

1. If there's a `userSubmission`, it renders the `Submission` component
2. If `hasSubmission` is true, sort the submissions and render them with `Submission`. Otherwise, a heading that says "No Submissions yet, be the first!"
3. If  `allSubmissionsPath` is true, it renders a `<p>` tag.

By just going through the code, it should give us some idea of what to test. It will be rewarding if you take a couple of seconds to map out what tests we could need for `SubmissionList`.

Go through its [test](https://github.com/TheOdinProject/theodinproject/blob/main/app/javascript/components/project-submissions/components/__tests__/submissions-list.test.jsx) file. Again, don't worry if all of it doesn't make sense, we'll chew over it shortly.

#### submissions-list.test.jsx

We notice there are two child components of `SubmissionsList`. One of them is from a package called `react-flip-move`. External Code. We'll mock it. 

The other one is `Submission`. On a glance, there might not seem a reason to mock `Submission`, but if we dig deeper `Submission` has a lot going on. It has many child components of its own. And they all of them must have been tested beforehand. It's not ideal to render them all if just want to test `SubmissionsList`. Notice how we mock it:

~~~javascript 
jest.mock('../submission', () => ({ submission, isDashboardView }) => (
  <>
    <div data-test-id="submission">{submission.id}</div>
    <div data-test-id="dashboard">{isDashboardView.toString()}</div>
  </>
));
~~~

We only render the bare minimum to realize the validity of the component we're testing. Next, we set up our props with fake data and mocked functions.

Let's move towards our first assertion. Don't worry too much about the `ProjectSubmissionContext.Provider`. In the context of this test, it's purpose is to act as a route to pass in the `allSubmissionsPath` prop. We've already identified the three points of interest that we want to test. We divide them into three test suites for readibility purposes using `describe`.

In the first suite, we make some assertions if the user has a submssion and then some assertions if the user does not. The other suites follow a similar pattern.

#### Exploring Further

Feel free to flick through the other components and its tests. You'll see mocked functions. You'll see some unseen functions like `act`. You'll see custom render functions. It's fine if you don't understand it all, the goal is to gain familiarity.

The other important thing to note is almost all the tests follow a certain pattern in terms of the way they're written. They follow the [Arrange-Act-Assert](http://wiki.c2.com/?ArrangeActAssert) pattern. It's a good idea to adopt the pattern sooner or later to make your tests more readible and ultimately better.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read about the [secrets of act(...) api](https://github.com/mrdulin/react-act-examples/blob/master/sync.md). Especially pay attention to the last bit about testing asynchronous code. You won't be using it everyday, but it's nice to be familiar.

2. We'll practice what we've learned with a simple exercise; a comment liker application.  
    1. It's task is simple. Fetch dummy comments from [jsonplaceholder](https://jsonplaceholder.typicode.com/). Add a like and a dislike button to each comment. Display a counter for likes/dislikes. Once a button is clicked, increment the desired count and delete the comment (optional).
    2. Start with a big button at the top of the webpage. When it's clicked, it'll initiate an API call to fetch the comments.
    3. You'll likely need to add components other than `App`. Probably a `CommentContainer`, `Counter`, `Like` more or less. You decide what works best for you. 
    4. Make sure to test them accordingly. Mock, which can be mocked. Query, which can be queried. Simulate, which can be simulated. 
    5. You don't have to style at all. The sole purpose of this exercise is to get a hands on experience with testing. 
</div>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

None at the moment...

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

TODO
