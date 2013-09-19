---
layout: 'content'
---
# Databases and SQL

## This section is collecting resources right now

## Intro

You've already taken a brief dip into databases as part of the [Web Development 101]({{site.url}}/dir/web_development_basics/web_programming_basics/database_basics.html) section, hopefully learning why we use databases and some basics about how they are structured.  In this section, we'll dive a bit deeper into relational databases and SQL in particular.  

It's a bit difficult to predict how much knowledge of SQL is the right amount... if you're building a very straightforward web application, you'll likely only need to understand the basics of Create/Read/Update/Destroy operations, how to join tables together, and how to filter and order results.  

These are things that Rails actually makes fairly easy for you, so your knowledge of SQL only really needs to be enough to conceptualize what Rails is doing.  In that limited case, you might skim this section and treat it as reference for later, or even skip it altogether.  

At some point, though, you'll probably find yourself having to pull a more nuanced or complicated dataset from your database, like "Only those applicants who applied to the New York program and scored above a 7 on their first coding test, grouped by month and sorted reverse chronologically" (this was a real one).  A lot of the time, it's for internal tools that you use to track what users are doing with your application (e.g. building a simple analytics dashboard).  

If you're doing a lot of externally facing queries, you'll probably need to not just understand SQL well enough to set up the problem but also get the data you want using as few queries as possible.  Every new query is more time the user is impatiently waiting for the page to load.  SQL is a very fast language, you just need to understand how to put all the information you're trying to retrieve into an appropriately structured query.

So if your goal is to understand this stuff well enough to build some really high quality applications, dive in here!  The project will give you plenty of practice and will probably push you to the edges of your understanding.  Even if you forget it afterwards, you'll be able to come back for a refresher when you hit that one particularly mind-boggling query.

## Different Databases

### SQLite3

The basic Rails app ships with a very simple database called 'sqlite3', which is a very lightweight database useful for development.  You don't have to do much to set it up -- it just kind of works and you can use it without much thought while developing.  However, sqlite3 is only meant to be a lightweight solution so you'll find yourself using more robust solutions in production.

### PostgreSQL

Heroku (where you'll likely deploy your app) uses a database called Postgres, which is much faster and more scalable than the default sqlite3.  If you decide to use it locally as well (since the transition between using your sqlite3 database in development and deploying with a Postgres database in production can cause some headaches), you'll find that it takes a bit more hand-holding to set up.  It doesn't "just work" out of the box... it actually acts a lot like a server.  You have to fire it up, tell your application where to find it, and then manually create the database you want to connect to.  

Luckily, both sqlite3 and postgres use SQL for queries and Rails has nicely abstracted away most of the differences between them.  You'll have to make a few edits to your configuration files so Rails knows which database to talk to, and you may have to tweak some of your queries, but it's pretty smooth sailing from there.  We'll get into that in rails.  

### NoSQL

We've talked up until now exclusively about relational databases that use tables to store data.  Relational databases can provide a very logical way to represent relationships between objects and they allow you to separate out your data into appropriately modular tables.  When you want to access your data, you rely on the relationships between tables to do so.  

For instance, if you want to get all the comments that exist on a specific blog post, you take the `blog_posts` table and the `comments` table and join them together.  Every row of the `comments` table will have a column that maps that comment back to a specific ID from the `blog_posts` table, which is what allows you to do this.  Then it's easy for the database to return the appropriate batch of comments for a specific post because it's all been lined up so nicely.  Regardless of which specific database you're using, if it's relational, that's pretty much what it's doing.

#### Scaling

NoSQL databases like MongoDB or Hadoop are touted as being better for giant data applications.  There are two major limits to scaling an application -- database query speed and data reliability.  

The speed at which you can retrieve data from the database directly affects the user's experience on your website.  If you're running complicated database queries, your application will probably load slowly.  How do you speed them up?

 while data reliability means you can only effectively have one database.

If you've got 100,000,000 users on the site now, you need to make sure that when one user changes something, that change is reflected to all users so they don't try to also change that same thing.  

Imagine a banking application where you need to limit withdrawals such that the total available balance is updated before a withdrawal is made (you don't want someone to be able to withdraw their $100 10,000 times before you realize their balance is now short almost a million dollars).  That means you need to have one place where all data is stored, which often means a single database.  Large application builders have gotten good at using tricks to split databases apart, but the database often becomes the limiting factor of the application.

Aside from data reliability is speed.    

## Roadmap:

* Overview of databases (should be review from 101 section)
* SQL online resources
* Advanced: the whole coursera course on databases
* Easy quiz: http://www.w3schools.com/quiztest/quiztest.asp?qtest=SQL
* Project: SQL Zoo