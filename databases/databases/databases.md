### Introduction

We've talked about the client-side and the server-side but how do we keep ahold of all our user's data?  Who remembers that your login password is `CatLover1985` so you can sign into the website?  The bottom layer of any web application is the database and it handles all the remembering for you (we'll cover caching much later). It can be relatively simple, like an Excel spreadsheet, or incredibly complex and split into many giant pieces, like Facebook's.

Databases are kind of hidden in the back of the web application, so people approach them with a sense of suspicion and awe.  However, do not fret or feel intimidated.  As you dive deeper into the subject, your databases and you are going to become very good friends (or at least frenemies).  Rest assured, by the end of this curriculum, you're going to understand what's going on with your databases and be able to interact with them like a pro (and probably better than some people you'll work with).  This lesson is a teaser for that.

Compared to a normal programming language like you've already learned, SQL (Structured Query Language), which is used to query databases, has a very short syntax... with only a small handful of verbs to learn.  What trips people up is that you need to be able to visualize in your head what it's going to be doing.  We'll spend a fair bit of time on SQL and databases because they're so fundamental, but for now we'll just cover enough to get you familiar with what's going on in there.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

-   What a database is.
-   What relational databases are.
-   In what way relational databases are different from XML.
-   What SQL is.
-   What SQL is used for.
-   How to get all the records from a table in SQL.
-   How to insert a record in SQL.

### Assignment

<div class="lesson-content__panel" markdown="1">

  1.  Check out this [introduction](https://launchschool.com/books/sql/read/introduction) of how SQL can be used to organise and manage an overwhelming amount of data.
      -   You do not need to go any further than the first page on introductions.

  2.  Watch this [short video introduction to relational databases](http://www.youtube.com/watch?v=z2kbsG8zsLM) to get a feel for why this stuff is useful and some more exposure to the terminology we'll use.
  3.  Go through this [Khan Academy tutorial](https://www.khanacademy.org/computing/hour-of-code/hour-of-sql/v/welcome-to-sql), to get a feel for actually creating and manipulating databases.

</div>

### Knowledge check
This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

-   [What is a database?](https://launchschool.com/books/sql/read/introduction#structureddata)
-   [What are relational databases?](https://launchschool.com/books/sql/read/introduction#rdbms)
-   [What is a Primary Key?](https://youtu.be/z2kbsG8zsLM?t=200)
-   [What is SQL?](https://launchschool.com/books/sql/read/introduction#sql)
-   [How do you get all the records from a table in SQL?](https://www.khanacademy.org/computing/hour-of-code/hour-of-code-lessons/hour-of-sql/pt/querying-the-table)
-   [How do you insert a record in SQL?](https://www.khanacademy.org/computing/hour-of-code/hour-of-code-lessons/hour-of-sql/pt/creating-a-table-and-inserting-data)

### Additional resources
This section contains helpful links to related content. It isn’t required, so consider it supplemental.

-   [What is a Relational Database?](http://computer.howstuffworks.com/question599.htm) from HowStuffWorks.com
-   A brief [Simple Wiki article describing relational databases](http://simple.wikipedia.org/wiki/Relational_database)
-   Hunter Ducharme created [an e-book](https://hunter-ducharme.gitbook.io/sql-basics/) which is a great documentation on how to do all the basics in SQL.
-   David J. Malan's excellent SQL lecture and resources in [Harvard's CS50x](https://cs50.harvard.edu/x/2023/weeks/7/).
-   Relational databases aren't the only way to store data. Non-relational (aka NoSQL) databases have emerged over the last couple decades. Check out [this article](https://circleci.com/blog/SQL-vs-NoSQL-databases/) to learn the difference between SQL and NoSQL.
