### Introduction

Recursion, very briefly, is where a function calls itself and waits for that call to finish, before continuing the original function. On a basic, crude level, this behaviour behaves somewhat like a loop; performing itself until some requirement is met. There are, however; fundamental differences between `recursion` and `iteration` (using loops). 

This lesson will cover what `recursion` is, when you may want to use it and when you really shouldn't, so that it is yet another tool in your problem-busting arsenal! The lesson will also briefly go over `stack overflow`, an error that you may run into if you don't use `recursion` correctly. 

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment

* Why is recursion a useful technique for solving a big problem?
* What are the limitations of using recursive solutions?
* What types of problems are great for recursion?
* What is meant by "recursive depth?"
* What is a "stack overflow" (the concept, not the website)?
* Why is that relevant to a recursive problem?

### First of, what actually is recursion?

As described very briefly in the introduction, recursion is where a function calls itself and waits for that call to finish, before continuing the original function. Functions that follow this type of behaviour is known as a `recursive function`. A function that calls *itself*? *Huh?* That sounds like it could go on forever, and it can if you're not careful! For now, let us consider a very basic example of pseudocode (which should not be used in the real world) to demonstrate the concept:

~~~ruby
  define function sum_of_squares(N)
    if N equals 1, return 1
    let M = N-1
    let sum = N*N + sum_of_squares(M)
    return sum


  print output of sum_of_squares(5)
~~~

So what will happen here? We've defined our function, `sum_of_squares` to check if it's input is `equal to 1`, and if so, `return 1`. If this is not the case, We subtract 1 from the input and assign the value to `M`. We then take the sum of our original input `N` times by itself, and the output of `sum_of_squares` with input M. So what will this look like? Let's find out:

~~~ruby
  sum_of_squares(5) = 5*5 + sum_of_squares(4)
  sum_of_squares(4) = 4*4 + sum_of_squares(3)
  sum_of_squares(3) = 3*3 + sum_of_squares(2)
  sum_of_squares(2) = 2*2 + sum_of_squares(1)
  sum_of_squares(1) = 1
  
  sum_of_squares(2) = 2*2 + 1 = 5
  sum_of_squares(3) = 3*3 + 5 = 14
  sum_of_squares(4) = 4*4 + 14 = 30
  sum_of_squares(5) = 5*5 + 30 = 55
~~~

As you can see, before we can work out, or `evaluate` the result of the `original sum_of_squares(5)`, we must evaluate the result of the function underneath it. This is a very contrived example of a problem that you could easily work out with a loop, or some clever maths; but hopefully this will help introduce you to what recursion is.

### What is recursion useful for?

The main use of recursion is for breaking down a `large problem` into similar but `smaller chunks` and using the solution to those chunks to solve the problem as a whole. The idea behind this rationale is that eventually you break the problem down into such small pieces that you can quickly arrive to an answer for that piece, and your answers stack up. This approach is commonly known as a `Divide and Conquer` algorithm. 

From the [Wikipedia entry on Divide and Conquer Algorithms](http://en.wikipedia.org/wiki/Divide_and_conquer_algorithm):

> In computer science, divide and conquer (D&C) is an important algorithm design paradigm based on multi-branched recursion. A divide and conquer algorithm works by recursively breaking down a problem into two or more sub-problems of the same (or related) type, until these become simple enough to be solved directly. The solutions to the sub-problems are then combined to give a solution to the original problem.

To give a very general example, this a vague, high level example of what a Divide and Conquer Algorithm looks like:

~~~ruby
  define function do_a_thing( input )
    if input fits your requirements, return solution on that input

    let smaller_thing = do_a_thing( smaller_chunk )
    let other_smaller_thing = do_a_thing( other_smaller_chunk )

    do something with smaller_thing and other_smaller_thing
~~~

Your function doesn't necessarily have to split the problem into two smaller chunks each time, it can be broken into many more if necessary!

### This seems very convenient! What's the catch?

As you've seen, recursive functions can be very useful when approaching a problem that can be broken down into smaller subproblems! However, there are a couple of downsides to this; some of them are very technical which we won't go into for now; but one big downside is a situation called `Stack Overflow`. Yes, it does sound very familiar to a certain website you visit to solve all your programming problems!

So what is `Stack Overflow?` To answer that, let's gloss over feature that languages use called `The Stack` (not to be confused with a data structure we will cover in future!). Programs, regardless of the language, will make use of a finite section of reserved memory called `The Stack`. `The Stack` also shares this section of memory with other features that programs use. Programs will take `values` and `functions` and place them on top of `The Stack`, to be removed and used at a later time.

So what does this have to do with recursion? When you recurse a function, you have to place the function doing the calling onto `The Stack` until such a point where no more recursive calls are being made; then you start removing previous calls from `The Stack` and evaluating them.

`Stack Overflow` is when you're calling too many recursive functions without resolving them that `The Stack` becomes full and cannot store any more functions; and to prevent your program from spilling over and overwriting other important memory, your program stops and throws a `Stack Overflow` error.

Save whatever work you've been doing before, and in your language of choice, write a function that calls itself infinitely and run it. You'll quickly find the error!

So how do we stop `Stack Overflow?` The first and most likely idea is to check that your function actually returns or stops when a certain condition has been met (like when N = 1 in our `sum_of_squares` pseudo-code!). If your code never reaches it, you are going on forever! Like in our `sum_of_squares` code: If we set the original input as 0 or a negative number, the calls will never stop!

The second idea is understanding that the problem might just be *far too big* for straight-forward recursion to work. This may mean you have to work out some iterative solution, or start getting clever with how you recurse.

### Conclusion

In this lesson, we have covered the need-to-know of what recursion is, how to use it and situations where it's a good idea to utilise this valuable tool! We have also discussed one of the biggest pitfalls of recursion, why it exists, and how to mitigate this issue. With this knowledge, you should now have some idea of how to approach tasks in our future projects and lessons!


### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Read the [Chapter on Recursion](http://ruby.bastardsbook.com/chapters/recursion/) in the Bastards Book of Ruby by Dan Nguyen
  2. Watch this [Video on Recursion](http://vimeo.com/24716767) by Joshua Cheek but only until minute 17:36!  (don't want to give away the project...)
  3. Read the ["Implementation Issues" section of the wiki article](http://en.wikipedia.org/wiki/Divide_and_conquer_algorithm#Implementation_issues) to get an overview of some of the limitations of recursion.
</div>

### Test Yourself

<div class="lesson-content__panel" markdown="1">
  1. Complete the [Code Quiz](http://www.codequizzes.com/computer-science/beginner/recursion) on Recursion.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.


* ["What is Ruby Recursion and How Does It Work?"](http://stackoverflow.com/questions/6418017/what-is-ruby-recursion-and-how-does-it-work) on Stack Overflow
* [Efficient Recursion from U of Alberta](http://webdocs.cs.ualberta.ca/~holte/T26/efficient-rec.html)
* [Natashatherobot's blog post on Recursion in Ruby](http://natashatherobot.com/recursion-factorials-fibonacci-ruby/)
* [Functional Programming Techniques with Ruby post](http://www.sitepoint.com/functional-programming-techniques-with-ruby-part-iii/), which covers recursion at the top
* [CS50 explanation of recursion](https://www.youtube.com/watch?v=mz6tAJMVmfM)
* [A breakdown of the recursive Fibonacci method](https://youtu.be/zg-ddPbzcKM) from Khan Academy
