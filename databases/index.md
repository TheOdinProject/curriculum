# Databases and SQL

## Intro

You've already taken a brief dip into databases as part of the [Web Development 101](<%= root_path %>/web_development_basics/web_programming_basics/database_basics.html) section, hopefully learning why we use databases and some basics about how they are structured.  In this section, we'll dive a bit deeper into relational databases and SQL in particular.  

It's a bit difficult to predict how much knowledge of SQL is the right amount... if you're building a very straightforward web application, you'll likely only need to understand the basics of Create/Read/Update/Destroy operations, how to join tables together, and how to filter and order results.  

These are things that Rails actually makes fairly easy for you, so your knowledge of SQL only really needs to be enough to conceptualize what Rails is doing.  In that limited case, you might skim this section and treat it as reference for later, or even skip it altogether.  

At some point, though, you'll probably find yourself having to pull a more nuanced or complicated dataset from your database, like "Only those applicants who applied to the New York program and scored above a 7 on their first coding test, grouped by month and sorted reverse chronologically" (this was a real one).  A lot of the time, it's for internal tools that you use to track what users are doing with your application (e.g. building a simple analytics dashboard).  

If you're doing a lot of externally facing queries, you'll probably need to not just understand SQL well enough to set up the problem but also get the data you want using as few queries as possible.  Every new query is more time the user is impatiently waiting for the page to load.  SQL is a very fast language, you just need to understand how to put all the information you're trying to retrieve into an appropriately structured query.

So if your goal is to understand this stuff well enough to build some really high quality applications, dive in here!  The project will give you plenty of practice and will probably push you to the edges of your understanding.  Even if you forget it afterwards, you'll be able to come back for a refresher when you hit that one particularly mind-boggling query.

## Assignment

* Watch the [SQL Tutorial for Beginners on YouTube Part 1](https://www.youtube.com/watch?v=cYmQr8yeALA)
* Watch [Part 2](https://www.youtube.com/watch?v=1sMR2ApQVvw)
* Watch [Part 3](https://www.youtube.com/watch?v=deegPjmasq8)
* Watch [Part 4](https://www.youtube.com/watch?v=vHE-EeLaYsI)
* Find better free videos and tell us about them :)
