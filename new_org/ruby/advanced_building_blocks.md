# Advanced Building Blocks

*Estimated Time: 10-15 hrs*

This lesson gets more into the topics you may have been shakey on before like *Control Flow, Looping, Arrays, Hashes, Blocks, Sorting*.  It's definitely got some more meat to it than the previous one.  The projects in the Assignment section are good for doing on your own because Codecademy gives you all kinds of help with them.  

Just like the Building Blocks lesson, this one will contain a healthy "Special Summary" section to make sure you've been able to get everything covered.

## You Will Need To Understand:

**Note:** This is again a long list of things to understand!  Read through the list, breathe deep, do the assignment, read the Special Summary section and then come back to them.

* Conditionals and Flow Control

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

* Iteration

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
    * How to you skip to the next iteration of a loop?
    * How would you start the loop over again?
    * What are the (basic) differences between situations when you would use `while` vs `#times` vs `#each`?
    * What does nesting loops mean and when would you use it?

* Blocks, Procs, and Lambdas:

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

* Enumerable and Modules

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

* Writing Methods

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

## Your Assignment

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

## A Special Summary

This special section again provides a plain-english summary of all the key concepts.

### Looping and Flow Control

You'll need to understand which types of things Ruby considers "true" and which ones it considers "false".  **"Truthiness" and "Falsiness"** are ways of saying "what evaluates to true?"" and "what evaluates to false"?  In many languages, there is some nuance to that question.  In Ruby, it's simple: `nil` and `false` are false and that's it.  Everything else is "truthy".

An `if` statement is pretty straightforward too.  Supply a condition and, if it's true (or truthy!), the code will be executed.  If you supply an `else` clause, then that code is executed otherwise.  Everything proceeds normally from that point forward.  Remember that the parentheses are implicit.

    if some_variable.is_a?(String)
        # do some code if some_variable is a string
    else
        # this code will not run unless the variable is NOT a String
    end

`unless` is the opposite of `if` (which should make sense from the english of it).  So it will jump into the included code... UNLESS the statement is `true`  You can also have an `else` clause, though it's less common because then you need to scratch your head to think about it so your code gets a bit less readable. 

    unless home_team.won_the_super_bowl?
        puts "I need to drown my sorrows in ice cream"
    end

Want some more Ruby awesomeness?  Put your `if` and `unless` statements in a single line, and in any order you want:

    if current_user.is_a?(Vampire) dispatch_vampire_hunters

...works just as well as:

    dispatch_vampire_hunters if current_user.is_a?(Vampire)

Use **Comparison Operators** as the building blocks to construct your conditional statements.  There are some simple ones that you should already be familiar with: `==, <, >, >=, and <= `  `!=` is "not equal".

The **Spaceship Operator** `<=>` is a special one that comes up because it actually gives three different possible outputs depending on whether the left side is greater than, less than, or equal to the right side.  

    > 1 <=> 1000
    => -1
    > 1 <=> 1
    => 0
    > 1 <=> -1000
    => 1

The Spaceship can be useful because, like basically everything else, it's actually a method and you can override it in your own classes.  It's most commonly used in sorting methods.  Imagine that you created a `Person` class and you wanted to sort an array of `Person` objects.  You first have to teach Ruby how to compare two `Person`s by defining the `#<=>` method for the `Person` class:

    def Person
      def <=> (other_person)  # to compare two people, use last names
        self.last_name <=> other_person.last_name
      end
    end                 # now we can run people_array.sort, woohoo!

**Logical Operators** go one step beyond simple comparisons and let you start chaining together several comparisons into a single statement.  That lets you build more interesting and complex `if` statements.  The most common are:

* `&&` aka `and`, meaning both sides must be true for the full expression to evaluate to true
* `||` (the pipe symbol, usually on the same key as the backslash) aka `or`, meaning that if EITHER of the two sides is true, the expression is true (else false)
* `!` aka `not`, which reverses the expression from true to false or false to true

"In the wild" you'll probably see some complex or odd looking `if` statements.  The trick is to start breaking everything that looks like a conditional piece into what is evaluates to... either `true` or `false`  So what do you evaluate first?  Ruby logical expressions use a similar order of operations to normal math: left to right unless there are parentheses.

    > ( false || true ) && !(true && true ) 
    => false

**Ruby is Lazy** which means two things here: 

1. It will only evaluate far enough to determine that the expression is definitively true or false.  
2. It will return whatever is returned by the last part of the expression to get evaluated (instead of just a simple `true` or `false` it relies on that returned thing being truthy or falsey).  
 
That's important because we can actually use methods as part of our logical chains.  It means that methods on the left side of the expression get executed but the ones on the right may never get executed at all... a fact that many programmers (including you later) utilize to make their code nice and compact.

    > puts("this isn't important") || puts("THIS IS IMPORTANT!!!")
    "this isn't important"
    => nil  

What happened?  Ruby knows that it only needs one side of the `&&` to be false for the whole thing to be false, and since `puts` on the left already returned `nil` which is falsey, Ruby stopped evaluating the expression and the really important message never got displayed.

It returned `nil` instead of `false` because `&&` and `||` and the like don't just return `true` or `false`.. they return the result of the last expression to get evaluated, which was the `nil` from the `puts`.  For another example, `7 || nil` returns `7` (which behaves truthy) instead of `true` and `7 && nil` returns `nil` (which behaves falsey) instead of `false`  If this seems a bit much to swallow right off the bat, keep it in the back of your mind until you first see it in action then it will click.

`||=` is a sneaky expression that takes advantage of Ruby's natural laziness -- it basically expands to `thing_a || thing_a = thing_b`.  So if `thing_a` hasn't been set to anything, it becomes `thing_b`, otherwise it keeps its original value.  It's a bit complex and you don't need to know exactly why it works, but we'll go over it for completeness:

If `thing_a` hasn't yet been assigned to anything, it is `nil` and Ruby then checks the right side of the `||` to see if that might be true, which involves running the expression to set `thing_a` = `thing_b`.   If it has already been assigned a value, it just keeps that value like normal.  This is another sneaky trick used by programmers in situations like when you don't want to override whatever's already been set, but you want something to be there (like which url originally referred the user to your site)

You may have seen some oddly compact and strange looking statements that appeared to be `if` statements under the hood.  That's probably because they use the **Ternary Operator**, which is a shorthand notation for a simple `if` that separates the different parts using the `?` and `:` like:

`condition ? do_this_if_true : do_this_if_false`

So:

    > true ? puts "I like truth" : puts "not gonna happen"
    "I like truth"
    => nil

You can also nest `if` statements inside one another.  Sometimes it gets a little crazy and you find yourself 6 levels deep (and probably needing to rethink your strategy).  For those situations where you're really just checking to see if something equals any one of a number of clear but different options, a **`case`** statement can be a good substitute.  It basically lets you construct a chain of logic that says "if `x` equals `option_a`, do this, if it equals `option_b`, do this, if it equals `option_c`, do this... and otherwise do this."

    case current_user.energy   # Assume it's an value 1-3
    when 3
        puts "Go run a marathon!"
    when 2
        puts "Go for a walk."
    when 1
        puts "Go take a nap"
    else
        puts "You're only supposed to have energy of 1,2 or 3..."

### Iteration

You can assemble code, tell the program which parts of it to execute, and wrap it all up in a method.  There's still something missing... what if you want to make something happen a whole bunch of times?  You certainly don't just run the method again and again manually.  Luckily we've got several standard ways of iterating through a piece of code until we tell the program to stop.

You should understand the basic iterators `for` and `while` and understand how to use `#each` and `#times`.  We'll talk more about blocks and the other Ruby iterators like `#map` and `#select` in the next sections, so it should be more obvious how `#each` and `#times` work after reading that.

A loop is really just code that will run a number of times until some condition is met.  A variable is typically used to keep track of which iteration you are on or to otherwise increment until the condition is reached.  This is called the **index variable**.

`loop` is the most basic way to loop in Ruby and it's not used all that much because the other ways to loop are much sexier.  `loop` takes a block of code, denoted by either `{ ... }` or `do ... end` (if it's over multiple lines).  It will keep looping until you tell it to stop using a `break` statement:

    > loop { puts "this will not stop until you press CTRL+c" }
    this will not stop until you press CTRL+c
    this will not stop until you press CTRL+c
    ... and so on

    > i=0                   # Our index variable
    > loop do
    >   i+=1
    >   print "#{i} "
    >   break if i==10
    > end
    1 2 3 4 5 6 7 8 9 10 => nil

`while` performs a similar function but in a much more compact way, by allowing you to specify the condition that must be true to keep looping, and you'll find yourself using it much more in your own code.  It doesn't actually take a formal block of code, just runs everything until it reaches its `end`.  

Just remember to declare the variable(s) you'll be using (or they'll get reset with each iteration) and to increment at some point (or you'll get stuck in an infinite loop... use ctrl+c to break in Terminal):

    > i=1
    > while i < 5
    >   print "#{i} "
    >   i+=1
    > end
    1 2 3 4 => nil

`until` is almost identical to `while` but, instead of running as long as the specified condition is `true`, it runs as long as the condition is `false`

**`for`** is a looping mechanism present in lots of other languages but it gets de-emphasized in Ruby and you don't see it used much.  A common use is to loop over every number in a range.  You name the variable that holds the current number at the top and can then access it from inside the loop:

    > for a_number in (1..3)
    >   print "#{a_number} "
    > end
    1 2 3 => 1..3

Things get more interesting when you realize that most of your loops will probably involve looping over each element in either an array or a hash of items.  Ruby knows this and made it super easy for you by specifying the `#each` method that you call directly on that array or hash.  `#each` will automatically pass whichever item it is currently on into your code block.  That item will be named whatever name you specify inside the pipes `| name_goes_here |`:

    > guys = ["Bob", "Billy", "Joe"]
    > guys.each do |current_name|    # better to call it just "name" in your code
    >   print "#{current_name}! "
    > end
    Bob! Billy! Joe! => ["Bob", "Billy", "Joe"]  # returns original array

Many other loops are just you trying to do something a certain number of times (which was the case in our `for` loop example).  In that case, Ruby has the simplest possible method for you: `#times`.  If you pipe in an argument, it will take the value of the current iteration (starting from zero):

    > 5.times do |jump_num|
    >     print "Jump #{jump_num}!"
    > end
    Jump 1!Jump 2!Jump 3!Jump 4!Jump 5!=> 5

A couple other methods with similar purposes to `#times` that you see less frequently:

* `#upto`, as in `1.upto(4) { |current_number| ...some code... }`, just like `#times` but you choose the starting and ending point instead of always starting at zero.
* `#downto`, similar to `#upto` but... down... to....

Your best friends early on will be `while` for anything that needs to run until a certain condition is reached (like winning the game), `#each` for any time you want to do stuff with every item in an array or hash, and `#times` for the simple cases when you just want to do something a fixed number of times.  

Because you may want some additional control over your loops, use these statements to jump in and out of them for certain abnormal conditions:

* `break` will **stop the current loop**.  Often used with an `if` to specify under what conditions to do that.
* `next` will **jump to the next iteration**.  Also usually used with an `if` statement.
* `redo` will let you restart the loop (without evaluating the condition on the first go-through), again usually with some condition
* `retry` works on most loops (not `while` or `until`) similarly to `redo` but it *will* re-evaluate the condition before running through the loop again (hence *try* instead of *do*).
* NOTE: Do NOT use `return` to exit a loop, since that will exit the whole method that contains it as well!

**Nesting** loops occurs when one goes inside another, so you execute the entire inner loop for each iteration of the outer loop.  You'll see those for "two-dimensional" problems, like searching through arrays within arrays, but if you find yourself nesting too often or too deeply, you probably need to reexamine how you've structured your solution overall.  

Here's an example that goes through the comments in a hypothetical blog and captures a preview from each of them.  It uses some Rails methods to get the posts and comments then loops to tease out the previews:

    def comment_previews
      comment_previews = []
      posts = Post.all              # array of all blog posts
      posts.each do |post|
        comments = post.comments    # array of that post's comments
        comments.each do |comment|
          comment_previews << comment[0..80] 
        end
      end
      comment_previews
    end

### Closures (Blocks, Procs, Lambdas, and Methods)

One of the most confusing parts of learning basic Ruby (until your AHA! moment) is understanding what blocks are and how they work, mostly because it's something you probably haven't ever seen before.  It shouldn't be, because they're actually pretty simple.  You've already seen them before, whether it's using them yourself during the prep work or most recently in the section on iteration, where they came up as inputs to some of the iterators.  

Here, you'll learn more about blocks and also about their lessor known cousins, Procs, lambdas and Methods.  By the end, you should be comfortable working with blocks and writing your own methods that take them.  You should understand when you may need to use a Proc instead and the basics of the other two options -- lambdas and Methods -- .

Blocks are just chunks of code that you can pick up and drop into another method as an input.  They're often called "anonymous functions" because they have no name but behave much like functions.  They're like little helper functions... you don't find blocks just hanging around without some method (like `#each`) using them.  

You **declare a block** using squiggly braces `{}` if it's on one line or `do ... end` if it's on multiple lines (by convention... you can use either one if you really want):

    > [1,2,3].each { |num| print "#{num}! " }
    1! 2! 3! =>[1,2,3]
    > [1,2,3].each do |num|
    >    print "#{num}!"
    > end
    1! 2! 3! =>[1,2,3]         # Identical to the first case.

Just like methods, some blocks take inputs, others do not.  Some return important information, others do not.  Blocks let you use the implicit **return** (whatever's on the last line) but NOT `return`, since that will return you from whatever method actually called the block.

Blocks are used as arguments to other methods (like `#each`), just like the normal arguments that you see between the parentheses... they just happen to always be listed last and on their own because they tend to take up multiple lines.  Don't think of them as anything too special.  The `#each` method isn't special either, it's just built to accept a block as an argument.

How does `#each` take a block then?  Through the magic of **the `yield` statement**, which basically says "run the block right here".  When you write your own methods, you don't even need to specially declare that you'd like to accept a block.  It will just be there waiting for you when you call `yield` inside your method.  

`yield` can **pass parameters to your block** as well.  See this made-up version of the `#each` method to get an idea of what's happening under the hood.  We'll put this method into the Array class so you can call it directly on an array (like `[1,2,3].my_each`) instead of having to take the array as an argument like `my_each([1,2,3])`:

    class Array 
      def my_each
        i = 0
        while i < self.size
            yield(self[i])  
            i+=1      
        end
        self
      end
    end

As you can see, we iterate over the array that our `#my_each` method was called on (which can be grabbed using `self`).  Then we call the block that got passed to `#my_each` and pipe in whatever member of the original array we are currently on.  Last, we just return the original array because that's what `#each` does.  We would run it just the same way as `#each`:

    > [1,2,3].my_each { |num| print "#{num}!" }
    1! 2! 3! => [1,2,3]

Which operates in that case just like all these lines:

    class Array
      def my_each
        i = 0
        while i < self.size
            print "#{self[i]}!"   # Our block got "subbed in" here
            i+=1
        end
        self
      end
    end

So one reason blocks are great is because you can write a sort of generic method like `#each` which wraps your block in code that says what to do with it.  Another use case is when creating methods where you want to optionally be able to override how they "work" internally by supplying your own block -- `#sort` lets you supply your own block to determine how to actually order the items of the array if you want to!

If you want to **ask whether a block was passed** at all (to only yield in that case), use `#block_given?`, or rather: `yield if block_given?`

A lot of beginners just blindly take it on faith that `#each` and `#map` and `#select` etc. all work the way they do.  You're more skeptical than that, which is good.  They're really quite simple and you'll get a chance to build your own soon enough.

What if you want to pass TWO blocks to your function?  What if you want to save your block to a variable so you can use it again later?  That's a job for **Procs**, aka Procedures!  Actually, a block *is* a Proc (which is the class name for a block) and they rhyme just to confuse you.  The block is sort of like a stripped-down and temporary version of a Proc that Ruby included just to make it really easy to use things like those `#each` iterators.  A Proc is just a block that you save to a variable, thereby giving it a bit more permanence:

    > my_proc = Proc.new { |arg1| print "#{arg1}! " }

Use that block of code (now called a Proc) as an input to a function by prepending it with an apersand `&`:

    > [1,2,3].each(&my_proc)
    1! 2! 3! =>[1,2,3]

It's the same as passing the block like you did before!  

When you create your own function to accept procs, the guts need to change a little bit because you'll need to use `#call` instead of `yield` inside (because which proc would `yield` run if you had more than one?).  `#call` literally just runs the Proc that is called on.  You can give it arguments as well to pass on to the Proc:

    > my_proc.call("howdy! ")
    howdy! => nil

Most of the time, using a block is more than sufficient, especially in your early projects.  Once you start seeing the need for using a Proc (like passing multiple arguments or saving it for later as a callback), you'll have Procs there waiting for you.  

Blocks and Procs are both a type of "closure".  A closure is basically a formal, computer-science-y way of saying "a chunk of code that you can pass around but which hangs onto the variables that you gave it when you first called it".  It's the blanket term used to refer to blocks and Procs and...

There are two other similar closure to be aware of but about which you certainly don't need to be an expert because they're used in less typical applications.  The first of these is a **lambda**.  If Procs are sort of a more-fleshed-out version of blocks, then lambdas are sort of a more-fleshed-out version of Procs.  They are one step closer to being actual methods themselves, but still technically count as anonymous functions.  If you're coming from Javascript, anonymous functions shouldn't be anything new to you.

Just to focus on the differences between lambdas and Procs, a lambda acts more like a real method.  What does that mean? 

* A lambda can return multiple things easily because you can safely use the explicit `return` statement inside of one (it will only return from the lambda and not the enclosing method, which is what happens if you use `return` inside a block or Proc).  
* Lambdas are also much stricter than Procs about you passing them the correct number of arguments.

Here's a simple example to show you the syntax of a lambda (btw, there's nothing special to lambdas about placing the `#call` after the `end`, if you hadn't seen that done before, it's just like method chaining):

    > lambda do |word| 
    >   puts word
    >   return word            # you can do this in lambdas not Procs
    > end.call("howdy! ")
    howdy! => "howdy! "        # not nil because we gave it a return

The second additional closure is called a **Method** because, well, it's the closest of the four (blocks, Procs, lambdas, and Methods) to an actual method.  Which it is.  "Method"'s (capitalized because they're actually a class of their own) are really just a convenient way to pass a normal method to another normal method by wrapping the symbol of its name in the word `method()`  So what? To use the same example as we have been so far:

    class Array
      def my_each(some_method)
        i = 0
        while i < self.size
          some_method.call(self[i])
          i+=1
        end
      end
      self
    end

    def print_stuff(word)
      print "#{word}! "
    end

    > [1,2,3].each(method(:print_stuff))    # symbolize the name!
    1! 2! 3! => nil

TADA! We've now gotten our worthless array (and a "howdy") printed out 4 different ways, each seemingly less useful than the last!  Fear not.  Learn your blocks cold and have a good handle on Procs (which should be easy since they're basically the same thing) but just keep lambdas and Methods in the back of your head for much later.

So...

* **Blocks** are unnamed little code chunks you can drop into other methods.  Used all the time.
* **Procs** are identical to blocks but you can store them in variables, which lets you pass them into functions as explicit arguments and save them for later. Used explicitly sometimes.
* **Lambdas** are really full methods that just haven't been named.  Used rarely.
* **Methods** are a way of taking actual named methods and passing them around as arguments to or returns from other methods in your code.  Used rarely.
* **Closure** is just the umbrella term for all four of those things, which all somehow involve passing around chunks of code.

### Enumerable Methods

You've learned about `Array` and `Hash` but only got half the story... they each have their own methods for adding and deleting and accessing data and they both implement their own version of the `#each` method to iterate over their items but what makes them really powerful in Ruby is the ability to use `Enumerable` methods as well as the basic ones you've just learned.  

"Enumerable" is actually a "module", which means it is just a bunch of methods packaged together that can (and do) get "mixed in", or included, with other classes (like `Array` and `Hash`. That means that Ruby programmers don't have to write all those methods many different times - they just write them once, package them up as `Enumerable`, and tell `Array` and `Hash` to include them.  As long as the class that wants to include `Enumerable` has its own `#each` method that `Enumerable` can use, it can get access to all the magic and joy of using the `Enumerable` methods by simply mixing it in.

In this case, `Enumerable` contains really useful methods like `#map` and `#each` and `#select` that you've seen before and you'll use again and again so our goal with this section is to get well acquainted with them.

`Enumerable` gives you lots of useful ways of doing something to every element of a collection object (an array or hash, for instance), which is a very common thing to do when you're building programs and websites.

`#each` is an iterator method you've seen plenty of times before now that comes pre-packaged with the Array and Hash and Range classes and it basically just goes through each item in the object you called it on and passes it to the block that you specified.  It will return the original collection that it was called on:

    > [1,2,3].each { |num| print "#{num}! " }
    1! 2! 3! => [1,2,3]

Sometimes you also want to know what position in the array you are... so that sounds like a good chance to use Enumerable's `#each_with_index`, which will pass that position into the block as well:

    > ["Cool", "chicken!", "beans!", "beef!"].each_with_index do |item, index|
    >   print "#{item} " if index%2==0
    > end
    Cool beans! => ["Cool", "chicken!", "beans!", "beef!"]

What if I want to keep only the even numbers that are in an array?  The traditional way would be to build some sort of loop that goes through the array, checks whether each element is even, and starts populating a temporary array that we will return at the end.  It might look something like:

    class Array
      def keep_evens
        result_array = []
        for num in self
          result_array << num if num % 2 == 0
        end
        return result_array
      end
    end

    > my_array = [1,2,3,4,5,6,7,8,100]
    > my_array.keep_evens
    => [2,4,6,8,100]

That's too much code and too much hassle.  When all you're doing is pulling out, or *selecting*, certain items based on some criteria, you'd be better served using Enumerable's `#select` instead.  It will run the block on every item of your object (whether array or hash or whatever) and return a new object that contains only those items for which the original block returned `true`:

    > my_array.select{|item| item%2==0 }
    => [2,4,6,8,100]      # wow, that was easy.

You win this round, Ruby.  What if instead of selecting only a few items we want to keep all items but modify them somehow?  That sounds a lot like we're doing something and **collect**ing the results, doesn't it?  `#collect` will run your block and give you an object filled with whatever your block returned each time.  Ruby says:

    > my_array.collect{|num| num**2 }
    => [4,16,36,64,10000]

You've heard of `#map`?  It's the EXACT same method as collect, just called something different.  Some people visualize it in their heads as doing something and collecting the results, other people see it as re-mapping your original object through some sort of transformation.  It's more conventional to use `#map` but both work the same way.  

Here's a theoretical example more like what you might see when you've got your own website built using Rails, where we may want to send only an array filled with our users' emails out to the webpage:

    u = User.all
    @user_emails = u.map { |user| user.email }

You can also use these methods on hashes as well, just remember that now you have two inputs to work with for your block:

    > my_hash = {"Joe" => "male", "Jim" => "male", "Patty" => "female"}
    > my_hash.select{|name, gender| gender == "male" }
    => {"Joe" => "male", "Jim" => "male"}

**Enumerable Iterators Cheat Sheet**

* `#each` returns the original object it was called on because it's really used for its side effects and not what it returns
* `#each_with_index` passes not just the current item but whatever position in the array it was located in.
* `#select` returns a new object (e.g. array) filled with only those original items where the block you gave it returned `true`
* `#map` returns a new array filled with whatever gets returned by the block each time it runs. 

Up until now, all the methods we've seen run essentially independent operations on each element of our array or hash.  What if we want to do something that keeps track of the result as we iterate?  Like, say, summing up the elements of an array?  

For that we need to use `#inject` (aka `#reduce`), which passes not just the element but whatever was returned by the previous iteration into the block.  You can either specify the initial value or it will just default to the first item of the array.  It ultimately returns whatever the result of the last iteration is.  Here's a way to sum an array:

    > my_array.inject(0){|running_total, item| running_total + item }
    => 120

**Some Other Handy Methods**

Enumerable is a large bunch of methods and you'll only use a half-dozen of them regularly but there are some others that you should be familiar with as well.  The full list is available [in the docs here](http://ruby-doc.org/core-2.0/Enumerable.html).

* `#any?` returns true/false (see the question mark?) and answers the question, "do ANY of the elements in this object pass the test in my block?".  If your block returns true on any time it runs, `any?` will return true.
* `#all?` returns true/false and answers the question, "do ALL the elements of this object pass the test in my block?".  Every time the block runs it must return true for this method to return true.
* `#none?` returns true only if NONE of the elements in the object return true when the block is run.
* `#find` returns the first item in your object for which the block returns true.

**Awesome but less common methods**

* `#group_by` will run your block and return a hash that groups all the different types of returns from that block.  For example:
    
        > names = ["James", "Bob", "Joe", "Mark", "Jim"]
        > names.group_by{|name| name.length}
        => {5=>["James"], 3=>["Bob", "Joe", "Jim"], 4=>["Mark"]} 

* `#grep` returns an array with those items that actualy match the specified criteria (RegEx) (using a `===` match)

        > names.grep(/J/)
        => ["James", "Joe", "Jim"]

Some of the methods you've already seen and use are part of Enumerable too -- `#include?`, `#sort`, `#count` etc.

When you use the Enumerable methods, you'll sometimes see what's called an `enumerator` object pop up, usually if you forget to give them a parameter that they want like a block.  What the heck is that?

Consider it an implementation detail of Enumerator.  As we said before, the methods that are part of Enumerable rely on the underlying collections' `#each` method to work.  `enumerable` is basically a go-between for the original collection and Enumerator.
It's not really something you'll be using right off the bat but it's useful for gaining a better understanding of Enumerable.

### Writing Methods

You've been using methods since square one and writing your own as well so we'll focus on the essentials and the slightly more advanced stuff in this section, including how you actually run your code without needing to use IRB and some more stylistic issues that come up frequently.

What should you put into methods?  Pretty much everything should be in a method, but **each method should only do ONE thing**.  If it's doing two, it's time for another method.  If it's doing a dozen, you probably need to start thinking about having a separate class.  

Methods help organize your code by keeping you from repeating yourself.  Anything that you find yourself doing repetetively should probably go in its own method.

Methods also make your code much easier to read and debug, a fact that you'll appreciate when you write some horrendously complicated spaghetti code and it takes you longer to figure out what it is doing than how to debug the error message you're getting.  

Let's say you're building a game that uses an `until` loop to keep taking turns until someone has won.  But figuring out if someone has won takes several lines of code.  You really can't say `until ( 8 lines of code determining if anyone has one)`  Better to write a method called `#game_over?` that does the work, then you can simply and legibly write `until game_over?` and it's obvious what your code does.  

The `#game_over?` method probably needs to check if the human player has won or has lost, so maybe your `#game_over?` method just contains calls to two other methods, `#victory?` and `#loss?`  If you were debugging, it'd be very easy for you to go and find where the problem is if the player just can't seem to lose:

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

When **naming methods** the goal is to be descriptive but short.  Name based on what it will return or what the major intended side effect will be.  You shouldn't be missing any parts from the name because the method should only do one thing anyway.  If you can't tell what the method will return based on the name, you probably need a better name.  If your method name seems insanely long, your method may be trying to do more than one thing.  End with a question mark `?` if it will return true/false.  

What is `self`?  It's a word that you see a whole lot in Ruby and it's actually pretty simple... it refers to whatever object the current method was called on (the "caller").  So if I called `current_user.jump`, `current_user` is the caller of that method.  Inside the definition of the `#jump` method, `self` would refer to the current_user.  

That is incredibly useful because we create methods that could be called by any number of different objects so we need a way inside of that method to dynamically refer to whatever object called it.  You may see something like this, which I could call on a hypothetical `User` object in my web application:

    def full_name
      "#{self.first_name} #{self.last_name}"
    end   # Remember, this implicitly returns the string "firstname"

You're probably tired of running your methods in IRB (if that's what you're still doing) so it's time to learn how to break them out into a **separate script file** which you can then run in its entirety from the command line.  It's easy -- just create a file with the extension `.rb`, navigate to that file's directory from the command line, and run it using `$ ruby filename.rb` (the dollar sign is just the command prompt).  You'll be able to `gets` from and `puts` to the command line now!  

If you get tired of typing `ruby` in front of the file, you can tell your computer that the file is an executable one by using the `chmod` command. Just type `$ chmod +x your_filename.rb` once and you'll be able to execute it, but you now need to let the computer know that it should use the Ruby interpreter when running the file.  That requires you to include, at the very top the file (before any spaces or lines), a **Shebang Line** that points to your Ruby executable:

    #!/usr/bin/ruby

...or wherever it's located.

If you want to include a gem file (a library of methods, for instance) in your IRB session, you'll need to use `require` to bring it in.  The default directory for `require` accesses any gems you may have downloaded from the internet.  

You can do almost the same thing to bring your new script file into IRB (if you want to access its methods, for instance), though you have to explicitly provide the path to it.  If it's in your current directory, that's easy, it's just `./filename.rb`:

    > require './your_script.rb'
    => true

Now you can run methods and access variables from that file in IRB.  If you were to change and save your script file, to get those changes in IRB you can either reload IRB entirely or use **`load`** instead of `require`.  `require` will only load the file once, a feature designed to save you headache normally.  `load` will load it for you regardless.

    > load `./your_script.rb`
    => true

Another thing that you'll probably want to do at some point is to **access the variables that were passed to your script** from the command line.  For instance, if you ran:

    $ ruby ./string_printer_script "howdy" "everyone"

You've passed in "howdy" and "everyone".  You access it by digging into a special constant (a variable you shouldn't try to change) called `ARGV`, which is an array that contains all those arguments:

    # In our string_printer_script.rb file:
    inputted_strings = ARGV
    puts "You inputted: "
    inputted_strings.each do |str|
      puts "str"
    end

    $ ruby ./string_printer_script.rb "howdy" "everyone"
    You inputted:
    howdy
    everyone

A few other special constants you can access from within your script:

* `__FILE__` is the name of the current file.
* `$0` is the main or original file that was run (which could be different from your script if your script had just been `require`d by that original file).
* `$` (aka **`$LOAD_PATH`**) is an array that contains the "load path", or all the directories the interpreter searches through when it needs to find a file.

A trick you can sometimes use to check whether your script is being run from the command line or as part of a larger program, for instance if you want to `puts` some stuff only if it's called from the CL (to debug it maybe), is to check whether `$0` is the same as `__FILE__`:

    if $0 == __FILE__
      puts "I'm a command line script now!"
    else
      puts "Someone else is running me (I feel so violated...)"
    end

Stepping away from scripts for a minute, one nifty command that you probably haven't had a chance to run into yet is **`#send`**, which will let you run a method.  Simple.  Just call it on whatever object you'd normally run the method on.  Adapted from [the docs](http://ruby-doc.org/core-2.0/Object.html#method-i-send):

    class Klass
      def hello(string)
        "Hello #{string}"
      end
    end
    k = Klass.new
    k.send :hello, "gentle readers"   #=> "Hello gentle readers"

So simple, why should you care?  Ruby lets you define new methods in runtime and this lets you call them dynamically (since the method name is no longer hardcoded).  Keep that in your back pocket... you won't need it yet but it's great to know.

### That's it!

Another long summary section packed with information.  Don't worry if it doesn't all stick right away... You will learn by building stuff and having that strange feeling that you should know a method to make your life easier.  When that happens, you'll be back here to remind yourself what you've forgotten.

## Test Yourself

Make sure you can do the following quizzes from [Code Quizzes](http://www.codequizzes.com/).  They're pretty quick and should give you an idea of what you still need to brush up on.

2. [Beginner Ruby Quiz #2](http://www.codequizzes.com/topics/24/quizzes/76)
3. [Quiz #3](http://www.codequizzes.com/topics/24/quizzes/77)
4. [Quiz #4](http://www.codequizzes.com/topics/24/quizzes/78)
5. [Quiz #6](http://www.codequizzes.com/topics/24/quizzes/80) 

## Additional Resources

* Github Gist on [Truthiness](https://gist.github.com/jfarmer/2647362)
* See [these answers on the Spaceship Operator](http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator)
* Read [Zetcode's Flow Control section](http://zetcode.com/lang/rubytutorial/flowcontrol/) for more depth on flow control.
* If you want a bit more, check out [Skork's entry on Ruby looping and iterators](http://www.skorks.com/2009/09/a-wealth-of-ruby-loops-and-iterators/)
* [Understanding Blocks Procs and Lambdas](http://www.robertsosinski.com/2008/12/21/understanding-ruby-blocks-procs-and-lambdas/)
* [Writing your Own Methods](http://rubylearning.com/satishtalim/writing_own_ruby_methods.html)
* A quick guide on writing methods from [wikibooks](http://en.wikibooks.org/wiki/Ruby_Programming/Writing_methods)
* [Getting to Hello World](http://en.wikibooks.org/wiki/Ruby_Programming/Hello_world)
* [LRTHW chapters 13-14](http://ruby.learncodethehardway.org/book/)