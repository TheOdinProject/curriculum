# Projects: Active Record Basics
<!-- *Estimated Time: 6-10 hrs* -->

*Don't forget to use Git to save your projects!*

In this project, you'll get to spend some quality time with models.  The tutorial will give you a chance to apply some of what you've learned in a structured environment and then the additional project will give you the chance to do it on your own.

## Warmup: Thinking Data First

The first step to building a good data model is usually not on the computer.  You'll want to take a minute and think through what you're going to need.  You may not really know everything when you first start, but mapping out an approach path is crucial to avoiding costly mistakes later.

In this warmup, you'll be given a variety of scenarios and you'll be asked to map out what the data models will look like for each one.  You can do it with a pen and paper or, if you're lucky enough to be around one, a whiteboard. There are a few specific accepted techniques for how to map out models and associations but just do whatever comes naturally to you.  One way to do it is with a list of models and another is to create a visual diagram where each model is represented by a box and you connect them with appropriate arrows.

For each scenario, you'll be asked to write down the data, associations, and validations necessary to build it.  That means which models (data tables) will be necessary to store the data (and which columns you will need), which fields of those tables will be subject to validation (e.g. minimum password length or username uniqueness).  Don't worry if you're not quite sure how to implement a given thing, the point here is to start thinking about how the data would be structured.

Example: You are building a blog for your startup which will have multiple authors and each author can write multiple posts.

This might look like:

*Note: I'll include the `:id`, `:created_at` and `:updated_at` columns but you can safely assume they're always there since Rails or the database gives them to you automatically*

* Authors

        username:string [unique, 4-12 chars, present]
        email:string [unique, present]
        password:string [6-16 chars, present]
        id:integer
        created_at:datetime
        updated_at:datetime

        has_many posts

* Posts

        title:string [unique, present]
        body:text [present]
        author_id:integer [present]
        id:integer
        created_at:datetime
        updated_at:datetime

        belongs_to author

Use whatever format feels best to you.

### Your Task

For each of the following scenarios, write down the models, columns, validations and associations you might use to implement it.  Some of these are more difficult than others and you'll have to use a bit of creativity to infer which columns might need to be present for the scenario to make sense in the real world.  

The trick is identifying what should be a different model and how these models will relate to each other via simple associations (all the ones below are `has_many`, `has_one` and/or `belongs_to` relationship).  If you can't quite figure out how it might look, keep the scenario in mind as you go through the next few lessons.

Remember, if you feel like you will be hard coding data multiple times, it's probably a sign that you should create a separate table.  A common example is address information -- you could write down the city and state explicitly for each user.  How about making separate City and State models and relating them to each other?  

1. You are building an online learning platform (much like this!).  You've got many different courses, each with a title and description, and each course has multiple lessons.  Lesson content consists of a title and body text.
2. You are building the profile tab for a new user on your site.  You are already storing your user's username and email, but now you want to collect demographic information like city, state, country, age and gender.  Think -- how many profiles should a user have?  How would you relate this to the User model?
3. You want to build a virtual pinboard, so you'll have users on your platform who can create "pins".  Each pin will contain the URL to an image on the web.  Users can comment on pins (but can't comment on comments).
4. You want to build a message board like [Hacker News](http://news.ycombinator.com).  Users can post links.  Other users can comment on these submissions or comment on the comments.  How would you make sure a comment knows where in the heirarchy it lives?

## Project 1: Ruby on Rails Tutorial

This chapter of the tutorial will give you a chance to start working with the database and models.  It will guide you through setting up your first database migrations, making sure your user inputs are properly validated, and how to add a secure password to your User model.

## Your Task

1. Do the [Ruby on Rails Tutorial chapter 6](https://www.railstutorial.org/book/modeling_users), "Modeling Users".


## Project 2: Micro-Reddit

Let's build [Reddit](http://reddit.com).  Well, maybe a very junior version of it called `micro-reddit`.  In this project, you'll build the data structures necessary to support link submissions and commenting.  We won't build a front end for it because we don't need to... you can use the Rails console to play around with models without the overhead of making HTTP requests and involving controllers or views.

### Your Task

#### Get Started

1. Just like in the warmup, plan out what data models you would need to allow users to be on the site (don't worry about login/logout or securing the passwords right now), to submit links ("posts"), and to comment on links.  Users do NOT need to be able to comment on comments... each comment refers to a Post.
2. Generate a new rails app from the command line (`$ rails new micro-reddit`) and open it up.  We'll use the default SQLite3 database so you shouldn't have to change anything on that front.
2. Generate your User model and fill out the migration to get the columns you want.
3. Run the migration with `$ rake db:migrate`.  You can use `$ rake db:rollback` if you realize you forgot anything or just create a new migration for the correction (which might involve the `#add_column` `#remove_column` or `#change_column` commands).  See the [Rails API Documentation](http://api.rubyonrails.org/classes/ActiveRecord/Migration.html) for details on syntax and available methods.

#### Playing with Validations

4. In a new tab, open up the `$ rails console`.  Try asking for all the users with `> User.all`.  You should get back an empty array (no users yet!).  Now create a blank new user and store it to a variable with `> u = User.new`.  This user has been created in the ether of Ruby's memory but hasn't been saved to the database yet.  Remember, if you'd used the `#create` method instead of the `#new` method, it would have just gone ahead and tried to save the new user right off the bat.  Instead, we now get to play with it.  
5. Check whether your new user is actually valid (e.g. will it save if we tried?).  `> u.valid?` will run all the validations.  It comes up `true`... surprise! We haven't written any validations so that's to be expected.  It's also a problem because we don't want to have users running around with blank usernames.
5. Implement the user validations you thought of in the first step in your `app/models/user.rb` file.  These might involve constraints on the size of the username and that it must be present (otherwise you'll potentially have users with no usernames!) and that it must be unique.
6. Reload your console using `> reload!`.  You'll need to do this every time you make changes to your app so the console can reload the current version.  If it still seems broken, just `> quit` out of it and relaunch (sometimes `#reload!` doesn't seem to do the trick).  Build another new user but don't save it yet by using `> u2 = User.new`. Run `> u.valid?` again to run the validations and it should come up false. Good.
7. How do we find out what went wrong?  Rails is helpful because it actually attaches error messages directly onto your user object when you fail validations so you can read into them with the `#errors` method.  Try out `> u.errors` to see the errors or, better, `> u.errors.full_messages` to return a nice friendly array of messages.  If you wrote custom messages into your validations, they will show up here as well.
8. Create a user who will actually save with `> u3 = User.new(your_attributes_here)` and run the validations.  They should come up true.  Save your user with the `#save` method so you've got your first user in the database.

#### Playing with Associations

9. Create your Post model by referencing your data plan from the first step above, migrate the database, and add its validations.
10. Test your validations from the console, remembering to reload or relaunch it between changes.
11. Now set up your associations between User and Post models.  Did you remember to include the foreign key column (`user_id`) in your posts table?  If not, you can just add a new migration (`$ rails generate migration yourmigrationname`) and use the `#add_column` method mentioned above.
12. If you've properly set up your associations, you should be able to use a few more methods in the console, including finding a User's Posts and finding the Post's User.  First test finding your lonely User's Posts -- `> User.first.posts`.  It should be an empty array since you haven't created posts, but it shouldn't throw an error at you.
1. Build (but don't yet save) a new post from the console, called `p1`, something like `> p1 = Post.new(your_attributes_here)`.  Don't forget to include the ID of the user in your `user_id` field!
2. Now build another post using the association to the user -- substitute `#new` with `#build` and run through the association instead -- `p2 = User.first.posts.build`.  Don't fill in any fields yet.  Examine the object that was created and you'll see that the ID field already got filled out for you, cool! This is a neat trick you'll learn about in the lesson on associations.  
3. Save your original new post `p1` so your user has officially written something.  Test that you can use the other side of the association by trying `> Post.first.user`, which should return the original User object whose ID you pointed to when building the post.  All has come full circle!

#### Add in Commenting

1. You've now got a User and a Post and they've been linked. Commenting will look quite similar to your Post model but will be related not just to the post who is its "parent" but also to the user who has authored it.  Set up the migration and migrate the database for your Comment model.
2. As before, add validations into your model and test them out in the console (refresh it!).  Make sure you've required the two foreign keys (for posts and users) to be submitted, otherwise you could potentially have an orphan comment.  You should not be able to save an invalid Comment and be able to save a valid Comment.
3. Build a second user and create a new comment which represents this user commenting on the first user's post.
3. As before, add the associations you need between users, posts, and comments.  You'll need to be able to do the following methods successfully from the console (assuming your second user has an ID of 2):

    1. `> u2 = User.find(2)`
    2. `> c1 = u2.comments.first` should return that user's comment.  `#comments` returns an array with comments, which is why we need to use `#first` to actually retrieve the comment itself.
    3. `> c1.user` should return that comment's author User (`u2`).
    4. `> p1 = Post.first`
    5. `> p1.comments.first` should return the comment `c1`.
    6. `> c1.post` should return the post `p1`.

If any of those don't work, double check your associations.  Sometimes the error messages can be helpful in prompting you for how to set up those associations.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Voizzzz' solution](https://github.com/voizzzz/microreddit)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/micro-reddit) | [walkthrough](http://jberczel.github.io/micro-reddit-walkthrough/)
* [Afshin's solution](https://github.com/afshinator/micro-reddit)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project3_ActiveRecordBasics/micro-reddit)
* [Donald's solution](https://github.com/donaldali/odin-rails/tree/master/micro-reddit)
* [TomTom's solution](https://github.com/tim5046/projectOdin/tree/master/Rails/microReddit/micro-reddit)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/project-micro-redit)
* [Tommy Noe's solution](https://github.com/thomasjnoe/micro-reddit)
* [Vincent's solution](https://github.com/wingyu/micro_reddit)
* [Vidul's solution](https://github.com/viparthasarathy/micro-reddit)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/micro-reddit)
* [Nikola Čvorović's solution](https://github.com/cvorak/micro-reddit)
* [Julian Feliciano's solution](https://github.com/JulsFelic/micro-reddit)
* [Sasikala's solution](https://github.com/Sasikala-Ravichandran/micro-reddit)
* [Jason Matthews' solution](https://github.com/fo0man/micro-reddit)
* [Dominik Stodolny's solution](https://github.com/dstodolny/micro-reddit)
* [Trump's solution](https://github.com/trump812/micro-reddit)
* [Lara Finnegan's solution](https://github.com/lcf0285/micro-reddit)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/Micro-reddit)
* [Eduardo Frias' solution](https://github.com/feek1g/theodinproject/tree/master/RubyOnRails/micro-reddit)
* [Frank Peelen's solution](https://github.com/FrankPeelen/micro-reddit)
* [Bhupendra Singh's solution](https://github.com/bhupendra11/Odin-RubyOnRails-full/tree/master/micro-reddit)
* [dchen71's solution](https://github.com/dchen71/micro-reddit)
* [Matias Pan's solution](https://github.com/kriox26/micro-reddit)
* [Alex Chen's solution](https://github.com/Chenzilla/micro_reddit)
* [Dan Hoying's solution](https://github.com/danhoying/micro_reddit)
* [Aviv Levinsky's solution](https://github.com/pugsiman/micro-redit)
* [Hassan Mahmoud's solution](https://github.com/HassanTC/Micro-Reddit)
* [Alex Tsiras' solution](https://github.com/arialblack14/micro_reddit)
* [Patrick Mallee's solution](https://github.com/patmallee/micro-reddit)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/micro-reddit)
* Add your solution above this line!

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* The [Rails API](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html) has good documentation for these things, in addition to the Edge Guides you've already read.  Often it can be easier to search Google for the proper API page than navigating the site, e.g. "rails api has_many".
* [JumpstartLab page on Model Relationships](http://tutorials.jumpstartlab.com/topics/models/relationships.html) has some good unique information on how to approach optimizing common associations.
