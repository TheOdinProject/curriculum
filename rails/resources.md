# Ruby on Rails Roadmap

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
7. Activerecord Active Record Queries: Relations, lazy evaluation, N+1 reduction, Includes and Joins, Scopes, Aggregations and bare-metal SQL, 
    http://guides.rubyonrails.org/active_record_querying.html)
    Project: 
4. Sessions, cookies, and Authentication -- controller filters (e.g. before), flashes refresher (covered in controllers), rolling your own with bcrypt and sessions and logging in, current_user, requiring login, Devise Overview
        http://guides.rubyonrails.org/action_controller_overview.html#filters
1. Advanced Active Record Associations -- foreign_key, class_name, source, methods
  1. 2.8 through 3.  Skim 4 to see the methods available. http://guides.rubyonrails.org/association_basics.html
1. ActiveRecord Callbacks: Callbacks and transactions
    1. http://guides.rubyonrails.org/active_record_callbacks.html
    1. Project: 
7. Advanced forms -- nested, associations, pre-populating objects, inverse_of??, 
    1. Project: some sort of crazy nested form submission, starting simple but expanding into nesting then validating that nesting (inverse)
5. Deployment -- heroku, asset precompilation, common errors, 
    1. project: Hartl deployment chapter
6. APIs -- Building your own, using Oauth(2) for externals (refresh auth), nokogiri, rendering JSON, (controller guide chap 7)
    1. Project: 1. build a simple api interaction with RestClient, 2. Do an oauth authenticated app interaction, 3. build your own simple API
7. Mailers, scheduled tasks
    1. User login welcome emails on an existing project?
8. Advanced topics -- nested and collections routing, design patterns, metaprogramming, advanced layouts, wildcard routes,
1. Conclusion -- reread all sections of the Rails Guides, including the ones you skipped.  Additional reading (recommended books).  Security.  Caching. Rake tasks.
 
8. Final Projects -- rebuilding
9. ??? Testing with Rails???
    1. Models
    2. Controllers
    3. Integration
    4. Factories
    5. etc.
    6. http://guides.rubyonrails.org/testing.html (TestUnit)




