### Warmup: Sending Params with RestClient

In this project, you'll get a chance to interact with a Rails application from the command line by sending requests manually.  You'll first build a very simple app (to get some practice with the steps involved in creating a new one) and then a simple script which uses the RestClient gem (which you used in the first project) to send some requests and examine the server output.

There's a lot of steps but it's actually quite straightforward.

### Your Task

<div class="lesson-content__panel" markdown="1">

#### Application Skeleton

First you need to create a simple Rails app:

1. Create a new Rails application "rest-tester" (remember the `$ rails new` command?).  Go (`cd`) into the application folder and open it up in a text editor.
2. Let's start from the top -- creating the routes necessary to serve up our users.  Go to `config/routes.rb` and add the users resources with `resources :users`.
3. Quiz: Which routes were just created (there are 7 of them)?  More specifically, try to name the 7 actions and what they do.  Now try to match these routes to the appropriate HTTP verbs and URLs (remember, some are created by using the same URL but a different HTTP verb).
4. Verify by using `$ rake routes`

#### Test Script

Next create a simple script file which will run RestClient and allow you to start pinging your new app:

1. Create a blank file at `app/script/rest_requestor.rb`.  You'll probably need to create a new folder.  This `script` folder is just a convenient place to store our scripts, which we'll be calling explicitly from the command line.  There's nothing special about it.
2. What's the simplest way to make a request?  Just use the `#get` method of `rest-client` and `#puts` that output to the terminal:

   ~~~ruby
     # app/script/rest_requestor.rb
     require 'rest-client'
     url = "http://localhost:3000"

     puts RestClient.get(url)
   ~~~
3. If you want to get creative, use `#gets` and `#chomp` to allow you to enter input from the command line.

#### Sending Requests

1. Run the script using `$ ruby app/script/rest_requestor.rb`.  Error! You don't have anyone waiting for the request.
2. You'll need to fire up your rails server.  Go to a new tab or window (but make sure you're in your application's directory still) and run the server using `$ rails server`
3. Try to run the script again.  It should output a whole bunch of HTML which represents the default Rails homepage.
4. Change your script file to go to `http://localhost:3000/users` instead.  Run it again.
5. This time you should receive a different error, something like `404 Resource Not Found`.  Your application is throwing an error, but why?  Go to the tab that is running your server and check the server logs.  You should see something saying `ActionController::RoutingError (uninitialized constant UsersController):` on top of a long stack trace.  Okay, it's looking for a controller, that makes sense... we don't have one.
6. Create a blank controller to serve our users.  You can manually create the file at `app/controllers/users_controller.rb` (just remember to have it inherit from `ApplicationController`), or you could also create it using one of the Rails generators on the command line (which just plops out a bunch of files).  Try `$ rails generate controller Users`.  If you run the generator, it will also give you a bunch of test and javascript/css files, as well as a folder to store the views in at `app/views/users`.  You can avoid generating the test files (it makes no difference for this) by adding `--no-test-framework` to the end of the generator command.
7. Run your script again.  Another error! Back to the server logs and... we see `AbstractController::ActionNotFound (The action 'index' could not be found for UsersController):`.  It sure seems like the request was routed to the controller and, as you'd expect for a `GET` to the `/users` URL, it's looking for the `#index` action but it couldn't find the action. That's because we haven't created the methods yet in our controller.
8. Create the 4 methods that correspond to GET requests.  Each method should set an instance variable to display the method name:

   ~~~ruby
   # app/controllers/users_controller.rb
   def index
     @name = "I am the Index action!"
   end
   ~~~
9. Now try running the script again. #$%&! Still an error.  This time our server is saying `ActionView::MissingTemplate (Missing template users/index...`.  That sounds like a view error... but of course.  You know that the index action would complete and then automatically go looking for the `app/views/users/index.html.erb` view file to render.
10. Fix this by creating a view file for each of the 4 actions that require it.  It should put the action's name in `<h1>` tags, e.g.:

    ~~~html
      # app/views/users/index.html.erb
      <h1><%= @name %></h1>
    ~~~
11. Rerun the script.... and.... YAY!  You should see some HTML.  Most of it is generated from your layout file at `app/views/layouts/application.html.erb`, including lots of turbolinks calls but then, near the bottom, you should see your lonely `<h1>` tag.  Success!
12. Take a look at the layout file at `app/views/layouts/application.html.erb` file and add some arbitrary HTML tags before and after the `<%= yield %>` line and rerun your request to see where they pop up in the returned HTML.
13. Change your script file to make each of the remaining 3 GET requests.  For the ones that relate to a specific resource (e.g. `#show`), you'll need to include an ID value in the URL (which we won't actually be using).

#### Non-GET Requests

1. Now create the `#create` action in your controller, which would be accessed using a POST request.  Update your script to make a simple POST `#post` request sending no data, e.g. `RestClient.post(url,"")`.  See the [RestClient Docs](https://github.com/rest-client/rest-client) for info on how to structure the non-GET requests.
2. Error!  Back to the server: `ActionController::InvalidAuthenticityToken (ActionController::InvalidAuthenticityToken):`.  Aha! Rails doesn't like it when you try to make POST requests to your application using the command line since POST requests typically represent the submission of form data which may be sensitive.  The same is true for DELETE and PATCH requests.

We'll get more into this in the lesson on forms, but basically Rails will send a special token code when it renders a form in the webpage and then it only accepts the response if the form sends back that token with the submission.  Since you are operating directly from the command line and never got that original token, Rails won't accept your request.  Food for thought.

Hopefully this has been a useful adventure into the request cycle of a Rails app and given you a chance to get a bit familiar with basic app creation and setup and routing.  Feel free to send feedback.

</div>

### Project: Ruby on Rails Tutorial

In this chapter of the tutorial you will build out the look and feel of the application using Twitter's Bootstrap CSS framework.  If you're feeling shaky on CSS, check out the [CSS Lesson in the Web Development 101 course](/courses/web-development-101/lessons/html-and-css-basics).

Bootstrap will do a lot of the heavy lifting for you -- instead of having to figure out how to make your navbar stick to the top of the screen, you just have to put the correct class onto some `<div>` tags and Bootstrap's style files will take over for you.  It's a good way to quickly get something half decent up and running.  In the course on HTML and CSS, you'll get the chance to design your own CSS framework, but for now Bootstrap is a good weapon of choice.

### Your Task

<div class="lesson-content__panel" markdown="1">
  1. Do the [Rails Tutorial Chapter 5](https://www.learnenough.com/ruby-on-rails-4th-edition-tutorial/filling_in_the_layout), "Filling in the Layout"
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Bootstrap's Current Version Docs](http://getbootstrap.com/)
* [Rails Guides chapter on Integration Testing](http://guides.rubyonrails.org/testing.html#integration-testing)
* [RestClient Documentation](https://github.com/rest-client/rest-client)
