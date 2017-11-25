# Classes

JavaScript does _not_ have classes in the same sense as other Object Oriented languages like Java or Ruby.  ES6, however, _did_ introduce a syntax for object creation that uses the `class` keyword.  It is basically a new syntax that does the _exact_ same thing as the object constructors and prototypes we learned about in the constructor lesson.

There is a little bit of controversy about using the class syntax however.  Opponents argue that `class` is basically just _syntactic sugar_ over the existing prototype-based constructors and that it's dangerous and/or misleading to obscure what's _really_ going on with these objects.  Despite the controversy, classes are beginning to crop up in real codebases that you are almost certainly going to encounter such as frameworks like React.

Since we've already gone fairly in depth with Constructors you don't have too much left to learn here beyond the new syntax.  If you choose to use classes in your code (that's fine!) you can use them much the same way as object constructors.

## Your Assignment

1. Browse [this git repo](https://github.com/joshburgess/not-awesome-es6-classes) for the arguments _against_ using classes. The 'TL;DR' section is probably enough unless you really feel like diving down the rabbit-hole.  __WE__ are not saying that classes are bad! We just wanted to point out that many people do.  Those people generally recommend patterns like the Factory Functions we learned about in the previous lesson.  [This article](https://medium.com/@rajaraodv/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65) is a little more "bipartisan".
2. [This article](https://javascript.info/class) is probably just about all you need to start using `class` syntax confidently.  "Getters and Setters" are a useful feature!
3. [The MDN docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes) are, as usual, a great resource for going a little deeper.  Look especially at the 'extends' and 'Mixins' sections.  React (and other frameworks) uses classes in this way. You create your components and make them `extend` the core React component which gives you access to all their built-in functionality.

## Project

Go back to your "Library" example and refactor it to use `class` instead of plain constructors.

