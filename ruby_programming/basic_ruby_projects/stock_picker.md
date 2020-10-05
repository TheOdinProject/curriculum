### Introduction
By now you should feel pretty good working with strings, arrays and hashes.  We'll do a couple of classic "intro to programming" problems in the next few lessons to help solidify your knowledge and get warmed up to working on small projects.  You'll need to rely on some of your basic knowledge of conditionals and flow control from the prep work but you shouldn't need to do anything you haven't seen before.

Note: If you want to actually write and run your own Ruby code, you can either use IRB from the command line (type `irb` after the prompt), or run it from a script file using `$ ruby ./your_file_name_in_the_current_directory.rb`, or use the online editor at [repl.it](http://repl.it/languages/Ruby).


### Assignment
<div class="lesson-content__panel" markdown="1">

  Implement a method `#stock_picker` that takes in an array of stock prices, one for each hypothetical day.  It should return a pair of days representing the best day to buy and the best day to sell.  Days start at 0.

~~~ruby
  > stock_picker([17,3,6,9,15,8,6,1,10])
  => [1,4]  # for a profit of $15 - $3 == $12
~~~

  **Quick Tips:**

  * You need to buy before you can sell
  * Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.
</div>