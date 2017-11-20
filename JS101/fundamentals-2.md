Let's dive deeper into the fundamentals of JavaScript. After you complete this lesson you will have time to practice all the bits and pieces you are learning, but as we go please be sure to do the exercises and code-alongs that you can find in the various articles and tutorials we're directing you to!  You will learn much more by _doing_ rather than simply reading.

### Points to Ponder
<details>
  <summary>Can you define the terms "operand", "unary" and "binary" in a Javascript context?</summary>
    
  * An operand is what operators are applied to. You can also call them arguments.
    * `5 + 2 // 5 and 2 are operands`
  * Unary operators have only one operand.
  
      let x = 1
      x = -x // unary "-" reverses the sign
      
  * Binary operators have two operands.
      
      let x = 4, y = 2
      (y - x) // 2, binary minus subtracts values

</details>
<details>
  <summary>How does the "binary +" affect string concatenation? How is the "unary +" used?</summary>
  
  * Binary + is used to concatenate strings. If one of the two operands is a string, then the other will be converted to a string too.
    * `1 + '2' // 12`
  * "Unary +" has the same effect as the Number() operator.     * `+true // 1`
    * `+false // 0`
</details>

<details>
  <summary>Why does the expression "let x = 2 * 2 + 1" calculate the numbers before assigning x?</summary>
  
  * The assignment operator has a lower precedence than multiplication and addition. 
</details>

<details>
  <summary>How are remainders found in JavaScript?</summary>
  
  * Use the `%` modulo operator.
    * `25 % 7 // 4`
    * `25 % 5 // 0`
</details>

<details>
  <summary>How are numbers exponentiated in JavaScript?</summary>
  
  * Use the `**` operator.
    * `3 ** 2 // 9 (3*3)`
    * `3 ** 3 // 27 (3*3*3)`
</details>

<details>
  <summary>How are conditionals used in JavaScript?</summary>
  
  * Use if to specify a block of code to be executed, if a specified condition is true
  * Use else to specify a block of code to be executed, if the same condition is false
  * Use else if to specify a new condition to test, if the first condition is false
  * Use switch to specify many alternative blocks of code to be executed
  
      if (condition) {
      // block of code to run if condition is true
      } else {
      // block of code to run if condition is false
      }
      
</details>

<details>
  <summary>How are for loops used in JavaScript?</summary>
  
  * A counter or initializer, which is initialized with a certain value — this is the starting point of the loop
  * An exit-condition, which is the criteria under which the loop stops — usually the counter reaching a certain value.
  * An iterator or final-expression, which generally increments the counter by a small amount on each successive loop, until it reaches the exit-condition. 
  * A set of curly braces in which a block of code is run.
  
      for (initializer; exit-condition; final-expression) {
      // code to run
      }
      
</details>

<details>
  <summary>How are while loops used?</summary>
  
  * The initializer is set before the loop
  * The loop runs _while_ the initializer hasn't reached the exit-condition
  * The final-expression runs at the end of the code block, and brings the initializer closer to the exit-condition.
  
      initializer
      while(exit-condition) {
      //code to run
      
      final-expression
      }
      
</details>

<details>
  <summary>What is a function and why is it necessary?</summary>
  
  * A function is a place to store a piece of code that does a single task inside a defined code block.
  * This code can then be called anywhere by typing out a single command -- rather than retyping the same code multiple times.
</details>

<details>
  <summary>What is the difference between a function and a method?</summary>
  
  * They are theoretically the same thing, but built-in browser-functions that are stored inside objects are called methods.
</details>

<details>
  <summary>How are functions invoked?</summary>
  
  * By _calling_ the function name somewhere in the code followed by parentheses.
</details>



<details>
  <summary>What is the difference between global scope and local scope?</summary>
  
  * The top level scope outside of all your functions is the global scope. Values defined here are accessible throughout your code.
  * Values defined within a function have local scope. They can only be accessed by that specific fuction.
</details>

### Operators and Comparisons

This basic information is another crucial building block in the foundation of your programming skill.  In the end it's not too complicated despite the technical jargon, but make sure you understand this stuff before you move on!

1. Read through \(and code along with!\) [this article](http://javascript.info/operators) about operators in Javascript.  Don't forget to do the "Tasks" at the bottom of the page!  
2. [More operators](http://javascript.info/logical-operators).  
3. Some of the most common operators in programming are those used to compare values.  Read about those [here](http://javascript.info/comparison).

### Conditionals

Now it's time for the fun stuff...  So far we haven't done much with our programming that you couldn't do with simple math skills.  Sure, we've told our computer how to do the math, so that makes it quicker, but the essence of programming is teaching the computer how to make decisions in order to do more involved things.  Conditionals are how we do that.

1. [This tutorial](https://www.w3schools.com/js/js_if_else.asp) is a great first glance at conditionals in JavaScript.
2. [This article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals) reinforces the concept and provides several interesting examples of how you could use it building websites.  
3. [This article](http://javascript.info/ifelse) covers the same basic concept \(read through it as a review!\) After reading try to tackle the 'Tasks' at the bottom of the page.
4. [This tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-the-switch-statement-in-javascript) teaches you about the `switch` statement, which comes in handy when you have multiple conditions.

> ## Quick Tip:
>
> As we get further into the curriculum, you are likely to encounter tasks or problems that you aren't sure how to complete.  **That's OK!**  Do not waste too much time trying to figure something out when you don't have any idea where to start.  Simply give it a shot, and if you get stuck go ahead and ask for help or look at the given solution.  _THEN_ figure out how the solution works and try to code it yourself without looking.  Doing it yourself is the quickest way to actually learn, but don't get stuck thinking that you're cheating by looking up the answer or asking for help.

### Loops

Computers don't get tired, and they're really _really_ fast!  For that reason they are well suited to solving problems that involve doing calculations multiple times.  In some cases a computer will be able to repeat a task _thousands_ or even _millions_ of times in just a few short seconds where it might take a human many hours. \(obviously speed here depends on the complexity of the calculation and the speed of the computer itself\).  One way to make a computer do a repetitive task is using a **loop**

1. Read this [MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Looping_code).  It's a longer one, but make sure you tackle the 'Active Learning' sections at the bottom of the page.  
2. Once again, same info, slightly different context from [JavaScript.info](http://javascript.info/while-for) \(Skim the info if you think you know it all, but **don't forget the tasks at the end of the page**.  You learn best by _doing_\)

### Functions

Things are about to get _really_ exciting.  So far you have been writing an impressive amount of code to solve various problems but that code has not been as useful as it could be.  Imagine taking one of your scripts and bundling it into a little package that you could use over and over again without having to rewrite or change the code.  That's the power of functions and they're used _constantly_ in JavaScript.

1. [Another lengthy MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Functions) is a good place to start.  Pay special attention to the sections on 'Function Scope'.  Scope is one topic that commonly trips up both beginner and intermediate coders so it pays to spend some time with it up front.  
2. Read this article about [return values](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Return_values).  
3. Next, read [this one](http://javascript.info/function-basics) from Javascript.info.  We've mentioned this before, but JavaScript has changed a bit over the years and functions have recently recieved some innovation.  This article covers one of the more useful new abilities: 'default parameters'. \(and don't forget the 'tasks' at the end!!\)  
4. Finally, read [one more article](http://javascript.info/function-expressions-arrows) about functions in Javascript that will give you a little more context.  Another relatively new feature in modern JavaScript is the `arrow function`. Which is introduced in this article.  Arrow functions are useful, but not incredibly crucial so don't worry about them too much just yet.  We include them here because you are likely to encounter them as you move forward, and it's better that you have at least _some_ idea of what you're looking at whenever they crop up.



