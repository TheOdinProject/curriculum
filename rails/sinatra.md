One of the biggest frustrations beginners have with learning Rails is getting their head around all the 'magic' that Rails seems to do.

The power of Rails is how quickly you can develop complex apps, this speed comes from all the things Rails does for you in the background. Rails does a lot of complex things in the background that are hidden with abstractions. This is where the perceived 'magic' happens.

Sinatra is a small light weight web framework written in Ruby. It allows you to make small web applications quickly. Like Rails, Sinatra is built upon [Rack](http://rack.github.io/) so you can think of it as a bare bones version of Rails. There is no 'magic' to speak of as everything is very explicit. This is why learning Sinatra before learning Rails is so beneficial. It reduces the learning curve of learning Rails quite a lot.

Sinatra does a few of the same things that Rails does, but it doesn't create the file-structure for you.  The benefit of doing it yourself (and the main reason we're learning this at all) is that once you get a feel for how to set up routes and organize your views in Sinatra, the complex file structures and methods in Rails will start to make a whole lot more sense.

There isn't a whole lot to Sinatra so you can learn it pretty quickly, but as you will see you can build very impressive apps with it.

### Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*

* What are routes?
* What are views?
* what are _sessions_ in Sinatra, and how do you use them?

### Your Assignment

1. Go to the [Sinatra website](http://www.sinatrarb.com/) and follow the (somewhat cryptic) instructions right on their front page:
	1. create a file called `hi.rb` with the following code:

    ```ruby
        require 'sinatra'

        get '/hi' do
            "Hello World!"
        end
    ```
    2. from the command line install the Sinatra gem by typing `gem install sinatra` then run the file you created: `ruby hi.rb`
    3. visit the page in your browser at `http://localhost:4567/hi`
    4. (easy wasn't it?)
2. Work through this [tutorial](http://tutorials.jumpstartlab.com/projects/web_guesser.html) from Jumpstart Labs. Be sure to try out some of the Extensions at the end of the tutorial, that's the fun stuff!
3. Take a look at the [Sinatra README](http://www.sinatrarb.com/intro.html) and read through the first eight sections of it ( until section 8, "Helpers").Almost everything you will need to know about Sinatra is right here on this page so use it as a reference when you are working through the project.


### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Jump Start Sinatra](https://www.sitepoint.com/store/jump-start-sinatra/) is a really great and pretty thorough look at Sinatra, but it's not free.  A good resource if you're really interested.
* [Sinatra Walkthrough from General Assemby](https://github.com/ga-wdi-lessons/sinatra-walkthrough) A tutorial for building an online database of fish called "Finatra". Includes three screencasts and is a bit easier to digest than the Sinatra README.  
* *Add some of your own!*
