# Databases
<!-- *Estimated Time: 4-6 hrs* -->


We've talked about the client-side and the server-side but how do we keep ahold of all our user's data?  Who remembers that your login password is `CatLover1985` so you can sign into the website?  The bottom layer of any web application is the database and it handles all the remembering for you (we'll cover caching much later).  It can be relatively simple, like an excel spreadsheet, or incredibly complex and split into many giant pieces like Facebook's.

Databases are kind of hidden in the back of the web application so people treat them with a sort of suspicion and awe.  **That's nonsense and you should get over it** -- your database and you are going to become very good friends (or at least frenemies).  By the end of this curriculum, you're going to understand what's going on with your databases and be able to interact with them like a pro (and probably better than some people you'll work with).  This lesson is a teaser for that.

Compared to a normal programming language like you've already learned, SQL (Structured Query Language), which is used to query databases, is a very simple syntax... there are only a small handful of verbs to learn.  What trips people up is that you need to be able to visualize in your head what it's going to be doing.  We'll spend a fair bit of time on SQL and databases because they're so fundamental, but for now we'll just cover enough to get you familiar with what's going on in there.

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*

* What is a database?
* What are relational databases?
* How are relational databases different from XML?
* What is SQL?
* What is SQL used for?
* What does CRUD stand for?
* Why is the idea of "CRUD" so important for web apps?
* How do you get all the records from a table in SQL?
* How do you insert a record in SQL?
* What is a primary key?
* What is a foreign key?

## Assignment:
1. Check out a pretty good plain-english explanation of SQL, written by Zed Shaw, at [Learn SQL The Hard Way](http://sql.learncodethehardway.org/book/introduction.html).  Only read the introduction (unless you're feeling ambitious).
2. Watch this [short video introduction to relational databases](http://www.youtube.com/watch?v=z2kbsG8zsLM) to get a feel for why this stuff is useful and some more exposure to the terminology we'll use.
2. Next, you'll be watching some of Stanford's [Intro to Databases course lectures](https://class.stanford.edu/courses/DB/2014/SelfPaced/about).  They've been broken down into a couple of "mini-courses". Do the [first mini-course called "Introduction and Relational Databases"](https://class.stanford.edu/courses/DB/RDB/SelfPaced/about) ([the first video can be found here](https://class.stanford.edu/courses/DB/RDB/SelfPaced/courseware/ch-introduction/seq-vid-introduction/)), and the [mini-course on SQL](https://class.stanford.edu/courses/DB/SQL/SelfPaced/about) ([The first video can be found here](https://class.stanford.edu/courses/DB/SQL/SelfPaced/courseware/ch-sql/seq-vid-introduction_to_sql/)).

    If those links aren't working, see the Additional Resources section below for more help.  

    Make sure to do the automated assignments as well for the SQL section!  It's easier if you have a pen-and-paper handy to try and visualize what's going on.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* [What is a Relational Database?](http://computer.howstuffworks.com/question599.htm) from HowStuffWorks.com
* A brief [Simple Wiki article describing relational databases](http://simple.wikipedia.org/wiki/Relational_database)
* If the Stanford databases course above isn't working, check out their [playlist on YouTube](https://www.youtube.com/playlist?list=PL6hGtHedy2Z4EkgY76QOcueU8lAC4o6c3).  Watch lectures 1-3 (introductory material) and 11-13 (SQL).  Note -- this refers to the *lecture number* not the video's position in the playlist (they're all out of order).  
* Hunter Ducharme created [an e-book](http://hgducharme.gitbooks.io/sql-basics/) which is a great documentation on how to do all the basics in SQL.

    Also, skip the stuff on relational algebra, XML, and JSON unless you're feeling ambitious.  All of these database videos can be a bit technical, so don't worry if you don't absorb it all at first -- we'll cover it again in the Rails course.  The original Coursera course can be found [here](https://class.coursera.org/db/lecture/index).
