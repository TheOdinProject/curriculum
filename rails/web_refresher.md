# Web Refresher and More

## Introduction

To really understand how Rails works, you need to have a solid base in the guts of the web.  You've already covered some of this in previous sections (and if you went through the Ruby curriculum you can just skim it), but this time you'll get a chance (in the project) to reach out and make some real web requests.

## HTTP

HTTP is just a way of structuring the request-and-response conversation between your browser and the server.  Actually, it's not even a conversation since it is stateless... it's more of an "ask and receive".  The protocol outlines how that brief piece of dialogue should occur.

*Check out [this tutsplus post on HTTP](http://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177) which describes what's going on with HTTP.  Check out [http://testuri.org/sniffer](http://testuri.org/sniffer) and try retrieving a couple of websites (like http://www.theodinproject.com) on your own.*

One key component to pay attention to is the fact that the request and response both have header and (usually) body components.  The header contains information about the request or response itself (meta data), including which website to send or return to and what the status of the response is.  The body of the request can contain things like data submitted by a form or cookies or authentication tokens while the response will usually contain the HTML page you're trying to access.

The other key component is that each request uses one of four main "verbs" -- GET, POST, PUT, and DELETE.  These days, you almost only see GET and POST requests (even if you're trying to do a delete of something they usually fake it using a POST request), but it's important to understand the difference between the verbs.

## REST

REST is a term that you'll see coming up again and again because it's a very powerful idea.  It basically says that there are really only 7 different types of things that you usually want to do to an individual resource via the web and you can do them by mixing and matching the HTTP verbs we just covered.  A "resource" usually means a "thing" in your database or a data model.  In this case, we'll assume that resource is a blog Post model that you've set up:

1. GET all the posts (aka **"index"** the posts)
2. GET just one specific post (aka **"show"** that post)
3. GET the page that lets you create a new post (aka view the **"new"** post page)
5. POST the data you just filled out for a new post back to the server so it can create that post (aka **"create"** the post)
4. GET the page that lets you edit an existing post (aka view the **"edit"** post page)
5. PUT (or PATCH) the data you just filled out for editing the post back to the server so it can actually perform the update (aka **"update"** the post)
6. DELETE one specific post by sending a delete request to the server (aka **"delete"** the post)

*The highlighted words correspond to standard Rails controller actions!*

Why is this important?  Because it gives you a very organized way of thinking about your resources.  This is the way to model your requests and should be the ONLY way that those requests are done (e.g. you shouldn't be actually submitting the data for editing a post using a GET request... that should be a POST) If you have a hard time thinking of how those seven scenarios (or at least a subset of them) would apply to a resource you want to create in your database, you may need to rethink how your data is being set up.  

It's also important because Rails is structured to follow these conventions in a very straightforward way.  As long as you're performing those actions, life is very easy for you and the request that you get from the browser can be easily routed through Rails' guts.  

It may seem simplistic to you up front to think of things this way, but once you've got a bit of complexity in your data model, you'll find that falling back on RESTful thinking can help untangle things for you.

## URLs

You may think you know what's in a URL, but which part is the host? protocol (aka scheme)? parameters? path?

*Check out [this article by Matt Cutts](http://www.mattcutts.com/blog/seo-glossary-url-definitions/) on how Googlers pick apart URL components.*

**Quick Quiz:**
The URL is: https://www.google.com/search?q=what+is+a+url

1. What is the "Path"?
2. What is the "Parameter" portion?
3. What is the "Top Level Domain"?
4. What is the "Protocol"?

Once you understand what these components are, you can easily use Ruby's libraries to help you build your own and send requests.  You also run into specific pieces like the "path" and "parameters" again and again when using Rails.

*Answers: 1. /search 2. q=what+is+a+url 3. com 4. https*

## MVC

You've heard about it again and again, but do you really know what MVC is?  Errrrmmmmm, ummm.... 

MVC is all about organization and Rails is all about MVC.  When you build a new Rails project, you get that giant mass of folders and files created.  Though it seems like there are an overwhelming number of files inside your `app` directory, they are highly organized and specifically meant to separate the Model, View, and Controller.

The point of MVC is that the functions of a web application can be broken down into more or less distinct parts.  Each part gets its own Ruby class.  That's great for you the developer because, when you want to tweak a specific part of the code base or fix a bug, you know exactly which file to modify and where it is.

### The Path Through MVC

Once a request from a browser comes into your application, at the most basic level:

1. The router figures out which controller to send it to (e.g. for your blog, the Posts controller).  
2. That controller asks the model (e.g. Post model) for data and any other tough questions it has.  
3. Then that controller passes off whatever data it needs to the views (e.g. `index.html.erb`), which are basically just HTML templates that are waiting for those variables.
4. Once the proper view has been pumped full of the data it needs (like the current user's name), it gets sent back to the client that made the original request.  Presto!

*Check out a more detailed version of MVC on [betterexplained.com HERE](http://betterexplained.com/articles/intermediate-rails-understanding-models-views-and-controllers/)*

To characterize the three (badly), the model is the supersmart geek in the back room, the controller is the social middleman that talks to everyone but doesn't really do anything too intensive (it asks the model in those cases), and the view just looks pretty and waits to get its outfit from the controller.

Just roll with it, you'll see it in action and learn to love it.

## APIs

When your computer or a server (which you're programming) wants to make a request to another website, it doesn't bother clicking on things in the browser, it asks that other website for data directly by using that website's API.  An API is just an interface.  Our web browser goes in the front door to display a bunch of info from facebook, and our web server goes in the side door for the same data (much faster and more direct) via the API.  

So you want to get data from Google Maps to display on your webpage?  You hit its API using the rules specified in its API documentation.  Just about every big website makes some portion of its data available via an API and you can too quite easily using Rails.  

*See this explanation (just the first page) on [What APIs are](http://money.howstuffworks.com/business-communications/how-to-leverage-an-api-for-conferencing1.htm) from howstuffworks*

Not all APIs are web-based.  Plenty of them use the same HTTP format but are really just designed to pass data between services.  In fact, that's how the components of Rails are all strung together -- they use HTTP to communicate with each other.  

You'll actually get a chance to build your own API a little later on, and Rails makes it really easy for you.  There's nothing magical about it -- you just tell your controller that you want to respond to requests made by other servers instead of (or in addition to) normal web requests and then specify what exactly you'd like returned (since it probably won't be an HTML view).

But we get ahead of ourselves a bit here... the main point is that you'll see "API" come up plenty of times and it's totally harmless and just means the way that two applications talk to each other.

## Cookies

You've heard about cookies.  Cookies are basically a way for websites to remember who you are from one request to another.  Remember -- every HTTP request is totally independent of each other one.  Meaning that when you go to the Home page of a website and then click on a link to their About page, the web server treats you as a completely new user.  

...Unless they've given you some cookies (which they almost certainly have).  Cookies are little bits of data that your browser sends to the website every time you make a request to it.  From the perspective of the web server, it lets the server identify you as the same person who made any of a series of previous requests.  It preseves the *state* of your session.

*Check out [allaboutcookies.org](http://www.allaboutcookies.org/) and read the first three sections for some more info about cookies.*

*The [Wikipedia article on cookies](http://en.wikipedia.org/wiki/HTTP_cookie) may also be helpful reading.*

Go to a website you normally frequent, open up your developer tools, and find the cookies.  In Chrome, it's by clicking on "Resources" then "cookies".  You'll see them as name-value pairs.  Often there will be something like a "user_session" or "token" variable that is some unintelligible string of characters.  


## Sessions

Cookies are important because they enable you to have a single continuous "session" while you're interacting with a website. It means you only have to log in once instead of for every single request (which you probably experienced from a broken website at some point in the late 90's).

Your browser includes all the cookies that a particular website has set along with its normal request and the server uses those strings to figure out which user you are and whether you are logged in, what your settings are (like if you've set up viewing preferences) and things like that.  It's also why, when you clear cookies from your browser history, everything seems to get wiped out and go back to the default.  

It's also how some ads seem to follow you from one website to another -- another name for them is "tracking cookies".



## Authentication

On the server side, you'll interact with cookies and session variables quite a bit.  As mentioned above, one of the main uses of these is to determine who the user is, or "authentication".  You'll basically retrieve the cookie that the user sends you, use it to find that user in your database, and (if the user exists) then you can display the customized web page for that user.

It's pretty straightforward in theory, but some of the security implications get a bit hairy so luckily the nice folks at [Platformatec](http://plataformatec.com.br/) created a very handy gem called ["Devise"](https://github.com/plataformatec/devise) which takes care of all this stuff for you.  In this curriculum (a bit later on), you'll be creating your own authentication system before learning how to use Devise to take care of the heavy lifting.

## Authorization

Authorization is the partner concept to Authentication... Authentication lets you determine WHO the user is, but the idea behind authorization is that you might limit what the person can see based on their permission level.  The most common case of this is actually the distinction between a random not-logged-in user and one who is logged in.  Another common case of this is the difference between regular users of a website and the admin users who have special privileges.  

On the server side, you will end up writing (or using) methods which restrict access to certain types of actions based on who the current user is (or whether the requester is logged in at all).  Again, Devise will help you with this by providing some of these helper methods (like for checking whether any user is logged in or who the current user is) for you.

## Conclusion

We'll dig into this stuff a bit later, but it's good to understand in the context of what we talked about before in regards to how requests are made because it brings a couple of extra layers onto these formerly-independent HTTP requests.  Authentication systems allow you to establish sessions which preserve the user's state (like logged in status) across requests and helps you determine whether the user is authorized to do a particular thing.  

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* [HTTP explained by Harvard's David Malan](http://www.youtube.com/watch?v=8KuO4r5CHjM)
* [HTTP Request/Response Basics](http://justahelp.blogspot.com/2013/09/http-requestresponse-basics.html) from Pralay Roy
