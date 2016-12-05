**This guide assumes that you have already installed homebrew, rvm and rails after going through the installations project [here](http://www.theodinproject.com/web-development-101/installations)**

## Installing Postgresql:
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

If you run into a issue such as `No daemon found matching 'postgres'` at this point have a look at [this guide](https://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/) to getting `lunchy` and `postgres` set up and running on OSX.

create a new database for the odin project site:
```
$ createdb theodinproject
```

Thats it for postgresql, next we will install all of the gems that are needed.

## Installing Gems and Migrating the Database
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

create the test database
```
$ rake db:test:prepare
```

## Get a Github API Token
You will need a Github API token to get all the tests to pass and for getting all the lesson content.

First create a application.yml with figaro, this is where you will store your Github API token.
```
$ rails generate figaro:install
```

Next go to [personal access tokens](https://github.com/settings/tokens) in your Github user account settings and click the "generate new token" button. This will bring you to a new page. Give your token a description in the box provided, Something like "Odin " will do. Once that is done click the "generate token" button at the bottom of the page. The token highlighted in green is your new Github API key.

Copy your Github API token and go back to the `config/application.yml` file in your local Odin Project directory. Paste your API token in place of `<your api token here>` like the example below:
```
GITHUB_API_TOKEN: <your api token here>
```

## Run the Tests
You can now run all the tests, they should all be green

To run the rspec unit tests:
```
$ rspec
```

To run the cucumber integration tests:
```
$ cucumber
```

## Seeding the Database and Populating the Lesson content
Next you need to seed the database with the course and lesson data.
```
$ rails db:seed
```

We pull in the lesson content from the Odin [curriculum repository](https://github.com/TheOdinProject/curriculum) on Github. We have created a rake task for this to make it easy.
```
$ rake rake curriculum:update_content
```

## Running the app locally
You can now run the app on your local machine :tada:

start the server
`$ rails server`

Go to the app in your browser:
`http://localhost:3000`

## Setting up Github Omniauth (Optional)
We allow users to create an account on the site with Github OAuth. To get this feature working locally follow the instructions in this section.

Go to [OAuth Applications](https://github.com/settings/developers) in your Github user account settings and click the "register a new application" button.

Fill in the form fields with the following:

Application Name
`odin`

Homepage URL
`http://localhost:3000`

Application Description
`the odin project`

Authorization callback URL
`http://localhost:3000/users/auth/github/callback`

Click the "Resgister application" button. This will display your `Client ID` and `Client Secret` which is what you will use to get OAuth working on your local machine.

Go to `config/application.yml` in your local project directory for The Odin Project and fill in the following:
```
GITHUB_API_TOKEN: <your api token here>
GITHUB_APP_ID: <your client ID here>
GITHUB_SECRET: <your client secret here>
```

To test that works correctly run the app locally and try to sign up with Github.

## Need Help?
If you have any problems getting anything set up in this guide please let us know in our [contributing gitter channel](https://gitter.im/TheOdinProject/Contributing)
