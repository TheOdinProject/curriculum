### Introduction

Recursion is the idea that a function calls itself. Pretty straightforward, right? It's used to take a big problem and start breaking it down into smaller and smaller pieces ("Divide and Conquer") and continuing to feed their solutions back into the original function until some sort of answer is achieved and the whole chain unwinds.

From the [Wikipedia entry on Divide and Conquer Algorithms](http://en.wikipedia.org/wiki/Divide_and_conquer_algorithm):

> In computer science, divide and conquer (D&C) is an important algorithm design paradigm based on multi-branched recursion. A divide and conquer algorithm works by recursively breaking down a problem into two or more sub-problems of the same (or related) type, until these become simple enough to be solved directly. The solutions to the sub-problems are then combined to give a solution to the original problem.

There's also a right and wrong way to use recursion.  The fact is, any problem you can solve recursively, you can also solve using the iterators that you know and love.  If you find yourself saying "why didn't I just use a `while` loop here?" then you probably should have.  You won't often end up using a recursive solution to a problem, but you should get a feel for when it might be a good idea.  Some problems also break down into far too many pieces and totally overwhelm your computer's memory.  There's a balance.

In this brief lesson, you'll get a chance to learn more about when and how to use recursion and then in the next project you will get the chance to apply some of that (since it probably won't really stick until you've had a chance to try it).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Why is recursion a useful technique for solving a big problem?
- What are the limitations of using recursive solutions?
- What types of problems are more suited for simple loops than recursion?
- What is meant by "recursive depth"?
- What is a "stack overflow" (the concept, not the website)?
- Why is that relevant to a recursive problem?

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Read the [Chapter on Recursion](http://ruby.bastardsbook.com/chapters/recursion/) in the Bastards Book of Ruby by Dan Nguyen.
  2. Watch [this explanation of Recursion](https://www.youtube.com/watch?v=6oDQaB2one8) by Web Dev Simplified.
  3. Watch this [Video on Recursion](https://www.youtube.com/watch?v=mz6tAJMVmfM) from CS50.
  4. Read the ["Implementation Issues" section of the wiki article](http://en.wikipedia.org/wiki/Divide_and_conquer_algorithm#Implementation_issues) to get an overview of some of the limitations of recursion.
</div>

### Test yourself

<div class="lesson-content__panel" markdown="1">
  1. Solve each of the questions from this [Code Quiz](http://www.codequizzes.com/computer-science/beginner/recursion) on Recursion. You are not expected to answer them from memory at this point.
</div>

### Knowledge check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* <a class="knowledge-check-link" href="#introduction">How would you briefly define a recursive function?</a>
* <a class="knowledge-check-link" href="http://ruby.bastardsbook.com/chapters/recursion/">What is the point of recursion? Is it more efficient than using a plain loop?</a>
* <a class="knowledge-check-link" href="https://youtu.be/mz6tAJMVmfM?t=193">What are the 2 essential parts in a recursive function?</a>
* <a class="knowledge-check-link" href="https://en.wikipedia.org/wiki/Divide-and-conquer_algorithm#Stack_size">Why is "stack overflow" relevant to a recursive problem?</a>

### Additional resources
This section contains helpful links to related content. It isn't required, so consider it supplemental.

- ["What is Ruby Recursion and How Does It Work?"](http://stackoverflow.com/questions/6418017/what-is-ruby-recursion-and-how-does-it-work) on Stack Overflow
- [Efficient Recursion from U of Alberta](http://webdocs.cs.ualberta.ca/~holte/T26/efficient-rec.html)
- [Natashatherobot's blog post on Recursion in Ruby](https://web.archive.org/web/20210121055221/http://natashatherobot.com/recursion-factorials-fibonacci-ruby/)
- [Functional Programming Techniques with Ruby post](http://www.sitepoint.com/functional-programming-techniques-with-ruby-part-iii/), which covers recursion at the top
