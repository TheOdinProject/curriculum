### Introduction

Hopefully, you've been having fun developing in Ruby thus far. Perhaps one thing you may **not** have enjoyed as much, though, is having to run your script on the command line, running through each step manually, only to find that it doesn't return what you expected. And then comes the part that's even *more* fun: tugging at your hair a bit, changing a few variables, and running your script all over again, **hoping** that the results are correct.

Folks, we're here to tell you there *IS* a better way. Hoping is for that exam you didn't study for and took by the seat of your pants. **Knowing** is test-driven development.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand what test-driven development (TDD) is, and why it's important.
- Understand the three stages of a TDD cycle.

### What is test-driven development?

[Test-Driven Development (TDD)](https://en.wikipedia.org/wiki/Test-driven_development) is a process and technique of software development that relies on the repetition of a very short and specific development cycle. In each cycle, requirements (i.e., what you want your code to do) are turned into specific test cases first. These requirements could be anything from an entire feature that requires end-to-end (E2E) testing, such as tests that cover a user logging into your website successfully AND unsuccessfully, to a new Ruby class you've devised, for which unit tests might suffice. Either way, the test suite for these requirements fail initially, since actual code hasn't been written yet. 

Once the code is written and passes our test suite, you can move onto refactoring. As you might have guessed, running the test suite against the changes we make to our features or units enables us to refactor *while* making sure everything still works.

Colloquially, this process is often referred to as the "**red-green-refactor**" cycle. That's all it is, in a nutshell: automated tests **drive** the design of software. You don't need to know how the entire architecture of your sweet, new, industry-breaking application will work. Your application only has to be broken down, step-by-step, until small units are identified and covered by tests.

### Why is it important?

Even if TDD intuitively seems like good practice, its utility is hotly debated even today. 

No one is saying that tests aren't useful. Testing at [all levels](https://thoughtbot.com/blog/rails-test-types-and-the-testing-pyramid) is *crucial*. Testing ensures that your application is working as intended. More importantly, and perhaps less obviously, testing ensures developer confidence when it comes time to change existing code. Adding new features and dependencies increases the overall instability of your application, and a single misstep can have a cascading, crashing effect in faraway, unintended locations. Testing confirms that what you add works with what you already have. In a sense, it provides a safety net that leaves your application more open to change, and gives it room to grow and evolve as painlessly as possible.

The real question is whether or not tests should *drive* development, or whether or not it's important for them to come *first*. Many developers write tests after they've written their code. There is definitely a longer list of pros than cons for having tests in general, no one will disagree with that. So should we test first? 

As usual, it depends. Still, here are some reasons we think it might be important for you to implement TDD:

1. **Practice**. Many employers look for developers who have experience or interest in testing. Sure, you can write tests later, but will you really? Test first to make sure you get exposure as soon as possible.
2. **Effectiveness**. Writing tests before code is like stretching before a workout. It's not required, but your workout could suffer. Writing tests first ensures that the code that comes after has clearer design, purpose, and quality.
3. **Efficiency**. You'll save time in the long run by not having to re-run entire applications just to make sure little parts work.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read up on [9 Benefits of Test-Driven Development](https://www.madetech.com/blog/9-benefits-of-test-driven-development) for additional insight on this practice. Note that many of these points are not specific to TDD, but are also applicable to testing in general.
2. For a more rounded take, consider DHH's ["TDD is Dead. Long Live Testing"](https://dhh.dk/2014/tdd-is-dead-long-live-testing.html), which sparked controversial conversations on what TDD is, what it has become, and what it should be.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="#what-is-test-driven-development">What is the "red-green-refactor" cycle?</a>
- <a class="knowledge-check-link" href="https://thoughtbot.com/blog/rails-test-types-and-the-testing-pyramid">What is the difference between unit and integration tests?</a>
- <a class="knowledge-check-link" href="https://www.madetech.com/blog/9-benefits-of-test-driven-development">How does TDD help in code refactoring?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [This video](https://www.youtube.com/watch?v=PCEHRFHKZSk) that provides counter arguments for DHH’s [“TDD is Dead. Long Live Testing”](https://dhh.dk/2014/tdd-is-dead-long-live-testing.html)
- [This series of talks](https://martinfowler.com/articles/is-tdd-dead/) that provides an even more rounded take on TDD.
