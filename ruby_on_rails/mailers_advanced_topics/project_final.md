### Project: Building Facebook

You've come a long way, congratulations! At this point, you should feel comfortable with building new Rails applications, modelling data, and working with forms. This project will require you to put all your newfound knowledge to the test.  It should serve as a great portfolio piece for what you're capable of.  It'll take some thought and time but it's certainly within reach of your skills.

You'll be building Facebook.  As usual, any additional styling will be up to you but the really important stuff is to get the data and back end working properly.  You'll put together some of the core features of the platform -- users, profiles, "friending", posts, news feed, and "liking".  You'll also implement sign-in with the real Facebook by using OmniAuth and Devise.

Some features of Facebook we haven't yet been exposed to -- for instance chat, realtime updates of the newsfeed, and realtime notifications.  You won't be responsible for creating those unless you'd like to jump ahead and give it a shot.

### Assignment

Build Facebook!  You'll build a large portion of the core Facebook user functionality in this project.  We won't be worrying about the Javascript-heavy front end stuff but you won't need it to get a nice user experience.

You should write at least a basic set of integration tests which let you know if each page is loading properly and unit tests to make sure your associations have been properly set up (e.g. testing that `User.first.posts` works properly).  Run them continuously in the background with [Guard](https://github.com/guard/guard) (See the [Ruby on Rails Tutorial Chapter 3.7.3](https://www.learnenough.com/ruby-on-rails-4th-edition-tutorial/static_pages#sec-guard)).

This project will give you a chance to take a relatively high level set of requirements and turn it into a functioning website.  You'll need to read through the documentation on GitHub for some of the gems you'll be using.

Keep the following requirements in mind.  We'll cover specific steps to get started below this list:

<div class="lesson-content__panel" markdown="1">
1. Use PostgreSQL for your database from the beginning (not SQLite3), that way your deployment to Heroku will go much more smoothly. See the [Heroku Docs](https://devcenter.heroku.com/articles/getting-started-with-rails4) for setup info.
2. Users must sign in to see anything except the sign in page.
3. User sign-in should use the [Devise](https://github.com/plataformatec/devise) gem. Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and `#current_user` methods. See the [Railscast](http://railscasts.com/episodes/209-introducing-devise?view=asciicast) (which uses Rails 3) for a step-by-step introduction. The docs will be fully current.
4. Users can send Friend Requests to other Users.
5. A User must accept the Friend Request to become friends.
6. The Friend Request shows up in the notifications section of a User's navbar.
7. Users can create Posts (text only to start).
8. Users can Like Posts.
9. Users can Comment on Posts.
10. Posts should always display with the post content, author, comments and likes.
11. Treat the Posts Index page like the real Facebook's "Timeline" feature -- show all the recent posts from the current user and users she is friends with.
12. Users can create a Profile with their personal information and a photo. You can use [Gravatar](https://en.gravatar.com/) for this photo.
13. The User Show page contains their Profile information, photo, and Posts.
14. The Users Index page lists all users and buttons for sending Friend Requests to those who are not already friends or who don't already have a pending request.
15. Sign in should use [OmniAuth](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview) to allow a user to sign in with their real Facebook account.  See the [RailsCast](http://railscasts.com/episodes/360-facebook-authentication?view=asciicast) on FB authentication with Devise for a step-by-step look at how it works.
16. Set up a [mailer](http://guides.rubyonrails.org/action_mailer_basics.html) to send a welcome email when a new user signs up. Use the `letter_opener` gem ([see docs here](https://github.com/ryanb/letter_opener)) to test it in development mode.
17. Deploy your App to Heroku.
18. Set up the [SendGrid add-on](https://devcenter.heroku.com/articles/sendgrid) and start sending real emails. It's free for low usage tiers.

#### Extra Credit

1. Make posts also allow images (either just via a URL or, more complicated, by uploading one).
2. Use the [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html) to allow users to upload a photo to their profile.
3. Make your post able to be either a text OR a photo by using a polymorphic association (so users can still like or comment on it while being none-the-wiser).
4. Style it up nicely! We'll dive into HTML/CSS in the next course.

#### Getting Started

1. Think through the data architecture required to make this work.  There are a lot of models and a lot of associations, so take the time to plan out your approach.
2. Build the new PostgreSQL Rails app `$ rails new odin-facebook --database=postgresql`, initialize the Git repo and update the README to link back to this page.
3. Work your way down the list above!  Each step will involve a new challenge but you've got the tools.
4. You can populate data like users and posts using the [Faker](https://github.com/stympy/faker) gem, which is basically just a library of sample names and emails.  It may just be easier, though, for you to write your own seeds in the `db/seeds.rb` file, which gets run if you type `$ rake db:seed`.

</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* For another take on this, here's a [gem-laden Facebook clone](https://github.com/vysakh0/railsbook).
* For an alternative to using AWS S3 for image storage take a look at this [cloudinary](https://github.com/GoGoCarl/paperclip-cloudinary)
