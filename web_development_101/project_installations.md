# Project: Installations
*Total estimated time: 3-6 hours*

One step which can be unnecessarily frustrating is making sure everything is installed on your computer so you can get developing.  Just about every recent beginner has some horror story about how long they battled with their computer and Google to finally get their environment working properly.  And often you hear it used as a reason why it took people so long to get started in the first place.

It may be a challenge, but if you're interested in being at least a half-serious web developer you *will* need to get this stuff up and running on your machine at some point and it's best to get it done early.  This lesson is devoted solely to helping you install what you need to install so we can get it over with and move on to the good stuff.  

One option for learning development has always been to use an existing online environment.  In fact, almost all sites geared towards beginners these days have you learn on their website, where you type in some code and it will execute it for you.  Magic! Frankly, we think that's an incomplete approach.  What happens when you want to actually build something on your own? But, if it's a question of a hosted environment (like [Nitrous.io](https://www.nitrous.io/join/GRrt3VYaHE8?utm_source=nitrous.io&utm_medium=copypaste&utm_campaign=referral)) and no environment, do what it takes to get you going.  We'll give some alternatives below.

If you get stuck during the installation process, do not give up!  Sign up for a meetup to find an experienced programmer that can help you and Google the error messages to troubleshoot the installation.  Find a friend somewhere who can help you out.  Everyone goes through it, so you're not crazy if your computer suddenly seems like a hostile beast.  Battle it out... there are lots of resources scattered throughout the web and someone has had your problem before.

## Join our Slack Group
Learning to program can feel like a lonely and isolated journey, but it doesn't have to be. We have a Slack group that acts as the communication hub for all our students and the core team that looks after Odin. You can utilize it to:

* Chat and network with other people that are going through the exact same journey you are.
* Discuss the concepts you learn through the lessons.
* Get help when you are stuck.
* Report Broken links and other bugs.

Your first assignment is to join our slack [here](https://slackin-theodinproject.herokuapp.com/) and introduce yourself in the General channel

## Back End vs Front End Installations

We've already covered what the overall difference is between back end (server-side) and front end (client-side) programming, but you'll see it manifested again in how you install the necessary software.  Because the client-side code runs in the browser, all you really need to write some HTML, CSS and Javascript is a web browser like Chrome, Firefox or (shudder) Internet Explorer.  

Websites like [CodePen](http://codepen.io/) and [JSFiddle](http://jsfiddle.net/) let you create small but dynamic webpages right in your browser.  They will become a bit cumbersome when you try to build more meaningful projects, which will require you to start writing more in your text editor, but are perfectly fine for doing smaller exercises.  The lack of any complicated installations is one reason that front-end programming is more accessible for beginners to try out.

Server-side code is a bit different -- because each programming language (like Ruby or Python) is a different animal, you need to actually install that language onto your computer.  With Ruby, you will be installing the Ruby interpreter just like any other program. When you "run" your Ruby code, you are actually using the Ruby program.  In principle, this shouldn't add too much additional complexity, but it is an extra step from just running simple text files in your browser.

Another reason things get a bit more complicated on the back end is because programmers do more than just feed a text file full of code into a program -- they also want to be able to handle running different versions of Ruby at the same time (perhaps to work on an older website one day and a newer one the next) and ultimately to deploy those websites up to their chosen web server.  Each of these workflow improvements requires another program to help out with managing it.

So, at its core, server-side installs with Ruby are just you installing the Ruby interpreter on your machine and a couple of extra things to help manage your workflow.  It just seems like a lot of different things when you're unfamiliar with what each one is doing.  We'll give you a brief description of each thing below and then you'll get a chance to do the installations on your own.

## Windows and Web Development

A final note to Windows users -- you can install everything you need to but you'll feel at times like you're swimming against the current.  Many examples throughout the learning process will assume you're working on a mac and you'll have to get good at translating certain steps into your own workflow.  Suffering builds character.  And this is payback for the 90's when it took another six months to come out with a Mac version of any half-decent game.

Your best bet may be to try using Linux (admit it, you've been curious...) or to use a hosted environment like [Nitrous.io](https://www.nitrous.io/join/GRrt3VYaHE8?utm_source=nitrous.io&utm_medium=copypaste&utm_campaign=referral).  Not a requirement, just a friendly tip.

## What You'll Be Installing

Luckily, it's all free.  You'll be installing each of these using the tutorial below, but first here's a brief word about each item:

### Ruby

Ruby is the back end language we'll be using to write our server code.  The Ruby interpreter is a program like any other and so you'll need to make sure it's installed on your computer and you've got the right version (there are some big differences between, say, version 1.8.7 and 1.9.3 or 2.x).


### Git

Git, the version-control system you've read about, is another tool that requires a brief install.  You'll also be asked to create your Github account, which is very important because it'll host your portfolio.  When people visit your repo on Github (if it's public), they see all the source code files you've uploaded.

### Heroku

Heroku is the cloud hosting service which we'll be using to take our web applications "live".  In some ways it acts sort of like Github because you will be pushing your code to Heroku in an almost identical way, but it's performing a very different function.  Where Github keeps repositories of your source code, Heroku actually runs that code on a server for you so your application can be visited by users.  Heroku requires a couple of helpful tools to be installed to make your life easier during the deployment process.

### HTML, CSS and Javascript

Actually, we won't need to install any of these -- they come with your web browser already!  In later courses, you may actually start using Javascript on your computer as a server-programming language (Node.js), but for now you've got nothing to worry about with these three.

### Text Editor

We recommend using a text editor like [Sublime Text 2](http://www.sublimetext.com/) to make sure everyone's using basically the same type of text editor and you'll all be able to work together and ask questions of each other without that getting in the way.  Sublime also has lots of handy shortcuts, code highlighting and other nifty features that'll make your life easier, and that's just on the surface.

Check out [this "Quick Guide to Sublime Text" from Jennifer Mann](http://jennifermann.ghost.io/a-quick-guide-to-sublime-text/) for some helpful hints and tricks.  She refers to [this tutorial (~2.5 hrs of video) from NetTuts](https://tutsplus.com/course/improve-workflow-in-sublime-text-2/) which explains some of the awesomeness of Sublime Text 2 in depth.  The first chunk of the video is the most important, don't stress out about picking up the details in the rest (but you should come back to it once you've gotten more comfortable with the editor).

### Ruby Gems

There will be some Ruby gems (which are just prepackaged little libraries of code) to install to give you the tools necessary to talk to your database and install other gems easily in the future.

### RVM

RVM is a way of making sure that each Ruby or Rails project on your computer is treated independently of each other one.  It allows you to install multiple versions of Ruby and multiple versions of Rails or any other gem on your computer and then you can choose which set to use for a given project.  

This is very useful because you'll sometimes work on a project using an older version of Ruby (say 1.9.3) but simultaneously working on other projects using the newer version (2.0.0).  Since you obviously don't want to uninstall and reinstall Ruby each time, RVM just lets you say which gemset you want to use for a given project and PRESTO! your problems are solved.

### Rails

What about Rails?  Rails is actually a Ruby gem of its own since it's really just a bunch of Ruby code prepackaged for you.  You "install" it by downloading the `rails` gem.

### Mac: XCode

XCode is Apple's integrated development environment for creating Mac, iPhone and iPad applications.  Even though we won't be using it for that purpose, it's also got some command line tools that you'll be using so you're probably going to have to install it all (it's a giant package).

## Assignment: Installfest

These installfests will take you through the steps to install everything on your computer.  It will probably feel like you're doing a whole bunch of things that don't really make sense and moving way too quickly.  Hopefully you've got a basic understanding of what you're about to install, but it's also not super important that you know exactly what's going on or what all the commands mean.  You'll get more familiar with things over time.  

1. If you are using a Macintosh, follow the instructions on [Moncef Belyamani's blog](http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/).
2. Otherwise, do the [Railsbridge Installfest](http://installfest.railsbridge.org/installfest/) for your system.
3. Even if you didn't use the Railsbridge installation instructions, verify your installation by following their instructions for [creating a sample Rails app](http://installfest.railsbridge.org/installfest/create_a_rails_app) and then [deploying it](http://installfest.railsbridge.org/installfest/deploy_a_rails_app). 
4. Typing `$ ruby -v` on your command line (ignore the $, it stands for the prompt) should output something that includes `2.0.0` or a similar number.  `$ rails -v` should give you something like `4.0.0`.
  
## Checklist

##### Before moving on, you should have:
* Set up your [github](http://github.com/) account
* Set up your [heroku](http://www.heroku.com/) account
* Created and deployed a sample rails application
* Patted yourself on the back for accomplishing a task that has turned back many brave warriors.

## Oh no! Total Failure!!!

If all else fails, the best web-based development environment to use for coding the back end is [Nitrous.io](https://www.nitrous.io/join/GRrt3VYaHE8?utm_source=nitrous.io&utm_medium=copypaste&utm_campaign=referral).  It's free to use and gives you a brand spanking new Ruby and Rails setup to start coding with. You can even integrate it with your text editor and work collaboratively with other people.  

I've often found this to be much easier for Windows users than trying to navigate the regular installations process.  It relies on having an internet connection, but it gives you a command line, a text editor, and the ability to run a local server right out of the box.

So your alternate path is to go to [Nitrous.io](https://www.nitrous.io/join/GRrt3VYaHE8?utm_source=nitrous.io&utm_medium=copypaste&utm_campaign=referral) and set up your account.  You'll be given enough free "credits" to keep a virtual development environment running full time.  The instructions on the website are fairly straightforward.  You can get your text editor and terminal up and running in a couple minutes.  Plus, it works with Git!

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

If you've run into issues with your installation and are desperately looking for something else to try, take a deep breath first and go back over the instructions step-by-step to make sure you've followed them properly.  You can run into some odd issues if you start trying to mix together different installation recommendations, because some of them use auto-installers and have you install things in slightly different places so you may end up with a couple copies of key components.  It may work fine on the surface, but some day it'll probably come back and frustrate you again.  But, if you must, here are some other people's installation recommendations:

* Michael Hartl describes the installation in his [Rails Tutorial, Chapter 1](https://www.railstutorial.org/book/beginning#sec-up_and_running), and the chapter also guides you through making and deploying your first bare-bones Rails app just to make sure everything's working properly.
* Treehouse has short videos describing Rails installation for various environments in their [Getting Started with Rails](http://teamtreehouse.com/library/programming/build-a-simple-ruby-on-rails-application/getting-started-with-rails) unit.
* [Rubyonrails.org](http://rubyonrails.org/download) installation section.
* [Guide](http://stackoverflow.com/questions/9440639/sublime-text-from-command-line-win7) for opening Sublime Text via command line in Windows.
* [Rails Installer](http://railsinstaller.org/en) goes in and forces Rails to be installed on your system.  If your computer has been behaving badly, maybe this scorched earth approach is the best.
* [Gorails.com] (https://gorails.com/setup/osx/10.10-yosemite) also has an excellent tutorial for setting up your Rails enviornment for OSX and Ubuntu.
* Google Google Google
