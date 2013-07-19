## Conditionals and Flow Control
### Intro and Goals
Now you've got an understanding of what tools you can use and it's time to start thinking about how the Ruby interpreter moves through your code. Sometimes you want to execute a certain chunk of code, other times you don't.  In this section, you'll see the different ways of controlling the flow of your program.

### Thought Questions
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


#### Check These Out First
* Github Gist on [Truthiness](https://gist.github.com/jfarmer/2647362)
* Do the [Codecademy Control Flow Course (all sections)](http://www.codecademy.com/courses/ruby-beginner-en-NFCZ7)
* See [these answers on the Spaceship Operator](http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator)

#### A Brief Summary

You'll need to understand which types of things Ruby considers "true" and which ones it considers "false".  **"Truthiness" and "Falsiness"** are ways of saying "what evaluates to true?"" and "what evaluates to false"?  In many languages, there is some nuance to that question.  In Ruby, it's simple: `nil` and `false` are false and that's it.  Everything else is "truthy".

An `if` statement is pretty straightforward too.  Supply a condition and, if it's true (or truthy!), the code will be executed.  If you supply an `else` clause, then that code is executed otherwise.  Everything proceeds normally from that point forward.  Remember that the parentheses are implicit.

    if some_variable.is_a?(String)
        # do some code if some_variable is a string
    else
        # this code will not run unless the variable is NOT a String
    end

**`unless`** is the opposite of `if` (which should make sense from the english of it).  So it will jump into the included code... UNLESS the statement is `true`  You can also have an `else` clause, though it's less common because then you need to scratch your head to think about it so your code gets a bit less readable. 

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

The Spaceship can be useful because, like basically everything else, it's actually a method and you can override it in your own classes.  It's most commonly used in sorting methods.  Imagine that you created a `Person` class and you wanted to sort an array of `Person` objects.  You first have to teach Ruby how to compare two `Person`s by defining the `<=>` method for the `Person` class:

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

It returned `nil` instead of `false` because `&&` and `||` and the like don't just return `true` or `false`.. they return the result of the last expression to get evaluated, which was the `nil` from the `puts`  For another example, `7 || nil` returns `7` (which behaves truthy) instead of `true` and `7 && nil` returns `nil` (which behaves falsey) instead of `false`  If this seems a bit much to swallow right off the bat, keep it in the back of your mind until you first see it in action then it will click.

**`||=`** is a sneaky expression that takes advantage of Ruby's natural laziness -- it basically expands to `thing_a || thing_a = thing_b`  So if `thing_a` hasn't yet been assigned to anything, it is `nil` so the Ruby checks the right side of the || to see if that might be true.becomes `thing_b`  If it has already been assigned a value, it just keeps that value like normal.  This is another sneaky trick used by programmers in situations like when you want to  , you should be able to see that 

You may have seen some oddly compact and strange looking statements that appeared to be `if` statements under the hood.  That's probably because they use the **Ternary Operator**, which is a shorthand notation for a simple `if` that separates the different parts using the `?` and `:` like:

`condition ? do_this_if_true : do_this_if_false`

So:

    > true ? puts "I like truth" : puts "not gonna happen"
    "I like truth"
    => nil

You can nest `if` statements inside one another but sometimes it gets a little crazy and you find yourself 6 levels deep (and probably needing to rethink your strategy).  For those situations where you're really just checking to see if something equals any one of a number of clear but different options, a **`case`** statement can be a good substitute.  It basically lets you construct a chain of logic that says "if `x` equals `option_a`, do this, if it equals `option_b`, do this, if it equals `option_c`, do this... and otherwise do this."

    case current_user.energy   # Assume it's an value 1-3
    when 3
        puts "Go run a marathon!"
    when 2
        puts "Go for a walk."
    when 1
        puts "Go take a nap"
    else
        puts "You're only supposed to have energy of 1,2 or 3..."

#### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* Add Here!
* [||= on Stack Overflow](http://stackoverflow.com/questions/995593/what-does-or-equals-mean-in-ruby)

#### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*

1. TODO: What will these return? (check using IRB)
    * true/false
    * actual returns
