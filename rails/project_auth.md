# Projects: Authentication


*Don't forget to use Git to save your projects!*

In these projects, you'll be working to implement authentication systems so users can only access areas of a site they are authorized to. 

## Project 1: Ruby on Rails Tutorial

We're starting to get into the meaty stuff with the tutorial.  Take your time and pay attention to which file (especially for the specs) you're supposed to be writing in.  A common and frustrating mistake is to put your `describe` block in the wrong place.

You'll implement signin and signout functionality for the user, which opens the door to allow more destructive user behaviors like editing and deleting things (which should only be allowed for a given user or admin).  In Chapter 9, you'll get the chance to implement these functions.

### Your Task

1. Do the [Ruby on Rails Tutorial Chapter 8](https://www.railstutorial.org/book/log_in_log_out), "Log in, log out"
2. Do the [Ruby on Rails Tutorial Chapter 9](http://www.railstutorial.org/book/updating_and_deleting_users), "Updating, showing and deleting users"


## Project 2: Members Only!

In this project, you'll be building an exclusive clubhouse where your members can write embarrassing posts about non-members.  Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

This will be a chance for you to "roll your own" authentication system, very similar to how you did in the tutorial.  As usual, we will be focusing on data and function, not style.  If you want to add your own stylistic flourishes, consider it extra credit.  

It's easy to feel a bit overwhelmed by building your own authentication.  That's because there are several moving parts -- the session controller/form, hanging onto and refreshing the remember token when necessary, and using that token to check up on the current user.  It may help if you write out the steps as you understand them prior to getting started, so you know what you're shaky on and will need to pay attention to.

### Your Task

The projects will be less and less explicit about how to achieve their goals, since we expect you to build on your previous knowledge.  If you don't know how to do something, feel free to check back in previous lessons or projects or Google the correct way to implement it (though be careful, because that may take you deeper down the road than we intended).  The Ruby on Rails Tutorial will be a good reference.

Up until now, we've been treating the "password" field of user submissions pretty cavalierly... it's mostly been an afterthought included for the sake of completeness.  We certainly haven't been storing them properly or encrypting them, which we should.  So wipe all that stuff from your memory because now you've got the tools to properly encrypt user passwords and we'll be doing it from now on.  Actually, you've had the tools since back when you did chapter 6 of the Ruby on Rails Tutorial.

If you'd like to challenge yourself, don't even follow the steps below, just go ahead and build the app!

#### Basic Setup

1. Think about and spec out how to set up your data models for this application.  You'll need users with the usual simple identification attributes like name and email and password but also some sort of indicator of their member status.  They'll need to create posts as well.  Given what you know about passwords, you'll be using a `:password_digest` field instead of a `:password` field.
2. Create your new `members-only` Rails app and Github repo.  Update your README.
3. Start by migrating and setting up your basic User model (no membership attributes yet).
4. Include the `bcrypt-ruby` gem in your Gemfile.  `$ bundle install` it.  (note: This might just be `bcrypt`)
5. Add the `#has_secure_password` method to your User file.
6. Go into your Rails console and create a sample user to make sure it works properly. It probably looks something like: `User.create(:name => "foobar", :email => "foo@bar.com", :password => "foobar", :password_confirmation => "foobar")`
7. Test the `#authenticate` command which is now available on your User model (thanks to `#has_secure_password`) on the command line -- does it return the user if you give it the correct password?
    
    ```bash
        > user = User.create(:name => "foobar", :email => "foo@bar.com", :password => "foobar", :password_confirmation => "foobar")
        > user.authenticate("somethingelse")
        => false
        > user.authenticate("foobar")
        => #<User id: 1, name: "foobar", email: "foo@bar.com", password_digest: "$2a$10$9Lx...", created_at: "2016...", updated_at: "2016...">
    ```

#### Sessions and Sign In

Now let's make sure our users can sign in.

1. Create a `sessions_controller.rb` and the corresponding routes.  Make "sign in" links in the layout as necessary.
2. Fill in the `#new` action to create a blank session and send it to the view.
2. Build a simple form with `#form_for` to sign in the user at `app/views/sessions/new.html.erb`.  Verify that you can see the form.
4. We want to remember that our user is signed in, so you'll need to create a new string column for your User table called something like `:remember_token` which will store that user's special token.
5. When you create a new user, you'll want to give that user a brand new token.  Use a `#before_create` callback on your User model to: 

    1. Create a remember token (use `SecureRandom.urlsafe_base64` to generate a random string)
    2. Encrypt that token (with the `Digest::SHA1.hexdigest` method on the stringified (`#to_s`) version of your token)
    3. Save it for your user.

1. Create a couple of users to populate your app with.  We won't be building a sign up form, so you'll need to create new users via the command line.  Your `#before_create` should now properly give each newly created user a special token.
3. Now fill in the `#create` action of your SessionsController to actually create the user's session.  The first step is to find the user based on their email address and then compare the hash of the password they submitted in the params to the hashed password stored in the database (using `#authenticate`).  See [Chapter 8](http://ruby.railstutorial.org/chapters/sign-in-sign-out#sec-reviewing_form_submission) with questions but try not to immediately copy verbatim -- you're doing this to learn.
4. Once you've verified that the user has submitted the proper password, sign that user in.  
5. Create a new method in your ApplicationController which performs this sign in for you.  Give the user a new remember token (so they don't get stolen or stale).  Store the remember token in the user's browser using a cookie so whenever they visit a new page, we can check whether they are signed in or not.  Use the `cookies.permanent` "hash" to do this.  
7. Create two other helpful methods in your ApplicationController -- one to retrieve your current user (`#current_user`) and another to set it (`#current_user=(user)`).  Retrieving your current user should use the `||=` operator -- if the current user is already set, you should return that user, otherwise you'll need to pull out the remember token from the cookie and search for it in your database to pull up the corresponding user.  If you can't find a current_user, return `nil`.
7. Set your current user whenever a user signs in.
8. Build sign out functionality in your `SessionsController#delete` action which removes the current user and deletes the remember token from the cookie.  It's best if you make a call to a method (e.g. `#sign_out`) in your ApplicationController instead of just writing all the functionality inside the SessionsController.
9. Create a link for signing out which calls the `#delete` method of your session controller.  You'll need to spoof the DELETE HTTP method, but that's easily done by passing `#link_to` the option `:method => :delete`.

#### Authentication and Posts

Let's build those secrets!  We'll need to make sure only signed in users can see the author of each post.  We're not going to worry about editing or deleting posts.

1. Create a Post model and a Posts controller and a corresponding resource in your Routes file which allows the `[:new, :create, :index]` methods.
3. Atop your Posts Controller, use a `#before_filter` to restrict access to the `#new` and `#create` methods to only users who are signed in. Create the necessary helper methods in your ApplicationController.
3. For your Posts Controller, prepare your `#new` action.
4. Write a very simple form in the `app/views/posts/new.html.erb` view which will create a new Post.
5. Make your corresponding `#create` action build a post where the foreign key for the author (e.g. `user_id`) is automatically populated based on whichever user is signed in.  Redirect to the Index view if successful.
6. Fill out the `#index` action of the PostsController and create the corresponding view.  The view should show a list of every post.
7. Now add logic in your Index view to display the author's name, but only if a user is signed in.
8. Sign in and create a few secret posts.
8. Test it out -- sign out and go to the index page.  You should see a list of the posts but no author names.  Sign in and the author names should appear.  Your secrets are safe!

This is obviously a somewhat incomplete solution... We currently need to create new users from the Rails console.  But it should give you some practice figuring out authentication.  Feel free to improve it... maybe you'll be the next SnapChat.  

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/members-only) | [walkthrough](http://jberczel.github.io/members-only-walkthrough/)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project3_Authentication) 
* [Donald's solution](https://github.com/donaldali/odin-rails/tree/master/members-only)
* [TomTom's solution](https://github.com/tim5046/projectOdin/tree/master/Rails/membersOnly/members-only)
* [Jonathan's solution](https://github.com/faulk49/members-only)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Gossip-Club)
* [Erithair's solution](https://github.com/N19270/members-only) | [View in browser](https://members-only.herokuapp.com/)
* [Vidul's Solution](https://github.com/viparthasarathy/members-only)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/members-only) | [View in browser](https://members-only-sample-blog.herokuapp.com)
* [Nikola Čvorović's solution](https://github.com/cvorak/members-only)
* [Jason Matthews' solution](https://github.com/fo0man/members-only)
* [Sasikala's solution](https://github.com/Sasikala-Ravichandran/clubhouse)
* [Dominik Stodolny's solution](https://github.com/dstodolny/members-only)
* [Lara Finnegan's solution](https://github.com/lcf0285/members-only)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/members-only) | [View in browser](https://mysterious-tundra-4233.herokuapp.com/)
* [Frank Peelen's solution](https://github.com/FrankPeelen/members-only)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/tree/master/members_only)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_members_only) | [View in browser](https://serene-sands-9936.herokuapp.com/)
* [dchen71's solution](https://github.com/dchen71/members-only)
* [Matias Pan's solution](https://github.com/kriox26/members-only) | [View in browser](https://stark-dawn-4299.herokuapp.com/)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/members-only)
* [Dan Hoying's solution](https://github.com/danhoying/members_only)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/members-only)
* [Aviv Levinsky's solution](https://github.com/pugsiman/members-only) | [View in browser](https://guarded-brook-9440.herokuapp.com/)
* [Hassan Mahmoud's solution](https://github.com/HassanTC/members-only) | [View in browser](https://sleepy-citadel-6281.herokuapp.com/)
* [Radi Totev's solution](https://github.com/raditotev/members-only)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/members-only)
* [srashidi's solution](https://github.com/srashidi/Authentication/tree/master/members-only)
* [Luke Walker's solution](https://github.com/ubershibs/rails_course/tree/master/members-only)
* Add your solution above this line!


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


*
