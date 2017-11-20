The very first steps of learning any programming language are destined to be a little frustrating.  It's normal to feel lost and confused as you progress here, because no matter where you start in the material, there are crucial elements of the language that you have just not been exposed to yet.  Having said that, we've _really_ searched to find the best materials to get you going as quickly and smoothly as possible. So embrace the cognitive dissonance, and let's go.

### Points to Ponder

> Use this section to quiz yourself.  If you know all these answers then you can comfortably skip, or at least skim through this lesson.  After the lesson, come back here and read these again to make sure you haven't missed anything crucial.

<details>
  <summary>What are the 7 basic data types in Javascript?</summary>

  * Boolean
  * Null
  * Undefined
  * Number
  * String
  * Symbol
  * Object
</details>

<details>
  <summary>What is a variable? How do you declare one in Javascript?</summary>

  * A variable is a "storage container" for data.  
  * You can declare a variable in Javascript by using the `=` (single equals) sign:
    * `let message = "Hello"`
</details>

<details>
  <summary>
    Name the 3 ways to declare a variable in Javascript. When would you want to use each one?
  </summary>

  * `let` - Used to declare most variables.
  * `const` - Used to declare an unchanging (constant) variable.
  * `var` - Has genereally been replaced by the other two.  Common to see in older code.
</details>

<details>
  <summary>What types of things can you store in a variable?</summary>

  * You can store any of the 7 basic types in a variable
</details>

<details>
  <summary>What are the rules and guidelines for naming variables?</summary>

  * Variable names must contain only letters, digits, `$` and `_`
  * Stay away from generic variable names like `a`, `b`, or `x`
  * Use `camelCase` to name variables with multiple words
    * `let myVeryLongVariableName = 2`
  * Use `ALL_CAPS` and underscores to name constants
    * `const MY_BIRTH_YEAR = 1994`
</details>

<details>
  <summary>What is 'Dynamic typing' and what does it mean for your code?</summary>

  * Dynamic typing allows you to declare variables as you need them.
  * You may assign multiple types to the same variable
    * `let foo = 13;  // foo is a Number`
    * `foo = 'bar';   // foo is now a String`
    * `foo = true;    // foo is now a Boolean`
</details>

<details>
  <summary>How can you do math in JavaScript?</summary>

  * Math can be done in JavaScript by using operators, the basics being:
    * Addition: `6 + 9` equals `15`
    * Subtraction: `20 - 5` equals `15`
    * Multiplication: `3 * 4` equals `12`
    * Division: `24 / 5` equals `4.8`
    * Modulo: `24 % 5` equals `4`
</details>

<details>
  <summary>What's the difference between `=`, `==` and `===`?</summary>

  * Single Equality `=` is an Assignment Operator. It assigns values to variables
  * Double Equality `==` loosely checks for equality
    * `3 == '3' // true`
  * Triple Equality `===` strictly checks for equality
    * `3 === '3' // false`
</details>

<details>
  <summary>What is a string?</summary>

  * A string is a sequence of characters used to represent text
</details>

<details>
  <summary>How do you concatenate a string?</summary>

  * To concatenate a string, you "add" the strings together
    * `"The Od" + "in Project"  // "The Odin Project"`
</details>

<details>
  <summary>What is an array?</summary>

  * An array is an indexed collection of objects
</details>

<details>
  <summary>What types of things can you put into an array?</summary>

  * Any variable or basic type (Boolean, String, Number, etc.) can be stored in an array 
</details>

<details>
  <summary>
    How do you get items out of an array? (i.e. how do you use the information you've stored)
  </summary>

  * You may access arrays through their elements:
    * `let arr = [1, "b", true, null]`
    * `arr[0]  // 1`
    * `arr[2]  // true`
</details>

### Step One

1. [This tutorial](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/A_first_splash) throws you into the deep end 🔥. The point of it is to give you a good feel of what you're going to be able to do with your JavaScript skills, and how to think about breaking down a problem.  You'll also get a good idea for what your code is going to end up looking like. You will not, however really learn a lot here because most of it will be over your head at this point.  Don't sweat it.  It's _just fine_ if you don't really understand what you're doing just yet.  You'll get there.

### Variables
You can think of variables simply as "storage containers" for data in your code.  Until recently there was only one way to declare and use a variable in Javascript (the `var` keyword) but the latest versions of JavaScript include 2 more keywords that can be used depending on the situation. The following resources will tell you what you need to know!

1. Read through [this variable tutorial](http://javascript.info/variables) as well. It covers the other methods of variable creation.  __Be sure to do the Tasks__ at the end of this article!  Information won't stick without practice!
2. There is one quirk that you should be aware of when it comes to declaring variables.  In many cases, you won't have to worry about this too much at all, but when it comes up it can definitely be a frustrating experience to debug if you don't already know about it.  Don't worry too much about it at this point, but read [this short article](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var#var_hoisting) about variable hoisting, and keep it in the back of your mind for now.
3. At the risk of giving you too much information [This article](http://wesbos.com/javascript-scoping/) explains the main difference's between JavaScript's old `var` syntax, and the newer `let` and `const`.  You shouldn't be trying to internalize these small details yet because frankly, they're describing rules that you haven't encountered yet.

### Data types

1. There are a few extremely common types of data that you will encounter in Javascript, and the bulk of this lesson will give us a really strong foundation in all of them.  Before we start digging deep, however, [this article](http://javascript.info/types) will give you a quick overview of the most common ones.

### Numbers
Numbers are the building blocks of programming logic!  In fact, it's hard to think of any useful programming task that doesn't involve at least a little basic math... so knowing how numbers work is obviously quite important.  Luckily, it's also fairly straightforward.

1. [This W3Schools lesson](https://www.w3schools.com/js/js_numbers.asp) followed by [this one](https://www.w3schools.com/js/js_arithmetic.asp), are good introductions to what you can accomplish with numbers in JS 
2. [This MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Math) covers the same info from a slightly different point of view. There's much more that you can do with numbers, but this is all you need at the moment.

### Strings
Depending on what kind of work you're doing, you might end up working more with pieces of text rather than numbers. A __string__ is simply a piece of text... and is a fundamental building block of the language.

1. Read and code along with [yet another MDN tutorial](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings) on the topic. 
2. Go through [this lesson](https://www.w3schools.com/js/js_string_methods.asp) to learn a more about what you can do with strings... be sure to do the exercises at the end!!

> ## A little reminder: 
> By this point, your head might be spinning because of the amount of information you've tried to cram in. That's OK! Don't let it get to you. You are never going to retain all of this info on the first go.  All of these elements are fundamental building blocks of the language, so as you learn you will be encountering them over and over again, and as you do, it will begin to stick. Our advice, for now, is to make sure you're actually coding along with the lessons as you read them (which will definitely help with retention) and just press on.  When we've gotten through this stuff we'll give you a chance to slow down and practice what you've learned.

### Arrays
Strings and numbers may be our building blocks but, as you can probably imagine, as your scripts get larger and more complex you're going to need a way to deal with large numbers of them.  Luckily, JavaScript has a couple of data types that are used for just that.  An Array is simply an ordered collection of items (Strings, numbers, or other things).

1. [This tutorial](https://www.w3schools.com/js/js_arrays.asp) is a great introduction.  Once you have a handle on arrays in general, check out [this article](https://www.w3schools.com/js/js_array_methods.asp) about some of the special methods you can use to manipulate arrays... Don't forget to do the exercises at the end of each lesson!  These fundamentals are something you'll use every day, so don't rush too much and miss out!

### Getting Help!
We've learned a lot!  As we mentioned above, we don't expect that you will have retained all of this information on the first go through.  Your next step then is to _practice_.  The more you use this stuff, the better you'll retain it.  However, as you begin trying to write some code you'll almost definitely realize that you have forgotten something along the way.  Knowing where to look online is a pretty useful skill.  Take a few minutes to check out the following sites.  Get used to their layout and be ready to come back to them when you discover you've lost something.

1. [MDN](https://developer.mozilla.org/en-US/): this one should be familiar to you at this point...  it's the same site as most of the tutorials we've directed you to so far.  In addition to having great beginner tutorials, MDN also has very thorough and well-organized documentation that even the pros use from time to time.
2. [http://javascript.info/](http://javascript.info/), the other site we've linked to is another good resource.  Most of the content takes the form of tutorials rather than documentation, but they're more concise and good for review... and while looking around, you might learn something else along the way which is never a bad thing.
3. [GOOGLE](http://lmgtfy.com/?q=GOOGLE). Ok, we didn't really need to mention this one, but many times the easiest way to look for something is to simply google it.  At this point in your career, you might have a harder time deciphering which information is relevant, or which sites are likely to have the most useful information, but that's OK.  

