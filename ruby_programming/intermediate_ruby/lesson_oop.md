### Introduction

You've got the building blocks of Ruby out of the way, great! Now it's time to get into the fun stuff... how do we combine those building blocks in the most efficient and elegant ways to produce the programs we'd like to write?

The concepts you'll learn here are often less specific to Ruby itself and more widely applicable to any object-oriented language.  That's because the fundamental concepts are just that... fundamental.  Don't repeat yourself.  Modularize your code.  Have your classes and methods only do one thing.  Show as little of your interfaces to the world as you can.  Don't make methods or classes heavily dependent on each other.  Be lazy.  These will take some time and practice to implement effectively, but you'll already be taking a big step towards creating high quality code just by finishing up this section.

There's a lot to do here but stick with it!  We'll start with the Codecademy lessons, which are interspersed with their projects so you'll get a chance to apply what you're learning.  The Launch School's OOP book will help you understand the material a bit deeper, which will be important when you start creating your own projects.


### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

#### Classes and Methods:
  * What is an implicit return?
  * What is a class?
  * When should you use a class?
  * How do you create a class in your script file?
  * What is an instance of a class?
  * What is the difference between the Pascal Case and snake_case styles of naming?
  * How do you instantiate a class?
  * How do you set the state of your new instance?
  * What should be done in the `#initialize` method?
  * What is a class method?
  * How is a class method different from an instance method?
  * How are methods you already know like `#count` or `#sort` etc instance methods?
  * What's the difference between how you declare a class method vs an instance method?
  * What's the difference between how you call a class method vs an instance method?
  * What is an instance variable?
  * What's the difference between an instance variable and a 'regular' variable?
  * What are "getter" and "setter" methods used for?
  * What is the difference between a "getter" and a "setter" method?
  * How do you make instance variables readable outside your class?  Writeable? Both at the same time?
  * Can a class call its own class methods?
  * What's the difference between when you would use a class variable and when you would use a constant?
  * What's the difference between a class and a module?
  * When would you use a class but not a module?
  * How does inheritance work?
  * Why is inheritance really useful?
  * How do you extend a class?  What does that mean?
  * What does `#super` do?  Why use it?

#### Scope:
  * What is scope?
  * When can you start using a variable?
  * When is a new scope defined?
  * When are methods in scope?
  * What is a private method?
  * What is a protected method?
  * How are private and protected methods different?
  * What does "encapsulation" mean?

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Do [Codecademy Ruby sections 9 and 10](https://www.codecademy.com/learn/learn-ruby):
      1. Object-Oriented Programming, Part I
      2. Project: Virtual Computer
      3. Object-Oriented Programming, Part II
      4. Project: Banking on Ruby
  2. Take a brief break from code and learn more about the world of Ruby:
      1. Read about the [History of Ruby](https://www.sitepoint.com/history-ruby/)
      2. Read about [Open Source Culture](https://opensource.guide/how-to-contribute/#why-contribute-to-open-source) in Section 1
      3. Read about where you can find [Ruby's Community](https://www.ruby-lang.org/en/community/)
  3. Read through [Launch School's OOP book](https://launchschool.com/books/oo_ruby/read/introduction) for a more thorough understanding.
  4. Read through these reinforcing posts by Erik Trautman to help you answer the questions in the "Learning Outcomes" section:
      1. [Ruby Explained: Classes](http://www.eriktrautman.com/posts/ruby-explained-classes)
      2. [Ruby Explained: Inheritance and Scope](http://www.eriktrautman.com/posts/ruby-explained-inheritance-and-scope)
  5. Read the article [Object Relationships in Basic Ruby](https://medium.com/@marcellamaki/object-relationships-in-basic-ruby-1af5773fff48) to see an example of how two classes can interact.
  6. Read the [Bastard's Chapter on Error Handling](http://ruby.bastardsbook.com/chapters/exception-handling/) to reinforce your understanding of dealing with errors.
  7. Glance over the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) so you have an idea of how to make your code look more professional. It is recommended to install [rubocop](https://docs.rubocop.org/rubocop/installation.html), a static code analyzer (linter) and formatter, which is based on this style guide. 
      1. Read the [basic usage](https://docs.rubocop.org/rubocop/usage/basic_usage.html) of rubocop in the terminal. 
      2. Your code editor may have extensions that will utilize rubocop. For example, VSCode has two extensions: 'VSCode Ruby' and 'Ruby'. The 'Ruby' extension allows a rubocop dropdown option for a setting called, Ruby: Format.
      3. As you begin to use rubocop, you will be inundated with multiple offenses that seem minor. At this point in your Ruby knowledge, make the recommended adjustments and trust the wisdom of the Ruby community that developed this style guide. Research the offenses that you do not understand. If you feel strongly that you should ignore a particular rule, you can research ways to disable a particular rule or even ignore an entire file.
      4. Please note: If you followed the above installations and the rubocop linter of your Ruby extension is still not highlighting offenses within VSCode, you may alternately try the ruby-rubocop extension. This extension lists potential problems if using a rvm or chruby environment and should only be used if you installed Ruby with rbenv as instructed in the Installing Ruby lesson. The ruby-rubocop extension also states that when autoCorrect is enabled, the history of changing file is broken.
</div>

### Test Yourself

<div class="lesson-content__panel" markdown="1">

  1. Make sure you can do [Quiz #5](http://www.codequizzes.com/ruby/beginner/intro-object-oriented-programming) from [Code Quizzes](http://www.codequizzes.com).
  2. Make sure you can do [Quiz #7](http://www.codequizzes.com/ruby/beginner/modules-classes-inheritance) as well.
  3. Make sure you go back up and look at all the questions from the "Learning Outcomes" section. See if you can do most of them without looking back through the text.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* If you'd still like to learn more about how to really design more concise, effective, purposeful classes, check out [Practical Object-Oriented Design in Ruby](https://amzn.com/B0096BYG7C) by Sandi Metz.
* [This video presentation from Kevin Berridge](http://vimeo.com/91672848) covers major themes of practical object-oriented design, with many references to Sandi Metz's book, in about 40 minutes.
* [Zetcode's Variables section](http://zetcode.com/lang/rubytutorial/variables/).
* Now you're ready to read through [Zetcode's OOP section](http://zetcode.com/lang/rubytutorial/oop/).
* Read through [Zetcode's second OOP section](http://zetcode.com/lang/rubytutorial/oop2/) until they start talking about exceptions (~80% of the way down).

