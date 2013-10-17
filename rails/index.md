# Ruby on Rails

## Note: This part of the curriculum is still under construction!

See [Rails Resources](/curriculum/rails/resources.md) for a listing of resources you can tackle right away.

## Introduction

Welcome to Rails! Maybe you've skipped right here because you just want to start building websites or maybe you made it through the Ruby portion of the curriculum and have a great base to work from.  Either way, we're about to have some fun.

You should already have a good idea of what Rails is all about after covering it in previous sections (see Prerequisites below for links).  At this point, it's time to take that theoretical knowledge and start building websites.  This portion of the curriculum will be the most build-heavy so far.  You will still be asked to read docs, check out blog posts, and watch videos before building, of course, but projects will be the major focus.

After each section, you'll be asked to build one or several independent projects that illustrate the concepts that were just covered, which is exactly what we've been doing up until now.  At the same time, you'll also be asked to complete a chapter or two from the [Ruby on Rails Tutorial](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book) by Michael Hartl.  

That tutorial is often too deep for fresh beginners to Rails but we'll be using it as way to build up a single large project over the course of your education.  You should have a much better idea of what's going on in the tutorial than your average beginner since we'll be covering each of its component concepts prior to actually building it in the tutorial.

## The Roadmap

We'll be starting with an overview of important topics like HTTP, MVC, REST, APIs, Cookies and Authentication for some context before moving into the really fun stuff.  Our first foray into Rails will be from the bottom up -- starting with ActiveRecord, which helps you talk to your database.  Once you're able to figure out how your data is organized and set up, the rest is just icing.

We'll then move front-to-back, starting with the routing layer and moving into controllers and views so you can build a functional (if not yet pretty) interface for your data.  Next you'll learn about web forms, an area that has a lot more going on behind the scenes than you might expect.  We'll cover some other intermediate topics like state and the asset pipeline to round out your initial understanding of Rails.

But we can't stop there, so we'll get back into ActiveRecord to give you the tools to really make your data dance, as well as the knowledge of the forms that is required to bring that functionality to the User.  Next, we'll teach you how to secure your app with authentication and you'll learn how to interface with the APIs of other websites and how to build your own.

Finally, we'll cover additional useful topics like how to send emails from your application, design patterns, metaprogramming and advanced routing before having you build your final project.

## Our Tools and Texts

The most important resources that we'll leverage are the [Rails Guides](http://guides.rubyonrails.org/) and the [Ruby on Rails Tutorial](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book).  Together, they comprise a near-complete set of open-source resources for learning Rails.  

The Guides and comprehensive, basically a completely open-source textbook and reference manual for Rails.  At times they'll get a bit more technical than you might like, and it may be okay to skim some of that.  When you Google for a solution later, if it's not showing up on Stack Overflow then it's probably going to give you a link to the Guides. 

The Tutorial (aka the Hartl Tutorial, after its author) is another open source resource which builds (over several hundred pages) a full featured web application (Twitter clone), including introducing you to testing your code using Rails along the way.

My typical workflow for a long time went sort of like this:

1. I know I want to implement a feature... Google search to see if anyone implemented the same feature.  Land on a Stack Overflow post that describes how to implement a similar feature.
2. The SO post shows me the right direction to take, so I Google for the specific method it mentioned that I don't understand.  I end up on the Rails Guides page that talks about it.
3. I pull up my completed version of the Rails Tutorial to make sure I've got the syntax correct and possibly to help write tests while I implement the feature.

As you can see, I frequently relied on the main resources you'll be learning from and you'll find them to be helpful long after you've completed this course, so it makes sense to get familiar with them!

## Prerequisites

**If you haven't completed these, be sure to do so before getting started:**

* Your software should be installed, as listed in the [Installfest section](/curriculum/installations/).
* You should really have gone through the full [Web Development 101](/curriculum/web_development_basics/) section, but the most important parts are listed below.
* Read the full [Back End Basics](/curriculum/web_development_basics/web_programming_basics/back_end_basics/) portion of the Web Development 101 section for an introduction to Ruby.
* Read the [Rails portion of the Web Development 101](/curriculum/web_development_basics/web_programming_basics/framework_basics/rails_basics.md) section for an overview of Rails.  
* Build the [Rails project from the Web Dev 101 section](/curriculum/web_development_basics/web_programming_basics/framework_basics/project_rails.md) to get your hands dirty with Rails first.
* Complete the full [Basic Ruby](/curriculum/ruby/basic_ruby/) section (all readings and projects) to have a solid grounding in Ruby basics.

## Additional Resources

* 