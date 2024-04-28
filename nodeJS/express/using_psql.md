<!-- TODO: Revisit lesson/heading structure to remove need to disable rules -->
<!-- markdownlint-disable MD024 TOP004 -->

### Introduction

Data persistence is integral to the vast majority of web applications. Local storage has limitations and poses security risks, and while Backend-as-a-Service (BaaS) options such as Firebase work well, ultimately being able to understand how to structure, build, and query your own database are important skills for any full-stack developer to have.

For example, consider X (formerly known as Twitter). Where are your username and password stored? Or perhaps where all of your posts might be fetched from? How does the application determine what posts are shown to you every time you log on? These operations are handled by a database.

Databases are split into two types - “relational” and “non-relational”, and each type handles data and scaling in different manners. In this lesson, you will learn about PostgreSQL, a popular relational database, and how we can use it in our Express application.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand the basics of PostgreSQL.
- How to install PostgreSQL and set it up.
- Using node-postgres as the PostgreSQL client for our Express application.

### What is PostgreSQL

PostgreSQL, often referred to as "Postgres" is an advanced and feature-rich database management system (DBMS) that is primarily a relational database that supports some object-oriented features hence it being called an object-relational database management system (ORDBMS). It is known for its reliability, extensibility, and adherence to SQL standards, it even allows for JSON querying, unstructured data that you commonly see in non-relational databases. PostgreSQL has grown into a popular choice for developers and enterprises alike, even taking first place for being the most popular among professional developers and the most desired/admired database in previous StackOverflow surveys. Watch through this [fun and short introduction video to PostgreSQL](https://www.youtube.com/watch?v=n2Fluyr3lbc) by Fireship that you will come to love and use.

### Installing PostgreSQL

If you've been following the curriculum, you should already have installed all the supporting bits and pieces. If not, please go back and refer to [those lessons](https://www.theodinproject.com/guides/installations) before continuing.

Pick your operating system below to get the appropriate steps for installing PostgreSQL.

<details markdown="block">

<summary class="dropDown-header">Linux</summary>

### Step 1: Make sure the system is up to date

Before installing PostgreSQL, it's a good idea to make sure the operating system is up to date. To update our system, run this command:

```bash
sudo apt update && sudo apt upgrade
```

### Step 2: Install the PostgreSQL packages

After our system is up to date, we will install the packages for PostgreSQL.

```bash
sudo apt install postgresql postgresql-contrib libpq-dev
```

After installation is complete, let's start the server using this command:

```bash
sudo systemctl start postgresql.service
```

<div class="lesson-note lesson-note--warning" markdown="1">

#### Systemctl and WSL2

Systemctl is not supported on WSL2, and the above command won't work. Instead, run the following command:

```bash
sudo service postgresql start
```

</div>

Got an error, or don't see an active service? Come visit the [Discord](https://discord.gg/V75WSQG) for some help!

If `postgresql` is active, you can press `Q` to quit the status screen and move on to the next step.

### Step 3: Setting up PostgreSQL

PostgreSQL is now running, but we have to configure it in order to be able to use it with our local Rails applications.

#### 3.1 PostgreSQL roles

PostgreSQL authenticates via roles. A role is like a user, which is how we interact with the service. The default PostgreSQL installation has set up a `postgres` role that we can use. This is great, but that would mean having to switch to that role every time we wanted to do something with the database server.

Instead, we will set up our own role to avoid switching to the `postgres` role all the time.

#### 3.2 Creating a new role

We will be creating a new role with the same name as our Linux username. If you're not sure of your Linux username, you can run the command `whoami` in your terminal to get it. Once you have that information ready, let's create a role in PostgreSQL. The command to do so is:

```bash
sudo -i -u postgres createuser --interactive
```

Remember that we want the role name to be the same as our Linux user name and be sure to make that new role a superuser. Setting up a role like this means we can leverage "peer authentication" making using the local database very easy.

#### 3.3 Creating the role database

One other important step in setting up PostgreSQL is that each role must have its own database of the same name. Without it, the role we just created will not be able to log in or interact with PostgreSQL.

You can try to run `psql` now, but you will get an error that the database does not exist. Not to worry, let's create one to resolve fix this:

<div class="lesson-note" markdown="1">

If your username has any capital letters, you must surround it in quotes when running the below command.

</div>

```bash
sudo -i -u postgres createdb <linux_username>
```

Now our role is fully set up: we've got `<role_name>` and that role has a database.

#### 3.4 Securing our new role

One important thing that we have to do is to set up a password for our new role so that the data is protected. Now that our role is set up, we can actually use it to administer PostgreSQL. All you have to do is enter this command to get into the PostgreSQL prompt:

```bash
psql
```

You should see the PostgreSQL prompt come up with the new role we just created, like so:

```sql
role_name=#
```

If you don't see a similar prompt, then reach out on [Discord](https://discord.gg/V75WSQG) for some help. If you **do** see a similar prompt, then we can create a password for the role like so:

```sql
\password <role_name>
```

You'll be prompted to enter a password and to verify it. Once you are done, the prompt will return to normal. Now, we will configure the permissions for our new role:

```sql
grant all privileges on database <role_database_name> to <role_name>;
```

Remember that you should change the `<role_database_name>` and `<role_name>` (they should be both the same)! If you see `GRANT` in response to the command, then you can type `\q` to exit the prompt.

#### 3.5 Saving access information in the environment

After finishing our configuration, the last step is save it into the environment to access later.

In order to save our password to the environment, we can run this command:

```bash
echo 'export DATABASE_PASSWORD="<role_password>"' >> ~/.bashrc
```

Note here the name we've chosen for our environment variable: `DATABASE_PASSWORD`. Also, remember to update `<role_password>` in the command to what was set above!

Now, this variable lives in our environment for us to use. As the variable is new, we'll want to reload the environment so that we can access it. To reload the environment, you can close and re-open your terminal.

Once that's done, we can move to testing it out!

</details>

<details markdown="block">

<summary class="dropDown-header">macOS</summary>

### Step 1: Make sure the system is up to date

Before running commands with homebrew, you'll want to make sure things are up to date. Run the following commands one by one:

```bash
brew update
brew upgrade
```

If your terminal doesn't recognize `brew`, then you'll need to go and install homebrew. You can find it and other installs in the [installation appendix](https://www.theodinproject.com/guides/installations).

### Step 2: Install the PostgreSQL packages

Now that we've ensured our packages are up to date, we will use brew to install PostgreSQL.

```bash
brew install postgresql@14
```

After installation is complete, let's start the server using this command:

```bash
brew services start postgresql@14
```

If you are unsure about whether `postgresql` is active, it's possible to check with this command:

```bash
brew services info postgresql@14
```

Got an error, or don't see an active service? Come visit the [Discord](https://discord.gg/V75WSQG) for some help!

If the `postgresql` service is active, move on to the next step.

### Step 3: Setting up PostgreSQL

PostgreSQL is now running, but we have to configure it in order to be able to use it with our local Rails applications.

#### 3.1 PostgreSQL roles

PostgreSQL authenticates via roles. A role is like a user, and by default, the install on MacOS should have a role set up with your MacOS username. If you're not sure of your username, you can run the command `whoami` in your terminal to get it. To verify that you have a role in PostgreSQL matching your username, enter the following command:

```bash
psql postgres
```

And you should see a prompt like this

```sql
psql (14.x (Homebrew))
Type "help" for help.

postgres=#
```

Input `\du`, hit Return, and check that your MacOS username is the listed role name.

#### 3.2 Creating the role database

One other important step in setting up PostgreSQL is that each role must have its own database of the same name. We need this to login as the role matching our username. While still in the PostgreSQL session prompt, type the following command to create the new database. Make sure you include the semicolon.

<div class="lesson-note" markdown="1">

If your username has any capital letters, you must surround it in quotes when running the below command.

</div>

```sql
CREATE DATABASE <username>;
```

Now our role is fully set up: we've got `<role_name>` and that role has a database. Enter the command `\q` to exit the interactive terminal for `postgres`.

#### 3.3 Securing Our new role

One important thing we have to do is set up a password for our new role to protect the data. Now that we have our role, we can use it to administer PostgreSQL. All you have to do is enter this command to get into the PostgreSQL prompt for the database matching your user:

```bash
psql
```

You should now see the PostgreSQL prompt come up like this:

```sql
role_name=#
```

If you don't see a similar prompt, then reach out on [Discord](https://discord.gg/V75WSQG) for some help. If you **do** see a similar prompt, then we can create a password for the role like so:

```sql
\password <role_name>
```

You'll be prompted to enter a password and to verify it. Once you are done, the prompt will return to normal. Now, we will configure the permissions for our new role:

```sql
grant all privileges on database <role_database_name> to <role_name>;
```

Remember that you should change the `<role_database_name>` and `<role_name>` (they should both the same)! If you see `GRANT` in response to the command, then you can type `\q` to exit the prompt.

#### 3.4 Saving access information in the environment

After finishing our configuration, the last step is save it into the environment to access later.

In order to save our password to the environment, we can run this command:

```bash
echo 'export DATABASE_PASSWORD="<role_password>"' >> ~/.zshrc
```

Note here the name we've chosen for our environment variable: `DATABASE_PASSWORD`. Also, remember to update `<role_password>` in the command to what was set above!

Now, this variable lives in our environment for us to use. As the variable is new, we'll want to reload the environment so that we can access it. To reload the environment, you can close and re-open your terminal.

Once that's done, we can move to testing it out!

</details>

### Using a PostgreSQL client for our Express application

We can easily work with PostgreSQL in our Express application through using a package called `pg`. A PostgreSQL client that provides a collection of features and utilities to interact with a PostgreSQL database. Let's start by installing `pg` within our Express application:

```bash
npm install pg
```

We can then initialize it in our application with the necessary connection information. Let's create a file called `db.js` with the following code:

```javascript
const { Pool } = require('pg');

// Always make sure to secure this information
module.exports = new Pool({
  host: 'localhost', // or wherever the database is hosted
  user: '<role_name>',
  database: '<role_database_name>',
  password: '<role_password>',
  port: 5432 // The default port
});
```

An alternative to defining the connection information is through a [Connection URI](https://node-postgres.com/features/connecting#connection-uri)

That is all the setup we need to work with our PostgreSQL database. We can now import this module within other modules.

### Querying with node-postgres

Querying our PostgreSQL database is simple and we're just going to use what we've learned before with SQL, although there are things that are also specific to PostgreSQL.

With our initialized `Pool`, we can use the `query` method that accepts a query string that we can use to execute SQL queries.

As a start we will need test data so let's first populate our database with data that we can use in our application. Let's create a file called `populatedb.js`.

```javascript
const db = require('./db.js');

async function createTable(tableName) {
  const createTableQuery = `
   CREATE TABLE "${tableName}" (
      id SERIAL PRIMARY KEY,
      name VARCHAR(255) NOT NULL
   )
   `;
  console.log(`Creating table: ${tableName}`);
  await db.query(createTableQuery);
}

async function createUsers() {
  const names = ['Lofty', 'Mao', 'Xari'];

  // ($1), ($2), ($3), ...
  const placeholders = names.map((_, index) => `($${index + 1})`).join(', ');
  const insertDataQuery = `
    INSERT INTO users (name)
    VALUES ${placeholders}
  `;

  console.log('Creating users');
  await db.query(insertDataQuery, names);
}

async function main() {
  await createTable('users');
  await createUsers();
  console.log('DONE');
}

main().catch((err) => console.error(err));
```

That should be straightforward, we create a users table with `createTable` and populate it with `createUsers`. Feel free to modify, extend, handle errors, and completely make it your own while basing it on the requirements of the project you're creating.

Now in our application code, we can then do the following:

```javascript
app.get('/', async (req, res) => {
  const { rows } = await db.query('SELECT * FROM users');

  const names = rows.map((row) => row.name).join(", ");
  res.send(`Users: ${names}`);
});
```

If we go to the homepage of our Express application. We should be able to see the following:

```text
Users: Lofty, Mao, Xari
```

Great! Moving forward we will get to build more projects that allows us to apply the knowledge we got here and gain more practice.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. We've only really touched a bit of PostgreSQL and we've interfaced it with `node-postgres`, to understand PostgreSQL raw, head to their [Part 1 PostgreSQL tutorial](https://www.postgresql.org/docs/current/tutorial.html). Only read through Part 1 and you can start at `1.4. Accessing a Database` since we've already done the initial setup before. Going through other parts is optional and only if you want to gain a deeper understanding, but the basics are all you will need at the moment.
1. Check out [the node-postgres documentation](https://node-postgres.com/). The library itself is light and small, and so is their documentation. You don't need to read everything, use it mainly as a reference.
1. In our previous Mini Message Board project, we implemented a completely ephemeral messages using an array data structure within our application. We want data persistence. Go back to this project and implement it with a PostgreSQL database with `node-postgres` for the PostgreSQL client.
   - Create a messages table
   - Instead of an array `push`, query our database to insert a message
   - Render the messages coming from our database

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why is data persistence important in web applications?](#introduction)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
