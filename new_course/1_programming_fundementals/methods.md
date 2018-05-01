# Methods
Methods, also known as functions, are one of the foundational building blocks in programming. Almost every language implements some way of making methods.

You will often find yourself writing the same code in different places in your program. Wouldn't it be great if there was a way to reuse the same code over and over again without having to write it all out each time?

This is what methods are for. They allow you to wrap sections of your code in a name, which you can then use where you need that code to be run in your program, and as many times are you need.

This concept allows for what programmers refer to as the *D.R.Y.* approach to programming *-Don't Repeat Yourself-*. For one, programmers are known for being lazy, but as you will see this is actually a good thing. Recycling parts of code that would otherwise need to be repeated, often numerous times in several places, *can* make your program more readable and more manageable.

In this lesson we are going to deconstruct what methods are, their behaviour, and how they are used.

## Learning Outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* You understand how to use Ruby's built in methods on objects
* How would you create your own custom method?
* How would you *call* your own methods?
* What is the difference between a explicit and implicit return in your methods?
* You understand the difference between `puts` and `return`

## Ruby's Built in Methods
* explain what they are, you've already been using them.

## Creating a Method
You can create your own custom methods in Ruby like so:
```(ruby)
def my_name
  "Joe Smith"
end

puts my_name #=> "Joe Smith"
```
Let's break it down:
`def` - is a built in Ruby keyword. It lets Ruby know this is the start of a method *definition*.

`my_name` - is the name you are giving to the method. You can pretty much name it whatever you want. But there are some constraints and conventions which are described in the next section.

`"Joe Smith"` - is in the *method body*. This is where all the logic of your method goes. This particular method will just *return* a string when it is *called*.

`end` - as you might have guessed `end` marks the *end* of the method definition. It's another Ruby keyword.

To call the method you simply need to use its name, as shown in the last line of the example `puts my_name`

In this example, the output is `"Joe Smith"` because when you write `puts my_name` you are putsing what is *returned* by the method `my_name`.  And that method simply *returns* the string `"Joe Smith"` because that string is all that is in the body of that method. This is known as an *implicit return*, which will be described a bit later in this lesson.



## Parameters and Arguments
* basics about what parameters are
* default parameters

## What Methods Return
* explicit and implicit returns

More specifically, the string `"Joe Smith"` is the last line of the method.  Whatever is stated on the last line of a method is what it will return.  

In facts, methods typically need a `"return"` keyword at the end. But Ruby will take care of this for you by implicitly inferring the "return" keyword for you to the last line in the body of your method if you did not include one. Ruby will interpret your method as though it was written like so:

```(ruby)
def my_name
  return "Joe Smith"
end
```


A *return* might not be in the last line of a method, or perhaps not even the only *return* in a method's body. The method below will behave differently based on the argument you pass to it and an if statement with two possible *return* statements:

```(ruby)
def even_odd(num_argument)
  if num_argument % 2 == 0
    return "That is an even number."
  else
    return "That is an odd number."
  end
end

puts even_odd(16) #=>  That is an even number.
puts even_odd(17) #=>  That is an odd number.
```

The important thing to understand is that if at any point the method encounters a line with an *explicit return* statement, that line will be last thing that will be evaluated.  So anything after the first *return* will be ignored or skipped.

Just like in the `my_name` method, the *return* keywords are not even needed on either line in this example, though it may be easier to visualize to include them.

Ruby actually simply returns the last line that is evaluated.  By placing a *return* keyword, you are effectively saying "This is the last line that should be evaluated, ignore everything after this."

Therefore having a good understanding of just what your methods are returning is an important part of debugging your code when things don't behave as expected. Practice will help your understanding of this concept.




## Chaining Methods
* how it works

## Best practices
* naming them
* not too many parameters
* bang methods
* predicate methods

### Assignment
1. To get a good introduction to all the different concepts related to methods read [this chapter about methods](https://launchschool.com/books/ruby/read/methods) from Launch School's Introduction to Programming with Ruby book. Make sure to do the exercises at the end of the chapter too.
2. For a deeper look at methods read [this chapter](http://ruby.bastardsbook.com/chapters/methods/) from the Bastards book of Ruby. Again try to complete the exercises throughout the chapter.  


## Exercises
This will link to an external repo which will include exercises and tests

## Further Reading
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

1. Within the context of Ruby, you will only be writing methods.  But for future learning, as you add more languages to your repertoire (cause any seasoned programmer worth their salt eventually will have learned several languages over the course of their careers), here is a [handy explanation on Stack Overflow](https://stackoverflow.com/questions/155609/difference-between-a-method-and-a-function) on the subtle differences between methods and functions, and how they can differ by language.
