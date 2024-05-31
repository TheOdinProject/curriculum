### Introduction

You've got the building blocks of Ruby out of the way, great! Now it's time to get into the fun stuff... how do we combine those building blocks in the most efficient and elegant ways to produce the programs we'd like to write?

The concepts you'll learn here are often less specific to Ruby itself and more widely applicable to any object-oriented language. That's because the fundamental concepts are just that... fundamental. Don't repeat yourself. Modularize your code. Have your classes and methods only do one thing. Show as little of your interfaces to the world as you can. Don't make methods or classes heavily dependent on each other. These will take some time and practice to implement effectively, but you'll already be taking a big step towards creating high quality code just by finishing up this section.

There are two projects in this Object Oriented Programming Basics section, but this does not mean that you will only use OOP for these two projects. Ruby is a object-oriented language, so it is important to use OOP for all of the remaining projects.

There is a lot of reading in this lesson, so you are encouraged to code along with each example. If you find an example that does not make sense, ask for help in the `#ruby-help` channel in our [Discord](https://discord.gg/fbFCkYabZB) server. To get the most out of each example, try to apply what you learned by adding similar functionality on your own.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You will learn about classes.
- You will learn about methods.
- You will learn about scope.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read the [Object Oriented Programming with Ruby](https://launchschool.com/books/oo_ruby) online book, by Launch School.
1. Read through these reinforcing posts by Erik Trautman to help you answer the questions in the "Learning Outcomes" section:
    - [Ruby Explained: Classes](http://www.eriktrautman.com/posts/ruby-explained-classes)
    - [Ruby Explained: Inheritance and Scope](http://www.eriktrautman.com/posts/ruby-explained-inheritance-and-scope)
1. Read the article [Object Relationships in Basic Ruby](https://medium.com/@marcellamaki/object-relationships-in-basic-ruby-1af5773fff48) to see an example of how two classes can interact.
1. Read the [Bastard's Chapter on Error Handling](http://ruby.bastardsbook.com/chapters/exception-handling/) to reinforce your understanding of dealing with errors.
1. Do [Quiz #5](http://www.codequizzes.com/ruby/beginner/intro-object-oriented-programming) and [Quiz #7](http://www.codequizzes.com/ruby/beginner/modules-classes-inheritance) from Code Quizzes

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is a class?](https://launchschool.com/books/oo_ruby/read/the_object_model#classesdefineobjects)
- [What are getters and setters?](https://www.eriktrautman.com/posts/ruby-explained-classes)
- [What is inheritance?](https://www.eriktrautman.com/posts/ruby-explained-classes)
- [What is a scope?](https://www.eriktrautman.com/posts/ruby-explained-inheritance-and-scope)
- [When is a new scope defined?](https://www.eriktrautman.com/posts/ruby-explained-inheritance-and-scope)
- [What is the purpose of instance variables?](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#instancevariables)
- [What is the difference between class variables and instance variables?](https://www.eriktrautman.com/posts/ruby-explained-classes)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Kevin Berridge's video presentation](http://vimeo.com/91672848) covers major themes of practical object-oriented design, with many references to Sandi Metz's book, in about 40 minutes.
- If you need a variable refresher, check out [Zetcode's Variables section](https://zetcode.com/lang/rubytutorial/variables/).
- If you want more examples to code along with, check out [Zetcode's OOP section](http://zetcode.com/lang/rubytutorial/oop/) and [Zetcode's second OOP section](https://zetcode.com/lang/rubytutorial/oop2/) until they start talking about exceptions (~80% of the way down).
- After you have completed several OOP projects, the following books by Sandi Metz are essential to build on the foundational concepts in this lesson.
  - [99 Bottles of OOP](https://sandimetz.com/99bottles) is a hands-on workbook that you should code along with to get the most out of it. This is a great resource if you feel uncertain about OOP concepts and would like to guided through refactoring examples and explanations.
  - [Practical Object-Oriented Design in Ruby](https://www.poodr.com/) is a traditional technical book with practical examples. This is a great resource after 99 Bottles or if you already feel like you fully understand OOP concepts.
