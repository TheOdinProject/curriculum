# Methods
Methods, also known as functions, are one of the foundational building blocks in programming.
Almost every language implements some way of making methods.

You will often find yourself writing the same code in different places in your code.
Wouldn't it be great if there was a way to reuse the same code over and over again 
without having to write it all out again? 

This is what methods are for. They allow you to wrap code in a name which you
can then use where you need that code to be run in your programs.

In this lesson we are going to deconstruct what methods are, their behaviour, and how they are used.

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* You understand how to use Rubys built in methods on objects
* You know how to create your own custom methods
* You know how to *call* your own methods
* You understand the difference between a explicit and implicit return in your methods
* You understand the difference between `puts` and `return`

## Rubys Built in Methods
* explain what they are, you've already been using them.

## Creating a Method
You can create your own custom methods in Ruby like so:
```(ruby)
def my_name
  "Joe Smith"
end

puts my_name #=> "Joe Smith"
```
Lets breake it down:
`def` - is a built in Ruby keyword. It lets Ruby know this is the start of a method *definition*. 

`my_name` - is the name of the method. You can name pretty much name it whatever you want. But there are some constraints and conventions which are described in the next section.

`"Joe Smith"` - is in the *method body*. The method body is where the logic of your method goes.This particular method will just *return* a string when its *called*

`end` - as you might have guessed `end` marks the *end* of the method definition. Its another Ruby keyword.

To call the method you simply need to use its name, as shown in the last line of the example `puts my_name`

## Parameters and Arguments
* basics about what parametrs are
* default parameters

## What Methods Return
* explicit and implicit returns

## Chaining Methods
* how it works

## Best practices
* naming them
* not too many parameters
* bang methods
* predicate methods

## Assignment
1. To get a good introduction to all the different concepts related to methods read [this chapter about methods](https://launchschool.com/books/ruby/read/methods) from Launch Schools Introduction to Programming with Ruby book. Make sure to do the exercises at the end of the chapter too.
2. For a deeper look at methods read [this chapter](http://ruby.bastardsbook.com/chapters/methods/) from the Bastards book of Ruby. Again try to complete the exercises throughout the chapter.  


## Exercises
This will link to an external repo which will include exercises and tests

## Further Reading Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

Link to no more than three additional resources to avoid this section becoming too cluttered.
