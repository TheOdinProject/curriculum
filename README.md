# [The Odin Project](http://theodinproject.com)

*[http://theodinproject.com/](http://theodinproject.com)* [version 0.1.1]

*Jump to [Getting Involved](https://github.com/TheOdinProject/theodinproject/blob/master/getting_involved.md) if you'd like to learn more about how to help out or what we're doing to develop this project*

### The Open Curriculum for Learning Web Development

This site provides the main user experience for The Odin Project, including the home page and all user functions.  It is meant to be a shell around [The Odin Project Curriculum](http://theodinproject.com/curriculum) and to include the tools that help students to pair together and get to know others who are working on the curriculum.  

It has been open-sourced to provide both a learning resource for students who want to see how the tools they're using are built and to give students the opportunity to stretch their wings and contribute to a real open-sourced project... while building the tools they themselves will be using.

Thus far, the code has been more or less hacked together so don't use it as a star example of how things should be done!  We'll be rolling out some better documentation and contribution instructions as this develops a little further.

For minor fixes, either submit a github issue or a pull request.  Please coordinate with the project maintainers if you're interested in working on some of the larger features in order to avoid traffic jams.

Contact us directly at [project@theodinproject.com](mailto:project@theodinproject.com)

## Future Development and Contributing

**Update (12/18/13)!** The new development roadmap will be managed using [this Pivotal Tracker project](https://www.pivotaltracker.com/s/projects/979092).  The file [dev_roadmap.md](dev_roadmap.md), which was previously used to track feature production, will contain historical release notes but not an up-to-date list of features in-progress.

We have students who have gotten through the Rails course contributing now!  **See the [Getting Involved document](https://github.com/TheOdinProject/theodinproject/blob/master/getting_involved.md) for details of contributing to the website or just observing us while we build.**

There are some overall goals for the future development of this project:

* Improve the overall user experience while using the curriculum
* Start rolling out realtime collaboration features and progress tracking for students who are using the curriculum.
* Improve the documentation of the existing code base so people can more easily navigate through it.  This means in-line commenting and also creating a higher level github wiki page that explains how the project works and the best ways to navigate it.

If you'd like to help out (even as a relative newbie), please [get in touch](mailto:contact@theodinproject.com) and we'd be happy to point you in the right direction.  Check out the [Pivotal Tracker project](https://www.pivotaltracker.com/s/projects/979092) for the features and our [meetup group](http://www.meetup.com/Learn-Web-Development-Paired-Programming-in-SF/) for online weekly development meetings.

### Hacking on the Site Yourself

See the [Getting Involved document](https://github.com/TheOdinProject/theodinproject/blob/master/getting_involved.md) for details of contributing to the website.

1. This site runs on Ruby 1.9.3 and Rails 3.2.12.
    * Follow along with [this gist](https://gist.github.com/afshinator/8035821) if your environment is Nitrous.io.
    * You're (hopefully) using RVM to manage your Ruby gems, so create a new gemset for this project, specify the proper Ruby version, then install the proper Rails version.  For help with RVM, check out [this blog post](http://stjhimy.com/posts/04-using-rvm-gemsets-to-manage-multiple-rails-installations-in-the-same-ruby-version).

1. Fork the repo by clicking the Fork button at the top right and then download your copy of the repo to your local machine by doing a `git clone git@github.com:YOUR_USERNAME/theodinproject.git`
2. Run a `$ bundle install` of all the gems
## Note: Both local and production databases are [Postgres](http://www.postgresql.org/docs/), so if you're used to just using Rails' default SQLite database you'll need to get Postgres fired up on your local machine.  You can probably get away with just typing `$ rake db:create` but may need to download a client for it and create a `theodinproject` database that the application can connect to.  The major difference is that Postgres operates almost like a server.  Ryan Bates has a [RailsCast](http://railscasts.com/episodes/342-migrating-to-postgresql) episode about migrating to Postgres that may be helpful if you're a newbie.  If you're deployed on Heroku (which we are), you need to use PG anyway.
=
To install Postgres (linux):
1. Open your terminal and type ```sudo apt-get install postgresql
	
2. After installing postgres, you might like to install pgAdmin III. It is a nice GUI to have, especially for beginners. To do this, in terminal type ```sudo apt-get install pgadmin3
	
3. To start off, we need to change the PostgreSQL postgres user password; we will not be able to access the server otherwise. As the “postgres” Linux user, we will execute the psql command. In terminal, type ```sudo -u postgres psql postgres
	
4. Set a password for the "postgres" database role using the command: ```\password postgres
and give your password when prompted. The password text will be hidden from the console for security purposes.
Type Control+D to exit the posgreSQL prompt.
	
5. To create the first database, which we will call "odin", simply type:
```sudo -u postgres createdb odin
	
6. For ""Postgresql 9.1""+ install the adminpack "extension":
```sudo -u postgres psql
```CREATE EXTENSION adminpack;
    
7. Open up pgAdmin III (app menu->development->pgAdmin III)
    
8. Open file->add server and populate the following as field:data
Name: localhost
Host: localhost
Port: 5432
Service: <leave blank>
Maintenance DB: postgres
Username: $USER
Password: <whatever>
Store Password: yes
and click "OK".
    
9. You should see a new server populated in the side panel of the pgadmin window.
    
10. Expand (+) the server and you will see the database you created with a red X next to it. Double click to connect the database.
    
11. You now have postgresql set up with a GUI frontend for management, if you so desire. It is much easier for a newcomer to user pgadmin III than to try and figure out all the terminal commands.
    
12. Edit your /config/database.yml with the correct database information you set up in the prior steps. It will then connect to the database you created and ```rake db:migrate will now properly function.

3. Once you've got postgres installed and have created the empty database, run a `$ rake db:migrate` to run all the migrations that will set up the schema properly.  The `db/seeds.rb` file is used to populate all the course and lesson meta-data.  It is identical to the data you'll see presented on the production site (this is used to populate it).  You can run it as many times as you'd like... it basically deletes all metadata and repopulates it with each run.  The seeds file only creates curriculum data, it doesn't create any users. 
4. One thing the seeds file will not populate is the content for each lesson.  This needs to be retrieved from the curriculum repository on github by running the rake task (`$ rake curriculum:update_content`).  But there's a catch... it uses my Github Api key from the below-mentioned Figaro gem in order to avoid rate limits (Github only allows you something like 50 API calls per hour if you haven't registered for an API key with them and used it to authenticate your requests).  As of this writing, there are 56 lessons so you would be rate limited before even finishing populating them with the rake task if you don't get an API key yourself.
5. The Moot forums and Github API calls rely on private environment variables (to store their API secret keys) that you won't find in the repo. I upload them directly to the server myself using the `figaro` gem and a corresponding file called `application.yml` that's located in my `config/` directory but not checked into git (no, you can't have my passwords).  Check out the [Figaro Documentation](https://github.com/laserlemon/figaro) for a very easy-to-understand explanation of how the gem works.  You basically just need to run `$ rails generate figaro:install` and populate the missing variables to `application.yml`.  An example, as of this writing:

        # config/application.yml
        moot_api_key: UjI8SKQv6J
        moot_secret_key: no_you_cant_have_my_secret_key
        GITHUB_API_TOKEN: your_token_would_go_here

You can create your own "personal access token" [HERE](https://github.com/settings/applications).  It's being used here to increase the number of calls we can make to the Github API to access the curriculum each hour.  As for the moot key... you may not be able to use the forums feature without one.  Anyone have ideas how to get around that?

1. Run a `$ rails server` and see if that lets you check out the app at `http://localhost:3000`.
1. That... should... be... it...?

### Nitrous.io Notes

* Don't forget to populate your test database with `$ rake db:test:prepare`

*I haven't had to clone and start from scratch yet so please let me know what I've missed here!*



<hr>
Created by [Erik Trautman](http://www.github.com/eriktrautman)
