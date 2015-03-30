# Security, SSL, and Best Practices
<!-- *Estimated Time: 1 hr* -->

It's important to at least start thinking about how the open and bountiful world of the Internet handles issues of security and secure connections.  

Security is something that beginning developers don't spend a lot of time thinking about because they've got a lot on their minds but it will occupy more of your time as you start putting real applications onto the internet.  It's something that you need to be familiar with because sometimes simple but incorrect choices can leave your users' data exposed or your application vulnerable to attack.  Some simple best-practices and best technologies go a long way towards alleviating those issues.

There are a couple of basic areas where security is particularly important -- authenticating users, creating secure connections and securing your databases.  Luckily, the tools we'll be learning have already figured out good solutions to most of these problems.  

Here's a [basic explanation of security certificates from Reddit](http://www.reddit.com/r/explainlikeimfive/comments/jsq3m/eli5_what_are_online_security_certificates_ssl/):


> You want to pass a note from you all the way across the room to Suzy. Normally, you just pass the note and say "get it to suzy" and the kids in the room will keep pushing it towards her until she gets it. The problem is, the teacher or anyone who gets the note can just open it up and read it.

> SSL is a type of certificate used to make sure the contents of a packet (note) don't get read. It's like putting your note in a lockbox and you've given Suzy the key ahead of time. She's the only one who can see what's in the box, because she has the key (the SSL certificate). HTTPS is an altered version of the HTTP protocol which makes sure whoever tries to open the box has the key. If anyone tries to read the note and they don't have the key, all they'll see is garbled (encrypted) data, which will most likely just look like random characters. it's like they took the box and just tried smashing it on the floor, but it ripped the note apart in the process.


You'll do some brief reading/viewing here but the main takeaway should be that Security is an important issue, even if it's often obscured from you.  You'll run into use of certificates when you deploy to Heroku and possibly also when you're setting up your Github account (though that depends which method for pushing you've enabled).

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*

* Why is security for an application important?
* What are the major areas where a web application is vulnerable?
* How is HTTPS different from HTTP?
* What does SSL stand for?
* What is an SSL certificate?
* How long has it been since you saw a news headline of a tech company who got "hacked" and exposed millions of user accounts?

## Assignment

2. For a quick video overview of SSL, [watch this video](http://www.youtube.com/watch?v=iQsKdtjwtYI).  It's more important to understand the "Why use SSL" than the "How to use SSL".  The section on Certificates at the end is also useful.
1. To understand the basics of HTTPS and SSL, check out [this article](http://www.hongkiat.com/blog/ssl-certs-guide/).
2. Skim through Smashing Magazine's list of some [common security mistakes](http://coding.smashingmagazine.com/2010/10/18/common-security-mistakes-in-web-applications/) from a 2010 article.  It references PHP code but the vulnerabilities are language agnostic.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* If you're curious about how HTTPS secures connections, check out [this article from Hartley Brody](http://blog.hartleybrody.com/https-certificates/).
* Browse through the [HTTPs Wiki](http://en.wikipedia.org/wiki/HTTP_Secure) and ignore the jargon.