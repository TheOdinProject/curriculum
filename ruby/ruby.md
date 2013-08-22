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
6. Glance over the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) so you have an idea of how to make your code look more professional.

#### Test Yourself

Make sure you can do [Quiz #5](http://www.codequizzes.com/topics/24/quizzes/79) and [Quiz #7](http://www.codequizzes.com/topics/24/quizzes/81) from [Code Quizzes](http://www.codequizzes.com).  

Then do their [Practical Object Oriented Design Quiz](http://www.codequizzes.com/topics/1/quizzes/40), which will delve deeper into design principles.  There are some new concepts here to pick up as well.

#### Additional Resources

* If you'd still like to learn more about how to really design more concise, effective, purposeful classes, check out [Practical Object-Oriented Design in Ruby](http://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330) from Sandi Metz.

### PAIR PROJECT: Good Programming with OOP
Estimated Time: 6-8 hours

Get a partner and do the [OOP Programming Project](oop_project.md).



## Ruby on the Web
#### Intro

You know how to write scripts and games using Ruby but so far that's all confined within the boundaries of your local system.  In this section, you'll learn how to break free and start mucking around on the Internet.

You (should have) learned about how the web works in the [Web Development 101](/web_development_basics/web_development_basics.md) section, but it might be worth heading back for a refresher if you've got any lingering questions.  You'll be working with HTTP requests and responses quite a bit in this section so it's important to at least understand what's going on there.  

Ruby (or a gem that you've downloaded) will give you the power to send HTTP requests, whether GET or POST or PUT or DELETE, and then wait for a response.  You'll find yourself needing to take apart that response to get to the good stuff, whether that's the HTML of a web page you're trying to scrape or a JSON object returned by some website's API that you've queried.  Every gem has a slightly different way of doing it, but the principles remain the same.  On the flip side, Ruby gives you the tools to listen for requests and deliver responses... as a web server yourself!

We're learning this stuff for two reasons.  First, it's important to understand the underlying fundamentals of how web requests and responses work if you want to actually build web pages.  Ruby on Rails will take care of lots of this nitty gritty stuff for you if that's your goal, but having worked with your bare hands before will give you a giant leg up when using it and it doesn't take long to figure out.  Second, there's a big world outside of Rails, and you should have the tools to build some nifty Ruby programs that can play around on the web.  Because it's a whole lot more fun!

This section won't be nearly as long as the previous one, and should have you building stuff pretty early on.  Actually, the project section is really where you'll be spending all your time.  Let the spamming begin.

#### Homework Assignment

1. Go into your terminal and type `$ curl http://www.google.com` and observe the massive chunk of text that gets returned.  That's Google's homepage and should give you an idea of some of the responses you can get from these types of requests.
1. Read [Beginning Ruby](http://beginningruby.org/) Chapter 14, pages 413-432 for a look at taking on the Internet with Ruby.  It dives into the guts of things pretty quickly, so breathe deep and forge on...
2. Read this extremely simple [REST tutorial in Ruby](http://rest.elkstein.org/2008/02/using-rest-in-ruby.html), which is basically just to show you how dead simple it is to issue HTTP requests using Ruby and then grab the response.
3. Read this [explanation of how HTTP works](http://www.jmarshall.com/easy/http/#whatis) down through where it talks about the POST method (about halfway down).  You can stop before the HTTP Proxies section.

#### Test Yourself


### PAIR PROJECT: Ruby on the Web
Estimated Time: 6-10 hours

Get a partner and do the [Ruby on the Web Pair Project](/ruby/ruby_web_project.md).  

## Basic Recursion, Algorithms and Data Structures

You've learned how to build some cool stuff already and, frankly, you could probably make some decent websites without a crazy amount of additional formal education.  However, just because you can write English at a grade school level doesn't mean you will be editing the New York Times anytime soon.

In the world of programming, there's a difference between solving a problem the brute force way and solving a problem WELL.  We touched on the first layer of this when we covered basic object-oriented programming and how you should break apart your code into well-organized chunks.  If that was all about learning how to write good code, these next few sections are going to be about training yourself to figure out the best code to write -- the most elegant solution to the problem at hand.  It becomes particularly important whenever you start working with large data sets, like when your website becomes highly successful.

We're taking a little detour through some more Computer Science-y concepts here because they are fundamental for a reason.  Some problems require you to use tools beyond just arrays and iterators.  You're going to build chess and it's not fundamentally difficult (it's just a rules-based game after all) but there are some tricks that you'll want to use to help you solve it.  

If that doesn't sway you, this curriculum is meant to prepare you for life beyond the web page.  If you're interested in applying for a job, you'll be asked questions that directly touch on some of this stuff.  It's going to require you to put on your thinking cap (sorry, it had to happen sometime), but you can do it.

### 1. Recursion
#### Intro

Recursion is the idea that a function calls itself.  Pretty simple, right?  It's used to take a big problem and start breaking it down into smaller and smaller pieces and continuing to feed those back into the original function until some sort of answer is achieved and the whole chain unwinds.  

There's also a right and wrong way to use recursion.  The fact is, any problem you can solve recursively you can also solve using the iterators that you know and love.  If you find yourself saying "why didn't I just use a `while` loop here?" then you probably should have.  You won't often end up using a recursive solution to a problem, but you should get a feel for when it might be a good idea.

#### Homework Assignment

1. Read the [Chapter on Recursion](http://ruby.bastardsbook.com/chapters/recursion/) in the Bastards Book of Ruby by Dan Nguyen
2. Watch this [Video on Recursion](http://vimeo.com/24716767) by Joshua Cheek but only until minute 17:45!  (don't want to give away the project...)

#### Test Yourself

1. Complete the [Code Quiz](http://www.codequizzes.com/topics/5/quizzes/7) on Recursion.

### PAIR PROJECT: Recursion
Estimated Time: 3-4 hours

Find a partner and work on the [Recursion Project](recursion_project.md) together.


### 2. Basic Data Structures and Algorithms
#### Intro

The basic idea of a data structure is to store data in a way that meets the needs of your particular application.  You can usually store data in one giant array, but it can be very time consuming to locate a particular value.  Depending on the application, there are a batch of other basic data structures that you can use to meet your needs.  Often, you end up making trade-offs between various attributes like how long it takes to first populate the structure, how long it takes to add or find elements, and how large the structure is in memory.

We'll get more into the specifics of data structures later in the curriculum, but this introduction should again expand your toolbox slightly so you're much better able to identify and solve certain problems where Arrays, Hashes and Sets don't quite cut it.  This is particularly relevant when you're trying to search through a bunch of data for a particular value or plan out a strategy several moves in advance.

Some problems, like traversing a tree looking for a certain element, are relatively common in data intensive applications and have been solved many times in the past.  Understanding how they are solved will give you some great tools to apply to other (similar) problems as well.  Algorithms are really just ways of solving problems (like this) systematically.  You'll learn about some of the common algorithms like breadth-first-search and depth-first-search.


#### Homework Assignment

1. Glance over the [Wikipedia entry on Data Structures](http://en.wikipedia.org/wiki/Data_structure) for a high level overview of things.
2. Learn about Queues and Stacks by watching [this video](https://www.youtube.com/watch?v=6QS_Cup1YoI)
2. Learn about binary search trees by watching [this video](http://cs50.tv/2012/fall/shorts/binary_search/binary_search-720p.mp4) from Harvard's CS50x on edX.
3. Read [this Quora question about the importance of algorithms in web development](http://www.quora.com/Algorithms/What-is-the-importance-of-algorithms-in-web-development) to get some context for why we're going over this stuff.
1. Learn about basic algorithms from Coursera's Algorithms course in [this video](http://www.youtube.com/watch?v=u2TwK3fED8A).  The first 10 minutes are really the meat of the introduction to algorithms, the rest gets more mathematical (if you're so inclined).  
2. Read the [Gentle Introduction to Algorithms for Web Developers](http://www.giocc.com/a-gentle-introduction-to-algorithms-for-web-developers.html) for another basic look at what algorithms are.
3. Finally, learn about Depth First Search and Breadth First Search from [this video on YouTube](http://www.youtube.com/watch?v=zLZhSSXAwxI).

#### Test Yourself
* Breadth First Search is best used when you want to find the **shortest** path to something but it can take a very long time
* Depth first search is best used when you want to find any path to a solution but find it fast.

### PAIR PROJECT: Data Structures and Algorithms

Find a partner and work on the [Data Structures and Algorithms Project](data_structures_algorithms_project.md) together.

## A Taste of Testing Ruby with RSpec
#### Intro

By now you've had some experience writing actual programs using Ruby.  Presumably, you've been making sure they work by manually entering certain things in the command line over and over again.  This was probably especially frustrating with some of the more complex exercises during the Algorithms and Data Structures section.  

As you should recall from the Web Development 101 section, testing with RSpec lets you automate most of these activities.  It also allows you to make sure your program's interfaces with the public are functioning properly.  It allows you to have confidence in your code and not to worry about changing things that may break stuff because you'll know immediately what broke and can much more easily determine why.  If you end up contributing to an open-source project, they'll want you to include specs to test whatever features you've created.

At the most basic level, RSpec is a "Domain Specific Language" (DSL, meaning it just does a very specific thing) written in Ruby that is designed to help you test your Ruby code.  You use it by including the `rspec` gem, which is really just a package containing 3 other gems -- `rspec-core`, `rspec-expectations` and `rspec-mocks`.  It's configured so that, once you've got the gem included, if you've laid out your project folders in the right places, you can just execute the specs directly from the command line.  If you did the Test-First project in the Web Development 101 section, you should already be quite familiar with it. 

We will cover testing in more depth in the section on Rails, but you'll want to get a good base built in testing "plain old" Ruby first.  It will also help you with the final project since you might otherwise find yourself endlessly entering data into the command line and using the debugger.

#### Homework Assignment

1. Go back to the Web Development 101 section and do the RSpec section if you haven't aready.
2. Read the [Wikipedia Page on Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development).
2. Watch [this video walkthrough](http://www.youtube.com/watch?v=JhR9Ib1Ylb8&feature=relmfu) of writing some RSpec tests for a small bit of sample code in the Test-Driven Development (TDD) fashion. 
3. Take a glance at the [Relish RSpec official documentation](https://www.relishapp.com/rspec/rspec-core/v/2-4/docs).  It will be a good resource for when you're scratching your head later.

#### Test Yourself


### PAIR PROJECT: Testing with RSpec

Find a partner and do the [RSpec Pair Project](testing_project.md).



## PAIR PROJECT: Ruby Final Project!

You've almost finished Ruby!  Now we've just got one tiny little last step for you...
Find a partner and do the [Ruby Final Project](ruby_final_project.md).

## Finish
TODO!

## Additional Resources

* [Why Ruby and Python are different](http://stackoverflow.com/questions/1113611/what-does-ruby-have-that-python-doesnt-and-vice-versa?rq=1)

