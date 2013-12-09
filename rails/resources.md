# Ruby on Rails Roadmap

1. `introduction.md` Intro with throwback to web dev 101 including making sure they did the instantiation of a basic rails project.
    1. Project: Get your hands dirty (blogger tutorial?) with a rails overview (from web dev 101)

2. `web_refresher.md` -- HTTP, MVC, REST, APIs, rails overview from before, Cookies and Sessions and Authentication and Authorization and tokens
    1. Project: Make some web requests from the command line using bare bones CLI and restclient

3. `active_record_basics.md` -- validations (uniqueness), associations, queries, validation errors / is_valid?, thinking data first)
    1. `project_ar_basics.md` -- CLI apps -- 1. simple database query that uses simple associations, 2. moderate database querying that uses validations

3. `routing.md` -- resources, helpers, REST mapping, rake routes, :only and :except, :root, :id 
    1. Read rails guides, do Hartl chapter(s)

4. `controller_basics.md` -- Actions are methods, params, rendering, deleted, 
    1. Read rails guides, build simple error-reading-walkthrough of creating a simple rails app, do Hartl chapter(s)

5. `views.md` -- ERB, templates, partials, helper files, basic layouts
    6. read rails guides, do the Hartl chapter(s)

6. `form_basics.md` -- recall your html, input types (incl hidden) and names and labels, build from scratch, then helpers, then with validations, cover mass assignment, structure of params and nesting params, making PUT/PATCH and DELETE requests, 
    1. Read rails guide, build basic form from scratch and submit, then build using rails helpers

3. `asset_pipeline.md` -- escaping html, asset pipeline and asset helpers

7. `active_record_queries.md` -- Relations, lazy evaluation, N+1 reduction, Includes and Joins, Scopes, Aggregations and bare-metal SQL, 
    Project: 

4. `sessions_cookies_authentication.md` -- controller filters (e.g. before), flashes refresher (covered in controllers), rolling your own with bcrypt and sessions and logging in, current_user, requiring login, Devise Overview

1. `active_record_associations.md` -- foreign_key, class_name, source, methods

1. `active_record_callbacks.md` -- Callbacks and transactions
    1. Project: 

7. `forms_advanced.md` -- nested, associations, pre-populating objects, inverse_of??, 
    1. Project: some sort of crazy nested form submission, starting simple but expanding into nesting then validating that nesting (inverse)

5. `deployment.md` -- heroku, asset precompilation, common errors, 
    1. project: Hartl deployment chapter

6. `api.md` -- Building your own, using Oauth(2) for externals (refresh auth), nokogiri, rendering JSON, (controller guide chap 7)
    1. Project: 1. build a simple api interaction with RestClient, 2. Do an oauth authenticated app interaction, 3. build your own simple API

7. `mailers.md` -- Mailers
    1. User login welcome emails on an existing project?

8. `advanced_topics.md` -- nested and collections routing, design patterns, metaprogramming, advanced layouts, wildcard routes,

1. `conclusion.md` -- reread all sections of the Rails Guides, including the ones you skipped.  Additional reading (recommended books).  Security.  Caching. Rake tasks.
 
8. Final Projects -- rebuilding
9. ??? Testing with Rails???
    1. Models
    2. Controllers
    3. Integration
    4. Factories
    5. etc.
    6. http://guides.rubyonrails.org/testing.html (TestUnit)

TODO: Scheduled Tasks


