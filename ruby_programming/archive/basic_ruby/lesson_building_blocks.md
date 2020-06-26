### Introduction

Welcome to Ruby Building Blocks!  Since you've already done a decent chunk of Ruby in [Ruby Basics](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/basic_ruby/ruby_basics_lesson.md), this section will reinforce what you've already learned with *Variables, Data Types, Strings, and Methods*.  

But this lesson will take you much deeper and further than you went before, so don't think you've got a free pass.  There's a whole lot of stuff to cover.  These first couple of lessons cover the broadest swathe of material of the entire Ruby course, so get stretched out and warmed up, it's time to dive in!

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

#### Numbers, Operators and Expressions:
* What's the difference between an `Integer` and a `Float`?
* Why should you be careful when converting back and forth between integers and floats?
* What's the difference between `=`, `==`, and `===`?
* How do you do exponents in Ruby?
* What is a `range`?
* How do you create a range?
* What's the difference between `(1..3)` and `(1...3)`?
* What are three ways to create a range?

#### Strings:
* What's the difference between single and double quotes?
* What is string interpolation?
* What are escape characters?
* What are line breaks?
* How do you make other things into strings?
* How do you concatenate strings?
* How do you access a specific character or substring?
* How do you split up strings into arrays?
* How are strings and arrays similar?
* How do you get and clean up user input on the command line?
* What does it mean that strings are "mutable" and why care?
* What is a symbol?
* How is a symbol different from a string?
* What is a Regular Expression (RegEx)?
* How can you center or right-justify a string?

#### Arrays:
* What are three ways to create an array?
* How do you prepopulate the array with default data?
* How do you access items in an array?
* How can you access a specific group of items in an array?
* How do you modify the items in an array?
* How do you combine arrays?
* How do you find the values in one array that aren't in another?
* How do you find values in both arrays?
* What is the difference between `push`/`pop` and `shift`/`unshift`?
* What is the shovel operator?
* How is `> arr.pop` different from `> arr[-1]`?
* How is `push`ing or `<<`ing another array into your array different from just adding them together?
* How do you delete items in an array?
* Why should you be careful deleting items in an array?
* How can you convert arrays to strings?
* How can you convert from other data types to arrays?
* How can you figure out if an array contains a particular value?
* How do you find the biggest item in an array?
* How do you find the smallest item in an array?
* How do you remove any duplicates from your array?
* How do you find out how big an array is?
* How do you put an array in order?
* What are the naming conventions for arrays?
* What should you store in arrays?

#### Hashes:
* What is a hash?
* What are keys and values?
* How is a hash similar to an Array?
* How is a hash different from an Array?
* What are 3 ways to create a hash?
* What is the hash rocket?
* How do you access data in a hash?
* How do you change data in a hash?
* What types of data are good to store in a hash?
* What are options hashes?
* How do you delete data from a hash?
* How do you add hashes together?
* How do you list out all the keys or values?
* How do you see if the hash contains a key or value?
* What is a set?

#### Dates and Times:
* How do you get the current date and time?
* How do you find just the Year?  Month? Hour? Second? Weekday?
* How do you create a `Time` specifically for 12/25/2013?  
* How do you find how many days have passed between two `Time`'s?
* What's the difference between UTC and GMT and Local times?
* How would you find out the time that was 100 seconds ago? 10 days ago?

#### Other Random Stuff:
* What is `nil`?
* How do you check if something is `nil`?
* What's the difference between `nil` and `blank` and `empty`?
* Are the following `nil` or `empty`?
      * `" "`, `""`, `[]`, `[""]`, `{}`
* What's the difference between `puts` and `p` and `print`?
* What does `inspect` do?
* What do `+=`, `-=`, `*=` and `/=` do?
* What is parallel assignment?
* What's the easiest way to swap two variables?

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. You should have already completed [Learn to Program](http://pine.fm/LearnToProgram/) in the Web Development 101 course to start with.
  2. Do the full [Codecademy Introduction to Ruby section](https://www.codecademy.com/courses/learn-ruby/lessons/introduction-to-ruby/) from their [Ruby Track](https://www.codecademy.com/catalog/language/ruby).
  3. Take a look at the [Ruby Date and Time explanation from TutorialsPoint](http://www.tutorialspoint.com/ruby/ruby_date_time.htm).  No need to memorize all the Time Formatting Directives, just know what they are and where to find them.
  4. Do this great little [Regex Tutorial](http://regexone.com/) and the example problems (should only take an hour or so)
  5. Glance over this list of [Escape Characters](https://docs.ruby-lang.org/en/2.7.0/syntax/literals_rdoc.html#label-Strings) in Ruby and keep it for future reference.  You'll probably only end up using `\n` newlines and `\t` tabs.
  6. For a deeper look at certain underserved pieces of the above material, check out these posts from Erik Trautman:
      1. [Ruby Explained: Numbers, Operators and Expressions](http://www.eriktrautman.com/posts/ruby-explained-numbers-operators-and-expressions)
      2. [Ruby Explained: Objects and Methods](http://www.eriktrautman.com/posts/ruby-explained-objects-and-methods)
      3. [Ruby Explained: Strings](http://www.eriktrautman.com/posts/ruby-explained-strings)
      4. [Ruby Explained: Arrays](http://www.eriktrautman.com/posts/ruby-explained-arrays)
      5. [Ruby Explained: Hashes](http://www.eriktrautman.com/posts/ruby-explained-hashes)
      6. [Ruby Explained: Dates and Times](http://www.eriktrautman.com/posts/ruby-explained-dates-and-times)
      6. [Ruby Explained: Other Random Tidbits](http://www.eriktrautman.com/posts/ruby-explained-other-random-tidbits)
</div>

### Test Yourself
Note: If you want to actually write and run your own Ruby code, you can either use IRB from the command line (type `irb` after the prompt), or run it from a script file using `$ ruby ./your_file_name_in_the_current_directory.rb`, or use the online editor at [repl.it](http://repl.it/languages/Ruby).

<div class="lesson-content__panel" markdown="1">
  1. Make sure you can do the [Beginner Ruby Quiz #1](http://www.codequizzes.com/ruby/beginner/variables-strings-numbers) from [Code Quizzes](http://www.codequizzes.com/).
  2. Make sure you go back up and look at all the questions from the "Learning Outcomes" section.  See if you can do most of them without looking back through the text.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* If you still don't understand certain topics or don't like my summary, look them up in the [Bastard's Book](http://ruby.bastardsbook.com/)
* Read [Zetcode's Data Types section](http://zetcode.com/lang/rubytutorial/datatypes/) for a bit more depth on the subject.
* [Alex Chaffee's brief writeup on Objects](http://codelikethis.com/lessons/learn_to_code/objects)
* [Ruby Inheritance](http://rubylearning.com/satishtalim/ruby_inheritance.html)
* Read [Zetcode's Strings section](http://zetcode.com/lang/rubytutorial/strings/) for an in-depth look at strings.
* Read through (and watch the video) for this [Regular Expressions in Ruby](http://net.tutsplus.com/tutorials/ruby/ruby-for-newbies-regular-expressions/) explanation.
* Read the [zetcode Arrays chapter](http://zetcode.com/lang/rubytutorial/arrays/) for some more in-depth knowledge.  Don't worry too much where they talk about blocks or the `select`, `collect` and `map` methods, we'll cover that in a later section.
* Read [Zetcode's Hashes section](http://zetcode.com/lang/rubytutorial/hashes/) for some more depth on hashes.  Again, don't worry too much about `map` and other block-taking functions.
* [Nil vs Empty vs Blank](http://stackoverflow.com/questions/885414/a-concise-explanation-of-nil-v-empty-v-blank-in-ruby-on-rails)
* [p vs puts in Ruby](http://stackoverflow.com/questions/1255324/p-vs-puts-in-ruby)
* [Ruby Cheat Sheet (pretty dense) from OverAPI](http://overapi.com/ruby)
