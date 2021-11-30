### Introduction

You've got the building blocks of Ruby out of the way, great! Now it's time to get into the fun stuff... how do we combine those building blocks in the most efficient and elegant ways to produce the programs we'd like to write?

The concepts you'll learn here are often less specific to Ruby itself and more widely applicable to any object-oriented language.  That's because the fundamental concepts are just that... fundamental.  Don't repeat yourself.  Modularize your code.  Have your classes and methods only do one thing.  Show as little of your interfaces to the world as you can.  Don't make methods or classes heavily dependent on each other.  Be lazy.  These will take some time and practice to implement effectively, but you'll already be taking a big step towards creating high quality code just by finishing up this section.

There's a lot to do here but stick with it!  We'll start with the Codecademy lessons, which are interspersed with their projects so you'll get a chance to apply what you're learning.  The Launch School's OOP book will help you understand the material a bit deeper, which will be important when you start creating your own projects.


### Learning Outcomes

- You will learn about classes.
- You will learn about Methods.
- You will learn about scope.

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
  7. Do [Quiz #5](http://www.codequizzes.com/ruby/beginner/intro-object-oriented-programming) from [Code Quizzes](http://www.codequizzes.com).
  8. Do [Quiz #7](http://www.codequizzes.com/ruby/beginner/modules-classes-inheritance) as well.
  9. Glance over the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) so you have an idea of how to make your code look more professional. It is recommended to install [rubocop](https://docs.rubocop.org/rubocop/installation.html), a static code analyzer (linter) and formatter, which is based on this style guide. 
      1. Read the [basic usage](https://docs.rubocop.org/rubocop/usage/basic_usage.html) of rubocop in the terminal. 
      2. To highlight the rubocop offenses in VSCode, you will need to have the 'Ruby' extension installed. In addition, you will need to update your settings.json file with the following lines:


~~~bash
"ruby.lint": {
  "rubocop": true,
},
~~~

**If the above instructions do not work**, explore the initial configuration options in the extension's [documentation](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby). Another alternative is to try the [ruby-rubocop](https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop) extension, but be aware of the potential problems listed in their documentation.

As you begin to use rubocop, you will be inundated with multiple offenses that seem minor. At this point in your Ruby knowledge, make the recommended adjustments and trust the wisdom of the Ruby community that developed this style guide. Research the offenses that you do not understand. If you feel strongly that you should ignore a particular rule, you can research ways to disable a particular rule or even ignore an entire file.

</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* [99 Bottles of OOP](https://sandimetz.com/99bottles), by Sandi Metz, described as "a practical guide to writing cost-effective, maintainable, and pleasing object-oriented code." Available in Ruby and JavaScript (bundled together).
* If you'd still like to learn more about how to really design more concise, effective, purposeful classes, check out [Practical Object-Oriented Design in Ruby](https://www.poodr.com/), also by Sandi Metz.
* [This video presentation from Kevin Berridge](http://vimeo.com/91672848) covers major themes of practical object-oriented design, with many references to Sandi Metz's book, in about 40 minutes.
* [Zetcode's Variables section](http://zetcode.com/lang/rubytutorial/variables/).
* Now you're ready to read through [Zetcode's OOP section](http://zetcode.com/lang/rubytutorial/oop/).
* Read through [Zetcode's second OOP section](http://zetcode.com/lang/rubytutorial/oop2/) until they start talking about exceptions (~80% of the way down).

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="https://launchschool.com/books/oo_ruby/read/the_object_model#classesdefineobjects">What is a class?</a>
- <a class="knowledge-check-link" href="https://www.eriktrautman.com/posts/ruby-explained-classes">What are getters and setters?</a>
- <a class="knowledge-check-link" href="https://www.eriktrautman.com/posts/ruby-explained-classes">What is inheritance?</a>
- <a class="knowledge-check-link" href="https://www.eriktrautman.com/posts/ruby-explained-inheritance-and-scope">What is a scope?</a>
- <a class="knowledge-check-link" href="https://www.eriktrautman.com/posts/ruby-explained-inheritance-and-scope">When is a new scope defined?</a>
- <a class="knowledge-check-link" href="https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#instancevariables">What is the purpose of instance variables?</a>
- <a class="knowledge-check-link" href="https://www.eriktrautman.com/posts/ruby-explained-classes">What is the difference between class variables and instance variables?</a>
