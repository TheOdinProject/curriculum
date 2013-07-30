## Enumerable
### Intro and Goals
You've learned about `Array` and `Hash` but only got half the story... they each have their own methods for adding and deleting and accessing data and they both implement their own version of the `each` method to iterate over their items but what makes them really powerful in Ruby is the ability to use `Enumerable` methods as well as the basic ones you've just learned.  

"Enumerable" is actually a `module`, which means it is just a bunch of methods packaged together that can (and do) get "mixed in", or included, with other classes (like `Array` and `Hash` That means that Ruby programmers don't have to write all those methods many different times - they just write them once, package them up as `Enumerable`, and tell `Array` and `Hash` to include them.  As long as the class that wants to include Enumerable has its own `each` function that Enumerable can use, it can get access to all the magic and joy of using the Enumerable methods by simply mixing it in.

In this case, `Enumerable` contains really useful methods like `map` and `each` and `select` that you've seen before and you'll use again and again so our goal with this section is to get well acquainted with them.

### Thought Questions
* What is a module?
* Why are modules useful?
* What does `each` do? 
* What does `each` return?
* What does `map` do?
* What does `map` return?
* What is the difference between `map` and `collect`?
* What does `select` do?
* What does `select` return?
* What is the difference between `each` `map` and `select`?
* What does `inject` do?
* When might you use `inject`?
* How do you check if every item in a hash fulfills a certain criteria?
* What about if none of the elements fulfill that criteria?
* What (basically) is an `enumerator`?

### Check These Out First
* [Codecademy's section on iterating over Arrays and Hashes](http://www.codecademy.com/courses/ruby-beginner-en-F3loB/2/1)
* TODO: Need a good primary reading resource for enumerable!

### A Brief Summary
`Enumerable` gives you lots of useful ways of doing something to every element of a collection object (an array or hash, for instance), which is a very common thing to do when you're building programs and websites.

`each` is an iterator method you've seen plenty of times before now that comes pre-packaged with the Array and Hash and Range classes and it basically just goes through each item in the object you called it on and passes it to the block that you specified.  It will return the original collection that it was called on:

    > [1,2,3].each { |num| print "#{num}! " }
    1! 2! 3! => [1,2,3]

Sometimes you also want to know what position in the array you are... so that sounds like a good chance to use Enumerable's `each_with_index`, which will pass that into the block as well:

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

That's too much code and too much hassle.  When all you're doing is pulling out, or *selecting*, certain items based on some criteria, you'd be better served using Enumerable's **`select`** instead.  It will run the block on every item of your object (whether array or hash or whatever) and return a new object that contains only those items for which the original block returned `true`:

    > my_array.select{|item| item%2==0 }
    => [2,4,6,8,100]      # wow, that was easy.

You win this round, Ruby.  What if instead of selecting only a few items we want to keep all items but modify them somehow?  That sounds a lot like we're doing something and `collect`ing the results, doesn't it?  `collect` will run your block and give you an object filled with whatever your block returned each time.  Ruby says:

    > my_array.collect{|num| num**2 }
    => [4,16,36,64,10000]

You've heard of **`map`**?  It's the EXACT same method as collect, just called something different.  Some people visualize it in their heads as doing something and collecting the results, other people see it as re-mapping your original object through some sort of transformation.  It's more conventional to use `map` but both work the same way.  

Here's a theoretical example more like what you might see when you've got your own website built using Rails, where we may want to send only an array filled with our users' emails out to the webpage:

    u = User.all
    @user_emails = u.map { |user| user.email }

You can also use these methods on hashes as well, just remember that now you have two inputs to work with for your block:

    > my_hash = {"Joe" => "male", "Jim" => "male", "Patty" => "female"}
    > my_hash.select{|name, gender| gender == "male" }
    => {"Joe" => "male", "Jim" => "male"}

**Enumerable Iterators Cheat Sheet**
* **`each`** returns the original object it was called on because it's really used for its side effects and not what it returns
    * **`each_with_index`** passes not just the current item but whatever position in the array it was located in.
* **`select`** returns a new object (e.g. array) filled with only those original items where the block you gave it returned `true`
* **`map`** returns a new array filled with whatever gets returned by the block each time it runs. 

Up until now, all the methods we've seen run essentially independent operations on each element of our array or hash.  What if we want to do something that keeps track of the result as we iterate?  Like, say, summing up the elements of an array?  For that we need to use **`inject`** (aka `reduce`), which passes not just the element but the return of the previous iteration into the block.  You can specify the initial value or it will just default to the first item of the array.  It ultimately returns whatever the result of the last iteration is.  Here's a way to sum an array:

    > my_array.inject(0){|running_total, item| running_total + item }
    => 120

**Some Other Handy Methods**
Enumerable is a large bunch of methods and you'll only use a half-dozen of them regularly but there are some others that you should be familiar with as well.  The full list is available [in the docs here](http://ruby-doc.org/core-2.0/Enumerable.html).
* **`any?`** returns true/false (see the question mark?) and answers the question, "do ANY of the elements in this object pass the test in my block?".  If your block returns true on any time it runs, `any?` will return true.
* **`all?`** returns true/false and answers the question, "do ALL the elements of this object pass the test in my block?".  Every time the block runs it must return true for this method to return true.
* **`none?`** returns true only if NONE of the elements in the object return true when the block is run.
* **`find`** returns the first item in your object for which the block returns true.

**Awesome but less common methods**
* **`group_by`** will run your block and return a hash that groups all the different types of returns from that block.  For example:
    
    > names = ["James", "Bob", "Joe", "Mark", "Jim"]
    > names.group_by{|name| name.length}
    => {5=>["James"], 3=>["Bob", "Joe", "Jim"], 4=>["Mark"]} 

* **`grep`** returns an array with those items that actualy match the specified criteria (RegEx) (using a `===` match)

    > names.grep(/J/)
    => ["James", "Joe", "Jim"]

Some of the methods you've already seen and use are part of Enumerable too -- `include?`, `sort`, `count` etc.

When you use the Enumerable methods, you'll sometimes see what's called an **`enumerator`** object pop up, usually if you forget to give them a parameter that they want like a block.  What the heck is that?  Consider it an implementation detail of Enumerator.  As we said before, the methods that are part of Enumerable rely on the underlying collections' `each` method to work.  `enumerable` is basically a go-between for the original collection and Enumerator.
It's not really something you'll be using right off the bat but it's useful for gaining a better understanding of Enumerable.


#### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*
1. Write code to find the total of each element of an array multiplied together
2. TODO

#### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* A video talk from [LA Ruby on Enumerable](https://www.youtube.com/watch?v=8xN6vzJQ6nA) moves pretty quickly and gets advanced but can help you fill in gaps or expand your knowledge.
* A [Slideshare from Mike Bowler on Enumerable](http://www.slideshare.net/mbowler/inside-enumerable) moves quickly through it.
* A [quick reference cheat sheet from queirozf.com](http://queirozf.com/reminders/ruby-map-each-collect-inject-reject-select-quick-reference)
* For the more advanced, Julio Terra provides a [Detailed Enumerator explanation](http://julioterra.com/journal/2011/10/learning-ruby-enumerator-enumerable-objects/).
* For the more advanced, there's a [Wikibooks entry on Enumerator](http://en.wikibooks.org/wiki/Ruby_Programming/Reference/Objects/Enumerable)
* *Add Here!*
