
### Introduction

You might think that the majority of a developer's work involves writing code. However, in reality, a significant amount of time is spent on *reading* code. This includes code written by other team members, code written by people who are no longer part of your team, and even code that you wrote two weeks ago but may not remember much about.

Don't think of these principles as something you need to master immediately. Everybody writes messy code sometimes, even professionals. What we want to do here is give you some guidelines that can help improve the readability of your code as you go along. The more you write code, the better it will become, both in terms of readability and other aspects.

Test out these ideas and try to incorporate them into your thought process while writing code, but don't beat yourself up for not writing elegant, crystal-clear code. Focus on gradual improvement, not perfection.

With that out of the way, let's get started!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Know how to distinguish hard to read code from easy to read code.
- Use programming principles to make your code cleaner.
- Write good comments.

### What is clean code?

Consider the following examples:

Example A:

```javascript

const x = function (z) {
  const w = "Hello ";
return w + z
};

x("John");
```

Example B:

```javascript
const generateUserGreeting = function (name) {
  const greeting = "Hello ";
  return greeting + name
};

generateUserGreeting("John");
```

Which of these examples do you find easier to read? It's immediately clear that the latter one is more meaningful. Surprisingly, both of these functions perform the exact same task \(in the exact same way!\), and both are valid code. But the second one is much more readable. Why?

In the first example, single-letter variables are used, there is a semicolon in the middle of lines, and the indentation is inconsistent. The result is a piece of code that is confusing and messy.

Imagine you're collaborating on a project with someone who has written the first function. How long will it take you to decipher what's going on so you can continue with your work? Or perhaps you've written it yourself some time ago and completely forgotten that it even existed. In both situations, you will eventually understand what is happening, but it's not going to be fun.

Example B represents clean code. While you may not know what each part does, it's much easier to guess what's happening because the functions and variables are named clearly. The indentation follows a consistent and logical pattern, and there are no semicolons interrupting the code within a line.

Single characters can be used as variable names in the context of a loop or a callback function, but avoid them elsewhere.

#### About camelCase

camelCase is a naming convention that allows writing multiple words together without spaces or punctuation. In camelCase, when a variable name consists of multiple words like our `setTimeout` example, the first word is written completely in lowercase, while the second word (and any subsequent words) are capitalized.

Throughout this lesson, most of our variables and functions (at least in the good examples!) will be named using camelCase. It's a good example to follow.

### Naming functions and variables

In our first example, we already touched on the importance of naming things *meaningfully*. Let's break down further what makes a good variable or function name.

#### A good name is descriptive

In our good example, we have a variable `sum`, to which each new `number` from the array is added. The function is named `sumArray` and the function does what the name suggests (if you're thinking "what even is an array", don't worry - you'll learn about them soon). Nice, clean, and understandable.

Now, try picturing a conversation with someone about the bad example. The function is named `x` with variables like `z`, `w` and `q`. Oof, not nice.

#### Use a consistent vocabulary

Variables of the same type should have consistent naming. Consider the following examples from a game:

```javascript
 // Good
function getPlayerScore();
function getPlayerName();
function getPlayerTag();

// Bad
function getUserScore();
function fetchPlayerName();
function retrievePlayer1Tag();
```

In the bad example, three different names are used to refer to the player and the actions taken. Additionally, three different verbs are used to describe these actions. The good example maintains consistency in both variable naming and the verbs used.

Variables should always begin with a noun or an adjective (that is, a noun phrase) and functions with a verb.

Another set of examples can illustrate why this matters:

```javascript
// Good
const numberOfThings = 10;
const myName = "Thor";
const selected = true;

// Bad (these start with verbs, could be confused for functions)
const getCount = 10;
const isSelected = true;

// Good
function getCount() {
  return numberOfThings;
}

// Bad (it's a noun)
function myName() {
  return "Thor";
}
```

### Use searchable and immediately understandable names

Sometimes, it can be tempting to use an undeclared variable. Let's take another look at an example:

```javascript
setTimeout(stopTimer, 3600000);
```

The problem is obvious. What does the undeclared variable `3600000` mean, and how long is this timeout going to count down before executing `stopTimer`? Even if you know that JavaScript understands time in milliseconds, a calculator is needed.

Now, let's make this code more meaningful by introducing a descriptive variable:

```javascript
const MILLISECONDS_PER_HOUR = 60 * 60 * 1000; // 3,600,000;

setTimeout(stopTimer, MILLISECONDS_PER_HOUR);
```

Much better, isn't it? The variable is declared with a descriptive name, and you don't need to perform any calculations when reading this code.

You might wonder why this variable is declared with all caps when we recommended camelCase earlier. This is a convention to be used when the programmer is absolutely sure that the variable is *truly* a constant. We know that the milliseconds in an hour will never change, so it's appropriate here.

### Indentation and line length

Now it's time to head to more controversial topics. The war between coders that use tabs and coders that use spaces to indent their code is essentially a joke by now, as demonstrated in the [tabs versus spaces scene from the show Silicon Valley](https://www.youtube.com/watch?v=SsoOG6ZeyUI).

What actually matters is *consistency*. Choose a way to indent and stick to it. Various JS style-guides recommend different options, and one is not really superior to the other. A few popular ones are linked in the additional resources.

#### Line length

Again, different style guides will recommend different options for this one, but just about ALL of them suggest limiting the length of each line of code.

Generally, your code will be easier to read if you manually break lines that are longer than about 80 characters. Many code editors have a line in the display to show when you have crossed this threshold. When manually breaking lines, you should try to break immediately *after* an operator or comma.

Then, there are a few ways to format continuation lines. For example, you can:

```javascript
// This line is a bit too long
let reallyReallyLongLine = something + somethingElse + anotherThing + howManyTacos + oneMoreReallyLongThing;

// You could format it like this
let reallyReallyLongLine =
  something +
  somethingElse +
  anotherThing +
  howManyTacos +
  oneMoreReallyLongThing;

// Or maybe like this
   let anotherReallyReallyLongLine = something + somethingElse + anotherThing +
                                     howManyTacos + oneMoreReallyLongThing;
```

### Semicolons

Semicolons are *mostly* optional in JavaScript because the JS compiler will automatically insert them if they are omitted. This functionality CAN break in certain situations, leading to bugs in your code, so it is better to get used to adding semi-colons.

Again: consistency is the main thing.

### About comments

Comments are a great tool. But like any good tool, it can be misused. Especially for someone early in their coding journey, it might be tempting to have comments that explain *everything* the code is doing. This is not a good practice.

Next, we'll look into some common pitfalls in commenting and *why* they are pitfalls.

#### Don't comment when you should be using git

It might be tempting to have comments in your code that explain the changes or additions you have made. For example:

```javascript
/**
 * 2023-01-10: Removed unnecessary code that was causing confusion (RM)
 * 2023-03-05: Simplified the code (JP)
 * 2023-05-15: Removed functions that were causing bugs in production (LI)
 * 2023-06-22: Added a new function to combine values (JR)
 */
```

The problem is that you already have a tool to track changes - git! Keeping track of these comments will become a chore, and you will have an incomplete picture of what has happened. Your files will also contain bloat that doesn't belong there.

By using git, all this information will be neatly organized in the repository and readily accessible with `git log`.

The same applies to code that is no longer used. If you need it again in the future, just turn to your git commits. Commenting out something while testing something else is, of course, ok, but once a piece of code is not needed, just delete it. Don't have something like this hanging around in your files:

```javascript
theFunctionInUse();
// oldFunction();
// evenOlderUselessFunction();
// whyAmIEvenHereImAncient():
```

#### Tell why, not how

The purpose of comments is not to provide pseudo code that duplicates your code. Good comments explain the *reasons* behind a piece of code.

Let's look at an example to see this in practice:

```javascript
// Bad Example - comment doesn't tell why, only what and how

// This function increments the value of i by 1
function incrementI(i) {
  i = i + 1; // Add one to i
  return i;
}

// Better Example - comment tells a why

// This function increments the value of index to move to the next element
function incrementI(i) {
  i = i + 1;
  return i;
}

// Good Example - the code tells all that is needed

function moveToNextElement(index) {
  index = index + 1;
  return index;
}
```

In the bad example, the comments explain twice what the code does. But for this, you could've just read the code, so the comments are redundant.

In the better example, the comment clarifies the purpose of the function: moving to the next element. That's good, but we can do *even* better.

In the good example, no comments are needed at all. The use of descriptive functions and variable names eliminates the need for additional explanations. Pretty neat, huh?

*This doesn't mean good code should lack comments*. In many situations, well-placed comments are priceless. The article linked in the assignment section goes into more depth on this. We don't want you to avoid comments; just be mindful of how they are best used.

Let's look at one final example where a comment serves a good purpose:

```javascript

function calculateBMI(height, weight) {
    // The formula for BMI is weight in kilograms divided by height in meters squared
  const heightInMeters = height / 100;
  const bmi = weight / (heightInMeters * heightInMeters);
  return bmi;
}
```

This comment helps to refresh the reader on how BMI is calculated in plain English, helping the reader to see why the height needs to be converted and what the following calculation is doing. We are almost there with the naming, but the comment still adds further clarity.

### In conclusion

Now that we've covered these ideas, it's good to return to the reminder we shared at the start. Don't try to write perfectly clean code; this will only lead to frustration. Writing "spaghetti" is inevitable; everyone does it sometimes. Just keep these ideas in mind, and with time and patience, your code will start to get cleaner.

Learning to write clean code is a process of constant improvement. One that will extend beyond you *completing* The Odin Project. This lesson is meant to serve as a primer and a starting point for that journey.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [10 Principles for Keeping Your Programming Code Clean](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/) to get some great tips for clean code.
1. To help better understand good comment practices, read about [comments telling us how code works](https://blog.codinghorror.com/code-tells-you-how-comments-tell-you-why/) as well as how to [code without comments](https://blog.codinghorror.com/coding-without-comments/).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why is it important to write clean code?](#introduction)
- [Name 5 clean code principles previously mentioned](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)
- [What is the difference between good comments and bad comments?](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [A nice op-ed](https://www.martinfowler.com/bliki/CodeAsDocumentation.html)
- [Airbnb style guide](https://github.com/airbnb/javascript)
- [Chaining methods to write sentences](https://web.archive.org/web/20190211152543/https://javascriptissexy.com/beautiful-javascript-easily-create-chainable-cascading-methods-for-expressiveness/)

- [Clean code in JavaScript](https://github.com/ryanmcdermott/clean-code-javascript)
