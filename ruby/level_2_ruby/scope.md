## Scope and Privacy
### Intro and Goals

You're able to break up your code into methods and classes but you'll also need to think more explicitly about which variables and methods are accessible where.  We started talking about that concept a little bit in the section on classes, which dealt with the differences between class methods/variables versus instance methods/variables and the idea of inheriting the methods of a parent class.  Here, you should take that general understanding and build on it further.

In a similar vein, you'll also learn more about how you can shield certain methods from being usable from outside of a class.  You started learning about that idea when we used `attr_accessor` to make instance variables "visible" from outside your instance, but we'll dive deeper here and give you more tools to very explicitly decide what you do and don't want to show to the world.


### Thought Questions
* What is scope?
* When can you start using a variable?
* When is a new scope defined?
* When are methods in scope?
* What is a private method?
* What is a protected method?
* How are private and protected methods different?
* What does "encapsulation" mean?

* 
* What is a module?
* When should you use a module?
* What's the difference between a class and a module? (instantiation!)
* Pass-by-reference


### Do These First
* [Zetcode's Variables section](http://zetcode.com/lang/rubytutorial/variables/)
* Finish [Zetcode's OOP Section](http://zetcode.com/lang/rubytutorial/oop/), reading from "Inheritance" onwards (starts about 3/4 of the way down)


### A Brief Summary

**Scope** is the formal term that represents when you can access a variable or method and when you can't.  It's nothing explicit in the code (you're never calling a method called `scope` or anything like that), just an idea.  If your variable is "in scope" then it's available for use, otherwise it's "out of scope".  

Think of it like a container of one-way glass around certain chunks of code.  Inside that container, your variable or method can see (or use) anything in the world outside the container but the outside world can't see in.

A new scope is created when you first define a variable.  That variable is then accessible by anything "downstream" of it in the code, until the current scope is exited (by leaving a method or loop, for instance):

    def launch_longships
        color = red

A good rule of thumb for scope is that you create a new scope any time you should indent your code and any time within that indent a new variable is defined.

Method scope


### Exercises
### Additional Resources
