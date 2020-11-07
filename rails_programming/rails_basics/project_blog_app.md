### Introduction

In this project, you'll get the opportunity to actually build a real Rails application.  It's not a trivially simple one either -- it's got a lot of wrinkles and things that you're not going to understand.

To be honest, you're kind of going into the deep end so don't worry if you don't understand what exactly you're doing in all the steps.  The point here is to get familiar with the process of creating a Rails app, what things generally look like, and what you don't know.  When you get to the end of this project, you can consider yourself remarkably persistent and resilient.

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Do the [Jumpstart Lab's Blogger Tutorial](http://tutorials.jumpstartlab.com/projects/blogger.html) sections I0 through I4. Follow the instructions at the end of the first section to set up a GitHub repository for this project.
  2. Pay attention to any error messages you get, both planned (because the tutorial walks you through a common error-guided workflow) and unplanned (likely for things like spelling errors).  You'll see all these messages again and again when you're building Rails apps, so it's helpful to start getting familiar with which portions of the message you should pay attention to (and maybe put into Google if you can't figure out what caused it).
  3. At the end of I3: Tags when you're attempting to delete your Article tags, you'll run into an error along the lines of "FOREIGN KEY constraint failed". You can solve this by enforcing [Referential Integrity](https://en.wikipedia.org/wiki/Referential_integrity) by applying the `dependent: :destroy` option for the `has_many` method in the right model. You can learn about it in [This Entry of the Rails Guides](http://guides.rubyonrails.org/association_basics.html)
  4. Here's a [helpful gist with common Blogger problems](https://gist.github.com/burtlo/4970471) if you're running into issues with routes, deleting, partials, and `redirect_to`.
  5. If you're feeling ambitious, add in authentication in section I5.
  6. If you're feeling very ambitious, try doing the final Extras section I6.
  7. Don't forget to deploy your app to Heroku!  [Review Heroku deployment here.](https://www.theodinproject.com/courses/ruby-on-rails/lessons/deployment)
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* The [official Ruby on Rails guides](http://guides.rubyonrails.org/) are an excellent resource if you want to build on your knowledge.
* If you want, you can use [The Ruby on Rails Guides: Getting Started](http://guides.rubyonrails.org/getting_started.html) to add some extra features to your blog, such as [deleting comments](http://guides.rubyonrails.org/getting_started.html#deleting-comments).
* You can read the [Introduction to Core Ruby Tools](https://launchschool.com/books/core_ruby_tools/read/introduction) from LaunchSchool to get a better understanding of Ruby and Rails concepts such as gems, version managers, bundler, and rake.
