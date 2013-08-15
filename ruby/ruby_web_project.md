# Pair Project: Ruby on the Web

*[Return to Ruby](ruby.md)*

## Warmup: Twitter Spambot

You've briefly learned about how to use Ruby to send requests to the web and parse responses.  When you're building real web applications, you'll often want to interface with other applications over the web via their API.  

If you're not familiar with APIs, now's your chance.  In this case, Twitter gives you access to a bunch of their commonly used commands (like sending a tweet, accessing your followers, etc) but via your program instead of having to click buttons on their site.  Hence why it's called the Application Programming Interface... your application can programmatically access their system!  

When companies make their APIs public, they usually want to limit the amount of spam and abuse so they make you authenticate yourself with each request.  You usually have to register your application with them and they give you a key to use to authenticate your requests.  Sometimes it's as simple as just including that key in the URL string when you make a request, but often these days they want a less hard-coded and more secure way of authenticating you.  

The protocol that's commonly used for this is called OAuth.  In this case Twitter uses OAuth, but you'd have to use the same protocol (though perhaps a different version; there are two major versions) if you wanted to interface with Facebook, Instagram, Tumblr, etc. so it's worth getting some experience working with it.  It's not always immediately intuitive but just remember that the basic idea is to make sure the request is coming from someone they have authorized.  If you set up your SSH keys to interface with Github back during the installation phase, it's not terribly different from that idea.

Note that, for this project, you may want to create a throwaway Twitter account (mine is @SpamBot26103678) because you'll probably accidentally go over their data limits or rate limits or other anti-spamming mechanisms and will send out a lot of testing tweets along the way.  No sense getting your main account banned for playing around.

### Your Task

1. [This project/tutorial from Jumpstart Lab](http://tutorials.jumpstartlab.com/projects/microblogger.html) takes you through how to authenticate with Twitter and start tweeting.  Don't worry about the last part on Klout.


## Project: Server / Client

Part of the reason for getting into how Ruby interacts with the web is because it's directly relevant to what you'll be doing later on with Rails.  Rails is just Ruby code neatly packaged and highly opinionated.  Anything Rails does, you can reproduce on your own (given the time) with some Ruby knowledge.

In this case, you'll be building a simple web server that receives requests and sends a response based on those requests.  You'll also create a simple client to issue those requests -- then they can talk to each other!  After this project, the web should feel a lot less magical and mysterious for you, just full of interesting challenges.

### Your Task



1. Build the server
2. Build the client


**Student Solutions**

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* *Your Solution Here!*
* 


*How long did these projects take you?  [Let us know!](mailto:curriculum@theodinproject.com)*




