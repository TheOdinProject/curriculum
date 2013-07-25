
## Classes, Modules and Inheritance
### Intro and Goals

When you start solving larger problems organization is key.  You don't want 100 different methods and variables that do overlapping things.  If you're trying to keep track of data (like a bunch of bad guys in a game you're building), you want to do so in the most organized way possible so you can recycle methods and only need to update that data in one place at a time.

Classes are here to make your life easier on that front and you'll learn about how to organize and use them here.  In the process, you'll also need to understand which of their methods get inherited by who and the difference between instances of a class and the class itself.  

You've written a lot of methods so far but they've generally been independent of each other.  When you find that you want the same method to be run on a bunch of different objects without having to make a bunch of different `if/else` or `case` statements, you should start thinking about using a class.

We've got a fair bit of stuff crammed into this section but it gives you superpowers.

### Thought Questions
* What is a class?
* When should you use a class?
* How do you write a class in your script file?
* What is an instance of a class?
* How do you instantiate a class?
* How do you run some code whenever you make a new instance?
* What should be done in the `initialize` method?
* What is a class method?
* How is a class method different from an instance method?
* How are methods you already know like `count` or `sort` etc instance methods?
* What's the difference between how you declare a class method vs an instance method?
* What's the difference between how you call a class method vs an instance method?
* What is an instance variable?
* What's the difference between an instance variable and a 'regular' variable?
* What is a "setter" method?
* How do you write your own setters?
* What is a "getter" method and how do you write one?
* What does `attr_accessor` do?
* Why would you use `attr_accessor`?
* What are two ways of getting an instance variable from an instance of a class?
* Can a class call its own class methods?

TODO: Break out into the Scope section instead.
* How does inheritance work?
* What is a module?
* When should you use a module?
* What is a private method?
* What is a protected method?
* How are private and protected methods different?

### Do These First
1. Codecademy's [Object-Oriented Programming section](http://www.codecademy.com/courses/ruby-beginner-en-MFiQ6)
2. Codecademy's [OOP Project](http://www.codecademy.com/courses/ruby-beginner-en-X5wcR/0/1)
3. Codecademy's [OOP II section](http://www.codecademy.com/courses/ruby-beginner-en-zfe3o)
4. Codecademy's [OOP II Project](http://www.codecademy.com/courses/ruby-beginner-en-32cN3/0/1)
5. Now you're ready to read through [Zetcode's OOP section](http://zetcode.com/lang/rubytutorial/oop/), though only go until they start talking about Inheritance (about 3/4 of the way down).
6. Read through [Zetcode's second OOP section](http://zetcode.com/lang/rubytutorial/oop2/) until they start talking about exceptions (~80% of the way down)

### A Brief Summary
### Exercises
### Additional Resources
* [Zetcode on Objects](http://zetcode.com/lang/rubytutorial/objects/)
* 