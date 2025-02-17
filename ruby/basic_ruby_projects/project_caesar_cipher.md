### Introduction

By now you should feel pretty good working with strings, arrays and hashes. We'll do a couple of classic "intro to programming" problems in the next few lessons to help solidify your knowledge and get warmed up to working on small projects. You'll need to rely on some of your basic knowledge of conditionals and flow control from the prep work but you shouldn't need to do anything you haven't seen before.

<div class="lesson-note" markdown="1">

If you want to actually write and run your own Ruby code, you can either use IRB from the command line (type `irb` after the prompt), or run it from a script file using `$ ruby ./your_file_name_in_the_current_directory.rb`, or use the online editor at [replit.com](http://replit.com/languages/Ruby).

</div>

### Assignment

From Wikipedia:

> In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.

Harvard's CS50 class has a [video about the Caesar cipher](https://www.youtube.com/watch?v=36xNpbosfTY).

<div class="lesson-content__panel" markdown="1">

  Implement a Caesar cipher that takes in a string and the shift factor and then outputs the modified string using a right shift:

```ruby
  > caesar_cipher("What a string!", 5)
  => "Bmfy f xywnsl!"
```

**Quick Tips:**

- You will need to remember how to convert a string into a number.
- Don't forget to wrap from `z` to `a`.
- Don't forget to keep the same case.
- The Wikipedia quote discusses a Caesar cipher using a left shift.

</div>
