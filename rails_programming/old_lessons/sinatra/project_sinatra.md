### Introduction

You've seen how simple it can be to get something up and running using Sinatra, in these projects you will use the Caesar Cipher and either the Hangman or Mastermind games you built in the Ruby course to make a couple of web apps.

### A note on deploying your apps
Deploying a Sinatra app to Heroku takes a little bit of work but the process is fairly straightforward. Instructions can be found [here](https://devcenter.heroku.com/articles/rack#sinatra).

1. Your `config.ru` file should require your main application file (This will be something like `web_guesser.rb` in the jumpstart tutorial)
2. If you are using `sinatra/reloader`, you need to remove or comment out that line before pushing to Heroku.  Alternatively you can add `if development?` to that line and Heroku will automatically know not to use it (and it will still work locally!).
3. After creating your Gemfile, you need to run `bundle install` and add/commit the files to git before pushing to Heroku via `git push heroku master`.

### Project 1: Caesar Cipher _reloaded_

Revisit the caesar cipher ruby script that you created during [Ruby Building Blocks](https://www.theodinproject.com/courses/ruby-programming/lessons/ruby-building-blocks) and use Sinatra to create a simple front-end for it.

### Your Task

<div class="lesson-content__panel" markdown="1">
1. Start a new Sinatra project (you can begin by doing a simple hello world as in the Jumpstart tutorial, just to make sure everything is set up correctly)
2. You should be able to do this with only one view, and a couple of routes, but feel free to be as fancy as you like.
3. Deploy to Heroku using the instructions at the top of this page.
</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to [the Github repo](https://github.com/TheOdinProject/curriculum/blob/master/rails_programming/sinatra/project_sinatra.md) with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* Lucas Bide's Solution [Github](https://github.com/Lucas-Bide/sinatra-portfolio) - [Live](https://cryptic-taiga-50931.herokuapp.com/)
* CodingCop's Solution [Github](https://github.com/cleve703/caesar_cipher) - [Live](https://caesar-cipher-coding-cop.herokuapp.com/)
* Run After's Solution [Github](https://github.com/run-after/sinatra_cipher) - [Live](https://murmuring-sierra-20010.herokuapp.com/)
* robo-monk's Solution [Github](https://github.com/robo-monk/frank_ceasar) - [Live](https://frank-ceasar.herokuapp.com/)
* Varras' Solution [Github](https://github.com/Varras/caesar_cipher) - [Live](https://tranquil-shelf-31549.herokuapp.com/)
* fossegrim's Solution [Live](https://sheltered-inlet-54266.herokuapp.com/)
* Nasser Abachi's Solution [Github](https://github.com/abachi/caesar_cipher) - [Live](https://shielded-island-76960.herokuapp.com/)
* BShowen's Solution [Github](https://github.com/BShowen/ruby_CaesarCipher) - [Live](https://sinatra-ruby-cipher.herokuapp.com/)
* Vedant's Solution [Github](https://github.com/vedantshetty/Odin_Project_Code/tree/master/Ruby%20On%20Rails/Sinatra/Caesar%20Cipher) - [Live](https://whispering-stream-93717.herokuapp.com/)
* Ians Solution [Github](https://github.com/IanMKesler/caesar_cipher) - [Live](https://stark-scrubland-86790.herokuapp.com)
* Chris' Solution [Github](https://github.com/CSalois114/project_caesar_cipher) - [Live](https://mysterious-badlands-40427.herokuapp.com/)
* Uzay-G's solution [Github](https://github.com/Uzay-G/simple-cipher) - [Live](https://caesar-ciphers.herokuapp.com/)
* Onur Temiz's Solution [Github](https://github.com/temizonur/ceasar_cipher) - [Heroku](https://afternoon-taiga-26969.herokuapp.com/)
* Airi Chow's Solution [Github](https://github.com/airi-14x/TheOdinProject-Sinastra-and-Basic-Rails/tree/master/sinatra/caesar_cipher) [Heroku](https://fast-crag-35094.herokuapp.com)
* Kevin Vuong's Solution [Github](https://github.com/fffear/caesar_cipher_application) - [Live](https://obscure-atoll-85647.herokuapp.com/)
* Braxton Lemmon's Solution [Github](https://github.com/braxtonlemmon/caesar_cipher_reloaded) - [Live](https://safe-shelf-68210.herokuapp.com/)
* Rudi Boshoff's Solution [Github](https://github.com/RudiBoshoff/rails-exercises/tree/master/sinatra/caesar-cipher) - [Live](https://mighty-atoll-97084.herokuapp.com/)
* Learnsometing's Solution [Github](https://github.com/learnsometing/Sinatra-Caesar_Cipher) - [Live](https://learnsometing-caesar-cipher.herokuapp.com/)
* Chris Wegscheid's Solution [GitHub](https://github.com/cwegscheid08/caesar_cipher) - [Live](https://secure-escarpment-83147.herokuapp.com)
* Smetanca52's Solution [GitHub](https://github.com/Smetanca52/sinatra_project) - [Live](https://boiling-refuge-38884.herokuapp.com/)
* Jason McKee's Solution [GitHub](https://github.com/jttmckee/sinatra-caesar-cipher) - [Live](https://limitless-wave-11721.herokuapp.com)
* Stefano Merazzi's Solution [GitHub](https://github.com/ste001/caesar-cipher-reloaded) - [Live](https://fathomless-savannah-14730.herokuapp.com/)
* prw001's Solution [Github](https://github.com/prw001/sinatra_games_suite) - [Live](https://safe-peak-15193.herokuapp.com/)
* Dennis Cope's Solution [Github](https://github.com/coped/sinatra-caesar-cipher) - [Live](https://lit-brook-15767.herokuapp.com/)
* Malaika's Solution [Github](https://github.com/malaikaMI/Sinatra_ceaser_cipher)
* Max Garber's solution [GitHub](https://github.com/bubblebooy/Sinatra_Caesar_Cipher) - [Live](https://gentle-meadow-83909.herokuapp.com/)
* Btreim's solution [GitHub](https://github.com/btreim/sinatra) [Live](https://cryptic-tundra-83691.herokuapp.com)
* Nathan Sherburne's solution [GitHub](https://github.com/nathansherburne/caesar_cypher_reloaded) - [Live](https://glacial-springs-63073.herokuapp.com/)
* Jon Yoo's solution [GitHub](https://github.com/jonyoowa/caeser-cipher-reloaded) - [Live](https://secure-oasis-76384.herokuapp.com/)
* Samuel Master's solution[Github](https://github.com/redeyetuning/sin_caeser) - [Live](https://murmuring-river-12342.herokuapp.com)
* Javier Machin's solution[Github](https://github.com/Javier-Machin/caesar_cipher_app) - [Live](https://secret-sands-76856.herokuapp.com/)
* Isil Donmez's solution[Github](https://github.com/isildonmez/Caesar-Cipher) - [Live](https://caesar-cipher-.herokuapp.com/)
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
* Slaven's solution [Github](https://github.com/Everdrought/sinatra_caesar_cypher) / [See it on the web](https://cryptic-earth-54812.herokuapp.com/)
* Alex's solution (portfolio) [Github](https://github.com/alexcorremans/sinatra_projects) / [See it on the web](https://blooming-woodland-49549.herokuapp.com/caesar_cipher)
* Leila Alderman's solution [GitHub](https://github.com/leila-alderman/caesar_cipher) / [Heroku](https://stormy-sea-24508.herokuapp.com/)
* JamCry's Solution [GitHub](https://github.com/jamcry/sinatra-caesar-cipher) - [Live on Heroku](https://jamcry-caesar-cipher.herokuapp.com/)
* vanny96's Solution [GitHub](https://github.com/vanny96/sinatra_projects) - [Heroku](https://peaceful-fjord-85935.herokuapp.com/)
* Vitaly Osipov's Solution [GitHub](https://github.com/vi7ali/caesar-sinatra) - [Heroku](https://immense-mountain-15356.herokuapp.com/)
* Alex Krewson's Solution [GitHub](https://github.com/alexkrewson/sinatra_caesar_cipher) - [Heroku](https://pure-garden-70536.herokuapp.com/)
* HSaad's Solution [GitHub](https://github.com/HSaad/caesar-cipher) - [Heroku](https://stormy-eyrie-38792.herokuapp.com/)
* Robert Dunbar's Solution [GitHub](https://github.com/RobertDunbar/sinatra/tree/master/games) - [Heroku](https://lit-refuge-73632.herokuapp.com/)
* Leo Holanda's Solution [Github](https://github.com/leo-holanda/sinatra_caesar_cipher) - [See it on the web](https://protected-dusk-87027.herokuapp.com)
* Carlos Diaz's Solution [GitHub](https://github.com/bycdiaz/caesar-cipher-reloaded) - [Heroku](https://hidden-springs-00448.herokuapp.com/)
* guacamobley's Solution [Github](https://github.com/guacamobley/caesar-cipher-webapp) - [Heroku](https://guacamobley-caesar-cipher.herokuapp.com)
* unheavenlycreature's Solution [Github](https://github.com/unheavenlycreature/caesar-cipher-webapp) - [See it on the web](https://uc-caesar-sinatra.herokuapp.com/)
* Sanyogita's Solution [Github](https://github.com/SanyogitaPandit/caesar_cipher) - [See it on the Web](https://gentle-meadow-36970.herokuapp.com/)
</details>

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
Send us your solution so we can show others! Submit a link to the [Github repo](https://github.com/TheOdinProject/curriculum/blob/master/rails_programming/sinatra/project_sinatra.md) with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* CodingCop's Solutoin [Github](https://github.com/cleve703/hangman_app) - [Live](https://hangman-coding-cop.herokuapp.com/)
* Run After's Solution [Github](https://github.com/run-after/sinatra_hangman) - [Live](https://calm-cliffs-72266.herokuapp.com/)
* Nasser Abachi's Solution [Github](https://github.com/abachi/mastermind) - [Live](https://stark-sands-24734.herokuapp.com/)
* BShowen's Solutuon [Github](https://github.com/BShowen/sinatra_mastermind_game) - [Live](https://bradley-mastermind.herokuapp.com/)
* Chris' Solution [Github](https://github.com/CSalois114/project_sinatra_mastermind) - [Live](https://sinatra-mastermind-chris.herokuapp.com/)
* Vedant's Solution: [Github](https://github.com/vedantshetty/Odin_Project_Code/tree/master/Ruby%20On%20Rails/Sinatra/mastermind) - [Live](https://cryptic-plateau-69277.herokuapp.com/)
* Ian's Solution (Mastermind) [Github](https://github.com/IanMKesler/sinatra_mastermind)
* J C Gollnick's Solution (Hangman) [GitLab](https://gitlab.com/jcgollnick/hangman) [Live](http://www.jcgollnick.vip/hangman)
* Sherman's Solution [Github](https://github.com/shermansjliu/sinatra) - [Live](https://radiant-beach-22046.herokuapp.com)
* Kevin Vuong's Solution [Github](https://github.com/fffear/sinatra_hangman) - [Live](https://immense-basin-91290.herokuapp.com/)
* Braxton Lemmon's Solution [GitHub](https://github.com/braxtonlemmon/mastermind-sinatra) - [Live](https://mighty-island-47536.herokuapp.com/)
* Learnsometing's Solution [GitHub](https://github.com/learnsometing/Sinatra-Hangman)
* Chris Wegscheid's Solution [GitHub](https://github.com/cwegscheid08/hangman) - [Live](https://peaceful-taiga-48900.herokuapp.com/?)
* Smetanca52's Solution [GitHub](https://github.com/Smetanca52) - [Live](https://radiant-earth-83625.herokuapp.com/)
* Jason McKee's Solution [GitHub](https://github.com/jttmckee/sinatra-hangman) - [Live](https://agile-coast-84094.herokuapp.com)
* prw001's Solution [GitHub](https://github.com/prw001/sinatra_games_suite) - [Live](https://safe-peak-15193.herokuapp.com/)
* Dennis Cope's Solution [GitHub](https://github.com/coped/sinatra-hangman) - [Live](https://radiant-caverns-76040.herokuapp.com/)
* Brendan Tang's solution (Hangman) [GitHub](https://github.com/brendantang/hangman-sinatra) - [Live](https://radiant-temple-25499.herokuapp.com/)
* Max Garber's solution (Hangman) [GitHub](https://github.com/bubblebooy/Sinatra_Hangman) - [Live](https://floating-atoll-54622.herokuapp.com/)
* Nathan Sherburne's solution (Hangman) [GitHub](https://github.com/nathansherburne/caesar_cypher_reloaded) - [Live](https://glacial-springs-63073.herokuapp.com/)
* Btreims's solution (Hangman) [GitHub](https://github.com/btreim/hangman_reboot) - [Live](https://protected-ocean-55660.herokuapp.com/)
* Jon Yoo's solution (Hangman) [GitHub](https://github.com/jonyoowa/hangman-sinatra) - [Live](https://rocky-sea-27959.herokuapp.com/)
* Samuel Masters's solution (Mastermind)[GitHub](https://github.com/redeyetuning/sin_mastermind)[Live](https://polar-gorge-27519.herokuapp.com/)
* Javier Machin's solution (Hangman)[GitHub](https://github.com/Javier-Machin/hangman_app)[Live](https://whispering-woodland-74608.herokuapp.com/)
* 0zra's solution (Mastermind)[GitHub](https://github.com/0zra/heroku_mastermind)
* Roman Alenskiy's solution (Hangman) [GitHub](https://github.com/romalenskiy/web_hangman) - [Heroku](https://web-hangman.herokuapp.com/)
* Isil Donmez's solution(Hangman)[GitHub](https://github.com/isildonmez/hangman_reloaded)[Live](https://hangman-reloaded.herokuapp.com/)
* Ovsjah Schweinefresser's Solution (Hangman) [GitHub](https://github.com/Ovsjah/hangman_on_web) - [Live](https://warm-inlet-77219.herokuapp.com/game)
* Lucas Bicudo's Solution (Hangman) [GitHub](https://github.com/lucbic/hangman) - [Live](https://lit-garden-60308.herokuapp.com/)
* Jmooree30's solution (Hangman) [GitHub](https://github.com/jmooree30/Sinatra_hangman.git) - [Live](https://gentle-waters-29359.herokuapp.com/)
* [Andrew's solution (Mastermind)](https://rocky-wildwood-37033.herokuapp.com/) - [Source](https://github.com/andrewr224/mastermind_reload)
* Raiko's solution (Mastermind) [GitHub](https://github.com/Cypher0/mastermind) - [Live](https://damp-brook-36728.herokuapp.com/)
* theghall's solution (Mastermind) [GitHub](https://github.com/theghall/sinatra-mastermind) - [Live](https://safe-eyrie-38662.herokuapp.com/)
* Kasey Z's solution (Mastermind) [Source Code](https://github.com/kasey-z/mastermind_reloaded) - [Live](https://frozen-falls-49194.herokuapp.com//)
* Jonathan Yiv's solution (Hangman) [Source Code](https://github.com/JonathanYiv/hangman) - [Live](https://infinite-river-55923.herokuapp.com/)
* Clayton Sweeten's solution (Hangman)[source code](https://github.com/cjsweeten101/OdinProjects/tree/master/sinatra/hangman_reloaded) - [Live](https://serene-dusk-67079.herokuapp.com/)
* justinckim3's solution [source code](https://github.com/justinckim3/sinatra-project) - [Live](https://sinatra-projects.herokuapp.com/hangman)
* Adsy430's solution [Source code](https://github.com/adampal/hangman) - [Live](https://fierce-gorge-46516.herokuapp.com/?restart=true)
* holdercp's solution [Source code](https://github.com/holdercp/hangman-sinatra) - [Live](https://thawing-cliffs-47023.herokuapp.com/)
* Nikolay Dyulgerov's solution (Hangman) [GitHub](https://github.com/NicolayD/sinatra-odin) - [See it on the web](https://sinatra-odin.herokuapp.com/)
* jfonz412's solution (hangman)[GitHub](https://github.com/jfonz412/hangman_online)
* mindovermiles262's (Mastermind) [GitHub](https://rocky-tor-31467.herokuapp.com/) - [GitHub](https://github.com/mindovermiles262/mastermind)
* Jordan Ellis-Lynch's [GitHub](https://github.com/jordy-el/sinatra_hangman) - ([Heroku](https://floating-mountain-38019.herokuapp.com/))
* ToTenMilan's solution (Mastermind) [GitHub](https://github.com/ToTenMilan/the_odin_project/tree/master/rails/sinatra/mastermind) - [See it on the web](http://mastermindbymilan.herokuapp.com)
* nmac's solution (Mastermind) [GitHub](https://github.com/nmacawile/sinatra_converted_projects) - [Heroku](https://infinite-scrubland-80707.herokuapp.com/mastermind)
* Ayushka's solution: Mastermind [GitHub](https://github.com/ayushkamadji/master_mind_sinatra) - [See it on the web](https://afternoon-escarpment-72597.herokuapp.com/)
* Orlando's solution: Hangman, Mastermind, others [GitHub](https://github.com/orlandodan14/Ruby-on-Rails/tree/master/Sinatra/web_portafolio) - [See it on the web](https://sheltered-mountain-39747.herokuapp.com/)
* yilmazgunalp's solution - Hangman: [GitHub](https://github.com/yilmazgunalp/RoR/tree/master/hangman) - [See it on the web](https://hidden-hamlet-76819.herokuapp.com/)
* leosoaivan's solution - Hangman: [GitHub](https://github.com/leosoaivan/sinatra_hangman) - [See it on the web](https://fierce-island-53975.herokuapp.com/)
* Jib's solution [GitHub](https://github.com/NuclearMachine/odin_rails/tree/master/sinatra_proj) - [see it on web](https://damp-plateau-50624.herokuapp.com/)
* codyloyd's solution - MasterMind: [GitHub](https://github.com/codyloyd/sinatra-codebreaker) - [See it on the web](https://crafty-breaker-4567.herokuapp.com/) Hangman: [GitHub](https://github.com/codyloyd/hangman) - [See it on the web](https://subtle-wording-4567.herokuapp.com/)
* Martin's sulution - MasterMind: [GitHub](https://github.com/mtsafer/MasterMind-Online) - [See it on the web](https://cryptic-caverns-91319.herokuapp.com) Hangman: [GitHub](https://github.com/mtsafer/hangman-online) - [See it on the web](https://stormy-shelf-89128.herokuapp.com)]
* Oscar Y.'s solution - Hangman: [GitHub](https://github.com/mysteryihs/hangman/) - [See it on the web](https://radiant-earth-86956.herokuapp.com/)
* chrisnorwood's solution - Hangman: [GitHub](https://github.com/chrisnorwood/wordguess-web) - [See it on the web](https://sinatra-guessing-game.herokuapp.com/)
* Jiazhi Guo's solution - Hangman: [GitHub](https://github.com/jerrykuo7727/hangman) - [See it on the web](https://hangman-by-jiazhi.herokuapp.com/)
* Diego V.'s solution - MasterMind: [GitHub](https://github.com/Dieblax/mastermind-sinatra) - [See it on the web](https://mastermindforvikings.herokuapp.com/)
* Shala Qweghen's solution - MasterMind: [GitHub](https://github.com/ShalaQweghen/another_web_game) - [See it on the web](https://warm-hamlet-61859.herokuapp.com/) Hangman: [GitHub](https://github.com/ShalaQweghen/web_game) - [See it on the web](https://evening-fortress-95446.herokuapp.com/)
* Derek Kwong's solution - Hangman: [GitHub](https://github.com/dckwong/Hangman) - [See it on the web](https://dkhangman.herokuapp.com/)
* Amrr Bakry's solution - Hangman: [GitHub](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/sinatra_hangman) - [See it on the web](https://polar-brushlands-32644.herokuapp.com/)
* csrail's solution - Hangman: [GitHub](https://github.com/csrail/hangman-sinatra) - [See it on the web](https://csrail-hangman.herokuapp.com/)
* DV's solution - Hangman: [GitHub](https://github.com/dvislearning/hangman_sinatra) - [See it on the web](https://secret-escarpment-36246.herokuapp.com/)
* Austin's solution - Hangman: [GitHub](https://github.com/CouchofTomato/hangman_sinatra) - [See it on the web](https://couch-hangman.herokuapp.com/)
* Miguel Herrera's solution - Hangman: [GitHub](https://github.com/migueloherrera/sinatra-projects) - [See it on the web](https://floating-meadow-84284.herokuapp.com/hangman)
* at0micr3d's solution - Hangman: [GitHub](https://github.com/at0micr3d/interrobang-man) - [See it on the web](https://sheltered-scrubland-38921.herokuapp.com/)
* Tom Westerhout's solution - Webguesser: [GitHub](https://github.com/Westw00d/Web-Guesser) - [See it on the web](http://shrouded-waters-66767.herokuapp.com/)
* Jerry Gao's solution - Hangman: [GitHub](https://blackwright-hangman.herokuapp.com/) - [See it on the web](https://github.com/blackwright/odin/tree/master/sinatra_hangman)
* Sophia Wu's solution - Hangman: [GitHub](https://github.com/SophiaLWu/sinatra-hangman) - [See it on the web](https://shielded-lowlands-85300.herokuapp.com/)
* Samuel Langenfeld's solution - Hangman: [GitHub](https://github.com/SamuelLangenfeld/sinatra_hangman) - [See it on the web](http://langenfeld-hangman.herokuapp.com/)
* Kyle Thomson's solution - Hangman: [GitHub](https://github.com/idynkydnk/portfolio_heroku) - [See it on the web](https://portfolio-heroku-kyle.herokuapp.com/hangman)
* Jonathan Marks's solution - MasterMind: [GitHub](https://github.com/johnjmarks4/mastermind_reloaded) - [See it on the web](https://arcane-shelf-92558.herokuapp.com/)
* Luján Fernaud's solution [GitHub](https://github.com/lujanfernaud/sinatra-countries-hangman) - [See it on the web](https://sinatra-countries-hangman.herokuapp.com/)
* Pat's solution - Mastermind: [GitHub](https://github.com/Pat878/Sinatra_Mastermind) - [See it on the web](https://sleepy-island-52915.herokuapp.com/)
* Austin Norman's solution - Hangman: [GitHub](https://github.com/austinnormancore/hangmansinatra) - [See it on the web](https://secure-ridge-15084.herokuapp.com/)
* Anistor86's solution - Hangman: [GitHub](https://github.com/anistor86/sinatra_hangman) - [See it on the web](https://safe-escarpment-98953.herokuapp.com/)
* Francisco's Carlos solution - [GitHub](https://github.com/fcarlosdev/the_odin_project/tree/master/sinatra_project)
* Oliver Curting's solution - Mastermind: [GitHub](https://github.com/Curting/sinatra_mastermind) - [See it on the web](https://sinatra-mastermind.herokuapp.com/)
* Jeff Jubin's solution - Mastermind: [GitHub](https://github.com/jeff1st/sinatra_games) - [See it on the web](https://quiet-beach-81520.herokuapp.com/)
* Punnadittr's solution - Hangman: [GitHub](https://github.com/punnadittr/sinatra_hangman) - [See it on the web](https://protected-falls-18287.herokuapp.com/)
* Agon's solution - Hangman: [GitHub](https://github.com/AgonIdrizi/Hangman_Sinatra) - [See it on the web](https://cryptic-earth-30619.herokuapp.com/)
* Jamesredux's solution - Hangman: [GitHub](https://github.com/Jamesredux/sinatra_portfolio) - [See it on the web](https://jredux-sinatra.herokuapp.com/)
* Calstream's solution - Hangman: [GitHub](https://github.com/Calstream/hangman-sinatra) - [Play here](https://hanged-man.herokuapp.com/)
* Malaika's Solution For Hangman: [GitHub](https://github.com/malaikaMI/Hangman_with_sinatra)
* AlexFuro's Solution (Hangman): [GitHub](https://github.com/alexfuro/TOP_hangman) - [Live Demo](https://furohangman.herokuapp.com/)
* ParamagicDev's Solution (Mastermind): [GitHub](https://github.com/ParamagicDev/sinatra_mind) - [See it on the web](https://immense-mesa-98857.herokuapp.com)
* bchalman's Solution (Hangman): [GitHub](https://github.com/bchalman/sinatra_hangman) - [Live](https://fierce-plains-57125.herokuapp.com/)
* Tommy's Solution (Hogwarts Hangman): [GitHub](https://github.com/hoangtommy/sinatra_hangman) - [Live](https://powerful-wildwood-91516.herokuapp.com/)
* BrianEspo's Solution (Hangman): [GitHub](https://github.com/bribrah/Sinatra-Projects/tree/master/hangman_site) - [Live Demo](https://brianshangman.herokuapp.com/)
* Alex's solution (Hangman, portfolio) [GitHub](https://github.com/alexcorremans/sinatra_projects) - [See it on the web](https://blooming-woodland-49549.herokuapp.com/)
* Leila Alderman's solution (Hipster Hangman) [GitHub](https://github.com/leila-alderman/hipster_hangman) - [Heroku](https://stark-brook-74152.herokuapp.com/)
* vanny96's Solution [GitHub](https://github.com/vanny96/sinatra_projects) - [Heroku](https://peaceful-fjord-85935.herokuapp.com/)
* jeanmerlet's solution (Full Color Webstermind) [GitHub](https://github.com/jeanmerlet/sinatra/tree/master/webstermind) - [Heroku](https://ruby-mastermindgame.herokuapp.com)
* Vitaly Osipov's solution Hangman [GitHub](https://github.com/vi7ali/hangman) - [Heroku](https://protected-temple-67525.herokuapp.com)
* Alex Krewson's Solution [GitHub](https://github.com/alexkrewson/sinatra_hangman) - [Heroku](https://damp-meadow-16569.herokuapp.com/)
* Leo Holanda's Solution [Github](https://github.com/leo-holanda/sinatra_mastermind) - [See it on the web](https://hidden-dawn-45108.herokuapp.com/)
* Robert Dunbar's Solution [GitHub](https://github.com/RobertDunbar/sinatra/tree/master/games) - [Heroku](https://lit-refuge-73632.herokuapp.com/)
* Joe Lee Hangman's Solution [GitHub](https://github.com/JoeDravarol/sinatra_hangman) - [Heroku](https://blooming-crag-69548.herokuapp.com/)
* guacamobley's Solution [Github](https://github.com/guacamobley/sinatra_mastermind) - [Heroku](https://guacamobley-sinatra-mastermind.herokuapp.com)
* unheavenlycreature's Solution (Mastermind) - [Github](https://github.com/unheavenlycreature/sinatra-mastermind) - [Heroku](https://uc-mastermind.herokuapp.com)
* Sanyogita's Solution (Mastermind) - [Github](https://github.com/SanyogitaPandit/ruby_on_rails/tree/master/sinatra/mastermind)
</details>
