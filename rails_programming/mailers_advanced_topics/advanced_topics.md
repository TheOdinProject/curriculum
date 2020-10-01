### Introduction

There are some topics that we just haven't had a chance to get into yet but will prove useful for you to know.  In this section we'll cover advanced routing, layouts, and a brief introduction to metaprogramming.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

* When do you need to use a singular Resource vs a plural Resources in your router?
* What is the "missing" route when using a singular Resource? (there are only 6 when you `$ rake routes`)  What else is missing from many of the other routes?
* Why would you use nested routes?
* What order do you specify their respective IDs? What are they called in `params`?
* Why might you use a "member" route?
* How are "member" and "collection" routes incredibly similar?  Slightly different?
* How do you set up a redirect route that also passes along any parameters?
* How do you name a route using an alias?
* Why might you want to use nested or multiple layouts?
* How would you (roughly) go about implementing this?
* How can you pass variables between your layouts?
* How do you `#yield` to `#content_for` content?
* What is metaprogramming?
* How do you use the `#send` method to run a method?
* How do you create a new method on the fly?
* When does Ruby call the `#method_missing` method?
* How can you use `#method_missing` to your advantage?
* What are Design Patterns?
* What are the SOLID principles?

### Advanced Routing

You should be quite familiar by now with the bread and butter of routing -- converting RESTful requests using the familiar HTTP verbs into mappings for specific controller actions (whether using the `#resources` method or explicitly specifying them using the `get` method.  That's 90% of what you'll use your routes file for... but that other 10% gives you some pretty neat options like redirecting directly from the routes file, nesting routes inside each other, or parsing parameters from the incoming request.

#### Singular Resources

You might have already run into this at some point without necessarily understanding it.  Up until now, we've been talking about resources (like "posts" and "users") where there are a whole lot of them.  It seems fairly intuitive.  In your `config/routes.rb` file, you represent these simply with a single line like `resources :users`.

Sometimes there are also resources where it actually only makes sense for there to be one.  An example would be a User dashboard which displays interesting facts based on whichever user is logged in.  There is only one dashboard template, it just happens to be smart enough to display things that are relevant for the user who is currently logged in.

In this case, it doesn't make a whole lot of sense to display an "index" of dashboards, since there is only one (it just changes based on who is logged in).  We can also say that, for any of the other actions which would normally require an ID to differentiate which resource we're operating on (like `#show`), since there's only one, we no longer need the `id` parameter.

The routes file line for a singular resource would look like:

~~~ruby
  # in config/routes.rb
  resource :dashboard
~~~

Just note that the word "resource" is singular and so is `dashboard`.  That trips up a lot of people who make the typo of writing "resource" instead of "resources" when they really want plural resources (which are more common).

The `$ rake routes` for a singular resource would only contain 6 routes (since we don't use `#index` anymore), and you would no longer see any of the `:id` portions of the routes, e.g.

~~~bash
  edit_dashboard  GET /dashboard/edit(.:format)  dashboards#edit
~~~

...compared with the plural version of the same route:

~~~bash
  edit_dashboard  GET /dashboards/:id/edit(.:format)  dashboards#edit
~~~

### Nested Routes

Sometimes it just makes sense for one resource to be nested inside of another.  For instance, a listing of lessons like this logically falls within a listing of courses -- so you'd expect a URL sort of like `http://example.com/courses/1/lessons/3`. The way to achieve this nesting is in the routes file by literally nesting one resource inside a block given to another, which might look something like:

~~~ruby
  # config/routes.rb
  TestApp::Application.routes.draw do
    resources :courses do
      resources :lessons
    end
  end
~~~

Note that the `#resources` method now takes a block which will consist of a set of routes.

When you visit the URL, you'll have to specify the `:id` parameter for BOTH objects.  The `$ rake routes` for the above would include something like:

~~~ruby
  course_lesson  GET  /courses/:course_id/lessons/:id(.:format)  lessons#show
~~~

It should also be noted that you're being taken to the controller of the deepest nested resource, and that's also the `:id` parameter which will be called simply `:id` (any parent resource parameters, as in the above, will be specifically called something like `:course_id`).

View helpers are also automatically generated in a logical way (as you can see in your `$ rake routes` output).  When you use view helpers like `#course_lesson_path` you will need to specify both parameters in order, e.g. `course_lesson_path(1,3)`.

Don't nest routes too deeply! If you're more than a layer or two deep, something should be different.  In fact, oftentimes you'll see only some of the controller actions nested -- only the ones that actually *need* the parent's ID to uniquely specify it.  For instance, you can grab a specific Lesson by knowing only its ID.  But to get all the lessons that are listed beneath a specific Course, you need the Course ID so it will have to be nested.  Same is true for creating lessons, since they will need a parent specified:

~~~ruby
  # config/routes.rb
  TestApp::Application.routes.draw do
    resources :courses do
      resources :lessons, :only => [:index, :create]
    end
  end
~~~

If this seems a bit confusing at first, you'll pick it up quickly when you actually run into it in your own coding.  If you find yourself working inside your controller and needing the parent's ID, the route should have been nested.  If you find that you don't need the parent's ID, it doesn't need to be nested.  Easy enough.

#### Member and Collection Routes

Sometimes you want to add another non-RESTful route to a resource.  If you'd like to add a route to just a single member of that resource, use the `#member` method:

~~~ruby
  # config/routes.rb
  TestApp::Application.routes.draw do
    resources :courses do
      member do
        get "preview"   # Preview a single course
      end
    end
  end
~~~

That route would map to the `courses#preview` action.  You can add as many as you'd like.

If you'd like to add a non-RESTful route to the whole collection of your resource (so you don't need to specify the `:id` attribute, like with the `index` action), you instead use the `#collection` method:

~~~ruby
  # config/routes.rb
  TestApp::Application.routes.draw do
    resources :courses do
      member do
        get "preview"  # Preview a single course (requires ID)
      end
      collection do
        get "upcoming"  # Show a list of *all* upcoming courses (no ID needed)
      end
    end
  end
~~~

The `upcoming` route will map to the `courses#upcoming` action but will not take an `:id` parameter.

If any of this seems confusing, just play around with them and run `$ rake routes` to see what is happening behind the scenes.

#### Redirects and Wildcard Routes

You might want to provide a URL out of convenience for your user but map it directly to another one you're already using.  Use a redirect:

~~~ruby
  # config/routes.rb
  TestApp::Application.routes.draw do
    get 'courses/:course_name' => redirect('/courses/%{course_name}/lessons'), :as => "course"
  end
~~~

Well, that got interesting fast.  The basic principle here is to just use the `#redirect` method to send one route to another route.  If your route is quite simple, it's a really straightforward method.  But if you want to also send the original parameters, you need to do a bit of gymnastics by capturing the parameter inside `%{here}`.  Note the single quotes around everything.

In the example above, we've also renamed the route for convenience by using an alias with the `:as` parameter.  This lets us use that name in methods like the `#_path` helpers.  Again, test out your `$ rake routes` with questions.

### Advanced Layouts: Nesting Layouts and Passing Information

We got pretty good coverage of view layouts in the lesson on Views but one other topic involves rendering multiple layouts for one page, which allows you to create unique sections that still reuse a lot of the stylings that you might want to keep consistent across your whole site (e.g. the footer).  For example, maybe the user pages should have a different styling than your home page.  The first thought might be to try and have a different stylesheet for each layout but remember that Rails' Asset Pipeline jams all your stylesheets together anyway.

A better way of doing things is to tell your layout to do some stuff (whatever you might normally have your layout do) and then render *another* layout using the `render :template => "your_layout.html.erb"` method. You are sort of using your layouts like a view might use a view partial.

You can also pass information from the first layout to the one it renders by using the `#content_for` method.  This lets you create logic in your main layout that is dependent on what is passed by your individual layout files... the possibilities are endless.

For instance, you might have a specific layout file for your static pages called `app/views/layouts/static_pages.html.erb`.  This file will be rendered by default (if it exists) for views generated from your StaticPagesController (which is a Rails default).  Let's say, though, that you want your static pages to look almost identical to the rest of the site but you don't want the navbar to appear across the top.

In this case, you would tell your `static_pages.html.erb` layout to call the `application.html.erb` layout but also pass it some special CSS by using the `#content_for` method, e.g.

~~~ruby
  # app/views/layouts/static_pages.html.erb

  <% content_for :stylesheets do %\>\
    #navbar {display: none}
  <% end % >
  <%= render :template => "layouts/application" %\>\
~~~

Then your `application.html.erb` layout needs to be set up to catch that content and use it, for instance by adding this `#yield` line:

~~~ruby
  # app/views/layouts/application.html.erb
  ...
  <head>
    ...
    <style><%= yield :stylesheets %></style>
  </head>
  ...
  render :template => "static_pages.html.erb"
  ...
~~~

When you `#yield` to a particular content block, in this case `:stylesheets`, it will essentially drop the code from inside of that `content_for`'s block to where the `#yield` method was.  So in the above example, we effectively added some CSS styling to the application layout by first rendering a special `static_pages.html.erb` layout and then passing the styles to the main `application.html.erb` layout using `#content_for`.  The result would look like:

~~~html
  # app/views/layouts/application.html.erb
  ...
  <head>
    ...
    <style> #navbar {display: none} </style>
  </head>
  ...
~~~

This trick is useful for more than just passing stylesheet information... any time you find yourself wanting to make a section of your site look different but without totally redesigning it with a fully new layout, you might consider nesting your layouts and passing information from one to another.

### Metaprogramming Rails

What is "Metaprogramming"?  It's a great and useful concept that's used all over Rails and you can put it to work yourself too.  It's basically the idea that your application or script actually creates functions or methods or classes on the fly while it's running and can dynamically call them as well.  It's one of the great parts of using an interpreted language like Ruby... it's sort of baked into the language.  We'll just skim the surface here but you should definitely look into it more on your own once you feel comfortable with the nuts and bolts of Rails.

An example of metaprogramming in action in Rails is with the route helpers.  When your Rails application fires up for the first time, it loads the `config/routes.rb` file, which might contain the line `get "home" => "static_pages#home"` so your users can type `http://www.yoursite.com/home` to get back to the home page.  Rails then creates a couple method for you, including the `home_path` and `home_url` helpers.  That's one part of metaprogramming!

The routes example almost isn't fair, though, because you wrote your `routes.rb` file and probably hard coded a bunch of `#home_path` or `#home_url` method calls based on what you knew would be in there.  What about more dynamic situations where you don't know ahead of time what the method is going to be called?

Ruby provides the `#send` method to save the day.  If you want to run a method on an object, just *send* that object the method and any arguments you want.  A simple example you can do on your command line is `1+2`:

~~~bash
  > 1 + 2
  => 3
  > 1.send(:+, 2)
  => 3
~~~

In an ordinary situation, there's no reason to use the `#send` method but if you don't know which method you're going to need to call, it's a lifesaver.  Just pass it the symbolized name of the method you want to run on that object and Ruby will go looking for it.

But how do you define a new method on the fly anyway?  In this case, you can use the `#define_method` method, which takes the symbol of what you'd like to define and a block representing the method itself.  The following examples were taken from [this metaprogramming guide from ruby-metaprogramming.rubylearning.com](http://ruby-metaprogramming.rubylearning.com/html/ruby_metaprogramming_2.html):

~~~ruby
  class Rubyist

    define_method :hello do |my_arg|
      my_arg
    end
  end

  obj = Rubyist.new
  puts(obj.hello('Matz')) # => Matz
~~~

Another very powerful tool is the `#method_missing` method.  You've certainly seen errors that say something to the effect of "Hey you, you tried to call a method that doesn't exist!" and the stack trace will probably run through something called `method_missing`.  Most likely, you had a typo and spelled your method incorrectly.

Basically, `#method_missing` is a method of Ruby's `BasicObject` class which gets inherited by every single object in Ruby and it is called whenever you try to run a method that doesn't actually exist.  It also gets passed all the arguments you tried to send and any blocks that went with it.  That means that you can override `#method_missing` yourself for a given object and use whatever was previously called, for example printing out a message saying the name of the method you tried to call and its arguments:

~~~ruby
  class Rubyist

    def method_missing(m, *args, &block)
      str = "Called #{m} with #{args.inspect}"

      if block_given?
        puts str + " and also a block: #{block}"
      else
        puts str
      end
    end
  end
~~~

~~~ruby
  > Rubyist.new.anything
  "Called anything with []"
  => nil

  > Rubyist.new.anything(3, 4) { "something" }
  "Called anything with [3, 4] and also a block: #<Proc:0x007fa0261d2ae0@(irb):38>"
  => nil
~~~

Metaprogramming is really nifty stuff and there are tons of interesting uses for it.  You don't need to master it to learn Rails, so only dive into it once you're comfortable with Rails, but it will certainly be useful to you in the real world.  There are all kinds of metaprogramming tricks and patterns and tips out there but it's beyond the scope of this course to dive into them.

Here's a good example of [simple metaprogramming to DRY up your code](http://rails-bestpractices.com/posts/2010/07/24/dry-metaprogramming/).

Check out [Metaprogramming Ruby](http://www.amazon.com/Metaprogramming-Ruby-Program-Like-Pros/dp/1934356476) by Paolo Perrotta if you're really curious.

### Design Patterns

Design patterns have a mixed reputation among software developers.  On the one hand, they represent "best practices" for how to code past a given situation (not specific code, just a template for how to fix something).  On the other, they can be sort of needlessly prescriptive.  See the [Wikipedia article on Design Patterns](http://en.wikipedia.org/wiki/Software_design_pattern) for an overview.  We won't be covering specific patterns in this course.

The [Wikipedia article on SOLID](http://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) provides a good overview and good links related to SOLID software design.  If you're looking to write great code, you'll need to know each of the principles the letters represent (paraphrasing):

* [**S**ingle Responsibility Principle](http://en.wikipedia.org/wiki/Single_responsibility_principle) (A class should only have a single responsibility)
* [**O**pen/Closed Principle](http://en.wikipedia.org/wiki/Open/closed_principle) (your code entities should be open for extension but closed to modification)
* [**L**iskov Substitution Principle](http://en.wikipedia.org/wiki/Liskov_substitution_principle) (replacing an object with one of its sub-types shouldn't break anything)
* [**I**nterface Segregation Principle](http://en.wikipedia.org/wiki/Interface_segregation_principle) (writing many client-specific interfaces is better than one behemoth general-use interface... think APIs)
* [**D**ependency Inversion Principle](http://en.wikipedia.org/wiki/Dependency_inversion_principle) (instead of high level constructs depending on lower level ones, make them rely on abstractions instead)

Luckily, Rails has done a pretty good job of following these, so you should have absorbed some good habits just through using it. But you'll want to take a minute and read up on each of them (including the odd-sounding ones) because they're fairly central to all software engineering (and a ripe interview question).

If you're particularly interested in pursuing design patterns, check out the "Gang of Four" (GoF) Patterns laid out in [this blog post from blackwasp.co.uk](http://www.blackwasp.co.uk/GofPatterns.aspx).

There's a useful book written on anti-patterns, which can help you clean up your code by identifying bad smells, called [Rails Antipatterns](http://www.amazon.com/Rails-AntiPatterns-Refactoring-Addison-Wesley-Professional/dp/0321604814/) by Tammer Saleh and Chad Pytel.


### I18n: Internationalization

[Internationalization and Localization](http://en.wikipedia.org/wiki/Internationalization_and_localization) is the process of adapting your application to fit specific geographies and/or languages.  It's outside our scope to cover, but for those who are interested, check out [this Sitepoint tutorial on it](http://www.sitepoint.com/go-global-rails-i18n/), as suggested by K. Bates.


### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Skim the [Rails Guide on Routing](http://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing) section 2.6 about namespacing.
  2. Read the same guide sections 2.7-3.7 to learn about nested, member and collection routes and more.
  3. Read the same guide, sections 3.8-3.15 for a variety of different advanced routing topics including constraining the inputs to your routes and redirection.
  4. Skim the same guide, chapter 4.  Some stuff we've seen but most is just to give you a sense for what's possible.  When you need it, you'll probably Google your way back there.
  5. Read the [Rails Guide on Layouts](http://guides.rubyonrails.org/layouts_and_rendering.html#using-nested-layouts) section 3.5 to see how to pass information between your view file and your layout file, including CSS styles.  Really take a minute to understand what's going on in the example there.
  6. If you're interested in peeking at metaprogramming, read through [http://ruby-metaprogramming.rubylearning.com/](http://ruby-metaprogramming.rubylearning.com/).  It's not essential to building early Rails apps but you'll definitely start running into it more in "the wild".
  7. Glance through [this Slideshare Presentation on SOLID](http://www.slideshare.net/jcfischer/solid-ruby-solid-rails) principles.
</div>

### Conclusion

In this lesson we covered some fairly random and intricate concepts but useful stuff to at least get familiar with, even if you're not going to use it every day.  Experience is the real key here -- in the course of building awesome stuff you'll run into the need for all of the things you just learned and it might just save you a lot of time and complexity in your code.

The more general principles like SOLID design and metaprogramming will be useful to you regardless of whether you stick with Ruby and Rails or move on to better and brighter things.

With all that completed, there's not much else to go... it's time to get started on your final project!

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Stack Overflow question on the topic](http://stackoverflow.com/questions/6629142/having-problem-understanding-singular-resource-in-rails)
* [A video from Yehuda Katz on Rails Security](http://youtu.be/2Ex8EEv-WPs)
* See the first solution to [this SO question](http://stackoverflow.com/questions/4208380/confused-on-advanced-rails-layout-nesting) for a nice way to work with multiple layouts that use classes to trigger different CSS styling.
* [Ruby Metaprogramming](http://ruby-metaprogramming.rubylearning.com/html/ruby_metaprogramming_2.html)
* [SO post on design patterns in Rails (2010)](http://stackoverflow.com/questions/2522065/design-patterns-in-rails)
* [A longer explanation of SOLID principles](https://www.youtube.com/watch?v=8STtzjyDTTQ)
