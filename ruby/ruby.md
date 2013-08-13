# Ruby
Total Estimated Time: 100-200 hrs

## !! This section is still incomplete !!

*[Top level table of contents](/README.md)*


## Intro

In this unit you will learn Ruby, the language designed specifically with programmer happiness in mind.  It's a healthy chunk of learning but, by the end of it all, you'll have built some pretty sweet games including Tic Tac Toe, Minesweeper, Checkers, and Chess.  You'll be able to put together a Twitter spambot (that really spams!), save and open files, test out your code, separate your spaghetti code into nice modular classes, and even reproduce some basic algorithms and data structures for solving complex problems.  Basically, you're going to start feeling a whole lot more like a real programmer and that feeling will be justified.

Some people believe you can just dive right into Rails and start firing out websites.  Rails is a framework built using Ruby and every piece of code in it is Ruby.  When (not *if*) something in your project breaks, you'd better be able to debug it.  And what happens when you want to stretch your wings and do something just a bit beyond what the vanilla tutorials show you how to do?  The amount of time you'd spend googling your error messages and staring blankly at help docs was better spent learning Ruby.

As you may gather, this is also where the real project work begins.  Some of the early material will be fairly straightforward and will rely on simple exercises to help reinforce understanding.  We'll learn using some Codecademy modules at first but the goal is for you to get a much deeper and more practical understanding of the material than that.  As we get further along and into some of the more advanced topics, we'll be learning less and doing more... just the way it should be.   Buckle up, strap in, and let's get learning!

#### How this will work:

Ruby's a big language so it's been broken up into smaller chunks to make it more digesible.  In each section, you'll first be asked to do readings, watch videos, or otherwise view content.  At the end of each section there will be exercises to help you solidify your knowledge of the material and after each group of sections will be larger projects which are best done in pairs.

#### Two Paths Forward:

Everyone is coming into this with a different goal in mind, so to accomodate that, here's two options for your path forward:  
1. If you're just trying to race ahead and put up some Rails sites as fast as possible and worry about learning the fundamentals later, then your best bet is to complete the Basic Ruby section, which uses primarily Codecademy as a resource, and move onto the Rails unit.
2. If you're really looking for a solid, sustainable base of knowledge, just stick to the normal roadmap and we'll get you there.

##### Our Primary "Textbooks":

1. [Codecademy.com](http://www.codecademy.com/tracks/ruby) has a lot of great introductory content to get you ramped into the Ruby language.  You've already read [Chris Pine's Learn to Program](http://pine.fm/LearnToProgram/) in the Web Development 101 section for a good introduction, and the Codecademy stuff will overlap a bit and carry forward from there.
2. Peter Cooper's [Beginning Ruby](http://beginningruby.org/) is a solid introduction to Ruby that covers pretty much the breadth of the language as you need to understand it.  It's a bit outdated but Ruby hasn't changed a whole lot since then.  The goal of this project is to move BEYOND Codecademy and other simple, free resources and get you building stuff on your own.  This book will start covering some of the more intermediate/useful stuff that you'll need to know to do that.

It is not free -- usually somewhere around $30-40, but, as [Peter said himself](http://beginningruby.org/):

> Now, of course, I can’t actively participate in pirating my book but, heck, it’s around on plenty of “free e-book” sites and on RapidShare. There are even links on Twitter to torrents like [this](http://www.torrentdownloads.net/torrent/1650632409/Apress+Beginning+Ruby+From+Novice+to+Professional+2nd+Edition+Jul+2009+eBook-BBL). I am happy for you to pirate my book, but.. I’m NOT A LAWYER, and I can’t guarantee what Apress would do about it – so you’d be doing it off your own back! So, uhm, don’t pirate it? ;-) The only condition, of course, if you do is that if you like the book and you think a print copy would be swell to own, please buy one – even if it’s just for someone you know who wants to learn to program!


##### The (Free) Backup "Textbooks":

Some things you just won't pick up right away or their coverage by main resources will fall short of your expectations.  Luckily there are lots of options for places to shore up your understanding:

1. The staple online book: Zed Shaw's [Learn Code the Hard Way](http://ruby.learncodethehardway.org/book/), an extension of his wildly popular Learn Python the Hard Way into Ruby.
2. The other good book, available in the older edition online for free: [The "Pickaxe", or Programming Ruby 3rd Edition](http://it-ebooks.info/book/59/)

**TODO: Walkthrough of a real Ruby program**


## Roadmap
2. [Basic Ruby](#basic-ruby)
2. [Solving Problems with Ruby](#intermediate-ruby)
4. [Ruby on the Web](#ruby-on-the-web)
6. [Basic Recursion, Algorithms, and Data Structures](#basic-recursion-algorithms-and-data-structures)
5. [Testing Ruby with RSpec](#testing-ruby-with-rspec)
8. [Ruby Final Project](#pair-project-ruby-final-project)



## Basic Ruby

### 1. Building Blocks
*Variables, Data Types, Strings, Methods*

#### Intro

This should start as a quick refresher of what you've already learned...  And now you get to build stuff!

#### Homework Assignment

1. You should have already completed [Learn to Program](http://pine.fm/LearnToProgram/) in the Web Development 101 section to start with.
2. Do the full [Codecademy Introduction to Ruby](http://www.codecademy.com/tracks/ruby) section if you haven't already.
3. Complete the [Codecademy Introduction to Ruby](http://www.codecademy.com/tracks/ruby) project ("Putting the Form in Formatter")
4. Read [Beginning Ruby](http://beginningruby.org/) Chapter 2: `Programming == Joy: A Whistle Stop Tour of Ruby and Object Orientation`
5. Read [Beginning Ruby](http://beginningruby.org/) Chapter 3: `Ruby's Building Blocks: Data, Expressions, and Flow Control` pages 31-50 (only the section on Numbers and Expressions and the section on Text and Strings)

#### Test Yourself

Make sure you can do the [Beginner Ruby Quiz #1](http://www.codequizzes.com/topics/24/quizzes/75) from [Code Quizzes](http://www.codequizzes.com/).

#### Additional Resources

### PAIR PROJECT: Building Blocks
Estimated time: 2 hours

Do the [Basic Ruby Project 1](basic_ruby_project_1.md) with a partner



### 2. Advanced Building Blocks
*Control Flow, Looping, Arrays, Hashes, Blocks, Sorting*

#### Intro

This section gets more into the topics you may have been shakey on before.  It's definitely got some more meat to it than the previous one.  The Codecademy exercises are good for doing on your own because they give you all kinds of help with them.  

#### Homework Assignment

1. Do the [Codecademy Ruby sections 2-6](http://www.codecademy.com/tracks/ruby), including:

    1. [Control Flow in Ruby](http://www.codecademy.com/courses/ruby-beginner-en-NFCZ7)
    2. [Project: Thith Meanth War!](http://www.codecademy.com/courses/ruby-beginner-en-JdNDe?curriculum_id=5059f8619189a5000201fbcb)
    2. [Looping with Ruby](http://www.codecademy.com/courses/ruby-beginner-en-XYcN1?curriculum_id=5059f8619189a5000201fbcb)
    3. [Project: Redacted!](http://www.codecademy.com/courses/ruby-beginner-en-mzrZ6?curriculum_id=5059f8619189a5000201fbcb)
    3. [Arrays and Hashes](http://www.codecademy.com/courses/ruby-beginner-en-F3loB?curriculum_id=5059f8619189a5000201fbcb)
    5. [Project: Create a Histogram](http://www.codecademy.com/courses/ruby-beginner-en-693PD?curriculum_id=5059f8619189a5000201fbcb)
    4. [Blocks and Sorting](http://www.codecademy.com/courses/ruby-beginner-en-ET4bU?curriculum_id=5059f8619189a5000201fbcb)
    4. [Project: Ordering your Library](http://www.codecademy.com/courses/ruby-beginner-en-nOho7?curriculum_id=5059f8619189a5000201fbcb)
    5. [Hashes and Symbols](http://www.codecademy.com/courses/ruby-beginner-en-Qn7Qw?curriculum_id=5059f8619189a5000201fbcb)
    6. [Project: A Night at the Movies](http://www.codecademy.com/courses/ruby-beginner-en-0i8v1?curriculum_id=5059f8619189a5000201fbcb)
    7. [Blocks, Procs, and Lambdas](http://www.codecademy.com/courses/ruby-beginner-en-L3ZCI?curriculum_id=5059f8619189a5000201fbcb)
        
2. Finish [Beginning Ruby](http://beginningruby.org/) Chapter 3: `Ruby's Building Blocks: Data, Expressions, and Flow Control` (pages 50-76)

#### Test Yourself

Make sure you can do the [Beginner Ruby Quiz #2](http://www.codequizzes.com/topics/24/quizzes/76), [Quiz #3](http://www.codequizzes.com/topics/24/quizzes/77), [Quiz #4](http://www.codequizzes.com/topics/24/quizzes/78), and [Quiz #6](http://www.codequizzes.com/topics/24/quizzes/80) from [Code Quizzes](http://www.codequizzes.com/).  They're pretty quick and should give you an idea of what you still need to brush up on.

#### Additional Resources

### PAIR PROJECT: Advanced Building Blocks
Estimated Time: ~4 hrs

Get a partner and do the [Basic Ruby Project 2](basic_ruby_project_2.md), which should be more challenging than the first one.

## Intermediate Ruby

### 1. Working with Files and Serializing Data
#### Intro

Until now you've mostly been working with self-contained command line programs.  It's time to start branching out and interacting with files.  Files are basically just collections of bits and bytes that you'll somehow need to open, read into your program, modify, and save.  Even though many files (like images) look like a giant jumble of data when you open them up in a text editor, it can be helpful to think of all files as one really long string, or stream, of bytes.  Your script will read them in from top to bottom, performing whatever operations you specify along the way.

Lucky for you, Ruby makes your life pretty easy with regards to dealing with files.  It has the tools necessary to read those long streams of bytes into your program and then allow you to work with them using the objects you're familiar with.  As long as you remember that the files are just a long stream of words/characters/bytes being read in from top to bottom, it should be fairly intuitive.  If you want to do more detailed stuff like write to a specific point in a file, you'll need to figure out what position you're at first, since you may be in the middle of it somewhere.

Working with files gets you into the idea of serialization, which basically just means converting your data into a storable format like a string.  That's very useful whether you're thinking of saving your objects and classes (say, when you're in the middle of a game) to a file or when you're transmitting those same types of objects to the web browser (since the only way for information to travel via HTTP is as a string). 

Luckily, Ruby again makes things pretty easy for you. There are some generally accepted formats for serializing data and Ruby gives you the tools you'll need to work with all of them.  The two you'll run into again and again are YAML and JSON.  You often see YAML used to save configuration files in Ruby on Rails because it's very lightweight and straightforward.  You can read it easily in a text editor.  JSON is ubiquitous across the web, and is the format of choice to deliver complex or deeply nested data (like objects) from some website to your program via an API (like if you want to interface with Google Maps).

In this section, you'll get a good handle on these fundamental but important concepts, as well as a chance to flex your muscles and build something that uses each of them.

#### Homework Assignment

1. Refresh yourself on [Ruby Monk's section on the `File` class](http://rubymonk.com/learning/books/1/chapters/42-introduction-to-i-o/lessons/90-using-the-io-class) (it was part of the prep work!)
2. Read through [Ruby Monk's section on Serializing](http://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/104-serializing)
1. Read [Beginning Ruby](http://beginningruby.org/) Chapter 4: `Developing Your First Ruby Application` and follow along with the tutorial.
2. Read [Beginning Ruby](http://beginningruby.org/) Chapter 9: `Files and Databases`

#### Test Yourself

Make sure you can do the [Beginner Ruby Quiz #1](#### Additional Re
sources
### PAIR PROJECT: Working with Files and Saving Data
Estimated Time: ~4-6 hrs

Get a partner and do the [Files and Serialization Project](file_io_project.md).



### 2. Good Programming with OOP

#### Intro

You've got the building blocks of Ruby out of the way, great! Now it's time to get into the fun stuff... how do we combine those building blocks in the most efficient and elegant ways to produce the programs we'd like to write?

The concepts you'll learn here are often less specific to Ruby itself and more widely applicable to any object-oriented language.  That's because the fundamental concepts are just that... fundamental.  Don't repeat yourself.  Modularize your code.  Have your classes and methods only do one thing.  Show as little of your interfaces to the world as you can.  Don't make methods or classes heavily dependent on each other.  Be lazy.  These will take some time and practice to implement effectively, but you'll already be taking a big step towards creating high quality code just by finishing up this section.

There's a lot to do here but stick with it!  The Codecademy lessons are interspersed with their projects.  The Beginning Ruby book will help you understand the material a bit deeper, which will be important to understand for creating your own projects.

#### Homework Assignment

1. Do [Codecademy Ruby sections 7, 9, and 10](http://www.codecademy.com/tracks/ruby):
  
    1. [Refactoring](http://www.codecademy.com/courses/ruby-beginner-en-1o8Mb?curriculum_id=5059f8619189a5000201fbcb)
    2. [Project: The Refactor Factory](http://www.codecademy.com/courses/ruby-beginner-en-Zjd2y?curriculum_id=5059f8619189a5000201fbcb)
    3. [Object-Oriented Programming, Part I](http://www.codecademy.com/courses/ruby-beginner-en-MFiQ6?curriculum_id=5059f8619189a5000201fbcb)
    4. [Project: Virtual Computer](http://www.codecademy.com/courses/ruby-beginner-en-X5wcR?curriculum_id=5059f8619189a5000201fbcb)
    5. [Object-Oriented Programming, Part II](http://www.codecademy.com/courses/ruby-beginner-en-zfe3o?curriculum_id=5059f8619189a5000201fbcb)
    6. [Project: Banking on Ruby](http://www.codecademy.com/courses/ruby-beginner-en-32cN3?curriculum_id=5059f8619189a5000201fbcb)

2. Read [Beginning Ruby](http://beginningruby.org/) Chapter 5: `The Ruby Ecosystem` for a brief break from code to learn more about the world of Ruby.
3. Read [Beginning Ruby](http://beginningruby.org/) Chapter 6: `Classes, Objects, and Modules`.  It will extend your knowledge deeper than Codecademy alone.
4. Read [Beginning Ruby](http://beginningruby.org/) Chapter 7: `Projects and Libraries`
5. Read [Beginning Ruby](http://beginningruby.org/) Chapter 8: `Documentation and Error Handling` but skip the stuff on Testing (pgs 190-196)

scope and style linkouts
#### Test Yourself

Make sure you can do [Quiz #5](http://www.codequizzes.com/topics/24/quizzes/79) and [Quiz #7](http://www.codequizzes.com/topics/24/quizzes/81) from [Code Quizzes](http://www.codequizzes.com).  

Then do their [Practical Object Oriented Design Quiz](http://www.codequizzes.com/topics/1/quizzes/40), which will delve deeper into design principles.  There are some new concepts here to pick up as well.

#### Additional Resources

* If you'd still like to learn more about how to really design more concise, effective, purposeful classes, check out [Practical Object-Oriented Design in Ruby](http://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330) from Sandi Metz.

### PAIR PROJECT: Good Programming with OOP


## Ruby on the Web
#### Intro
#### Homework Assignment
#### Test Yourself

Make sure you can do the [Beginner Ruby Quiz #1](#### Additional Re
sources
### PAIR PROJECT: Ruby on the Web

## Basic Recursion, Algorithms and Data Structures
and recursion
### 1. Recursion
#### Intro
#### Homework Assignment
#### Test Yourself

Make sure you can do the [Beginner Ruby Quiz #1](#### Additional Re
sources
### PAIR PROJECT: Recursion

### 2. Algorithms
#### Intro
#### Homework Assignment
#### Test Yourself

Make sure you can do the [Beginner Ruby Quiz #1](#### Additional Re
sources
### PAIR PROJECT: Algorithms

### 3. Data Structures
#### Intro
#### Homework Assignment
#### Test Yourself

Make sure you can do the [Beginner Ruby Quiz #1](#### Additional Re
sources
### PAIR PROJECT: Data Structures

## Testing Ruby with RSpec
#### Intro
#### Homework Assignment
#### Test Yourself

Make sure you can do the [Beginner Ruby Quiz #1](#### Additional Re
sources
### PAIR PROJECT: Testing with RSpec
build exercises for earlier sections!

## PAIR PROJECT: Ruby Final Project!
mini-rails

## Finish
TODO!

## Additional Resources

* [Why Ruby and Python are different](http://stackoverflow.com/questions/1113611/what-does-ruby-have-that-python-doesnt-and-vice-versa?rq=1)

