### Introduction

Until now you've mostly been working with self-contained command line programs.  It's time to start branching out and interacting with files.  Files are basically just collections of bits and bytes that you'll somehow need to open, read into your program, modify, and save.  Even though many files (like images) look like a giant jumble of data when you open them up in a text editor, it can be helpful to think of all files as one really long string, or stream, of bytes.  Your script will read them in from top to bottom, performing whatever operations you specify along the way.

Lucky for you, Ruby makes your life pretty easy with regards to dealing with files.  It has the tools necessary to read those long streams of bytes into your program and then allow you to work with them using the objects you're familiar with.  As long as you remember that the files are just a long stream of words/characters/bytes being read in from top to bottom, it should be fairly intuitive.  If you want to do more detailed stuff like write to a specific point in a file, you'll need to figure out what position you're at first, since you may be in the middle of it somewhere.

Working with files gets you into the idea of serialization, which basically just means converting your data into a storable format like a string.  That's very useful whether you're thinking of saving your objects and classes (say, when you're in the middle of a game) to a file or when you're transmitting those same types of objects to the web browser (since the only way for information to travel via HTTP is as a string).

Luckily, Ruby again makes things pretty easy for you. There are some generally accepted formats for serializing data and Ruby gives you the tools you'll need to work with all of them.  The two you'll run into again and again are YAML and JSON.  You often see YAML used to save configuration files in Ruby on Rails because it's very lightweight and straightforward.  You can read it easily in a text editor.  JSON is ubiquitous across the web, and is the format of choice to deliver complex or deeply nested data (like objects) from some website to your program via an API (like if you want to interface with Google Maps).

Finally, files and serialization overlap in a lot of ways with the idea and purpose of databases -- they facilitate the ability to maintain state and permanence for your data.  We'll briefly look into some basic database connections that Ruby provides as well.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What are two ways to store a file from your hard drive into a string or array in your Ruby script?
- What are three things made possible or much easier by serialization?
- What is JSON?
- What is YAML?
- How do you turn a Ruby object into JSON?
- How do you turn JSON into a Ruby object?
- What classes and methods can your Ruby script use to read and write to the hard drive?

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Read [Thoughtbot's I/O in Ruby](https://thoughtbot.com/blog/io-in-ruby). You can ignore both the 'Putting it all together' and the 'Working with disparate APIs' sections.
  2. Watch [icc0612's introduction to serialization](https://www.youtube.com/watch?v=uS37TujnLRw). It will explain the concept of serialization before you implement it in Ruby.
  3. Read [Choosing the Right Serialization Format](https://www.sitepoint.com/choosing-right-serialization-format/) for more information about the various serialization options you can choose from.
  4. Skim [Alan Skorkin's](http://www.skorks.com/2010/04/serializing-and-deserializing-objects-with-ruby/) post about serialization. Some of the code examples are outdated, but this post still contains relevant information. If you want to follow along with the code examples, copy and paste them into your code editor and use word wrap.
  5. Read the sections 'Ruby files' and 'Ruby directories' from the [Input/Output chapter of Zetcode's Ruby Tutorial](http://zetcode.com/lang/rubytutorial/io/) for examples of how to manipulate files and directories using the `File` and `Dir` classes. 
</div>

### Knowledge check

  * [How would you go through the lines of a file using an `IO` object?](https://thoughtbot.com/blog/io-in-ruby)
  * [How would you take the Array `[1,2,3]` and serialize it into a JSON string format?](https://www.sitepoint.com/choosing-right-serialization-format/)
  * [What are the benefits of YAML vs JSON vs MessagePack serialization formats?](https://www.sitepoint.com/choosing-right-serialization-format/)
  * [How can you check if a file or directory exists?](http://zetcode.com/lang/rubytutorial/io/)
  * [How can you list a directory's contents in the form of an array?](http://zetcode.com/lang/rubytutorial/io/)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Everything You Need to know about Serialization in Ruby on Rails](https://blog.kiprosh.com/serialization_in_ruby_on_rails_part_one/) 
- [Ruby Monk's section on Serializing](https://web.archive.org/web/20160505174806/http://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/104-serializing)
- [Short Example of Serialization](https://web.archive.org/web/20200627063721/http://rubylearning.com/satishtalim/object_serialization.html) from Ruby Learning
