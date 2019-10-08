# ************************************************
# CREATE NodeJS COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: NodeJS *****"

# Set Course and section position here. Update file name appropriately.
course_position = 5
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: "NodeJS",
  title_url: "NodeJS".parameterize,
  description: "You'll learn everything you need to take your JavaScript skills to the server-side.",
  position: course_position
)


# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Introduction to NodeJS",
  title_url: "Introduction to NodeJS".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section you'll learn what NodeJS is and get your first taste of writing server-side JavaScript."
)


lesson_position += 1
create_or_update_lesson(
  title: "Introduction: What is NodeJs",
  title_url: "What is NodeJS".parameterize,
  description: "Lets take a look at what Node is, and what it means to write code for a server.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/getting-started/Introduction.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Getting Started",
  title_url: "Getting Started".parameterize,
  description: "You'll go through a basic Node tutorial and write some real server-side code.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/getting-started/Getting-Started.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Basic Informational Site",
  title_url: "Basic Site".parameterize,
  description: "Use what you've learned to build a very simple website skeleton",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "nodeJS/getting-started/Getting-Started-Project.md",
  repo: 'curriculum'
)

section_position += 1
section = create_or_update_section(
  title: "Express",
  title_url: "Express".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Here we finally get to Express, the most popular back-end JavaScript framework."
)

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to Express",
  title_url: "Introduction to Express".parameterize,
  description: "We look at Express for the first time and learn what it does for us",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/express-basics/Express-Introduction.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Express 101",
  title_url: "Express 101".parameterize,
  description: "It's time to dive into the main tutorial and actually write some code using the express-generator",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/express-basics/Express-Lesson-1.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Express 102: CRUD and MVC",
  title_url: "Express 102".parameterize,
  description: "Here you learn how to set up a database in your Express projects",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/express-basics/Express-Lesson-2.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Mini Message Board",
  title_url: "Mini-message-board".parameterize,
  description: "We take a break from the main tutorial and create a simple message board.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "nodeJS/express-basics/Express-Mini-Message-Board.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Express 103: Routes and Controllers",
  title_url: "Express 103".parameterize,
  description: "We learn how to use the express router and use the MVC pattern to set up controllers for our Library tutorial",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/express-basics/Express-Lesson-3.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Express 104: View Templates",
  title_url: "Express 104".parameterize,
  description: "This lesson shows you how to set up view templates.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/express-basics/Express-Lesson-4.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Express 105: Forms and Deployment",
  title_url: "Express 105".parameterize,
  description: "Here we learn how to use forms to create the data-entry portions of the Library Tutorial and finish the project by learning about deployment",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/express-basics/Express-Lesson-5.md",
  repo: 'curriculum'
)


lesson_position += 1
create_or_update_lesson(
  title: "Inventory Application",
  title_url: "project: inventory application".parameterize,
  description: "We put together everything you've learned so far by building an inventory management app for an imaginary store.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "nodeJS/express-basics/Express-Inventory-Application.md",
  repo: 'curriculum'
)

section_position += 1
section = create_or_update_section(
  title: "Authentication",
  title_url: "Express Authentication".parameterize,
  course_id: course.id,
  position: section_position,
  description: "We learn how to create authentication strategies that allow us to securely sign users into our applications."
)

lesson_position += 1
create_or_update_lesson(
  title: "Authentication Basics",
  title_url: "express authentication basics".parameterize,
  description: "Learn the basics of authentication with passportJS and bcrypt",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/authentication/Authentication.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Security Configuration",
  title_url: "Security Configuration".parameterize,
  description: "We learn how to use configuration modules to secure our apps",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/authentication/Security-Configuration.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Members Only",
  title_url: "project members only".parameterize,
  description: "We create a private online clubhouse to practice using the auth strategies we've learned",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "nodeJS/authentication/Members-Only.md",
  repo: 'curriculum'
)

section_position += 1
section = create_or_update_section(
  title: "APIs",
  title_url: "express APIs".parameterize,
  course_id: course.id,
  position: section_position,
  description: "We use what we've learned to create API-only backends that can serve JSON to any front-end we want."
)

lesson_position += 1
create_or_update_lesson(
  title: "API basics",
  title_url: "express api basics".parameterize,
  description: "You already know most of what you need to create robust APIs.  This lesson fills in the blanks for you.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/APIs/APIs.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "API Security",
  title_url: "Express API Security".parameterize,
  description: "We learn how to secure our APIs using JSON web tokens",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/APIs/API-Security.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Blog API",
  title_url: "project express blog api".parameterize,
  description: "You create the backend for a blog and then plug it into multiple frontend applications",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "nodeJS/APIs/Blog-Project.md",
  repo: 'curriculum'
)

section_position += 1
section = create_or_update_section(
  title: "Testing Express",
  title_url: "testing express".parameterize,
  course_id: course.id,
  position: section_position,
  description: "We learn what it takes to write tests for our Express projects"
)

lesson_position += 1
create_or_update_lesson(
  title: "Testing Routes and Controllers",
  title_url: "testing routes and controllers".parameterize,
  description: "We learn how to use Supertest to write tests for our routes and controllers",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/testing/Testing.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Testing database operations",
  title_url: "testing database operations".parameterize,
  description: "we learn how to use mongodb-memory-server to write tests for routes that manipulate a database",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "nodeJS/testing/Testing-Mongo.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "FINAL PROJECT",
  title_url: "nodeJS final project".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This is it!  Create your final project and prove to the world you're a node/express master"
)

lesson_position += 1
create_or_update_lesson(
  title: "Odin-Book",
  title_url: "project odin-book".parameterize,
  description: "You'll use everything you've learned so far to replicate Facebook!",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "nodeJS/Odin-Book.md",
  repo: 'curriculum'
)
