# ************************************************
# CREATE NodeJS COURSE
# ************************************************

Rails.logger.info '\n\n***** STARTING COURSE: NodeJS *****'

# Set Course and section position here. Update file name appropriately.
course_position = 5
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: 'NodeJS',
  description: "Take your JavaScript skills to the server-side! Learn how to fully craft your site's backend using Express, the most popular back-end JavaScript framework! You will also learn how to use a non-relational database, MongoDB.",
  position: course_position,
  identifier_uuid: '1a2c27d8-258a-4d9e-97a4-83a4c2a03b64',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Introduction to NodeJS',
  course_id: course.id,
  position: section_position,
  description: "In this section you'll learn what NodeJS is and get your first taste of writing server-side JavaScript."
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction: What is NodeJs',
  description: 'Lets take a look at what Node is, and what it means to write code for a server.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/getting-started/Introduction.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Getting Started',
  description: "You'll go through a basic Node tutorial and write some real server-side code.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/getting-started/Getting-Started.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Basic Informational Site',
  description: "Use what you've learned to build a very simple website skeleton",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/nodeJS/getting-started/Getting-Started-Project.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Express & MongoDB',
  course_id: course.id,
  position: section_position,
  description: 'Here we finally get to Express, the most popular back-end JavaScript framework, and MongoDB, a non-relational database frequently paired with Node.'
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to Express',
  description: 'We look at Express for the first time and learn what it does for us',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/express-basics/Express-Introduction.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Express 101',
  description: "It's time to dive into the main tutorial and actually write some code using the express-generator",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/express-basics/Express-Lesson-1.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Express 102: CRUD and MVC',
  description: 'Here you learn how to set up a database in your Express projects',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/express-basics/Express-Lesson-2.md',
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
  title: 'Mini Message Board',
  description: 'We take a break from the main tutorial and create a simple message board.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/nodeJS/express-basics/Express-Mini-Message-Board.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Express 103: Routes and Controllers',
  description: 'We learn how to use the express router and use the MVC pattern to set up controllers for our Library tutorial',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/express-basics/Express-Lesson-3.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Express 104: View Templates',
  description: 'This lesson shows you how to set up view templates.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/express-basics/Express-Lesson-4.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Express 105: Forms and Deployment',
  description: 'Here we learn how to use forms to create the data-entry portions of the Library Tutorial and finish the project by learning about deployment',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/nodeJS/express-basics/Express-Lesson-5.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Inventory Application',
  description: "We put together everything you've learned so far by building an inventory management app for an imaginary store.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/nodeJS/express-basics/Express-Inventory-Application.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Authentication',
  course_id: course.id,
  position: section_position,
  description: 'We learn how to create authentication strategies that allow us to securely sign users into our applications.'
)

lesson_position += 1
create_or_update_lesson(
  title: 'Authentication Basics',
  description: 'Learn the basics of authentication with passportJS and bcrypt',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/authentication/Authentication.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Security Configuration',
  description: 'We learn how to use configuration modules to secure our apps',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/authentication/Security-Configuration.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Members Only',
  description: "We create a private online clubhouse to practice using the auth strategies we've learned",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/nodeJS/authentication/Members-Only.md',
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
  description: "We use what we've learned to create API-only backends that can serve JSON to any front-end we want."
)

lesson_position += 1
create_or_update_lesson(
  title: 'API basics',
  description: 'You already know most of what you need to create robust APIs. This lesson fills in the blanks for you.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/APIs/APIs.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'API Security',
  description: 'We learn how to secure our APIs using JSON web tokens',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/APIs/API-Security.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Blog API',
  description: 'You create the backend for a blog and then plug it into multiple frontend applications',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/nodeJS/APIs/Blog-Project.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Testing Express',
  course_id: course.id,
  position: section_position,
  description: 'We learn what it takes to write tests for our Express projects'
)

lesson_position += 1
create_or_update_lesson(
  title: 'Testing Routes and Controllers',
  description: 'We learn how to use Supertest to write tests for our routes and controllers',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/testing/Testing.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Testing database operations',
  description: 'we learn how to use mongodb-memory-server to write tests for routes that manipulate a database',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/testing/Testing-Mongo.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'FINAL PROJECT',
  course_id: course.id,
  position: section_position,
  description: "This is it!  Create your final project and prove to the world you're a node/express master"
)

lesson_position += 1
create_or_update_lesson(
  title: 'Odin-Book',
  description: "You'll use everything you've learned so far to replicate Facebook!",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/nodeJS/Odin-Book.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: 'Wow you\'ve gotten to the last lesson!',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/nodeJS/conclusion.md',
)
