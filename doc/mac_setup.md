**This guide assumes that you have already installed homebrew, rvm and rails after going through the installations project [here](http://www.theodinproject.com/web-development-101/installations)**

##Installing Postgresql:
before installing postgres make sure that homebrew is up to date
```
$ brew update
$ brew doctor
```

Now install postgresql
```
$ brew install postgresql
```

Initalize a new database once brew install is finished.
```
$ initdb /usr/local/var/postgres
```

Install lunchy to start and stop your postgres databases easily from the command line:
```
$ gem install lunchy
```

The commands for starting and stopping postgresql with lunchy are:
```
$ lunchy start postgres
$ lunchy stop postgres
```

create a new database for the odin project site:
```
$ createdb theodinproject
```

Thats it for postgresql, next we will install all of the gems that are needed.

##Installing Gems and Migrating the Database
change into the project directory
```
$ cd theodinproject
```

run bundle install
```
$ bundle install
```

If a error occurs with the capybara gem install run this command to fix:
```
$ brew install qt
```

Once bundle has finished installing everything its time to get the database set up.

create the database and migrate it
```
$ rake db:create:all
$ rake db:migrate
```

Finally create the test database
```
$ rake db:test:prepare
```

This will allow you to run the specs.

and thats it, run ```$ rails s``` and go to localhost:3000 in your browser to test that the site is running.