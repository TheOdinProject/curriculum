#### Purpose

Please note this is _not_ the final say on the how the course should work overall. This document is intended to provide a overhead of what we want our learners to accomplish as well as a few other data points for lessons. If you are going through the curriculum and read this and you disagree or feel there could be learning outcome improvement. Feel free to visit the odin project discord and share in the contributions channel! Otherwise this document is intended simply to keep track of how we want the course to flow and some important data points.

#### Formatting Guide
Basic lesson structure of key-points will be this format. 

~~~markdown
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
~~~

### Key Guide

This will contain the key guide to avoid reader confusion. For example count? indicates the amount of occurences of a link, resource etc. 

#### Introduction

1. How this course will work
    - learning outcome: Gain a roadmap of how the Rails course works
          - sub-goals 
    - resources used
      - NA
      - count: 0
2. Preparing for deployment
- learning outcome: Be able to create the basic setup of installing heroku for use.
      - sub-goals 
    - resources used
      - N/A
      - count: 0
3. Installing Rails (project)
- learning outcome: Install Rails and create a barebones Rails app.
      - sub-goals 
    - resources used
      - N/A
      - count: 0
4. A railsy web refresher
- learning outcome: Have a basic overview of some aspects of the web.
        - sub-goals 
    - resources used:
      - repeated? None
      - Assignments? None
      - in-text-link? All
      - count: 7

#### Rails Basics

1. Routing
- learning outcome: how to use RESTful routes in conjunction with the controller.
      - sub-goals 
    - resources used
      - Rails guides: => routing, sections: => sections 1-2.5, 3.1-3.4, 4.6, and 6.1, :format => text
      - Rest and HTTP explanation :format => video
      - count: 2
2. Controllers
- learning outcome: Basic overview of how to use the controller to interact with their routes.
      - sub-goals 
    - resources used
      - Rails guides: => controllers, :section => 1 - 4.5.3 and 5.2., :format => text
      - count: 1
3. Views
- learning outcome: learners should have a basic idea of a view and how it can be used with the controller. 
      - sub-goals 
    - resources used 1 
      - rails guides, :format => text, :section => sections 1 through 3.4,
      - count:1
4. Deployment
- learning outcome: Should have a basic understanding of how to deploy their projects with Heroku.
      - sub-goals 
    - resources used
      - Heroku
      - Assignment? => 2
      - in-text? => 14
      - count: 16
5. Blog app (project)
- learning outcome: should be able to walk through the basic steps of creating a app using MVC and CRUD.
      - sub-goals 
    - resources used
      - Heroku
      - Rails guide getting started 
      - github
      - Assignment? All
      - count: 3

#### ActiveRecord Basics

1. ActiveRecord basics
    - learning outcome: Gain a basic understanding of what and how to use active record
      - sub-goals 
    - resources used
      - Rails guide Active record basics
      - Rails guides Migration
      - Rails guides Validations
      - Rails guides Associations
      - count:4
2. Micro-reddit (project)
    - learning outcome: Utilize previous lesson to create models with active record for a simple reddit clone
      - sub-goals 
    - resources used
      - N/A
      - count: 0

#### The Asset Pipeline

1. The Asset Pipeline
- learning outcome: Learners should have a basic understanding of how the Asset Pipelines works and how they can use it.
      - sub-goals 
    - resources used
      - Rails Guides, :section => 1 to 3., :format => text
      - count: 1
2. Importmaps 
-in-production? yes
- learning outcome: Learners should have a basic idea of what import maps is and how to use it to pin different packages and modules.
    - sub-goals 
    - resources used
      - gem read me
      - [dhh artile on modern web apps without transpiling](https://world.hey.com/dhh/modern-web-apps-without-javascript-bundling-or-transpiling-a20f2755)
      - in-house? none
      - external-assignment? 2
      - count: 2

#### Forms and Authentication

1. Form Basics
- learning outcome: Be able to create a basic form using Rails methods.
    - sub-goals 
    - resources used
      - Rails guide on form helpers.
      - Rails guide on validation.
      - Rails form_with api docs.
      - external-assignment? 3
      - count:3
2. Forms (project)
- learning outcome: Practice creating a form utilizing the previous lesson
    - sub-goals 
    - resources used
      - external-link? 5
      - internal-lesson? 1
      - count:6
3. Sessions, Cookies and Authentication
- learning outcome: Become aware of authentication works with sessions and cookies and utlize devise.
    - sub-goals 
    - resources used
      - external-link? 6
      - Rails-guides controllers :count => 3
      - Devise documentation
      - session article link
      - session video link
      - count:6
4. Members only (project)
- learning outcome: use previous lessons to create events where only members can see post authors.
    - sub-goals 
    - resources used
      - external-link? 4
      - twitter-tutorial count? 4
      - devise-readme count? 1
      - count:4

#### Advanced Forms and ActiveRecord

1. ActiveRecord queries
- learning outcome: gain a basic understanding of how to use rails queries
    - sub-goals 
    - resources used
      - rails querying guide link-count? 8
      - count:1
2. ActiveRecord Associations
- learning outcome: Get a basic understanding of how Rails Associations work.
    - sub-goals 
    - resources used
      - Rails association guide.
      - count: 1
3. Private Events (project)
- learning outcome: Utilize previous lessons to create private events that users can make.
    - sub-goals 
    - resources used
      - rails-guides scopes
      - rails-guides queries
      - count: 2
4. ActiveRecord callbacks
- learning outcome: Gain a basic understanding of what rails callbacks are as well as how to use them
    - sub-goals 
    - resources used
      - rails-guide-on-callbacks
      - samuel-mullen :title => on when to use callbacks
      - count: 2
5. Advanced forms
- learning outcome: learn how to use the more advanced features of rail forms such as nested attributes
    - sub-goals 
    - resources used
      - rails-gude for? forms
      - peter-rhoades how to use nested forms
      - count: 2
6. Flight Booker (project)
- learning outcome: utilize previous lessons to create a flight signup using advanced forms
    - sub-goals 
    - resources used
      - stack-overflow count? 4
      - rails-api count? 2
      - count: 6

#### APIs

1. APIs and building your own
- learning outcome: learn what are and how to build your own api.
    - sub-goals 
        -
    - resources used
      -
      - count:
2. Working with external APIs
- learning outcome: Learn how to use external apis.
    - sub-goals 
        -
    - resources used
      -
      - count:
3. Kittens API
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
4. Flickr API
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:

#### Rails Sprinkles

1. CSS-Bundling
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
2. JS-Bundling (including a section on webpacker)
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
3. Turbo
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
4. Stimulus
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
5. (should we have a project here to cover these technologies?)
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:

#### Mailers and Advanced Topics

1. Mailers
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
2. Sending confirmation emails (project)
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
3. Advanced Topics
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
4. Websockets and ActionCable
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
5. Finals Rails Project (project)
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count:
6. Conclusion
- learning outcome
    - sub-goals 
        -
    - resources used
      -
      - count: