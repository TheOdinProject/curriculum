We've already looked at scopes and functions quite a bit and you've had a chance to play with callbacks already, but here we'll dig deeper.  Events are everywhere in Javascript, and you almost always want to do something when the event has finished running (or if there's been an error).  That's where the callback comes in.

### Points to Ponder

* What is a callback?
* What is the scope inside a callback?
* What is `this` in a callback?
* When is a callback called?
* What is `#setTimeout` useful for?
* Why are the return values of event listeners much less important than the callback(s) inside?

### What is a callback?
#### A callback is a function that is passed as an argument to another function.

That's basically it.

### How does this look in practice?
Consider the following:

```language-javascript
//First function, expects a callback
function firstFunction(callback) {
  callback('hello')
}

//Second function, expects a string
function secondFunction(string) {
  console.log(string);
}

//Now call them
firstFunction(secondFunction);

//Writes 'hello' to the console.
```

Congratulations.  You just used a callback function.  If you don't get what's going on above, try to write it out yourself and run the code in something like [jsBin](https://jsbin.com).

Do you see what's going on here?  `firstFunction` *expects* to receive a function as an argument.  This is important, because if we were to pass in something like an `integer` or a `string` instead of a function, then we would get an error.

`secondFunction` expects a `string` (or really, anything since it's just logging to the console, but let's pretend that it requires a string for the sake of argument). This string is supplied by `firstFunction`.

This is really the simplest, and most basic explanation of callbacks.  Make sure you understand this, because everything that follows will build on the above example.

### Take a look at the above example again.

Did you notice how `firstFunction` passes only one argument to its callback?

And also, that `secondFunction` only expects to receive one argument?

This is important, because the *number of arguments* and the *type of data they pass around* is something that you need to be aware of when you're using callbacks.

In our example, `firstFunction` will pass only one argument to whatever callback it receives.  So `secondFunction` needs to be written to receive only one argument.  Doing something like this will cause problems:

```language-javascript
secondFunction(string, number) {
  number += 1;
  console.log(string, number)
}
```

Some functions will pass multiple arguments to their callbacks, with multiple data types.  If this isn't crystal clear to you right now, don't worry.  With trial and error, and reading the documentation, you'll be able to figure it out.

### Ok so far so good.
Let's take a look at some jQuery code.

```language-javascript
$('#link').click(function(){
  //Do stuff
});
```

What's going on here? Let's break this down into it's component parts.

####1. The `$` jQuery function.  
This is the first function you are calling.  `$` is just the name of that function.  Somewhere in the jQuery library is code that looks something like this:

```language-javascript
function $(){
  //jQuery source code
}
```

It's really that simple. `$('#link')` is the `$()` function with `'#link'` as its argument.

####2. `#link`
This is the DOM element that you have selected.

####3. `.click()`
This is an event handler - it's a special type of function that gets executed when certain things happen in the DOM.  In this case, when a user clicks on the selected element, the `.click()` function is called.  The `click` function expects a single function as its argument, which it executes. The source code for the `.click()` function might look something like this:

*Disclaimer: this is totally not what it looks like in reality - it's a massive simplification to serve a point!*

```language-javascript
function click(callback){
  callback() //execute callback
}
```

####4. `function(){//Do stuff}`
Ok so this is it. This is our callback function.

But hang on, this looks different from the first example of callbacks! Well, not really.

Remember, in JavaScript you can use anonymous functions (that is, functions without a name) that you instantiate immediately.  To illustrate this point, consider the following example:

```language-javascript
function doStuff() {
  //Do stuff
}

$('#link').click(doStuff);
```

This is basically the same thing as writing:

```language-javascript
$('#link').click(function(){
  //Do stuff
});
```

It's just no longer using an anonymous function, which means that you can re-use `doStuff` wherever you like.

So when should you use anonymous functions?  A good rule of thumb is, if you're not planning on reusing the bit of code that you're writing, then you can go ahead and make it anonymous.

### The most important thing you need to know about callbacks

#### Using callbacks is like playing a game of hot-potato.  You have a piece of data that you are passing from function to function to function.  There's a good chance that you will not `return` this data.

If you're coming to JavaScript from Ruby then you're probably very comfortable with thinking about functions as things that `return` data.  You put something into it, and then you get something back.

```language-javascript
function returnNumber(data) {
  return data;
}

returnNumber(12);
//12
```

The function above does exactly what it says.  It returns a number (12, in this case).  But consider again our first example:

```language-javascript
//First function, expects a callback
function firstFunction(callback) {
  callback('hello')
}

//Second function, expects a string
function secondFunction(string) {
  console.log(string);
}

//Now call them
firstFunction(secondFunction);

//Writes 'hello' to the console.
```

None of these functions `return` anything, but you're still getting something to show the user.  This is the fundamental thing about callbacks - their name somehow implies that you are 'calling back' to the past, but what you are actually doing is *throwing information forward* to be used at some point in the future.

### To summarise, here are some basic rules about callbacks:
1. A function that accepts a callback will expect to receive that callback *in a specific format*.  This is the initial function will (probably) pass data to that callback.
2. If you are using a library or framework (like jQuery or Express.js), it's *up to you* to understand how the functions you are using expect the callbacks to be formatted.  The best way to learn this is through experience, and to read the documentation.
3. Remember that a callback can be an anonymous function.
4. Don't expect your callbacks to `return` data.
5. Callbacks can get confusing quickly.  Just keep reminding yourself that even though it's called a `callback`, what it's actually doing is *passing information forward*.

### Your Assignment

2. Read [Understanding Callback Functions in JS from JSIS](http://javascriptissexy.com/understand-javascript-callback-functions-and-use-them/)
1. Browse [Understanding Callback Functions in Javascript by Recurial](http://recurial.com/programming/understanding-callback-functions-in-javascript/) to fill in any gaps.
2. Read [Callbacks, Listeners and Promises](http://sporto.github.com/blog/2012/12/09/callbacks-listeners-promises/) to understand more about the use cases for callbacks.

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [CallbackHell.com's primer on callbacks](http://callbackhell.com/)
* [Using Deferred Functions and Promises (Video)](http://www.youtube.com/watch?v=juRtEEsHI9E)
* [Very clear callback introduction](https://github.com/maxogden/art-of-node#callbacks)
