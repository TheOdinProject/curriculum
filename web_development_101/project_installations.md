### <a id="introduction"></a>Introduction
One step which can be unnecessarily frustrating is making sure everything is installed on your computer so you can begin developing. It can be even more frustrating if you're not already comfortable using a Mac or Linux system before you start, so because of that, this step is often one of the primary reasons that people give up on coding before they even start.

Even so, if you're interested in being at least a half-serious web developer you *will* need to get this stuff up and running on your machine at some point and it's best to get it done early.  

While some of our early lessons _do_ use online tutorials, we believe that the best way to get usable real-world skills is to develop on your own machine rather than simply following tutorials in a closed online environment. This lesson is devoted solely to helping you install what you need to install so we can get it over with and move on to the good stuff.  

### <a id="backend-vs-frontend-installations"></a>Back End vs Front End Installations

We've already covered what the overall difference is between back end (server-side) and front end (client-side) programming, but you'll see it manifested again in how you install the necessary software.  Because the client-side code runs in the browser, all you really need to write some HTML, CSS and Javascript is a web browser like Chrome, Firefox or (shudder) Internet Explorer.  

Server-side code is a bit different -- because each programming language (like Ruby or Python) is a different animal, you need to actually install that language onto your computer.  With Ruby, you will be installing the Ruby interpreter just like any other program. When you "run" your Ruby code, you are actually using the Ruby program.  In principle, this shouldn't add too much additional complexity, but it is an extra step from just running simple text files in your browser.

Another reason things get a bit more complicated on the back end is because programmers do more than just feed a text file full of code into a program -- for example, running different versions of Ruby at the same time (perhaps to work on an older website one day and a newer one the next) or deploying those websites up to their chosen web server.  Each of these workflow improvements requires another program to help out with managing it.

Because of this, there are many little pieces and parts that you are going to need to get up and running.  Don't be afraid at this point if you don't know or understand what everything is, as you progress it will all become quite clear.

### <a id="why-cant-i-use-windows"></a>Why can't I use Windows?

Ok, we get it.. you're very comfortable with the system you've already got running, and chances are, you're one of those "Computer People" that actually knows how the system works to some degree or another.  You're probably even telling yourself that if anyone can make this stuff work on Windows, it's you.

Technically it _is_ possible to get most of the needed elements running on Windows, but many of the required scripts and programs were originally written for Linux, or Mac systems with Windows as more of an afterthought.  You will quickly run into trouble, with mismatching versions, out-of-date installers and other similar conflicts that you'll need to resolve manually (and often repeatedly) and you're likely to find things that used to work breaking unexpectedly, with rather cryptic error messages.

The programmers who created Rails had a preference for unix based operating systems (OSX, linux) this means learning Rails on a Windows machine is a recipe for frustration. Below are some of the main reasons for using Linux when learning Rails:

* Because of the fundamental differences between unix based operating systems and Windows, installing Rails on a Windows machine is likely to give you problems that you would not encounter if you were installing on a linux system, these can be a real pain to solve.

* The above point extends to the different gems you will be using with Rails in the future. Most of the latest updates to gems will be targeted at unix based systems, they may eventually get patches to make them work with Windows but some may never get updated to work on Windows.

* Because of the instability of Rails on Windows you will probably find yourself second guessing some of the errors and bugs you encounter when developing being caused by either your system or the code you have written.

* Most of the examples throughout the learning process, and most tutorials you come across on the net will assume you are using a linux or mac, you will have to translate these into the equivalent Windows commands yourself.

* **Bonus**  Experience with Linux will look great on your CV.

We at Odin don't have anything against Windows, we simply want you to succeed at your goal of learning to program. We don't want to see you get majorly frustrated and giving up on this first hurdle of getting everything installed. Therefore we unequivocally recommend using linux or a Mac for this curriculum.

### <a id="intalling-linux"></a>Installing Linux
The good news is installing linux is not as hard as you might have imagined, first of all Linux is free so you don't have to pay for anything, Yay! Secondly there are three different options that you can choose from to use linux on your machine along side Windows, so you can choose the one that suits your situation best.

There are many different versions of Linux out there and many people who have used Linux for any length of time will have different opinions on which one is best. We wont go into any of that here and will simply recommend you use Ubuntu which is generally known as one of the most beginner friendly versions as well as having a very similar graphical user interface to Windows.

##### Option 1 - Use a Virtual Machine
This is the safest and simplest option for a complete beginner, or a person that _needs_ to use Windows on a regular basis for other reasons (work, school etc.)

A Virtual Machine is essentially a program that runs on your computer that emulates another computer system. If you have any experience of using emulators to play games that were released for old games consoles, this will be familiar. If not [here](http://www.makeuseof.com/tag/virtual-machine-makeuseof-explains/) is a very good explanation of what a virtual machine is. You can [download VirtualBox](https://www.virtualbox.org/wiki/Downloads) and use [this](https://www.youtube.com/watch?v=9_DpFhT_euI) guide to set up this option.

**Pros**

* You can easily access Windows and Linux, with the extra benefit of being able to switch between the two instantly.
* There is no risk of harming your current windows set-up.
* You are actually using a real linux setup within the virtual machine.

**Cons**

* Performance with Ubuntu won't be as sharp as a dual booting.

#### Option 2 - Dual Booting
You can install Ubuntu along side Windows on your machine by dual booting. This essentially means when you boot up your computer you will be brought to a screen that will allow you to choose which operating system you want to use, either your Windows operating system or your new linux operating system. [Here](https://www.youtube.com/watch?v=hOz66FC0pWU) is a guide of how to set this up.

**Pros**

* Gives you access to both Windows and Linux
* This option will yield the best performance from Ubuntu as it will be installed directly on your hard drive.
* You can customise as you like with different text editors etc

**Cons**

* Messing up your Windows installation is a possibility when setting your computer up to dual boot, and while it's easily avoided complete beginners should take care.
* To switch between your two operating systems you will have to reboot your computer.



#### Option 3 - Windows Subsystem for Linux
If you have a 64-bit version of Windows 10 Anniversary Update build 14393 or later, another option is to [install the Windows Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide). Follow those directions, then when you come to the installfest assignment below, open up Bash on Windows and when it offers you the option, chose Linux for your operating system.

**Pros**

* This is a fully operational Linux Bash Shell running natively on Windows.
* Since you are running Ubuntu natively from Windows you don't have a performance hit like with the virtual machine option.
* You have full access to both your Linux and Windows file-systems from both Bash on Windows and File Explorer.
* You don't have to restart to switch between Linux and Windows: Bash on Windows acts just like your windows Command Prompt.
* This is an official Microsoft product, so there is little risk of messing up your Windows installation.
* You can use just about(see the Cons) any Text Editor you like: Atom, Sublime, Notepadd++, etc.

**Cons**

* As the Instructions linked above clearly state, this is in Beta, not everything works yet (pay attention to the note by the Installfest assignment directions).
* Since this is not intended to be a full Linux operating system, the X windows system is not supported, so non-command line Linux apps will not work.
* IDEs that are tightly bound to Windows e.g. Visual Studio and RubyMine, will balk at Ruby and/or git not being installed on Windows, although you can still use them.
* Due to some differences in how Linux and windows save files, [unless you edit your files from within Bash for Windows, if you save them in the linux home directory they stop being visible from the Bash Terminal.](https://github.com/Microsoft/BashOnWindows/issues/942) The easiest workaround is to save all your work in /mnt/c/*.

#### Option 4 - Using an Online IDE
If you absolutely can not install Linux to your machine, or if the Virtual Machine is not an option for whatever reason, or you do not have Windows 10, there have been some great online IDE's (Integrated Development Environment) released in the past few years. These are similar to Virtual machines, except that they run directly in your browser. Of course this means you can log in from any computer and start coding from your browser when you have access to the internet. [Cloud9](https://c9.io/) is one of the most popular online IDE's.  

**Pros**

* You don't have to install anything on your local machine (this can be a con depending on the way you look at it, experience installing and setting stuff up on your local machine can be invaluable)
* Your coding environment will be available from any machine with internet access.
* These systems typically run a more-or-less full featured linux distro, so you can do all of the things you see in the tutorials and lessons here.

**Cons**

* You have to use the text editor that their services provide, which generally are not as good as the text editors you can install locally. Atom, sublime text etc.
* The free tier's of these services have a memory limit, normally 1GB. This can be a major limitation after a while.

### <a id="what-you-will-be-installing"></a>What You'll Be Installing

Luckily, it's all free.  You'll be installing each of these using the tutorial below, but first here's a brief word about each item:

#### Ruby

Ruby is the back end language we'll be using to write our server code.  The Ruby interpreter is a program like any other and so you'll need to make sure it's installed on your computer and you've got the right version (there are some big differences between, say, version 1.8.7 and 1.9.3 or 2.x).


#### Git

Git, the version control system you've read about, is another tool that requires a brief install.  You'll also be asked to create your Github account, which is very important because it'll host your portfolio.  When people visit your repo on Github (if it's public), they see all the source code files you've uploaded.

#### Heroku

Heroku is the cloud hosting service which we'll be using to take our web applications "live".  In some ways it acts sort of like Github because you will be pushing your code to Heroku in an almost identical way, but it's performing a very different function.  Where Github keeps repositories of your source code, Heroku actually runs that code on a server for you so your application can be visited by users.  Heroku requires a couple of helpful tools to be installed to make your life easier during the deployment process.

#### HTML, CSS and Javascript

Actually, we won't need to install any of these -- they come with your web browser already!  In later courses, you may actually start using Javascript on your computer as a server-programming language (Node.js), but for now you've got nothing to worry about with these three.

#### Text Editor

We recommend using an advanced text editor like [Sublime Text](http://www.sublimetext.com/).  Technically all of the projects would be possible to build using only the simplest editor such as Notepad, or whatever is built into the system that you are using, but Sublime has many of handy shortcuts, code highlighting and other nifty features that'll make your life much easier.  Sublime Text is free to use, but it _does_ have an occasional nagging pop-up that asks you to purchase it.  If you don't want to purchase it, and if the pop-up bothers you, another great alternative is [Atom](https://atom.io/).  Atom is _completely_ free and open source and most of the features (and a few more!) that Sublime has.  The trade-off is that Atom is considerably slower.  If you are working on a decent computer you might not notice the difference, but those of you who decide to use an older computer or a Virtual Machine will probably be happier with Sublime.

Check out [this installable tutorial](https://sublimetutor.com/) which is an interactive guide to the many shortcuts that can help your Sublime Text 3 workflow. Most of the tips there apply quite directly to Atom as well, although you can reference [Atom's Flight Manual](https://flight-manual.atom.io/) for specifics.

#### Ruby Gems

There will be some Ruby gems (which are just prepackaged little libraries of code) to install to give you the tools necessary to talk to your database and install other gems easily in the future.

#### RVM

RVM is a way of making sure that each Ruby or Rails project on your computer is treated independently of each other.  It allows you to install multiple versions of Ruby and multiple versions of Rails or any other gem on your computer and then you can choose which set to use for a given project.  

This is very useful because you'll sometimes work on a project using an older version of Ruby (say 1.9.3) but simultaneously working on other projects using the newer version (2.0.0).  Since you obviously don't want to uninstall and reinstall Ruby each time, RVM just lets you say which gemset you want to use for a given project and PRESTO! your problems are solved.

#### Rails

What about Rails?  Rails is actually a Ruby gem of its own since it's really just a bunch of Ruby code prepackaged for you.  You "install" it by downloading the `rails` gem.

#### Mac: XCode

XCode is Apple's integrated development environment for creating Mac, iPhone and iPad applications.  Even though we won't be using it for that purpose, it's also got some command line tools that you'll be using so you're probably going to have to install it all (it's a giant package).

### <a id="assignment-installfest"></a>Assignment: Installfest

These installfests will take you through the steps to install everything on your computer.  It will probably feel like you're doing a whole bunch of things that don't really make sense and moving way too quickly.  Hopefully you've got a basic understanding of what you're about to install, but it's also not super important that you know exactly what's going on or what all the commands mean.  You'll get more familiar with things over time.  

1. Complete the entire [Railsbridge Installfest](http://installfest.railsbridge.org/installfest/) for your system.
     * **Note for Windows users**: As of July 2016, there is a bug in the current version of railsinstaller for windows.
     * If you get the error `The system cannot find the path specified.` when attempting to run `bundle install --without production`:
          * run `gem install bundler`
          * try `bundle install --without production` again
     * **Notes for Bash on Windows users**: As of December 2016, if you are not on the Windows Insider "Fast Ring," inotify will not work yet. This causes some gems in your rails app like listener, guard, and spring to fail.
          * This can be worked around by commenting out the line, `config.file_watcher = ActiveSupport::EventedFileUpdateChecker` in `config/environments/development.rb`
          * if you do not receive `rvm is a function` in response to `type rvm | head -1`, after following the installfest instructions for installing rvm, type `echo 'source ~/.rvm/scripts/rvm' >> ~/.bashrc` then restart the Bash shell and try it again. It should work.
2. Typing `$ ruby -v` on your command line (ignore the $, it stands for the prompt) should output something that includes `2.2` or a above.  `$ rails -v` should give you something like `5.0.0` or above.



### <a id="checklist"></a>Checklist

##### Before moving on, you should have:
* Set up your [github](http://github.com/) account
* Set up your [heroku](http://www.heroku.com/) account
* Created and deployed a sample rails application
* Patted yourself on the back for accomplishing a task that has turned back many brave warriors.

#### Oh no! Total Failure!!!

If all else fails, one of the best web-based development environments to use for coding the back end is [cloud9](https://c9.io/).  It is free to use and gives you a brand spanking new Ruby and Rails setup to start coding with.  

It relies on having an internet connection, but gives you a command line, a text editor, and the ability to run a local server right out of the box.

### <a id="additional-resources"></a>Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

If you've run into issues with your installation and are desperately looking for something else to try, take a deep breath first and go back over the instructions step-by-step to make sure you've followed them properly.  You can run into some odd issues if you start trying to mix together different installation recommendations, because some of them use auto-installers and have you install things in slightly different places so you may end up with a couple copies of key components.  It may work fine on the surface, but some day it'll probably come back and frustrate you again.  But, if you must, here are some other people's installation recommendations:

* Michael Hartl describes the installation in his [Rails Tutorial, Chapter 1](https://www.railstutorial.org/book/beginning#sec-up_and_running), and the chapter also guides you through making and deploying your first bare-bones Rails app just to make sure everything's working properly.
* Treehouse has short videos describing Rails installation for various environments in their [Getting Started with Rails](http://teamtreehouse.com/library/programming/build-a-simple-ruby-on-rails-application/getting-started-with-rails) unit.
* [Guide](http://stackoverflow.com/questions/9440639/sublime-text-from-command-line-win7) for opening Sublime Text via command line in Windows.
* [Rails Installer](http://railsinstaller.org/en) goes in and forces Rails to be installed on your system.  If your computer has been behaving badly, maybe this scorched earth approach is the best.
* [Gorails.com](https://gorails.com/setup) also has an excellent tutorial for setting up your Rails environment for OSX and Ubuntu.
* RubyMine is a great IDE (Integrated Development Environment), which can be an alternative to text editors like Sublime which we recommend. [It is free for students](https://www.jetbrains.com/student/).
* [Visual Studio Code](https://code.visualstudio.com/) is an open source text editor from Microsoft that offers some of the same functionalities as Atom; is also based on Electron, like Atom; and is available for MacOS, Windows, and Linux. VSCode also has an integrated terminal that can be changed to work with the bash shell installed through the Windows Subsystem for Linux. To do so, you will need to go to File -> Preferences -> Settings, and in the editable settings file on the right, make sure you have these two settings:
     * "terminal.integrated.shell.windows": "C:\\Windows\\sysnative\\bash.exe" // Sets the terminal to Bash on Ubuntu on Windows
     * "terminal.integrated.shellArgs.windows": [ "--login" ] // Makes sure a login shell is used, necessary for rvm, ruby, and rails
* Google Google Google
