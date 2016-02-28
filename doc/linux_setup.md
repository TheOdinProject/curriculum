## Setup ruby
In case you don't have the version of ruby that the TheOdinProject uses, install it with rvm:
```
$ rvm install ruby-2.3
$ rvm use ruby-2.3
```

#### Bundler
If you needed to install the ruby version specified previously, then you're going to need to install bundler all over again, run the following commands for that:
```
$ sudo apt-get install bundler
$ gem install bundler
$ gem install bundle
```

## Setup postgres
Skip this is you have already installed and setup a user for postgresql.
First, we add the repository and then install postgresql and it's dependencies:
```
$ sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
$ wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install postgresql-common
$ sudo apt-get install postgresql-9.3 libpq-dev
```
Next we need to create our role, run the following:
```
$ sudo -u postgres createuser yourusername -s
$ sudo -i -u postgres psql
# Check that the user was created with:
postgres=# \du
# If you want to add a password to the role you created, run:
postgres=# \password yourusername
# Type \q to quit
```

## Gems
Okay, first we need to install some dependencies that the gem `capybara-webkit` has and then install the actual gem(we also install the postgres gem here):
```
$ sudo apt-get install qt4-dev-tools libqt4-dev libqt4-core libqt4-gui
$ gem install pg -v '0.17.1'
$ gem install capybara-webkit -v '1.1.1'
```

Now we need to pull down TOP's repository. To do this, go ahead an `fork` [TOP](https://github.com/TheOdinProject/theodinproject.git) repository. On your terminal run:
```
git clone https://github.com/YOUR_USERNAME_HERE/theodinproject.git
# Once git finishes cloning, cd into the project directory with
cd theodinproject
```
With all that taken care of, run `bundle` and everything should be green.
```
$ bundle install
```

Once bundle finishes, go to `config/database.yml` and write your username and password(only if you added a password) of postgresql for the development and the test database(leave the production alone), next we create and migrate the database:
```
$ rake db:create
$ rake db:migrate
```

Finally set up the test database
```
$ rake db:test:prepare
```

Get the server up and running with:
```
$ rails s
```

Go to your browser and voila!
