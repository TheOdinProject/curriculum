### Introduction

JavaScript does *not* have classes in the same sense as other Object Oriented languages like Java or Ruby. ES6, however, *did* introduce a syntax for object creation that uses the `class` keyword. It is basically a new syntax that does the *exact* same thing as the object constructors and prototypes we learned about in the constructor lesson.

There is a bit of controversy about using the class syntax, however. Opponents argue that `class` is basically just *syntactic sugar* over the existing prototype-based constructors and that it's dangerous and/or misleading to obscure what's *really* going on with these objects. Despite the controversy, classes are beginning to crop up in real code bases that you are almost certainly going to encounter such as frameworks like React (especially if you end up working with class-based React code).

Since we've already gone fairly in-depth with Constructors, you don't have too much left to learn here beyond the new syntax. If you choose to use classes in your code (that's fine!) you can use them much the same way as object constructors.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe the pros and cons of using classes in JavaScript.
- Briefly discuss how JavaScript's object creation differs from a language like Java or Ruby.
- Explain the differences between an object constructor and a class.
- Explain what "getters" and "setters" are.
- Understand what computed names and class fields are.
- Explain how to implement private class fields and methods.
- Describe function binding.
- Use inheritance with classes.
- Understand why composition is generally preferred to inheritance.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [JavaScript.info's article on Getters and Setters](https://javascript.info/property-accessors) should get you up to speed on "Getters and Setters".

1. [JavasSript.info's primer on class syntax](https://javascript.info/class) is probably just about all you need to start using `class` syntax confidently.

1. [MDN's docs on classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes) are, as usual, a great resource for going a little deeper. Look especially at the ['extends' reference page](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/extends), including the ['Mixins' section](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/extends#mix-ins). In some frameworks like React, you can use classes to create your components and make them `extend` the core React component which gives you access to all their built-in functionality (though this is not the only way to create components. This will all be covered later in React section of the course). Classes can also have [private class properties](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/Private_class_fields) that allow you to implement privacy similarly to factory functions.

1. Classes can have [static properties and methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/static) which are properties and methods that are accessed on the class itself and not on the instance of a class. This is similar to how some string methods are accessed on the instance of a string itself e.g. `someString.slice(0, 5)` whereas some methods are called on the String constructor directly e.g. `String.fromCharCode(79, 100, 105, 110)`.

1. Read this article covering [opinions regarding the pros and cons of classes](https://medium.com/@rajaraodv/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65). [FunFunFunction's video on Composition over Inheritance](https://www.youtube.com/watch?v=wfMtDGfHWpA) elaborates on the cons mentioned in the article and does a great job of going over the topic.

</div>

#### Practice

Go back to your [Library project](https://www.theodinproject.com/lessons/node-path-javascript-library) project and refactor it to use `class` instead of plain constructors.  Don't forget to use the git branch workflow you learned in [Revisiting Rock Paper Scissors](https://www.theodinproject.com/lessons/foundations-revisiting-rock-paper-scissors) to work on a new feature. You should get used to working like this!

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Describe the pros and cons of using classes in JavaScript.](https://rajaraodv.medium.com/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65)
- [How does JavaScript's object creation differ from a language like Java or Ruby?](https://rajaraodv.medium.com/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65)
- [Explain the differences between object constructors and classes.](https://javascript.info/class#not-just-a-syntactic-sugar)
- [What are "getters" & "setters"?](https://javascript.info/property-accessors)
- [Describe computed names and class fields.](https://javascript.info/class)
- [Describe function binding.](https://javascript.info/class)
- [Describe static properties.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/static)
- [Describe private class features.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/Private_class_fields)
- [How is inheritance used with classes?](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes#inheritance)
- [Why is favoring Composition over Inheritance suggested?](https://www.youtube.com/watch?v=wfMtDGfHWpA)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Stephen Mayeux has a [Youtube playlist on ES6 classes](https://www.youtube.com/playlist?list=PLtwj5TTsiP7uTKfTQbcmb59mWXosLP_7S) and some of their methods with easy to follow examples.

- Here are some more examples that try to illustrate the [benefits of composition over inheritance](https://blog.beezwax.net/composition-over-inheritance-with-javascript-examples).
