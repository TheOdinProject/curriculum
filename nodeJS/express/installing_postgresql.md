<!-- TODO: Revisit lesson/heading structure to remove need to disable rules -->
<!-- markdownlint-disable MD024 TOP004 -->

### Introduction

Data persistence is integral to the vast majority of web applications. Data persistence is achieved through databases. Being able to understand how to structure, build, and query your own database are important skills for any full-stack developer to have.

For example, consider The Odin Project. Where is your username stored? Where are project submissions stored? Where does this lesson content, the one you're reading right now, get stored? Yes, a database!

We've chosen [PostgreSQL](https://www.postgresql.org/) as our database of choice for the curriculum. All SQL knowledge that you've learned in the earlier course should be transferable to PostgreSQL. We'll also learn new PostgreSQL specific things. Watch through this [fun and short introduction video to PostgreSQL by Fireship](https://www.youtube.com/watch?v=n2Fluyr3lbc).

<div class="lesson-note lesson-note--critical" markdown="1">

Make sure you've completed the [SQL course](https://www.theodinproject.com/paths/full-stack-javascript/courses/databases).

This lesson and all subsequent lessons will assume you understand SQL syntax and concepts.

</div>

In this lesson, we'll install PostgreSQL and in the next lesson we'll learn how to use it in our Express application.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to install PostgreSQL.

### Installing PostgreSQL

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

Got an error, or don't see an active service? Come visit [our Discord server](https://discord.gg/V75WSQG) for some help!

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

If you don't see a similar prompt, then reach out in [our Discord server](https://discord.gg/V75WSQG) for some help. If you **do** see a similar prompt, then we can create a password for the role like so:

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

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why is data persistence important in web applications?](#introduction)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
