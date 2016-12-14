# Ruby on Rails Roadmap

>>>> Section: Introduction 

1. `introduction.md` -- Intro with throwback to web dev 101 including making sure they did the instantiation of a basic rails project.

***Project: `project_feet_wet.md`
  1. Hartl chapter 2 (Scaffold App)

2. `web_refresher.md` -- HTTP, MVC, REST, APIs, rails overview from before, Cookies and Sessions and Authentication and Authorization and tokens.

3. `deployment.md` -- heroku, asset precompilation, common errors, 

***Project: `project_lets_build.md`
  1. Hartl chapter 3 (Static Pages and Testing Intro) 
  2. Hartl chapter 4 (Ruby overview). Link back to Ruby testing resources, give good intro.  

>>>> Section: Views, Controllers and Assets

1. `routing.md` -- resources, helpers, REST mapping, rake routes, :only and :except, :root, :id 

2. `controller_basics.md` -- Actions are methods, params, rendering, deleted, 

3. `views.md` -- ERB, templates, partials, helper files, basic layouts

4. `asset_pipeline.md` -- escaping html, asset pipeline and asset helpers

***Project: `project_basic_rvc.md`
  1. Send over some params manually with RestClient
  1. Hartl chapter 5 (Asset pipeline and layouts)

>>>> Section: Databases and ActiveRecord

1. `databases.md` -- Databases, SQL setup, SQL naming, SQL querying, see ref, (http://sql.learncodethehardway.org/book/), indexes

***Project: `project_databases.md`
  1. Set up mySQL locally -- done via LCTHW?
  1. SQL Zoo
  1. Interaction with databases directly and structuring advanced queries on existing data.

2. `active_record_basics.md` -- validations (uniqueness), associations, queries, validation errors / is_valid?, thinking data first)

***Project: `project_ar_basics.md`
  1. Data first thought exercises
  2. Hartl Chapter 6 (Models, Migrations, Validations).
  3. simple Rails-Console-UI database query app that uses simple associations and validations.  Perhaps reddit?

>>>> Section: Forms and Authentication

1. `form_basics.md` -- recall your html, input types (incl hidden) and names and labels, build from scratch, then helpers, then with validations, cover mass assignment, structure of params and nesting params, making PUT/PATCH and DELETE requests, 

***Project: `project_forms.md`
  1. build basic form (new app) from scratch and submit, 
  2. then build using rails helpers, 
  3. Hartl chapter 7 (Form basics and form_for)

2. `sessions_cookies_authentication.md` -- controller filters (e.g. before), flashes refresher (covered in controllers), rolling your own with bcrypt and sessions and logging in, current_user, requiring login, Devise Overview

***Project: `project_auth.md`
  1. Hartl chapter 8 (sessions and sign in).
  1. Hartl chapter 9 (using auth, pagination, refactoring).
  1. Roll your own auth app (Members Only Secrets)

>>>> Section: Advanced Forms and ActiveRecord

1. `active_record_queries.md` -- Relations, lazy evaluation, N+1 reduction, Includes and Joins, Scopes, Aggregations and bare-metal SQL, 

***CANCELLED Project: `project_queries.md`
  1. Turning advanced database queries (refer to databases project) into ActiveRecord advanced queries.  Seeded database project?

2. `active_record_associations.md` -- foreign_key, class_name, source, methods

***Project: `project_associations.md`
  1. Event planner
  1. Hartl chapter 10 (Associations) -- recall and refresh earlier AR knowledge.

3. `active_record_callbacks.md` -- Callbacks and transactions

***Project: `project_associations_2.md`
  1. Hartl Chapter 11 (Advanced associations)
  2. FUTURE: Build an association heavy app from scratch... Eventbrite backend?

4. `forms_advanced.md` -- nested, associations, pre-populating objects, inverse_of??, 

***Project: `project_forms_advanced.md`
  1. some sort of crazy nested form submission, starting simple but expanding into nesting then validating that nesting (inverse)... kayak? Checkout?

>>>> Section: APIs, Mailers and Advanced Topics

1. `api_basics.md` -- Building your own, rendering JSON, (controller guide chap 7)

1. `api_interfacing.md` -- External APIs, using Oauth(2) for externals (refresh auth)

***Project: `project_apis.md`
  1. Ping around with an existing API with the CLI or a browser plugin
  1. build a simple api interaction with RestClient 
  2. Do an oauth authenticated app interaction
  3. build your own simple API

2. `mailers.md` -- Mailers

***Project: `project_mailers.md`
  1. Add user login welcome emails to an existing project (flight booker).  Ping those mails from the console.

3. `advanced_topics.md` -- nested and collections routing, design patterns, metaprogramming, advanced layouts, wildcard routes,

***Project: `project_final.md`
  1. Facebook

4. `conclusion.md` -- reread all sections of the Rails Guides, including the ones you skipped.  Additional reading (recommended books).  Security.  Caching. Rake tasks.
 

******************************************************************************

9. ??? Testing with Rails???
    1. Models
    2. Controllers
    3. Integration
    4. Factories
    5. etc.
    6. http://guides.rubyonrails.org/testing.html (TestUnit)

TODO: 
* Scheduled Tasks
* Deployment rejigger to tie into earlier position
* AR Basics conclusion and data tips


****************
Hartl:
1 Setup
2 Demo App
3 Static Pages and Testing intro
4 Ruby refresher
5 Asset pipeline, layouts
6 Models, Migrations, Validations
7 Form basics and form_for. Deployment.
8 Sessions and Sign in
9 Using the authorization, Pagination, Refactoring
10 Associations
11 more advanced associations
****************



