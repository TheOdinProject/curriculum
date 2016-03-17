# Working with Files and Serializing Data
<!-- *Estimated time: 2-4 hrs* -->

Until now you've mostly been working with self-contained command line programs.  It's time to start branching out and interacting with files.  Files are basically just collections of bits and bytes that you'll somehow need to open, read into your program, modify, and save.  Even though many files (like images) look like a giant jumble of data when you open them up in a text editor, it can be helpful to think of all files as one really long string, or stream, of bytes.  Your script will read them in from top to bottom, performing whatever operations you specify along the way.

Lucky for you, Ruby makes your life pretty easy with regards to dealing with files.  It has the tools necessary to read those long streams of bytes into your program and then allow you to work with them using the objects you're familiar with.  As long as you remember that the files are just a long stream of words/characters/bytes being read in from top to bottom, it should be fairly intuitive.  If you want to do more detailed stuff like write to a specific point in a file, you'll need to figure out what position you're at first, since you may be in the middle of it somewhere.

Working with files gets you into the idea of serialization, which basically just means converting your data into a storable format like a string.  That's very useful whether you're thinking of saving your objects and classes (say, when you're in the middle of a game) to a file or when you're transmitting those same types of objects to the web browser (since the only way for information to travel via HTTP is as a string). 

Luckily, Ruby again makes things pretty easy for you. There are some generally accepted formats for serializing data and Ruby gives you the tools you'll need to work with all of them.  The two you'll run into again and again are YAML and JSON.  You often see YAML used to save configuration files in Ruby on Rails because it's very lightweight and straightforward.  You can read it easily in a text editor.  JSON is ubiquitous across the web, and is the format of choice to deliver complex or deeply nested data (like objects) from some website to your program via an API (like if you want to interface with Google Maps).

Finally, files and serialization overlaps in a lot of ways with the idea and purpose of databases -- they facilitate the ability to maintain state and permanence for your data.  We'll briefly look into some basic database connections that Ruby provides as well.

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* What are two ways to store a file from your hard drive into a string or array in your Ruby script?
* What are three things made possible or much easier by serialization?
* What is JSON?
* What is YAML?
* How do you turn a Ruby object into JSON?
* How do you turn JSON into a Ruby object?

## Your Assignment

1. Refresh yourself on [Ruby Monk's section on the `File` class](http://rubymonk.com/learning/books/1/chapters/42-introduction-to-i-o/lessons/90-using-the-io-class) (this may be review for you)
2. Read through [Ruby Monk's section on Serializing](http://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/104-serializing)
1. Read [Beginning Ruby](http://beginningruby.org/) Chapter 4: `Developing Your First Ruby Application` and follow along with the tutorial.
2. Read [Beginning Ruby](http://beginningruby.org/) Chapter 9: `Files and Databases`.  Much of the databases stuff will be review from the Web Development 101 course and at first you won't often use the connection methods yourself (often an ORM like ActiveRecord for Rails will have that code already written for you), so feel free to skim over it but do try to see what Ruby is capable of.
3. Read the [Chapter on File I/O](http://ruby.bastardsbook.com/chapters/io/) of the Bastard's Book of Ruby.  Much of it will go quickly for you given what you've already read, but there are some new nuggets in there.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* [Zetcode's section on Input/Output in Ruby](http://zetcode.com/lang/rubytutorial/io/) should be another useful perspective on the material.
* [Thoughtbot's I/O in Ruby](https://robots.thoughtbot.com/io-in-ruby) is a good alternative if you find the Ruby Monk lesson (on point 1 above) not helpful.
