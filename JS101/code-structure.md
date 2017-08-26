The way you structure, organize and lay out your code can make a big difference.  Code that is hard to read, or hard to follow is also hard to work on and maintain. If you're working with other people, the importance of clean readable code is even _more_ important.

Consider the following 2 snippets of JavaScript:

An ugly one:
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

and a nicer one:
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

Believe it or not, both of those functions do the exact same thing (in the exact same way even), and both of them are perfectly valid code, but obviously the second one is much easier to follow.  Imagine you're working on a project with someone else and they've written the first function... how long is it going to take you to figure out what's going on there so you can do your work?  Imagine you're working on a project all by yourself and YOU wrote the first function a week or two ago... chances are good that you aren't going to remember exactly what you were up to there and it's _still_ going to take you a good while to figure it all out again.

The second one, however, is much easier to follow.  Even if you don't know exactly what everything in the code is doing, things are named clearly enough that you could guess, and the indentation is consistent enough that it's easy to parse the different parts of the function.

## Clean Code

There are many different opinions on what constitutes great JavaScript code.  The most important thing is just that you're consistent.  The war between coders that use tabs and coders that use spaces to indent their code is so engrained that [it's essentially a joke by now](https://www.youtube.com/watch?v=SsoOG6ZeyUI), but it doesn't _really_ matter as long as you're consistent.

One of the more important aspects of writing nice legible code is the way you name things.  Selecting names that accurately describe what the code is doing can go a long way to making your code readable.. in fact, one of the main differences between the two functions above is the presence of logical names over single character names for the various variables.

A lot of this stuff you will pick up on as you go and see more and more code... but it's good to be aware of some of the bigger issues up front.

## Your Assignment

Read through these articles that discuss a few elements of writing good clean code.
1. [This article about self-documenting JavaScript](https://www.sitepoint.com/self-documenting-javascript/). (It's not as crazy as it sounds)
2. [This list of clean-code tips](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/).
3. [This article](https://blog.codinghorror.com/coding-without-comments/), [and this one too](https://blog.codinghorror.com/code-tells-you-how-comments-tell-you-why/) about the role of comments in your code. 