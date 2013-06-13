# Web Development Basics

## Intro

Now that you know what web developers do, it's time to start thinking about how they actually do it.  In this unit, we'll learn about how the Web works and start thinking about the basics of computer and web programming.  

Each of the following sections represents essential baseline knowledge.  Even if you have no intention of becoming a web developer yourself, this material should help you gain a useful understanding of the moving parts involved in creating and serving content on the web.  By the end of this unit, you should not only understand how the web works, but be able to identify and differentiate each of the technologies that you will be learning in order to build web applications of your own.

We will cover a very broad swathe of knowledge here and that's intentional... it's silly to go diving straight into server-side programming without having a context for what it is and why it's useful (and why you should learn it!).  Each section will contain questions that you'd better be able to answer before moving on.  For the first time, some of the sections below will ask you to do exercises to help build your understanding.  Give it a shot!

## How Does the Web Work?

#####You will need to understand:
* What is the internet?
* How is information broken down and sent?
* What are packets?
* What is a "client"?
* What is a "server"?
* What is HTTP and how does an HTTP request work?
* What are DNS servers?
* What is HTML and how is it used?
* What is CSS and how is it used?
* What's the difference between static and dynamic web pages?
* What happens when you click "search" on google.com?


Check out [How Does the Internet Work? (video)](http://www.youtube.com/watch?v=oj7A2YDgIWE) for a basic explanation of how packets work.

Harvard's David Malan explains internet basics starting at 52:15 in [this lecture](http://cs50.tv/2012/fall/lectures/7/week7m-720p.mp4) from their popular Intro to Computer Programming course.  Pay attention to opening the developer tools he talks about around minute 58... you'll use that a lot.  We'll get heavily into HTML later in this curriculum.

He dives further into HTTP in a [short 3-minute video (video)](http://cs50.tv/2012/fall/shorts/http/http-720p.mp4).

For a more detailed (though dated) text explanation, [check out this link](http://www.garshol.priv.no/download/text/http-tut.html).

What's the best explanation of how the web works you've seen or read?  Were any other resources you found to helpful for answering the questions posed at the beginning of this section? [Let us know!](mailto:curriculum@theodinproject.com)

#### Additional Resources:
* [A packet's journey (video)](http://www.youtube.com/watch?v=WwyJGzZmBe8).
* An [entertaining TED talk](http://www.ted.com/talks/jonathan_zittrain_the_web_is_a_random_act_of_kindness.html) about how the Internet works.
* How the web works... [a cartoon](http://landofthefreeish.com/pics/how-the-internet-works/).
* Udacity has a quick explanation of [web basics](https://www.udacity.com/course/viewer#!/c-cs253/l-48737165/e-48230539/m-48742046) and [HTML basics](https://www.udacity.com/course/viewer#!/c-cs253/l-48737165/m-48724340) (these will require login/signup but it's free).
* A comprehensive list of web development resources lives at the [Web Standards Curriculum](http://www.w3.org/wiki/Web_Standards_Curriculum).


## Step Back... How Does Your Computer Work?

This isn't a course about rebuilding your hard drive but it is useful for you to understand the high level overview of what's going on to make your computer function.  That's partly because you'll see the same patterns showing up when you're telling servers what to do and partly because you're going to have to talk to your computer in a way that it understands anyway so you'd better speak a little of its language.

Spare 15 minutes to [learn how computers work](http://www.youtube.com/watch?v=WIDzNyfVVg0).

### The Command Line

Raise your hand if you're scared of the command line.  Yes, we have this image of developers staring at a black screen with white or green text flashing across while they wildly enter incomprehensible commands and hack into the corporate mainframe (spilling soda and wiping cheetos off their keyboard no doubt as well).  

That black screen (or window) is the command line, where you're able to enter commands that your computer will run for you.  And while that image of a programmer is a bit overdone, the command line really is sort of like our base of operations, from which we'll launch other programs to do our "real developing" in.  It has a syntax of its own which is different but not all that difficult to pick up.  You'll be entering the same commands dozens of times anyway, so you'll get pretty good at it in a short period of time.

To gain a better understanding of your command line, take this [Command Line Crash Course](http://cli.learncodethehardway.org/book/) by Zed Shaw.

## Terms to Know

Take a look at this [list of term definitions](http://prework.flatironschool.com/#terms) and make sure you have at least a competant understanding of each one (click on it to bring up the full and straighforward definition).

## Programming Basics

Many of the things we're about to cover will be handled in much greater depth later on in the curriculum but it's important to get a high level understanding of what they are and how they're used so you can still see the bigger picture while you're down in the weeds learning that stuff.

### Front End Languages

The "front end languages" live in the browser.  After you type in an address in the address bar at the top and hit Enter, your browser will likely receive at least an HTML file, a CSS file, and a Javascript file from the web server.  Each of these languages does a separate but very important function and they work harmoniously together to determine what the web page IS, how it LOOKS, and how it FUNCTIONS.  And keep in mind that your BROWSER handles how to make these files into a webpage.

#### HTML and CSS

##### Questions:
* Why do we separate HTML and CSS?
* What are classes and IDs (and how are they different)?
* What are elements?
* What are tags?
* What are attributes?
* What are selectors?
* What are properties?
* What are values?

As you've hopefully [learned before](http://www.skillcrush.com/terms/html.html), HTML is the markup that contains all the actual stuff that a web page has.  All the text on this page lives inside HTML tags that tell your browser how to order the content on the page.  [CSS](http://www.skillcrush.com/terms/css.html) tells the browser if you want to display any of those tags a particular way like, for instance, turning its background blue and pushing it a little to the left.

Watch all the [free HTML videos](http://teamtreehouse.com/library/websites/html/introduction) from Treehouse and take the quiz. 

Check out the [quickie CSS introduction](http://teamtreehouse.com/library/websites/build-a-simple-website/website-basics/introduction-to-css) from the same people as well.

Read through [Shay Howe's HTML&CSS Tutorial (Lesson 1 only)](http://learn.shayhowe.com/html-css/terminology-syntax-intro) and focus on being able to answer the questions above.


#### Javascript

##### Questions:
* 



### Back End Tools

### Database Tools

### FTP

### SSL

## How Are Websites Built?
>> BECOMING section instead?

### Macro Level: From Client to Developer and Back

### Micro Level: What You Do as the Developer

## Other "Dumb" Questions Answered

Do you still have any beginner questions left over? [Email us](mailto:curriculum@theodinproject.com) or [fork](https://help.github.com/articles/fork-a-repo), add it here, then [submit a pull request](https://help.github.com/articles/using-pull-requests).

## Finish

Now you've gotten your feet wet and I hope you're getting curious to dig deeper.  You should be fairly comfortable typing commands into your computer's command line and you should understand what happens when you enter a web address into your browser and it returns a functioning page.  

## Additional Resources