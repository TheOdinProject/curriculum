### Introduction

Data is the core of any good web app and a good working knowledge of SQL will take you a long way.  That knowledge lets you not just understand what's going on behind the scenes with your ORM tool (e.g. Active Record) but also to feel comfortable asking more complicated questions of your data.  And that's really what SQL is all about -- asking questions of your database and occasionally also adding or changing things in it.  Querying can be incredibly useful for you.

In more straightforward cases, you might want to display all users who signed up in December via the promotion code "FREESTUFF".  You might want to display all comments created by the current user and sorted by topic and creation date.  In more complex cases, you may want to show a list of all the orders shipped to states with more than 1,000 users by quantity and total order value.  Or, for internal reasons, you might ask marketing analysis questions like which promotion channels produce users who meet your specified engagement criteria of reading 5 articles per work week.

All of those examples involve you engaging with your database.  Luckily, many databases (the ones we'll be focusing on) speak SQL and luckily SQL really only has a dozen or so words that you'll consistently use out of a few dozen total.  So it's not a large language, it's much more about the concepts behind it.

You will start with the questions like the ones above and then have to figure out how to ask them properly of your database, which likely has a bunch of different tables in it.  Everyone probably visualizes it a bit differently, but finding a way to visualize what's going on when you do SQL queries is pretty important.  I actually think of Excel tables moving in my head and combining with each other and reshuffling as necessary. To each their own.

We'll move beyond just the simple `SELECT "users".* FROM "users" LIMIT 1` queries and into more dynamic topics like joining tables together, performing calculations on the results, and grouping results together in new ways.

All this stuff is being used by Rails behind the scenes so understanding it will make you much better at writing queries in Rails. This is why we're going over databases before learning Rails.

#### A Note on Resources

SQL is one of those topics that's been stored away in dusty old technical manuals and 90's style websites. Even the best books out there can make it seem oddly complicated because they tend to write for the database engineer who actually does need to know all the nitty gritty details.

Though the prevalence of web applications these days has grown the demand among new users to focus on understanding the *concepts* of SQL, the learning tools haven't really caught up. We'll do our best to impart those concepts using the tools available.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

#### Important Concepts:

* What is the Primary Key?
* What are Foreign Keys?
* What is a Schema?

#### Statements:
* `SELECT`
* `CREATE TABLE`
* `DROP TABLE`
* `CREATE INDEX`
* `DROP INDEX`
* `UPDATE`
* `DELETE`
* `INSERT INTO`
* `CREATE DATABASE`
* `DROP DATABASE`
* `COMMIT` (concept)
* `ROLLBACK` (concept)

#### Clauses:
* `DISTINCT`
* `WHERE`
* `IN`
* `AND`
* `OR`
* `BETWEEN`
* `LIKE`
* `ORDER BY`
* `COUNT`

#### Functions
* `GROUP BY`
* `HAVING`
* `AVG`
* `COUNT`
* `MIN`
* `MAX`
* `SUM`

#### Other Stuff
* What are Indexes good for?
* What's the difference between `WHERE` and `HAVING`?

### The World's Fastest Semi-Complete Explanation of SQL

This is a very brief soup-to-nuts explanation of SQL.  It won't do a particularly good job teaching you specific new tactics but should present a general overview to have going into the reading assignment.  Here we go...

SQL is the language used to talk to many relational databases.  These databases use lots of tables to store different types of data (e.g. "users" and "posts" tables).  Tables are long lists like spreadsheets where each row is a different record (or object, e.g. a single user) and each column is one of that record's attributes (like name, email, etc).  The one column that all tables include is an "ID" column, which gives the unique row numbers, and is called the record's "primary key".

You can "link" tables together by making one of the columns in one table point to the ID of another table, for instance a row in the "posts" table might include the author's ID under the column called "user_id".  Because the "posts" table has the ID of another table in it, that column is called a "foreign key".

#### Setting Stuff Up

SQL lets you do everything.  The first category of commands are for setting up the database (`CREATE DATABASE`), setting up an individual table (`CREATE TABLE`), and similar commands for altering or destroying them.  The setup information for your database is stored in a special file called the "Schema", and this is updated whenever you make changes to the structure of your database.  Think of the schema as saying "here's our database and it's got a couple tables.  The first table is 'users' and it's got columns for 'ID' (which is an integer), 'name' (which is a bunch of characters), 'email' (which is a bunch of characters) ..."

In addition to setting up tables, you can tell your database to only allow unique values in a particular column (e.g. for usernames) or to index a column for faster searching later with `CREATE INDEX`.  Create indexes, which basically do all the hard work of sorting your table ahead of time, for columns that you'll likely be using to search on later (like username)... it will make your database much faster.

SQL likes semicolons at the end of lines and using single quotes (') instead of double quotes(").

#### Mucking Around with Data

Once your database is set up and you've got empty tables to work with, you use SQL's statements to start populating it.  The main actions you want to do are CRUD (which we've seen before) -- Create, Read, Update, and Destroy.  Most of the commands you run will fall under the "Read" category, since you'll spend lots of time asking questions of your data and trying to display it.

Every CRUDdy command in SQL contains a few parts -- the action ("statement"), the table it should run on, and the conditions ("clauses").  If you just do an action on a table without specifying conditions, it will apply to the whole database and you'll probably break something.

For "Destroy" queries, the classic mistake is typing `DELETE * FROM users` without a `WHERE` clause, which removes all your users from the table.  You probably needed to delete just one user, who you would specify based on some (hopefully unique) attribute like "name" or "id" as part of your condition clause, e.g. `DELETE * FROM users WHERE users.id = 1`.  You can do all kinds of common sense things like using `>`, `<`, `<=` etc. comparison operators to specify groups of rows to run commands on or logical operators like `AND`, `OR`, `NOT` etc to chain multiple clauses together, e.g. `DELETE * FROM users WHERE id > 12 AND name = 'foo'`.

"Create" queries use `INSERT INTO` and you'll need to specify which columns to insert stuff into and then which values to put in those columns, which looks something like `INSERT INTO Users (name, email) VALUES ('foobar','foo@bar.com');`.  This is one of the few queries that you don't need to be careful about which rows you've selected since you're actually just adding new ones into the table.

"Update" queries use `UPDATE` and you'll need to tell it what data to `SET` (using key="value" pairs) and which rows to do those updates for.  Be careful because if your `WHERE` clause finds multiple rows (e.g. if you've searched based on a common first name), they'll all get updated. A standard query for updating a user's email may look something like the following (though in the real world you'd search on ID because it's always unique):

~~~sql
  UPDATE Users
  SET name='barfoo', email='bar@foo.com'
  WHERE email='foo@bar.com';
~~~

"Read" queries, which use `SELECT`, are the most common, e.g. `SELECT * FROM users WHERE created_at < '2013-12-11 15:35:59 -0800'`.  The `*` you see just says "all the columns".  Specify a column using both the table name and the column name.  You can get away with just the column name for simple queries but as soon as there are more than one table involved, SQL will yell at you so just always specify the table name: `SELECT users.id, users.name FROM users`.

A close cousin of `SELECT`, for if you only want unique values of a column, is `SELECT DISTINCT`.  Say you want a list of all the different names of your users without any duplicates... try `SELECT DISTINCT users.name FROM users`.

#### Mashing Tables Together

If you want to get all the posts created by a given user, you need to tell SQL which columns it should use to zip the tables together with the `ON` clause. Perform the "zipping" with the `JOIN` command.  But wait, if you mash two tables together where the data doesn't perfectly match up (e.g. there are multiple posts for one user), which rows do you actually keep?  There are four different possibilities:

Note: the "left" table is the original table (the one that the `FROM` clause was `ON`), e.g. "users" in examples below.*

See ["A visual explanation of sql joins"](http://blog.codinghorror.com/a-visual-explanation-of-sql-joins) by Jeff Atwood for good visuals.*

1. `INNER JOIN`, aka `JOIN` -- Your best friend and 95% of what you'll use.  Keeps only the rows from both tables where they match up.  If you asked for all the posts for all users (`SELECT * FROM users JOIN posts ON users.id = posts.user_id`), it would return only the users who have actually written posts and only posts which have specified their author in the `user_id` column.  If an author has written multiple posts, there will be multiple rows returned (but the columns containing the user data will just be repeated).
1. `LEFT OUTER JOIN` -- keep all the rows from the left table and add on any rows from the right table which match up to the left table's.  Set any empty cells this produces to `NULL`.  E.g. return all the users whether they have written posts or not.  If they do have posts, list those posts as above.  If not, set the columns we asked for from the "posts" table to `NULL`.
2. `RIGHT OUTER JOIN` -- the opposite... keep all rows in the right table.
3. `FULL OUTER JOIN` -- Keep all rows from all tables, even if there are mismatches between them.  Set any mismatched cells to `NULL`.

Joins naturally let you specify conditions too, like if you only want the posts from a specific user: `SELECT * FROM users JOIN posts ON users.id = posts.user_id WHERE users.id = 42`.

Read through [W3 Schools' Joins lesson](http://www.w3schools.com/sql/sql_join.asp) for a better explanation.

#### Using Functions to Aggregate Your Data

When you run a vanilla SQL query, you often get back a bunch of rows.  Sometimes you want to just return a single relevant value that aggregates a column, like the `COUNT` of posts a user has written.  In this case, just use one of the helpful "aggregate" functions offered by SQL (most of which you'd expect to be there -- functions like `SUM` and `MIN` and `MAX` etc).  You include the function as a part of the `SELECT` statement, like `SELECT MAX(users.age) FROM users`.  The function will operate on just a single column unless you specify `*`, which only works for some functions like `COUNT` (because how would you `MAX` a column for "name"?).

You often see aliases (`AS`) used to rename columns or aggregate functions so you can call them by that alias later, e.g. `SELECT MAX(users.age) AS highest_age FROM users` will return a column called `highest_age` with the maximum age in it.

Now we're getting into the fun stuff.  Aggregate functions like `COUNT` which return just a single value for your whole dataset are nice, but they become really useful when you want to use them on very specific chunks of your data and then group them together, e.g. displaying the `COUNT` of posts for EACH user (as opposed to the count of all posts by all users).  That would look like:

~~~sql
  SELECT users.id, users.name, COUNT(posts.*) AS posts_written
  FROM users
  JOIN posts ON users.id = posts.user_id
  GROUP BY users.id;
~~~

See [w3 schools](http://www.w3schools.com/sql/trysql.asp?filename=trysql_select_groupby) and play around with the SQL in the window (try deleting the `GROUP BY` line) for an interactive visual.

The last nifty trick is if you want to only display a subset of your data.  In a normal situation, you'd use a `WHERE` clause to narrow it down.  But if you've used an aggregate function like `COUNT` (say to get the count of posts written for each user in the example above), `WHERE` won't work anymore.  So to conditionally retrieve records based on aggregate functions, you use the `HAVING` function, which is essentially the `WHERE` for aggregates.  So say I only want to display users who have written more than 10 posts:

~~~sql
  SELECT users.id, users.name, COUNT(posts.*) AS posts_written
  FROM users
  JOIN posts ON users.id = posts.user_id
  GROUP BY users.id
  HAVING posts_written >= 10;
~~~

Try going back to [the W3 example](http://www.w3schools.com/sql/trysql.asp?filename=trysql_select_groupby) and joining the `Customers` and the `Orders` tables to get the number of orders in each country and adding the line `HAVING COUNT(*) > 10;` after `GROUP BY` (and delete the extra semicolon in the previous line).

You probably got lost somewhere in the above explanation and that's just fine... it's covering way more stuff than anyone can pick up in 10 minutes.  The assigned reading will do a better job of explaining things but, more importantly, you'll get plenty of opportunities to solidify your understanding by applying it in the project.  If you've still got blind spots, check out the Additional Resources section below.  Fear not and stick with it!

### SQL is faster than Ruby!

Learning this stuff is particularly relevant because it's MUCH faster for you to build queries that use SQL intelligently than to just grab a whole bunch of data out of your database and then use Ruby to process it.  For instance, if you want all the unique names of your users, you COULD just grab the whole list from your database using SQL like `SELECT users.name FROM users` (which Active Record will do for you with `User.select(:name)`) then remove duplicates using Ruby's `#uniq` method, e.g. `User.select(:name).uniq`... but that requires you to pull all that data out of your database and then put it into memory and then iterate through it using Ruby.  Use `SELECT DISTINCT users.name FROM users` instead to have SQL do it all in one step.

SQL is built to be fast.  It has a special query optimizer which takes a look at the whole query you're about to run and it figures out exactly which tables it needs to join together and how it can most quickly execute the query.  The difference between using `SELECT` and `SELECT DISTINCT` is negligible compared to the time cost of doing it in Ruby.  Learning your SQL will help you write Active Record queries that can do more which will make your app much faster.


### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Go through this interactive SQL tutorial from [SQL Teaching](https://www.sqlteaching.com/)
  2. Go through this more in-depth interactive SQL tutorial from [SQL Bolt](http://sqlbolt.com)
  3. Go through the basics at [Part 1](http://www.sqlcourse.com/index.html) and the advanced at [Part 2](http://www.sqlcourse2.com/index.html) of SQL Course
</div>

### Conclusion

SQL can be a tricky set of concepts to wrap your head around, particularly when it comes to conditionally displaying and grouping the results of multiple joins.  We've emphasized that this stuff is useful for understanding what's going on behind the scenes with Rails and you'll get a chance to apply it in the project.  Everything up to vanilla joins and vanilla aggregate functions is core knowledge that you should really make an effort to assimilate.

If you never quite get to the point where you're comfortable with the really advanced concepts, you'll luckily not need to use them except in a small fraction of situations in your future.  It's good to learn it all up front but you'll probably find yourself Googling for how to perform certain advanced queries when the time comes anyway.

The next step, once you've had a chance to practice this all in the project, is to apply it to Rails with Active Record.  You'll quickly find that Active Record makes your life much, much, much better.  Just don't forget about ol' SQL when you've moved onto those better and brighter things, okay?

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.


* Odinite Hunter D made his excellent notes into a [Github Book on SQL](https://app.gitbook.com/@hunter-ducharme/s/sql-basics/) which you should totally check out if you want a decent resource.
* [SQL "tutorial" from tutorialspoint](http://www.tutorialspoint.com/sql/index.htm)... doesn't really give much guidance, but can be a useful reference for the language.
* [A beginners guide to SQL](http://www.sohamkamani.com/blog/2016/07/07/a-beginners-guide-to-sql/) by Soham Kamani.
* [SQL Flashcards](https://flashcards.github.io/sql/introduction.html) by flashcards.github.io.
* If you feel like doing more SQL exercises, make sure to check out [SQL Exercises](http://www.sql-ex.com/) .
