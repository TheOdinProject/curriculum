# Project: Serialization and Working with Files
<!-- *Estimated Time: 4-6 hours* -->

*Don't forget to use Git to save your projects!*

## Warmup: Event Manager

In your Ruby days to come, you'll inevitably run into times when you'll be working with CSV files and imperfect data.  Seriously... there is no such thing as a perfect dataset.  Any time you find what looks like the perfect batch of data on something interesting, whether you're trying to plot airline flight delays on a map, tease out the nuggets from a master list of nonprofits, or scrape 10,000 emails to mercilessly SPAM with your latest get-rich-quick scheme, it will be full of mistakes, omissions, and misspellings.  Working with and cleaning up data go hand in hand.

### Your Task

1. [This tutorial from Jumpstart Lab](http://tutorials.jumpstartlab.com/projects/eventmanager.html) walks you through just that sort of operation. Give it a shot.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/event_manager)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_serialization/event_manager)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project2_4_Ruby_FileIO/event_manager)
* [TomTom's solution](https://github.com/tim5046/projectOdin/tree/master/FilesAndSerialization/event_manager)
* [Tommy Noe's solution](https://github.com/thomasjnoe/jumpstartlab-event-manager)
* [Michael Alexander's solution](https://github.com/betweenparentheses/event_manager)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/file-io-serialization/event_manager)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/event-manager)
* [James MacIvor's solution](https://github.com/RobotOptimist/event_manager/blob/master/lib/event_manager.rb)
* [Roman's solution](https://github.com/RomanADavis/event_manager)
* [Aleksandar's solution](https://github.com/Rodic/Odin-Ruby-Projects/tree/master/Project:%20Serialization%20and%20Working%20with%20Files/event_manager)
* [Vidul's solution](https://github.com/viparthasarathy/event_manager)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/tree/master/Project4/serialproject1)
* [John Quarles' solution](https://github.com/johnwquarles/jumpstartlab-event-manager)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_03-Advanced_Ruby/serialization_and_files/event_manager)
* [Dominik Stodolny's solution](https://github.com/dstodolny/event_manager)
* [Lara Finnegan's solution](https://github.com/lcf0285/event_manager)
* [Nikola Čvorović's solution](https://github.com/cvorak/event_manager.git)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/tree/master/event_manager)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/serialization/tree/master/event_manager)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/event_manager)
* [Eduardo Frias' solution](https://github.com/feek1g/theodinproject/tree/master/EventManager)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/tree/master/event_manager/lib)
* [Chris Hall's solution](https://github.com/Concretechris/odinProject/blob/master/jumpstart-event-manager)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_event_manager/blob/master/lib/event_manager.rb)
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/tree/master/project_serializing/event_manager)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/tree/master/9-serialization/1%20-%20Event%20Manager)
* [Joe Balsamo's solution](https://github.com/Joe-Balsamo/event-manager)
* [Alex Chen's solution](https://github.com/Chenzilla/event_manager)
* [Cody Gipson's solution](https://github.com/Cgipson06/EventManager)
* [Dan Hoying's solution](https://github.com/danhoying/file_io_and_serialization/tree/master/event_manager)
* [John Tobillo's solution](https://github.com/jdtobill/Ruby/tree/master/tutorials/event_manager)
* [PiotrAleksander's solution](https://github.com/PiotrAleksander/Ruby/tree/master/EventManager)
* [Noah Prescott's solution](https://github.com/npresco/serialization/tree/master/event_manager)
* [lynchd2's solution](https://github.com/lynchd2/TOP-Ruby-Programming/tree/master/event_manager)
* [Panashe Fundira's solution](https://github.com/munyari/odin/tree/master/learning-ruby/event_manager)
* [Ashley Lewis's solution](https://github.com/ashleymichal/the_odin_project/tree/master/the-odin-project/ruby/files/event_manager)
* [Alex Tsiras' solution](https://github.com/arialblack14/event-manager)
* [Scott Bobbitt's solution](https://github.com/sco-bo/event_manager)
* [Giorgos Mitsis's solution](https://github.com/vinPopulaire/event_manager)
* [Andrew Park's solution](https://github.com/akpark93/the_odin_project/tree/master/ruby_programming_projects/event_manager)
* [srashidi's solution](https://github.com/srashidi/Files_and_Serialization/tree/master/event_manager)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/file-i-o/event-manager)
* [Skye Free's solution](https://github.com/swfree/the-odin-project/tree/master/event-manager)
* [djhart's solution](https://github.com/djhart/event_manager)
* Add your solution above this line!


## Project: Hangman

Files are a great way to save and reload a game, so we'll give it a shot here.

### Your Task

You will be building a simple command line Hangman game where one player plays against the computer, but a bit more advanced.  If you're unfamiliar with how Hangman works, see <a href="http://en.wikipedia.org/wiki/Hangman_(game)">Wikipedia</a>.

1. Download the `5desk.txt` dictionary file from [http://scrapmaker.com/](http://scrapmaker.com/view/twelve-dicts/5desk.txt).
2. When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.
3. You don't need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses she has before the game ends.  You should also display which correct letters have already been chosen (and their position in the word, e.g. `_ r o g r a _ _ i n g`) and which incorrect letters have already been chosen.
2. Every turn, allow the player to make a guess of a letter.  It should be case insensitive.  Update the display to reflect whether the letter was correct or incorrect.  If out of guesses, the player should lose.
3. Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game.  Remember what you learned about serializing objects... you can serialize your game class too!
4. When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved.  Play on!


### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Afshinator's solution](https://github.com/afshinator/playground/tree/master/Hangman) | [View in browser](http://htmlpreview.github.io/?https://github.com/afshinator/playground/blob/master/Hangman/index.html)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/hangman)
* [Chris's solution](https://github.com/krzoldakowski/theodinproject/tree/master/hangman_fileio)
* [Jayrobin's solution](https://github.com/jayrobin/hangman)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_serialization/hangman)
* [Alan Russell's solution](https://github.com/ajrussellaudio/hangman)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project2_4_Ruby_FileIO/hangman)
* [TomTom's solution](https://github.com/tim5046/projectOdin/blob/master/FilesAndSerialization/Hangman/)
* [Peter's solution (with AI)](https://github.com/peterhurford/hangman)
* [Tommy Noe's solution](https://github.com/thomasjnoe/hangman)
* [Michael Alexander's solution](https://github.com/betweenparentheses/hangman)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/file-io-serialization/hangman)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Hang-Man-Game)
* [Erithair's solution](https://github.com/N19270/Hangman)
* [James MacIvor's solution](https://github.com/RobotOptimist/hangman)
* [Hawkeye's solution](https://github.com/Hawkeye000/hangman)
* [Vincent's solution](https://github.com/wingyu/hangman)
* [Aleksandar's solution](https://github.com/Rodic/Odin-Ruby-Projects/tree/master/Project:%20Serialization%20and%20Working%20with%20Files/hangman)
* [Vidul's solution](https://github.com/viparthasarathy/hangman)
* [John Quarles' solution](https://github.com/johnwquarles/Ruby-FileIO-Hangman)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/tree/master/Project4/Hangman)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_03-Advanced_Ruby/serialization_and_files/hangman)
* [Dominik Stodolny's solution](https://github.com/dstodolny/hangman)
* [Lara Finnegan's solution](https://github.com/lcf0285/hangman)
* [Nikola Čvorović's solution](https://github.com/cvorak/Hangman.git)
* [Dawn Pattison's solution](https://github.com/pattisdr/theOdinProject/tree/master/hangman)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/serialization/tree/master/hangman)
* [Rafael E's solution](https://github.com/NerdDiffer/hangman)
* [LongPotato's solution](https://github.com/LongPotato/Hangman_GUI)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/Hangman)
* [Eduardo Frias' solution](https://github.com/feek1g/theodinproject/tree/master/Hangman)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/tree/master/hangman)
* [Frank Peelen's solution](https://github.com/FrankPeelen/Hangman/blob/master/hangman.rb)
* [Brann James' solution](https://github.com/brannj/The_Odin_Project/blob/master/serialization/hangman/lib/hangman.rb)
* [Chris Hall's solution](https://github.com/Concretechris/odinProject/tree/master/OP%20-%20hangman)
* [Greg Park's solution](https://github.com/gregoryjpark/Hangman)
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/tree/master/3_Ruby_hangman)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_hangman)
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/tree/master/project_serializing/hangman)
* [Jon Yorg's solution](https://github.com/Yorgg/Ruby-Stuff/tree/master/hangman)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/tree/master/9-serialization-and-files/2%20-%20Hangman)
* [Alex Chen's solution](https://github.com/Chenzilla/hangman_with_save)
* [Joe Balsamo's solution](https://github.com/Joe-Balsamo/hangman)
* [Cody Gipson's solution](https://github.com/Cgipson06/Hangman)
* [Dan Hoying's solution](https://github.com/danhoying/file_io_and_serialization/tree/master/hangman)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/tree/master/ruby/hangman)
* [Raycotek's solution](https://github.com/Raycotek/Odinprojects/blob/master/hangman/hangman.rb)
* [John Tobillo's solution](https://github.com/jdtobill/Ruby/tree/master/games/hangman)
* [PiotrAleksander's solution](https://github.com/PiotrAleksander/Ruby/blob/master/Szubienica.rb)
* [Noah Prescott's solution](https://github.com/npresco/serialization/tree/master/hangman)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/ruby/serialization-and-working-with-files/hangman)
* [lynchd2's solution](https://github.com/lynchd2/TOP-Ruby-Programming/tree/master/hangman)
* [Aviv Levinsky's solution](https://github.com/pugsiman/Hang_Man/blob/master/hangman.rb)
* [Ashley Lewis's solution](https://github.com/ashleymichal/the_odin_project/tree/master/the-odin-project/ruby/files/hangman)
* [Alex Tsiras' solution](https://github.com/arialblack14/hangman)
* [Scott Bobbitt's solution](https://github.com/sco-bo/hangman)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/blob/master/ruby/project8--hangman/hangman.rb)
* [Giorgos Mitsis's solution](https://github.com/vinPopulaire/hangman)
* [Andrew Park's solution](https://github.com/akpark93/the_odin_project/tree/master/ruby_programming_projects/hangman)
* [poctek's solution](https://github.com/poctek/The_Odin_Project_Files/blob/master/Projects/Hangman/hangman.rb)
* [Panashe Fundira's solution](https://github.com/munyari/odin/tree/master/hangman)
* [srashidi's solution](https://github.com/srashidi/Files_and_Serialization/tree/master/hangman)
* [James Brooks's solution](https://github.com/jhbrooks/hangman)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/file-i-o/hangman)
* [Skye Free's solution](https://github.com/swfree/the-odin-project/tree/master/hangman)
* [djhart's solution](https://github.com/djhart/hangman)
* [Eric's solution](https://github.com/em77/hangman)
* Add your solution above this line!


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* Found something helpful?  Add it here!




