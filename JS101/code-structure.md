# Writing Readable Code

Developers spend SO MUCH more time reading code than writing it.  This is true even with your own code.  As a favor to yourself and whoever will need to use, maintain, or further develop your code, please learn to write readable code.

Consider the following 2 snippets of JavaScript:  
ugly, hard to read code:

```javascript
const x = 
function(z) {
let w = 0;z.forEach(
function(q){
     w += q;
});return w;
};

x([2, 2, 2]);
```

clean and easy to read code:

```javascript
const sumArray = function(array) {
  let sum = 0;
  array.forEach(function(number) {
    sum += number;
  });
  return sum;
};

sumArray([2, 2, 2]);
```

Believe it or not, both of those functions do the exact same thing \(in the exact same way!\), and both of them are perfectly valid code, but obviously the second one is much easier to follow.  Imagine you're working on a project with someone else and they've written the first function... how long is it going to take you to figure out what's going on there so you can do your work?  Imagine you're working on a project all by yourself and YOU wrote the first function a week or two ago... chances are good that you aren't going to remember exactly what you were up to there and it's _still_ going to take you a good while to figure it all out again.

The second one, however, is much easier to follow.  Even if you don't know exactly what everything in the code is doing, things are named clearly enough that you could guess, and the indentation is consistent enough that it's easy to parse the different parts of the function.

There are many different opinions on what constitutes great JavaScript code.  The most important thing is just that you're consistent.  The war between coders that use tabs and coders that use spaces to indent their code is so engrained that [it's essentially a joke by now](https://www.youtube.com/watch?v=SsoOG6ZeyUI), but it doesn't _really_ matter as long as you're consistent.

### Rules of Thumb

Structural:

* Functions should only do ONE thing! Functions should rarely get to more than 10 lines.. and most functions should easily fit in 5-6 lines.  If your functions are regularly stretching longer than that then you should consider trying to break them down into smaller functions.
* Within a single file - organize variables, functions, objects, etc ... in a way that makes sense so you don't have to rescan the whole file all the time.

* Keep your indentation consistent!  In general begin and end opening/closing tags, parentheses or brackets at the same indentation level:

```js
// BAD
function() {
array.forEach(item => {
console.log(item)
})
}

//GOOD
function() {
  array.forEach(item => {
    console.log(item)
  })
}
```

Naming:

* All names of things describe what they do, even if it means having really long names.

  * `validateCreditCardNumber()` is _much_ easier to understand than `validateNumber()` or worse `validate()`
  * this is infinitely easier if your functions actually only do one thing.

* Write helpful error messages

* Decide on and stick to a naming convention. ie. camelCase or under\_scores, var forty\_two = 42, ...

* In general functions DO things. So use verbs to name them.  Variables ARE things. So use nouns.  This rule can be flexible, but can make your code much easier to read if used consistently.

Syntax:

* Use [prettier.js](https://github.com/prettier/prettier) to make your coding style consistent. \(white space, code blocks, functions, ... visually consistent\). There are plugins for it in most major code editors.

  * Phrase things in the most clear way, not the most 'elegant' or short way.  No one will care how brilliant you are when they're 15 minutes in and just starting to understand your code.

# Your Assignment

Read through these articles that discuss a few elements of writing good clean code.

1. [This article about self-documenting JavaScript](https://www.sitepoint.com/self-documenting-javascript/). \(It's not as crazy as it sounds\)  
2. [This list of clean-code tips](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/).
3. [Functions should do ONE thing.](https://sites.google.com/site/unclebobconsultingllc/one-thing-extract-till-you-drop)
4. [This article](https://blog.codinghorror.com/coding-without-comments/), [and this one too](https://blog.codinghorror.com/code-tells-you-how-comments-tell-you-why/) about the role of comments in your code.

## Additional Resources

* [A nice op-ed](https://www.martinfowler.com/bliki/CodeAsDocumentation.html)
* THE complete guide to [self-documenting code](http://wiki.c2.com/?SelfDocumentingCode)
* [Airbnb style guide](https://github.com/airbnb/javascript)  
* [Chaining methods to write sentences](http://javascriptissexy.com/beautiful-javascript-easily-create-chainable-cascading-methods-for-expressiveness/)   



