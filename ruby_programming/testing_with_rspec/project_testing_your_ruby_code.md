### Warmup: Time Traveling

A good way to get familiar with and begin contributing to a new project is to write tests for it.  It's also the best way to become familiar with a new code base, something you'll have to do when you start working.  It's pretty common for test code to ultimately take up twice as many lines of code as the actual project code!

You still may feel shaky on RSpec at this point (which is totally normal), so let's go back in time and write tests for some of the code you've already done to build up a bit of muscle memory.  If you've written a good batch, submit them below and we'll include them as part of the original project description to help future students!

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Go back to the [Building Blocks Project](/courses/ruby-programming/lessons/building-blocks) and write tests for your "Caesar's Cipher" code.  It shouldn't take more than a half-dozen tests to cover all the possible cases.
  1. Go back to the [Advanced Building Blocks Project](/courses/ruby-programming/lessons/advanced-building-blocks) and write tests for any 6 of the enumerable methods you wrote there.  In this case, identify several possible inputs for each of those functions and test to make sure that your implementation of them actually makes the tests pass.  Be sure to try and cover some of the odd edge cases where you can.
  2. Write tests for your [Tic Tac Toe project](/courses/ruby-programming/lessons/oop).  In this situation, it's not quite as simple as just coming up with inputs and making sure the method returns the correct thing.  You'll need to make the tests determine victory or loss conditions are correctly assessed.
      1. Start by writing tests to make sure players win when they should, e.g. when the board reads X X X across the top row, your `#game-over` method (or its equivalent) should trigger.
      2. Test each of your critical methods to make sure they function properly and handle edge cases.
      3. Try using mocks/doubles to isolate methods and make sure that they're sending back the right outputs.
</div>

### Student Solutions
Submit a link below to this [file](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/testing_with_rspec/project_testing_your_ruby_code.md) on the ruby course github repo with your files in it by using a pull request. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.


* Add your solution below this line!
* Mohamed Elattar's Solution[Caesar Cipher](https://github.com/mohamed-elattar/building-blocks), [Enumerable Methods](https://github.com/mohamed-elattar/advanced-building-blocks), [Tic Tac Toe](https://github.com/mohamed-elattar/tic-tac-toe)
* [prw001's solutions](https://github.com/prw001/ruby_bdd_exercises)
* Max Garber's solutions:[Caesar Cipher](https://github.com/bubblebooy/miscellaneous-exercises/tree/master/Caesar%20Ciphar), [Enumerable Methods](https://github.com/bubblebooy/miscellaneous-exercises/tree/master/Enumerable%20Methods), [Tic-Tac-Toe](https://github.com/bubblebooy/miscellaneous-exercises/tree/master/Tic%20Tac%20Toe)
* Romane Green's solutions: [Caesar Cipher](https://github.com/RomaneGreen/rebuilding_enumerable/blob/master/spec/cesar_cypher_spec.rb), [Enumerable Methods](https://github.com/RomaneGreen/rebuilding_enumerable/blob/master/spec/rebuilding_enumerable_spec.rb), [Tic-Tac-Toe](https://github.com/RomaneGreen/tic_tac_toe/blob/master/spec/tictac_spec.rb)
* Demo318's solutions: [Caesar Cipher](https://github.com/Demo318/ruby_building_blocks/blob/master/spec/01_caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/Demo318/ruby_advanced_building_blocs/blob/master/spec/my_enumerable_spec.rb), [Tic-Tac-Toe](https://github.com/Demo318/ruby_tictactoe/tree/master/spec)
* Isil Donmez's solutions: [Caesar's Cipher](https://github.com/isildonmez/Caesar-Cipher/blob/master/caesar_spec.rb), [Enumerable Methods](https://github.com/isildonmez/advanced_building_blocks/blob/master/enumerable_methods/enumerable_methods_spec.rb), [Tic-Tac-Toe](https://github.com/isildonmez/OOP/blob/master/tic_tac_toe/tic_tac_toe_spec.rb)
* Bruno Parga's solutions: [Caesar's Cipher](https://github.com/brunoparga/odinproject/tree/master/Ruby/caesar), [Enumerable Methods](https://github.com/brunoparga/odinproject/tree/master/Ruby/my_enums), [Tic-Tac-Toe](https://github.com/brunoparga/odinproject/tree/master/Ruby/tictactoe)
* Ovsjah Schweinefresser's Solutions: [Caesar Cipher](https://github.com/Ovsjah/testing_ruby/tree/master/caesar_cipher), [Enumerable Methods](https://github.com/Ovsjah/testing_ruby/tree/master/enumerable), [Tic-Tac-Toe](https://github.com/Ovsjah/testing_ruby/tree/master/tic_tac_toe)
* Jonathan Yiv's Solutions: [Caesar Cipher](https://github.com/JonathanYiv/caesar_cipher), [Enumerable Methods](https://github.com/JonathanYiv/enumerable_methods), [Tic-Tac-Toe](https://github.com/JonathanYiv/tic-tac-toe/)
* Clayton's solutions: [Caesar Cipher](https://github.com/cjsweeten101/OdinProjects/tree/master/ruby_building_blocks), [enumerable methods](https://github.com/cjsweeten101/OdinProjects/tree/master/enumerable_methods), [Tic Tac Toe](https://github.com/cjsweeten101/OdinProjects/tree/master/tic_tac_toe)
* Kasey's solutions : [Caesar Cipher](https://github.com/kasey-z/TOP-solutions/tree/master/Ruby%20Building%20Blocks/Caesar%20Cipher/spec/lib), [enumerable methods](https://github.com/kasey-z/TOP-solutions/tree/master/advanced_building_blocks/spec/lib),[Tic Tac Toe](https://github.com/kasey-z/TOP-solutions/blob/master/OOP/spec/lib/tic_tac_toe_spec.rb)
* xavier's solutions : [Caesar Cipher](https://github.com/nxdf2015/odin-building-blocks), [enumerable methods](https://github.com/nxdf2015/odin-advanced-building-blocks/tree/master/enumerable),[Tic Tac Toe](https://github.com/nxdf2015/odin-oop-with-ruby/tree/master/rspec)
* Oleh Sliusar's solutions: [Caesar Cipher](https://github.com/OlehSliusar/caesar_cipher), [Enumerable Methods](https://github.com/OlehSliusar/enumerable_methods), [Tic-tac-toe](https://github.com/OlehSliusar/tic-tac-toe)
* holdercp's solutions [Caesar Cipher and Enumerable Methods](https://github.com/holdercp/ruby-building-blocks), [Tic-Tac-Toe](https://github.com/holdercp/tic-tac-toe)
* theghall's solutions [Caesar Cipher](https://github.com/theghall/caesar_cipher), [Enumerable methods](https://github.com/theghall/enum), [Tic Tac Toe](https://github.com/theghall/tic-tac-toe)
* Nikolay Dyulgerov's solutions [Caesar Cippher](https://github.com/NicolayD/ruby-building-blocks/blob/master/spec/caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/NicolayD/ruby-advanced-blocks/blob/master/spec/enumerable_methods_spec.rb), [Tic Tac Toe](https://github.com/NicolayD/ruby-oop/blob/master/spec/tictactoe_spec.rb)
* mindovermiles262's Solutions [Caesar](https://github.com/mindovermiles262/ruby-building-blocks/tree/master/caesar-cipher) [Enumerable](https://github.com/mindovermiles262/ruby-building-blocks/tree/master/enumerable-methods) [Tic-Tac-Toe](https://github.com/mindovermiles262/tictactoe)
* yilmazgunalp's solution [Enumerable](https://github.com/yilmazgunalp/advanced_building_blocks), [TicTacToe](https://github.com/yilmazgunalp/tictac)
* ToTenMilan's solution [Caesar's_cipher & stock_picker](https://github.com/ToTenMilan/the_odin_project/tree/master/ruby/building_blocks/spec), [Enumerable Methods](https://github.com/ToTenMilan/the_odin_project/blob/master/ruby/adv_building_blocks/spec/enumerable_methods_spec.rb), [Mastermind](https://github.com/ToTenMilan/the_odin_project/blob/master/ruby/oop/spec/mastermind_spec.rb)
* nmac's solution ([Caesar's cipher](https://github.com/nmacawile/ruby_building_blocks/blob/master/spec/caesar_cipher_spec.rb), [Enumerable methods](https://github.com/nmacawile/ruby_building_blocks/blob/master/spec/enumerable_methods_spec.rb), [Tic-tac-toe](https://github.com/nmacawile/tictactoe2/tree/master/spec))
* [Jib's Solution](https://github.com/NuclearMachine/OdinTasks/tree/master/rspec_timetraveling)
* Leonard Soaivan's solution ([Caesar Cipher](https://github.com/leosoaivan/rubybuildingblocks/blob/master/spec/caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/leosoaivan/rubybuildingblocks/blob/master/spec/enumerable_spec.rb), [Tic Tac Toe](https://github.com/leosoaivan/rubytictactoe/tree/master/spec))
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_rspec_testing)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project2_8_Ruby_Rspec)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_03-Advanced_Ruby/testing_with_rspec)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/tree/master/Project8/testingruby1)
* Dominik Stodolny's solution ([Caesar Cipher](https://github.com/dstodolny/ruby_building_blocks/blob/master/spec/caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/dstodolny/ruby_building_blocks/blob/master/spec/enumerable_methods_spec.rb), [Tic Tac Toe](https://github.com/dstodolny/tictactoe/tree/master/spec))
* Lara Finnegan's solution ([Caesar Cipher](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/spec/caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/spec/enumerable_methods_spec.rb), [Tic Tac Toe](https://github.com/lcf0285/tic_tac_toe/tree/master/spec))
* AtActionPark's solution ([Caesar Cipher](https://github.com/AtActionPark/odin-ruby-building-blocks/blob/master/caesar-cipher/spec/caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/AtActionPark/odin-ruby-advanced-building-blocks/blob/master/Enumerable_methods/spec/enumerable_methods_spec.rb), [Tic Tac Toe](https://github.com/AtActionPark/odin_tic_tac_toe/tree/master/spec))
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/tree/master/project_testing)
* Alex Chen's solution ([Caesar Cipher and Enumerable Methods](https://github.com/Chenzilla/ruby_building_blocks/tree/master/spec), [Tic Tac Toe](https://github.com/Chenzilla/tic_tac_toe/blob/master/spec/tic-tac-toe_spec.rb))
* Dan Hoying's solution ([Caesar Cipher](https://github.com/danhoying/testing_ruby_with_rspec/tree/master/caesar_cipher), [Enumerable Methods](https://github.com/danhoying/testing_ruby_with_rspec/tree/master/enumerable_methods), [Tic Tac Toe](https://github.com/danhoying/testing_ruby_with_rspec/tree/master/tic_tac_toe))
* [PiotrAleksander's solution](https://github.com/PiotrAleksander/Ruby/tree/master/xo/spec)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/tree/master/ruby/project14--time-traveling)
*  Florian Mainguy's solution ([Caesar Cipher](https://github.com/florianmainguy/theodinproject/blob/master/ruby/testing-ruby/caesar-cipher/spec/caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/florianmainguy/theodinproject/blob/master/ruby/testing-ruby/enumerable/spec/enumerable_spec.rb), [Tic Tac Toe](https://github.com/florianmainguy/theodinproject/blob/master/ruby/testing-ruby/tic-tac-toe/spec/tic-tac-toe_spec.rb))
*  Aviv Levinsky's solution ([Caesar Cipher](https://github.com/pugsiman/Ruby_challenges_and_algorithms/blob/master/Caesar_Cipher/spec/caesar_spec.rb), [Enumerable Methods](https://github.com/pugsiman/Ruby_challenges_and_algorithms/blob/master/Enumerable_Methods/spec/enum_spec.rb), [Tic Tac Toe](https://github.com/pugsiman/Tic_Tac_Toe/blob/master/spec/ttt_spec.rb))
*  Giorgos's solution ([Caesar Cipher](https://github.com/vinPopulaire/ruby-building-blocks-project/blob/master/spec/caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/vinPopulaire/ruby-building-blocks-project/blob/master/spec/enumerablie_methods_spec.rb), [Tic Tac Toe](https://github.com/vinPopulaire/tic-tac-toe/blob/master/spec/tic-tac-toe_spec.rb))
*  srashidi's solution([Caesar Cipher](https://github.com/srashidi/Ruby_Building_Blocks/tree/master/caesar_cipher/spec), [Enumerable Methods](https://github.com/srashidi/Ruby_Building_Blocks/tree/master/My_Enumerable/spec), [Tic Tac Toe](https://github.com/srashidi/Object_Oriented_Programming/tree/master/Tic_Tac_Toe/spec))
* cdouglass's solution ([Caesar Cipher](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/building-blocks/caesar-cipher), [Enumerable Methods](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/advanced-building-blocks/enumerable_methods), [Tic-Tac-Toe](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/oop/tic-tac-toe))
* James Brooks's solution ([Caesar Cipher](https://github.com/jhbrooks/caesar-cipher/tree/master/spec), [Enumerable Methods](https://github.com/jhbrooks/my-enumerable/tree/master/spec), [Tic Tac Toe](https://github.com/jhbrooks/tic-tac-toe/tree/master/spec))
* Luke Walker's solution ([Caesar Cipher](https://github.com/ubershibs/ruby-programming/blob/master/rspec_project/spec/caesar_cipher_spec.rb), [Enumerable](https://github.com/ubershibs/ruby-programming/blob/master/rspec_project/spec/enumerable_spec.rb), [Tic Tac Toe](https://github.com/ubershibs/ruby-programming/blob/master/rspec_project/spec/tictactoe3_spec.rb)
* [Miguel Herrera's solution](https://github.com/migueloherrera/projects/tree/master/spec)
* [Max Gallant's solution](https://github.com/mcgalcode/Ruby/tree/master/RSpecProject)
* Fabricio Carrara's solution ([Caesar Cipher](https://github.com/fcarrara/caesar_cipher), [Enumerable](https://github.com/fcarrara/ruby_advanced_building_blocks), [Tic Tac Toe](https://github.com/fcarrara/oop_with_ruby/tree/master/tic_tac_toe)
* Ricardo Villegas' solution ([Caesar Cipher](https://github.com/claricardo/RubyBuildingBlocks/blob/master/spec/caesar_cipher_spec.rb), [My_Enumerable Methods](https://github.com/claricardo/RubyBuildingBlocks/blob/master/spec/my_enumerables_spec.rb),) [Tic-Tac-Toe](https://github.com/claricardo/RubyBuildingBlocks/blob/master/spec/tic_tac_toe_spec.rb))
* [Deepak's solution](https://github.com/Deepak5050/rspec_warmup.git)
* [Kevin Mulherns solution](https://github.com/KevinMulhern/odinproject-testing/tree/master/warmup)
* DV's solution ([Caesar Cipher](https://github.com/dvislearning/caesar_cipher/blob/master/spec/cipher_spec.rb), [Enumerable](https://github.com/dvislearning/my_enumerable/blob/master/spec/my_enumerable_spec.rb), [Tic Tac Toe](https://github.com/dvislearning/TicTacToe/blob/master/spec/tictactoe_spec.rb)
* Jiazhi Guo's solution ([Caesar Cipher](https://github.com/jerrykuo7727/Caesar-Cipher), [Enumerable Methods](https://github.com/jerrykuo7727/Enumerable-Methods), [Tic Tac Toe](https://github.com/jerrykuo7727/Tic-Tac-Toe))
* [at0micr3d's solution](https://github.com/at0micr3d/ruby-rspec)
* David Chapman's solution ([Ceaser Cipher](https://github.com/davidchappy/odin_training_projects/tree/master/c_c), [Enumerable](https://github.com/davidchappy/odin_training_projects/tree/master/enumerable), and [Tic Tac Toe](https://github.com/davidchappy/odin_training_projects/tree/master/tic_tac_toe))
* [Dylan's solutions](https://github.com/resputin/the_odin_project/tree/master/Ruby/testing/time_travel)
* Austin Mason's solution ([Ceaser Cipher](https://github.com/CouchofTomato/caesar_cipher), [Enumerable](https://github.com/CouchofTomato/enumberable_extension), and [Tic Tac Toe](https://github.com/CouchofTomato/tictactoe))
* Jerry Gao's solution ([Caesar](https://github.com/blackwright/odin/tree/master/ruby_caesar_cipher), [Enumerable](https://github.com/blackwright/odin/tree/master/ruby_enumerable), [Tic-Tac-Toe](https://github.com/blackwright/odin/tree/master/ruby_tic_tac_toe))
* tholymap's solution ([Caesar Cipher](https://github.com/tholymap/OdinRspec/blob/master/spec/caesar_cipher_spec.rb), [Enumerable](https://github.com/tholymap/OdinRspec/blob/master/spec/my_enumerable_spec.rb), [Tic-Tac-Toe](https://github.com/tholymap/OdinRspec/blob/master/spec/tic_tac_toe_spec.rb))
* Francisco Carlos's solution ([Ceaser Cipher](https://github.com/fcarlosdev/the_odin_project/tree/master/tdd/caesar_cipher), [Enumerable](https://github.com/fcarlosdev/the_odin_project/tree/master/tdd/enumerable_methods), [Tic-Tac-Toe](https://github.com/fcarlosdev/the_odin_project/tree/master/tdd/tic_tac_toe))
* Sophia Wu's solution ([Caesar Cipher](https://github.com/SophiaLWu/project-testing-ruby-with-rspec/tree/master/caesars_cipher), [Enumerable](https://github.com/SophiaLWu/project-testing-ruby-with-rspec/tree/master/enumerable_methods), [Tic Tac Toe](https://github.com/SophiaLWu/project-testing-ruby-with-rspec/tree/master/tic_tac_toe))
* John Connor's solution([Caesar Cipher](https://github.com/jacgitcz/caesar_cipher),[Enumerable](https://github.com/jacgitcz/enumeration_methods),[Tic Tac Toe](https://github.com/jacgitcz/tictactoe_oop))
* Simon's solution([Caesar Cipher](https://github.com/SimonSomlai/Odin/tree/master/Ruby/cypher),[Enumerable](https://github.com/SimonSomlai/Odin/tree/master/Ruby/enumerable),[Tic Tac Toe](https://github.com/SimonSomlai/Odin/tree/master/Ruby/tic_tac_toe))
* Luján Fernaud's solution ([Caesar Cipher](https://github.com/lujanfernaud/ruby-building-blocks/blob/master/spec/caesar_cipher_spec.rb), [Enumerable](https://github.com/lujanfernaud/ruby-building-blocks/blob/master/spec/enumerable_spec.rb), [Tic Tac Toe](https://github.com/lujanfernaud/ruby-tic-tac-toe))
* Cody Buffaloe's solutions ([Caesar Cipher](https://github.com/CodyLBuffaloe/caesar_cipher), [Enumerable Methods](https://github.com/CodyLBuffaloe/enumerable_methods), [Tic Tac Toe](https://github.com/CodyLBuffaloe/tic_tac_toe))
* Anistor86's solutions ([Caesar Cipher](https://github.com/anistor86/caesar_cipher_with_specs), [Enumerable Methods](https://github.com/anistor86/enumerable_with_specs), [Tic Tac Toe](https://github.com/anistor86/tic_tac_toe))
* Jamesredux's solutions ([Caesar Cipher](https://github.com/Jamesredux/rb_blocks/tree/master/ceasar_cipher), [Enumerable Methods](https://github.com/Jamesredux/rb_blocks/tree/master/enumerable), [Tic Tac Toe](https://github.com/Jamesredux/rb_blocks/tree/master/oop/tictac))
* HSaad's solutions ([Caesar Cipher](https://github.com/HSaad/ruby-building-blocks/tree/master/ceasar-cipher), [Enumerable Methods](https://github.com/HSaad/enumerable), [Tic Tac Toe](https://github.com/HSaad/tic-tac-toe))
* zasman's solutions([Caesar Cipher](https://github.com/ZASMan/caesar_cipher))
* [Punnadittr's solutions](https://github.com/punnadittr/rspec_projects)
* Tommy's solution ([Caesar Cipher, Enumerable](https://github.com/hoangtommy/rubyExercises), [Tic Tac Toe](https://github.com/hoangtommy/tic-tac-toe))
* bchalman's solutions: [Caesar Cipher](https://github.com/bchalman/ruby_exercises/blob/master/spec/caesar_cipher_spec.rb), [Enumerable Methods](https://github.com/bchalman/ruby_exercises/blob/master/spec/my_enumerable_methods_spec.rb), [Tic Tac Toe](https://github.com/bchalman/tic_tac_toe)

### Project: TDD Connect Four

Hopefully everyone has played Connect Four at some point (if not, see the [Wikipedia page](http://en.wikipedia.org/wiki/Connect_Four)).  It's a basic game where each player takes turns dropping pieces into the cage.  Players win if they manage to get 4 of their pieces consecutively in a row, column, or along a diagonal.

The game rules are fairly straightforward and you'll be building it on the command line like you did with the other games.  If you want to spice up your game pieces, look up the [unicode miscellaneous symbols](http://en.wikipedia.org/wiki/List_of_Unicode_characters#Miscellaneous_Symbols).  The Ruby part of this should be well within your capability by now so it shouldn't tax you much to think about it.

The major difference here is that you'll be doing this TDD-style.  So figure out what needs to happen, write a (failing) test for it, then write the code to make that test pass, then see if there's anything you can do to refactor your code and make it better.

Only write exactly enough code to make your test pass.  Oftentimes, you'll end up having to write two tests in order to make a method do anything useful.  That's okay here.  It may feel a bit like overkill, but that's the point of the exercise.  Your thoughts will probably be something like "Okay, I need to make this thing happen.  How do I test it?  Okay, wrote the test, how do I code it into Ruby?  Okay, wrote the Ruby, how can I make this better?"  You'll find yourself spending a fair bit of time Googling and trying to figure out exactly how to test a particular bit of functionality.  That's also okay... You're really learning RSpec here, not Ruby, and it takes some getting used to.

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Build Connect Four!  Just be sure to keep it TDD.
</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

* Add your solution below this line!
* [Mohamed Elattar's Solution](https://github.com/mohamed-elattar/count-four)
* [prw001's solution](https://github.com/prw001/connect_four)
* [Max Garber's solution](https://github.com/bubblebooy/miscellaneous-exercises/tree/master/Connect%20Four)
* [Demo318's solution](https://github.com/Demo318/ruby_connect_four)
* [Javier Machin's solution](https://github.com/Javier-Machin/Connect_Four)
* [Isil Donmez's solution](https://github.com/isildonmez/connect4)
* [Jmooree30's solution](https://github.com/jmooree30/rspec_connect4.git)
* [Andrew's solution](https://github.com/andrewr224/Connect-Four)
* [Ovsjah Schweinefresser's Solution](https://github.com/Ovsjah/testing_ruby/tree/master/connect_four)
* [Jonathan Yiv's solution](https://github.com/JonathanYiv/connect_four)
* [Clayton's solution](https://github.com/cjsweeten101/OdinProjects/tree/master/connect_four)
* [Kasey's solution](https://github.com/kasey-z/TOP-solutions/tree/master/connect_four)
* [Adsy430's solution](https://github.com/adampal/connect4)
* [xavier's solution](https://github.com/nxdf2015/odin-testing-ruby-with-rspec)
* [holdercp's solution](https://github.com/holdercp/connect-four)
* [theghall's solution](https://github.com/theghall/connect_four)
* [jfonz412's solution](https://github.com/jfonz412/connect_four)
* [Nikolay Dyulgerov's solution](https://github.com/NicolayD/ruby-rspec)
* [Raiko's Solution](https://github.com/Cypher0/connect_four)
* [yilmazgunalp's solution](https://github.com/yilmazgunalp/connect_four)
* [ToTenMilan's solution](https://github.com/ToTenMilan/the_odin_project/tree/master/ruby/rspec)
* [Ayushka's solution](https://github.com/ayushkamadji/connect_four_ruby)
* [Nicolas Amaya's solution](https://github.com/nicoasp/TOP---Ruby-Rspec-Testing)
* [nmac's solution](https://github.com/nmacawile/connect_four)
* [Jib's Solution](https://github.com/NuclearMachine/OdinTasks/tree/master/connect_four)
* [Stefan P's solution](https://github.com/spavikevik/connect_four)
* [Leonard Soaivan's solution](https://github.com/leosoaivan/TOP_connectfour)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_rspec_testing/connect_four_tdd)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project2_8_Ruby_Rspec/connect_four)
* [Tommy Noe's solution](https://github.com/thomasjnoe/connect_four)
* [James MacIvor's solution](https://github.com/RobotOptimist/connect_four)
* [Aleksandar's solution](https://github.com/rodic/Odin-Ruby-Projects/tree/master/Project:%20Testing%20Ruby%20with%20RSpec)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_03-Advanced_Ruby/testing_with_rspec/connect_four_rspec)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/tree/master/Project8/testingruby2)
* [Dominik Stodolny's solution](https://github.com/dstodolny/connect_four)
* [Dawn Pattison's solution](https://github.com/pattisdr/theOdinProject/tree/master/connect_four)
* [Frank Peelen's solution](https://github.com/FrankPeelen/Connect-Four)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_connect_four)
* [Alex Chen's solution](https://github.com/Chenzilla/test_driven_connect_four)
* [Dan Hoying's solution](https://github.com/danhoying/testing_ruby_with_rspec/tree/master/connect_four)
* [Xavier Reid's solution](https://github.com/xreid/connect_four)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/tree/master/ruby/project15--connect-four)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/blob/master/ruby/testing-ruby/connect-four)
* [Giorgos's solution](https://github.com/vinPopulaire/connect_four)
* [Alex Tsiras' solution](https://github.com/arialblack14/connect_four)
* [srashidi's solution](https://github.com/srashidi/RSpec_Project/tree/master/connect_four)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/testing-ruby/connect-four)
* [James Brooks's solution](https://github.com/jhbrooks/connect-four)
* [Luke Walker's solution](https://github.com/ubershibs/ruby-programming/tree/master/connect4)
* [Tomasz Kula's solution](https://github.com/zetsnotdead/connect_four)
* [Miguel Herrera's solution](https://github.com/migueloherrera/projects/blob/master/spec/connect_four_spec.rb)
* [Max Gallant's solution](https://github.com/mcgalcode/Ruby/tree/master/RSpecProject)
* [djhart's solution](https://github.com/djhart/connect_four)
* [Sophia Wu's solution](https://github.com/SophiaLWu/project-testing-ruby-with-rspec/tree/master/connect_four)
* [Fabricio Carrara's solution](https://github.com/fcarrara/connect_four_tdd)
* Ricardo Villegas' solution ([Game code](https://github.com/claricardo/RubyBuildingBlocks/blob/master/connect_four.rb), [Game tests](https://github.com/claricardo/RubyBuildingBlocks/blob/master/spec/connect_four_spec.rb))
* [Kevin Mulherns solution](https://github.com/KevinMulhern/odinproject-testing/tree/master/connect_four)
* [DV's solution](https://github.com/dvislearning/connectfour)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/rspec)
* [Amrr Bakry's solution](https://github.com/Amrrbakry/ruby_the_odin_project/tree/master/connect_four)
* [Jiazhi Guo's solution](https://github.com/jerrykuo7727/connect_four)
* [m-chrzan's solution](https://github.com/m-chrzan/connect4)
* [Loris Aranda's solution](https://github.com/LorisProg/ruby-connectFour)
* [at0micr3d's solution](https://github.com/at0micr3d/ruby-rspec/tree/master/connect-four)
* [Dylan's solution](https://github.com/resputin/the_odin_project/tree/master/Ruby/testing/connect_four)
* [Austin Mason's solution](https://github.com/CouchofTomato/ConnectFour)
* [David Chapman's solution](https://github.com/davidchappy/odin_training_projects/tree/master/connect_four)
* [Jerry Gao's solution](https://github.com/blackwright/odin/tree/master/ruby_connect_four)
* [tholymap's solution](https://github.com/tholymap/OdinRspec/blob/master/spec/connect_four_spec.rb)
* [Francisco Carlos's solution](https://github.com/fcarlosdev/the_odin_project/tree/master/tdd/connect_four)
* [Braydon Pacheco's solution](https://github.com/pacheeko/connect_four)
* [Simon's solution](https://github.com/SimonSomlai/Odin/tree/master/Ruby/connect_four)
* [Kyle Thomson's solution](https://github.com/idynkydnk/connect_four)
* [John Connor's solution](https://github.com/jacgitcz/tconnect4)
* [Zach Beaird's solution](https://github.com/zbbeaird89/Connect-Four)
* [Luján Fernaud's solution](https://github.com/lujanfernaud/ruby-connect-four)
* [Cody Buffaloe's solution](https://github.com/CodyLBuffaloe/Connect_Four)
* [Jamesredux's solution](https://github.com/Jamesredux/connect4)
* [HSaad's solution](https://github.com/HSaad/connect-four)
* [Punnadittr's solution](https://github.com/punnadittr/connect_four)
* [Malaika's Solution](https://github.com/malaikaMI/connect_four)
* [bchalman's Solution](https://github.com/bchalman/connect_four)

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [RSpec Mock example SO question](http://stackoverflow.com/questions/3622604/rspec-mock-object-example)
* [Helpful video from Sandi Metz](https://www.youtube.com/watch?v=URSWYvyc42M)
* [Tutorials Point RSpec Writing Specs](https://www.tutorialspoint.com/rspec/rspec_writing_specs.htm)
