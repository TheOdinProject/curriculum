# Ruby on Rails

## This section is collecting resources right now

### Getting Started: Tutorials

* A [listing of Rails tutorials](https://tutorials.railsapps.org/rails-tutorial) from Daniel Kehoe of RailsApps
* The canonical [Rails Tutorial by Michael Hartl](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book)
* A list of some slightly [longer Rails Tutorials by Jumpstart Lab](http://tutorials.jumpstartlab.com/)

### Get Informed: Guides, Classes, etc.

* [Rails Guides](http://guides.rubyonrails.org/) are THE documentation for Ruby on Rails and you'll want to have them open in another window pretty much the whole time you're learning.
* The [University of Texas Rails Course Online](http://schneems.com/ut-rails) (incomplete/dated?)
* [Free Online Webinars from buildingwebapps.com](http://www.buildingwebapps.com/)

### Testing

* [How I Test by Ryan Bates](http://railscasts.com/episodes/275-how-i-test)
* [Testing series on TDD and intermediate stuff](http://www.rubyfocus.biz/class_video/2010/07/19/rails_tdd_class_1.html)

### Additional Resources

* [Railscasts by Ryan Bates](http://railscasts.com/) are a fantastic resource of technical know-how and, more importantly, how-to-do.  They'll pop up all the time when you're googling for how to set up some new gem.
* [Rails Cheat Sheet](http://pragtob.github.io/rails-beginner-cheatsheet/index.html) by Tobias Pfeiffer
* [Rails Best Practices list](http://rails-bestpractices.com/)
* [Building a Simple CMS in Sinatra Tutorial](http://www.sitepoint.com/a-simple-content-management-system-in-sinatra/)

### Specific Know-how

* [Webinar on Using Heroku in Production](https://blog.heroku.com/archives/2013/7/11/running-production-apps-on-heroku)
* [How Heroku Works](https://devcenter.heroku.com/articles/how-heroku-works)
* [Understanding Rails' form authenticity tokens](http://stackoverflow.com/questions/941594/understand-rails-authenticity-token)
* [Why not to hardcode your application's secret token in production](http://daniel.fone.net.nz/blog/2013/05/20/a-better-way-to-manage-the-rails-secret-token/)
* [Why use the `%Q` methods?](http://stackoverflow.com/questions/10144543/what-is-the-use-case-for-rubys-q-q-quoting-methods)


### Roadmap

1. Prerequisites: Intro with throwback to web dev 101 including making sure they did the instantiation of a basic rails project.
    1. Project: Get your hands dirty (blogger tutorial?) with a rails overview (from web dev 101)
2. Brief back-to-the-basics -- refresher on HTTP, MVC, REST, APIs, rails overview from before
    1. Project: Make some web requests from the command line using bare bones CLI and restclient
1. Cookies and Sessions and Authentication and Authorization and tokens
3. Basic ActiveRecord -- validations (uniqueness), associations, queries, validation errors / is_valid?... thinking data-first??? The important skill is knowing data structure of a problem first, then worrying about the rest.
    1. Project: CLI apps -- 1. simple database query that uses simple associations, 2. moderate database querying that uses validations
1. Hartl Tutorial -- space out chapters with the material
3. Routing -- resources, helpers, REST mapping, rake routes, :only and :except, :root, :id 
    1. Read rails guides, do Hartl chapter(s)
4. Controllers -- Actions are methods, params, rendering, deleted, 
    1. Read rails guides, build simple error-reading-walkthrough of creating a simple rails app, do Hartl chapter(s)
5. Views -- ERB, templates, partials, helper files, basic layouts
    6. read rails guides, do the Hartl chapter(s)
6. Basic forms -- recall your html, input types (incl hidden) and names and labels, build from scratch, then helpers, then with validations, cover mass assignment, structure of params and nesting params, making PUT/PATCH and DELETE requests, 
    1. Read rails guide, build basic form from scratch and submit, then build using rails helpers
3. The Asset Pipeline: escaping html, asset pipeline and asset helpers

7. Activerecord Queries: Relations, lazy evaluation, N+1 reduction, Includes and Joins, Scopes, Aggregations and bare-metal SQL, 
    http://guides.rubyonrails.org/active_record_querying.html)
    Project: 
1. ActiveRecord Advanced Associations
  1. 2.8 through 3.  Skim 4 to see the methods available. http://guides.rubyonrails.org/association_basics.html
1. ActiveRecord Callbacks: Callbacks and transactions
    1. http://guides.rubyonrails.org/active_record_callbacks.html
    1. Project: 
7. Advanced forms -- nested, associations, pre-populating objects, inverse_of??, 
    1. Project: some sort of crazy nested form submission, starting simple but expanding into nesting then validating that nesting (inverse)
4. Sessions, cookies, and Authentication -- controller filters (e.g. before), flashes refresher (covered in controllers), rolling your own with bcrypt and sessions and logging in, current_user, requiring login, Devise   
        http://guides.rubyonrails.org/action_controller_overview.html#filters
5. Deployment -- heroku, asset precompilation, common errors, 
6. APIs -- Building your own, using Oauth(2) for externals (refresh auth), nokogiri, rendering JSON,
    1. Project: 1. build a simple api interaction, 2. Do an oauth authenticated app interaction, 3. build your own simple API
7. Mailers, scheduled tasks
    1. User login welcome emails on an existing project?
8. Advanced topics -- nested and collections routing, design patterns, metaprogramming, advanced layouts, wildcard routes,
8. Final Projects -- rebuilding
9. ??? Testing with Rails???
    1. Models
    2. Controllers
    3. Integration
    4. Factories
    5. etc.
1. Beyond -- reread all sections of the Rails Guides, including the wones you skipped.
2. Security http://guides.rubyonrails.org/security.html





