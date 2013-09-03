---
layout: 'content'
---

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
TODO
