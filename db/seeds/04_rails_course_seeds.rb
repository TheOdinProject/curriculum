# ************************************************
# CREATE RAILS COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: Ruby on Rails *****"

# Set Course and section position here. Update file name appropriately.
course_position = 4
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: "Ruby on Rails",
  title_url: "Ruby on Rails".parameterize,
  description: "Take Ruby to the next level with the Ruby on Rails framework! Learn how to fully craft your site's backend using the Model-View-Controller design pattern. You'll gain the confidence to launch a website in under an hour.",
  position: course_position,
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "The Track ahead",
  title_url: "The Track ahead".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, have a look at the track ahead in this course."
)

lesson_position += 1
create_or_update_lesson(
  title: "How this Course Will Work",
  title_url: "How this Course Will Work".parameterize,
  description: "Let's get acquainted with what this will look like from here on out.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/introduction.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++
section_position += 1
section = create_or_update_section(
  title: "Sinatra",
  title_url: "Sinatra".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section we will look at sinatra, a light weight Ruby web framework. Learning Sinatra before tackling rails will reduce the learning curve in this course significantly as sinatra will expose most of the things that rails does under the hood for you. This should give you a better understanding about how everything works with Rails."
)

lesson_position += 1
create_or_update_lesson(
  title: "Sinatra Basics",
  title_url: "Sinatra Basics".parameterize,
  description: "In this lesson you will learn the basics of Sinatra",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/sinatra/sinatra.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Sinatra Project",
  title_url: "Sinatra Project".parameterize,
  description: "In this project you will convert some of the projects you completed in Ruby Programming into web apps.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/sinatra/project_sinatra.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++
section_position += 1
section = create_or_update_section(
  title: "Introduction to Rails",
  title_url: "Introduction to Rails".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll dive right into Rails and get you building from the start so you have an idea of what (and how) you'll learn going forward.  We'll get your feet planted in the right spot and your head pointed the right direction."
)

lesson_position += 1
create_or_update_lesson(
  title: "Getting Your Feet Wet",
  title_url: "Getting Your Feet Wet".parameterize,
  description: "This will give you the chance to build a full Rails app using some of the special tools Rails provides.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/introduction_to_rails/project_feet_wet.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "A Railsy Web Refresher",
  title_url: "A Railsy Web Refresher".parameterize,
  description: "We're not just using the Web, we're living it.  This lesson will get you up to speed on how.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/introduction_to_rails/web_refresher.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Deployment",
  title_url: "Deployment".parameterize,
  description: "There's nothing quite like seeing your application on a real website.  We'll show you how it's done.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/introduction_to_rails/deployment.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Let's Get Building",
  title_url: "Let's Get Building".parameterize,
  description: "In this project, you'll get started with the core tutorial we'll be following throughout this course.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/introduction_to_rails/project_lets_build.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Routes, Views, Controllers and Assets",
  title_url: "Routes, Views, Controllers and Assets".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Now that you've gotten your feet wet, it's time to start looking carefully into the foundational pieces of the Rails framework.  We'll cover the path of an HTTP request from entering your application to returning as an HTML page to the browser."
)

lesson_position += 1
create_or_update_lesson(
  title: "Routing",
  title_url: "Routing".parameterize,
  description: "The router is the switchboard of your app, telling requests which controller action they're supposed to run. ",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/routes_views_controllers_assets/routing.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Controllers",
  title_url: "Controllers".parameterize,
  description: "Controllers are the middle managers of the whole process -- they tell everyone else what to do and take all the credit.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/routes_views_controllers_assets/controller_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Views",
  title_url: "Views".parameterize,
  description: "When the controller has figured out which data needs to be displayed, it's the View's job to turn that into some half-decent HTML.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/routes_views_controllers_assets/views.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "The Asset Pipeline",
  title_url: "The Asset Pipeline".parameterize,
  description: "This lesson explains how Rails handles all the behind-the-scenes stuff to get your CSS, Javascript and Image files served quickly and efficiently and how you can use that process.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/routes_views_controllers_assets/asset_pipeline.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Basic Routes, Views and Controllers",
  title_url: "Basic Routes, Views and Controllers".parameterize,
  description: "You'll get to play with routing and build what you've learned in this section so far.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/routes_views_controllers_assets/project_basic_rvc.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Active Record Basics",
  title_url: "Active Record Basics".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This section covers the back end of Rails, which is the most important part of the framework.  You'll learn how to interface with databases using the fantastic Active Record gem."
)

lesson_position += 1
create_or_update_lesson(
  title: "Active Record Basics",
  title_url: "Active Record Basics".parameterize,
  description: "Active Record is the crown jewel of Rails because it turns all the bare metal database queries (like SQL) into nice clean Ruby methods.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/databases_and_activerecord/active_record_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Building With Active Record",
  title_url: "Building With Active Record".parameterize,
  description: "You'll start getting practice thinking data first before building something that acts a lot like Reddit.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/databases_and_activerecord/project_ar_basics.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Forms and Authentication",
  title_url: "Forms and Authentication".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This section gets into some of the areas of web apps that are less glamorous than they are important.  Forms are your user's window to interact with your application. Authentication is critical for many applications, and you'll build a couple of auth systems from the ground up."
)

lesson_position += 1
create_or_update_lesson(
  title: "Form Basics",
  title_url: "Form Basics".parameterize,
  description: "Half refresher, half expanding your mind, this will bridge the gap between the lowly web form and your server side logic.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/forms_and_authentication/form_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Forms",
  title_url: "Forms".parameterize,
  description: "To understand the form, you must start from the beginning.  We'll start with HTML and then learn how Rails can really help you out.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/forms_and_authentication/project_forms.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Sessions, Cookies, and Authentication",
  title_url: "Sessions, Cookies, and Authentication".parameterize,
  description: "Learn how to store data in the user's browser and how that is used to sign in the user and keep them signed in across requests.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/forms_and_authentication/sessions_cookies_authentication.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Authentication",
  title_url: "Authentication".parameterize,
  description: "You'll build a closed community for sharing embarrassing gossip with the world.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/forms_and_authentication/project_auth.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Advanced Forms and Active Record",
  title_url: "Advanced Forms and Active Record".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Now it's starting to get fun!  Learn how to do more than just find and show your users... you'll learn how to use relationships between models to greatly expand your abilities and how to build web forms with sufficient firepower to achieve your most ambitious goals."
)

lesson_position += 1
create_or_update_lesson(
  title: "Active Record Queries",
  title_url: "Active Record Queries".parameterize,
  description: "Learn how to take some of those advanced querying concepts you used in SQL and have Rails do them for you mathemagically.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/advanced_forms_and_activerecord/active_record_queries.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Active Record Associations",
  title_url: "Active Record Associations".parameterize,
  description: "Dive into some of the more interesting features of associations like special methods and polymorphism.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/advanced_forms_and_activerecord/active_record_associations.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Associations",
  title_url: "Associations".parameterize,
  description: "Build a system to manage signups for you and your friends' special events.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/advanced_forms_and_activerecord/project_associations.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Active Record Callbacks",
  title_url: "Active Record Callbacks".parameterize,
  description: "A brief look at the life-cycle of an Active Record object, from birth to destruction, and how you can hook into that for profit.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/advanced_forms_and_activerecord/active_record_callbacks.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Advanced Associations",
  title_url: "Advanced Associations".parameterize,
  description: "Exercise those association muscles to finish up the tutorial like a pro.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/advanced_forms_and_activerecord/project_associations_2.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Advanced Forms",
  title_url: "Advanced Forms".parameterize,
  description: "Take what you know about forms and put rocket boosters on it.  Don't be afraid to make a form for anything.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/advanced_forms_and_activerecord/forms_advanced.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Building Advanced Forms",
  title_url: "Building Advanced Forms".parameterize,
  description: "Build an airline flight signup system, which is a nest of interesting complexities",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/advanced_forms_and_activerecord/project_forms_advanced.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "APIs, Mailers and Advanced Topics",
  title_url: "APIs, Mailers and Advanced Topics".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This final section will take you into some of the more interesting sides of the Rails ecosystem which will help you reach beyond your own app and into the lives of your users via email or harness the powers of other apps via their APIs."
)

lesson_position += 1
create_or_update_lesson(
  title: "APIs and Building Your Own",
  title_url: "APIs and Building Your Own".parameterize,
  description: "Rails is really just an API itself... learn about APIs and how to turn your app into one",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/api_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Working With External APIs",
  title_url: "Working With External APIs".parameterize,
  description: "Lots of the power of APIs comes from interfacing with third-party applications, which we'll cover in this lesson.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/api_interfacing.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "APIs",
  title_url: "APIs".parameterize,
  description: "In this project, you'll both build your own API and work with a third-party API.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/apis_mailers_advanced_topics/project_apis.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Mailers",
  title_url: "Mailers".parameterize,
  description: "You don't often think about where your email comes from.  Here you'll learn how to send it from your app.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/mailers.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Sending Confirmation Emails",
  title_url: "Sending Confirmation Emails".parameterize,
  description: "Add email functionality to an existing project.  Just don't SPAM, it's frowned upon.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/apis_mailers_advanced_topics/project_mailers.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Advanced Topics",
  title_url: "Advanced Topics".parameterize,
  description: "A mash-up of orphan topics like advanced routing, layouts, metaprogramming and design patterns.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/advanced_topics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Final Project",
  title_url: "Final Project".parameterize,
  description: "There's a pretty popular social networking app you should build.  They may have made a movie about it.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/apis_mailers_advanced_topics/project_final.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Holy cow, you've gotten to the end of the road!  ...Sort of.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/conclusion.md",
  repo: 'curriculum'
)
