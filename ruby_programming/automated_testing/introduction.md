### Introduction

Hopefully, you’ve been having fun developing in Ruby so far. Perhaps one thing you may not have been enjoying as much, is the process of manually testing your app to ensure it still works after making any changes. Or even worse running your app, getting far into its execution and discovering you have a bug, and then having to do it all over again to verify that you've fixed the bug.

Automated tests are the alternative to manual testing. You've already seen them in action while doing the [Ruby basic exercises](https://github.com/TheOdinProject/ruby-exercises/tree/main/ruby_basics) earlier in this course. Those exercises tasked you with writing code to make a bunch of existing failing tests pass. Over the next few lessons you will learn how to write those tests yourself and integrate writing them into your workflow.

### Learning Outcomes

- What is automated testing?
- What is a test suite?
- What are the benefits of automated testing over manual testing?
- What is a regression?

#### What are Automated Tests?

Automated tests, as the name suggests, automate the process of testing your projects. As you write a new feature, you also write tests for the feature that verify the correctness of it. If the tests pass, you can be confident that the code works as intended. If they fail you know a mistake has been made that needs to be corrected.

There are different types of automated tests. Some are low level and only test individual classes and methods. These are known as unit tests.

Other tests are high level and test your system as a whole by simulating how a real user would interact with the system. These are known as end-to-end tests. All of your tests put together are what's known as a test suite.

### What Problems do Automated Tests Solve?

#### They Save You Time

The most obvious benefit automated testing has over manual testing is the amount of time it can save you.

There's a lot of repetition involved with manual testing. Every time a new feature is added you have to test the feature as well as existing features to ensure they haven't been broken by the changes you've made.

Depending on the size of the project, it could take anywhere from a few minutes to a few weeks in order to exhaustively test everything manually. This amount of time only increases as the project grows in size and complexity.

On the flip side, automated tests take a fraction of the time to run, often only seconds. And you only need to write an automated test once, after which it will test that behavior every time the test suite is run as opposed to repeatedly testing the same thing manually every time a change is made.

#### They Give You Confidence

Software projects are rarely ever finished and they change often. New features need to be added and existing features need to be modified. Any new changes come with the risk of unintentionally breaking something that was previously working. This is known as introducing a regression.

The time it takes to manually test all functionality in a decent-sized project means shortcuts are inevitably taken and regressions are missed because only the areas around where changes have been made will ultimately get tested. This puts the burden of testing everything else onto the end-users of the project.

Automated tests are a safety net against introducing regressions. They provide an immediate feedback loop that lets you know when you've messed up, long before the changes ever make it into users' hands.

The peace of mind and confidence a safety net of automated tests gives you cannot be overstated enough. It encourages you, the developer, to make changes and improvements you might not otherwise have made out of fear of breaking some critical functionality. This, in turn, helps you improve the overall quality and reliability of the project, makes it faster and safer to release new features, and makes maintaining the project easier in the long run.

#### Conclusion

Like almost everything, there are trade-offs to automated testing. It requires an upfront cost in time in order to write the tests and it produces more code to maintain.

But the benefits a well-tested project affords you far outweigh these costs and compound over the lifetime of the project.

For some extra incentive, automated tests have become an industry standard. Being able to write them will be a requirement for almost all the jobs you will apply for. Therefore it's also important to learn how to write them to improve your prospects with getting hired as a developer.

Now that you know the why behind testing, the next few lessons will focus on the how. You will learn how to write tests using a testing framework called RSpec and how to use RSpec to write both unit and end-to-test (E2E) tests. Finally, we will explore test driven development, which is a workflow where you write tests first and use them to drive the design of your code.
