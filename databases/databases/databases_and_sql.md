### Introduction

Data is the core of any good web app and a good working knowledge of SQL will take you a long way.  That knowledge lets you not just understand what's going on behind the scenes with your ORM tool (e.g., Active Record in Rails, or Prisma in NodeJS) but also to feel comfortable asking more complicated questions of your data.  And that's really what SQL is all about -- asking questions of your database and occasionally also adding or changing things in it.  Querying can be incredibly useful for you.

In more straightforward cases, you might want to display all users who signed up in December via the promotion code "FREESTUFF."  You might want to display all comments created by the current user and sorted by topic and creation date.  In more complex cases, you may want to show a list of all the orders shipped to states with more than 1,000 users by quantity and total order value.  Or, for internal reasons, you might ask marketing analysis questions like which promotion channels produce users who meet your specified engagement criteria of reading five articles per work week.

All of those examples involve you engaging with your database.  Luckily, many databases (the ones we'll be focusing on) speak SQL and luckily SQL really only has a dozen or so words that you'll consistently use out of a few dozen total.  So it's not a large language, it's much more about the concepts behind it.

You will start with the questions like the ones above and then have to figure out how to ask them properly of your database, which likely has a bunch of different tables in it.  Everyone probably visualizes it a bit differently, but finding a way to visualize what's going on when you do SQL queries is pretty important. We actually think of Excel tables moving in our heads and combining with each other and reshuffling as necessary. To each their own.

We'll move beyond just the `SELECT users.* FROM users LIMIT 1` queries and into more dynamic topics like joining tables together, performing calculations on the results, and grouping results together in new ways.

<!-- markdownlint-disable-next-line TOP004 -->
#### A note on resources

SQL is one of those topics that's been stored away in dusty old technical manuals and 90's style websites. Even the best books out there can make it seem oddly complicated because they tend to write for the database engineer who actually does need to know all the nitty gritty details.

Though the prevalence of web applications these days has grown the demand among new users to focus on understanding the *concepts* of SQL, the learning tools haven't really caught up. We'll do our best to impart those concepts using the tools available.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What a Primary Key is.
- What Foreign Keys are.
- What a Schema is.
- How to use various SQL statements like `SELECT`, `CREATE TABLE`, `UPDATE`, `DELETE` and more.
- How to use various SQL clauses like `WHERE`, `LIKE`, `DISTINCT` and more.
- How to use various SQL functions like `AVG`, `COUNT`, `SUM` and more.
- What Indexes are good for.
- What the difference between `WHERE` and `HAVING` is.

### The world's fastest semi-complete explanation of SQL

This is a very brief soup-to-nuts explanation of SQL.  It won't do a particularly good job teaching you specific new tactics but should present a general overview to have going into the reading assignment.  Here we go...

SQL is the language used to talk to many relational databases.  These databases use lots of tables to store different types of data (e.g., `users` and `posts` tables).  Tables are long lists like spreadsheets where each row is a different record (or object, e.g., a single user) and each column is one of that record's attributes (like name, email, etc.).  The one column that all tables include is an `ID` column, which gives the unique row numbers, and is called the record's "primary key."

You can "link" tables together by making one of the columns in one table point to the ID of another table. For instance, a row in the `posts` table might include the author's ID under the column called `user_id`.  <span id='foreign-key'>Because the `posts` table has the ID of another table in it, that column is called a "foreign key."</span>

#### Setting stuff up

SQL lets you do everything.  The first category of commands are for setting up the database (`CREATE DATABASE`), setting up an individual table (`CREATE TABLE`), and similar commands for altering or destroying them.  <span id='schema'>The setup information for your database is stored in a special file called the "Schema", and this is updated whenever you make changes to the structure of your database</span>.  Think of the schema as saying, "Here's our database, and it's got a couple of tables.  The first table is 'users', and it's got columns for 'ID' (which is an integer), 'name' (which is a bunch of characters), 'email' (which is a bunch of characters) ..."

In addition to setting up tables, you can tell your database to only allow unique values in a particular column (e.g., for usernames) or to index a column for faster searching later with `CREATE INDEX`.  Create indexes, which basically do all the hard work of sorting your table ahead of time, for columns that you'll likely be using to search on later (like username)... it will make your database much faster.

SQL likes semicolons at the end of lines and using single quotes (') instead of double quotes(").

#### Mucking around with data

Once your database is set up and you've got empty tables to work with, you use SQL's statements to start populating it.  The main actions you want to do are CRUD (which we've seen before) -- Create, Read, Update, and Destroy.  Most of the commands you run will fall under the "Read" category, since you'll spend lots of time asking questions of your data and trying to display it.

<span id='command-parts'>Every CRUDdy command in SQL contains a few parts -- the action ("statement"), the table it should run on, and the conditions ("clauses")</span>.  If you just do an action on a table without specifying conditions, it will apply to the whole table and you'll probably break something.

For "Destroy" queries, the classic mistake is typing `DELETE FROM users` without a `WHERE` clause, which removes all your users from the table.  You probably needed to delete just one user, who you would specify based on some (hopefully unique) attribute like `name` or `id` as part of your condition clause, e.g., `DELETE FROM users WHERE users.id = 1`.  You can do all kinds of common sense things, such as using comparison operators (`>`, `<`, `<=` etc.) to specify groups of rows to run commands on, or logical operators (`AND`, `OR`, `NOT` etc.) to chain multiple clauses together, e.g., `DELETE FROM users WHERE id > 12 AND name = 'foo'`.

"Create" queries use `INSERT INTO` and you'll need to specify which columns to insert values into, followed by the values themselves:

```sql
INSERT INTO users (name, email) VALUES ('foobar', 'foo@bar.com');
```

Note: It’s technically possible to omit the column names, but this is considered poor practice and is generally discouraged.

This is one of the few queries that you don't need to be careful about which rows you've selected since you're actually just adding new ones into the table.

"Update" queries use `UPDATE` and you'll need to tell it what data to `SET` (using key="value" pairs) and which rows to do those updates for.  Be careful because if your `WHERE` clause finds multiple rows (e.g., if you've searched based on a common first name), they'll all get updated. A standard query for updating a user's email may look something like the following (though in the real world you'd search on ID because it's always unique):

```sql
  UPDATE users
  SET name='barfoo', email='bar@foo.com'
  WHERE email='foo@bar.com';
```

<span id='sql-read'>"Read" queries, which use `SELECT`, are the most common, e.g., `SELECT * FROM users WHERE created_at < '2013-12-11 15:35:59 -0800'`</span>.  The `*` you see just says "all the columns."  Specify a column using both the table name and the column name. You can get away with just the column name for queries of one table, but as soon as there is more than one table involved, SQL will yell at you so just always specify the table name: `SELECT users.id, users.name FROM users`.

A close cousin of `SELECT`, for when you only want unique values of a column, is `SELECT DISTINCT`.  Say you want a list of all the different names of your users without any duplicates... try `SELECT DISTINCT users.name FROM users`.

#### Mashing tables together

If you want to get all the posts created by a given user, you need to tell SQL which columns it should use to zip the tables together with the `ON` clause. Perform the "zipping" with the `JOIN` command.  But wait, if you mash two tables together where the data doesn't perfectly match up (e.g., there are multiple posts for one user), which rows do you actually keep?  There are four different possibilities:

<div class="lesson-note lesson-note--tip" markdown="1">

The "left" table is the original table (the one that the `FROM` clause was `ON`), e.g., `users` in examples below.

</div>

1. `INNER JOIN`, aka `JOIN` -- Your best friend and 95% of what you'll use.  <span id='inner-join'>Keeps only the rows from both tables where they match up</span>.  If you asked for all the posts for all users (`SELECT * FROM users JOIN posts ON users.id = posts.user_id`), it would return only the users who have actually written posts and only posts which have specified their author in the `user_id` column.  If an author has written multiple posts, there will be multiple rows returned (but the columns containing the user data will just be repeated).
1. `LEFT OUTER JOIN` -- Keep all the rows from the left table and add on any rows from the right table which match up to the left table's.  Set any empty cells this produces to `NULL`.  E.g., return all the users whether they have written posts or not.  If they do have posts, list those posts as above.  If not, set the columns we asked for from the `posts` table to `NULL`.
1. `RIGHT OUTER JOIN` -- The opposite... keep all rows in the right table.
1. `FULL OUTER JOIN` -- Keep all rows from all tables, even if there are mismatches between them.  Set any mismatched cells to `NULL`.

Joins naturally let you specify conditions too, like if you only want the posts from a specific user: `SELECT * FROM users JOIN posts ON users.id = posts.user_id WHERE users.id = 42`.

*See ["A Visual Explanation of SQL Joins"](http://blog.codinghorror.com/a-visual-explanation-of-sql-joins) by Jeff Atwood for good visuals.*

Read through [W3 Schools' Joins lesson](http://www.w3schools.com/sql/sql_join.asp) for a better explanation.

#### Using functions to aggregate your data

When you run a vanilla SQL query, you often get back a bunch of rows.  Sometimes you want to just return a single relevant value that aggregates a column, like the `COUNT` of posts a user has written.  In this case, just use one of the helpful "aggregate" functions offered by SQL (most of which you'd expect to be there -- functions like `SUM` and `MIN` and `MAX` etc.).  <span id='aggregate-function'>You include the function as a part of the `SELECT` statement, like `SELECT MAX(users.age) FROM users`</span>.  The function will operate on just a single column unless you specify `*`, which only works for some functions like `COUNT` (since `COUNT(*)` counts all rows, but something like `MAX(*)` doesn’t make sense, because what would it mean to take the maximum of everything?).

You often see aliases (`AS`) used to rename columns or aggregate functions so you can call them by that alias later, e.g., `SELECT MAX(users.age) AS highest_age FROM users` will return a column called `highest_age` with the maximum age in it.

Now we're getting into the fun stuff.  Aggregate functions like `COUNT` which return just a single value for your whole dataset are nice, but they become really useful when you want to use them on very specific chunks of your data and then group them together, e.g., displaying the `COUNT` of posts for EACH user (as opposed to the count of all posts by all users).  That would look like:

```sql
  SELECT users.id, users.name, COUNT(posts.id) AS posts_written
  FROM users
  JOIN posts ON users.id = posts.user_id
  GROUP BY users.id, users.name;
```

Note that grouping by `users.name` in addition to `users.id` improves clarity and aligns with best practices by explicitly including all selected non-aggregated columns in the `GROUP BY` clause, though it might not be strictly necessary for most databases.
See [W3Schools' browser-based SQL playground](http://www.w3schools.com/sql/trysql.asp?filename=trysql_select_groupby) for an interactive visual.

The last nifty trick is if you want to only display a subset of your data.  In a normal situation, you'd use a `WHERE` clause to narrow it down.  But if you've used an aggregate function like `COUNT` (say to get the count of posts written for each user in the example above), `WHERE` won't work anymore.  <span id='having-clause'>So to conditionally retrieve records based on aggregate functions, you use the `HAVING` clause, which is essentially the `WHERE` for aggregates</span>.  So say you only want to display users who have written more than 10 posts:

```sql
  SELECT users.id, users.name, COUNT(posts.id) AS posts_written
  FROM users
  JOIN posts ON users.id = posts.user_id
  GROUP BY users.id, users.name
  HAVING COUNT(posts.id) >= 10;
```

Try going back to [W3Schools' browser-based SQL playground](http://www.w3schools.com/sql/trysql.asp?filename=trysql_select_groupby) and joining the `Customers` and the `Orders` tables to get the number of orders in each country and adding the line `HAVING COUNT(*) > 10;` after `GROUP BY` (and delete the extra semicolon in the previous line).

You probably got lost somewhere in the above explanation and that's just fine... it's covering way more stuff than anyone can pick up in 10 minutes.  The assigned reading will do a better job of explaining things but, more importantly, you'll get plenty of opportunities to solidify your understanding by applying it in the project.  If you've still got blind spots, check out the Additional Resources section below.  Fear not and stick with it!

### SQL is faster than your code!

Learning this stuff is particularly relevant because it's MUCH faster for you to build queries that use SQL intelligently than to just grab a whole bunch of data out of your database and then use a programming language (like Ruby or JavaScript) to process it.  For instance, if you want all the unique names of your users, you COULD just grab the whole list from your database using SQL like `SELECT users.name FROM users` then use a JavaScript/Ruby method to remove duplicates... but that requires you to pull all that data out of your database and then put it into memory and then iterate through it in your code.  Use `SELECT DISTINCT users.name FROM users` instead to have SQL do it all in one step.

SQL is built to be fast.  It has a special query optimizer which takes a look at the whole query you're about to run and it figures out exactly which tables it needs to join together and how it can most quickly execute the query.  The difference between using `SELECT` and `SELECT DISTINCT` is negligible compared to the time cost of doing it yourself.  Learning your SQL will help you write better queries that can do more which will make your app much faster.

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Go through this [interactive SQL tutorial from SQL Teaching](https://www.sqlteaching.com/).
  1. Go through this more in-depth [interactive SQL tutorial from SQL Bolt](http://sqlbolt.com/).

</div>

### Conclusion

SQL can be a tricky set of concepts to wrap your head around, particularly when it comes to conditionally displaying and grouping the results of multiple joins. Everything up to vanilla joins and vanilla aggregate functions is core knowledge that you should really make an effort to assimilate.

If you never quite get to the point where you're comfortable with the really advanced concepts, you'll luckily not need to use them except in a small fraction of situations in your future.  It's good to learn it all up front but you'll probably find yourself Googling for how to perform certain advanced queries when the time comes anyway.

The next step, once you've had a chance to practice this all in the project, is to apply it to your codebase in the upcoming courses.  You'll quickly find that using ORM tools makes your life much, much, much better.  Just don't forget about ol' SQL when you've moved onto those better and brighter things, okay?

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is the difference between a foreign key and a primary key?](#foreign-key)
- [Where is the setup information for your database stored?](#schema)
- [What are the important parts of a SQL command?](#command-parts)
- [Which SQL statement is associated with "Read" from the CRUD acronym?](#sql-read)
- [Which `JOIN` statement keeps only the rows from both tables where they match up?](#inner-join)
- [How do you use an aggregate function?](#aggregate-function)
- [In which situation would you use the `HAVING` clause?](#having-clause)
- [Why can't I just use code to process my database data?](#sql-is-faster-than-your-code)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- SQLCourse's [beginner course](https://www.sqlcourse.com/beginner-course/) and [advanced course](https://www.sqlcourse.com/advanced-course/) are great resources if you need more practice.
- Odinite Hunter D made his excellent notes into a [Git Book on SQL](https://hunter-ducharme.gitbook.io/sql-basics) which you should totally check out if you want a decent resource.
- [SQL "tutorial" from tutorialspoint](http://www.tutorialspoint.com/sql/index.htm)... doesn't really give much guidance, but can be a useful reference for the language.
- [A Beginners Guide to SQL](http://www.sohamkamani.com/blog/2016/07/07/a-beginners-guide-to-sql/) by Soham Kamani.
- [SQL Flashcards](https://flashcards.github.io/sql/introduction.html) by flashcards.github.io.
- If you feel like doing more SQL exercises, make sure to check out [SQL Exercises](http://www.sql-ex.com/).
