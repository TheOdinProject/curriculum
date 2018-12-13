### Introduction

You've seen how simple it can be to get something up and running using Sinatra, in these projects you will use the Caesar Cipher and either the Hangman or Mastermind games you built in the Ruby course to make a couple of web apps.

### A note on deploying your apps
Deploying a Sinatra app to Heroku takes a little bit of work but the process is fairly straightforward. Instructions can be found [here](https://devcenter.heroku.com/articles/rack#sinatra)

1. your `config.ru` file should require your main application file (This will be something like `web_guesser.rb` in the jumpstart tutorial)
2. if you are using `sinatra/reloader`, you need to remove or comment out that line before pushing to Heroku.  Alternatively you can add `if development?` to that line and Heroku will automatically know not to use it (and it will still work locally!).
3. after creating your Gemfile, you need to run `bundle install` and add/commit the files to git before [creating a Heroku app and pushing it](https://devcenter.heroku.com/articles/git#creating-a-heroku-remote) via `git push heroku master`.

### Project 1: Caesar Cipher _reloaded_

Revisit the caesar cipher ruby script that you created during [Ruby Building Blocks](https://www.theodinproject.com/courses/ruby-programming/lessons/ruby-building-blocks) and use Sinatra to create a simple front-end for it.

### Your Task

<div class="lesson-content__panel" markdown="1">
1. Start a new Sinatra project (you can begin by doing a simple hello world as in the Jumpstart tutorial, just to make sure everything is set up correctly)
2. You should be able to do this with only one view, and a couple of routes, but feel free to be as fancy as you like.
3. Deploy to Heroku using the instructions at the top of this page.
</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

* Add your solution below this line!
* prw001's Solution [Github](https://github.com/prw001/sinatra_games_suite) [Live](https://safe-peak-15193.herokuapp.com/)
* Malaika's Solution [Github](https://github.com/malaikaMI/Sinatra_ceaser_cipher)
* Max Garber's solution [GitHub](https://github.com/bubblebooy/Sinatra_Caesar_Cipher) [Live](https://gentle-meadow-83909.herokuapp.com/)
* Btreim's solution [GitHub](https://github.com/btreim/sinatra) [Live](https://cryptic-tundra-83691.herokuapp.com)
* Nathan Sherburne's solution [GitHub](https://github.com/nathansherburne/caesar_cypher_reloaded) [Live](https://glacial-springs-63073.herokuapp.com/)
* Jon Yoo's solution [GitHub](https://github.com/jonyoowa/caeser-cipher-reloaded) [Live](https://secure-oasis-76384.herokuapp.com/)
* Samuel Master's solution[Github](https://github.com/redeyetuning/sin_caeser)[Live](https://murmuring-river-12342.herokuapp.com)
* Javier Machin's solution[Github](https://github.com/Javier-Machin/caesar_cipher_app)[Live](https://secret-sands-76856.herokuapp.com/)
* Isil Donmez's solution[Github](https://github.com/isildonmez/Caesar-Cipher)[Live](https://caesar-cipher-.herokuapp.com/)
* 0zra's Solution [Github](https://github.com/0zra/heroku_caesar) - [Live](https://gentle-falls-67644.herokuapp.com/)
* Ovsjah Schweinefresser's Solution [Github](https://github.com/Ovsjah/caesar_cipher_reloaded) - [Live](https://peaceful-sea-47272.herokuapp.com/)
* Lucas Bicudo's Solution [Github](https://github.com/lucbic/cipher) - [Live](https://lit-tor-29929.herokuapp.com/)
* Jmooree30's Solution [Github](https://github.com/jmooree30/sinatra_cipher.git) - [Live](https://desolate-citadel-27669.herokuapp.com/)
* [Andrew's solution](https://cryptic-stream-18377.herokuapp.com/) - [Source](https://github.com/andrewr224/cipher)
* Raiko's solution [Github](https://github.com/Cypher0/caesar) - [Live](https://rocky-waters-74257.herokuapp.com/)
* theghall's solution [Github](https://github.com/theghall/sinatra-caesar) - [Live](https://arcane-temple-35414.herokuapp.com/)
* Kasey Z's solution [GitHub](https://github.com/kasey-z/caesar_cipher_reloaded) - [Live](https://hidden-wildwood-20236.herokuapp.com/)
* Jonathan Yiv's solution [GitHub](https://github.com/JonathanYiv/caesar_cipher) - [Live](https://lit-woodland-76112.herokuapp.com/)
* jdrobertso's solution [source code](https://github.com/jdrobertso/cipher_site) - [Live](https://hidden-meadow-77860.herokuapp.com/)
* Clayton Sweeten's solution [source code](https://github.com/cjsweeten101/OdinProjects/tree/master/sinatra/caesar_reloaded) - [Live](https://boiling-crag-42204.herokuapp.com/)
* MGiagante's solution [source code](https://github.com/mgiagante/caesar_cipher_sinatra) - [Live](https://arcane-chamber-58799.herokuapp.com)
* justinckim3's solution [source code](https://github.com/justinckim3/sinatra-project) - [Live](https://sinatra-projects.herokuapp.com/caesar-cipher)
* Adsy430's solution [source code](https://github.com/adampal/caesar_reloaded) - [Live](https://mighty-river-58119.herokuapp.com)
* holdercp's solution [Source code](https://github.com/holdercp/caesar_cipher_sinatra) - [Live](https://glacial-falls-15610.herokuapp.com/)
* Nikolay Dyulgerov's solution [github](https://github.com/NicolayD/sinatra-odin) - [see it on the web](https://sinatra-odin.herokuapp.com/)
* jfonz412's solution [github](https://github.com/jfonz412/caesar_online)
* OlehSliusar's solution: [Live](https://caesar-cipher-reloaded-0.herokuapp.com/) - [Source code](https://github.com/OlehSliusar/caesar_cipher_reloaded)
* mindovermiles262's [caesar cipher](https://fast-citadel-19591.herokuapp.com/) - [github](https://github.com/mindovermiles262/caesar-cipher)
* Jordan Ellis-Lynch's [solution](https://blooming-ravine-82875.herokuapp.com/).
* ToTenMilan's solution [github](https://github.com/ToTenMilan/the_odin_project/tree/master/rails/sinatra/caesar_cipher)
* nmac's solution [github](https://github.com/nmacawile/sinatra_converted_projects) / [heroku](https://infinite-scrubland-80707.herokuapp.com/caesarcipher)
* Ayushka's solution [github](https://github.com/ayushkamadji/caesar_cipher)
* Orlando's solution [github](https://github.com/orlandodan14/Ruby-on-Rails/tree/master/Sinatra/caesar_cipher) / [see it on the web](https://sheltered-mountain-39747.herokuapp.com/caesar_cipher.erb)
* Chad Kreutzer's solution [github](https://github.com/ChadKreutzer/sinatra_cipher) / [see it on the web](https://salty-hamlet-78507.herokuapp.com/)
* yilmazgunalp's solution [github](https://github.com/yilmazgunalp/RoR/tree/master/Sinatra/caesar_chiper) / [see it on the web](https://gentle-everglades-11877.herokuapp.com/)
* RichJDSmith's solution [github](https://github.com/richjdsmith/sinatra_caeser) / [see it on the web](https://secret-shelf-31692.herokuapp.com)
* John Phelps's solution [github](https://github.com/jphelps413/odin-sinatra-caesar) / [see it on the web](https://jphelps413-sinatra-caesar.herokuapp.com/)
* Yash Anand's solution [github](https://github.com/yashanand1910/sinatra-project) / [see it on web](http://caesar-cipher2.herokuapp.com)
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
* Samuel Langenfeld's solution [github](https://github.com/SamuelLangenfeld/sinatra_caesar_cipher) / [see it on the web](http://langenfeld-caesar-cipher.herokuapp.com/)
* Kyle Thomson's solution [github](https://github.com/idynkydnk/portfolio_heroku) / [see it on the web](https://portfolio-heroku-kyle.herokuapp.com/caesar_cipher)
* Jonathan Marks's solution [github](https://github.com/johnjmarks4/sinatra) / [see it on the web](https://warm-springs-12433.herokuapp.com/)
* Luján Fernaud's solution [github](https://github.com/lujanfernaud/sinatra-caesar-cipher) / [see it on the web](https://sinatra-caesar.herokuapp.com/)
* Austin Norman's solution [github](https://github.com/austinnormancore/sinatra_caesar_cipher/blob/master/caesar_cipher.rb) / [see it on the web](https://obscure-ocean-55550.herokuapp.com/)
* Anistor86's solution [github](https://github.com/anistor86/sinatra_caesar_cipher) / [see it on the web](https://pure-retreat-21723.herokuapp.com/)
* Oliver Curting's solution [GitHub](https://github.com/Curting/web_guesser) / [see it on the web](https://sinatra-web-guesser.herokuapp.com/)
* Jeff Jubin's solution [GitHub](https://github.com/jeff1st/sinatra_games) / [see it on the web](https://quiet-beach-81520.herokuapp.com/cipher)
* Punnadittr's solution [GitHub](https://github.com/punnadittr/sinatra_caesar) / [see it on the web](https://radiant-journey-40824.herokuapp.com/)
* Agon's solution [Github](https://github.com/AgonIdrizi/Caesar_Cipher_SInatra) / [see it on the web](https://caesar-cipher-sinatra-app.herokuapp.com/)
* Jamesredux's solution [Github](https://github.com/Jamesredux/sinatra_portfolio) / [see it on the web](https://jredux-sinatra.herokuapp.com/)
* Areeba's solution [github](https://github.com/AREEBAISHTIAQ/sinatra)/ [see it on the web](https://sinatra-.herokuapp.com/)
* ParamagicDev's solution [Github](https://github.com/ParamagicDev/sinatra_cipher) / [See it on the web](https://dry-ridge-75791.herokuapp.com)
* bchalman's solution [Github](https://github.com/bchalman/sinatra_caesar_cipher)
* Tommy's solution [Github](https://github.com/hoangtommy/sinatra_caesar_cipher) / [Live](https://still-forest-86955.herokuapp.com)

### Project 2: Another Web-Game

Pick either Mastermind or Hangman and build a front end for it.  This one might take a little more work, but it should be well within your grasp at this point.  Have fun!

### Assignment

<div class="lesson-content__panel" markdown="1">
1. The UI-implementation is up to you this time.  Keeping them text-based is acceptable, but now that we're on the web you can branch out with images to make something a little nicer.
2. You'll probably want to go over the use of "sessions" within Sinatra again.  Check the [README](http://www.sinatrarb.com/intro.html#Using%20Sessions) and [here](https://learn.co/lessons/sinatra-mechanics-of-sessions-readme).
3. Have fun!  Don't forget to make all of your friends play your game!
4. _Extra Credit_ The free Heroku account only allows a limited number of projects, unless you add a credit card to your account (they won't charge you, it's just for identity confirmation). If you _do_ add your information, you can have unlimited projects, but they still limit how many of them can be "awake" at one time. You might consider using Sinatra to make yourself a simple web-portfolio so that you can store all of these apps in one project.
</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

* Add your solution below this line!
* prw001's Solution [Github](https://github.com/prw001/sinatra_games_suite) [Live](https://safe-peak-15193.herokuapp.com/)
* Brendan Tang's solution (Hangman) [GitHub](https://github.com/brendantang/hangman-sinatra) [Live](https://radiant-temple-25499.herokuapp.com/)
* Max Garber's solution (Hangman) [GitHub](https://github.com/bubblebooy/Sinatra_Hangman) [Live](https://floating-atoll-54622.herokuapp.com/)
* Nathan Sherburne's solution (Hangman) [GitHub](https://github.com/nathansherburne/caesar_cypher_reloaded) [Live](https://glacial-springs-63073.herokuapp.com/)
* Btreims's solution (Hangman) [GitHub](https://github.com/btreim/hangman_reboot) - [Live](https://protected-ocean-55660.herokuapp.com/)
* Jon Yoo's solution (Hangman) [GitHub](https://github.com/jonyoowa/hangman-sinatra) - [Live](https://rocky-sea-27959.herokuapp.com/)
* Samuel Masters's solution (Mastermind)[Github](https://github.com/redeyetuning/sin_mastermind)[Live](https://polar-gorge-27519.herokuapp.com/)
* Javier Machin's solution (Hangman)[Github](https://github.com/Javier-Machin/hangman_app)[Live](https://whispering-woodland-74608.herokuapp.com/)
* 0zra's solution (Mastermind)[Github](https://github.com/0zra/heroku_mastermind)
* Roman Alenskiy's solution (Hangman) [Github](https://github.com/Roman-Alenskiy/web_hangman) / [Heroku](https://web-hangman.herokuapp.com/)
* Isil Donmez's solution(Hangman)[Github](https://github.com/isildonmez/hangman_reloaded)[Live](https://hangman-reloaded.herokuapp.com/)
* Ovsjah Schweinefresser's Solution (Hangman) [Github](https://github.com/Ovsjah/hangman_on_web) - [Live](https://warm-inlet-77219.herokuapp.com/game)
* Lucas Bicudo's Solution (Hangman) [Github](https://github.com/lucbic/hangman) - [Live](https://lit-garden-60308.herokuapp.com/)
* Jmooree30's solution (Hangman) [Github](https://github.com/jmooree30/Sinatra_hangman.git) - [Live](https://gentle-waters-29359.herokuapp.com/)
* [Andrew's solution (Mastermind)](https://rocky-wildwood-37033.herokuapp.com/) - [Source](https://github.com/andrewr224/mastermind_reload)
* Raiko's solution (Mastermind) [Github](https://github.com/Cypher0/mastermind) - [Live](https://damp-brook-36728.herokuapp.com/)
* theghall's solution (Mastermind) [Github](https://github.com/theghall/sinatra-mastermind) - [Live](https://safe-eyrie-38662.herokuapp.com/)
* Kasey Z's solution (Mastermind) [Source Code](https://github.com/kasey-z/mastermind_reloaded) - [Live](https://frozen-falls-49194.herokuapp.com//)
* Jonathan Yiv's solution (Hangman) [Source Code](https://github.com/JonathanYiv/hangman) - [Live](https://infinite-river-55923.herokuapp.com/)
* Clayton Sweeten's solution (Hangman)[source code](https://github.com/cjsweeten101/OdinProjects/tree/master/sinatra/hangman_reloaded) - [Live](https://serene-dusk-67079.herokuapp.com/)
* justinckim3's solution [source code](https://github.com/justinckim3/sinatra-project) - [Live](https://sinatra-projects.herokuapp.com/hangman)
* Adsy430's solution [Source code](https://github.com/adampal/hangman) - [Live](https://fierce-gorge-46516.herokuapp.com/?restart=true)
* holdercp's solution [Source code](https://github.com/holdercp/hangman-sinatra) - [Live](https://thawing-cliffs-47023.herokuapp.com/)
* Nikolay Dyulgerov's solution (Hangman) [github](https://github.com/NicolayD/sinatra-odin) - [see it on the web](https://sinatra-odin.herokuapp.com/)
* jfonz412's solution (hangman)[github](https://github.com/jfonz412/hangman_online)
* mindovermiles262's (Mastermind) [github](https://rocky-tor-31467.herokuapp.com/) - [github](https://github.com/mindovermiles262/mastermind)
* Jordan Ellis-Lynch's [github](https://github.com/jordy-el/sinatra_hangman) - ([heroku](https://floating-mountain-38019.herokuapp.com/))
* ToTenMilan's solution (Mastermind) [github](https://github.com/ToTenMilan/the_odin_project/tree/master/rails/sinatra/mastermind) / [see it on the web](http://mastermindbymilan.herokuapp.com)
* nmac's solution (Mastermind) [github](https://github.com/nmacawile/sinatra_converted_projects) / [heroku](https://infinite-scrubland-80707.herokuapp.com/mastermind)
* Ayushka's solution: Mastermind [github](https://github.com/ayushkamadji/master_mind_sinatra) / [see it on the web](https://afternoon-escarpment-72597.herokuapp.com/)
* Orlando's solution: Hangman, Mastermind, others [github](https://github.com/orlandodan14/Ruby-on-Rails/tree/master/Sinatra/web_portafolio) / [see it on the web](https://sheltered-mountain-39747.herokuapp.com/)
* yilmazgunalp's solution - Hangman: [github](https://github.com/yilmazgunalp/RoR/tree/master/hangman) / [see it on the web](https://hidden-hamlet-76819.herokuapp.com/)
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
* Samuel Langenfeld's solution - Hangman: [github](https://github.com/SamuelLangenfeld/sinatra_hangman) / [see it on the web](http://langenfeld-hangman.herokuapp.com/)
* Kyle Thomson's solution - Hangman: [github](https://github.com/idynkydnk/portfolio_heroku) / [see it on the web](https://portfolio-heroku-kyle.herokuapp.com/hangman)
* Jonathan Marks's solution - MasterMind: [github](https://github.com/johnjmarks4/mastermind_reloaded) / [see it on the web](https://arcane-shelf-92558.herokuapp.com/)
* Luján Fernaud's solution [github](https://github.com/lujanfernaud/sinatra-countries-hangman) / [see it on the web](https://sinatra-countries-hangman.herokuapp.com/)
* Pat's solution - Mastermind: [github](https://github.com/Pat878/Sinatra_Mastermind) / [see it on the web](https://sleepy-island-52915.herokuapp.com/)
* Austin Norman's solution - Hangman: [github](https://github.com/austinnormancore/hangmansinatra) / [see it on the web](https://secure-ridge-15084.herokuapp.com/)
* Anistor86's solution - Hangman: [github](https://github.com/anistor86/sinatra_hangman) / [see it on the web](https://safe-escarpment-98953.herokuapp.com/)
* Francisco's Carlos solution - [github](https://github.com/fcarlosdev/the_odin_project/tree/master/sinatra_project)
* Oliver Curting's solution - Mastermind: [GitHub](https://github.com/Curting/sinatra_mastermind) / [see it on the web](https://sinatra-mastermind.herokuapp.com/)
* Jeff Jubin's solution - Mastermind: [GitHub](https://github.com/jeff1st/sinatra_games) / [see it on the web](https://quiet-beach-81520.herokuapp.com/)
* Punnadittr's solution - Hangman: [github](https://github.com/punnadittr/sinatra_hangman) / [see it on the web](https://protected-falls-18287.herokuapp.com/)
* Agon's solution - Hangman: [github](https://github.com/AgonIdrizi/Hangman_Sinatra) / [see it on the web](https://cryptic-earth-30619.herokuapp.com/)
* Jamesredux's solution - Hangman: [github](https://github.com/Jamesredux/sinatra_portfolio) / [see it on the web](https://jredux-sinatra.herokuapp.com/)
* Calstream's solution - Hangman: [github](https://github.com/Calstream/hangman-sinatra) / [play here](https://hanged-man.herokuapp.com/)
* Malaika's Solution For Hangman: [Github](https://github.com/malaikaMI/Hangman_with_sinatra)
* AlexFuro's Solution (Hangman): [Github](https://github.com/alexfuro/TOP_hangman) / [Live Demo](https://furohangman.herokuapp.com/)
* ParamagicDev's Solution (Mastermind): [Github](https://github.com/ParamagicDev/sinatra_mind) / [See it on the web](https://immense-mesa-98857.herokuapp.com)
* bchalman's Solution (Hangman): [Github](https://github.com/bchalman/sinatra_hangman) / [Live](https://fierce-plains-57125.herokuapp.com/)
* Tommy's Solution (Hogwarts Hangman): [Github](https://github.com/hoangtommy/sinatra_hangman) / [Live](https://powerful-wildwood-91516.herokuapp.com/)
