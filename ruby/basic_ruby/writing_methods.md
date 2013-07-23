## Writing your Own Methods

### Intro and Goals
You've been using methods since square one and writing your own as well so we'll focus on the essentials and the slightly more advanced stuff in this section, including how you actually run your code without needing to use IRB and some more stylistic issues that come up frequently.

### Thought Questions
* How many things should a method do?
* What types of things should a method modify?
* What should you name a method?
* What does `self` mean?
* What do you need to do to create your own Ruby script file?
* How would you run a Ruby script from the command line?
* What is a shebang line?
* What does `require` do?
* What does `load` do?
* What is the difference between `require` and `load`?
* What does `send` do?
* When would `send` be used that's different from just running the method on an object 'normally'?

### Check These Out First
* [Writing your Own Methods](http://rubylearning.com/satishtalim/writing_own_ruby_methods.html)
* A quick guide from [wikibooks](http://en.wikibooks.org/wiki/Ruby_Programming/Writing_methods)
* [Getting to Hello World](http://en.wikibooks.org/wiki/Ruby_Programming/Hello_world)
* TODO

### A Brief Summary
What should you put into methods?  Pretty much everything should be in a method, but **each method should only do ONE thing**.  If it's doing two, it's time for another method.  If it's doing a dozen, you probably need to start thinking about having a separate class.  

Methods help organize your code by keeping you from repeating yourself.  Anything that you find yourself doing repetetively should probably go in its own method.

Methods also make your code much easier to read and debug, a fact that you'll appreciate when you write some horrendously complicated spaghetti code and it takes you longer to figure out what it is doing than how to debug the error message you're getting.  

Let's say you're building a game that uses an `until` loop to keep taking turns until someone has won.  But figuring out if someone has won takes several lines of code.  You really can't say `until ( 8 lines of code determining if anyone has one)`  Better to write a method called `game_over?` that does the work, then you can simply and legibly write `until game_over?` and it's obvious what your code does.  

The `game_over?` method probably needs to check if the human player has won or has lost, so maybe your `game_over?` method just contains calls to two other methods, `victory?` and `loss?`  If you were debugging, it'd be very easy for you to go and find where the problem is if the player just can't seem to lose:

    def game_over?
      victory? || loss?
    end
    def victory?
      # check for victory, return true/false
    end
    def loss?
      # check for loss, return true/false
    end

Methods should be SHORT! If they're >10 lines, you're probably doing too much.  When you look at the open-source projects on Github, their methods are often incredibly short.  Good code doesn't look long, it looks brief but descriptive.

A method should be self-contained and only use those variables that have been passed in.  Don't modify global variables or otherwise have side effects for your methods.  By the same token, don't destructively modify the arguments or the object your method was called on (unless it's explicitly a bang! method).  

When **naming methods** the goal is to be descriptive but short.  Name based on what it will return or what the major intended side effect will be.  You won't be missing anything because the method should only do one thing anyway.  If you can't tell what the method will return based on the name, you probably need a better name.  If your method name seems insanely long, your method may be trying to do more than one thing.  End with a question mark `?` if it will return true/false.  

What is **`self`**?  It's a word that you see a whole lot in Ruby and it's actually pretty simple... it refers to whatever object the current method was called on (i.e. the "caller").  So if I called `current_user.jump`, `current_user` is the caller of that method.  Inside the definition of the `jump` method, `self` would refer to the current_user.  

That is incredibly useful because we create methods that could be called by any number of different objects so we need a way inside of that method to dynamically refer to whatever object called it.  You may see something like this, which I could call on a hypothetical `User` object in my web application:

    def full_name
      "#{self.first_name} #{self.last_name}"
    end   # Remember, this implicitly returns the string "firstname"

You're probably tired of running your methods in IRB (if that's what you're still doing) so it's time to learn how to break them out into a **separate script file** which you can then run in its entirety from the command line.  It's easy -- just create a file with the extension `.rb`, navigate to that file's directory from the command line, and run it using `$ ruby filename.rb` (the dollar sign is just the command prompt).  You'll be able to `gets` from and `puts` to the command line now!  

If you get tired of typing `ruby` in front of the file, you can tell your computer that the file is an executable one by using the `chmod` command. Just type `$ chmod +x your_filename.rb` once and you'll be able to execute it, but you now need to let the computer know that it should use the Ruby interpreter when running the file.  That requires you to include, at the very top the file (before any spaces or lines), a **Shebang Line** that points to your Ruby executable:

    #!/usr/bin/ruby

or wherever it's located.

If you want to include a gem file (a library of methods, for instance) in your IRB session, you'll need to use **`require`** to bring it in.  The default directory for `require` accesses any gems you may have downloaded from the internet.  

You can do the same thing with your new script file, though you have to explicitly provide the path to it.  If it's in your current directory, that's easy, it's just `./filename.rb`:

    > require './your_script.rb'
    => true

Now you can run methods and access variables from that file in IRB.  If you were to change and save your script file, to get those changes in IRB you can either reload IRB entirely or use **`load`** instead of `require`.  `require` will only load the file once, a feature designed to save you headache normally.  `load` will load it for you regardless.

    > load `./your_script.rb`
    => true

One nifty command that you probably haven't had a chance to run into yet is **`send`**, which will let you run a method.  Simple.  Just call it on whatever object you'd normally run the method on.  Adapted from [the docs](http://ruby-doc.org/core-2.0/Object.html#method-i-send):

    class Klass
      def hello(string)
        "Hello #{string}"
      end
    end
    k = Klass.new
    k.send :hello, "gentle readers"   #=> "Hello gentle readers"

So simple, why should you care?  Ruby lets you define new methods in runtime and this lets you call them dynamically (since the method name is no longer hardcoded).  Keep that in your back pocket... you won't need it yet but it's great to know.

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* Add Here!

### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*


1. TODO  
