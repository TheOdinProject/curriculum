# Projects: Ruby Building Blocks
<!-- *Estimated Time: 3-5 hrs* -->

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

* [Solution from Julian Feliciano](https://github.com/JulsFelic/ruby_building_blocks)
* [Solution from oafridi](https://github.com/oafridi/ruby_dev/blob/master/caesar_cipher.rb)
* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/caesar_cipher.rb)
* [Solution from ThusStyles](https://github.com/ThusStyles/cipher/blob/master/cipher.rb)
* [Solution from Sessl](https://github.com/Sessl/ruby_work/blob/master/cipher.rb)
* [Solution from Eugyev](https://github.com/eugyev/odinprojects/blob/master/cypher.rb)
* [Solution from neekburm](https://github.com/neekburm/odinproject/blob/master/caesar_cypher.rb)
* [Solution from NoRest4AWhearry](https://github.com/NoRest4AWhearry/Caesars_Cipher)
* [Solution from Jamie](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project1.rb)
* [Solution from Aniruddh Agarwal](https://github.com/aniruddhagarwal/odin-projects/blob/master/caesar_cipher/caesar_cipher.rb)
* [Solution from Angel Vargas](https://github.com/arioth/the-odin-project/blob/master/Ruby%20-%20Building%20Blocks/caesar_cipher.rb)
* [Solution from Anh Le](https://github.com/LaDilettante/studying-odin-project/blob/master/3_ruby_programming/project_building_blocks/caesar_cipher.rb)
* [Solution from Afshin M. (afshinator)](https://github.com/afshinator/playground/blob/master/Ruby-BuildingBlocks/building_blocks.rb)
* [Solution from brianllamar](https://github.com/brianllamar/odin_ruby_projects/blob/master/caesar_cypher.rb)
* [Solution from Alan Russell](https://github.com/ajrussellaudio/ruby_odin/blob/master/caesar.rb)
* [Solution from Marina Sergeyeva](https://github.com/imousterian/OdinProject/blob/master/Project2_1_Ruby_Basic/CaesarCipher.rb)
* [Solution from Donald](https://github.com/donaldali/odin-ruby/blob/master/project_building_blocks/caesar_cipher.rb)
* [Solution from Sahil](https://github.com/sahilda/the_odin_project/blob/master/ruby-building-blocks/caesar-cipher/caesar-cipher.rb)
* [Solution from Mark W](https://github.com/mwestfall88/Odin-ruby-scripts/blob/master/caesar-cipher.rb)
* [Solution from Mazin Power](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/caesar.rb)
* [Solution from Toxox](https://github.com/toxox/TheOdinProject/blob/master/Project3_1_Ruby/caesar.rb)
* [Solution from Trevor R](https://github.com/treiff/odin-project-ruby/blob/master/cipher.rb)
* [Solution from TomTom](https://github.com/tim5046/projectOdin/blob/master/RubyBuildingBlocks/caesarCipher.rb)
* [Solution from Tommy Noe](https://github.com/thomasjnoe/ruby-projects-1/blob/master/cipher.rb)
* [Solution from Steve Mitchell](https://github.com/Ixpata/caesars-cipher/blob/master/caesars_cipher.rb)
* [Solution from Michael Alexander](https://https://github.com/betweenparentheses/ruby_building_blocks/blob/master/caesar_cipher.rb)
* [Solution from Adrian Badarau](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/caesar_cipher.rb)
* [Solution from James MacIvor](https://github.com/RobotOptimist/caeser_encrypter)
* [Solution from Dave Charnuska](https://github.com/charleszardo/Odin_Project/blob/master/ruby_building_blocks/caesar_cipher.rb)
* [Solution from Gabriel Matos de Souza] (https://github.com/gabrielms/exerciciosRoR/blob/master/ceasar_cipher/ceasar_cipher.rb)
* [Solution from Daraul Harris](https://github.com/thurst306/the_odin_projects/blob/master/caesar_cipher.rb)
* [Solution from Hawkeye](https://github.com/Hawkeye000/Odin-Building-Blocks/blob/master/caesar.rb)
* [Solution from Vincent](https://github.com/wingyu/ruby_building_blocks/blob/master/caesar.rb)
* [Solution from Maggie Baker](https://github.com/maggiedbaker/Odin_Project/blob/master/ruby_building_blocks/caesar_cipher.rb)
* [Solution from Hyeunjoon Kim](https://github.com/hyeunny/Projects_Ruby_Building_Blocks/blob/master/caesar_cipher.rb)
* [Solution from Aleksandar Rodić](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Ruby%20Building%20Blocks/lib/caesar.rb)
* [Solution from Lara Finnegan](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/Caesar_Cipher.rb)
* [Solution from John Quarles](https://github.com/johnwquarles/Ruby-Building-Blocks/blob/master/caesar.rb)
* [Solution from Jack Nguyen](http://github.com/jnguyen85/projects-ruby-building-blocks/blob/03_substrings/01_caesar_cipher/caesar_cipher.rb)
* [Solution from Vidul](https://github.com/viparthasarathy/Caesar-Cipher/blob/master/method.rb)
* [Solution from Tomislav Mikulin](https://github.com/MrKindle85/ruby_building_blocks/blob/master/Caesar_Cipher.rb)
* [Solution from Hunter Ducharme](https://github.com/hgducharme/OdinProjects/blob/master/RubyProgramming/ruby_building_blocks/caesar_cipher.rb)
* [Solution from Artur Janik](https://github.com/ArturJanik/bbproject1/blob/master/p1-caesar.rb)
* [Solution from hiendinhngoc](https://github.com/hiendinhngoc/TheOdinProject/blob/master/ceasar_cipher.rb)
* [Solution from Tyler Travers](https://github.com/ttravers17/the_odin_project/blob/master/ruby_building_blocks/project1/caesar_cipher.rb)
* [Solution from Kate McFaul](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/ruby_building_blocks/ceasar.rb)
* [Solution from Chris Dziewa](https://github.com/chrisdziewa/building-blocks/blob/master/cipher/cipher.rb)
* [Solution from Dominik Stodolny](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/caesar_cipher.rb)
* [Solution from Sami Bashraheel](https://github.com/sami/ruby-building-blocks/blob/master/caesar_cipher.rb)
* *Insert Your Solution Above This Line*


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

* [Solution from Julian Feliciano](https://github.com/JulsFelic/ruby_building_blocks)
* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/stock_picker.rb)
* [Solution from eugyev](https://github.com/eugyev/odinprojects/blob/master/stock_picker.rb)
* [Solution from Jamie](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project2.rb)
* [Solution from Aniruddh Agarwal](https://github.com/aniruddhagarwal/odin-projects/blob/master/stock_picker/stock_picker.rb)
* [Solution from Angel Vargas](https://github.com/arioth/the-odin-project/blob/master/Ruby%20-%20Building%20Blocks/stock_picker.rb)
* [Solution from Anh Le](https://github.com/LaDilettante/studying-odin-project/blob/master/3_ruby_programming/project_building_blocks/stock_picker.rb)
* [Solution from Afshin M. (afshinator)](https://github.com/afshinator/playground/blob/master/Ruby-BuildingBlocks/building_blocks.rb)
* [Solution from brianllamar](https://github.com/brianllamar/odin_ruby_projects/blob/master/stock_picker.rb)
* [Solution from Alan Russell](https://github.com/ajrussellaudio/ruby_odin/blob/master/stock_picker.rb)
* [Solution from Marina Sergeyeva](https://github.com/imousterian/OdinProject/blob/master/Project2_1_Ruby_Basic/StockPicker.rb)
* [Solution from Donald](https://github.com/donaldali/odin-ruby/blob/master/project_building_blocks/stock_picker.rb)
* [Solution from Sahil](https://github.com/sahilda/the_odin_project/blob/master/ruby-building-blocks/stock-picker/stock-picker.rb)
* [Solution from Mark W](https://github.com/mwestfall88/Odin-ruby-scripts/blob/master/stock_picker.rb)
* [Solution from Mazin Power](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/stock_picker.rb)
* [Solution from Toxox](https://github.com/toxox/TheOdinProject/blob/master/Project3_1_Ruby/stock_picker.rb)
* [Solution from Trevor R](https://github.com/treiff/odin-project-ruby/blob/master/stock_picker.rb)
* [Solution from Tommy Noe](https://github.com/thomasjnoe/ruby-projects-1/blob/master/stock_picker.rb)
* [Solution from Steve Mitchell](https://github.com/Ixpata/stock-picker/blob/master/stock_picker.rb)
* [Solution from Michael Alexander](https://github.com/betweenparentheses/ruby_building_blocks/blob/master/stock_picker.rb)
* [Solution from Adrian Badarau](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/stock_picker.rb)
* [Solution from Cameron Kingsbury](https://github.com/Camsbury/stock-picker-ruby/blob/master/lib/stocks.rb)
* [Solution from James MacIvor](https://github.com/RobotOptimist/stock_picker)
* [Solution from Dave Charnuska](https://github.com/charleszardo/Odin_Project/blob/master/ruby_building_blocks/stock_picker.rb)
* [Solution from Daraul Harris](https://github.com/thurst306/the_odin_projects/blob/master/stock_picker.rb)
* [Solution from Hawkeye](https://github.com/Hawkeye000/Odin-Building-Blocks/blob/master/stock_picker.rb)
* [Solution from Vincent](https://github.com/wingyu/ruby_building_blocks/blob/master/stock.rb)
* [Solution from Maggie Baker](https://github.com/maggiedbaker/Odin_Project/blob/master/ruby_building_blocks/stock_picker.rb)
* [Solution from Hyeunjoon Kim] (https://github.com/hyeunny/Projects_Ruby_Building_Blocks/blob/master/stock_picker.rb)
* [Solution from Aleksandar Rodić](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Ruby%20Building%20Blocks/lib/stock.rb)
* [Solution from Lara Finnegan](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/stock_picker.rb)
* [Solution from John Quarles](https://github.com/johnwquarles/Ruby-Building-Blocks/blob/master/stockpicker.rb)
* [Solution from Jack Nguyen](http://github.com/jnguyen85/projects-ruby-building-blocks/blob/03_substrings/02_stock_picker/stock_picker.rb)
* [Solution from Vidul](https://github.com/viparthasarathy/stock_picker/blob/master/method.rb)
* [Solution from Tomislav Mikulin](https://github.com/MrKindle85/ruby_building_blocks/blob/master/stock_picker.rb)
* [Solution from Hunter Ducharme](https://github.com/hgducharme/OdinProjects/blob/master/RubyProgramming/ruby_building_blocks/stock_picker.rb)
* [Solution from Artur Janik](https://github.com/ArturJanik/bbproject2/blob/master/p2-stockpicker.rb)
* [Solution from hiendinhngoc](https://github.com/hiendinhngoc/TheOdinProject/blob/master/stock_picker.rb)
* [Solution from Tyler Travers](https://github.com/ttravers17/the_odin_project/blob/master/ruby_building_blocks/project2/stock_picker.rb)
* [Solution from Kate McFaul](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/ruby_building_blocks/stocks.rb)
* [Solution from Chris Dziewa](https://github.com/chrisdziewa/building-blocks/blob/master/stock_picker/stocks.rb)
* [Solution from Dominik Stodolny](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/stock_picker.rb)
* [Solution from Sami Bashraheel](https://github.com/sami/ruby-building-blocks/blob/master/stock_picker.rb)
* *Insert Your Solution Above This Line*

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

* [Solution from Julian Feliciano](https://github.com/JulsFelic/ruby_building_blocks)
* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/substrings.rb)
* [Solution from eugyev](https://github.com/eugyev/odinprojects/blob/master/substrings.rb)
* [Solution from Jamie](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project3.rb)
* [Solution from Aniruddh Agarwal](https://github.com/aniruddhagarwal/odin-projects/blob/master/sub_string/substring.rb)
* [Solution from Angel Vargas](https://github.com/arioth/the-odin-project/blob/master/Ruby%20-%20Building%20Blocks/substrings.rb)
* [Solution from Anh Le](https://github.com/LaDilettante/studying-odin-project/blob/master/3_ruby_programming/project_building_blocks/substrings.rb)
* [Solution from brianllamar](https://github.com/brianllamar/odin_ruby_projects/blob/master/substrings.rb)
* [Solution from Afshin M. (afshinator)](https://github.com/afshinator/playground/blob/master/Ruby-BuildingBlocks/building_blocks.rb)
* [Solution from Alan Russell](https://github.com/ajrussellaudio/ruby_odin/blob/master/substrings.rb)
* [Solution from Marina Sergeyeva](https://github.com/imousterian/OdinProject/blob/master/Project2_1_Ruby_Basic/SubStrings.rb)
* [Cipher Solution from Terry Bu](https://github.com/bucifer/rubyExercises/blob/master/cipher/cipher.rb)
* [Substrings Solution from Terry Bu](https://github.com/bucifer/rubyExercises/blob/master/substrings.rb)
* [Solution from Donald](https://github.com/donaldali/odin-ruby/blob/master/project_building_blocks/substrings.rb)
* [Solution from Sahil](https://github.com/sahilda/the_odin_project/blob/master/ruby-building-blocks/substrings/substrings.rb)
* [Solution from Mark W](https://github.com/mwestfall88/Odin-ruby-scripts/blob/master/substrings.rb)
* [Solution from Mazin Power](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/substrings.rb)
* [Solution from Toxox](https://github.com/toxox/TheOdinProject/blob/master/Project3_1_Ruby/substrings.rb)
* [Solution from Trevor R](https://github.com/treiff/odin-project-ruby/blob/master/substrings.rb)
* [Solution from Tommy Noe](https://github.com/thomasjnoe/ruby-projects-1/blob/master/substrings.rb)
* [Solution from JD Shelley](https://github.com/lightcast/the_odin_project/blob/master/sub_strings.rb)
* [Solution from Steve Mitchell](https://github.com/Ixpata/substrings/blob/master/substrings.rb)
* [Solution from Michael Alexander](https://github.com/betweenparentheses/ruby_building_blocks/blob/master/substrings.rb)
* [Solution from Adrian Badarau](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/substrings.rb)
* [Solution from James MacIvor](https://github.com/RobotOptimist/substrings)
* [Solution from Dave Charnuska](https://github.com/charleszardo/Odin_Project/blob/master/ruby_building_blocks/substrings.rb)
* [Solution from Hawkeye](https://github.com/Hawkeye000/Odin-Building-Blocks/blob/master/substrings.rb)
* [Solution from Vincent](https://github.com/wingyu/ruby_building_blocks/blob/master/substrings.rb)
* [Solution from Maggie Baker](https://github.com/maggiedbaker/Odin_Project/blob/master/ruby_building_blocks/substrings.rb)
* [Solution from Aleksandar Rodić](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Ruby%20Building%20Blocks/lib/substrings.rb)
* [Solution from Lara Finnegan](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/substrings.rb)
* [Solution from John Quarles](https://github.com/johnwquarles/Ruby-Building-Blocks/blob/master/substring.rb)
* [Solution from Jack Nguyen](http://github.com/jnguyen85/projects-ruby-building-blocks/blob/master/03_substrings/substrings.rb)
* [Solution from Vidul](https://github.com/viparthasarathy/substrings/blob/master/method.rb)
* [Solution from Tomislav Mikulin](https://github.com/MrKindle85/ruby_building_blocks/blob/master/substrings.rb)
* [Solution from Hunter Ducharme](https://github.com/hgducharme/OdinProjects/blob/master/RubyProgramming/ruby_building_blocks/substrings.rb)
* [Solution from Artur Janik](https://github.com/ArturJanik/bbproject3/blob/master/p3-substrings.rb)
* [Solution from hiendinhngoc](https://github.com/hiendinhngoc/TheOdinProject/blob/master/substrings.rb)
* [Solution from Tyler Travers](https://github.com/ttravers17/the_odin_project/blob/master/ruby_building_blocks/project3/substrings.rb)
* [Solution from Angela Woods](https://github.com/insomniacode/building-blocks/blob/master/bubble_sort.rb)
* [Solution from Kate McFaul](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/ruby_building_blocks/substrings.rb)
* [Solution from Chris Dziewa](https://github.com/chrisdziewa/building-blocks/blob/master/substrings/substrings.rb)
* [Solution form Dominik Stodolny](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/substrings.rb)
* [Solution from Sami Bashraheel](https://github.com/sami/ruby-building-blocks/blob/master/substrings.rb)
* *Insert Your Solution Above This Line*
