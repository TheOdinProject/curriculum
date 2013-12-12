# Databases and SQL

## Introduction

Data is the core of any good web app and a good working knowledge of SQL will take you a long way.  That knowledge lets you not just understand what's going on behind the scenes with your ORM tool (e.g. Active Record) but also to feel comfortable asking more complicated questions of your data.  And that's really what SQL is all about -- asking questions of your database and occasionally also adding or changing things in it.  Querying can be incredibly useful for you.  

In more straightforward cases, you might want to display all users who signed up in December via the promotion code "FREESTUFF".  You might want to display all comments created by the current user and sorted by topic and creation date.  In more complex cases, you may want to show a list of all the orders shipped to states with more than 1,000 users by quantity and total order value.  Or, for internal reasons, you might ask marketing analysis questions like which promotion channels produce users who meet your specified engagement criteria.  

All of those examples involve you engaging with your database.  Luckily, many databases (the ones we'll be focusing on) speak SQL and luckily SQL really only has a dozen or so words that you'll consistently use out of a few dozen total.  So it's not a large language, it's much more about the concepts behind it.  You will start with the questions like the ones above and then figure out how to ask them properly of your database, which likely has a bunch of different tables in it.  Everyone probably visualizes it a bit differently, but I actually think of the tables moving in my head and combining with each other and reshuffling appropriately.  To each their own.

This lesson assumes you've already completed the [Databases intro in the Web Development 101 course](http://www.theodinproject.com/courses/web-development-101/lessons/databases).  We'll move beyond just the simple `SELECT "users".* FROM "users" LIMIT 1` queries (this one is used whenever you ask for the first user with `User.first`) and into more dynamic topics like joining tables together, performing calculations on the results, and grouping results together in new ways.

All this stuff is being used by Rails behind the scenes so understanding it will make you much better at writing queries in Rails.  This is why we're going over databases before learning Active Record.  We'll do the same thing with forms -- you'll learn how to build them in HTML and then how to use Rails to make them for you.  

## A Note on Resources

SQL is one of those topics that's been stored away in dusty old technical manuals and 90's style websites.  Even the best books out there can make it seem oddly complicated because they tend to write for the database engineer who actually does need to know all the nitty gritty.  Though now the prevalence of web applications has grown the demand among new users to understand the *concepts* of SQL, the learning tools haven't really caught up. We'll do our best to impart those concepts using the tools available.

## You Will Need To Understand

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
* `GROUP BY`
* `COUNT`
* `HAVING`

#### Other Stuff

* What are Indexes good for?
* What's the difference between `WHERE` and `HAVING`?
* 

## The World's Fastest Explanation of SQL

The reading assignment will cover it, but here's the world's fastest explanation of SQL.  It won't do a good job teaching you specific new tactics but should present an okay overview to have going into the reading:

SQL is the language used to talk to many relational databases.  These databases use lots of tables to store different types of data (e.g. "users" and "posts" tables).  Tables are long lists like spreadsheets where each row is a different object (like a user) and each column is one of that object's attributes (like name, email, etc).  The one column that all tables include is an "ID" column, which gives the unique row numbers, and is called its "primary key". 

You can "link" tables together by making one of the columns in one table point to the ID of another table, for instance a row in the "posts" table might include the author's ID under the column called "user_id".  Because the "posts" table has the ID of another table in it, that column is called a "foreign key".  

### Setting Stuff Up

SQL lets you do everything.  The first category of commands are for setting up the database (`CREATE DATABASE`), setting up an individual table (`CREATE TABLE`), and similar commands for altering or destroying them.  The setup information for your database is stored in a special file called the "Schema", and this is updated whenever you make changes to the structure of your database.  Think of the schema as saying "here's our database, we've got a couple tables, the first table is 'users' and it's got columns for 'ID' (which is an integer), 'name' (which is a bunch of characters), 'email' (which is a bunch of characters) ..." 

In addition to setting up tables, you can tell your database to only allow unique values in a particular column (e.g. for usernames) or to index a column for faster searching later.  Create indexes, which basically do all the hard work of sorting your table ahead of time, for columns that you'll likely be using to search on (like username), it will make your database much faster.

SQL likes semicolons at the end of lines and using single quotes (') instead of double quotes(").

### Mucking Around with Data

Once your database is set up and you've got empty tables to work with, you use SQL's statements to start populating it.  The main actions you want to do are CRUD (which we've seen before) -- Create, Read, Update, and Destroy.  Most of the commands you run will fall under the "Read" category, since you'll spend lots of time asking questions of your data and trying to display it.

Every CRUDdy command in SQL contains a few parts -- the action ("statement"), the table it should run on, and the conditions ("clauses").  If you just do an action on a table, it will apply to the whole database and you'll probably break something.  

For "Destroy" queries, the classic mistake is typing `DELETE * FROM users`, which removes all your users table.  You probably needed to delete just one user, who you would specify based on some (hopefully unique) attribute like "name" or "id", e.g. `DELETE * FROM users WHERE users.id = 1`.  You can do all kinds of common sense things like using `>`, `<`, `<=` etc. comparison operators to specify groups of rows to run commands on or `AND`, `OR` etc logical operators to chain multiple clauses together, e.g. `DELETE * FROM users WHERE id > 12 AND name = 'foo'`.

"Create" queries use `INSERT INTO` and you'll need to specify which columns to insert stuff into and then which values to put in those columns, which looks something like `INSERT INTO Users (name, email) VALUES ('foobar','foo@bar.com');`.  This is one of the few queries that you don't need to be careful about which rows you've selected since you're actually just adding new ones into the table.

"Update" queries use `UPDATE` and you'll need to tell it what data to `SET` (using key="value" pairs) and which rows to do those updates for.  Be careful because if your `WHERE` clause finds multiple rows (e.g. if you've searched based on first name), they'll all get updated. A standard query for updating a user's email may look something like (though in the real world you'd search on ID because it's always unique): 

    UPDATE Users 
    SET name='barfoo', email='bar@foo.com' 
    WHERE email='foo@bar.com';`

"Read" queries, which use `SELECT` are the most common, e.g. `SELECT * FROM users WHERE created_at < '2013-12-11 15:35:59 -0800'`.  The `*` you see just says "all the columns".  Specify a specific column using the table name and the column name.  You can get away with just the column name for simple queries but as soon as there are more than one table involved, SQL will yell at you so just always specify the table name: `SELECT users.id, users.name FROM users`.

### Mashing Tables Together

If you want to get all the posts created by a given user, you need to tell SQL which columns it should use to zip the tables together with the `ON` clause. Perform the "zipping" with the `JOIN` command.  But wait, if you mash two tables together where the data doesn't perfectly match up (e.g. there are multiple posts for one user), which rows do you actually keep?  There are actually four different posisbilities 

Note: the "left" table is the original table with the `FROM` clause, e.g. "users" in the users-writing-posts example.

See ["A visual explanation of sql joins"](http://www.codinghorror.com/blog/2007/10/a-visual-explanation-of-sql-joins.html) by Jeff Atwood for good visuals.

1. `INNER JOIN`, aka `JOIN` -- Your best friend and 95% of what you'll use.  Keeps only the rows from both tables where they match up.  If you asked for all the posts for all users (`SELECT * FROM users JOIN posts ON users.id = posts.user_id`), it would return only the users who actually have posts to their name and only posts which have specified their author in the `user_id` column.  If an author has written multiple posts, there will be multiple rows returned (but the columns containing the user data will just be repeated).
1. `LEFT OUTER JOIN` -- keep all the rows from the left table and add on any rows from the right table which match up to the left table's.  Set any empty cells this produces to `NULL`.  E.g. return all the users whether they have written posts or not.  If they do have posts, list those posts as above.  If not, set the columns we asked for from the "posts" table to `NULL`.
2. `RIGHT OUTER JOIN` -- the opposite... keep all rows in the right table.
3. `FULL OUTER JOIN` -- Keep all rows from all tables, even if there are mismatches between them.  Set any mismatched cells to `NULL`.

Joins naturally let you specify conditions too, like if you only want the posts from a specific user: `SELECT * FROM users JOIN posts ON users.id = posts.user_id WHERE users.id = 42`.



## Your Assignment

1. If you haven't already done so, be sure to do the [Databases lesson in the Web Development 101 course](http://www.theodinproject.com/courses/web-development-101/lessons/databases).
2. 

## Conclusion

## Additional Resources

* [SQL "tutorial" from tutorialspoint](http://www.tutorialspoint.com/sql/index.htm)... doesn't really give much guidance, but can be a useful reference for the language.