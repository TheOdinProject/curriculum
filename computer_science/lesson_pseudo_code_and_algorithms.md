### Introduction

You've learned how to build some cool stuff already and, frankly, you could probably make some decent websites without a crazy amount of additional formal education.  However, just because you can write English at a grade school level doesn't mean you will be editing the New York Times anytime soon.

In the world of programming, there's a difference between solving a problem the brute force way and solving a problem WELL.  We touched on the first layer of this when we covered basic object-oriented programming and how you should break apart your code into well-organized chunks.  

If you assume those lessons were all about learning how to write good code, these next few lessons are going to be about training yourself to figure out the best code to write -- the most elegant solution to the problem at hand.  It becomes particularly important whenever you start working with large data sets, like when your website becomes highly successful.

We're taking a look at some more Computer Science-y concepts here because they are fundamental for a reason.  Some problems require you to use tools beyond just arrays and iterators.  You're going to build chess and it's not fundamentally difficult (it's just a rules-based game after all) but there are some tricks that you'll want to use to help you solve it.  There's no sense reinventing the wheel when others have already figured out good methods for solving certain types of problems.

If that doesn't get you interested, remember that this curriculum is meant to prepare you for life beyond the web page.  If you're interested in applying for a job, you'll be asked questions that directly touch on some of this stuff.  It's going to require you to put on your thinking cap (sorry, it had to happen sometime), but we won't be doing anything too crazy.  We'll stick to the practical side of this material as opposed to getting too stuck in theory.

It should be prefaced that although you may read that you may not be involved in writing algorithms very often in web development; it's a good idea to at least develop an awareness of what algorithms are, as well as the names of some algorithms or problems so you know how to quickly fix issues you will run into.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

* What is an algorithm?
* What is pseudo-code?

### What is pseudo-code?

Before we get into algorithms, we need to understand what pseudo-code is and how one writes pseudo-code. Pseudo-code isn't code that you run on your machine; it's code like your native language that you write down on a piece of paper or in some text editor as a way of "working out" how you'd solve a particular problem. It's a bit like working out a math problem on paper! Let us tackle a very simple problem. We wish to count in twos, from 0 to 10, and print the value! We shall write something English-like, like so:

~~~ruby
  let n = 0
  let addition = 2
  until n equals 10 do
    set n = n + 2
    print n
~~~

Here, we can break down what we've done step by step. We have set variables n, and addition, to 0 and 2 respectively. We then add our addition value to our n value, and set our n variable to that new value. We print out what n is, and then we check if n has a value of 10.

### Well that's cool, but why do this if you can't run the code?

Good question! Think of this as more of a planning phase before you actually start trying to write working code into your project. You will, at times; encounter problems with many particularly large or broad steps. Taking the time to think about these individual steps and breaking them down into smaller, quantized sub-steps will give you a recipe, if you will; to cook up working code (relatively) headache free.

### What is an algorithm?

Can algorithm is a set of step by step instructions on how to solve a particular problem. Recall that just moments ago, we walked through the creation of some pseudo-code to count in twos? We had just wrote an `algorithm` to solve that problem! For such a fancy word, the actual meaning of it isn't all that fancy. When you browse YouTube and you find some YouTuber having a moan about the "YouTube Algorithm", they're just having a moan about the set of step by step instructions that YouTube has coded to decide on what to recommend, or whatever other things YouTube does behind the scenes.

Typically, when someone mentions the word "algorithm" in a technical discussion, they are alluding to a publicly known solution to an particular problem. If you've browsed around the internet in your research or otherwise did some prior learning/reading; you may have heard some of these problems / algorithms. `Mergesort` is an example of an algorithm designed to efficiently tackle the problem of `sorting` an `unsorted array`.

Spoiler alert, later on in the course, you'll be asked to implement the very mentioned algorithm!

### Conclusion and Remarks

In this lesson, we have touched on what pseudo-code is, and had a very brief demonstration in how to write some pseudo-code; as well as touched upon what an algorithm is, as well as learn of one particular algorithm in passing. Your insight into the very mechanisms that makes efficient software work begins here!

It should be stated, however; that your future may or may not involve you developing a lot of algorithms yourself. Not every situation requires you to write a brand-spanking-new solution; in fact, a lot of frameworks or even standard language features will have a lot of explored algorithms already implemented for you! However, it is important to at least have an understanding and appreciation for how these things work. 

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Skim this [Introduction to Algorithms by David Malan](http://ed.ted.com/lessons/your-brain-can-solve-algorithms-david-j-malan) on TedEd to see how to think about algorithms.
  2. Watch [What is an Algorithm?](https://youtu.be/e_WfC8HwVB8) on YouTube. for a more structured look at solving problems using algorithms.
  3. Read [this Quora question about the importance of algorithms in web development](http://www.quora.com/Algorithms/What-is-the-importance-of-algorithms-in-web-development) to get some context for why we're going over this stuff.
  4. Watch [What is pseudocode?](https://www.youtube.com/watch?v=Rg-fO7rDsds)
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Wikipedia on Computer Science](http://en.wikipedia.org/wiki/Computer_science)
* [Wikipedia on Algorithms](http://en.wikipedia.org/wiki/Algorithm)
* [Map of Computer Science](https://youtu.be/SzJ46YA_RaA)
