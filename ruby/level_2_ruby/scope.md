## Scope and Privacy
### Intro and Goals

You're able to break up your code into methods and classes but you'll also need to think more explicitly about which variables and methods are accessible where.  We started talking about that concept a little bit in the section on classes, which dealt with the differences between class methods/variables versus instance methods/variables and the idea of inheriting the methods of a parent class.  Here, you should take that general understanding and build on it further.

In a similar vein, you'll also learn more about how you can shield certain methods from being usable from outside of a class.  You started learning about that idea when we used `attr_accessor` to make instance variables "visible" from outside your instance, but we'll dive deeper here and give you more tools to very explicitly decide what you do and don't want to show to the world.


### Thought Questions
* What is scope?
* When can you start using a variable?
* When is a new scope defined?
* When are methods in scope?
* What is a private method?
* What is a protected method?
* How are private and protected methods different?
* What does "encapsulation" mean?


### Do These First
* [Zetcode's Variables section](http://zetcode.com/lang/rubytutorial/variables/)
* Finish [Zetcode's OOP Section](http://zetcode.com/lang/rubytutorial/oop/), reading from "Inheritance" onwards (starts about 3/4 of the way down)


### A Brief Summary

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

But what if we've got a really sensitive method like `die` that we don't want anyone else to be able to call directly... it should ONLY be available to other methods from within THAT PARTICULAR instance of a Viking.  So we don't want to be able to say `> oleg.die` from the command line, but we do want to be able to kill off oleg if he loses all his health.  So we create a chunk of code marked **`private`**:

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
How do we put this to good use?  In our above example, there's really no reason for us to be able to directly call `take_damage` on our Viking instance either... it's an implementation detail (why would a user ever need to say `oleg.take_damage(10)` directly?  So we should probably rearrange things a bit to provide an even more high-level method to abstract `take_damage` away from our user.  

If we create an `attack` method for one instance to `attack` another, then we can have that method deal with the damage stuff on its own so the user is none-the-wiser.  But we can't make our `take_damage` method `private` because otherwise we could only call it on the specific viking who is DOING the attacking.  We want to call it on the RECIPIENT of the attack (remember, `private` methods can only be called from within the same instance).  

Since we don't want `take_damage` to be visible to anyone on the command line but we DO want it to be visible to the methods inside other instances of `Viking`, we call that **`protected`**.  `protected` provides most of the privacy of `private` but lets the methods inside other instances of the same class or its descendents also access it:

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


### Exercises
### Additional Resources
