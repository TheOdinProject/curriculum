### Introduction

JavaScript does _not_ have classes in the same sense as other Object Oriented languages like Java or Ruby. ES6, however, _did_ introduce a syntax for object creation that uses the `class` keyword. It is basically a new syntax that does the _exact_ same thing as the object constructors and prototypes we learned about in the constructor lesson.

There is a bit of controversy about using the class syntax, however. Opponents argue that `class` is basically just _syntactic sugar_ over the existing prototype-based constructors and that it's dangerous and/or misleading to obscure what's _really_ going on with these objects. Despite the controversy, classes are beginning to crop up in real code bases that you are almost certainly going to encounter such as frameworks like React.

Since we've already gone fairly in-depth with Constructors, you don't have too much left to learn here beyond the new syntax. If you choose to use classes in your code (that's fine!) you can use them much the same way as object constructors.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe the pros and cons of using classes in JavaScript.
- Briefly discuss how JavaScript's object creation differs from a language like Java or Ruby.
- Explain the differences between an object constructor and a class.
- Explain what "getters" and "setters" are.
- Understand what computed names and class fields are.
- Describe function binding.
- Use inheritance with classes.
- Understand why composition is generally preferred to inheritance.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  [JavaScript.info's article on Getters and Setters](https://javascript.info/property-accessors) should get you up to 
    speed on "Getters and Setters".
    
2.  [This article](https://javascript.info/class) is probably just about all you need to start using `class` syntax 
    confidently.

3.  [The MDN docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes) are, as usual, a great
    resource for going a little deeper. Look especially at the ['extends' reference page](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/extends),
    including the ['Mixins' section](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/extends#mix-ins).
    React (and other frameworks) uses classes in this way. You create your components and make them `extend` the core
    React component which gives you access to all their built-in functionality.

4.  [This article](https://medium.com/@rajaraodv/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65) provides some 
    pros and cons for classes. [FunFunFunction's video on Composition over Inheritance](https://www.youtube.com/watch?v=wfMtDGfHWpA)
    elaborates on the cons mentioned in the article and does 
    a great job of going over the topic. Many people think that class syntax is misleading for JavaScript and 
    Inheritance is best avoided, and thus Factory Functions (from the previous lesson) that use Composition are 
    inherently better. __WE__ are not saying that classes are bad or that Inheritance should never be used! We just 
    want you to be informed of the opinions of both sides.
</div>

### Practice

Go back to your "Library" example and refactor it to use `class` instead of plain constructors.  Don't forget to use the git workflow you learned in [this foundations lesson](https://www.theodinproject.com/lessons/foundations-revisiting-rock-paper-scissors) to work on a new feature. You should get used to working like this!

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [Describe the pros and cons of using classes in JavaScript.](https://rajaraodv.medium.com/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65)
- [How does JavaScript's object creation differ from a language like Java or Ruby?](https://rajaraodv.medium.com/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65)
- [Explain the differences between object constructors and classes.](https://javascript.info/class#not-just-a-syntactic-sugar)
- [What are "getters" & "setters"?](https://javascript.info/property-accessors)
- [Describe computed names and class fields.](https://javascript.info/class)
- [Describe function binding.](https://javascript.info/class)
- [Describe static properties.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
- [How is inheritance used with classes?](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes#inheritance)
- [Why is favoring Composition over Inheritance suggested?](https://www.youtube.com/watch?v=wfMtDGfHWpA)

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [This playlist](https://www.youtube.com/playlist?list=PLtwj5TTsiP7uTKfTQbcmb59mWXosLP_7S) from Stephen Mayeux, explains ES6 Classes and some of their methods with easy to follow examples.
