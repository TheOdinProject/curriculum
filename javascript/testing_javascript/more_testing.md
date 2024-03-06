### Introduction
An important basic concept in testing is isolation.  You should only test one method at a time, and your tests for one function should not depend upon an external function behaving correctly - especially if that function is being tested elsewhere.  The main reason for this is that when your tests fail, you want to be able to narrow down the cause of this failure as quickly as possible.  If you have a test that depends on several functions, it can be hard to tell exactly what is going wrong.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain what tightly coupled code is.
- Describe a pure function and how it relates to TDD.
- Explain what mocking is.
  
### Pure functions

There are _many_ benefits to using TDD when you write your code. One of the biggest benefits is less obvious at first - it helps you to write better code.  If you look back at some of your early projects you will probably notice how _tightly coupled_ everything is.  <span id='tightly-coupled-code'>All of your functions include references to functions in other parts of your code, and the whole thing is _filled_ with DOM methods or `console.log()`</span>.  

Tightly coupled code is hard to test! Imagine trying to write tests for a function like this:

```javascript
function guessingGame() {
  const magicNumber = 22;
  const guess = prompt('guess a number between 1 and 100!');
  if (guess > magicNumber) {
    alert('YOUR GUESS IS TOO BIG');
  } else if (guess < magicNumber) {
    alert('YOUR GUESS IS TOO SMALL');
  } else if (guess == magicNumber) {
    alert('YOU DID IT! 🎉');
  }
}
```

<span id='try-before'>Making this testable requires us to split up all the different things that are happening.  First, we do not need to test the functions `prompt` and `alert` because they are built in to the browser.  They are external to our program and whoever wrote them has already tested them.  What we _do_ need to test is the number logic, which is much easier if we untangle it from the other functions:</span>

```javascript
function evaluateGuess(magicNumber, guess) {
  if (guess > magicNumber) {
    return 'YOUR GUESS IS TOO BIG';
  } else if (guess < magicNumber) {
    return 'YOUR GUESS IS TOO SMALL';
  } else if (guess == magicNumber) {
    return 'YOU DID IT! 🎉';
  }
}

function guessingGame() {
  const magicNumber = 22;
  const guess = prompt('guess a number between 1 and 100!');
  const message = evaluateGuess(magicNumber, guess);
  alert(message);
}

guessingGame();
```

In this example, the only thing we really need to test is the `evaluateGuess` function, which is much easier to test because it has a clear input and output and doesn't call any external functions. This implementation is _much_ nicer as well because it's much easier to extend.  If we wanted to switch out the `prompt` and `alert`s for methods that manipulate the DOM we can do that easier now and if we want to make our game more advanced by letting the user make multiple guesses, that is also easier.

If we had written this program with TDD it is very likely that it would have looked more like the second example to begin with.  Test driven development encourages better program architecture because it encourages you to write _Pure Functions_.

- Read [this quick article](https://medium.com/@jamesjefferyuk/javascript-what-are-pure-functions-4d4d5392d49c) about the value of 'Pure Functions'.

### Mocking

There are two solutions to the 'tightly coupled code' problem.  The first, and best option is to remove those dependencies from your code as we did above, but that is not always possible.  The second option is __mocking__ - writing "fake" versions of a function that always behaves _exactly_ how you want.  <span id='mock-function-example'>For example, if you're testing a function that gets information from a DOM input, you really don't want to have to set up a webpage and dynamically insert something into the input just to run your tests.  With a mock function, you could just create a fake version of the input-grabbing function that always returns a specific value and use THAT in your test</span>.

### Assignment 

<div class="lesson-content__panel" markdown="1">
1. If you haven't already, watch the 'mocking' videos from [this series](https://www.youtube.com/watch?v=3PjdxjWK0F0).
2. Too much mocking can be a bad thing.  It _is_ sometimes necessary, but if you have to set up an elaborate system of mocks to test any bit of your code, that means your code is too tightly coupled.  [This article](https://medium.com/javascript-scene/mocking-is-a-code-smell-944a70c90a6a) might be a little extreme, but it contains several really good points about program architecture and testing.
3. Now that you have some practice and context for TDD, [this section](https://jestjs.io/docs/setup-teardown) of the Jest docs will probably make good sense to you.
4. Jest includes some _really_ handy mocking functions.  Read about them in the [official docs](https://jestjs.io/docs/mock-functions).
5. Watch [this amazing video](https://www.youtube.com/watch?v=URSWYvyc42M) that covers _what_ to test in your codebase.  The video is specifically about testing the Ruby language, but that doesn't matter _at all_.  The concepts here ring true in any language, and luckily Ruby is a clear enough language that you will be able to follow along just fine.
</div>

### Knowledge check 
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [What is tightly coupled code?](#tightly-coupled-code)
- [What are the two requirements for a function to be pure?](https://medium.com/@jamesjefferyuk/javascript-what-are-pure-functions-4d4d5392d49c)
- [What are side effects and why is it important to identify them when testing a function?](https://medium.com/@jamesjefferyuk/javascript-what-are-pure-functions-4d4d5392d49c)
- [What should you try before testing tightly coupled code?](#try-before)
- [How can you test code that can't be decoupled?](#mocking)
- [What is mocking?](#mocking)
- [When would you use a mock function?](#mock-function-example)
- [How should you test incoming query messages?](https://youtu.be/URSWYvyc42M?t=699)
- [Why should you not test implementation?](https://youtu.be/URSWYvyc42M?t=792)
- [Should you test private methods?](https://youtu.be/URSWYvyc42M?t=1102)
- [Why should you not test outgoing messages with no side effects?](https://youtu.be/URSWYvyc42M?t=1370)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

-  This [jest cheat sheet](https://github.com/sapegin/jest-cheat-sheet) walks you quickly through all the frequently used methods.
