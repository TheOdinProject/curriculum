# Security, SSL, and Best Practices
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

## Assignment

1. If you're curious about how HTTPS secures connections, check out [this article from Hartley Brody](http://blog.hartleybrody.com/https-certificates/).

## Additional Resources

*