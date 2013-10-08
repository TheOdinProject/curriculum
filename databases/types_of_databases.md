# Different Databases

In this section, we'll take a brief look at different types of databases.

## SQLite3

The basic Rails app ships with a very simple database called 'sqlite3', which is a very lightweight database useful for development.  You don't have to do much to set it up -- it just kind of works and you can use it without much thought while developing.  However, sqlite3 is only meant to be a lightweight solution so you'll find yourself using more robust solutions in production.

TODO: Link to SQLite3

## PostgreSQL

Heroku (where you'll likely deploy your app) uses a database called Postgres, which is much faster and more scalable than the default sqlite3.  If you decide to use it locally as well (since the transition between using your sqlite3 database in development and deploying with a Postgres database in production can cause some headaches), you'll find that it takes a bit more hand-holding to set up.  It doesn't "just work" out of the box... it actually acts a lot like a server.  You have to fire it up, tell your application where to find it, and then manually create the database you want to connect to.  

Luckily, both sqlite3 and postgres use SQL for queries and Rails has nicely abstracted away most of the differences between them.  You'll have to make a few edits to your configuration files so Rails knows which database to talk to, and you may have to tweak some of your queries, but it's pretty smooth sailing from there.  We'll get into that in rails.  

TODO: Link to Postgres


## A Very Brief Note About Scaling

Two major limits to scaling an application are on the database level -- query speed and data reliability.  

The speed at which you can retrieve data from the database directly affects the user's experience on your website.  If you're running complicated database queries, your application will probably load slowly.  The same is true if you have an enormous database that needs to be traversed to come up with a single item.  In return for the ease of modeling data using a relational model, you sacrifice a level of performance at scale.

Data reliability means you only have one canonical copy of your data that can be affected at any given time.  If you've got 100,000,000 users on the site now, you still need to make sure that when one user changes something, that change is reflected to all users so they don't try to also change that same thing.  The easiest way to ensure this is to have a single database but then you run into the speed problems mentioned above!  In practice, there are a lot of tricks people employ to break up their database into pieces, dynamically enforcing that there are no write conflicts and making sure that all reads are made from an up-to-date table.  This can be a particularly tricky issue with relational databases because you need to keep track of all the tables during that process.  

When you get into the guts of large applications, it gets really fascinating but the real point of this is to say that the database can often be the limiting factor of a large application.

To learn more about scaling, check out:
TODO
 
## NoSQL

We've talked up until now exclusively about relational databases that use tables to store data.  Relational databases can provide a very logical way to represent relationships between objects and they allow you to separate out your data into appropriately modular tables.  When you want to access your data, you rely on the relationships between tables to do so, but they do hit some speed bumps at scale.

NoSQL databases like MongoDB or Hadoop are touted as being better for giant data applications.  They represent a bit of a step back in complexity in some senses -- they're sometimes called "flat" databases because they don't rely on multiple tables but keep everything in a single file.  The theory is that you can greatly optimize your queries by just storing frequently associated things together.  For instance, instead of breaking your `blog_posts` and `comments` into separate tables, you just store the serialized comments nested beneath their appropriate post in the file.

The advantage is that it is blazing fast to read queries that have been optimized this way.  On the flip side, if you want to make queries across multiple domains (like seeing all the comments that a given user has made), it takes much more computational work to pull that together since those comments will be spread out all over the place.

Consider that a taste... while there are gems you can use to interface with NoSQL databases and you probably won't really notice the difference, Rails is built with a very SQL mindset.  In this curriculum, we'll be focusing on SQL databases but feel free to explore the world of NoSQL once you've become comfortable with SQL.

## Additional Resources

* Add some!