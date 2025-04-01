### Introduction

Files are a great way to save and reload a game, so we'll give it a shot here by building [Hangman](https://www.wikihow.com/Play-Hangman).

### Assignment

You will be building a command line Hangman game where one player plays against the computer, but a bit more advanced.

<div class="lesson-content__panel" markdown="1">

  1. Download the `google-10000-english-no-swears.txt` dictionary file from the first20hours GitHub repository [google-10000-english](https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt).
  1. When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.
  1. You don't need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses they have before the game ends.  You should also display which correct letters have already been chosen (and their position in the word, e.g. `_ r o g r a _ _ i n g`) and which incorrect letters have already been chosen.
  1. Every turn, allow the player to make a guess of a letter.  It should be case insensitive.  Update the display to reflect whether the letter was correct or incorrect.  If out of guesses, the player should lose.
  1. Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game.  Remember what you learned about serializing objects.
  1. When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved.  Play on!

</div>
