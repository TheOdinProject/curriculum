### Introduction

Recursion is the idea that a function calls itself. That is all there is to it. It's used to take a big problem and start breaking it down into smaller and smaller pieces ("Divide and Conquer") and continuing to feed their solutions back into the original function until some sort of answer is achieved and the whole chain unwinds.

From the [Wikipedia entry on Divide and Conquer Algorithms](http://en.wikipedia.org/wiki/Divide_and_conquer_algorithm):

> In computer science, divide and conquer (D&C) is an important algorithm design paradigm based on multi-branched recursion. A divide and conquer algorithm works by recursively breaking down a problem into two or more sub-problems of the same (or related) type, until these become simple enough to be solved directly. The solutions to the sub-problems are then combined to give a solution to the original problem.

There's also a right and wrong way to use recursion. The fact is, any problem you can solve recursively, you can also solve using the iterators that you know and love. If you find yourself saying "why didn't I just use a `while` loop here?" then you probably should have. You won't often end up using a recursive solution to a problem, but you should get a feel for when it might be a good idea. Some problems also break down into far too many pieces and totally overwhelm your computer's memory. There's a balance.

In this brief lesson, you'll get a chance to learn more about when and how to use recursion and then in the next project you will get the chance to apply some of that (since it probably won't really stick until you've had a chance to try it).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Why is recursion a useful technique for solving a big problem?
- What are the limitations of using recursive solutions?
- What types of problems are more suited for loops than recursion?
- What is meant by "recursive depth"?
- What is a "stack overflow" (the concept, not the website)?
- Why is that relevant to a recursive problem?

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Read [this recursion resource](https://javascript.info/recursion) for a good intro to recursion.
  2. Watch [this explanation of recursion](https://www.youtube.com/watch?v=6oDQaB2one8) by Web Dev Simplified and [this additional example of recursion](https://youtu.be/LteNqj4DFD8?t=340) by DevSage.
  3. Watch this [Video on Recursion](https://www.youtube.com/watch?v=mz6tAJMVmfM) from CS50.
  4. Read the ["Implementation Issues" section of the wiki article](http://en.wikipedia.org/wiki/Divide_and_conquer_algorithm#Implementation_issues) to get an overview of some of the limitations of recursion.
</div>

### Test yourself

<div class="lesson-content__panel" markdown="1">
  1. Solve each of the questions from this [Code Quiz](https://www.codingame.com/playgrounds/5422/js-interview-prep-recursion) on Recursion. It is not important to have recursive algorithms committed to memory at this point; just understand how to create and use them.

<div class="lesson-note lesson-note--warning" markdown="1">
The solution for "Question 6: Search JS object" is incorrect. See the [corrected solution](https://gist.github.com/JoshDevHub/b00125f483d4a1ecc257eaa030916973) after you solve it.
</div>

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [How would you briefly define a recursive function?](#introduction)
- [What is the point of recursion? Is it more efficient than using a plain loop?](http://ruby.bastardsbook.com/chapters/recursion/)
- [What are the 2 essential parts in a recursive function?](https://youtu.be/mz6tAJMVmfM?t=193)
- [Why is "stack overflow" relevant to a recursive problem?](https://en.wikipedia.org/wiki/Divide-and-conquer_algorithm#Stack_size)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [Efficient Recursion from U of Alberta](http://webdocs.cs.ualberta.ca/~holte/T26/efficient-rec.html)
- [A good resource of recursion by example](https://www.javascripttutorial.net/javascript-recursive-function/)
- [Visualize how recursion works on factorials](https://pythontutor.com/render.html#code=function%20calcFactorial%28num%29%20%7B%0A%20%20%20%20if%20%28num%20%3D%3D%3D%201%29%20%7B%0A%20%20%20%20%20%20%20%20return%201%3B%0A%20%20%20%20%7D%0A%20%20%20%20return%20num%20*%20calcFactorial%28num%20-%201%29%3B%0A%7D%0A%0AcalcFactorial%285%29%3B&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=js&rawInputLstJSON=%5B%5D&textReferences=false)
- [You may want to watch this nice freecodecamp course. It explains the logic of recursion very well.](https://www.youtube.com/watch?v=IJDJ0kBx2LM&t=2333s)
- [This video presents a few interesting problems with recursion](https://www.youtube.com/watch?v=ngCos392W4w)
