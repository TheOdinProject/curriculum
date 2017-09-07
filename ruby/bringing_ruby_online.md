You know how to write scripts and games using Ruby but so far that's all confined within the boundaries of your local system.  In this section, you'll learn how to break free and start mucking around on the Internet.

You (should have) learned about how the web works in the [How Does The Web Work](/web-development-101/how-does-the-web-work) lesson from the [Web Development 101](/web-development-101) course, but it might be worth heading back for a refresher if you've got any lingering questions.  You'll be working with HTTP requests and responses quite a bit in this section so it's important to at least understand what's going on there.  

Ruby (or a gem that you've downloaded) will give you the power to send HTTP requests, whether GET or POST or PUT or DELETE, and then wait for a response.  You'll find yourself needing to take apart that response to get to the good stuff, whether that's the HTML of a web page you're trying to scrape or a JSON object returned by some website's API that you've queried.  Every gem has a slightly different way of doing it, but the principles remain the same.  On the flip side, Ruby gives you the tools to listen for requests and deliver responses... as a web server yourself!

We're learning this stuff for two reasons.  First, it's important to understand the underlying fundamentals of how web requests and responses work if you want to actually build web pages.  Ruby on Rails will take care of lots of this nitty gritty stuff for you if that's your goal, but having worked with your bare hands before will give you a giant leg up when using it and it doesn't take long to figure out.  Second, there's a big world outside of Rails, and you should have the tools to build some nifty Ruby programs that can play around on the web.  Because it's a whole lot more fun!

This lesson won't be nearly as long as the previous few, and should have you building stuff pretty early on.  Actually, the project section is really where you'll be spending all your time.  Let the spamming begin.

### Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* How do you issue an HTTP request in Ruby?
* How do you parse the response to get to the body content?
* What is REST?
* What's the difference between a GET and a POST request? (seem familiar?)

### Your Assignment

1. Go into your terminal and type `$ curl http://www.google.com` and observe the massive chunk of text that gets returned.  That's Google's homepage and should give you an idea of some of the responses you can get from these types of requests.
1. Read [Beginning Ruby](https://www.amazon.co.uk/Beginning-Ruby-Professional-Peter-Cooper/dp/1484212797) Chapter 14, pages 413-432 for a look at taking on the Internet with Ruby.  It dives into the guts of things pretty quickly, so breathe deep and forge on...
2. Read this extremely simple [REST tutorial in Ruby](http://rest.elkstein.org/2008/02/using-rest-in-ruby.html), which is basically just to show you how dead simple it is to issue HTTP requests using Ruby and then grab the response.
3. Read this [explanation of how HTTP works](http://www.jmarshall.com/easy/http/#whatis) down through where it talks about the POST method (about halfway down).  You can stop before the HTTP Proxies section.

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* *Add some of your own!*
