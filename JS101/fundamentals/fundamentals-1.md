# Fundamentals 1

## Numbers

Numbers are the building blocks of programming logic!  In fact, it's hard to think of any useful programming task that doesn't involve at least a little basic math... so knowing how numbers work is obviously quite important.  Luckily, it's also fairly straightforward.

1. [This W3Schools lesson](https://www.w3schools.com/js/js_numbers.asp) followed by [this one](https://www.w3schools.com/js/js_arithmetic.asp), are good introductions to what you can accomplish with numbers in JS 
2. [This MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Math) covers the same info from a slightly different point of view. There's much more that you can do with numbers, but this is all you need at the moment.
3. Read through \(and code along with!\) [this article](http://javascript.info/operators) about operators in Javascript.  Don't forget to do the "Tasks" at the bottom of the page!  It will give you a pretty good idea of what you can accomplish with numbers (among other things!) in JavaScript.

##Variables

You can think of variables simply as "storage containers" for data in your code.  Until recently there was only one way to declare and use a variable in Javascript (the `var` keyword) but the latest versions of JavaScript include 2 more keywords that can be used depending on the situation. The following resources will tell you what you need to know!

1. Read through [this variable tutorial](http://javascript.info/variables) as well. It covers the other methods of variable creation.  __Be sure to do the Tasks__ at the end of this article!  Information won't stick without practice!
2. Sidenote:  It's mentioned in the above tutorial, but important enough to note specifically here.  `let` and `const` are both relatively new ways to declare variables in JavaScript.  In _many_ tutorials and in code across the internet you are likely to encounter `var`. Don't let it bother you!  You should stick to `let` and `const` for now. There is nothing inherently wrong with `var`, but in a few small cases it's behavior is not what you would expect.  In most cases `var` and `let` behave exactly the same. The precise difference will be explained later.

## Practice!

One useful way to run JavaScript code is by simply typing it into your web browser!  Modern browsers like Chrome and Firefox have some incredibly useful features built into their "developer tools".

Exactly how you open up the devtools in your browser is going to change based on your browser and system, but in general if you right-click on a web page you should be able to find an option called "Inspect" or "Inspect Element".  Most browsers also have keyboard shortcuts associated with these views as well.  The keyboard shortcuts will vary based on your system, but taking a minute or two to look them up is a great investment of time.

There is a _lot_ of information available to you inside the developer tools, and it might be a little overwhelming at first.  We will be looking at a lot of those features eventually, but for now we are going to focus on the __console__ tab.  Clicking on the console tab should display a prompt where you can type JavaScript commands.  This is a great place to start experimenting with your own code!

Try the following exercises in the browser's console.

1. Add 2 numbers together! (just type in the command: `23 + 97` and press enter.. it _should_ display your answer)
2. Add a sequence of 6 different numbers together.
3. Get the solution to the following equation: `(4 + 6 + 9) / 77`
   1. answer should be approximately `0.24765`
4. Let's use variables!  You can type in and use variables in the console very easily.  
   1. Type the following and then press enter: `let a = 10`  (the browser should respond `undefined`)
   2. type `a` and press enter.. it should return 10!
   3. Try the following: `9 * a`
   4. and this: `let b = 7 * a` (returns undefined) followed by simply pressing `b` and then enter (should display `70`)
5. You should be getting the hang of this by now... try this sequence:
   1. Declare a constant variable `max` with the value 57.
   2. Set another variable `actual` to `max - 13`
   3. Set another variable `percentage` to `actual / max`
   4. If you type `percentage` and press enter you should see a value like `0.7719`

Your browser's console is a valuable tool to test out and play with code snippets as you are learning! As you go though the following lessons it's important that you are constantly typing in the code you see to try it out.  Reading without practicing will not get you very far!