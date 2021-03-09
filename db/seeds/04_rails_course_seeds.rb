# ************************************************
# CREATE RAILS COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: Ruby on Rails *****"

# Set Course and section position here. Update file name appropriately.
course_position = 4
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: 'Ruby on Rails',
  description: "Take Ruby to the next level with the Ruby on Rails framework! Learn how to fully craft your site's backend using the Model-View-Controller design pattern. You'll gain the confidence to launch a website in under an hour.",
  position: course_position,
  identifier_uuid: '100c8fbd-8cb0-4bdf-a809-66ecd69ec885',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Introduction',
  course_id: course.id,
  position: section_position,
  description: 'In this section, we will install Rails.',
  identifier_uuid: 'e8d47281-55b2-4cc1-9679-a46d99fa2287',
)

lesson_position += 1
create_or_update_lesson(
  title: 'How this Course Will Work',
  description: "Let's get acquainted with what this will look like from here on out.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/introduction/introduction.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Preparing for Deployment',
  description: 'Get setup to use Heroku to deploy our web applications',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/introduction/preparing_for_deployment.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Installing Rails',
  description: 'Get setup for this course by installing Rails.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/introduction/installing_rails.md',
  accepts_submission: false,
  has_live_preview: false,
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Rails Basics',
  course_id: course.id,
  position: section_position,
  description: "It's time to start looking carefully into the foundational pieces of the Rails framework. We'll cover the path of an HTTP request from entering your application to returning as an HTML page to the browser.",
  identifier_uuid: '8ffa853e-e5d0-44d8-a61c-4a620601c422',
)

lesson_position += 1
create_or_update_lesson(
  title: 'A Railsy Web Refresher',
  description: "We're not just using the Web, we're living it.  This lesson will get you up to speed on how.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/rails_basics/web_refresher.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Routing',
  description: "The router is the switchboard of your app, telling requests which controller action they're supposed to run. ",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/rails_basics/routing.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Controllers',
  description: 'Controllers are the middle managers of the whole process -- they tell everyone else what to do and take all the credit.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/rails_basics/controller_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Views',
  description: "When the controller has figured out which data needs to be displayed, it's the View's job to turn that into some half-decent HTML.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/rails_basics/views.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'The Asset Pipeline',
  description: 'This lesson explains how Rails handles all the behind-the-scenes stuff to get your CSS, Image files and other assets served quickly and efficiently and how you can use that process.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/rails_basics/asset_pipeline.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Webpacker',
  description: 'This lesson explains how Rails handles Javascript using Webpack, how it builds the dependency graph, and how you can ensure the pack files only load what they need to keep file sizes minimal',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/rails_basics/webpacker.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Deployment',
  description: "There's nothing quite like seeing your application on a real website.  We'll show you how it's done.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/rails_basics/deployment.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Blog App',
  description: "You've learned the basics, now let's put them to work by building a basic blogging app.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/rails_basics/project_blog_app.md',
  accepts_submission: true,
  has_live_preview: true,
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Active Record Basics',
  course_id: course.id,
  position: section_position,
  description: "This section covers the back end of Rails, which is the most important part of the framework. You'll learn how to interface with databases using the fantastic Active Record gem.",
  identifier_uuid: '0f07a836-ba21-472e-b2e5-82803862b1ae',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Active Record Basics',
  description: 'Active Record is the crown jewel of Rails because it turns all the bare metal database queries (like SQL) into nice clean Ruby methods.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/databases_and_activerecord/active_record_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Building With Active Record',
  description: "You'll start getting practice thinking data first before building something that acts a lot like Reddit.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/databases_and_activerecord/project_ar_basics.md',
  accepts_submission: true,
  has_live_preview: false
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Forms and Authentication',
  course_id: course.id,
  position: section_position,
  description: "This section gets into some of the areas of web apps that are less glamorous than they are important.  Forms are your user's window to interact with your application. Authentication is critical for many applications, and you'll build a couple of auth systems from the ground up.",
  identifier_uuid: '4cfbfcf7-f561-4e63-8bcd-050175684aba',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Form Basics',
  description: 'Half refresher, half expanding your mind, this will bridge the gap between the lowly web form and your server side logic.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/forms_and_authentication/form_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Forms',
  description: "To understand the form, you must start from the beginning.  We'll start with HTML and then learn how Rails can really help you out.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/forms_and_authentication/project_forms.md',
  accepts_submission: true,
  has_live_preview: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'Sessions, Cookies, and Authentication',
  description: "Learn how to store data in the user's browser and how that is used to sign in the user and keep them signed in across requests.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/forms_and_authentication/sessions_cookies_authentication.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Authentication',
  description: "You'll build a closed community for sharing embarrassing gossip with the world.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/forms_and_authentication/project_auth.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Advanced Forms and Active Record',
  course_id: course.id,
  position: section_position,
  description: "Now it's starting to get fun! Learn how to do more than just find and show your users... you'll learn how to use relationships between models to greatly expand your abilities and how to build web forms with sufficient firepower to achieve your most ambitious goals.",
  identifier_uuid: 'd391a4d0-8aa2-4eb0-bd58-2395ba3f837c',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Active Record Queries',
  description: 'Learn how to take some of those advanced querying concepts you used in SQL and have Rails do them for you mathemagically.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/advanced_forms_and_activerecord/active_record_queries.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Active Record Associations',
  description: 'Dive into some of the more interesting features of associations like special methods and polymorphism.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/advanced_forms_and_activerecord/active_record_associations.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Associations',
  description: "Build a system to manage signups for you and your friends' special events.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/advanced_forms_and_activerecord/project_associations.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Active Record Callbacks',
  description: 'A brief look at the life-cycle of an Active Record object, from birth to destruction, and how you can hook into that for profit.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/advanced_forms_and_activerecord/active_record_callbacks.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Advanced Forms',
  description: "Take what you know about forms and put rocket boosters on it.  Don't be afraid to make a form for anything.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/advanced_forms_and_activerecord/forms_advanced.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Building Advanced Forms',
  description: 'Build an airline flight signup system, which is a nest of interesting complexities',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/advanced_forms_and_activerecord/project_forms_advanced.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'APIs',
  course_id: course.id,
  position: section_position,
  description: 'In this penultimate section we will explore harnessing the powers of other apps via their APIs and creating our own.',
  identifier_uuid: '0e7e7a73-8d9c-484f-8339-e63125ae89d3',
)

lesson_position += 1
create_or_update_lesson(
  title: 'APIs and Building Your Own',
  description: 'Rails is really just an API itself... learn about APIs and how to turn your app into one',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/apis/api_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Working With External APIs',
  description: "Lots of the power of APIs comes from interfacing with third-party applications, which we'll cover in this lesson.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/apis/api_interfacing.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Kittens API',
  description: "In this project, you'll both build your own API",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/apis/project_kittens_api.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Using an API',
  description: "In this project, you'll work with a third-party API.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/apis/project_using_an_api.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Mailers and Advanced Topics',
  course_id: course.id,
  position: section_position,
  description: 'This final section will take you into some of the more interesting sides of the Rails ecosystem which will help you reach beyond your own app and into the lives of your users via email.',
  identifier_uuid: 'dc9c8e4c-f3e9-4536-81be-c4dc51f66dff',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Mailers',
  description: "You don't often think about where your email comes from.  Here you'll learn how to send it from your app.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/mailers_advanced_topics/mailers.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Sending Confirmation Emails',
  description: "Add email functionality to an existing project.  Just don't SPAM, it's frowned upon.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/mailers_advanced_topics/project_mailers.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Advanced Topics',
  description: 'A mash-up of orphan topics like advanced routing, layouts, metaprogramming and design patterns.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/mailers_advanced_topics/advanced_topics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Websockets and Actioncable',
  description: 'A delve into the basics of websockets and how Actioncable brings them to Rails.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/mailers_advanced_topics/websockets_and_actioncable.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Final Project',
  description: "There's a pretty popular social networking app you should build.  They may have made a movie about it.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/rails_programming/mailers_advanced_topics/project_final.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: "Holy cow, you've gotten to the end of the road!  ...Sort of.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/rails_programming/mailers_advanced_topics/conclusion.md',
)
