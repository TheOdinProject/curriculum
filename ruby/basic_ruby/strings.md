
## Strings
### Intro and Goals
Strings are a huge part of web programming and you'll run into them everywhere from variable names to user input to giant gobs of HTML text to handling big dictionary files.  They're actually pretty simple at the core but, for being just a jumble of characters, strings have some pretty cool properties in Ruby and you can do a whole lot to manipulate them.  

This section should give you an appreciation for the ways you can mess with strings and some of the handy methods that Ruby gives you along the way to make your life easier.

### Thought Questions
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
* How can you center or justify a string?

### Check These Out First
* Read [Zetcode's Strings section](http://zetcode.com/lang/rubytutorial/strings/) for an in-depth look at strings.
* Read through (and watch the video) for this [Regular Expressions in Ruby](http://net.tutsplus.com/tutorials/ruby/ruby-for-newbies-regular-expressions/) explanation.
* Do this great little [Regex Tutorial](http://regexone.com/) and the example problems (should only take an hour or so) 
* Check out this list of [Escape Characters](http://www.java2s.com/Code/Ruby/String/EscapeCharacterslist.htm) in Ruby for reference.

### A Brief Summary
Strings are just made up of individual characters and denoted with quotes.  `> I confuse Ruby and probably throw an error` but `> "I do not because I have quotes"`  

**Double Quotes** are often interchangeable with **Single Quotes**... there's almost no difference and you're free to use either.  Two cases make the distinction important:

A) When you want to show quotes inside a string:

    > my_long_string = "And she said, 'Cool program!'"
    => "And she said, 'Cool program!'"

Note that you can accomplish the same type of thing by escaping the quote characters (see below).

B) When you want to use string interpolation and when you want to show quotes within a string.

**String Interpolation** occurs when you want to plug something else into a string, like a variable.  You'll find yourself using this a lot, for instance, when you make websites with dynamic text content that needs to change depending on who is logged in.  Simply use the pound symbol and curly braces `#{}` to do so, and the output of whatever is within those curly braces will be converted to a string and, presto! You've got a new string:

    > my_name = "Tiny Tim"
    => "Tiny Tim"
    > my_string = "My name is #{my_name}!"
    => "My name is Tiny Tim!"

The key point here, though, is that interpolation *only works inside DOUBLE quotes*.  Keep the interpolated stuff brief or your code won't be very legible.  Single quotes will simply escape every special character in the string and treat it like a normal letter (so the pound-curly-braces has no special meaning):

    > my_name = "Neo"
    => "Neo"
    > my_string = 'My name is #{my_name}!'
    => "My name is \#{my_name}!"  # Hey! That's not what we wanted!

**Escaping** characters just means telling the output program to not treat them specially at all (like the pound symbol, which has special meaning before the curly braces).  You do so with a back slash `\` before whatever you want to escape.  Sometimes you'll see what looks like a strange jumble of characters in your output, with lots of those '\' floating around, and you'll know that you've got some escaping going on.

    > now = "RIGHT NOW"
    => "RIGHT NOW"
    > puts "interpolating #{now} but not \#{now}"
    "interpolating RIGHT NOW but not #{now}"
    => nil            # Remember, puts returns nil!

IRB shows you the backslashes, but they'll be hidden in your `puts` output.

As you can imagine, this could get pretty tedious if you're trying to output a blog post or some other long batch of text that contains lots of mixed characters and don't want to manually or programmatically replace special characters, so later we'll see some simple convenience methods to use to take care of those issues for you.

There are some special characters that are actually denoted using the backslash and you'll want to know the key ones, which will probably pop up again and again:  
* `\n` will output a new line
* `\r` is a newline too (carriage return)
* `\t` will output a tab

    > puts "let's put a bunch of newlines between this\n\n\nand this."



    and this.
    => nil

**`to_s`** is a method that will try to convert anything into a string.  

    > 12345.to_s
    => "12345"

This method gets called a LOT behind the scenes later on... basically anytime Ruby or especially Rails is outputting or rendering something (like a variable), it will call `to_s` on it to make it a nice friendly string first.  

Fun fact: If you've created your own object, you may need to (or GET to!) write your own `to_s` method for it to display properly in some settings.  For example (looking ahead), if you've got a Person object and want to display its first name whenever you tried to `puts` it, you'd want to write the `to_s` method to do so.

**Combining Strings** without using interpolation can be done using "concatenation", or basically just adding them together:

    > my_name = "Billy Bob"
    > "hello" + " world" + ", say I, the great " + my_name + "!"
    # => "hello world, say I, the great Billy Bob!"

Instead of adding them with a plus `+`, you can also use the friendly shovel operator `<<` to append to a string (just like with arrays...):

    > "howdy " << "fella!"
    => "howdy fella!"

To **Access a Specific Character or Substring** of a string, just treat it like an array!  A string acts like a zero-indexed array that ends at -1, so use `[0]` to access the first letter, `[-1]` to access the last letter, and `[n..m]` to pluck a substring:

    > s = "hello"
    => "hello"
    > s[0]
    => "h"
    > s[-1]
    => "o"
    > s[-2]
    => "l"
    > s[2..4]
    => "llo"
    > s[1..-2]
    => "ell"

**Break a String into Pieces** using `split`, which creates an array of substrings that are broken up based on whatever character you passed in:

    > list = "eggs, milk, cheese and crackers"
    => "eggs, milk, cheese and crackers"
    > list.split(", ")
    => ["eggs", "milk", "cheese and crackers"]
    > list.split(" ")
    => ["eggs,", "milk,", "cheese", "and", "crackers"]

You can also split based on individual characters by passing either a blank string or a blank regular expression (denoted by `//`):

    > list.split("")      # or also list.split(//)
    => ["e", "g", "g", "s", ",", " ", "m", "i", "l", "k", ",", " ", "c", "h", "e", "e", "s", "e", " ", "a", "n", "d", " ", "c", "r", "a", "c", "k", "e", "r", "s"] 

When you write your Ruby programs, you'll probably want to ask for **User Input**... which is easy with `gets`, which then waits for the user to type something.  You'll want to store whatever the user types into a variable and be sure to trim off the extra line break (from when the user hit the `enter` key) using `chomp`:

    > player1 = gets    
    Erik                # this was typed in manually
    => "Erik\n"         # woah, let's get rid of that \n
    > player1 = gets.chomp
    Erik
    => "Erik"           # better.

`chomp` will cut off a space or newline at the END of the string (and can take an optional input so you can specify what exactly to chomp off). `strip` will remove ALL spaces and newlines from both the beginning and end of the string:

    > " dude \n".chomp
    => " dude "         # still have the extra spaces
    > " dude \n".strip
    => "dude"           # clean as a whistle.

Of course, it's up to you to figure out if your user has entered something illegal or harmful, but at least you have an easy job removing extraneous spaces and returns.

**Other Helpful String Methods** include:
* `length` to get the length of the string
* `downcase` to convert `"ALL THIS"` to `"all this"`
* `upcase` to convert `"all this"` back to `"ALL THIS"`
* `reverse` to convert `"hello"` to `"olleh"`

Fun fact: Strings made with the backtick characters `` ` `` (which is usually located on the same key as the tilde `~`) are actually interpolated and run by your operating system, so in IRB if you type ``> puts `ls` `` on a mac, it will actually output your directory contents!

What about all the times you may want to **Search For or Replace Within Strings**?  For that, you need to begin understanding **Regular Expressions**, or "RegEx"'s.  There's a handy method for strings called `gsub(pattern, replace_with_this)`, which finds any occurrances of that pattern and replaces it with whatever you want:

    > "hello".gsub("l","r")
    => "herro"

But what if you want to go looking for more advanced patterns than just simple letters?  Pretty much anytime you've got a function that needs to go mucking through a string looking for patterns, you can employ a Regular Expression.  

Regular Expressions are really just a special syntax that is used to find things (and not just in Ruby, they're used all over the place).  It's beyond the scope of this summary for sure, but I hope you've tried them out at [RegexOne](http://regexone.com/).  Once you know how to match stuff, you'll feel ready to take on any big dictionary files or big batches of questionable user input that needs to be standardized.  But be careful, it can be too tempting to go hog-wild with your expressions. It's something you should at least know the basics of but probably will not be applying all that often "in the wild".  

The last thing to cover is **Symbols**, which start creeping up all over the place when you get into Rails and even Hashes.  Symbols are denoted with the colon before the name, e.g. `:my_symbol` instead of `"my_string"`  A symbol is basically like a string without any depth... string lite, if you will.  A string is **Mutable**, meaning it can be added to, reversed, and generally messed with in a hundred different ways.  Whenever you have text that you want to play around with or use as, well, text, just stick with strings.

But sometimes all you want is a name, like when you're using a hash key.  In that case, it makes sense to use symbols.  Symbols are immutable, so they don't change.  They are also only stored in memory in one place, wherease strings have a new place in memory each time you declare one:

    > "hello".object_id
    => 70196107337380
    > "hello".object_id
    => 70196107320960       # different
    > :hello.object_id
    => 461128
    > :hello.object_id
    => 461128               # same!

While you're learning, just stick with strings until you see the examples using symbols, which will mostly be with hash keys.

**Other Helpful Methods** 
* **`ljust`** will let you pad your string with extra spaces (or any other character you choose) up until a specified total amount of characters, so `"hi".ljust(4) => "hi  "` and `"hi".ljust(6,"*") => "hi****"`.  It can be handy for prettying up some of your command line outputs.
* **`rjust`** does the same thing but pushes your string to the right, e.g. `"hi".rjust(6) => "    hi"`
* **`center`** is the same idea but it centers your string: `"hi".center(6,"!") => "!!hi!!"`

### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*

1. TODO: IRB reversing, shouting stuff, find the ith letter...

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* [Chris Pine on Strings](http://pine.fm/LearnToProgram/?Chapter=02) (was part of the prep work)
* [Learn Code The Hard Way on Strings](http://ruby.learncodethehardway.org/book/ex6.html)
* Add Here!
