# Additional Important Topics:

## Git 101
Estimated Time: ??? hrs

We mentioned git briefly in the previous unit ([Becoming a Web Developer]({{ site.url }}/dir/becoming_a_web_developer/)) but this time you'll actually start using it.

If you recall, git is the version control system used by developers.  It means that you can revert to a previous (working) version of the application if you really screwed something up and it means that you have a standardized way of managing a project with contributions from multiple developers.  It's even useful if it's just you and you're working on a project on your own with a few half-baked ideas that you're trying to code at the same time but want to keep separated until they've matured sufficiently.

It sort of feels like if you were typing a text document and, every time you saved it, you entered a summary message like "just finished paragraph on how git works".  Then, if you realize at the end of the day that all your changes are awful and ruin the flow of the document, you could go back to the last save of yesterday and bring the document back to the way it was.

But wait, you say, Why not just erase the offending paragraphs and move on?  Here's where the web application stops resembling a high school essay.  Changes you make to your web application to build some new feature will be scattered in a dozen different files and will likely involve changing existing code at least as much as it involves actually producing new (and easily deleted) code, so having that ability to just reset the clock to a particular point in the past saves you from having to remember exactly what was changed and what it looked like beforehand.  The power of git goes well beyond this simple example, but it should help you start to see why people use it.

### Assignment:

1. Read through Github's [Introduction to Git materials](http://learn.github.com/p/index.html) and watch the video there.
2. Do the quick [Try Git exercises](http://try.github.io/levels/1/challenges/1) as well.


## Testing 101
Estimated Time: ??? hrs

Like git, testing is one of those things that people often don't think about when they decide to learn about web development but it's critically important to the production of professional quality applications and it will save you tons of time and headache in the end.

Let's say you're building a simple website and you've got a couple of pages linked together with a simple navigation bar at the top.  You make some changes to the code and want to know if the website still works.  So you open up your local version of the webpage and click through each of the buttons on the navigation bar to make sure they each still lead to the right location.  Not too difficult, is it?  It doesn't take too long, and it doesn't seem like such a bad way of doing things.

But now imagine that you've got a dozen pages with a login system and content that's meant to look different depending on which type of user you are logged in as.  You could come up with a checklist of all the buttons you'd have to manually click on and all the times you'd have to login as a different user but think about how many steps it would take before you were satisfied that your changes didn't accidentally blow up some obscure but necessary function of your website?  Situations like that should yell "automate me!" in your head, and that's exactly what testing does.

On the back end, you will learn RSpec, a language that is written in Ruby and one which will help you execute a broad and flexible script of tests to make sure your application is still working the way that it should.  RSpec's syntax even reads sort of like English, though it still takes some getting used to.  RSpec lets you test specific areas of your application like pulling from and saving to the database or that your helper methods work as expected.  With the help of a few useful gems, you can also test the broad-scale interactions the user will have when traveling from one page to another.

On the front end, we'll use a language called Jasmine to do a similar sort of thing.

Everyone does testing a little differently.  Some teams still rely heavily on a Quality Assurance (QA) department with people manually executing checklists like we described in the example above.  Some people use an approach called Test Driven Development (TDD) in which they write the (failing) test first and only then do they actually write the code necessary to make it pass, and thus very deliberately build the application out with 100% test coverage.  Others prefer to keep their test suites fairly light and will only write tests for the major interactions on their pages and any bugs that they have to fix along the way (to make sure they don't come back).  

Regardless, testing is highly important and you'll be quite familiar with it by the end of this curriculum.


### Assignment:

1. Do the [Introductory RSpec level](http://rspec.codeschool.com/levels/1) from Code School.

## The Cloud, Hosting, and Software as a Service (SAAS)
Estimated Time: ??? hrs

You've almost certainly heard of the Cloud before and have maybe also heard of SAAS.  The Cloud is really just a way of saying "stored out on the Internet somewhere", which really means "stored on someone else's systems that they let us access using the Internet".  With more and more of the world in posession of 24/7 internet access, that's not necessarily a bad thing.  For software, it has been a great thing.

Check out this [explanation of cloud computing](http://mashable.com/2013/08/26/what-is-the-cloud/) from Mashable.

If you want another go at it, take a look at this [explanation of cloud computing](http://www.cnbc.com/id/43077233) from CNBC.

Next, watch the [David Patterson's explanation of Cloud Computing (12:23 to 30:00)](https://www.youtube.com/watch?v=SeBAj4P2FWA&list=PLjbL0BCR04Q3uDPD3GVZJqV3UnJkOic-o) from the Berkeley SAAS course on edX.

Not too long ago, you had to buy a machine, set it up to run your back end code, and plug it into the wall to get it onto the internet.  These days, not only can you host your personal songs and files and emails in the Cloud, but you can actually run your website from servers hosted by someone else (and maybe in another country too).  Companies (like [Heroku](http://www.heroku.com), which we will use later) make it so that all you have to do is push some code their way and they'll take care of firing up and maintaining the servers necessary to get that application "live" and online.  They will also guarantee a certain minimum level of uptime (usually well north of 99%) so you don't have to worry about whether your servers have failed.  It means that you as a developer can focus more on building cool applications and less on the nuts and bolts of getting them out there.  This curriculum assumes that you'll be taking advantage of existing cloud hosting, so we won't spend much time teaching you about how to set up your own servers.

Where before you had to write a piece of software that would work on a particular type of computer (e.g. Windows machines running Windows Vista) and then get that user to install the software, now many of these applications are run completely using websites.  Think about Google Spreadsheets or Evernote or TurboTax... all of these can be run completely online (though they often have accompanying downloadable applications to help you out).

The ability to create this "Software as a Service (SAAS)" gives you tons of great flexibility as a developer -- it means you no longer have to think about the dozens of different types of operating systems and versions that the users could be using.  You just make sure your application can be viewed properly by people using a few different web browsers.  Even better, when you inevitably want to make large-scale changes or just fix some bugs, you no longer have to convince your users to go through the painful upgrade process.  Just push the changes to your sever, and Presto!, your application is updated and good to go.  If there's a problem with the new Ford car model, they need to issue a recall and have everyone go to a mechanic to fix it.  You just push some code to fix the bug and sleep happy.

Check out this article on the [difference between SAAS and Cloud Computing](http://www.itworld.com/print/109287) if you're confused.

There's also another [interesting perspective on SAAS](http://www.itworld.com/print/108695) from a few years ago.

### Additional Readings
* An [Intro to Cloud Computing](http://www.dummies.com/how-to/content/what-is-cloud-computing.html) by Craig Dickson
* [Cloud computing for dummies](http://www.dummies.com/how-to/content/what-is-cloud-computing.html)

## Security, SSL, and Best Practices
Estimated Time: ??? hrs

TODO: SSL and Security thought questions

It's important to start thinking about how the open and bountiful world of the Internet handles issues of security and secure connections.  Security is something that beginning developers don't spend a lot of time thinking about because they've got a lot on their minds but it will occupy more of your time as you start putting real applications onto the internet.  It's something that you need to be familiar with because sometimes simple but incorrect choices can leave your users' data exposed or your application vulnerable to attack.  Some simple best-practices and best technologies go a long way towards alleviating those issues.

There are a couple of basic areas where security is particularly important -- authenticating users, creating secure connections and securing your databases.  Luckily, the tools we'll be learning have already figured out good solutions to most of these problems.

Smashing Magazine showed some [common security mistakes](http://coding.smashingmagazine.com/2010/10/18/common-security-mistakes-in-web-applications/) in an article from 2010.  It references PHP code but the vulnerabilities are language agnostic.

To understand the basics of HTTPS and SSL, which help secure transactions on the web (like payments), check out the [HTTPs Wiki](http://www.reddit.com/r/explainlikeimfive/comments/jsq3m/eli5_what_are_online_security_certificates_ssl/) and [this article](http://www.hongkiat.com/blog/ssl-certs-guide/).  Here's a [basic explanation](http://www.reddit.com/r/explainlikeimfive/comments/jsq3m/eli5_what_are_online_security_certificates_ssl/):

<blockquote>
  You want to pass a note from you all the way across the room to Suzy. Normally, you just pass the note and say "get it to suzy" and the kids in the room will keep pushing it towards her until she gets it. The problem is, the teacher or anyone who gets the note can just open it up and read it.

  SSL is a type of certificate used to make sure the contents of a packet (note) don't get read. It's like putting your note in a lockbox and you've given Suzy the key ahead of time. She's the only one who can see what's in the box, because she has the key (the SSL certificate). HTTPS is an altered version of the HTTP protocol which makes sure whoever tries to open the box has the key. If anyone tries to read the note and they don't have the key, all they'll see is garbled (encrypted) data, which will most likely just look like random characters. it's like they took the box and just tried smashing it on the floor, but it ripped the note apart in the process.
</blockquote>

If you're curious about how HTTPS secures connections, check out [this article from Hartley Brody](http://blog.hartleybrody.com/https-certificates/).

## FTP
Estimated Time: .5 hrs

FTP stands for File Transfer Protocol and is basically a way of transferring files to and from servers.  Depending on your workflow, you may or may not use it directly but you should know what it is regardless.  It is explained well in this [FTP For Beginners](http://www.webmonkey.com/2010/02/ftp_for_beginners/) post from Webmonkey.
