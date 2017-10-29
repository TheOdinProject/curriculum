### Introduction

This lesson gets more into the topics you may have been shaky on before like *Control Flow, Looping, Arrays, Hashes, Blocks, Sorting*.  It's definitely got some more meat to it than the previous one.  The projects in the Assignment section are good for doing on your own because Codecademy gives you all kinds of help with them.  

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

#### Conditionals and Flow Control:
* What is a "boolean"?
* What are "truthy" values?
* Are `nil`, `0`, `"0"`, `""`, `1`, `[]`, `{}` and `-1` considered true or false?
* When do you use `elsif`?
* When do you use `unless`?
* What does `<=>` do?
* Why might you define your own `<=>` method?
* What do `||` and `&&` and `!` do?
* What is returned by `puts("woah") || true`?
* What is `||=`?
* What is the ternary operator?
* When should you use a `case` statement?

#### Iteration:
* What does `loop` do?
* What are the two ways to denote a block of code?
* What is an index variable?
* How do you print out each item of a simple array `[1,3,5,7]` with:
  * `loop`?
  * `while`?
  * `for`?
  * `#each`?
  * `#times`?
* What's the difference between `while` and `until`?
* How do you stop a loop?
* How do you skip to the next iteration of a loop?
* How would you start the loop over again?
* What are the (basic) differences between situations when you would use `while` vs `#times` vs `#each`?
* What does nesting loops mean and when would you use it?

#### Blocks, Procs, and Lambdas:
* How is a block like a function?
* How is a block different from a function?
* What are the two ways to declare a block?
* How do you return data from a block?
* What happens if you include a `return` statement in a block?
* Why would you use a block instead of just creating a method?
* What does `yield` do?
* How do you pass arguments to a block from within a method?
* How do you check whether a block was actually passed in?
* What is a proc?
* What's the difference between a proc and a block?
* When would you use a proc instead of a block?
* What is a closure?
* What is a lambda?
* What's different between a lambda and a proc?
* What is a Method (capital "M")?
* What do Methods basically allow you to do that could probably be pretty interesting when you're writing some more advanced programs later on?

#### Enumerable and Modules:
* What is a module?
* Why are modules useful?
* What does `#each` do?
* What does `#each` return?
* What does `#map` do?
* What does `#map` return?
* What is the difference between `#map` and `#collect`?
* What does `#select` do?
* What does `#select` return?
* What is the difference between `#each` `#map` and `#select`?
* What does `#inject` do?
* When might you use `#inject`?
* How do you check if every item in a hash fulfills a certain criteria?
* What about if none of the elements fulfill that criteria?
* What (basically) is an `enumerator`?

#### Writing Methods:
* How many things should a method ideally do?
* What types of things should a method modify?
* What should you name a method?
* What does `self` mean?
* What do you need to do to create your own Ruby script file?
* How would you run a Ruby script from the command line?
* How can you check whether your script was being run from the command line?
* What is a shebang line?
* What does `require` do?
* What does `load` do?
* What is the difference between `require` and `load`?
* How do you access any parameters that were passed to your script file from the command line?
* What does `#send` do?
* When would `#send` be used that's different from just running the method on an object 'normally'?

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Do the [Codecademy Ruby sections 2-8](https://www.codecademy.com/learn/learn-ruby), including:
      1. Control Flow in Ruby
      2. Project: Thith Meanth War!
      2. Looping with Ruby
      3. Project: Redacted!
      3. Arrays and Hashes
      4. Blocks and Sorting
      4. Project: Ordering your Library
      5. Hashes and Symbols
      6. Project: A Night at the Movies
      7. The Zen of Ruby
      8. The Refactor Factory
      9. Blocks, Procs, and Lambdas
  2. Finish [Beginning Ruby](https://www.amazon.co.uk/Beginning-Ruby-Professional-Peter-Cooper/dp/1484212797) Chapter 3: `Ruby's Building Blocks: Data, Expressions, and Flow Control` (pages 47-71)
  3. For a look at underserved concepts and help with the questions above, check out these posts by Erik Trautman:
      1. [Ruby Explained: Conditionals and Flow Control](http://www.eriktrautman.com/posts/ruby-explained-conditionals-and-flow-control)
      2. [Ruby Explained: Iteration](http://www.eriktrautman.com/posts/ruby-explained-iteration)
      3. [Ruby Explained: Blocks, Procs, and Lambdas, aka "Closures"](http://www.eriktrautman.com/posts/ruby-explained-blocks-procs-and-lambdas-aka-closures)
      5. [Ruby Explained: Map, Select, and Other Enumerable Methods](http://www.eriktrautman.com/posts/ruby-explained-map-select-and-other-enumerable-methods)
      6. [Ruby Explained: Writing and Running Methods](http://www.eriktrautman.com/posts/ruby-explained-writing-and-running-methods)
</div>

### Test Yourself

Make sure you can do the following quizzes from [Code Quizzes](http://www.codequizzes.com/).  They're pretty quick and should give you an idea of what you still need to brush up on.

<div class="lesson-content__panel" markdown="1">
  1. [Beginner Ruby Quiz #2](http://www.codequizzes.com/ruby/beginner/arrays-conditionals-loops)
  2. [Quiz #3](http://www.codequizzes.com/ruby/beginner/variable-scope-methods)
  3. [Quiz #4](http://www.codequizzes.com/ruby/beginner/symbols-array-methods-hashes)
  4. [Quiz #6](http://www.codequizzes.com/ruby/beginner/iteration-nested-data-structures)
  5. Make sure you go back up and look at all the questions from the "Points to Ponder" section. See if you can do most of them without looking back through the text.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Still unsure about Enumerable?  Check out the [Enumerable Chapter of the Bastard's Book](http://ruby.bastardsbook.com/chapters/enumerables/)
* Github Gist on [Truthiness](https://gist.github.com/jfarmer/2647362)
* See [these answers on the Spaceship Operator](http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator)
* Read [Zetcode's Flow Control section](http://zetcode.com/lang/rubytutorial/flowcontrol/) for more depth on flow control.
* If you want a bit more, check out [Skork's entry on Ruby looping and iterators](http://www.skorks.com/2009/09/a-wealth-of-ruby-loops-and-iterators/)
* [Why can you either `yield` to blocks or make them explicit?  Who cares? (from SO)](http://stackoverflow.com/questions/1410160/ruby-proccall-vs-yield)
* [Writing your Own Methods](http://rubylearning.com/satishtalim/writing_own_ruby_methods.html)
* A quick guide on writing methods from [wikibooks](http://en.wikibooks.org/wiki/Ruby_Programming/Writing_methods)
* [Getting to Hello World](http://en.wikibooks.org/wiki/Ruby_Programming/Hello_world)
* [LRTHW chapters 13-14](http://ruby.learncodethehardway.org/book/)
* Want to get some feedback on your code? Try problems and submit your solutions on [Exercism](http://exercism.io/languages/ruby)
