Let's dive right in!

##  Numbers

Numbers are the building blocks of programming logic!  In fact, it's hard to think of any useful programming task that doesn't involve at least a little basic math... so knowing how numbers work is obviously quite important.  Luckily, it's also fairly straightforward.

1. [This W3Schools lesson](https://www.w3schools.com/js/js_numbers.asp) followed by [this one](https://www.w3schools.com/js/js_arithmetic.asp), are good introductions to what you can accomplish with numbers in JS 
2. [This MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Math) covers the same info from a slightly different point of view. There's much more that you can do with numbers, but this is all you need at the moment.
3. Read through \(and code along with!\) [this article](http://javascript.info/operators) about operators in Javascript.  Don't forget to do the "Tasks" at the bottom of the page!  It will give you a pretty good idea of what you can accomplish with numbers (among other things!) in JavaScript.

## Variables

You can think of variables simply as "storage containers" for data in your code.  Until recently there was only one way to declare and use a variable in Javascript (the `var` keyword) but the latest versions of JavaScript include 2 more keywords that can be used depending on the situation. The following resources will tell you what you need to know!

1. Read through [this variable tutorial](http://javascript.info/variables) as well. It covers the other methods of variable creation.  __Be sure to do the Tasks__ at the end of this article!  Information won't stick without practice!
2. Sidenote:  It's mentioned in the above tutorial, but important enough to note specifically here.  `let` and `const` are both relatively new ways to declare variables in JavaScript.  In _many_ tutorials and in code across the internet you are likely to encounter `var`. Don't let it bother you!  You should stick to `let` and `const` for now. There is nothing inherently wrong with `var`, but in a few small cases it's behavior is not what you would expect.  In most cases `var` and `let` behave exactly the same. The precise difference will be explained later.

##  Practice!

You can easily run your own JavaScript code from files that you create on your own computer.  The simplest way to get started is to simply create an html file with the JavaScript code inside of it.  Type the basic html skeleton into a file on your computer somewhere:

```html
<!DOCTYPE html>
<html>
<head>
  <title>Page Title</title>
</head>
<body>
  <script>
 	// Your JavaScript goes here!
    console.log("Hello, World!")
  </script>
</body>
</html>
```

Save and open this file up in a web browser and then open up the browser's console by right-clicking on the blank webpage and selecting "Inspect" or "Inspect Element".  In the developer tools pane find and select the 'console' tab, where you should see the output of our `console.log` statement.

> `console.log()` is the command to print something to the developer console in your browser.  Use it for all of the following exercises.

Try the following exercises in the browser's console.

1. Add 2 numbers together! (just type  `console.log(23 + 97)`   into your html file)
2. Add a sequence of 6 different numbers together.
3. Print the solution to the following equation: `(4 + 6 + 9) / 77`
   1. answer should be approximately `0.24765`
4. Let's use variables!  
   1. Type the following at the top of the script tag: `let a = 10` 
   2. `console.log(a)` should print `10`
   3. Try the following: `9 * a`
   4. and this: `let b = 7 * a` (returns undefined) and then `console.log(b)`
5. You should be getting the hang of this by now... try this sequence:
   1. Declare a constant variable `max` with the value 57.
   2. Set another variable `actual` to `max - 13`
   3. Set another variable `percentage` to `actual / max`
   4. If you type `percentage` and press enter you should see a value like `0.7719`
6. Take a few minutes to keep playing around with various things in your script tag.  Eventually we will learn how to actually make those numbers and things show up on the webpage, but all of this logic will remain the same, so make sure you're comfortable with it before moving on.
