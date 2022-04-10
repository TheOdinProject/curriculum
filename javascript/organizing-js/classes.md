### Introduction
JavaScript does _not_ have classes in the same sense as other Object Oriented languages like Java or Ruby. ES6, however, _did_ introduce a syntax for object creation that uses the `class` keyword. It is basically a new syntax that does the _exact_ same thing as the object constructors and prototypes we learned about in the constructor lesson.

There is a bit of controversy about using the class syntax, however. Opponents argue that `class` is basically just _syntactic sugar_ over the existing prototype-based constructors and that it's dangerous and/or misleading to obscure what's _really_ going on with these objects. Despite the controversy, classes are beginning to crop up in real code bases that you are almost certainly going to encounter such as frameworks like React.

Since we've already gone fairly in-depth with Constructors, you don't have too much left to learn here beyond the new syntax. If you choose to use classes in your code (that's fine!) you can use them much the same way as object constructors.

### Learning Outcomes
After this lesson and completing the assignments, you will be able to:

- Describe the pros and cons of using classes in JavaScript.
- Briefly discuss how JavaScript's object creation differs from a language like Java or Ruby.
- Explain the differences between using a class to define a constructor and other prototype methods.
- Explain what "getters" & "setters" are.
- Understand what computed names and class fields are.
- Describe function binding.
- Be able to use inheritance with classes.
- Briefly talk about the conflict in JS with functional programming and classes.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. [This article](https://javascript.info/class) is probably just about all you need to start using `class` syntax confidently. "Getters and Setters" are a useful feature!
2. [The MDN docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes) are, as usual, a great resource for going a little deeper. Look especially at the 'extends' and 'Mixins' sections. React (and other frameworks) uses classes in this way. You create your components and make them `extend` the core React component which gives you access to all their built-in functionality.
3. [This article](https://medium.com/@rajaraodv/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65) provides some pros and cons for classes.  There are many people who think that class syntax is misleading for Javascript, and thus Factory Functions (from the previous lesson) are inherently better. __WE__ are not saying that classes are bad!  We just want you to be informed on the opinions of both sides.
</div>

### Practice

Go back to your "Library" example and refactor it to use `class` instead of plain constructors.  Don't forget to use the git workflow you learned in [this foundations lesson](https://www.theodinproject.com/lessons/foundations-revisiting-rock-paper-scissors) to work on a new feature. You should get used to working like this!

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* [This playlist](https://www.youtube.com/playlist?list=PLtwj5TTsiP7uTKfTQbcmb59mWXosLP_7S) from Stephen Mayeux, explains ES6 Classes and some of their methods with easy to follow examples.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* <a class="knowledge-check-link" href="https://rajaraodv.medium.com/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65">Describe the pros and cons of using classes in JavaScript.</a>
* <a class="knowledge-check-link" href="https://rajaraodv.medium.com/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65">Briefly discuss how JavaScript's object creation differs from a language like Java or Ruby.
</a>
* <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes">Explain the differences between using a class to define a constructor and other prototype methods.
</a>
* <a class="knowledge-check-link" href="https://javascript.info/class">Explain what "getters" & "setters" are.</a>
* <a class="knowledge-check-link" href="https://javascript.info/class">Understand what computed names and class fields are.</a>
* <a class="knowledge-check-link" href="https://javascript.info/class">Describe function binding.</a>
* <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes">Be able to use inheritance with classes.</a>
* <a class="knowledge-check-link" href="https://rajaraodv.medium.com/is-class-in-es6-the-new-bad-part-6c4e6fe1ee65">Briefly talk about the conflict in JS with functional programming and classes.</a>
