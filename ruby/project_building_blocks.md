# Projects: Ruby Building Blocks
*Estimated Time: 3-5 hrs*

*Don't forget to use Git to save your projects!*

By now you should feel pretty good working with strings, arrays and hashes.  We'll do a couple of classic "intro to programming" problems here to help solidify your knowledge and get warmed up to working on small projects.  You'll need to rely on some of your basic knowledge of conditionals and flow control from the prep work but you shouldn't need to do anything you haven't seen before.

You can do these in IRB or create a separate script file to run from the command line if you know how to do that (we'll cover it in the next few sections).

*Note: If you want to actually write and run your own Ruby code, you can either use IRB from the command line (type `irb` after the prompt), or run it from a script file using `$ ruby ./your_file_name_in_the_current_directory.rb`, or use the online editor at [repl.it](http://repl.it/languages/Ruby).*

## Warmup

Build the simple [User Input Word Counter tutorial from Codecademy](http://www.codecademy.com/courses/ruby-beginner-en-693PD/0/1).

## Project 1: Caesar Cipher

From Wikipedia:

>In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.

There's a brief video about it [from Harvard's CS50 class](http://cs50.tv/2012/fall/shorts/caesar_cipher/caesar_cipher-720p.mp4).

### Your Task

Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

```language-bash
    > caesar_cipher("What a string!", 5)
    => "Bmfy f xywnsl!"
```

**Quick Tips:**

* You will need to remember how to convert a string into a number.
* Don't forget to wrap from `z` to `a`.
* Don't forget to keep the same case.

### Student Solutions
*[Submit a link](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) to the github repo with your files in it here with a pull request.  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Solution from oafridi](https://github.com/oafridi/ruby_dev/blob/master/caesar_cipher.rb)
* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/caesar_cipher.rb)
* [Solution from bartliolio](http://github.com/bartliolio/odin_project/blob/master/caesar_cipher/caesar_cipher.rb)
* [Solution from ThusStyles](https://github.com/ThusStyles/cipher/blob/master/cipher.rb)
* [Solution from Sessl](https://github.com/Sessl/ruby_work/blob/master/cipher.rb)
* [Solution from Eugyev](https://github.com/eugyev/odinprojects/blob/master/cypher.rb)
* [Solution from neekburm](https://github.com/neekburm/odinproject/blob/master/caesar_cypher.rb)
* [Solution from NoRest4AWhearry](https://github.com/NoRest4AWhearry/Caesars_Cipher)
* [Solution from Jamie](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project1.rb)
* [Solution from Aniruddh Agarwal](https://github.com/aniruddhagarwal/odin-projects/blob/master/caesar_cipher/caesar_cipher.rb)
* Your Solution Here


## Project 2: Stock Picker

### Your Task

Implement a method `#stock_picker` that takes in an array of stock prices, one for each hypothetical day.  It should return a pair of days representing the best day to buy and the best day to sell.  Days start at 0.

```language-bash
    > stock_picker([17,3,6,9,15,8,6,1,10])
    => [1,4]  # for a profit of $15 - $3 == $12
```

**Quick Tips:**

* You need to buy before you can sell
* Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

### Student Solutions
*[Submit a link](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) to the github repo with your files in it here with a pull request.  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/stock_picker.rb)
* [Solution from bartliolio](https://github.com/bartliolio/odin_project/blob/master/stock_picker/stock_picker.rb)
* [Solution from eugyev](https://github.com/eugyev/odinprojects/blob/master/stock_picker.rb)
* [Solution from Jamie](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project2.rb)
* [Solution from Aniruddh Agarwal](https://github.com/aniruddhagarwal/odin-projects/blob/master/stock_picker/stock_picker.rb)
* Your Solution Here


## Project 3: Substrings

### Your Task

Implement a method `#substrings` that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument.  It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

```language-bash
    > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

    > substrings("below", dictionary)
    => {"below"=>1, "low"=>1}
```

Next, make sure your method can handle multiple words:

```language-bash
    > substrings("Howdy partner, sit down! How's it going?", dictionary)
    => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
```
    

**Quick Tips:**

* Recall how to turn strings into arrays and arrays into strings.

### Student Solutions
*[Submit a link](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) to the github repo with your files in it here with a pull request.  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/substrings.rb)
* [Solution from bartliolio](https://github.com/bartliolio/odin_project/blob/master/substrings/substrings.rb)
* [Solution from eugyev](https://github.com/eugyev/odinprojects/blob/master/substrings.rb)
* [Solution from Jamie](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project3.rb)
* [Solution from Aniruddh Agarwal](https://github.com/aniruddhagarwal/odin-projects/blob/master/sub_string/substring.rb)
* Your Solution Here
