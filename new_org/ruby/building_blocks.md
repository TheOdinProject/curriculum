# Ruby Building Blocks

*Estimated Time: 6-8 hrs*

Welcome to Ruby Building Blocks!  Since you've already done a decent chunk of Ruby in the [Web Development 101 Course](/curriculum/web_development_101/ruby_basics.md) (if not, go do that first!), this should start as a healthy refresher of what you've already learned with *Variables, Data Types, Strings, and Methods*.  But this lesson will take you much deeper and further than you went before, so don't think you've got a free pass.

To make sure you are really grounded on all the material here, we've included a special section below the assignment where we summarize key concepts.  This won't be available in all lessons, but you should find it quite helpful.

So... Get stretched out and warmed up, it's time to dive in!

## You Will Need To Understand: 

**Note:** This lesson has a very long list of things you need to understand by the end.  We recommend you read through the list, do the assignment, read through the bonus summary section, and then test yourself by seeing if you can answer all these questions.

* **Numbers, Operators and Expressions:**

    * What's the difference between an `Integer` and a `Float?`
    * Why should you be careful when converting back and forth between integers and floats?
    * What's the difference between `=`, `==`, and `===`?
    * How do you do exponents in Ruby?
    * What is a `range`?
    * How do you create a range?
    * What's the difference between `(1..3)` and `(1...3)`?
    * What are three ways to create a range?

* **Strings:**

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

* **Arrays:**
  
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
    * How to you find out how big an array is?
    * How do you put an array in order?
    * What are the naming conventions for arrays?
    * What should you store in arrays?

* **Hashes:**

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

* **Dates and Times:**

    * How do you get the current date and time?
    * How do you find just the Year?  Month? Hour? Second? Weekday?
    * How do you create a `Time` specifically for 12/25/2013?  
    * How do you find how many days have passed between two `Time`'s?
    * What's the difference between UTC and GMT and Local times?
    * How would you find out the time that was 100 seconds ago? 10 days ago?

* **Other Random Stuff:**

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

## Your Assignment:

1. You should have already completed [Learn to Program](http://pine.fm/LearnToProgram/) in the Web Development 101 course to start with.
2. Do the full [Codecademy Introduction to Ruby section](w.codecademy.com/courses/ruby-beginner-en-d1Ylq/0/1) from their [Ruby Track](http://www.codecademy.com/tracks/ruby).
3. Complete the [Codecademy Introduction to Ruby](http://www.codecademy.com/courses/ruby-beginner-en-MxXx5/0/1) project ("Putting the Form in Formatter")
4. Read [Beginning Ruby](http://beginningruby.org/) Chapter 2: `Programming == Joy: A Whistle Stop Tour of Ruby and Object Orientation`
5. Read [Beginning Ruby](http://beginningruby.org/) Chapter 3: `Ruby's Building Blocks: Data, Expressions, and Flow Control` pages 31-50 (only the section on Numbers and Expressions and the section on Text and Strings)
6. Take a look at the [Ruby Date and Time explanation from TutorialsPoint](http://www.tutorialspoint.com/ruby/ruby_date_time.htm).  No need to memorize all the Time Formatting Directives, just know what they are and where to find them.
7. Do this great little [Regex Tutorial](http://regexone.com/) and the example problems (should only take an hour or so) 
8. Check out this list of [Escape Characters](http://www.java2s.com/Code/Ruby/String/EscapeCharacterslist.htm) in Ruby for reference.
9. Read through the special summary section below to make sure you're grounded in all the right stuff.

## A Special Summary

This section includes more detail about each of the concepts you've covered in the assignment, and should be helpful for answering the questions posed in the "You Will Need To Understand" section above.  

If you don't understand a particular part, open up an IRB session and play around!  Most of the code below is shown using IRB's syntax (with the `>` prompt) anyway.

### Numbers, Operators, and Expressions

When doing mathematical operations, Ruby expects the result to be the same type as the inputs, so dividing two integers by each other will produce an integer... whether you want to or not:

    > 5 / 3
    => 1  

To fix this, you need to make one of the inputs a different data type that can handle decimals, like a *floating point* number (float): 

    > 5.0 / 3               # as long as one of them is a float...
    => 1.6666666666666667   # ... the result is a float

Converting between integers and floats is easy -- just use `to_i` and `to_f` respectively:

    > 5.0234.to_i
    => 5
    > 5.to_f
    => 5.0

Because Ruby is so flexible, it lets you do some quirky things like multiplying completely different data types together in a way that you sort of think you *should* be able to but never expected to actually be able to do:

    > "hi" * 3
    => "hihihihi"

These types of operations work the same way with variables:

    > my_word = "howdy"
    => "howdy"
    > my_word * 3
    => "howdyhowdyhowdy"

A **Range** is just a continuous sequence and we represent it in a shorthand way.  If we want to say `3,4,5,6,7,8,9,10,11`, it's much easier to just write it the short way `(3..11)`, meaning "all the integers beween 3 and 11, including both 3 and 11".  If we wrote it `(3...11)`, it would actually exclude `11`  You can also create a range using `Range.new(start, finish)`, though the shorthand notation is more conventional.

For equality:

* `=` is for assignment, so it assigns a value to a variable as in `> name = "Erik"`
* `==` is for checking that two things are equal but don't have to be identical instances.  You'll use this in most cases, especially when working with conditional statements.  `> 1 + 1 == 2` returns '=> true'.  When you start creating your own classes (like an "Animal" class), you'll need to tell Ruby how to compare two animal instances by writing your own version of this method (it's easy).
* `===` can actually mean some different things (you can overwrite it easily). You will probably be sticking with `==` in most situations, but it's good to understand `===` as well.  `===` typically asks whether the thing on the right is a member or a part or a type of the thing on the left.  If the thing on the left is the range `(1..4)` and we want to know if 3 is inside there:


        > (1..4) === 3
        => true


This also works for checking whether some object is an instance of a class:

    > Integer === 3
    => true

See [http://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby](http://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby) for a more detailed explanation.

### Objects and Methods

"Everything in Ruby is an Object" is something you'll hear rather frequently.  "Pretty much everything else is a method" could also be said.  The goal here is for you to see the Matrix... that everything in Ruby is an Object, every object has a class, and being a part of that class gives the object lots of cool methods that it can use to ask questions or do things.  Being incredibly object-oriented gives Ruby lots of power and makes your life easier.

Think of every "thing" in Ruby as a having more than meets the eye. The number `12` is more than just a number... It's an **object** and Ruby lets you do all kinds of interesting things to it like adding and multiplying and asking it questions like `> 12.class` or `> 12+3`

Ruby gives all objects a bunch of neat **methods**.  If you ever want to know what an object's methods are, just use the `#methods` method!  Asking `> 12345.methods` in IRB will return a whole bunch of methods that you can try out on the number 12345.  You'll also see that the basic operators like `+` and `-` and `/` are all methods too (they're included in that list).  You can call them using the dot `> 1.+2` like any other method or, luckily for you, Ruby made some special shortcuts for them so you can just use them as you have been: `> 1+2`

Some methods ask true/false questions, and are usually named with a question mark at the end like `#is_a?`, which asks whether an object is a type of something else, e.g. `1.is_a?Integer` returns `true` while `"hihi".is_a?Integer` returns `false`  You'll get used to that naming convention.  Methods like `#is_a?`, which tell you something about the object itself, are called **Reflection Methods** (as in, "the object quietly reflected on its nature and told me that it is indeed an Integer").  `::class` was another one we saw, where the object will tell you what class it is.

What is a method? A method is just a function or a black box.  You put the thing on the left in, and it spits something out on the right.  *Every method returns something*, even if it's just `nil`.  

Some methods are more useful for their **Side Effects** than the thing they actually return, like `#puts`  That's why when you say `> puts "hi"` in IRB, you'll see a little `=> nil` down below... the method prints out your string as a "side effect" and then returns `nil` after it's done.  When you write your own methods, if you forget to think about the return statement, sometimes you'll get some wierd behavior so always think about what's going in and what's coming out of a method.

Methods can take **inputs** too, which are included in parentheses to the right of the method name (though they can be omitted, as you do with `> puts("hi")` becoming `> puts "hi"`.. it's okay to be lazy, as long as you know what you're doing).  Going back to the addition example, `> 1+2==3` is asking whether 1+2 will equal 3 (it returns `=> true`), but it can more explicitly be written `> 1.+(2).==(3)`  So, in this case, you can see there's more going on than meets the eye at first.  

That example also shows **Method Chaining**, which is when you stick a bunch of methods onto each other.  It behaves like you'd expect -- evaluate the thing on the left first, pass whatever it returns to the method on the right and keep going.  So `> 1+2==3` first evaluates `1+2` to be `3` and then evaluates `3==3` which is `true`  This is great because it lets you take what would normally be many lines of code and combine them into one elegant expression.

**Bang Methods** are finished with an exclamation point `!` like `#sort!`, and they actually modify the original object.  The exclamation point lets you know you're in dangerous territory.  Remember, when you run a normal method in IRB, it will output whatever the method returns but it will preserve the original object.  Bang methods save over the original object (they are "destructive"):

    > my_numbers = [1,5,3,2]
    => [1, 5, 3, 2]
    > my_numbers.sort
    => [1, 2, 3, 5]
    > my_numbers
    => [1, 5, 3, 2]          # still unsorted
    > my_numbers.sort!
    => [1, 2, 3, 5]
    > my_numbers
    => [1, 2, 3, 5]          # overwrote the original my_numbers object!

Methods ending with a question mark `?` return true or false.

Let's answer the question, "Where did all those methods come from?" **Classes** are like umbrellas that let us give an object general behaviors just based on what it is.  An object is an instance of a class -- you (yes, you) are an instance of the `Person` class.  There are lots of behaviors (methods) that you can do just by virtue of being a `Person`... `#laugh`, `#jump`, `speak("hello")`  This is really useful in programming because you often need to create lots of instances of something and it's silly to have to rewrite all the methods you want all of them to have anyway, so you write them at the class level and all the instances get to use them.

Instances of a class get to **inherit** the behaviors of that class.  Inheritance works for classes too!  Your class `Person` has lots of methods but many of them are inherited just by virtue of you also being a `Mammal` or even just a `LivingThing`  You get to use all the methods of your ancestor classes

An interesting exercise to try in Ruby is to use the method `::superclass` to ask a class what its parent is.  If you just keep on going and going, you'll see that everything eventually inherits from `BasicObject`, which originates most of the methods you have access to in the original object:

    > 1.class.superclass.superclass.superclass
    => BasicObject
    > BasicObject.methods
    => # giant list of methods

Random Note: Running the `::methods` method on a class only returns the class methods, whereas `::instance_methods` will return all methods available to any instance of that class (so `String.methods` will return a list of class methods, while `"hello".methods` will return a longer list that is the same as `String.instance_methods`).

Other Random Note: Use `object_id` to see an object's id, and this can be useful if you're running into odd errors where you thought you were modifying and object but it's not changing.  If you debug and look at the id's along the way, you may find that you're actually only modifying a COPY of that object.

To **Write Your Own Methods**, just use the syntax `def methodname(argument1, argument2)`, though the parentheses around the arguments are optional.  The method will return ("spit out") either whatever follows the `return` statement or the result of the last piece of code that was evaluated (an **Implicit Return** statement).  You call the inputs by whatever name you defined them at the top.

You can write methods in IRB... it will let you use multiple lines if it detects that you have unfinished business (a `def` without an `end` or unclosed parentheses):

    > def speak(words)
    >    puts words
    >    return true
    > end
    => nil              # ignore this
    > speak("hello!")
    hello!
    => true

What if you want to assume that the input to a method is a particular value if there hasn't been any supplied?  That's easy, just specify the **Default Input** by assigning it to something where it's listed as an input:

    > def speak(words="shhhhh")
    >     puts words
    > end              # implicitly returns what puts returns... nil!
    => nil             # ignore this
    > speak            # no input
    shhhhh
    => nil

### Strings

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

`#to_s` is a method that will try to convert anything into a string.  Note that we put a `#` in front of method names by convention (you don't use that symbol when you're actually calling the method).

    > 12345.to_s
    => "12345"

This method gets called a LOT behind the scenes later on... basically anytime Ruby or especially Rails is outputting or rendering something (like a variable), it will call `to_s` on it to make it a nice friendly string first.  

Fun fact: If you've created your own object, you may need to (or GET to!) write your own `#to_s` method for it to display properly in some settings.  For example (looking ahead), if you've got a Person object and want to display its first name whenever you tried to `puts` it, you'd want to write the `#to_s` method to do so.

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

**Break a String into Pieces** using `#split`, which creates an array of substrings that are broken up based on whatever character you passed in:

    > list = "eggs, milk, cheese and crackers"
    => "eggs, milk, cheese and crackers"
    > list.split(", ")
    => ["eggs", "milk", "cheese and crackers"]
    > list.split(" ")
    => ["eggs,", "milk,", "cheese", "and", "crackers"]

You can also split based on individual characters by passing either a blank string or a blank regular expression (denoted by `//`):

    > list.split("")      # or also list.split(//)
    => ["e", "g", "g", "s", ",", " ", "m", "i", "l", "k", ",", " ", "c", "h", "e", "e", "s", "e", " ", "a", "n", "d", " ", "c", "r", "a", "c", "k", "e", "r", "s"] 

When you write your Ruby programs, you'll probably want to ask for **User Input**... which is easy with `#gets`, which then waits for the user to type something.  You'll want to store whatever the user types into a variable and be sure to trim off the extra line break (from when the user hit the `enter` key) using `#chomp`:

    > player1 = gets    
    Erik                # this was typed in manually
    => "Erik\n"         # woah, let's get rid of that \n
    > player1 = gets.chomp
    Erik
    => "Erik"           # better.

`#chomp` will cut off a space or newline at the END of the string (and can take an optional input so you can specify what exactly to chomp off). `#strip` will remove ALL spaces and newlines from both the beginning and end of the string:

    > " dude \n".chomp
    => " dude "         # still have the extra spaces
    > " dude \n".strip
    => "dude"           # clean as a whistle.

Of course, it's up to you to figure out if your user has entered something illegal or harmful, but at least you have an easy job removing extraneous spaces and returns.

**Other Helpful String Methods** include:

* `#length` to get the length of the string
* `#downcase` to convert `"ALL THIS"` to `"all this"`
* `#upcase` to convert `"all this"` back to `"ALL THIS"`
* `#reverse` to convert `"hello"` to `"olleh"`

Fun fact: Strings made with the backtick characters `` ` `` (which is usually located on the same key as the tilde `~`) are actually interpolated and run by your operating system, so in IRB if you type ``> puts `ls` `` on a mac, it will actually output your directory contents!

What about all the times you may want to **Search For or Replace Within Strings**?  For that, you need to begin understanding **Regular Expressions**, or "RegEx"'s.  There's a handy method for strings called `#gsub(pattern, replace_with_this)`, which finds any occurrances of that pattern and replaces it with whatever you want:

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

* `#ljust` will let you pad your string with extra spaces (or any other character you choose) up until a specified total amount of characters, so `"hi".ljust(4) => "hi  "` and `"hi".ljust(6,"*") => "hi****"`.  It can be handy for prettying up some of your command line outputs.
* `#rjust` does the same thing but pushes your string to the right, e.g. `"hi".rjust(6) => "    hi"`
* `#center` is the same idea but it centers your string: `"hi".center(6,"!") => "!!hi!!"`

### Arrays

Arrays are almost as ubiquitous as strings.  You'll be working with them all the time to help store data, everything from the names of all your users to coordinates on a game board.  An array is an all-purpose bucket into which you can put pretty much anything.  

Here, you'll learn the basics of creating arrays, how to manipulate them in a dozen different ways, and some best practices for working with arrays.  Note that we'll be learning even more about how to dig around inside of arrays in a future lesson, so if you're excitedly waiting to better understand `#each`, `#map` and others like them, we're almost there!  If not... you will be.

There are tons of methods designed to help you poke around in or otherwise manipulate arrays and you'll be seeing plenty of them here. Don't worry if it starts to feel like you're having to remember too much stuff.  It can be helpful to make a cheat sheet for yourself to help remember but you'll end up using the same dozen or so methods again and again so you'll get them hammered in there pretty well.  As with many things in Ruby, if you forget the method name but think it should exist, just make a guess and try it and you'll probably be right.

**Arrays** begin life as empty containers waiting to be filled with objects or data.  As items are added, they stay in whatever spot you put them, which is good because then you know exactly where to find them later.  You can put anything in an array!  Numbers, strings, objects, symbols, haikus...

**Creating an Array** can happen in many different ways.  You can either create it empty, specify how many spaces it should have (still empty), or even **fill it with default values**:

    > a = Array.new     # 1
    => []               # see, it's empty
    > b = []
    => []               # still empty
    > c = Array[]       
    => []
    > d = %w{ I am not a crook }  # converts the string (no quotes) to an array
    => [ "I", "am", "not", "a", "crook" ]
    > empty_a = Array.new(5)
    => [nil, nil, nil, nil, nil]
    > full_a = Array.new(3, "hi")
    => ["hi", "hi", "hi"]

And remember, you can store pretty much anything in there, even other arrays:

    > full_b = [1, 4, 8, "hello", a]
    => [1, 4, 8, "hello", []]  # Cool, arrays inside arrays!

... *but don't do that!*  It's best to keep only ONE type of thing in your arrays or you'll have many headaches down the road because you'll almost always assume that there's only one type of thing in there.  Forget that you ever learned that arrays can hold different values.

**Accessing Items** is super easy, just start from `0` like you did with strings.  Just like with strings, you can start from the end of the array using negative numbers from `-1` and you can even grab ranges of values at a time:

    > arr = [1, 3, 5, 7, 2]   # favorite way to declare an array
    => [1, 3 ,5 ,7 ,2]
    > arr[0]
    => 1
    > arr[-1]
    => 2
    > arr[1..3]
    => [3, 5, 7]          # this returned an array!
    > arr.slice(1..3)
    => [3, 5, 7]          # same as using [1..3]
    > arr[1..200000]      
    => [3, 5, 7, 2]       # no error... silently cuts off at the end

**Modifying Items** is as simple as accessing them is... just set them equal to a value:

    > arr[0] = 42
    => 42
    > arr
    => [42, 3, 5, 2]      # changed it!
    > arr[0..2] = 99
    => 99
    > arr
    => [99, 2]            # wiped out several values, oops...

**Adding Arrays** is also done similarly to strings, by just mashing one onto the end of the other:

    > first = [1,2,300]
    => [1,2,300]
    > second = [7,8,9]
    => [7,8,9]
    > combined = first + second
    => [1,2,300,7,8,9]      # this is a NEW array

**Subtracting Arrays** is a bit different... think of the minus sign as saying "take away any and all values that are duplicated in the right array from the left array". The only values remaining will be those from the left that were not included in the right side at all:

    > [1,2,3] - [2,3,4]
    => [1]                # the 4 did nothing
    > [2,2,2,2,2,3,4] - [2, 5, 7]
    => [3,4]              # it killed ALL the 2's

You'll find yourself adding arrays a lot more frequently than subtracting them but it's good to know both.

If you want to find values in **Both** arrays, check their union using the ampersand `&`:

    > [1,2,3]&[2,4,5]
    => [2]

What if you only want to add or subtract one single value?  That's a very common operation with arrays, and Ruby has provided four handy methods that let you either pluck away or add onto the front or back of the array.  First, the more common is to add or remove stuff from the END of the array, using `#push` or `#pop`:

    > my_arr = [1,2,3]
    => [1,2,3]
    > my_arr.push(747)
    => [1, 2, 3, 747]
    > my_arr
    => [1, 2, 3, 747]     # warning: we modified my_arr!!!
    > my_arr.pop
    => 747
    > my_arr.pop
    => 3
    > my_arr
    => [1, 2]          # warning: pop also modified my_arr

What if you want to take the item off the FRONT of the array?  This is less common.  For that, use the similar `#shift` and `#unshift` methods:

    > my_arr = [1,2,3]
    => [1,2,3]
    > my_arr.shift
    => 1
    > my_arr
    => [2,3]          # warning: shift also modified my_arr!
    > my_arr.unshift(999)
    => [999, 2, 3]
    > my_arr
    => [999, 2, 3]    # warning: unshift... yep, modified my_arr.

So the `#push`/`#pop`/`#shift`/`#unshift` methods should take you wherever you realistically need to go.  Although there's another handy method you should be aware of, the **Shovel Operator**, aka `<<`.  This method is *almost* identical to push, since it just jams whatever's to its right into the array:

    > my_arr = [1,2,3]
    => [1,2,3]
    > my_arr << 3
    => [1, 2, 3, 3]
    > my_arr << [4,5]
    => [1, 2, 3, 4, [4, 5]]   # Array within array alert!

For now, just think of it as the cool way of pushing onto an array.  But note that `<<` is often overridden (like in Rails), and so it pays to be mindful of exactly what flavor of `push`ing you're doing.

**Deleting Items** from an array should be done carefully because, if you're deleting items inside a loop or something like that, it will change the index of the other items and you'll need to anticipate this or live to regret it.  Delete an item at a specific index using `#delete_at`, which is sort of like `pop`ing but from anywhere you want:

    > my_arr = [1,2,3]
    => [1, 2, 3]
    > my_arr.delete_at(1)
    => 2
    > my_arr
    => [1,3]

If you want to clear out the whole array, you can use `#clear` or, more easily, just set it equal to []:

    > my_arr = [1,3,5]
    => [1,3,5]
    > my_arr.clear
    => []
    > my_arr = [1,3,5]
    => [1,3,5]
    > my_arr = []           # better
    => []                   

See if an array **includes an item** AT ALL by using `#include?`, which, as you should see from the `?` at the end, returns true or false:

    > my_arr.include?(3)
    => true
    > my_arr.include?(132)
    => false

To find WHERE a specific item lives in the array, use `#index` but note that it only returns the FIRST instance of this (and then gives up. Lazy method.):

    > my_arr.index(3)
    => 2
    > [1,2,3,4,5,6,7,3,3,3,3,3].index(3)
    => 2                  # Just the index of the FIRST match
    > my_arr.index(132)
    => nil                # Not an error, just nil

**A few useful and commonly used methods:**

* `#max` to find the **biggest value** of an array
* `#min` to find the **smallest value** of an array
* `#uniq` to **remove all duplicates** from your array
* `#size` to find out **how big the array is**
* `#shuffle` will mess up your whole array by putting it in **random order**
* `#sort` will clean it up again for you by putting your array **in order**.  Though `#sort` is pretty self-explanatory in the simple case, it can actually take parameters to let you decide if you want to sort things using a different (or reverse) methodology.
* `#sample` picks out a totally random value from the array... good for gambling games!
* `#first` gives you the first item (but doesn't remove it, so it's same as `[0]`) but can be more descriptive of your code's intent.
* `#last` is same as `[-1]`

Do as I say and not as I do: name your arrays with the plural form (because it has a bunch of things in it, like `colorful_bugs` instead of `colorful_bug`) and be descriptive.  No one likes to try and figure out what `array1` or `a` contains... stick with `colorful_bugs`  I just kept them short here because they're tiny examples.  Someone should rename them all.

Strings are a lot like arrays... so much so that we can even **Convert an Array into a String**! Just use `#join` and tell it what, if anything, you want in between each element (the "separator"):

    > ["he", "llo"].join
    => "hello"
    > colorful_bugs = ["caterpillar", "butterfly", "ladybug"]
    => ["caterpillar", "butterfly", "ladybug"]
    > "I found a #{colorful_bugs.join(' and a ')} in the yard!"
    => "I found a caterpillar and a butterfly and a ladybug in the yard!" 

Want to know a cool way to make an array?  Create it from a `Range` and just **Convert it to an Array**:

    > my_awesome_array = (1..6).to_a
    => [1,2,3,4,5,6]

**Advanced stuff** (you don't need to know this right now):

Remember how we could create a new array and fill it up with stuff using `Array.new(5, "thing")`?  `Array.new` also takes an optional argument that is a block and it will run that block every time it needs to populate a new element.  Woah! We got a bit ahead of ourselves, but it's a cool feature to have floating in the back of your head.

    > Array.new(5){|item_index| item_index ** 2}
    => [0, 1, 4, 9, 16]    # It squared each index to populate the array!

### Hashes

Hashes may be a bit intimidating at first but they're actually pretty similar to arrays.  They're basically just containers for data, like arrays, but instead of storing data based on numeric indices, you use "keys" which can be strings or symbols.  This makes hashes more appropriate for storing data with a bit more depth to it.

A *Hash* is just a container for data where each piece of data is mapped to a *Key*.  The data is called the *Value*.  Keys can be either strings or symbols. Values can be anything, just like with arrays.  A hash looks almost like an array, but with squiggly braces `{}` instead of hard ones `[]`  There's no order to a hash (unlike an array)... you're accessing your data using strings anyway so it doesn't matter which order they're in.

Make a new hash using several methods:

    > my_hash = Hash.new
    => {}
    > my_hash = {}        # easier way
    => {}

You store data in a hash by matching a key with a value.  Use the **Hash Rocket** `=>` (not to be confused with the same symbol in our IRB examples which denotes the IRB output) if you're creating the hash, or just index into it like an array using hard brackets `[]`:

    > favorite_colors = { "eyes" => "blue", "hair" => "blonde"}
    => {"eyes"=>"blue", "hair"=>"blonde"}
    > favorite_colors["eyes"]
    => "blue"

**Change Data** in a hash just like an array, by indexing into it and assigning a new value.  Unlike an array, to create a new data item, just pretend it already exists and assign it a value:

    > favorite_colors["eyes"] = "green"       # Changing an item
    => "green"
    > favorite_colors
    => {"eyes"=>"green", "hair"=>"blonde"}
    > favorite_colors["skin"] = "suburned"    # Adding a new item
    => "sunburned"
    > favorite_colors
    => {"eyes"=>"blue", "hair"=>"blonde", "skin"=>"sunburned"}

**When might you use a hash**?  Hashes are useful for lots of reasons behind the scenes, but it should be immediately obvious that you can handle more nuanced data than you can with arrays.  How about a dictionary of words?  Just store the words as keys and the meanings as values, if you so choose.

When you're writing a program that needs to keep track of an object that has several different attributes but isn't terribly complex, a hash can be a perfect solution to avoid using a bunch of different variables to store the same data:

    player_health = 100
    player_name = "Player1"
    player_speed = 7

or, better:

    player = { "health" => 100, "name" => "Player1", "speed" => 7}

You see hashes all the time in Rails, including as a way of passing options or parameters to a method (since they can store all kinds of different things and be variably sized), and these are often called **Options Hashes**.  Methods are often defined along the lines of `def method_name arg1, arg2, arg3, options_hash`, allowing the user to specify any number of different parameters for that method.  

Note that, when calling a method, if a hash is the last argument you are entering, *you can skip the squiggly braces*.  It's convenient, but can be a real head-scratcher for beginners who are trying to read code and wondering why there are methods being called with strangely mixed inputs and no braces:

    > some_object.some_method argument1, argument2, :param1 => value1, :param2 => value2

Or, how about a real version in Rails?  The `link_to` helper creates a link on the webpage and you can optionally assign it an ID and class (among other things like class and title attributes) by passing that in to the options hash:

    > link_to "click here!", "http://www.example.com", :id => "my-special-link", :class => "clickable_link"

If you recall our discussion from Strings, we use symbols as keys for hashes more often than not.

    > favorite_smells = { :flower => "daffodile", :cooking => "bacon" }
    => { :flower => "daffodile", :cooking => "bacon" }

**Delete** from a hash by just setting the value to `nil` or by calling the `#delete` method:

    > favorite_smells[:flower] = nil
    => nil
    > favorite_smells
    => {:cooking => "bacon" }             # one deleted...
    > favorite_smells.delete(:cooking)
    => "bacon"
    > favorite_smells
    => {}                                 # ...and the other.

That's all pretty straightforward.  What if we want to **add two hashes together**?  Just use `#merge`.  If there are any conflicts, the incoming hash (on the right) overrides the hash actually calling the method.

    > favorite_beers = { :pilsner => "Peroni" }
    => { :pilsner => "Peroni" }
    > favorite_colors.merge(favorite_beers)
    => {"eyes"=>"blue", "hair"=>"blonde", "skin"=>"sunburned", :pilsner => "Peroni"}       # okay, that's getting silly now...

If you want to know what **All the Keys** are (more common) or **All the Values** are (less common) in a hash, just use the aptly named `#keys` and `#values` methods to spit them out as an array:

    > favorite_colors.keys
    => ["eyes", "hair", "skin", :pilsner]  
    > favorite_colors.values
    => ["blue", "blonde", "sunburned", "Peroni"]

A simpler kind of hash is called a **Set**, and it's just a hash where all the values are either True or False.  It's useful because your computer can search more quickly through this than an array trying to store the same information due to the way it's set up behind the scenes.  You'll encounter them in some of the exercises later.

### Other Random Stuff

So **What is `nil`?** It represents nothing... literally.  Before you assign a value to something, it starts as `nil`, for instance an item in an array or a variable:
    
    > my_arr = []
    => []
    > my_arr[3]
    => nil          # hasn't been assigned yet

Sometimes you want to know if a value or variable is `nil` before doing something (because otherwise the operation would throw a bunch of errors at you).  Use the method `nil?` to ask whether it's nil or not beforehand.

    > nil.nil?
    => true
    > [].nil?
    => false        # Waitasecond....

Why is `[]` not nil?  The array itself exists so it isn't nil... it just happens to contain no values yet so it's empty.  If we asked for the first value of that array using `[][0].nil?`, that would be `true`

If you try to run a method on something that is `nil`, which you will inevitably do many many times by accident, you'll get the familiar `NoMethodError`:

    > user_i_looked_up_but_was_not_found_so_is_nil.empty?
    => NoMethodError: undefined method `empty?' for nil:NilClass

**`#blank?` and `#empty?`** are similar -- both basically check if the object has nothing in it -- but `#blank?` will also ignore any whitespace characters.  *Note that `#blank?` is a method provided by Rails and is not available in Ruby*.

We've seen lots of `#puts` so far but you've probably also run across `p`  **What's the Difference?**  `p` will give you some more information because it runs the `#inspect` method on the object while `#puts` runs the `#to_s` method.  **`#inspect`** is meant to be informative where `#puts` is "pretty".  The difference may not be readily apparent while you're only working with simple objects like strings and arrays, but you'll notice it when you start creating your own objects and you want to see what's inside (without typing out `puts my_object.inspect`).

`=` is an **Assignment Operator** but there are a few others that are interesting and common shorthands as well:
* `a += b` is the same as `a = a + b`
* `a -= b` is the same as `a = a - b`
* `a *= b` is the same as `a = a * b`
* `a /= b` is the same as `a = a / b`
* `a %= b` is the same as `a = a % b`
* `a **= b` is the same as `a = a ** b`

**Parallel Assignment** is when you assign the values of more than one variable at a time (though it works for arrays as well!):

    > a, b = 1, "hi"
    => [1, "hi"]      # ignore this output
    > a
    => 1
    > b
    => "hi"
    > my_array = [1,2,3,4]
    => [1,2,3,4]
    > my_array[1], my_array[3] = 100, 200
    => [100,200]      # ignore
    > my_array
    => [1,100,3,200]

It's also a great way to **Swap Two Variables**:

    > a = 10
    > b = 20
    > a,b = b,a
    > a
    => 20
    > b
    => 10

### That's it!

I know it was a long section, but you probably learned all kinds of things and you'll probably even remember some of it!

## Test Yourself

1. Make sure you can do the [Beginner Ruby Quiz #1](http://www.codequizzes.com/topics/24/quizzes/75) from [Code Quizzes](http://www.codequizzes.com/).
2. Make sure you go back up and look at all the questions from the "You Will Need To Understand" section.  See if you can do most of them without looking back through the text.

## Additional Resources

* If you still don't understand certain topics or don't like my summary, look them up in the [Bastard's Book](http://ruby.bastardsbook.com/chapters/)
* Don't forget about the [Ruby Monk](http://rubymonk.com/) exercises from back in Web Development 101!
* Read [Learn Ruby the Hard Way Chapters 1-5](http://ruby.learncodethehardway.org/book/ex3.html) for a basic treatment of numbers.
* Read [Zetcode's Data Types section](http://zetcode.com/lang/rubytutorial/datatypes/) for a bit more depth on the subject.
* [Alex Chaffee's brief writeup on Objects](http://codelikethis.com/lessons/learn_to_code/objects)
* [Ruby Inheritance](http://rubylearning.com/satishtalim/ruby_inheritance.html)
* If you prefer video, Treehouse has a [free video on numbers](http://teamtreehouse.com/library/programming/ruby-foundations/numbers/creating-numbers)
* Read [Zetcode's Strings section](http://zetcode.com/lang/rubytutorial/strings/) for an in-depth look at strings.
* Read through (and watch the video) for this [Regular Expressions in Ruby](http://net.tutsplus.com/tutorials/ruby/ruby-for-newbies-regular-expressions/) explanation.
* Read the [zetcode Arrays chapter](http://zetcode.com/lang/rubytutorial/arrays/) for some more in-depth knowledge.  Don't worry too much where they talk about blocks or the `select`, `collect` and `map` methods, we'll cover that in a later section.
* Read [Zetcode's Hashes section](http://zetcode.com/lang/rubytutorial/hashes/) for some more depth on hashes.  Again, don't worry too much about `map` and other block-taking functions.
* [Nil vs Empty vs Blank](http://stackoverflow.com/questions/885414/a-concise-explanation-of-nil-v-empty-v-blank-in-ruby-on-rails)
* [p vs puts in Ruby](http://stackoverflow.com/questions/1255324/p-vs-puts-in-ruby)