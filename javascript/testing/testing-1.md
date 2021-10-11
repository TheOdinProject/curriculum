### Introduction
Test Driven Development is a _big_ deal in the modern development landscape.  This is a concept that we introduced way back in our Fundamentals section with our JavaScript Exercises.  The main idea is simply that you start working on your code by writing automated tests _before_ writing the code that is being tested.  There are tons of benefits to working like this, all of which will be discussed in the resources below.

There are many test-running systems available in JavaScript: [Mocha](https://mochajs.org/), [Jasmine](https://jasmine.github.io/), [Tape](https://github.com/substack/tape) and [Jest](https://facebook.github.io/jest/) to name a few. Fortunately the syntax for each one is very similar.  They all have their  own set of special features, but the basic syntax is almost identical, so in the end it doesn't matter which one you use.  In fact, simply picking which library to use for this curriculum has been quite tricky!  

This lesson is going to center around __Jest__. The biggest reasons for this decision are that one of the best resources we've found for explaining JavaScript testing uses it and they have fantastic documentation.  In the end, writing tests is less about the syntax and more about the TDD philosophy.  The most important issues are knowing __why__ we write tests and __what__ we test rather than how.

### Learning Outcomes 
By the end of the lesson , you will be able to:

- Explain what test driven development is.
- Set up and use jest.
- Explain why testing your codebase is necessary.
- Understand what you need to test in your codebase.




### Assignment

<div class="lesson-content__panel" markdown="1">
1. [Read this short article](http://godswillokwara.com/index.php/2016/09/09/the-importance-of-test-driven-development/) that outlines the basic process and the benefits of TDD.
2. Watch at least the first 3 videos of [this video series](https://www.youtube.com/playlist?list=PL0zVEGEvSaeF_zoW9o66wa_UCNE3a7BEr) about testing in JavaScript.  The first video focuses heavily on the WHY, while the next two go into more depth about the process.  Later videos in the series are _definitely_ worthwhile, but the first 3 are enough to get you up and running.
3. Read and follow the [Getting Started](https://facebook.github.io/jest/docs/en/getting-started.html#content) tutorial on the main Jest website.
4. Read and follow the [Using Matchers](https://facebook.github.io/jest/docs/en/using-matchers.html#content) document on the main Jest website.  This one demonstrates some of the other useful functions you can use in your tests.
5. Watch [this amazing video](https://www.youtube.com/watch?v=URSWYvyc42M) that covers _what_ to test in your codebase.  The video is specifically about testing the Ruby language, but that doesn't matter _at all_.  The concepts here ring true in any language, and luckily Ruby is a clear enough language that you will be able to follow along just fine.  This video might be worth re-visiting after you've done some testing of your own.
</div>


### Knowledge Check
- <a class = "knowledge-check-link" href = "#Introduction">What is TDD?</a>
- <a class = "knowledge-check-link" href = "https://facebook.github.io/jest/docs/en/getting-started.html#content">How to set up and use jest?</a>
- <a class = "knowledge-check-link" href = "http://godswillokwara.com/index.php/2016/09/09/the-importance-of-test-driven-development/">What are the benefits of writing unit tests?</a>
- <a class = "knowledge-check-link" href = "https://www.youtube.com/watch?v=URSWYvyc42M">What should you test in your codebase?</a>
