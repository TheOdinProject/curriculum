# Projects: Sinatra

*Don't forget to use Git to save your projects!*

You've seen how simple it can be to get something up and running using Sinatra, in these projects you will use the Casear Cipher and either the Hangman or Mastermind games you built in the Ruby course to make a couple of web apps.

### A note on deploying your apps
Deploying a Sinatra app to Heroku takes a little bit of work but the process is fairly straightforward. Instructions can be found [here](https://devcenter.heroku.com/articles/rack#sinatra)

1. your `config.ru` file should require your main application file (This will be something like `web_guesser.rb` in the jumpstart tutorial)
2. if you are using `sinatra/reloader`, you need to remove or comment out that line before pushing to Heroku.  Alternatively you can add `if development?` to that line and Heroku will automatically know not to use it (and it will still work locally!).
3. after creating your Gemfile, you need to run `bundle install` and add/commit the files to git before pushing to Heroku.

## Project 1: Ceasar Cipher _reloaded_

Revisit the ceasar cipher ruby script that you created during [Ruby Building Blocks](http://www.theodinproject.com/ruby-programming/building-blocks) and use Sinatra to create a simple front-end for it.

### Your Task

1. Start a new sinatra project (you can begin by doing a simple hello world as in the Jumpstart tutorial, just to make sure everything is set up correctly)
2. You should be able to do this with only one view, and a couple of routes, but feel free to be as fancy as you like.
3. [Deploy to Heroku!](https://devcenter.heroku.com/articles/rack#sinatra)

## Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* codyloyd's solution [github](https://github.com/codyloyd/sinatra-translator) / [see it on the web](https://cryptic-reaches-55962.herokuapp.com/)

## Project 2: Another Web-Game

Pick either Mastermind or Hangman and build a front end for it.  This one might take a little more work, but it should be well within your grasp at this point.  Have fun!

### Your Task

1. The UI-implementation is up to you this time.  Keeping them text-based is acceptable, but now that we're on the web you can branch out with images to make something a little nicer.
2. You'll probably want to go over the use of "sessions" within Sinatra again.  Check the [README](http://www.sinatrarb.com/intro.html#Using%20Sessions).  
3. Have fun!  Don't forget to make all of your friends play your game!
4. _Extra Credit_ The free Heroku account only allows a limited number of projects, unless you add a credit card to your account (they wont charge you, its just for identity confirmation). If you _do_ add your information, you can have unlimited projects, but they still limit how many of them can be "awake" at one time. You might consider using sinatra to make yourself a simple web-portfolio so that you can store all of these apps in one project.

## Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* codyloyd's solution - MasterMind: [github](https://github.com/codyloyd/sinatra-codebreaker) / [see it on the web](https://crafty-breaker-4567.herokuapp.com/) Hangman: [github](https://github.com/codyloyd/hangman) / [see it on the web](https://subtle-wording-4567.herokuapp.com/) 
