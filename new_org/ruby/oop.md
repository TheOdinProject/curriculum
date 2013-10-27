# Object-Oriented Programming
*Estimated Time: 8-12 hrs*

You've got the building blocks of Ruby out of the way, great! Now it's time to get into the fun stuff... how do we combine those building blocks in the most efficient and elegant ways to produce the programs we'd like to write?

The concepts you'll learn here are often less specific to Ruby itself and more widely applicable to any object-oriented language.  That's because the fundamental concepts are just that... fundamental.  Don't repeat yourself.  Modularize your code.  Have your classes and methods only do one thing.  Show as little of your interfaces to the world as you can.  Don't make methods or classes heavily dependent on each other.  Be lazy.  These will take some time and practice to implement effectively, but you'll already be taking a big step towards creating high quality code just by finishing up this section.

There's a lot to do here but stick with it!  We'll start with some refactoring work which should be a quick refresher of some concepts we covered in the last lesson before moving into some of the OOP principles.  The Codecademy lessons are interspersed with their projects so you'll get a chance to apply what you're learning.  The Beginning Ruby book will help you understand the material a bit deeper, which will be important when you are creating your own projects next.

Yet again, the "Special Summary" section at the bottom should help you out.  Hopefully it's still special...

## You Will Need To Understand:

**Note:** This is again a long list of things to understand!  Read through the list, breathe deep, do the assignment, read the Special Summary section and then come back to them.

* Classes and Methods:

    * What is an implicit return?
    * What is a class?
    * When should you use a class?
    * How do you create a class in your script file?
    * What is an instance of a class?
    * What is the difference between the CamelCase and snake_case styles of naming?
    * How do you instantiate a class?
    * How do you set the state of your new instance?
    * What should be done in the `#initialize` method?
    * What is a class method?
    * How is a class method different from an instance method?
    * How are methods you already know like `#count` or `#sort` etc instance methods?
    * What's the difference between how you declare a class method vs an instance method?
    * What's the difference between how you call a class method vs an instance method?
    * What is an instance variable?
    * What's the difference between an instance variable and a 'regular' variable?
    * What are "getter" and "setter" methods used for?
    * What is the difference between a "getter" and a "setter" method?
    * How do you make instance variables readable outside your class?  Writeable? Both at the same time?
    * Can a class call its own class methods?
    * What's the difference between when would you use a class variable and when you would use a constant?
    * What's the difference between a class and a module?
    * When would you use a class but not a module?
    * How does inheritance work?
    * Why is inheritance really useful?
    * How do you extend a class?  What does that mean?
    * What does `#super` do?  Why use it?

* Scope:

    * What is scope?
    * When can you start using a variable?
    * When is a new scope defined?
    * When are methods in scope?
    * What is a private method?
    * What is a protected method?
    * How are private and protected methods different?
    * What does "encapsulation" mean?

## Your Assignment:

1. Do [Codecademy Ruby sections 7, 9, and 10](http://www.codecademy.com/tracks/ruby):
  
    1. [Refactoring](http://www.codecademy.com/courses/ruby-beginner-en-1o8Mb?curriculum_id=5059f8619189a5000201fbcb)
    2. [Project: The Refactor Factory](http://www.codecademy.com/courses/ruby-beginner-en-Zjd2y?curriculum_id=5059f8619189a5000201fbcb)
    3. [Object-Oriented Programming, Part I](http://www.codecademy.com/courses/ruby-beginner-en-MFiQ6?curriculum_id=5059f8619189a5000201fbcb)
    4. [Project: Virtual Computer](http://www.codecademy.com/courses/ruby-beginner-en-X5wcR?curriculum_id=5059f8619189a5000201fbcb)
    5. [Object-Oriented Programming, Part II](http://www.codecademy.com/courses/ruby-beginner-en-zfe3o?curriculum_id=5059f8619189a5000201fbcb)
    6. [Project: Banking on Ruby](http://www.codecademy.com/courses/ruby-beginner-en-32cN3?curriculum_id=5059f8619189a5000201fbcb)

2. Read [Beginning Ruby](http://beginningruby.org/) Chapter 5: `The Ruby Ecosystem` for a brief break from code to learn more about the world of Ruby.
3. Read [Beginning Ruby](http://beginningruby.org/) Chapter 6: `Classes, Objects, and Modules`.  It will extend your knowledge deeper than Codecademy alone.
4. Read [Beginning Ruby](http://beginningruby.org/) Chapter 7: `Projects and Libraries`
5. Read [Beginning Ruby](http://beginningruby.org/) Chapter 8: `Documentation and Error Handling` but skip the stuff on Testing (pgs 190-196)
6. Read the [Bastard's Chapter on Error Handling](http://ruby.bastardsbook.com/chapters/exception-handling/) to reinforce your understanding of dealing with errors.
6. Glance over the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) so you have an idea of how to make your code look more professional.
7. Take a look back through the "You Will Need To Understand" list above.

## A Special Summary (again)

This section should again make sure you've got all you need from the above texts and mini-courses.

### Classes

When you start solving larger problems organization is key.  You don't want 100 different methods and variables that do overlapping things.  If you're trying to keep track of data (like a bunch of bad guys in a game you're building), you want to do so in the most organized way possible so you can recycle methods and only need to update that data in one place at a time.

Classes are here to make your life easier on that front and you'll learn about how to organize and use them here.  In the process, you'll also need to understand which of their methods get inherited by who and the difference between instances of a class and the class itself.  

You've written a lot of methods so far but they've generally been independent of each other.  When you find that you want the same method to be run on a bunch of different objects without having to make a bunch of different `if/else` or `case` statements, you should start thinking about using a class.

We've been over storing data in hashes, but what happens when you want to treat that data like a real object and make it move?  Or if you want to handle 10,000 different instances of it? When you just store your `Viking`'s `name`, `age`, `health`, and `strength`, it just kind of sits there.  What about when you want to make an army of `Viking`s who can do stuff like `#eat`, `#travel`, `#sleep` and, of course, `#attack`?  For that, you need a slightly more complex structure to make your `Viking` out of, so you give it its own `Viking` class:

    class Viking
        # put your methods and variables here
    end

We've been dealing with classes since the very beginning, when it became clear that everything in Ruby is an object, whether strings, hashes, arrays or numbers, and these objects are instances of some type of class.  

    > 1.class
    => Integer
    > [].class
    => Array

Just like being a part of `Array` gives `[1,2,3]` the `#each` method, you can create your own classes that have access to shared methods as well.  

To be able to amass a horde of 100 `Viking`s, you need a way to create new ones.  Each time you do that, it's called **Instantiating** a new `Viking`.  You use a special `::new` method to do that.  You've done it many times for the `Array` class already:

    > my_arr = Array.new
    => []

`::new` is a **Class Method**, which means that you call it on the class (`Array` here) and not the specific instance of that class (which would be `my_arr` here).  It's also why we designate it with the two colons `::` when talking about it here.  When you call that method, it creates a new instance of that class and then runs a special method in the class called `#initialize`, which will set up that class to be ready for use.  If you pass variables to your class when you create it with the `::new` method, they will be available to the `#initialize` method.  Your `Viking` class would start by looking like:

    class Viking
        def initialize(name, age, health, strength)
            # set up your new viking however you want to
        end
    end

Classes share their methods, but what about variables?  You don't want all your Vikings to have the same strength, so we use **instance variables** to take care of that.  You designate an instance variable using the `@variable_name` notation, and you'll be able to use it the same *way* for every instance of Viking but it will have a unique *value* for each.  These instance variables are part of setting up your object's *state*.  When your instance is destroyed, you lose access to its instance variables as well.  You'd usually set them up in your `#initialize` method:

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

Note that the class name is always capitalized and, for multiple words, uses **CamelCase** (capitalized with no spaces) not the **snake_case** (lowercase with spaces as underscores) you've typically seen for variables.

What was that random string in `#<Viking:0x007ffc0597bae0>`?  That's the position in the computer's memory that the viking object is stored (don't worry about it).

If you want to give your viking some actions it can do, give it some methods.  Since these methods get called on an individual instance of the Viking class, they're called **Instance Methods**, just the same as all your old friends like `#each` and `#sort` and `#max` etc.  We just usually don't call them "instance" methods so maybe it wasn't obvious.

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

Well, you can imagine that you'll probably be writing a whole lot of those methods, so Ruby gives you a helper method called `attr_accessor`, which will create those getters and setters for you.  Just pass it the symbols for whatever variables you want to make accessible and POOF! those methods will now exist for you to use:

    class Viking
        attr_accessor :name, :age, :health, :strength
        # codecodecode
    end

`attr_accessor` isn't magical, it just uses Ruby's ability to create methods from within your script (part of "metaprogramming") to set up `#name` and `#name=(new_name)` and `#age` and `#age=(new_age)` etc.

You shouldn't make anything readable and certainly not writeable without a good reason.  If you only want one or the other, Ruby gives you the similar `attr_reader` and `attr_writer` methods.  They should be pretty self explanatory.

Because of your getters and setters, there are two different ways to access an instance variable from inside your class, either calling it normally using `@age` or calling the method on the instance using `self`, which we learned about previously.  Before, we said it represented whatever object called a particular method.  Since the original method (below it's `#take_damage`) is being called on an instance of the class, that instance becomes `self`.  An example is clearer:

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

You can also call methods from within other methods, as we saw with `#shout` above.  In that case, the `self` is actually optional because Ruby assumes if you just type `shout("OUCH!")` that you're trying to run the method `#shout` and Ruby will see if the method exists.  That works 90% of the time, unless you've done something that overrides Ruby's assumption that you're trying to run a method, like using the `=` assignment operator:

    ...
        def sleep
            health += 1 unless health >= 99   # ! FAIL !
        end
    ...

Here, Ruby assumes you're trying to set up a new `health` variable using `#health=` instead of accessing the one that currently exists as `@health`.  Just an edge case to watch out for if you start eliminating your `self`'s.

Let's zoom away from the instance level and back to the class level for a second.  Just like you've got instance variables and instance methods, you also get **class variables** and class methods.  Class variables, denoted with TWO `@@`'s, are owned by the class itself so there is only one of them overall instead of one per instance.  

In this example, we assume that all Vikings start with the same health, so we don't make it a parameter you can pass in:

    class Viking
        @@starting_health
        def initialize(name, age, strength)
            @health = @@starting_health
            # ...other stuff
        end
    end

What about class methods?  You define a class method by preceding its name with `self` (e.g. `def self.class_method`) or, identically, just the name of the class (e.g. `def Viking.class_method`).  There's a less common method that puts the line `class << self` ahead of your method definitions (which won't use `self` anymore).

There are two good times to use class methods: when you're building new instances of a class that have a bunch of known or "preset" features, and when you have some sort of utility method that should be identical across all instances and won't need to directly access instance variables.  

The first case is called a **factory method**, and is designed to save you from having to keep passing a bunch of parameters manually to your `#initialize` method:

    class Viking
        def initialize(name, health, age, strength)
            #... set variables
        end
        def self.create_warrior(name)
            age = rand * 20 + 15   # remember, rand gives a random 0 to 1
            health = [age * 5, 120].min
            strength = [age / 2, 10].min
            Viking.new(name, health, age, strength)  # returned
        end
    end

    > sten = Viking.create_warrior("Sten")
    => #<Viking:0x007ffc05a79848 @age=21.388120526202737, @name="Sten", @health=106.94060263101369, @strength=10>

It's pretty handy of IRB to list out the instance variables for you.  It's almost identical to the output if you were to type `olga.inspect` (only the strings show up a bit differently).

The second case above is more mundane.  Often, there are things you need all Vikings to "know" or be able to do:

    class Viking
        ...
        def self.random_name      # useful for making new warriors!
            ["Erik","Lars","Leif"].sample
        end
        def self.silver_to_gold(silver_pieces)
            silver_pieces / 10
        end
        class << self           # The less common way
            def gold_to_silver(gold_pieces)
                gold_pieces * 10
            end
        end
    end

    > warrior1 = Viking.create_warrior(Viking.random_name)
    => #<Viking:0x007ffc05a745c8 @age=22.369775138257097, @name="Lars", @health=111.84887569128549, @strength=10>

**Quick Basics** 

* Classes are useful to use when you want to give methods to your data or have multiple instances of your data
* Class methods have access to other class methods and class variables but don't have access to instance methods or instance variables
* Instance methods can call other instance methods, instance variables, class methods, or class variables

If you're thinking that class variables seem pretty similar to constants, they are only similar in that all instances have access to them.  If you've got something that will never, CAN never change, use a constant.  If you might ever change it, stick with a class variable.  At the very least, it makes your code much more legible.

We've previously learned about modules, the nice packages of methods that you can mix into classes.  But if you often create a class so it can use methods, what's the difference? Basically, a class can be instantiated but a module cannot.  A module will never be anything other than a library of methods.  A class can be so much more -- it can hold its state (by keeping track of instance variables) and be duplicated as many times as you want.  It's all about *objects*.  If you need to instantiate something or otherwise have it exist over time, that's when you need to use a class instead of a module.  

Important thought question:

If a hash (good data storage) and a module (good methods) had a love child, would it be a class (object with methods)?

**Inheritance** is the ability of one class to be a child of another class and therefore inherit all its characteristics, including methods and variables.  We saw that early on with the demonstration of using the `::superclass` method to see what a particular class inherits from, for instance the number `1` is a class `FixNum` which inherits from `Integer` which inherits from `Numeric` which inherits from `Object` which inherits from `BasicObject`.

    > 1.class.superclass.superclass.superclass.superclass
    => BasicObject

Why do all this inheritance?  To keep our code as DRY as possible.  It lets us not have to repeat a bunch of methods (say, `#to_s`, which is implemented in the `Object` class) for every different subclass.

In Ruby, a class inherits from another class using the `<` notation.  Unlike some other languages, a class can only have ONE parent.

    class Viking < Person

Now  `Viking` has access to all of `Person`'s methods.  You say that `Viking` **Extends** `Person`.

You've previously seen us add methods to another existing class, like we did several times with `Array` when you built your own implementation of `#each` and `#map`.  You can use the same tecnhique to *overwrite* existing methods.  It would cause all kinds of problems here, but we could do:

    class Array
        def each
            puts "HAHA no each here!"
        end
    end

    > [1,2,3].each {|item| puts item }
    HAHA no each here!
    => nil

If `Viking` extends `Person`, you similarly have the option to overwrite any of `Person`'s methods.  Maybe Vikings `#heal` twice as fast as normal people.  You could write:

    class Person
        MAX_HEALTH = 120
        ...
        def heal
            self.health += 1 unless self.health + 1 > MAX_HEALTH
        end
    end

    class Viking < Person
        ...
        def heal
            self.health = [self.health + 2, MAX_HEALTH].min
            puts "Ready for battle!"
        end
    end

That's one way... but we could also do it by calling the parent's `#heal` method directly a couple of times using the special `#super` method.  `#super` lets you call the superclass's version of your current method.  

    class Viking < Person
        ...
        def heal
            2.times { super }
            puts "Ready for battle!"
        end
    end

You will often use that in your `#initialize` method when you want to use the parent's `#initialize` but just add a tweak or two of your own. You can pass in parameters as needed:

    class Viking < Person
        def initialize(name, health, age, strength, weapon)
            super(name, health, age, strength)
            @weapon = weapon
        end
    end

Again, it saves you the trouble of having to rewrite (and overwrite!) all those lines of code that were already taken care of by your parent class.

### Scope

You're able to break up your code into methods and classes but you'll also need to think more explicitly about which variables and methods are accessible where.  We started talking about that concept a little bit in the previous section on classes, which dealt with the differences between class methods/variables versus instance methods/variables and the idea of inheriting the methods of a parent class.  Here, you should take that general understanding and build on it further.

In a similar vein, you'll also learn more about how you can shield certain methods from being usable from outside of a class.  You started learning about that idea when we used `attr_accessor` to make instance variables "visible" from outside your instance, but we'll dive deeper here and give you more tools to very explicitly decide what you do and don't want to show to the world.

**Scope** is the formal term that represents when you can access a variable or method and when you can't.  It's nothing explicit in the code (you're never calling a method named `scope` or anything like that); it's just a concept.  If your variable is "in scope" then it's available for use, otherwise it's "out of scope".  

Think of scope like a container of one-way glass around certain chunks of code.  Inside that container, your variable or method can see (or use) anything in the world outside the container but the outside world can't see in.

**A new scope** is created when you first define a variable.  That variable is then accessible by anything "downstream" of it in the code, until the current scope is exited (by leaving a method or loop, for instance):

    def launch_longships(longships)
        # Here we can't yet use `longship`, `longships_count` or `longship_name`.  We CAN use `longships` because it was passed in above this point.
        launched_ships = 0
        # Now launched_ships is in scope so we can use it
        longships.each do |longship|
            # Now `longship` is in scope, so we can use it
            longship_name = "#{longship.owner.name}'s Reaver"
            # Now `longship_name` is in scope so we can use it
            longship.launch
            launched_ships += 1
            puts "#{longship_name} successfully launched!"
        end
        # Now we've exited the loop so `longship` and `longship_name` are no longer in scope so we cannot use them.
        puts "Excellent news! We've launched #{launched_ships} ships!"
    end

A good rule of thumb for scope is that you create a new scope any time you should indent your code and any time within that indent a new variable is defined.

Method scope is similar but has some important differences because it deals much more explicitly with the notion of **privacy**.  You still can't call a method until the Ruby interpreter has had the chance to define it.  By default, instance methods can be called by any instance of a class (e.g. `oleg.sleep`) and class methods can be called directly on the class itself (e.g. `Viking.new`).

But what if we've got a really sensitive method like `#die` that we don't want anyone else to be able to call directly... it should ONLY be available to other methods from within THAT PARTICULAR instance of a Viking.  So we don't want to be able to say `> oleg.die` from the command line, but we do want to be able to kill off oleg if he loses all his health.  So we create a chunk of code marked **`private`**:

    class Viking < Person
        ...
        def take_damage(damage)
            @health -= damage
            die if @health <= 0
        end
        private
          def die
              puts "#{self.name} has been killed :("
              self.dead = true    # assume we've defined a `dead` instance variable
          end
    end

    > oleg = Viking.create_warrior("Oleg")
    > oleg.die
    NoMethodError: private method `die' called for #<Viking:0x007ffd4c041e50>
    > oleg.take_damage(200)
    Oleg has been killed :(
    => true

If you create methods that should only be accessible by other methods within your class, make them `private`.  This is the default setting for instance variables unless you expose them using the afore-mentioned `attr_accessor`.  

You should change the default thought in your head from "everything is accessible, what do I need to hide?" to "everything should be hidden, what do I absolutely need to make externally available?"   That principle will take you far, especially when designing things like APIs that will be used by other programs.  The more you make available to people, the harder it will be later on to hide it again.

How do we put this to good use?  In our above example, there's really no reason for us to be able to directly call `#take_damage` on our Viking instance either... it's an implementation detail (why would a user ever need to say `oleg.take_damage(10)` directly?  So we should probably rearrange things a bit to provide an even more high-level method to abstract `#take_damage` away from our user.

If we create an `#attack` method for one instance to `#attack` another, then we can have that method deal with the damage stuff on its own so the user is none-the-wiser.  But we can't make our `#take_damage` method `private` because otherwise we could only call it on the specific viking who is DOING the attacking.  We want to call it on the RECIPIENT of the attack (remember, `private` methods can only be called from within the same instance).

Since we don't want `#take_damage` to be visible to anyone on the command line but we DO want it to be visible to the methods inside other instances of `Viking`, we call that **`protected`**.  `protected` provides most of the privacy of `private` but lets the methods inside other instances of the same class or its descendents also access it:

    class Viking < Person
        ...
        def attack(recipient)
            if recipient.dead
                puts "#{recipient.name} is already dead!"
                return false
            end
            damage = (rand * 10 + 10).round(0)
            recipient.take_damage(damage)  # `take_damage` called on `recipient`!
        end
        protected
            def take_damage(damage)
                self.health -= damage
                puts "Ouch! #{self.name} took #{damage} damage and has #{self.health} health left"
                die if @health <= 0  
                # `die` called from within the same object as take_damage was (the `recipient` as well!)
            end
        private
            def die
                puts "#{self.name} has been killed :("
                self.dead = true  # assume we've defined a `dead` instance variable
            end
    end

    > oleg = Viking.create_warrior("Oleg")
     => #<Viking:0x007ffd4b8b5588 @age=24.58111251562904, @name="Oleg", @health=120, @strength=10, @dead=false> 
    > sten = Viking.create_warrior("Sten")
     => #<Viking:0x007ffd4b8e1700 @age=28.80998656037281, @name="Sten", @health=120, @strength=10, @dead=false> 
    > 10.times { oleg.attack(sten) }
    Ouch! Sten took 19 damage and has 101 health left
    Ouch! Sten took 10 damage and has 91 health left
    Ouch! Sten took 13 damage and has 78 health left
    Ouch! Sten took 17 damage and has 61 health left
    Ouch! Sten took 15 damage and has 46 health left
    Ouch! Sten took 11 damage and has 35 health left
    Ouch! Sten took 14 damage and has 21 health left
    Ouch! Sten took 14 damage and has 7 health left
    Ouch! Sten took 18 damage and has -11 health left
    Sten has been killed :(
    Sten is already dead!
     => 10 
    > sten
    => #<Viking:0x007ffd4c048840 @age=25.601709008134428, @name="Sten", @health=-11, @strength=10, @dead=true>

So that's privacy for you, and it can be summed up by saying *"don't let anything access any methods or variables that it doesn't need to.  It's on a 'need-to-know' basis, and it doesn't need to know."*  It's not as big an issue while you're building toy projects, but becomes more important when you're interfacing with the real world and you want to zip up your classes tightly to prevent any malicious or unintended shenanigans from occurring.

Another similar principle is that a method should not reach outside its scope to modify variables unless that is the stated intention of the method.  A method should take inputs and provide a return without needing to modify anything else.  It could easily be called the *"look but don't touch"* principle... you can use variables from outside your method but don't modify them unless you must!

### That's it!


## Test Yourself

1. Make sure you can do [Quiz #5](http://www.codequizzes.com/topics/24/quizzes/79) from [Code Quizzes](http://www.codequizzes.com).
2. Make sure you can do [Quiz #7](http://www.codequizzes.com/topics/24/quizzes/81) as well.
1. Then do their [Practical Object Oriented Design Quiz](http://www.codequizzes.com/topics/1/quizzes/40), which will delve deeper into design principles.  There are some new concepts here to pick up as well.

## Additional Resources

* If you'd still like to learn more about how to really design more concise, effective, purposeful classes, check out [Practical Object-Oriented Design in Ruby](http://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330) from Sandi Metz.
* [Zetcode's Variables section](http://zetcode.com/lang/rubytutorial/variables/)
* Now you're ready to read through [Zetcode's OOP section](http://zetcode.com/lang/rubytutorial/oop/)
* Read through [Zetcode's second OOP section](http://zetcode.com/lang/rubytutorial/oop2/) until they start talking about exceptions (~80% of the way down)
