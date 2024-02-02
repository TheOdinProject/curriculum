<!-- markdownlint-disable MD024 MD043 -->

### Introduction

One of the great things about the Rails' convention over configuration philosophy is it provides sensible defaults out of the box so that you can get started quickly. However, SQLite is typically not used for production. One major issue is that many hosting providers have ephemeral file systems which means your database can be deleted.

For the apps written so far, it's probably not a big deal. As we progress to writing larger applications, though, it will become increasingly sensible to make sure that data persists even after a restart or hibernation.

It is also safer to make sure the application development environment is as close to the production environment as possible. This helps to avoid problems that stem from using different tools in different environments.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What an environment is and how it can impact our application.
- What environment variables are and how to utilize them.
- How to install PostgreSQL and set it up.
- How to set up a bare Rails application to use a specific database.

### Environments and pipelines

In the context of application development, an environment is the collection of tools, configurations and conventions that developers write and run code with. An environment usually consists of an operating system and other software packages on top of that operating system. Some of that software, like `code`, helps write software while others, like `rbenv`, provide tools and configurations to help run software.

There are four basic types of environments that are typically set up together. The application that's being developed will then progress through these environments, which are grouped together in a "production pipeline":

<span id="pipeline"></span>

1. The development environment is typically the developers local machine. Where they can safely make changes, add features and improve the code without impacting actual users.
1. The test environment is set up to facilitate testing of the application. This environment may use different tools and configuration settings (like more verbose logging) to validate a program's behavior and identify bugs with automated tests.
1. The staging environment usually mirrors the production environment but deployments are not meant to be public.
1. The production environment runs the application so that it is accessible by users.

Because an environment is a collection of tools and configurations, they come in handy as a place to store secrets or other information that may change based on the application's intended use.

For example, the local database server might have different credentials than the production database or maybe there are more analytics and logging requirements for production deployment.

As applications get larger, setting up these different environments can help developers deliver their best work while making sure changes (or bugs) don't negatively affect users.

### Environment variables

<span id="env_var">The foundation of any environment is the operating system, which provides ways to store local variables. Not surprisingly, these are known as environment variables.</span>

Why are environment variables important? After all, the information could be added to the git repository (and by extension Github). While tools like git and Github are excellent for storing, versioning and sharing code; sensitive information like API keys or passwords should be kept private. Even if you remove the private data from the current commit, it may still live on in the commit history!

<span id="privacy">Environment variables allow us to set this information where the application will run without sharing it on git or Github. Because these variables can only be accessed locally, our application can access these sensitive values without making them public.</span>

Rails uses the environment to set up its own internal environment variable. The framework will look for a `RAILS_ENV` variable in the environment and set its own env that way. If it can't find the variable, then [Rails will assume it is in a development environment](https://github.com/rails/rails/blob/main/railties/lib/rails.rb#L67). Isn't that cool?

We will use an environment variable to set up PostgreSQL credentials for our Rails apps.

### Installing PostgreSQL

If you've been following the curriculum, you should already have installed all the supporting bits and pieces. If not, please go back and refer to [those lessons](https://www.theodinproject.com/guides/installations) before continuing. You'll want to confirm that node.js, Ruby, Rails and yarn are all installed.

Pick your operating system below to get the appropriate steps for installing PostgreSQL.

<details markdown="block">
<summary class="dropDown-header">Linux
</summary>

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

<div class="lesson-note lesson-note--warning">
#### Systemctl and WSL2
Systemctl is not supported on WSL2, and the above command won't work. Instead run sudo service postgresql start.
</div>

If you are unsure about whether `postgresql` is active, it's possible to check with this command:

```bash
service postgresql status
```

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
<role_name>=#
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
<summary class="dropDown-header">macOS
</summary>

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
<role_name>=#
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

### Creating a Rails application backed by PostgreSQL

Now that we've installed and configured our local PostgreSQL server, let's generate a new Rails application to make sure everything is working.

#### Telling Rails what database to use

Through the curriculum to this point, Rails has been using the `sqlite` gem in order to run and manage its database. As we just set up PostgreSQL, we will need to install the companion gem so that Rails knows how to interact with this database provider:

```bash
gem install pg
```

We are already familiar with `rails new <app_name>` but it is also possible to specify the database that Rails should use when generating a new application. Since we just installed PostgreSQL, let's try it out!

Navigate to where you keep your projects and enter:

```bash
rails new <app_name> --database=postgresql
```

#### Configuring Rails using environment variables

Let's navigate into the app directory and set up our database credentials.

```bash
cd <app_name>
```

Once we're inside the right directory, can set up the database username and password in `config/database.yml` by adding entries with our information:

```diff
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
+  username: <role_name> # role previously added
+  password: <%= ENV['DATABASE_PASSWORD'] %> # variable previously added
# You must remove the '+' signs to be able to migrate your database
```

Save the file, and we can see Rails work its magic:

```bash
rails db:create
```

Rails should create the two databases, and as a final check we can start the Rails server:

```bash
rails s
```

Open your browser, and head on over to `localhost:3000`. If you are greeted by the Rails splash page, then we did it! If you see an error, come to the [Discord](https://discord.gg/V75WSQG) community and get some help!

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [What are the typical environments that make up a pipeline?](#pipeline)
- [What is an environment variable?](#env_var)
- [Why should we use environment variables?](#privacy)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- RubyGuides has a good [introduction to environment variables](https://www.rubyguides.com/2019/01/ruby-environment-variables/) that has a lot of information, including some gem options for managing environment variables.
- DigitalOcean has a fantastic [guide to setting up PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-22-04) that you can also check out.
