# Project: Serialization and Working with Files
*Estimated Time: 4-6 hours*

*Don't forget to use Git to save your projects!*

## Warmup: Event Manager

In your Ruby days to come, you'll inevitably run into times when you'll be working with CSV files and imperfect data.  Seriously... there is no such thing as a perfect dataset.  Any time you find what looks like the perfect batch of data on something interesting, whether you're trying to plot airline flight delays on a map, tease out the nuggets from a master list of nonprofits, or scrape 10,000 emails to mercilessly SPAM with your latest get-rich-quick scheme, it will be full of mistakes, omissions, and misspellings.  Working with and cleaning up data go hand in hand.

### Your Task

1. [This tutorial from Jumpstart Lab](http://tutorials.jumpstartlab.com/projects/eventmanager.html) walks you through just that sort of operation. Give it a shot.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Jamie's solution (Apr-16,2014)](https://github.com/Jberczel/odin-projects/tree/master/event_manager)
* [Donald's Solution](https://github.com/donaldali/odin-ruby/tree/master/project_serialization/event_manager)
* [Marina Sergeyeva's Solution](https://github.com/imousterian/OdinProject/tree/master/Project2_4_Ruby_FileIO/event_manager)
* [TomTom's Solution](https://github.com/tim5046/projectOdin/tree/master/FilesAndSerialization/event_manager)
* [Tommy Noe's Solution](https://github.com/thomasjnoe/jumpstartlab-event-manager)
* [Michael Alexander's Solution](https://github.com/betweenparentheses/event_manager)
* [Sahil Agarwal's Solution](https://github.com/sahilda/the_odin_project/tree/master/file-io-serialization/event_manager)
* [Adrian Badarau's Solution](https://github.com/adrianbadarau/event-manager)
* [James MacIvor's Solution](https://github.com/RobotOptimist/event_manager/blob/master/lib/event_manager.rb)
* *Your Solution Above This Line!*



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

* See Afshinator's solution here: [source code](https://github.com/afshinator/playground/tree/master/Hangman) or [view it in browser](http://htmlpreview.github.io/?https://github.com/afshinator/playground/blob/master/Hangman/index.html)
* [Jamie's solution (Apr-16,2014)](https://github.com/Jberczel/odin-projects/tree/master/hangman)
* [Chris's solution](https://github.com/krzoldakowski/theodinproject/tree/master/hangman_fileio)
* [Jayrobin's solution](https://github.com/jayrobin/hangman)
* [Donald's Solution](https://github.com/donaldali/odin-ruby/tree/master/project_serialization/hangman)
* [Alan Russell's solution](https://github.com/ajrussellaudio/hangman)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project2_4_Ruby_FileIO/hangman)
* [TomTom's Solution](https://github.com/tim5046/projectOdin/blob/master/FilesAndSerialization/Hangman/)
* [Peter's Solution (with AI)](https://github.com/peterhurford/hangman)
* [Teaflavored's Solution](https://github.com/Teaflavored/Project-Odin-Ruby-Programming/tree/master/Hangman)
* [Tommy Noe's Solution](https://github.com/thomasjnoe/hangman)
* [Michael Alexander's Solution](https://github.com/betweenparentheses/hangman)
* [Sahil Agarwal's Solution](https://github.com/sahilda/the_odin_project/tree/master/file-io-serialization/hangman)
* [Adrian Badarau's Solution](https://github.com/adrianbadarau/Hang-Man-Game)
* [Erithair's Solution](https://github.com/N19270/Hangman)
* [James MacIvor's Solution](https://github.com/RobotOptimist/hangman)
* [Hawkeye's Solution](https://github.com/Hawkeye000/hangman)


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* Found something helpful?  Add it here!




