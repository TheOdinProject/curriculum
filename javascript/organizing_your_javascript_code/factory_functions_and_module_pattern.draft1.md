### Why not constructors?

We have discussed about object constructors in the previous lesson. However, they are simply one of the many ways to organize your code. While they are fairly common in the code seen about the internet and a fundamental building block of Javascript language, they have their own flaws.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- A LESSON OVERVIEW ITEM.

### Scope and closure

Before we start learning about factory functions, we need to discuss two important concepts to understand them better - scope and closure. Don't be intimidated, we will be done in a jiffy.

Before 2016, Javascript had a single keyword to declare a variable, `var`. As you have seen, we rarely use it today - and with good reason. The word **scoping** essentially asks, "where is a certain variable available to me?" - which leads to a few classifications:

- **Global scope** - When you declare a vairable in Javascript, **outside any function or curly braces**, it is said to be defined in the "Global scope". Variables declared here are available throughout the program, and can be used anywhere, even within functions.

  ~~~javascript
  const greeting = "Hello there!";
  const sendGreetings = () => {
    console.log(greeting);
  }

  sendGreetings(greeting); // Logs "Hello there!"
  ~~~

  Another word that you will hear often is "namespace". Namespace is sometimes used interchangeably with the word "scope", but in this case, usually refers to the highest level of scope possible, that is, the global scope. This is also where we can talk about cluttering the global scope, or "namespace pollution".

  Although you can declare variables in the global scope, it is advised not to. This is because there is a chance of naming collisions, where two or more variables are named the same. It gets easy to redefine your global variable within your code and harder to debug.

- **Local scope** - Variables that are usable only in a specific part of your code are considered to be in a "local scope". They can again be of two types, broadly:

  - **Function scope** - When you declare a variable in a function, you can access this variable only within the function. You can’t get this variable once you get out of it. The `var` keyword is said to be function-scoped, which means, it is only available inside the function in which it is defined. This led to problems where 

### So, what's wrong with constructors?

One of the key arguments against constructors, in fact, the biggest argument is how they *look* like regular Javascript functions, even though they do not *behave* like regular function. If you try to use a constructor function without the `new` keyword, not only does your program fail to work, it also produces error messages that are hard to track down and understand. 

While still seen in code, these problems led to use of a pattern that was similar to constructors but addessed a ton of these problems: Factory Functions.

### Factory functions: construction, industrialised



### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read through this [article from Tarek Sherif](https://tsherif.wordpress.com/2013/08/04/constructors-are-bad-for-javascript/). It discusses the intricacies of constructors, the risks, and benefits of factory function with good examples.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
