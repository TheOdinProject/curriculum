## Arrays
### Intro and Goals
We saw how strings are a lot like arrays... so it's probably a good time to dive into what arrays are and how flexible they are in Ruby.  Arrays are almost as ubiquitous as strings.  You'll be working with them all the time to help store data for you, everything from the names of all your users to coordinates on a game board.  An array is an all-purpose bucket into which you can put pretty much anything.

Here, you'll learn the basics of creating arrays, how to manipulate them in a dozen different ways, and some best practices for working with arrays.  Note that we'll be learning even more about how to dig around inside of arrays in the future section on iterators, so if you're excitedly waiting to better understand .each, .map and others like them, we're almost there!  If not... you will be.

### Thought Questions
* What are three ways to create an array?
* How do you prepopulate the array with default data?
* How do you access items in an array?
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
* How to you find out how big an array is?
* How do you put an array in order?
* What are the naming conventions for arrays?
* What should you store in arrays?

### Check These Out First
* Do [Codecademy's section on arrays](http://www.codecademy.com/courses/ruby-beginner-en-F3loB/0/1) for some practice with them


### A Brief Summary

Arrays begin life as empty containers waiting to be filled with objects or data.  As items are added, they stay in whatever spot you put them, which is good because then you know exactly where to find them later.  You can put anything in an array!  Numbers, strings, objects, symbols, haikus...

**Creating an Array** can happen in many different ways.  You can either create it empty, specify how many spaces it should have (still empty), or even **fill it with default values**:

    > a = Array.new     # 1
    => []               # see, it's empty
    > b = []
    => []               # still empty
    > c = Array[]       
    => []
    > empty_a = Array.new(5)
    => [nil, nil, nil, nil, nil]
    > full_a = Array.new(3, "hi")
    => ["hi", "hi", "hi"]

And remember, you can store pretty much anything in there, even other arrays:

    > full_b = [1, 4, 8, "hello", a]
    => [1, 4, 8, "hello", []]  # Cool, arrays inside arrays!

... *but don't do that!*  It's best to keep only ONE type of thing in your arrays or you'll have many headaches down the road because you'll almost always assume that there's only one type of thing in there.  Forget that you ever learned that arrays can hold different values.

**Accessing Items** is super easy, just start from `0` like you did with strings.  Just like with strings, you can start from the end of the array using negative numbers from `-1` and you can even grab ranges of values (which are themselves arrays!):

    > arr = [1, 3, 5, 7, 2]   # favorite way to declare an array
    => [1, 3 ,5 ,7 ,2]
    > arr[0]
    => 1
    > arr[-1]
    => 2
    > arr[1..3]
    => [3, 5, 7]          # this returned an array!
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

**Subtracting Arrays** is a bit different... think of the minus sign as saying "take away any and all values that are in the right array from the left array". The only values remaining will be those from the left that were not included in the right side at all:

    > [1,2,3] - [2,3,4]
    => [1]                # the 4 did nothing
    > [2,2,2,2,2,3,4] - [2, 5, 7]
    => [3,4]              # it killed ALL the 2's

You'll find yourself adding arrays a lot more frequently than subtracting them but it's good to know both.

If you want to find values in **Both** arrays, check their union using the ampersand `&`:

    > [1,2,3]&[2,4,5]
    => [2]

What if you only want to add or subtract one single value?  That's a very common operation with arrays, and Ruby has provided four handy methods that let you either pluck away or add onto the front or back of the array.  First, the more common is to add or remove stuff from the END of the array, using **`push` or `pop`**:

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

What if you want to take the item off the FRONT of the array?  This is less common.  For that, use the similar `shift` and `unshift` methods:

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

So the `push`/`pop`/`shift`/`unshift` methods should take you wherever you realistically need to go.  Although there's another handy method you should be aware of, the **Shovel Operator**, aka `<<`  This method is *almost* identical to push, since it just jams whatever's to its right into the array:

    > my_arr = [1,2,3]
    => [1,2,3]
    > my_arr << 3
    => [1, 2, 3, 3]
    > my_arr << [4,5]
    => [1, 2, 3, 4, [4, 5]]   # Array within array alert!

For now, just think of it as the cool way of pushing onto an array.  But note that `<<` is often overridden (like in Rails), and so it pays to be mindful of exactly what flavor of `push`ing you're doing.

**Deleting Items** from an array should be done carefully because, if you're deleting items inside a loop or something like that, it will change the index of the other items and you'll need to anticipate this or live to regret it.  Delete an item at a specific index using `delete_at`, which is sort of like `pop`ing but from anywhere you want:

    > my_arr = [1,2,3]
    => [1, 2, 3]
    > my_arr.delete_at(1)
    => 2
    > my_arr
    => [1,3]

See if an array **includes an item** AT ALL by using `include?`, which, as you should see from the `?` at the end, returns true or false:

    > my_arr.include?(3)
    => true
    > my_arr.include?(132)
    => false

To find WHERE a specific item lives in the array, use `index` but note that it only returns the FIRST instance of this (and then gives up. Lazy method.):

    > my_arr.index(3)
    => 2
    > [1,2,3,4,5,6,7,3,3,3,3,3].index(3)
    => 2                  # Just the index of the FIRST match
    > my_arr.index(132)
    => nil                # Not an error, just nil

**A few useful and commonly used methods:**
* `max` to find the **biggest value** of an array
* `min` to find the **smallest value** of an array
* `size` to find out **how big the array is**
* `shuffle` will mess up your whole array by putting it in random order
* `sort` will clean it up again for you by putting your array **in order**.  Though `sort` is pretty self-explanatory in the simple case, it can actually take parameters to let you decide if you want to sort things using a different (or reverse) methodology.
* `sample` picks out a totally random value from the array... good for gambling games!
* `first` gives you the first item (but doesn't remove it, so it's same as `[0]`) but can be more descriptive of your code's intent.
* `last` is same as `[-1]`

Do as I say and not as I do: name your arrays with the plural form (because it has a bunch of things in it, like `colorful_bugs` instead of `colorful_bug`) and be descriptive.  No one likes to try and figure out what `array1` or `a` contains... stick with `colorful_bugs`  I just kept them short here because they're tiny examples.  Someone should rename them all.

Strings are a lot like arrays... so much so that we can even **Convert an Array into a String**! Just use `join` and tell it what, if anything, you want in between each element (the "separator"):

    > ["he", "llo"].join
    => "hello"
    > colorful_bugs = ["caterpillar", "butterfly", "ladybug"]
    => ["caterpillar", "butterfly", "ladybug"]
    > "I found a #{colorful_bugs.join(' and a ')} in the yard!"
    => "I found a caterpillar and a butterfly and a ladybug in the yard!" 

Want to know a cool way to make an array?  Create it from a `Range`(which you learned in the first section) and just **Convert it to an Array**:

    > my_awesome_array = (1..6).to_a
    => [1,2,3,4,5,6]

Advanced stuff (you don't need to know this right now):
Remember how we could create a new array and fill it up with stuff using `Array.new(5, "thing")`?  `Array.new` also takes an optional argument that is a block and it will run that block every time it needs to populate a new element.  Woah! We got a bit ahead of ourselves, but it's a cool feature to have floating in the back of your head.

    > Array.new(5){|item_index| item_index ** 2}
    => [0, 1, 4, 9, 16]    # It squared each index to populate the array!

### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*

1. TODO

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* Add Here!
