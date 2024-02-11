### Introduction

In these projects, you'll be working to implement authentication systems so users can only access areas of a site they are authorized to.

### Project: Members only!

In this project, you'll be building an exclusive clubhouse where your members can write anonymous posts. Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

If you want to add your own stylistic flourishes, consider it extra credit.

### Your task

The projects will be less and less explicit about how to achieve their goals, since we expect you to build on your previous knowledge.  If you don't know how to do something, feel free to check back in previous lessons or projects or Google the correct way to implement it (though be careful, because that may take you deeper down the road than we intended).

If you'd like to challenge yourself, don't even follow the steps below, just go ahead and build the app!

<div class="lesson-content__panel" markdown="1">
#### Basic setup

1. Think about and spec out how to set up your data models for this application. You'll need users with the usual identification attributes like name, email and password. They'll need to create posts as well.
2. Create your new `members-only` Rails app and GitHub repo.  Update your README.
3. Add devise to your Gemfile and install it in your app using set up instructions on the devise [README](https://github.com/heartcombo/devise)

*note: For getting Devise to play nicely with Turbo Drive, be sure you read [this section](https://github.com/heartcombo/devise#hotwireturbo) of the Devise README. You’ll need to install the [Responders gem](https://github.com/heartcombo/responders). Make sure that in addition to adding the gem to your Gemfile that you also run the install generator. You’ll also need to specify delete requests on your links/buttons for signing the user out. More detailed information can be found in [Devise’s Guide for Hotwire Turbo Integration](https://github.com/heartcombo/devise/wiki/How-To:-Upgrade-to-Devise-4.9.0-%5BHotwire-Turbo-integration%5D).*

#### Authentication and posts

Let's build those secrets!  We'll need to make sure only signed in users can see the author of each post.  We're not going to worry about editing or deleting posts.

1. Create a Post model and a Posts controller and a corresponding resource in your Routes file which allows the `[:new, :create, :index]` methods.
2. Atop your Posts Controller, use a `#before_action` to restrict access to the `#new` and `#create` methods to only users who are signed in.
3. For your Posts Controller, prepare your `#new` action.
4. Write a form in the `app/views/posts/new.html.erb` view which will create a new Post.
5. Make your corresponding `#create` action build a post where the foreign key for the author (e.g. `user_id`) is automatically populated based on whichever user is signed in.  Redirect to the Index view if successful.
6. Fill out the `#index` action of the PostsController and create the corresponding view.  The view should show a list of every post.
7. Now add logic in your Index view to display the author's name, but only if a user is signed in.
8. Sign in and create a few secret posts.
9. Test it out -- sign out and go to the index page.  You should see a list of the posts but no author names.  Sign in and the author names should appear.  Your secrets are safe!

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Railscasts #250 Authentication from Scratch](http://railscasts.com/episodes/250-authentication-from-scratch-revised)
- [Railscasts #274 Remember Me & Reset Password](http://railscasts.com/episodes/274-remember-me-reset-password)
- Watch [A Twitter Clone Lets Build with Ruby on Rails Part 1](https://www.youtube.com/watch?v=loYfUpwoLlM&t=3s)
and [A Twitter Clone Lets Build with Ruby on Rails Part 2](https://www.youtube.com/watch?v=fyj70TbS75c&t=474s). If you still need more inspiration for this project or want more insight then the rest of this tutorial series is a good resource.
