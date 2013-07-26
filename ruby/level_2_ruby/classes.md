
## Classes, Modules and Inheritance
### Intro and Goals

When you start solving larger problems organization is key.  You don't want 100 different methods and variables that do overlapping things.  If you're trying to keep track of data (like a bunch of bad guys in a game you're building), you want to do so in the most organized way possible so you can recycle methods and only need to update that data in one place at a time.

Classes are here to make your life easier on that front and you'll learn about how to organize and use them here.  In the process, you'll also need to understand which of their methods get inherited by who and the difference between instances of a class and the class itself.  

You've written a lot of methods so far but they've generally been independent of each other.  When you find that you want the same method to be run on a bunch of different objects without having to make a bunch of different `if/else` or `case` statements, you should start thinking about using a class.

We've got a fair bit of stuff crammed into this section but it gives you superpowers.

### Thought Questions
* What is a class?
* When should you use a class?
* How do you write a class in your script file?
* What is an instance of a class?
* What is the difference between the CamelCase and snake_case styles of naming?
* How do you instantiate a class?
* How do you run some code whenever you make a new instance?
* What should be done in the `initialize` method?
* What is a class method?
* How is a class method different from an instance method?
* How are methods you already know like `count` or `sort` etc instance methods?
* What are "getter" and "setter" methods used for?
* What is the difference between a "getter" and a "setter" method?
* How do you make instance variables readable outside your class?  Writeable? Both at the same time?
* What's the difference between how you declare a class method vs an instance method?
* What's the difference between how you call a class method vs an instance method?
* What is an instance variable?
* What's the difference between an instance variable and a 'regular' variable?
* What is a "setter" method?
* How do you write your own setters?
* What is a "getter" method and how do you write one?
* What does `attr_accessor` do?
* Why would you use `attr_accessor`?
* What are two ways of getting an instance variable from an instance of a class?
* Can a class call its own class methods?
* What's the difference between when would you use a class variable and when you would use a constant?

TODO: Break out into the Scope section instead.
* How does inheritance work?
* What is a module?
* When should you use a module?
* What's the difference between a class and a module? (instantiation!)
* What is a private method?
* What is a protected method?
* How are private and protected methods different?

### Do These First
1. Codecademy's [Object-Oriented Programming section](http://www.codecademy.com/courses/ruby-beginner-en-MFiQ6)
2. Codecademy's [OOP Project](http://www.codecademy.com/courses/ruby-beginner-en-X5wcR/0/1)
3. Codecademy's [OOP II section](http://www.codecademy.com/courses/ruby-beginner-en-zfe3o)
4. Codecademy's [OOP II Project](http://www.codecademy.com/courses/ruby-beginner-en-32cN3/0/1)
5. Now you're ready to read through [Zetcode's OOP section](http://zetcode.com/lang/rubytutorial/oop/), though only go until they start talking about Inheritance (about 3/4 of the way down).
6. Read through [Zetcode's second OOP section](http://zetcode.com/lang/rubytutorial/oop2/) until they start talking about exceptions (~80% of the way down)

### A Brief Summary

We've been over storing data in hashes, but what happens when you want to treat that data like a real object and make it move?  Or if you want to handle 10,000 different instances of it? When you just store your `Viking`'s `name`, `age`, `health`, and `strength`, it just kind of sits there.  What about when you want to make an army of `Viking`s who can do stuff like `eat`, `travel`, `sleep` and, of course, `attack`?  For that, you need a slightly more complex structure to make your `Viking` out of, so you give it its own `Viking` class:

    class Viking
        # put your methods and variables here
    end

We've been dealing with classes since the very beginning, when it became clear that everything in Ruby is an object, whether strings, hashes, arrays or numbers, and these objects are instances of some type of class.  

    > 1.class
    => Integer
    > [].class
    => Array

Just like being a part of `Array` gives `[1,2,3]` the `each` method, you can create your own classes that have access to shared methods as well.  

To be able to amass a horde of 100 `Viking`s, you need a way to create new ones.  Each time you do that, it's called **Instantiating** a new `Viking`.  You use a special `new` method to do that.  You've done it many times for the `Array` class already:

    > my_arr = Array.new
    => []

`new` is a **Class Method**, which means that you call it on the class (`Array` here) and not the specific instance of that class (which would be `my_arr` here).  When you call that method, it creates a new instance of that class and then runs a special method in the class called `initialize`, which will set up that class to be ready for use.  If you pass variables to your class when you create it with the `new` method, they will be available to the `initialize` method.  Your `Viking` class would start by looking like:

    class Viking
        def initialize(name, age, health, strength)
            # set up your new viking however you want to
        end
    end

Classes share their methods, but what about variables?  You don't want all your Vikings to have the same strength, so we use **instance variables** to take care of that.  You designate an instance variable using the `@variable_name` notation, and you'll be able to use it the same *way* for every instance of Viking but it will have a unique *value* for each.  These instance variables are part of setting up your object's *state*.  When your instance is destroyed, you lose access to its instance variables as well.  You'd usually set them up in your `initialize` method:

    class Viking
        def initialize(name, age, health, strength)
            @name = name
            @age = age
            @health = health
            @strength = strength
        end
    end

    > oleg = Viking.new("Oleg", 19, 100, 8)
    => #<Viking:0x007ffc0597bae0>

Note that the class name is always capitalized and multiple words use **CamelCase** (capitalized with no spaces) not the **snake_case** (lowercase with spaces as underscores) you've typically seen for variables.

What was that random string in `#<Viking:0x007ffc0597bae0>`?  That's the position in the computer's memory that the viking object is stored (don't worry about it).

If you want to give your viking some actions it can do, give it some methods.  Since these methods get called on an individual instance of the Viking class, they're called **Instance Methods**, just the same as all your old friends like `each` and `sort` and `max` etc.  We just usually don't call them "instance" methods so maybe it wasn't obvious.

    class Viking
        def initialize(name, age, health, strength)
            # codecodecode
        end
        def attack(enemy)
            # code to fight
        end
    end

Now, if I had two Vikings, `oleg` and `lars`, I could say `> lars.attack(oleg)` and it would run that method. 

So now you want to know what `oleg`'s health is:

    > oleg.health
    NoMethodError: undefined method 'health' for #<Viking:0x007ffc0597bae0>

Woah! The instance variables are a part of `oleg` but you can't access them from outside him because it's really nobody's business but his.  So you have to create a method specifically to get that variable, called a **getter** method, and just name it the same thing as the variable you want:

    def health
        @health
    end

    > oleg.health
    => 87

That was easy!  What if you decide that you want to set that variable yourself?  You need to create a **setter** method, which is similar syntax to the getter but with an equals sign and taking an argument:

    def health=(new_health)
        @health = new_health
    end

Well, you can imagine that you'll probably be writing a whole lot of those methods, so Ruby gives you a helper method called **`attr_accessor`**, which will create those getters and setters for you.  Just pass it the symbols for whatever variables you want to make accessible and POOF! those methods will now exist for you to use:

    class Viking
        attr_accessor :name, :age, :health, :strength
        # codecodecode
    end

`attr_accessor` isn't magical, it just uses Ruby's ability to create methods from within your script (part of "metaprogramming") to set up `name` and `name=(new_name)` and `age` and `age=(new_age)` etc.

You shouldn't make anything readable and certainly not writeable without a good reason.  If you only want one or the other, Ruby gives you the similar **`attr_reader`** and **`attr_writer`** methods.  They should be pretty self explanatory.

Because of your getters and setters, there are two different ways to access an instance variable from inside your class, either calling it normally using `@age` or calling the method on the instance using `self`, which we learned about previously.  Before, we said it represented whatever object called a particular method.  Since the original method (below it's `take_damage`) is being called on an instance of the class, that instance becomes `self`.  An example is clearer:

    class Viking
        ...
        def take_damage(damage)
            self.health -= damage
            # OR we could have said @health -= damage
            self.shout("OUCH!")
        end
        def shout(str)
            puts str
        end
        ...
    end

You can also call methods from within other methods, as we saw with `shout` above.  In that case, the `self` is actually optional because Ruby assumes if you just type `shout("OUCH!")` that you're trying to run the method `shout` and Ruby will see if the method exists.  That works 90% of the time, unless you've done something that overrides Ruby's assumption that you're trying to run a method, like using the `=` assignment operator:

    ...
        def sleep
            health += 1 unless health >= 99   # ! FAIL !
        end
    ...

Here, Ruby assumes you're trying to set up a new `health` variable using `health=` instead of accessing the one that currently exists as `@health`.  Just an edge case to watch out for if you start eliminating your `self`'s.

Let's zoom away from the instance level and back to the class level for a second.  Just like you've got instance variables and instance methods, you also get **class variables** and class methods.  Class variables, denoted with TWO `@@`'s, are owned by the class itself so there is only one of them overall instead of one per instance.  

In this example, we assume that all Vikings start with the same health, so we don't make it a parameter you can pass in:

    class Viking
        @@starting_health
        def initialize(name, age, strength)
            @health = @@starting_health
            # ...other stuff
        end
    end

What about class methods?  You define a class method by preceding its name with `self` (which should make sense after our discussion of `self`... you'll be calling the methods using `ClassName.class_method_name` so `self` will be the class itself).

There are two good times to use class methods: when you're building new instances of a class that have a bunch of known or "preset" features, and when you have some sort of utility method that should be identical across all instances and won't need to directly access instance variables.  

The first case is called a **factory method**, and is designed to save you from having to keep passing a bunch of parameters manually to your `initialize` function:

    class Viking
        def initialize(name, health, age, strength)
            #... set variables
        end
        def self.create_child(name)
            age = rand * 18   # remember, rand gives a random 0 to 1
            health = age * 5
            strength = age / 2
            Viking.new(name, health, age, strength)  # returned
        end
    end

    > olga = Viking.create_child("olga")
    => #<Viking:0x007ffc0402f348 @age=13.453281957963075, @name="olga", @health=67.26640978981537, @strength=6.726640978981537> 

It's pretty handy of IRB to list out the instance variables for you.  It's almost identical to the output if you were to type `olga.inspect` (only the strings show up a bit differently).




### Exercises
### Additional Resources
* [Zetcode on Objects](http://zetcode.com/lang/rubytutorial/objects/)
* [TutorialsPoint on Classes](http://www.tutorialspoint.com/ruby/ruby_classes.htm) is a basic walkthrough of classes.















