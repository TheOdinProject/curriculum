# The Odin Project: [Learn Web Development for Free](http://theodinproject.com)

v0.2.0

This site provides the main user experience for The Odin Project, including the home page and all user functions.  It is meant to be a shell around [The Curriculum](http://theodinproject.com/curriculum) and to include the tools that help students learn more effectively along their learning journeys.

The website has been open-sourced to provide both a learning resource for students who want to see how the tools they're using are built and to give students the opportunity to stretch their wings and contribute to a real open-sourced project... while building the tools they themselves will be using.

For minor fixes, either submit a github issue or a pull request.  Please coordinate with the project maintainers if you're interested in working on some of the larger features in order to avoid traffic jams.

*[http://theodinproject.com/](http://theodinproject.com)*

Contact us directly at [project@theodinproject.com](mailto:project@theodinproject.com)

## Contributing to the Site

This project is emphatically beginner-friendly so, if you're interested in potentially contributing, take a look at the [Contributing Page](http://www.theodinproject.com/contributing) on the website for more information.

### Hacking on the Site Yourself: Getting Set Up

This site runs on **Ruby 2.3** and **Rails 4.1** (upgraded from Ruby 1.9.3 and Rails 3.2.12 in February 2014)

#### Installing the Site on your Local Machine

1. Make sure to fork this repo
2. When you have it cloned to your local machine make sure your Ruby version is 2.3 and your Rails version is 4.1 or later.
3. Use the appropriate operating system focused guide below to install the site

[OSX Setup](https://github.com/TheOdinProject/theodinproject/blob/master/doc/mac_setup.md)

[Linux Setup](https://github.com/TheOdinProject/theodinproject/blob/master/doc/linux_setup.md)

##### Populating the Database

3. The `db/seeds.rb` file is used to populate all the course and lesson meta-data.  Use the command `$ rake db:seed` to populate all the meta-data for courses and lessons so you can run the rake task in the next step.  `db/seeds.rb` is identical to the data you'll see presented on the production site (this is used to populate it).  You can run it as many times as you'd like... it basically deletes all metadata and repopulates it with each run.  The seeds file only creates curriculum data, it doesn't create any users.
3. One thing the seeds file will not populate is the actual content for each lesson.  This needs to be retrieved from the curriculum repository on github (which is at [http://www.github.com/theodinproject/curriculum](http://www.github.com/theodinproject/curriculum)) by running the rake task (`$ rake curriculum:update_content`).  But there's a catch... Github only allows you something like 50 API calls per hour if you haven't registered for an API key with them and used it to authenticate your requests.  As of this writing, there are over 90 lessons so you would be rate limited before even finishing populating them with the rake task if you don't get an API key yourself.  So go get an API key from github (at [https://github.com/settings/tokens](https://github.com/settings/tokens)) and use Figaro (as described below) to pass that key to the application so you can happily download all the curriculum files into your build.
3. The DISQUS forums and Github API calls rely on private environment variables (to store their API secret keys) that you won't find in the repo. I upload them directly to the server myself using the `figaro` gem and a corresponding file called `application.yml` that's located in my `config/` directory but not checked into git (no, you can't have my passwords).  Check out the [Figaro Documentation](https://github.com/laserlemon/figaro) for a very easy-to-understand explanation of how the gem works.  You basically just need to run `$ rails generate figaro:install` and populate the missing variables to `application.yml`.  An example, as of this writing:

        # config/application.yml --these are two steps.  first two steps are created on initial registration at [http://disqus.com/admin/create/].  Second two are given when you request access to SSO for your application via a form at [http://help.disqus.com/customer/portal/articles/236206-integrating-single-sign-on]
        DISQUS_ACCOUNT_NAME: generated_on_intial_signup
        DISQUS_WEBSITE_NAME: generated_on_initial_application_registration
        DISQUS_API_SECRET_KEY: generated_after_SSO_permission_granted
        DISQUS_API_PUBLIC_KEY: generated_after_SSO_permission_granted

        # config/application.yml --set up this token to make API calls to get all the lessons.
        GITHUB_API_TOKEN: your_token_would_go_here

        # ~OPTIONAL~
        # config/application.yml --acquire this on your github account, through settings/applications/ and set up a new application.This is to make OAUTH Authentication (signin with github) function correctly.
        GITHUB_APP_ID: API_ID_Generated_with_registering_application
        GITHUB_SECRET: ALSO_GENERATAED_WITH_REGISTERING_APPLICATION

1. Run a `$ rails server` and see if that lets you check out the app at `http://localhost:3000`.
1. That... should... be... it...?

This is basically all you need to get yourself set up with the repo and you should be able to run a server with `$ rails s` or the tests with `$ rspec spec`.  Of course, nothing ever goes according to plan when installing things but hopefully your "Googling the error message" skills are up to the task.


*Please let me know what I've missed here!*

## Now that you're up and running... [Come Help Out!](http://theodinproject.com/contributing)

## Significant Contributors

* [Erik Trautman](https://github.com/eriktrautman)
* [Afshin Moktari](https://github.com/afshinator)
* [Josh Gorchov](https://github.com/gorchov)
* [Joe Sawyer](https://github.com/zkay)
* [Bill Walker](https://github.com/mach1010)
* [Neil Gehani](https://github.com/ngehani)
* [Ian White](http://github.com/Iawhite76)
* [Nathan Hall](http://github.com/dominathan)
* [Abby Jones](http://github.com/AbbyJonesDev)
* [Kevin Mulhern](https://github.com/KevinMulhern)

<hr>
Created by [Erik Trautman](http://www.github.com/eriktrautman)
