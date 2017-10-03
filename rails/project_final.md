### Project: Building Facebook

You've come a long way, congratulations! At this point, you should feel comfortable with building new Rails applications, modelling data, and working with forms. This project will require you to put all your newfound knowledge to the test.  It should serve as a great portfolio piece for what you're capable of.  It'll take some thought and time but it's certainly within reach of your skills.

You'll be building Facebook.  As usual, any additional styling will be up to you but the really important stuff is to get the data and back end working properly.  You'll put together some of the core features of the platform -- users, profiles, "friending", posts, news feed, and "liking".  You'll also implement sign-in with the real Facebook by using Omniauth and Devise.

Some features of Facebook we haven't yet been exposed to -- for instance chat, realtime updates of the newsfeed, and realtime notifications.  You won't be responsible for creating those unless you'd like to jump ahead and give it a shot.

### Your Task

Build Facebook!  You'll build a large portion of the core Facebook user functionality in this project.  We won't be worrying about the Javascript-heavy front end stuff but you won't need it to get a nice user experience.

You should write at least a basic set of integration tests which let you know if each page is loading properly and unit tests to make sure your associations have been properly set up (e.g. testing that `User.first.posts` works properly).  Run them continuously in the background with [Guard](https://github.com/guard/guard) (See the [Ruby on Rails Tutorial Chapter 3.7.3](https://www.railstutorial.org/book/static_pages#sec-guard)).

This project will give you a chance to take a relatively high level set of requirements and turn it into a functioning website.  You'll need to read through the documentation on Github for some of the gems you'll be using.

Keep the following requirements in mind.  We'll cover specific steps to get started below this list:

1. Use Postgresql for your database from the beginning (not sqlite3), that way your deployment to Heroku will go much more smoothly.  See the [Heroku Docs](https://devcenter.heroku.com/articles/getting-started-with-rails4) for setup info.
1. Users must sign in to see anything except the sign in page.
2. User sign-in should use the [Devise](https://github.com/plataformatec/devise) gem.  Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and `#current_user` methods.  See the [Railscast](http://railscasts.com/episodes/209-introducing-devise?view=asciicast) (which uses Rails 3) for a step-by-step introduction.  The docs will be fully current.
1. Users can send Friend Requests to other Users.
2. A User must accept the Friend Request to become friends.
3. The Friend Request shows up in the notifications section of a User's navbar.
2. Users can create Posts (text only to start).
3. Users can Like Posts.
4. Users can Comment on Posts.
5. Posts should always display with the post content, author, comments and likes.
5. Treat the Posts Index page like the real Facebook's "Timeline" feature -- show all the recent posts from the current user and users she is friends with.
4. Users can create a Profile with a Photo (just start by using the Gravatar image like you did in the Rails Tutorial).
5. The User Show page contains their Profile information, photo, and Posts.
6. The Users Index page lists all users and buttons for sending Friend Requests to those who are not already friends or who don't already have a pending request.
7. Sign in should use [Omniauth](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview) to allow a user to sign in with their real Facebook account.  See the [RailsCast](http://railscasts.com/episodes/360-facebook-authentication?view=asciicast) on FB authentication with Devise for a step-by-step look at how it works.
8. Set up a [mailer](http://guides.rubyonrails.org/action_mailer_basics.html) to send a welcome email when a new user signs up.  Use the `letter_opener` gem ([see docs here](https://github.com/ryanb/letter_opener)) to test it in development mode.
8. Deploy your App to Heroku.
9. Set up the [SendGrid add-on](https://devcenter.heroku.com/articles/sendgrid) and start sending real emails.  It's free for low usage tiers.

*Extra Credit:*

1. Make posts also allow images (either just via a URL or, more complicated, by uploading one).
2. Use the [Paperclip](https://github.com/thoughtbot/paperclip) gem to allow users to upload a photo to their profile.
3. Make your post able to be either a text OR a photo by using a polymorphic association (so users can still like or comment on it while being none-the-wiser).
3. Style it up nicely! We'll dive into HTML/CSS in the next course.

#### Getting Started

1. Think through the data architecture required to make this work.  There are a lot of models and a lot of associations, so take the time to plan out your approach.
2. Build the new postgresql rails app `$ rails new odin-facebook --database=postgresql`, initialize the Git repo, and update the README to link back to this page.
3. Work your way down the list above!  Each step will involve a new challenge but you've got the tools.
1. You can populate data like users and posts using the [Faker](https://github.com/stympy/faker) gem, which is basically just a library of sample names and emails.  It may just be easier, though, for you to write your own seeds in the `db/seeds.rb` file, which gets run if you type `$ rake db:seed`.


### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* Add your solution below this line!
* [leosoaivan's solution](https://github.com/leosoaivan/TOP_ror_odinfb) | [View in browser](https://obscure-springs-25850.herokuapp.com/)
* [adsy430's soluction](https://github.com/adampal/facebook-clone) | [Fakebook](https://peaceful-everglades-48148.herokuapp.com/)
* [holdercp's solution](https://github.com/holdercp/odin-facebook) | [Live site](https://friend-space.herokuapp.com/)
* [jfonz412's Solution](https://github.com/jfonz412/facebook-clone) | [View in browser](https://mysterious-anchorage-62529.herokuapp.com/)
* [Sic's Solution](https://github.com/sic-f/fb) | [View in browser](https://efbook.herokuapp.com)
* [Rob's Solution](https://github.com/RobPando/odin-book) | [View in browser](https://robodinbook.herokuapp.com)
* [Rhys B's solution](https://github.com/105ron/odin-book) | [View in browser](http://odin-book.herokuapp.com/)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/RailsBoock-Facebook-Clone-App) | [View in browser](http://railsbook-facebook-clone-app.herokuapp.com/)
* [Yuri Buerov's solution](https://github.com/YuriBuerov/social-network)
* [David Janczyn's solution](https://github.com/sandiegodj/social-network) | [View in browser](https://warm-spire-7655.herokuapp.com/)
* [Aleksandar Rodić's solution](https://github.com/rodic/odin-facebook-clone) | [View in browser](https://odin-facebook.herokuapp.com/)
* [Jason Matthews' solution](https://github.com/fo0man/odin-spacebook) | [View in browser](https://warm-beach-7362.herokuapp.com/)
* [Donald's solution](https://github.com/donaldali/odinbook "Odinbook on GitHub") | [View in browser](https://dna-odinbook.herokuapp.com/ "Odinbook on Heroku")
* [Dominik Stodolny's solution](https://github.com/dstodolny/odinbook) | [View in browser](https://warm-bayou-3284.herokuapp.com/)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_facebook) | [View in browser](https://shielded-escarpment-2283.herokuapp.com/)
* [Alex's Solution](https://github.com/alexgh123/fb_odin_app) | [View in browser] (http://polar-oasis-7608.herokuapp.com)
* [Jeremy Mauzy's Solution](https://github.com/apositivejam/fakebook) | [View in browser] (http://odin-fakebook.herokuapp.com)
* [dchen71's Solution](https://github.com/dchen71/odin-facebook) | [View in browser] (https://secure-citadel-9611.herokuapp.com/)
* [James Kelsey's Solution (No tests, Ajaxy)](https://github.com/jamesmskelsey/jk-odin-book) | [View in browser](https://jk-odin-book.herokuapp.com/)
* [Matias Pan's solution (RSpec, Capybara, Ajax)](https://github.com/kriox26/odin_book) | [View in browser](https://polar-river-1192.herokuapp.com)
* [Radi Totev's solution](https://github.com/raditotev/odin-facebook) | [View in browser](https://odin-facebook-clone.herokuapp.com)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/social-network) | [View in browser](https://pure-meadow-87105.herokuapp.com/)
* [Luke Walker's solution](https://github.com/ubershibs/odin-fb) | [View in browser](https://floating-bayou-78146.herokuapp.com/users)
* [srashidi's solution](https://github.com/srashidi/Rails_Final_Project/tree/master/odin-facebook) | [View in browser](https://calm-harbor-69843.herokuapp.com/)
* [Scott Bobbitt's solution](https://github.com/sco-bo/fake_book) | [View in browser](https://hidden-chamber-98363.herokuapp.com/)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project13--odin-facebook/odin-facebook)
* [Miguel Herrera's solution](https://github.com/migueloherrera/odin-facebook)
* [James Brooks's solution](https://github.com/jhbrooks/odinbook) | [View in browser](https://rocky-mountain-92199.herokuapp.com/)
* [Top's solution](https://github.com/TopOneOfTopOne) | [View in browser](https://github.com/TopOneOfTopOne/the-facebook)
* [Matt Velez's solution](https://github.com/Timecrash/odinbook) | [View in browser](https://velez-odinbook.herokuapp.com/)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/ror_book) | [View in browser](http://murmuring-escarpment-57044.herokuapp.com/)
* [Frank V's solution](https://github.com/fv42wid/oden-facebook)
* [Amrr Bakry's solution](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/odin_facebook) | [View in browser](https://nameless-escarpment-82289.herokuapp.com/)
* [David Chapman's solution (no styling)](https://github.com/davidchappy/facebook) | [View in browser](https://dac-friends-app.herokuapp.com/)
* [Oscar Y's solution (No tests and unstyled)](https://github.com/mysteryihs/odin-facebook) | [View in browser](http://guarded-bastion-44854.herokuapp.com/)
* [Sophia Wu's solution](https://github.com/SophiaLWu/book-of-faces) | [View in browser](https://frozen-sands-98166.herokuapp.com/)
* [Jerry Gao's solution](https://github.com/blackwright/tracebook) | [View in browser](https://tracebook.herokuapp.com/)
* [Austin's solution](https://github.com/CouchofTomato/odinbook) | [View in browser](https://couch-odinbook.herokuapp.com)


### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* For another take on this, here's a [gem-laden Facebook clone](https://github.com/vysakh0/railsbook).
