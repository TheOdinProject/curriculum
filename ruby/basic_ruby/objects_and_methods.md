## Objects and Methods
### Intro and Goals
"Everything in Ruby is an Object" is something you'll hear rather frequently.  "Pretty much everything else is a method" could also be said.  The goal here is for you to see the Matrix... that everything in Ruby is an Object, every object has a class, and being a part of that class gives the object lots of cool methods that it can use to ask questions or do things.  Being incredibly object-oriented gives Ruby lots of power and makes your life easier.

Hopefully you've already picked most of this up from the prep-work.

### Thought Questions
* What is an object?
* What is a class?
* What is a method?
* How can you print out an object or class's methods?
* What is inheritance?
* How many classes can a class inherit from in Ruby?
* What's the top-level ancestor class that all others inherit from in Ruby?
* What are Reflection Methods?
* What are a method's Side Effects?
* How do methods take inputs?
* Do all methods have outputs?
* What is Method Chaining and how does it work?
* What's the syntax for writing your own methods?
* What is returned by a method?
* What is an implicit return?
* What are default inputs?
* What does `self` mean?

### Check These Out First
* [Ruby Inheritance](http://rubylearning.com/satishtalim/ruby_inheritance.html)
* TODO: Basic Methods and Objects, railsbridge?

### A Brief Summary
  
Think of every "thing" in Ruby as a having more than meets the eye. The number `12` is more than just a number... It's an **object*** and Ruby lets you do all kinds of interesting things to it like adding and multiplying and asking it questions like `> 12.class` or `> 12+3`

Ruby gives all objects a bunch of neat **methods**.  If you ever want to know what an object's methods are, just use the `methods` method!  Asking `> 12345.methods` in IRB will return a whole bunch of methods that you can try out on the number 12345.  You'll also see that the basic operators like `+` and `-` and `/` are all methods too (they're included in that list).  You can call them using the dot `> 1.+2` like any other method or, luckily for you, Ruby made some special shortcuts for them so you can just use them as you have been: `> 1+2`

Some methods ask true/false questions, and are usually named with a question mark at the end like `is_a?`, which asks whether an object is a type of something else, e.g. `1.is_a?Integer` returns `true` while `"hihi".is_a?Integer` returns `false`  You'll get used to that naming convention.  Methods like `is_a?`, which tell you something about the object itself, are called **Reflection Methods** (as in, "the object quietly reflected on its nature and told me that it is indeed an Integer").  `class` was another one we saw, where the object will tell you what class it is.

What is a method? A method is just a function or a black box.  You put the thing on the left in, and it spits something out on the right.  *Every method returns something*, even if it's just `nil`  Some methods are more useful for their **Side Effects** than the thing they actually return, like `puts`  That's why when you say `> puts "hi"` in IRB, you'll see a little `=> nil` down below... the method prints out your string as a "side effect" and then returns `nil` after it's done.  When you write your own methods, if you forget to think about the return statement, sometimes you'll get some wierd behavior so always think about what's going in and what's coming out of a method.

Methods can take **inputs** too, which are included in parentheses to the right of the method name (though they can be omitted, as you do with `> puts("hi")` becoming `> puts "hi"`.. it's okay to be lazy, as long as you know what you're doing).  Going back to the addition example, `> 1+2==3` is asking whether 1+2 will equal 3 (it returns `=> true`), but it can more explicitly be written `> 1.+(2).==(3)`  So, in this case, you can see there's more going on than meets the eye at first.  

That example also shows **Method Chaining**, which is when you stick a bunch of methods onto each other.  It behaves like you'd expect -- evaluate the thing on the left first, pass whatever it returns to the method on the right and keep going.  So `> 1+2==3` first evaluates `1+2` to be `3` and then evaluates `3==3` which is `true`  This is great because it lets you take what would normally be many lines of code and combine them into one elegant expression.

**Bang Methods** are finished with an exclamation point `!` like `sort!`, and they actually modify the original object.  The exclamation point lets you know you're in dangerous territory.  Remember, when you run a normal method in IRB, it will output whatever the method returns but it will preserve the original object.  Bang methods save over the original object (they are "destructive"):

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

Let's answer the question, "Where did all those methods come from?" **Classes** are like umbrellas that let us give an object general behaviors just based on what it is.  An object is an instance of a class -- you (yes, you) are an instance of the `Person` class.  There are lots of behaviors (methods) that you can do just by virtue of being a `Person`... `laugh`, `jump`, `speak("hello")`  This is really useful in programming because you often need to create lots of instances of something and it's silly to have to rewrite all the methods you want all of them to have anyway, so you write them at the class level and all the instances get to use them.

Instances of a class get to **inherit** the behaviors of that class.  Inheritance works for classes too!  Your class `Person` has lots of methods but many of them are inherited just by virtue of you also being a `Mammal` or even just a `LivingThing`  You get to use all the methods of your ancestor classes

An interesting exercise to try in Ruby is to use the method `superclass` to ask a class what its parent is.  If you just keep on going and going, you'll see that everything eventually inherits from `BasicObject`, which originates most of the methods you have access to in the original object:

    > 1.class.superclass.superclass.superclass
    => BasicObject
    > BasicObject.methods
    => # giant list of methods

Random Note: Running the `methods` method on a class only returns the class methods, whereas `instance_methods` will return all methods available to any instance of that class (so `String.methods` will return a list of class methods, while `"hello".methods` will return a longer list that is the same as `String.instance_methods`).

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

### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*

1. TODO

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* Add Here!
