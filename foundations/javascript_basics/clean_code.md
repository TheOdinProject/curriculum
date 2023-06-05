### Introduction

You might think that the majority of a developer's work involves writing code. However, in reality, a significant amount of time is spent on _reading_ code. This includes code written by other team members, code written by people who are no longer part of your team, and even code that you wrote two weeks ago but may not remember much about.

This means that learning how to write clean and readable code is crucial. It not only makes your life easier but also improves the experiences of your colleagues and collaborators. No one wants to be that coworker whose code is a nightmare to decipher. Development is a team effort after all.

This lesson aims to provide you with guidelines to make your code more readable and understandable.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- Know how to distinguish hard to read code from easy to read code.
- Use programming principles to make your code cleaner.
- Write good comments.

### What is clean code?

Consider the following examples:

Example A:

~~~javascript
const x =
function(z) {
let w = 0;z.forEach(
function(q){
     w += q;
});return w;
};

x([2, 2, 2]);
~~~

Example B:

~~~javascript
const sumArray = function(array) {
  let sum = 0;
  array.forEach(function(number) {
    sum += number;
  });
  return sum;
};

sumArray([2, 2, 2]);
~~~

Which of these examples do you find easier to read? It's immediately clear that the latter one is more meaningful. Surprisingly, both of these functions perform the exact same task \(in the exact same way!\), and both are valid code. But the second one is much more readable. Why?

In the first example, single-letter variables are used, there is a semicolon in the middle of one line, and the indentation is inconsistent. The result is a piece of code that is confusing and messy. Imagine you're collaborating on a project with someone who has written the first function. How long will it take you to decipher what's going on so you can continue with your work? Or perhaps you've written it yourself just two weeks ago and completely forgot that it even existed. In both situations, you will eventually understand what is happening, but it's not going to be any fun.

Example B, on the other hand, represents clean code. While you may not know precisely what each part does, it's much easier to guess what is happening because the function and variables are named clearly. The indentation follows a consistent and logical pattern, and fortunately, there are no semicolons interrupting the code within a line.

### Naming functions and variables

In our first example we already touched on the importance of _naming_ things meaningfully. Let's break down further what makes a good variable or function name.

**Use descriptive names**

A good name is descriptive. In our good example the we have a variable `sum`, to which each new `number` from the array is added. The function is named `sumArray` and the function does what the name suggests. Nice, clean and understandable.

Now, imagine having a conversation with someone about the bad example. You come across a function named `x` with variables like `z`, `w` and `q`. Confusion is sure to follow.


**Use a consistent vocabulary**

Variables of the same type should have consistent naming. Consider the following examples from a game of Tic-Tac-Toe:

```javascript
getUserScore();
fetchPlayerName();
retrievePlayer1Tag();
```

```javascript
getPlayerScore();
getPlayerName();
getPlayerTage();
```

In the first example, three different names are used to refer to the player and the actions taken. Additionally, three different verbs are used to describe these actions. The second example maintains consistency in both variable naming and the verbs used.

**Use names that are searchable and immediately understandable**

Sometimes, it can be tempting to use an undeclared variable. Let's take another look at an example:

```javascript
setTimeout(stopTimer, 3600000);
```
You probably noticed the problem right away. What does `3600000` mean and how long is this timeout going to count down before executing `stopTimer`? 

Now, let's make this code more meaningful by introducing a descriptive variable:

```javascript
const MILLISECONDS_PER_HOUR = 60 * 60 * 1000; // 3,600,000;


setTimeout(stopTimer, MILLISECONDS_PER_HOUR);
```

Much better, isn't it? The variable is declared with a descriptive name, and you don't need to perform any calculations when reading this code. You might wonder why this variable is declared with all caps. This is a convention to be used when the programmer is absolutely sure that the variable is _truly_ a constant. We know that the milliseconds in an hour will never change, so it's appropriate here. If you're interested, [this article](https://javascript.info/variables#uppercase-constants) provides more background on this convention.


----------
old content from here on

There are many different opinions on what constitutes great JavaScript code.  The most important thing is just that you're consistent.  The war between coders that use tabs and coders that use spaces to indent their code is so engrained that [it's essentially a joke by now](https://www.youtube.com/watch?v=SsoOG6ZeyUI), but it doesn't _really_ matter as long as you're consistent.


### Rules of Thumb

1.  Indentation: It doesn't _really_ matter what style of indentation you use.  Various JS style-guides recommend different options, and one is not really superior to the other.  What _is_ important, however, is consistency.  In our examples we will use 2 spaces for indentation.

2.  Semicolons: Semicolons are _mostly_ optional in JavaScript because the JS compiler will automatically insert them if they are omitted. This functionality CAN break in certain situations leading to bugs in your code so it is better to get used to adding semi-colons.  Just do it!

3. Line length: Again, different style guides will recommend different options for this one, but just about ALL of them suggest limiting the length of each line of code.  This rule is not quite as strict as some of the others, but as a general rule, your code will be easier to read if you manually break lines that are longer than about 80 characters.  Many code editors have a line in the display to show when you have crossed this threshold.   When manually breaking lines, you should try to break immediately _after_ an operator or comma. Then, there are a few ways to format continuation lines. For example, you can:

   - indent continuation lines by one level,
   - vertically align continuation lines with the first variable,
   - or some other format entirely. The rules aren't set in stone and vary from work environment to work environment, but remember to be consistent.

   ~~~javascript
   // One possible format
   let reallyReallyLongLine =
     something +
     somethingElse +
     anotherThing +
     howManyTacos +
     oneMoreReallyLongThing;

   // Another possible format
   let anotherReallyReallyLongLine = something + somethingElse + anotherThing +
                                     howManyTacos + oneMoreReallyLongThing;
   ~~~
   
   ​

4.  Naming Things: Names for functions and variables should be descriptive.  Always use camelCase.  To keep things consistent and easy to read, variables should always begin with a noun or an adjective (that is, a noun phrase) and functions with a verb.  It is ok to use single characters as variable names in the context of a loop or a callback function, but not elsewhere.

    ~~~javascript
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
    ~~~


### Assignment

<div class="lesson-content__panel" markdown="1">

1.  [This list of clean-code tips](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/).
2.  [This article](https://blog.codinghorror.com/coding-without-comments/), [and this one too](https://blog.codinghorror.com/code-tells-you-how-comments-tell-you-why/) about the role of comments in your code.
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [Why is it important to write clean code?](#writing-clean-code)
- [Name 5 clean code principles previously mentioned](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)
- [What is the difference between good comments and bad comments?](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

* [A nice op-ed](https://www.martinfowler.com/bliki/CodeAsDocumentation.html)
* THE complete guide to [self-documenting code](http://wiki.c2.com/?SelfDocumentingCode)
* [Airbnb style guide](https://github.com/airbnb/javascript)  
* [Chaining methods to write sentences](https://web.archive.org/web/20190211152543/https://javascriptissexy.com/beautiful-javascript-easily-create-chainable-cascading-methods-for-expressiveness/)   
