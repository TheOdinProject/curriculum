### Introduction

The three languages of the front end are fairly standardized -- HTML for Markup, CSS for Presentation, and Javascript for Scripting.  The back end is a different story... you can run pretty much anything you want to on your server since it doesn't rely on your user's browser understanding what's going on.  All the browser cares about is whether you've sent it properly formatted HTML, CSS and Javascript files (and other assets like images).  That's led to a whole lot of different choices for back-end languages.  As long as it can take in an HTTP request and spit out some HTML, you can probably put it on a server somehow.

That said, some languages are more popular and practical than others.  If you're running your own server, you have a ton of flexibility but plenty of headaches.  If you're deploying to the cloud (which we will be doing later), you may be restricted to those languages which your cloud provider has installed on their platform... it doesn't do you much good if the servers you're "borrowing" from can't understand your code!  

Some of the most popular server-side languages are PHP, ASP.NET, Ruby, Python and Java (not to be confused with Javascript).  And just like I can say "which way to the nearest pub?" in Swedish, French, Italian, English and Bad English, all of those languages can perform almost exactly the same functions, just using different syntaxes.

As we covered back in the [Installations section](https://www.theodinproject.com/courses/web-development-101/lessons/installation-overview), the front end languages live in the browser so there's no extra installations required.  For the reasons listed above, the back end languages do require you to install them on your computer in order to get them running.  This should have already been done in that project, so we'll just make sure that you have them properly installed.

### Learning Outcomes

* What the difference between front- and back-end development is
* Why you need to install Ruby but not Javascript

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Check out [this blog post on back end vs front end programming](http://blog.teamtreehouse.com/i-dont-speak-your-language-frontend-vs-backend) for a quick refresher on the difference between the two.
  2. Read over [this quick interview with Matt Jording](https://generalassemb.ly/blog/what-is-back-end-web-development/) about what back end web development is.
  3. Type `$ ruby -v` and `$ rails -v` into your command line (remember, the `$` just represents the command prompt).  You should get back versions similar to `2.0.0` or above and `5.0.0` or above. If you didn't get those values, you'll need to go back to the [Installations Unit](https://www.theodinproject.com/courses/web-development-101/lessons/your-first-rails-application) and get everything installed properly.  
  4. You should also be able to use `$ which git` and see the directory where you installed Git.

</div>
