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

* [ctcyu's solution](https://github.com/ctcyu/ruby_sandbox/blob/master/caesar_cipher.rb)
* [ThusStyles's solution](https://github.com/ThusStyles/cipher/blob/master/cipher.rb)
* [Sessl's solution](https://github.com/Sessl/ruby_work/blob/master/cipher.rb)
* [Eugyev's solution](https://github.com/eugyev/odinprojects/blob/master/cypher.rb)
* [neekburm's solution](https://github.com/neekburm/odinproject/blob/master/caesar_cypher.rb)
* [NoRest4AWhearry's solution](https://github.com/NoRest4AWhearry/Caesars_Cipher)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project1.rb)
* [Angel Vargas's solution](https://github.com/arioth/the-odin-project/blob/master/Ruby%20-%20Building%20Blocks/caesar_cipher.rb)
* [Anh Le's solution](https://github.com/LaDilettante/studying-odin-project/blob/master/3_ruby_programming/project_building_blocks/caesar_cipher.rb)
* [Afshin M. (afshinator)'s solution](https://github.com/afshinator/playground/blob/master/Ruby-BuildingBlocks/building_blocks.rb)
* [brianllamar's solution](https://github.com/brianllamar/odin_ruby_projects/blob/master/caesar_cypher.rb)
* [Alan Russell's solution](https://github.com/ajrussellaudio/ruby_odin/blob/master/caesar.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_1_Ruby_Basic/CaesarCipher.rb)
* [Donald's solution](https://github.com/donaldali/odin-ruby/blob/master/project_building_blocks/caesar_cipher.rb)
* [Sahil's solution](https://github.com/sahilda/the_odin_project/blob/master/ruby-building-blocks/caesar-cipher/caesar-cipher.rb)
* [Mark W's solution](https://github.com/mwestfall88/Odin-ruby-scripts/blob/master/caesar-cipher.rb)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/caesar.rb)
* [Toxox's solution](https://github.com/toxox/TheOdinProject/blob/master/Project3_1_Ruby/caesar.rb)
* [Trevor R's solution](https://github.com/treiff/odin-project-ruby/blob/master/cipher.rb)
* [TomTom's solution](https://github.com/tim5046/projectOdin/blob/master/RubyBuildingBlocks/caesarCipher.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/ruby-projects-1/blob/master/cipher.rb)
* [Steve Mitchell's solution](https://github.com/Ixpata/caesars-cipher/blob/master/caesars_cipher.rb)
* [Michael Alexander's solution](https://github.com/betweenparentheses/ruby_building_blocks/blob/master/caesar_cipher.rb)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/caesar_cipher.rb)
* [James MacIvor's solution](https://github.com/RobotOptimist/caeser_encrypter)
* [Gabriel Matos de Souza's solution](https://github.com/gabrielms/exerciciosRoR/blob/master/ceasar_cipher/ceasar_cipher.rb)
* [Daraul Harris's solution](https://github.com/thurst306/the_odin_projects/blob/master/caesar_cipher.rb)
* [Hawkeye's solution](https://github.com/Hawkeye000/Odin-Building-Blocks/blob/master/caesar.rb)
* [Vincent's solution](https://github.com/wingyu/ruby_building_blocks/blob/master/caesar.rb)
* [Maggie Baker's solution](https://github.com/maggiedbaker/Odin_Project/blob/master/ruby_building_blocks/caesar_cipher.rb)
* [Hyeunjoon Kim's solution](https://github.com/hyeunny/Projects_Ruby_Building_Blocks/blob/master/caesar_cipher.rb)
* [Aleksandar Rodić's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Ruby%20Building%20Blocks/lib/caesar.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/Caesar_Cipher.rb)
* [John Quarles's solution](https://github.com/johnwquarles/Ruby-Building-Blocks/blob/master/caesar.rb)
* [Vidul's solution](https://github.com/viparthasarathy/Caesar-Cipher/blob/master/method.rb)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/ruby_building_blocks/blob/master/Caesar_Cipher.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/bbproject1/blob/master/p1-caesar.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/ceasar_cipher.rb)
* [Tyler Travers's solution](https://github.com/ttravers17/the_odin_project/blob/master/ruby_building_blocks/project1/caesar_cipher.rb)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/ruby_building_blocks/ceasar.rb)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/building-blocks/blob/master/cipher/cipher.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/caesar_cipher.rb)
* [Sami Bashraheel's solution](https://github.com/sami/ruby-building-blocks/blob/master/caesar_cipher.rb)
* [Andy Linteau's solution](https://github.com/linteau/ceasar_cipher/blob/master/cipher.rb)
* [Josh Naughton's solution](https://github.com/ThothLogos/odin-rubyprogramming/blob/master/01_caesar_cipher.rb)
* [Jason Matthews's solution](https://github.com/fo0man/ruby_blocks/blob/master/caeser_cipher.rb)
* [Nikola Cvorovic's solution](https://github.com/cvorak/ruby_project_caesar_cypher/blob/master/caesar_cypher.rb)
* [Kevin Weir's solution](https://github.com/IDCrisis2/the_odin_project/blob/master/Ruby%20Building%20Blocks/caesar_cipher.rb)
* [chasmani's solution](https://github.com/chasmani/RubyBuildingBlocks/blob/master/caesar_cipher.rb)
* [poctek's solution](https://github.com/poctek/CaesarCipher_TheOdinProject/blob/master/CaesarCipher.rb)
* [Greg Park's solution](https://github.com/gregoryjpark/ruby_building_blocks/blob/master/caesar_cipher.rb)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/ruby_building_blocks/blob/master/caesar_cipher.rb)
* [Emil Johansen's solution](https://github.com/EmilOJ/odin_project/blob/master/Ruby_Building_Blocks/caesar_cipher.rb)
* [Sasikala's solution](https://github.com/Sasikala-Ravichandran/my_ruby_projects/blob/master/caesar_cipher.rb)
* [Sam Padrul's solution](https://github.com/sampadrul/Ruby-Projects/blob/master/caesar%20cipher/caesar.rb)
* [LongPotato's solution](https://github.com/LongPotato/Ruby_Building_Blocks/blob/master/Caesar_Cipher.rb)
* [Eleanor's solution](https://github.com/mixophrygian/Caesar-Cipher/blob/master/Caesar.rb)
* [Dorian Iacobescu's solution](https://github.com/iacobson/Odin7-Ruby-Building_Blocks/blob/master/1_caesar_chipher.rb)
* [Nathan Bourke's solution](https://github.com/itiswicked/random-goodies/blob/master/caeser-cipher.rb)
* [Chris Hall's solution](https://github.com/Concretechris/ceaser_cipher/blob/master/ceasercipher/Ceaser_Cipher.rb)
* [Lyman Wong's solution](https://github.com/lymanwong/Ruby-Stuff/blob/master/odin/caesar_cipher/caesar_cipher.rb)
* [Antonio Augusto's solution](https://github.com/antoniosb/caesar_cipher/blob/master/caesar_cipher.rb)
* [Andrej Dragojevic's solution](https://github.com/antrix1/The-Odin-Project/blob/master/Ruby%20Programming/Caesar%27s%20cipher/caesar_cipher.rb)
* [omokoro's solution](https://github.com/omokoro/caeser/blob/master/caeser.rb)
* [Ryan Jordan's solution](https://github.com/krjordan/ruby_building-blocks/blob/master/caesar-cipher.rb)
* [Tom McGinn's solution](https://github.com/tjmcgi/ruby_ceaser_cipher/blob/master/ceaser_cipher.rb)
* [Eddie's solution](https://github.com/feek1g/theodinproject/blob/master/rubyChallenge/caeser_cipher_p1.rb)
* [Gitman's solution](https://github.com/ttuck303/project-odin/blob/master/caesar_cipher.rb)
* [Suneil's solution](https://github.com/suneilbasu/theOdinProject/blob/master/caesar1.rb)
* [Edmund's solution O(n) performance](https://github.com/EdmundLeex/ruby_algorithm_practice/blob/master/some_fun_challeges/stock_picker.rb)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/blob/master/ruby_building_blocks_assignments/caeser_cipher.rb)
* [Richard Stewart's solution](https://github.com/rickstewart/Ruby_Building_Blocks/blob/master/caesar_cipher.rb)
* [Sam Webb's solution](https://github.com/salexzee/TOProject/blob/master/caesar_cipher/caesar.rb)
* [Josh Klein's solution](https://github.com/kleinjoshuaa/Ruby_Programming/blob/master/caesar_cipher.rb)
* [Pedro Amaral's solution](https://github.com/lockemind/caeser_cipher/blob/master/caeser_cipher.rb)
* [Tom Wu's Solution](https://github.com/canadatom/LearningRuby/blob/master/caesarcipher.rb)
* [Diarmuid Murphy's solution](https://github.com/diarmuid-murphy/caesar-cipher/blob/master/caesar_cipher.rb)
* [Dan Hoying's solution](https://github.com/danhoying/ruby_building_blocks/blob/master/caesar_cipher.rb)
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/blob/master/3_Ruby_building-blocks/lib/caesar_cipher.rb)
* [AtActionParks's solution](https://github.com/AtActionPark/odin-ruby-building-blocks/blob/master/caesar-cipher.rb)

* Add your solution above this line!


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

* [ctcyu's solution](https://github.com/ctcyu/ruby_sandbox/blob/master/stock_picker.rb)
* [eugyev's solution](https://github.com/eugyev/odinprojects/blob/master/stock_picker.rb)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project2.rb)
* [Angel Vargas's solution](https://github.com/arioth/the-odin-project/blob/master/Ruby%20-%20Building%20Blocks/stock_picker.rb)
* [Anh Le's solution](https://github.com/LaDilettante/studying-odin-project/blob/master/3_ruby_programming/project_building_blocks/stock_picker.rb)
* [Afshin M. (afshinator)'s solution](https://github.com/afshinator/playground/blob/master/Ruby-BuildingBlocks/building_blocks.rb)
* [brianllamar's solution](https://github.com/brianllamar/odin_ruby_projects/blob/master/stock_picker.rb)
* [Alan Russell's solution](https://github.com/ajrussellaudio/ruby_odin/blob/master/stock_picker.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_1_Ruby_Basic/StockPicker.rb)
* [Donald's solution](https://github.com/donaldali/odin-ruby/blob/master/project_building_blocks/stock_picker.rb)
* [Sahil's solution](https://github.com/sahilda/the_odin_project/blob/master/ruby-building-blocks/stock-picker/stock-picker.rb)
* [Mark W's solution](https://github.com/mwestfall88/Odin-ruby-scripts/blob/master/stock_picker.rb)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/stock_picker.rb)
* [Toxox's solution](https://github.com/toxox/TheOdinProject/blob/master/Project3_1_Ruby/stock_picker.rb)
* [Trevor R's solution](https://github.com/treiff/odin-project-ruby/blob/master/stock_picker.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/ruby-projects-1/blob/master/stock_picker.rb)
* [Steve Mitchell's solution](https://github.com/Ixpata/stock-picker/blob/master/stock_picker.rb)
* [Michael Alexander's solution](https://github.com/betweenparentheses/ruby_building_blocks/blob/master/stock_picker.rb)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/stock_picker.rb)
* [Cameron Kingsbury's solution](https://github.com/Camsbury/stock-picker-ruby/blob/master/lib/stocks.rb)
* [James MacIvor's solution](https://github.com/RobotOptimist/stock_picker)
* [Daraul Harris's solution](https://github.com/thurst306/the_odin_projects/blob/master/stock_picker.rb)
* [Hawkeye's solution](https://github.com/Hawkeye000/Odin-Building-Blocks/blob/master/stock_picker.rb)
* [Vincent's solution](https://github.com/wingyu/ruby_building_blocks/blob/master/stock.rb)
* [Maggie Baker's solution](https://github.com/maggiedbaker/Odin_Project/blob/master/ruby_building_blocks/stock_picker.rb)
* [Hyeunjoon Kim's solution](https://github.com/hyeunny/Projects_Ruby_Building_Blocks/blob/master/stock_picker.rb)
* [Aleksandar Rodić's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Ruby%20Building%20Blocks/lib/stock.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/stock_picker.rb)
* [John Quarles's solution](https://github.com/johnwquarles/Ruby-Building-Blocks/blob/master/stockpicker.rb)
* [Vidul's solution](https://github.com/viparthasarathy/stock_picker/blob/master/method.rb)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/ruby_building_blocks/blob/master/stock_picker.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/bbproject2/blob/master/p2-stockpicker.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/stock_picker.rb)
* [Tyler Travers's solution](https://github.com/ttravers17/the_odin_project/blob/master/ruby_building_blocks/project2/stock_picker.rb)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/ruby_building_blocks/stocks.rb)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/building-blocks/blob/master/stock_picker/stocks.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/stock_picker.rb)
* [Sami Bashraheel's solution](https://github.com/sami/ruby-building-blocks/blob/master/stock_picker.rb)
* [Andy Linteau's solution](https://github.com/linteau/stock_picker/blob/master/stock_picker.rb)
* [Josh Naughton's solution](https://github.com/ThothLogos/odin-rubyprogramming/blob/master/02_stock_picker.rb)
* [Jason Matthews's solution](https://github.com/fo0man/ruby_blocks/blob/master/stock_picker.rb)
* [Nikola Cvorovic's solution](https://github.com/cvorak/ruby_project_caesar_cypher/blob/master/stock_picker.rb)
* [Ali Ayoub's solution](https://github.com/Cryptolemming/Ruby-Building-Blocks/blob/master/stock_picker.rb)
* [JrodManU's solution](https://github.com/JrodManU/stock-picker/blob/master/stock_picker.rb)
* [chasmani's solution](https://github.com/chasmani/RubyBuildingBlocks/blob/master/stock_picker.rb)
* [poctek's solution](https://github.com/poctek/stock_picker_the_odin_project/blob/master/stockPicker.rb)
* [Greg Park's solution](https://github.com/gregoryjpark/ruby_building_blocks/blob/master/stock_picker.rb)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/ruby_building_blocks/blob/master/stock_picker.rb)
* [Emil Johansen's solution](https://github.com/EmilOJ/odin_project/blob/master/Ruby_Building_Blocks/stock_picker.rb)
* [Sasikala's solution](https://github.com/Sasikala-Ravichandran/my_ruby_projects/blob/master/stock_price.rb)
* [Sam Padrul's solution](https://github.com/sampadrul/Ruby-Projects/blob/master/Stock%20Picker/stock_picker.rb)
* [LongPotato's solution](https://github.com/LongPotato/Ruby_Building_Blocks/blob/master/Stock_Picker.rb)
* [Eleanor's solution](https://github.com/mixophrygian/Stock-picker/blob/master/Stock_picker.rb)
* [Dorian Iacobescu's solution](https://github.com/iacobson/Odin7-Ruby-Building_Blocks/blob/master/2_stock_picker.rb)
* [Chris Hall's solution](https://github.com/Concretechris/stock_picker/blob/master/stock_picker.rb)
* [Lyman Wong's solution](https://github.com/lymanwong/Ruby-Stuff/tree/master/odin/stock_picker)
* [Antonio Augusto's solution](https://github.com/antoniosb/stock_picker/blob/master/stock_picker.rb)
* [omokoro's solution](https://github.com/omokoro/stock_picker/blob/master/stock_picker.rb)
* [Andrej Dragojevic's solution](https://github.com/antrix1/The-Odin-Project/blob/master/Ruby%20Programming/Building%20Blocks/stock_picker.rb)
* [Eddie's solution](https://github.com/feek1g/theodinproject/blob/master/rubyChallenge/stock_picker.rb)
* [Gitman's solution](https://github.com/ttuck303/project-odin/blob/master/stock_picker.rb)
* [Tom McGinn's solution](https://github.com/tjmcgi/ruby_stockpicker/blob/master/stockpicker.rb)
* [Suneil's solution](https://github.com/suneilbasu/theOdinProject/blob/master/%23%20stock_picker6.rb)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/blob/master/ruby_building_blocks_assignments/stock_picker.rb)
* [Richard Stewart's solution](https://github.com/rickstewart/Ruby_Building_Blocks/blob/master/stock_picker.rb)
* [Sam Webb's solution](https://github.com/salexzee/TOProject/blob/master/stock/stock.rb)
* [Josh Klein's solution](https://github.com/kleinjoshuaa/Ruby_Programming/blob/master/stock_picker.rb)
* [Pedro Amaral's solution](https://github.com/lockemind/stock_picker/blob/master/stock_picker.rb)
* [Diarmuid Murphy's solution](https://github.com/diarmuid-murphy/stock_picker/blob/master/stock_picker.rb)
* [Dan Hoying's solution](https://github.com/danhoying/ruby_building_blocks/blob/master/stock_picker.rb)
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/blob/master/3_Ruby_building-blocks/lib/stock_picker.rb)
* [AtActionPark's solution](https://github.com/AtActionPark/odin-ruby-building-blocks/blob/master/stock-picker.rb)
*
* Add your solution above this line!


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

* [ctcyu's solution](https://github.com/ctcyu/ruby_sandbox/blob/master/substrings.rb)
* [eugyev's solution](https://github.com/eugyev/odinprojects/blob/master/substrings.rb)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/blob/master/ruby_building_blocks/project3.rb)
* [Angel Vargas's solution](https://github.com/arioth/the-odin-project/blob/master/Ruby%20-%20Building%20Blocks/substrings.rb)
* [Anh Le's solution](https://github.com/LaDilettante/studying-odin-project/blob/master/3_ruby_programming/project_building_blocks/substrings.rb)
* [brianllamar's solution](https://github.com/brianllamar/odin_ruby_projects/blob/master/substrings.rb)
* [Afshin M. (afshinator)'s solution](https://github.com/afshinator/playground/blob/master/Ruby-BuildingBlocks/building_blocks.rb)
* [Alan Russell's solution](https://github.com/ajrussellaudio/ruby_odin/blob/master/substrings.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_1_Ruby_Basic/SubStrings.rb)
* [Terry Bu's solution](https://github.com/bucifer/rubyExercises/blob/master/substrings.rb)
* [Donald's solution](https://github.com/donaldali/odin-ruby/blob/master/project_building_blocks/substrings.rb)
* [Sahil's solution](https://github.com/sahilda/the_odin_project/blob/master/ruby-building-blocks/substrings/substrings.rb)
* [Mark W's solution](https://github.com/mwestfall88/Odin-ruby-scripts/blob/master/substrings.rb)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/substrings.rb)
* [Toxox's solution](https://github.com/toxox/TheOdinProject/blob/master/Project3_1_Ruby/substrings.rb)
* [Trevor R's solution](https://github.com/treiff/odin-project-ruby/blob/master/substrings.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/ruby-projects-1/blob/master/substrings.rb)
* [JD Shelley's solution](https://github.com/lightcast/the_odin_project/blob/master/sub_strings.rb)
* [Steve Mitchell's solution](https://github.com/Ixpata/substrings/blob/master/substrings.rb)
* [Michael Alexander's solution](https://github.com/betweenparentheses/ruby_building_blocks/blob/master/substrings.rb)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/substrings.rb)
* [James MacIvor's solution](https://github.com/RobotOptimist/substrings)
* [Hawkeye's solution](https://github.com/Hawkeye000/Odin-Building-Blocks/blob/master/substrings.rb)
* [Vincent's solution](https://github.com/wingyu/ruby_building_blocks/blob/master/substrings.rb)
* [Maggie Baker's solution](https://github.com/maggiedbaker/Odin_Project/blob/master/ruby_building_blocks/substrings.rb)
* [Aleksandar Rodić's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Ruby%20Building%20Blocks/lib/substrings.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/substrings.rb)
* [John Quarles's solution](https://github.com/johnwquarles/Ruby-Building-Blocks/blob/master/substring.rb)
* [Jack Nguyen's solution](http://github.com/jnguyen85/projects-ruby-building-blocks/blob/master/03_substrings/substrings.rb)
* [Vidul's solution](https://github.com/viparthasarathy/substrings/blob/master/method.rb)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/ruby_building_blocks/blob/master/substrings.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/bbproject3/blob/master/p3-substrings.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/substrings.rb)
* [Tyler Travers's solution](https://github.com/ttravers17/the_odin_project/blob/master/ruby_building_blocks/project3/substrings.rb)
* [Angela Woods's solution](https://github.com/insomniacode/building-blocks/blob/master/bubble_sort.rb)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/ruby_building_blocks/substrings.rb)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/building-blocks/blob/master/substrings/substrings.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/substrings.rb)
* [Sami Bashraheel's solution](https://github.com/sami/ruby-building-blocks/blob/master/substrings.rb)
* [Andy Linteau's solution](https://github.com/linteau/substrings/blob/master/substring.rb)
* [Josh Naughton's solution](https://github.com/ThothLogos/odin-rubyprogramming/blob/master/03_substrings.rb)
* [Jason Matthews's solution](https://github.com/fo0man/ruby_blocks/blob/master/substrings.rb)
* [Nikola Čvorović's solution](https://github.com/cvorak/ruby_project_caesar_cypher/blob/master/substrings.rb)
* [Ali Ayoub's solution](https://github.com/Cryptolemming/Ruby-Building-Blocks/blob/master/substrings.rb)
* [chasmani's solution](https://github.com/chasmani/RubyBuildingBlocks/blob/master/substrings.rb)
* [Kevin Weir's solution](https://github.com/IDCrisis2/the_odin_project/blob/master/Ruby%20Building%20Blocks/substrings.rb)
* [poctek's solution](https://github.com/poctek/Occurances_The_Odin_Project)
* [JrodManU's solution](https://github.com/JrodManU/substring-counter)
* [Greg Park's solution](https://github.com/gregoryjpark/ruby_building_blocks/blob/master/substrings.rb)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/ruby_building_blocks/blob/master/substrings.rb)
* [Emil Johansen's solution](https://github.com/EmilOJ/odin_project/blob/master/Ruby_Building_Blocks/substrings.rb)
* [Sasikala's solution](https://github.com/Sasikala-Ravichandran/my_ruby_projects/blob/master/sub_strings.rb)
* [Sam Padrul's solution](https://github.com/sampadrul/Ruby-Projects/blob/master/Word%20Count/wordcount.rb)
* [LongPotato's solution](https://github.com/LongPotato/Ruby_Building_Blocks/blob/master/Substrings.rb)
* [Eleanor's solution](https://github.com/mixophrygian/Substrings/blob/master/substring.rb)
* [Dorian Iacobescu's solution](https://github.com/iacobson/Odin7-Ruby-Building_Blocks/blob/master/3_substrings.rb)
* [Chris Hall's solution](https://github.com/Concretechris/odin---substring_challenge/blob/master/substrings.rb)
* [Lyman Wong's solution](https://github.com/lymanwong/Ruby-Stuff/blob/master/odin/substrings/substrings.rb)
* [Antonio Augusto's solution](https://github.com/antoniosb/substrings/tree/master)
* [Andrej Dragojevic's solution](https://github.com/antrix1/The-Odin-Project/blob/master/Ruby%20Programming/Building%20Blocks/substrings.rb)
* [omokoro's solution](https://github.com/omokoro/substrings/blob/master/subtrings.rb)
* [Eddie's solution](https://github.com/feek1g/theodinproject/blob/master/rubyChallenge/substrings.rb)
* [Gitman's solution](https://github.com/ttuck303/project-odin/blob/master/substrings.rb)
* [Tom McGinn's solution](https://github.com/tjmcgi/ruby_substrings/blob/master/substrings.rb)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/blob/master/ruby_building_blocks_assignments/substrings.rb)
* [Richard Stewart's solution](https://github.com/rickstewart/Ruby_Building_Blocks/blob/master/substrings.rb)
* [Sam Webb's solution](https://github.com/salexzee/TOProject/blob/master/substrings/sub.rb)
* [Ryan Jordan's solution](https://github.com/krjordan/ruby_building-blocks/blob/master/substrings.rb)
* [Josh Klein's solution](https://github.com/kleinjoshuaa/Ruby_Programming/blob/master/substrings.rb)
* [Pedro Amaral's solution](https://github.com/lockemind/substrings/blob/master/substrings.rb)
* [Diarmuid Murphy's solution](https://github.com/diarmuid-murphy/substrings/blob/master/substrings.rb)
* [Dan Hoying's solution](https://github.com/danhoying/ruby_building_blocks/blob/master/substrings.rb)
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/blob/master/3_Ruby_building-blocks/lib/substrings.rb)
* [AtActionPark's solution](https://github.com/AtActionPark/odin-ruby-building-blocks/blob/master/substring.rb)

* Add your solution above this line!
