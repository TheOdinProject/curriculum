### Guide: Install PostgreSQL on MacOS

#### Step 1: Make sure the system is up to date

Before running commands with homebrew, you'll want to make sure things are up to date. Run the following commands one by one:

```bash
brew update
brew upgrade
```

If your terminal doesn't recognize `brew`, then you'll need to go and install homebrew. You can find it and other installs in the [installation appendix](https://www.theodinproject.com/guides/installations).

#### Step 2: Install PostgreSQL via PostgresApp

Installing PostgreSQL via Postgres.app is simple. Visit [Postgres.app](https://postgresapp.com/) and follow the instructions outlined. Importantly, you'll want to configure your `$PATH` so you can access the tooling that comes along with PostgreSQL. After installing Postgres.app, we can then install a PostgreSQL server. We want to install the latest available version of PostgreSQL.

After installing PSQL via Postgres.app, you can run this command to update your path to access all the tooling:

```bash
sudo mkdir -p /etc/paths.d &&
echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
```

After you've run this command and restarted your terminal, you can run `which psql` and we would expect this output:

```bash
/Applications/Postgres.app/Contents/Versions/latest/bin/psql
```

If you don't see a similar output, come visit [our Discord server](https://discord.gg/fbFCkYabZB) for some help!

<div class="lesson-note lesson-note--warning" markdown="1">

#### Postgres.app security

Please note that that Postgres.app installs servers without any security configured, and will accept all local connections without a password. This is fine for our development environment, but be aware that when you move things to production, this will not be a good strategy.

</div>

Postgres.app defaults to creating a role and user database that matches your macOS user. You can confirm this by running this command after installing Postgres.app and updating the path:

```bash
psql
```

You should see the PostgreSQL prompt come up like this:

```bash
<your_user>=#
```

Because Postgres.app has configured trusted authentication for all local connections, we don't need to set up any password authentication for our local development environment. Just remember that your `role_name` is the user that appears in the `psql` prompt above. You can type `\q` to exit.

Once that's done, we can move to testing it out!

[Return to the Installing PostgreSQL lesson](https://www.theodinproject.com/lessons/ruby-on-rails-installing-postgresql#assignment)
