### Introduction

Now that we have PostgreSQL up and running on our machine, it's time to work with it.

<div class="lesson-note lesson-note--critical" markdown="1">

Make sure you've completed the [SQL course](https://www.theodinproject.com/paths/full-stack-javascript/courses/databases).

This lesson and all subsequent lessons will assume you understand SQL syntax and concepts.

</div>

For brevity's sake, we'll refer to database as db from now on.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Setting up a new db in PostgreSQL shell
- Setting up and querying with node-postgres
- Using a script to populate the db

### Setting up an Express app

Let's start by creating an Express application. It will just have one feature - add usernames provided by the user to the db. Here are the expected routes and their functionalities:

- `GET /` - to log available usernames in the DB to the terminal. For now, just put in a simple `console.log("usernames will be logged here - wip")`.
- `GET /new` - to display a HTML form to the user with one username input text field. It will submit to the next route.
- `POST /new` - will save the incoming username data to the DB. For now, just log `console.log("username to be saved: ", req.body.username)`.

Move on to the next section once you have the above functionality working. Scope relevant code to the `routes` and `controllers` folders. Since there's only one view (`GET /new`) to take care of, it's up to you whether you want to use `ejs` or make do with plain ol' HTML.

### Setting up the db

Enter the PostgreSQL shell by running `psql` in your terminal. You can view the current dbs using the `\l` command. Let's create a new db by running the following SQL statement:

```sql
CREATE DATABASE top_users;
```

`\l` again to see if the db was created. Now let's connect to the db:

```sql
\c top_users
```

Verify that the `psql` prompt should be:

```sql
top_users=#
```

Now create a table and its columns to store `username` data:

```sql
CREATE TABLE usernames (
   id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   username VARCHAR ( 255 ) 
);
```

Verify that the table has been created by running `\d`. You should see the following two tables in the output (we've skipped some output details for brevity):

```bash
|       Name       |   Type   |
+ -----------------+----------+
| usernames        | table    |
| usernames_id_seq | sequence |
```

<div class="lesson-note" markdown="1">

#### Identity column

Wait a minute, what's this `usernames_id_seq` thing?

The `GENERATED ALWAYS AS IDENTITY` clause is the culprit. It defined the `id` column as an [identity column](https://www.postgresql.org/docs/current/sql-createtable.html#SQL-CREATETABLE-PARMS-GENERATED-IDENTITY). PostgreSQL now automatically generates a value for this column. By default it starts at 1 and increments by 1 for each new row. Additionally, PostgreSQL implicitly creates `usernames_id_seq`, which is a sequence object, that keeps track of the next value to be used.

</div>

Woohoo, we now have a db and a table... a lonely table. Not for long:

```sql
INSERT INTO usernames (username)
VALUES ('Mao'), ('nevz'), ('Lofty');
```

Verify:

```sql
SELECT * from usernames;
```

### Using node-postgres in Express

We can work with PostgreSQL in our Express application through [`node-postgres`](https://github.com/brianc/node-postgres) (or `pg` for short). It is a library that we'll use to interface with the PostgreSQL db. Install it with:

```bash
npm install pg
```

We can then initialize it in our application with the necessary connection information. Create a `db` folder, and a new file `db/pool.js` with:

```javascript
const { Pool } = require("pg");

// All of the following properties should be read from environment variables
// We're hardcoding them here for simplicity
module.exports = new Pool({
  host: "localhost", // or wherever the db is hosted
  user: "<role_name>",
  database: "top_users",
  password: "<role_password>",
  port: 5432 // The default port
});
```

An alternative to defining the connection information is through a [Connection URI](https://node-postgres.com/features/connecting#connection-uri). You'll likely be using connection URIs when connecting with a hosted database service. Here's what it would look like based on the above properties:

```javascript
const { Pool } = require("pg");

// Again, this should be read from an environment variable
module.exports = new Pool({
  connectionString: "postgresql://<role_name>:<role_password>@localhost:5432/top_users"
});
```

Pick whichever method you want to use and let's continue.

<div class="lesson-note" markdown="1">

#### Two ways of connecting with pg

`pg` has two ways to connect to a db: a client and a pool.

Client is an individual connection to the DB, which you manually manage. You open a connection, do your query, then close it. This is fine for one-off queries, but can become expensive if you're dealing with a lot of queries. Wouldn't this problem be alleviated if we could somehow hold onto a client? Yes!

Enter pool. As the name suggests, it's a pool of clients. A pool holds onto connections. And when you query, it'll programmatically open a new connection unless there's an existing spare one. Perfect for web servers.

</div>

### Querying with pg

With our initialized `Pool`, we can use the `query` method. Create a new `db/queries.js` file. Upon revising our project requirements, we understand we need two db interactions: getting all usernames and inserting a new username. Let's define these functions:

```javascript
const pool = require("./pool");

async function getAllUsernames() {
  const { rows } = await pool.query("SELECT * FROM usernames");
  return rows;
}

async function insertUsername(username) {
  await pool.query("INSERT INTO usernames (username) VALUES ($1)", [username]);
}

module.exports = {
  getAllUsernames,
  insertUsername
};
```

<div class="lesson-note" markdown="1">

#### Parameterization

What's with the `$1` in the insert query?

Alternatively, the query could look like:

```javascript
await pool.query("INSERT INTO usernames (username) VALUES ('" + username + "')");
```

We're passing user entered value i.e. `username` directly into our query. A nefarious user could enter something like `sike'); DROP TABLE usernames; --` and wreak havoc. Scary stuff. This is called [SQL injection](https://en.wikipedia.org/wiki/SQL_injection).

`pg` provides [query parameterization](https://node-postgres.com/features/queries#parameterized-query) to prevent this. Instead of passing user input directly, we pass it in an array as the second argument. `pg` handles the rest.

</div>

Invoke the above two functions in the specific controllers (you might have different function names etc. The important thing is to understand how the db functions are invoked):

```javascript
const db = require("../db/queries");

async function getUsernames(req, res) {
  const usernames = await db.getAllUsernames();
  console.log("Usernames: ", usernames);
  res.send("Usernames: " + usernames.map(user => user.username).join(", "));
}

async function createUsernameGet(req, res) {
  // render the form
}

async function createUsernamePost(req, res) {
  const { username } = req.body;
  await db.insertUsername(username);
  res.redirect("/");
}

module.exports = {
  getUsernames,
  createUsernameGet,
  createUsernamePost
};
```

Take your app for a spin, hopefully it works as expected.

### Populate the db via a script

You might have noticed how cumbersome it is to create a table and populate it with data. Luckily, we have the power of c(n)ode by our side, let's automate it via a script. Create a new file `db/populatedb.js`.

```javascript
#! /usr/bin/env node

const { Client } = require("pg");

const SQL = `
CREATE TABLE IF NOT EXISTS usernames (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR ( 255 )
);

INSERT INTO usernames (username) 
VALUES
  ('Bryan'),
  ('Odin'),
  ('Damon');
`;

async function main() {
  console.log("seeding...");
  const client = new Client({
    connectionString: "postgresql://<role_name>:<role_password>@localhost:5432/top_users",
  });
  await client.connect();
  await client.query(SQL);
  await client.end();
  console.log("done");
}

main();
```

Login to the PostgreSQL shell, connect to the `top_users` db, and drop the `usernames` table:

```sql
DROP TABLE usernames;
```

You can then run this script via `node db/populatedb.js`, or add it as a [script in package.json](https://stackoverflow.com/a/36433748).

Do note that the script is designed to be ran only once.

#### Populating production dbs

We've hardcoded our local db connection information in the script. Hence, the script only populates our local db. We need a way to populate our production db as well. One way to this is by using environment variables, though this leads to unnecessary hassle. Why? Because now, the script can only populate the production db on the production server i.e. we'll need to access the production server's cli to run the script. Or, we could sneakily edit our environment file to point to the production db and run the script on our machine, and revert it.

We should aim to make our script as independent from our codebase as possible.

A far more painless approach is providing the connection information as an argument to the script. This way, we can run the script for local db as well as production db on our machine. You can access arguments via [process.argv](https://nodejs.org/docs/latest/api/process.html#processargv).

```bash
# populating local db 
node db/populatedb.js <local-db-url>

# populating production db
# run it from your machine once after deployment of your app & db
node db/populatedb.js <production-db-url>
```

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Skim through [pg's documentation](https://node-postgres.com/). The library itself is light, and so is their documentation. You don't need to read everything, use it mainly as a reference.
1. Update the above project we've been working on.
    1. Install `dotenv` package and implement environment variables for db connection information.
    1. Add search functionality via query parameters on the index route. For example, `GET /?search=sup` should return all usernames containing `sup`. DON'T implement this in JavaScript, search should be done in SQL.
    1. Add a new route `GET /delete` to delete all usernames from the db.
1. In our previous Mini Message Board project, we implemented ephemeral messages using an array i.e. the messages would reset when server restarted. We want data persistence. Go back to this project and implement it with a PostgreSQL db and `pg`.
   - Deploy a new db on a hosting service you choose, and obtain its connection information.
   - Create a `messages` table, populate it with data if you wish. This should be done via a script.
   - Add the necessary environment variables, create a pool, and implement the required db functions.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How do you create a db and table via PostgreSQL shell?](#setting-up-the-db)
- [What is node-postgres and how do you use it?](#using-node-postgres-in-express)
- [When should you use a client or a pool in pg?](#querying-with-pg)
- [How would you integrate db query functions in your Express app?](#querying-with-pg)
- [How would you populate the db via a script?](#populate-the-db-via-a-script)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
