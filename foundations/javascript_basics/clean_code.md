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
const x= function (z){
   const w = "Hello ";
return w +  z

 }

x("John");
```

Example B:

```javascript
const generateUserGreeting = function (name) {
  const greeting = "Hello ";
  return greeting + name;
};

generateUserGreeting("John");
```

Which of these examples do you find easier to read? It's immediately clear that the latter one is more meaningful. Surprisingly, both of these functions perform the exact same task (in the exact same way!), and both are valid code. But the second one is much more readable. Why?

In the first example, single-letter variables are used and the indentation and spacing are inconsistent. The result is a piece of code that is confusing and messy.

Imagine you're collaborating on a project with someone who has written the first function. How long will it take you to decipher what's going on so you can continue with your work? Or perhaps you've written it yourself some time ago and completely forgotten that it even existed. In both situations, you will eventually understand what is happening, but it's not going to be fun.

Example B represents cleaner code. While you may not know what each part does, it's much easier to guess what's happening because the functions and variables are named clearly. The indentation and spacing follow a consistent and logical pattern.

Single characters can be used as variable names in the context of a loop or a callback function, but avoid them elsewhere.

#### About camelCase

camelCase is a naming convention that allows writing multiple words together without spaces or punctuation. In camelCase, when a variable name consists of multiple words like our `setTimeout` example, the first word is written completely in lowercase, while the first letter of the second word (and any subsequent words) are capitalized.

Throughout this lesson, most of our variables and functions will be named using camelCase. While not every language uses this convention, it's very common in JavaScript so it'll be a good example to follow.

<div class="lesson-note" markdown="1">

#### Conventions are only conventions

While this lesson shares some examples on ways to clean up code, in reality, every organization will have different specific approaches, some of which may differ slightly from our examples in this lesson. Nothing is absolute.

What matters most is that these approaches all serve the same overall purpose - improve code readability and maintainability. Until a time comes where you need to follow a specific set of conventions, it is sensible to follow some convention and be consistent with them.

</div>

### Naming functions and variables

In our first example, we already touched on the importance of naming things *meaningfully*. Let's break down further what makes a good variable or function name.

#### A good name is descriptive

In our good example, we have a variable `greeting`, to which the parameter `name` is concatenated. The function is named `generateUserGreeting` and the function does what the name suggests. Nice, clean, and understandable.

Now, try picturing a conversation with someone about the bad example. The function is named `x` with variables like `z`, and `w`. Oof, not nice.

#### Use consistent vocabulary

Variables of the same type ideally follow a consistent naming system. Consider the following examples from a game:

```javascript
// Consistent naming
function getPlayerScore();
function getPlayerName();
function getPlayerTag();
```

They all follow the same naming system of "get a thing". Now consider the following:

```javascript
// Inconsistent naming
function getUserScore();
function fetchPlayerName();
function retrievePlayer1Tag();
```

In the inconsistent example, three different verbs are used for the functions. While they all mean a similar thing, at a glance you might assume different verbs were used for a specific reason (e.g. "getting" might not be *quite* the same thing as "fetching" in some contexts). Additionally, what's the difference between `User`, `Player` and `Player1`? If there is no difference then ideally, you'd use the same name e.g. `Player`. Consistency allows for predictability.

Variables should preferably begin with a noun or an adjective (that is, a noun phrase), as they typically represent "things", whether that thing is a string, a number etc. Functions represent actions so ideally begin with a verb.

```javascript
// Preferable
const numberOfThings = 10;
const myName = "Thor";
const selected = true;

// Not preferable (these start with verbs, could be confused for functions)
const getCount = 10;
const showNorseGods = ["Odin", "Thor", "Loki"];

// Preferable
function getCount() {
  return numberOfThings;
}

// Not preferable (myName doesn't represent some kind of action)
function myName() {
  return "Thor";
}
```

### Use searchable and immediately understandable names

Sometimes, it can be tempting to use "magic values" i.e. explicit values, such as bare numbers or strings. Let's take another look at an example:

```javascript
setTimeout(stopTimer, 3600000);
```

The problem is obvious. What does the magic number `3600000` mean, and how long is this timeout going to count down before executing `stopTimer`? Even if you know that JavaScript understands time in milliseconds, you'd probably need a calculator or Google to figure out how many seconds or minutes it represents.

Now, let's make this code more meaningful by introducing a descriptive variable:

```javascript
const ONE_HOUR = 3600000; // Can even write as 60 * 60 * 1000;

setTimeout(stopTimer, ONE_HOUR);
```

Much better, isn't it? The variable is declared with a descriptive name, and you don't need to perform any calculations when reading this code.

You might wonder why this variable is declared with all caps when we recommended camelCase earlier. This is a convention to be used when the programmer is absolutely sure that the variable is *truly* a constant, especially if it represents some kind of concept like a specific duration of time. We know that the milliseconds in an hour will never change, so it's appropriate here. Remember, this is only a convention. Not everyone will necessarily do things the same way.

### Indentation and line length

Now it's time to head to more "controversial" topics (there's a joke about the [war between coders who indent with spaces versus tabs](https://www.reddit.com/r/programming/comments/p1j1c/tabs_vs_spaces_vs_both/)).

What actually matters is *consistency*. Choose a way to indent and stick to it. Various JavaScript style guides recommend different options, and one is not really superior to the other. We will look at style guides and related tools in more detail later in the curriculum.

#### Line length

Again, different style guides will recommend different options for this one, but just about *all* of them suggest limiting the length of each line of code.

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

Different formats aren't necessarily right or wrong, and different people may prefer different things. Do things in a way that makes sense to you, and stay consistent with it.

### Semicolons

Semicolons are *mostly* optional in JavaScript because the JavaScript interpreter will automatically insert them if they are omitted. This functionality *can* break in certain situations, leading to bugs in your code, so we'd recommend getting used to adding semicolons.

Whether you do or not, again, consistency is the main thing.

### About comments

Comments are a great tool but like any good tool, they can be misused. Especially for someone early in their coding journey, it might be tempting to have comments that explain *everything* the code is doing. This is generally not a good practice. Let's look at some common pitfalls when commenting and *why* they are pitfalls.

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

Ideally, comments do not provide pseudocode that duplicates your code. Good comments explain the *reasons* behind a piece of code. Sometimes you won't even need a comment at all!

Say we had a string where part of the text was inside square brackets and we wanted to extract the text within those brackets.

```javascript
// Function to extract text
function extractText(s) {
  // Return the string starting after the "[" and ending at "]"
  return s.substring(s.indexOf("[") + 1, s.indexOf("]"));
}
```

The comments just describe what we can tell from the code itself. Slightly more useful comments could explain the reasons behind the code.

```javascript
// Extracts text inside square brackets (excluding the brackets)
function extractText(s) {
  return s.substring(s.indexOf("[") + 1, s.indexOf("]"));
}
```

But often, we can make the code speak for itself without comments.

```javascript
function extractTextWithinBrackets(text) {
  const bracketTextStart = text.indexOf("[") + 1;
  const bracketTextEnd = text.indexOf("]");
  return text.substring(bracketTextStart, bracketTextEnd);
}
```

In the first example, the comments repeat twice what the code does. But for this, you could've just read the code, so the comments are redundant.

In the second example, the comment clarifies the purpose of the function: extracting the text between square brackets from a string and not just "extracting text". That's handy, but we can do *even* better.

In the last example, no comments are needed at all. The use of descriptive functions and variable names eliminates the need for additional explanations. Pretty neat, huh?

**This doesn't mean good code should lack comments.** Let's look at an example where a comment serves a helpful purpose:

```javascript
function calculateBMI(height, weight) {
  // The formula for BMI is weight in kilograms divided by height in meters squared
  const heightInMeters = height / 100;
  const bmi = weight / (heightInMeters * heightInMeters);
  return bmi;
}
```

This comment helps to refresh the reader on how BMI is calculated in plain English, helping the reader to see why the height needs to be converted and what the following calculation is doing. We are almost there with the naming, but the comment still adds further clarity.

In many situations, well-placed comments are priceless. They might explain why an unintuitive bit of code is necessary, or perhaps the bigger picture of why a certain function is *particularly* important to be called here and not there. The article linked in the assignment section goes into more depth on this.

### In conclusion

Now that we've covered these ideas, it's good to return to the reminder we shared at the start. Don't try to write perfectly clean code, this will only lead to frustration. Writing "spaghetti" is inevitable; everyone does it sometimes. Just keep these ideas in mind, and with time and patience, your code will start to get cleaner.

Learning to write clean code is a process of constant improvement. One that will extend beyond you *completing* The Odin Project. This lesson is meant to serve as a primer and a starting point for that journey.

> Great code comes from experience. Experience comes from not-so-great code.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [10 Principles for Keeping Your Programming Code Clean](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/) to get some great tips for clean code.
1. To help better understand good comment practices, read about [comments telling us why code works](https://blog.codinghorror.com/code-tells-you-how-comments-tell-you-why/) as well as how to [code without comments](https://blog.codinghorror.com/coding-without-comments/).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why is it important to write clean code?](#introduction)
- [What are some good principles for keeping code clean?](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)
- [What is the difference between good comments and bad comments?](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [A nice op-ed on code as documentation](https://www.martinfowler.com/bliki/CodeAsDocumentation.html)
- [Airbnb style guide](https://github.com/airbnb/javascript)
- [Chaining methods to write sentences](https://web.archive.org/web/20190211152543/https://javascriptissexy.com/beautiful-javascript-easily-create-chainable-cascading-methods-for-expressiveness/)
- [Clean code in JavaScript](https://github.com/ryanmcdermott/clean-code-javascript)
