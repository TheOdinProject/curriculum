# Projects: Sinatra

*Don't forget to use Git to save your projects!*

You've seen how simple it can be to get something up and running using Sinatra, in these projects you will use the Caesar Cipher and either the Hangman or Mastermind games you built in the Ruby course to make a couple of web apps.

### A note on deploying your apps
Deploying a Sinatra app to Heroku takes a little bit of work but the process is fairly straightforward. Instructions can be found [here](https://devcenter.heroku.com/articles/rack#sinatra)

1. your `config.ru` file should require your main application file (This will be something like `web_guesser.rb` in the jumpstart tutorial)
2. if you are using `sinatra/reloader`, you need to remove or comment out that line before pushing to Heroku.  Alternatively you can add `if development?` to that line and Heroku will automatically know not to use it (and it will still work locally!).
3. after creating your Gemfile, you need to run `bundle install` and add/commit the files to git before pushing to Heroku.

## Project 1: Caesar Cipher _reloaded_

Revisit the caesar cipher ruby script that you created during [Ruby Building Blocks](http://www.theodinproject.com/ruby-programming/building-blocks) and use Sinatra to create a simple front-end for it.

### Your Task

1. Start a new sinatra project (you can begin by doing a simple hello world as in the Jumpstart tutorial, just to make sure everything is set up correctly)
2. You should be able to do this with only one view, and a couple of routes, but feel free to be as fancy as you like.
3. [Deploy to Heroku!](https://devcenter.heroku.com/articles/rack#sinatra)

## Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* Add your solution below this line!
* Jib's solution [github](https://github.com/NuclearMachine/odin_rails/tree/master/sinatra_proj) / [see it on web](https://damp-plateau-50624.herokuapp.com/)
* leosoaivan's solution [github](https://github.com/leosoaivan/sinatra_cipher) / [see it on the web](https://morning-mesa-70245.herokuapp.com/)
* bcasadei's solution [github](https://github.com/bcasadei/caesar_cipher_reloaded) / [see it on the web](https://caesar-cipher-reloaded.herokuapp.com/)
* codyloyd's solution [github](https://github.com/codyloyd/sinatra-translator) / [see it on the web](https://cryptic-reaches-55962.herokuapp.com/)
* Oscar Y.'s solution [github](https://github.com/mysteryihs/caesar_cipher) / [see it on the web](https://dry-retreat-16146.herokuapp.com/)
* J-kaizen's solution [github](https://github.com/J-kaizen/TheOdinProject/tree/master/Rails/sinatra)
* chrisnorwood's solution [github](https://github.com/chrisnorwood/caesar-web) / [see it on the web](https://sinatra-caesar-cipher.herokuapp.com/)
* Jiazhi Guo's solution [github](https://github.com/jerrykuo7727/caesar_cipher) / [see it on the web](https://caesar-cipher-by-jiazhi.herokuapp.com/)
* AaronGerry's solution [github](https://github.com/AaronGerry/web_guesser) / [see it on the web](https://hidden-taiga-21991.herokuapp.com/)
* Shala Qweghen's solution [github](https://github.com/ShalaQweghen/ceasar_cipher) / [see it on the web](https://dry-refuge-52478.herokuapp.com/)
* Derek Kwong's solution [github](https://github.com/dckwong/CaesarCipher) / [see it on the web](https://caesarcipherapp.herokuapp.com/)
* Chris Chambers' solution [github](https://github.com/chrisgchambers/caesar_cipher) / [see it on the web](https://salty-beach-27561.herokuapp.com/)
* Amrr Bakry's solution [github](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/ceasar_cipher) / [see it on the web](https://calm-wave-18087.herokuapp.com/)
* csrail's solution [github](https://github.com/csrail/caesar-cipher-sinatra) / [see it on the web](https://csrail-caesar-cipher.herokuapp.com/)
* DV's solution [github](https://github.com/dvislearning/caesar_cipher/tree/master/lib) / [see it on the web](https://quiet-cove-96544.herokuapp.com/)
* Austin's solution [github](https://github.com/CouchofTomato/ceasar_cipher_sinatra) / [see it on the web](https://couch-cipher.herokuapp.com/)
* Miguel Herrera's solution [github](https://github.com/migueloherrera/sinatra-projects) / [see it on the web](https://floating-meadow-84284.herokuapp.com/caesar_cipher)
* at0micr3d's solution - [github](https://github.com/at0micr3d/sinatra-caesar-cipher) / [see it on the web](https://pure-tundra-73618.herokuapp.com/)
* Tom Westerhout's solution [Github](https://github.com/Westw00d/Caesar-Cipher) / [see it on the web](http://thawing-headland-68994.herokuapp.com/)
* Jerry Gao's solution [github](https://github.com/blackwright/odin/tree/master/sinatra_caesar_cipher) / [see it on the web](https://caesar-cipher-sinatra.herokuapp.com/)
* Sophia Wu's solution [github](https://github.com/SophiaLWu/sinatra-caesar-cipher) / [see it on the web](https://shielded-temple-74302.herokuapp.com/)

## Project 2: Another Web-Game

Pick either Mastermind or Hangman and build a front end for it.  This one might take a little more work, but it should be well within your grasp at this point.  Have fun!

### Your Task

1. The UI-implementation is up to you this time.  Keeping them text-based is acceptable, but now that we're on the web you can branch out with images to make something a little nicer.
2. You'll probably want to go over the use of "sessions" within Sinatra again.  Check the [README](http://www.sinatrarb.com/intro.html#Using%20Sessions) and [here](https://learn.co/lessons/sinatra-mechanics-of-sessions-readme).
3. Have fun!  Don't forget to make all of your friends play your game!
4. _Extra Credit_ The free Heroku account only allows a limited number of projects, unless you add a credit card to your account (they wont charge you, its just for identity confirmation). If you _do_ add your information, you can have unlimited projects, but they still limit how many of them can be "awake" at one time. You might consider using sinatra to make yourself a simple web-portfolio so that you can store all of these apps in one project.

## Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* Add your solution below this line!
* leosoaivan's solution - Hangman: [github](https://github.com/leosoaivan/sinatra_hangman) / [see it on the web](https://fierce-island-53975.herokuapp.com/)
* Jib's solution [github](https://github.com/NuclearMachine/odin_rails/tree/master/sinatra_proj) / [see it on web](https://damp-plateau-50624.herokuapp.com/)
* codyloyd's solution - MasterMind: [github](https://github.com/codyloyd/sinatra-codebreaker) / [see it on the web](https://crafty-breaker-4567.herokuapp.com/) Hangman: [github](https://github.com/codyloyd/hangman) / [see it on the web](https://subtle-wording-4567.herokuapp.com/)
* Martin's sulution - MasterMind: [github](https://github.com/mtsafer/MasterMind-Online) / [see it on the web](https://cryptic-caverns-91319.herokuapp.com) Hangman: [github](https://github.com/mtsafer/hangman-online) / [see it on the web](https://stormy-shelf-89128.herokuapp.com)]
* Oscar Y.'s solution - Hangman: [github](https://github.com/mysteryihs/hangman/) / [see it on the web](https://radiant-earth-86956.herokuapp.com/)
* chrisnorwood's solution - Hangman: [github](https://github.com/chrisnorwood/wordguess-web) / [see it on the web](https://sinatra-guessing-game.herokuapp.com/)
* Jiazhi Guo's solution - Hangman: [github](https://github.com/jerrykuo7727/hangman) / [see it on the web](https://hangman-by-jiazhi.herokuapp.com/)
* Diego V.'s solution - MasterMind: [github](https://github.com/Dieblax/mastermind-sinatra) / [see it on the web](https://mastermindforvikings.herokuapp.com/)
* Shala Qweghen's solution - MasterMind: [github](https://github.com/ShalaQweghen/another_web_game) / [see it on the web](https://warm-hamlet-61859.herokuapp.com/) Hangman: [github](https://github.com/ShalaQweghen/web_game) / [see it on the web](https://evening-fortress-95446.herokuapp.com/)
* Derek Kwong's solution - Hangman: [github](https://github.com/dckwong/Hangman) / [see it on the web](https://dkhangman.herokuapp.com/)
* Amrr Bakry's solution - Hangman: [github](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/sinatra_hangman) / [see it on the web](https://polar-brushlands-32644.herokuapp.com/)
* csrail's solution - Hangman: [github](https://github.com/csrail/hangman-sinatra) / [see it on the web](https://csrail-hangman.herokuapp.com/)
* DV's solution - Hangman: [github](https://github.com/dvislearning/hangman_sinatra) / [see it on the web](https://secret-escarpment-36246.herokuapp.com/)
* Austin's solution - Hangman: [github](https://github.com/CouchofTomato/hangman_sinatra) / [see it on the web](https://couch-hangman.herokuapp.com/)
* Miguel Herrera's solution - Hangman: [github](https://github.com/migueloherrera/sinatra-projects) / [see it on the web](https://floating-meadow-84284.herokuapp.com/hangman)
* at0micr3d's solution - Hangman: [github](https://github.com/at0micr3d/interrobang-man) / [see it on the web](https://sheltered-scrubland-38921.herokuapp.com/)
* Tom Westerhout's solution - Webguesser: [Github](https://github.com/Westw00d/Web-Guesser) / [see it on the web](http://shrouded-waters-66767.herokuapp.com/)
* Jerry Gao's solution - Hangman: [github](https://blackwright-hangman.herokuapp.com/) / [see it on the web](https://github.com/blackwright/odin/tree/master/sinatra_hangman)
* Sophia Wu's solution - Hangman: [github](https://github.com/SophiaLWu/sinatra-hangman) / [see it on the web](https://shielded-lowlands-85300.herokuapp.com/)
