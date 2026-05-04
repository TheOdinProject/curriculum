### Guide: Install PostgreSQL on Linux

#### Step 1: Make sure the system is up to date

Before installing PostgreSQL, it's a good idea to make sure the operating system is up to date. To update our system, run this command:

```bash
sudo apt update && sudo apt upgrade
```

#### Step 2: Install the PostgreSQL packages

After our system is up to date, we will install the packages for PostgreSQL.

```bash
sudo apt install postgresql postgresql-contrib libpq-dev
```

After installation is complete, let's start the server using this command:

```bash
sudo systemctl start postgresql.service && systemctl status postgresql.service
```

Got an error, or don't see an active service? Come visit [our Discord server](https://discord.gg/fbFCkYabZB) for some help!

If `postgresql` is active, you can press `Q` to quit the status screen and move on to the next step.

#### Step 3: Setting up PostgreSQL

PostgreSQL is now running, but we have to configure it in order to be able to use it with our local Rails applications.

PostgreSQL authenticates via roles. A role is like a user, which is how we interact with the service. The default PostgreSQL installation has set up a `postgres` role that we can use. This is great, but that would mean having to switch to that role every time we wanted to do something with the database server.

Instead, we will set up our own role to avoid switching to the `postgres` role all the time.

1. We will be creating a new role with the same name as our Linux username. If you're not sure of your Linux username, you can run the command `whoami` in your terminal to get it. Once you have that information ready, let's create a role in PostgreSQL. The command to do so is:

   ```bash
   sudo -i -u postgres createuser --interactive
   ```

   Remember that we want the role name to be the same as our Linux user name and be sure to make that new role a superuser. Setting up a role like this means we can leverage "peer authentication" making using the local database very easy.

1. One other important step in setting up PostgreSQL is that each role must have its own database of the same name. Without it, the role we just created will not be able to log in or interact with PostgreSQL.

   You can try to run `psql` now, but you will get an error that the database does not exist. Not to worry, let's create one to resolve this. Note that if setting a username containing capital letters, you **must** surround the username with quotes when running the command below.

   ```bash
   sudo -i -u postgres createdb <linux_username>
   ```

   Now our role is fully set up: we've got `<role_name>` and that role has a database.

1. One important thing that we have to do is to set up a password for our new role so that the data is protected. Now that our role is set up, we can actually use it to administer PostgreSQL. All you have to do is enter this command to get into the PostgreSQL prompt:

   ```bash
   psql
   ```

   You should see the PostgreSQL prompt come up with the new role we just created, like so:

   ```sql
   role_name=#
   ```

   If you don't see a similar prompt, then reach out in [our Discord server](https://discord.gg/fbFCkYabZB) for some help. If you **do** see a similar prompt, then we can create a password for the role like so:

   ```sql
   \password <role_name>
   ```

   You'll be prompted to enter a password and to verify it. Once you are done, the prompt will return to normal.

1. Now, we will configure the permissions for our new role (note the semicolon at the end):

   ```sql
   GRANT ALL PRIVILEGES ON DATABASE <role_database_name> TO <role_name>;
   ```

   Remember that you should change the `<role_database_name>` and `<role_name>` (they should both be the same)! If you see `GRANT` in response to the command, then you can type `\q` to exit the prompt.

1. After finishing our configuration, the last step is save it into the environment to access later.

   In order to save our password to the environment, we can run this command:

   ```bash
   echo 'export DATABASE_PASSWORD="<role_password>"' >> ~/.bashrc
   ```

   Note here the name we've chosen for our environment variable: `DATABASE_PASSWORD`. Also, remember to update `<role_password>` in the command to what was set above!

   Now, this variable lives in our environment for us to use. As the variable is new, we'll want to reload the environment so that we can access it. To reload the environment, you can close and re-open your terminal.

Once that's done, we can move to testing it out!

[Return to the Installing PostgreSQL lesson](https://www.theodinproject.com/lessons/ruby-on-rails-installing-postgresql#assignment)
