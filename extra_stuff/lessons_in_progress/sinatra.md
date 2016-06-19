# Sinatra

<!-- *Estimated Time: no-one knows! -->

Now that you have a handle on how Ruby can connect to the web through HTTP we are going to take a look at [Sinatra](http://www.sinatrarb.com/), an extension of Ruby for quickly creating web applications with minimal effort.  Basically, it does for you the types of things you were doing in the last lesson making process of using Ruby on the web quicker and easier.

There really isn't a whole lot new to learn here, but the power it gives you is substantial.  Sinatra does a few of the same things that Rails does, but it doesn't create the file-structure for you.  The benefit of doing it yourself (and the main reason we're learning this at all) is that once you get a feel for how to set up routes and organize your views in Sinatra, the complex file structures and methods in Rails will start to make a whole lot more sense.

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* What is a DSL? How is that different from a framework? (Sinatra is a DSL, Rails is a framework)
* What are routes?
* What is ERB (you should _probably_ already know this)
* what are _sessions_ in Sinatra, and how do you use them?

## Your Assignment

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
2. Take a look at the [Sinatra README](http://www.sinatrarb.com/intro.html) and read through the first few sections of it (at least read until section 6, "Views/Templates").  A lot of this stuff will be pretty familiar too you, though the syntax is probably new.  Almost everything you will need to know is right here on this page.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Jump Start Sinatra](https://www.sitepoint.com/store/jump-start-sinatra/) is a really great and pretty thorough look at Sinatra, but it's not free.  A good resource if you're really interested.
* *Add some of your own!*