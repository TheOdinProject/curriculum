# Installations
Total estimated time: 3-6 hours

*[Top level table of contents](/README.md)*

## Intro

One step which can be unnecessarily frustrating is making sure everything is installed on your computer so you can get developing.  Just about every recent beginner has some horror story about how long they battled with their computer and Google to finally get their environment working properly.  And often you hear it used as a reason why it took people so long to get started in the first place.

One option for learning development has always been to use an existing online environment.  In fact, almost all sites geared towards beginners these days have you learn on their website, where you type in some code and it will execute it for you.  Magic! Frankly, we think that's a wholly incomplete approach.  What happens when you want to actually build something on your own?  

If you're interested in being at least a half-serious web developer you'll need to get this stuff up and running on your machine at some point and it's best to get it done early.  This brief unit is devoted solely to helping you install what you need to install so we can get it over with and move on to the good stuff.  

A final note to Windows users -- you can install everything you need to but you'll feel at times like you're swimming against the current.  Many examples throughout the learning process will assume you're working on a mac and you'll have to get good at translating certain steps into your own workflow.  Suffering builds character.  And this is payback for the 90's when it took another six months to come out with a Mac version of any half-decent game.

## What You'll Be Installing

Luckily, it's all free.  A brief word about each item:

#### Ruby

The Ruby interpreter is a program like any other and so you'll need to make sure it's installed on your computer and you've got the right version (there are some big differences between, say, version 1.8.7 and 1.9.3 or 2.x).


#### Git

Git, the version-control system we've been talking about, is another tool that requires a brief install.  You'll also be asked to create your Github account, which is very important because it'll host your portfolio.

#### Heroku

Heroku is the cloud hosting service which we'll be using to take our web applications "live".  On the surface, it acts sort of similarly to Github because you will be pushing your code to Heroku in an almost identical way, but it's performing a very different function.  Where Github keeps repositories of your code, Heroku actually runs that code on a server for you so your application can be visited by users.  You'll want to make sure you've got a couple of helpful tools installed to make your life easier.

#### Text Editor

We recommend using a text editor like [Sublime Text 2](http://www.sublimetext.com/2) to make sure everyone's using basically the same type of text editor and you'll all be able to pair together without that getting in the way.  Sublime also has lots of handy shortcuts, code highlighting and other nifty features that'll make your life easier, and that's just on the surface.

There's a [tutorial (~2.5 hrs of video) from NetTuts](https://tutsplus.com/course/improve-workflow-in-sublime-text-2/) that explains some of the awesomeness of Sublime Text 2 in depth.

#### Ruby Gems

There will be some Ruby gems (which are just prepackaged little libraries of code) to install to give you the tools necessary to talk to your database and install other gems easily in the future.

#### Rails

What about Rails?  Rails is actually a Ruby gem of its own since, as we've covered before, it's just a bunch of Ruby code prepackaged for you.

#### Mac: XCode

XCode is Apple's integrated development environment for creating Mac, iPhone and iPad applications.  It's also got some necessary command line tools you'll be using so you're probably going to have to install it all (it's a giant package).

## Assignment: Installfest

These installfests will take you through the steps to install everything on your computer.  It will probably feel like you're doing a whole bunch of things that don't really make sense and moving way too quickly.  It's beyond our scope here to walk you through why we're doing every single step, but it's also not super important that you know exactly what's going on or what all the commands mean.  

If using a Macintosh, follow the instructions on [Moncef Belyamani's blog](http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/).

Otherwise, do the [Railsbridge Installfest](http://installfest.railsbridge.org/installfest/).

## Assignment: Test Drive Your Setup

Even if you didn't use the Railsbridge installation instructions, test your installation by following their instructions for [creating and deploying a sample Rails app](http://installfest.railsbridge.org/installfest/create_and_deploy_a_rails_app).

## Additional Resources

If you've run into issues with your installation and are desperately looking for something else to try, take a deep breath first and go back over the instructions step-by-step to make sure you've followed them properly.  You can run into some odd issues if you start trying to mix together different installation recommendations, because some of them use auto-installers and have you install things in slightly different places so you may end up with a couple copies of key components.  It may work fine on the surface, but some day it'll probably come back and frustrate you again.  But, if you must, here are some other people's installation recommendations:

* Michael Hartl describes the installation in his [Rails Tutorial, Chapter 1](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book#sec-up_and_running), and the chapter also guides you through making and deploying your first bare-bones Rails app just to make sure everything's working properly.
* Treehouse has short videos describing Rails installation for various environments in their [Getting Started with Rails](http://teamtreehouse.com/library/programming/build-a-simple-ruby-on-rails-application/getting-started-with-rails) unit.
* [Rubyonrails.org](http://rubyonrails.org/download) installation section.
* [Guide](/additional_resources/sublimetext_windows_CLI.md) for opening Sublime Text via command line in Windows.


## Checklist

##### Before moving on, you should have:
* Set up your [github](http://github.com/) account
* Set up your [heroku](http://www.heroku.com/) account
* Created and deployed a sample rails application
* Patted yourself on the back for accomplishing a task that has turned back many brave warriors.

## Additional Resources

Have any other installation instructions, tips, tricks, or helpful sections?  [Email us](mailto:curriculum@theodinproject.com) or [fork this repo](https://help.github.com/articles/fork-a-repo), add your changes, then [submit a pull request](https://help.github.com/articles/using-pull-requests).
