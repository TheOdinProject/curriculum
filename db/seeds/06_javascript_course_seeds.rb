# ************************************************
# CREATE JAVASCRIPT COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: Javascript *****"

# Set Course and section position here. Update file name appropriately.
course_position = 6
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: "Javascript",
  title_url: "Javascript".parameterize,
  description: "Make your websites dynamic and interactive with JavaScript! You'll create features and stand-alone applications. This course will wrap everything you've learned at The Odin Project into one, final capstone project.",
  position: course_position
)

# :description: "Javascript is taking over the world right now -- web applications are becoming more and more front-weighted.  While it used to be mostly a tool for animating drop down menus and validating form inputs, Javascript (with help from jQuery's magic) has grown into a way to produce full featured front end applications including single-page web apps.  In this section, you'll connect the Rails back ends you're an expert at building to dynamic front ends, completing the cycle to becoming a full stack web developer.  You'll learn some really nifty tricks and build some fun games along the way, too.",

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Introduction",
  title_url: "Introduction".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Welcome to the JavaScript course!  Start here!"
)

lesson_position += 1
create_or_update_lesson(
  title: "How this course will work",
  title_url: "How this course will work".parameterize,
  description: "How this course will work",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/introduction/introduction.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "A quick review",
  title_url: "A quick review".parameterize,
  description: "A quick review",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/introduction/js101-review.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Organizing your JavaScript Code",
  title_url: "Organizing JavaScript".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This series digs in to the things you need to write larger and larger applications with JavaScript.  This is where it gets real!"
)

lesson_position += 1
create_or_update_lesson(
  title: "Introduction",
  title_url: "organizing introduction".parameterize,
  description: "introduction",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/organizing-js/organizing-introduction.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Objects and Object Constructors",
  title_url: "Objects and Object Constructors".parameterize,
  description: "Covers plain old javascript objects and object constructors",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/organizing-js/objects-constructors.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Library",
  title_url: "Library".parameterize,
  description: "Library",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/organizing-js/library-project.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Factory Functions and the Module Pattern",
  title_url: "Factory Functions and the Module Pattern".parameterize,
  description: "Factory Functions and the Module Pattern",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/organizing-js/factory-functions.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Tic Tac Toe",
  title_url: "Tic Tac Toe".parameterize,
  description: "Tic Tac Toe",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/organizing-js/tic-tac-toe-project.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Classes",
  title_url: "JavaScript Classes".parameterize,
  description: "Classes",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/organizing-js/classes.md",
  repo: 'curriculum'
)


lesson_position += 1
create_or_update_lesson(
  title: "ES6 Modules",
  title_url: "ES6 Modules".parameterize,
  description: "ES6 Modules",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/organizing-js/es6-modules.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Restaurant Page",
  title_url: "Restaurant Page".parameterize,
  description: "Restaurant Page",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/organizing-js/restaurant-project.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "OOP Principles",
  title_url: "OOP Principles".parameterize,
  description: "OOP Principles",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/organizing-js/oop-concepts.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Todo List",
  title_url: "Todo List".parameterize,
  description: "Todo List",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/organizing-js/project.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "JavaScript in the Real World",
  title_url: "JavaScript in the Real World".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Let's look at a few more practical applications of JavaScript and learn about a few useful tools that are widely used in the industry."
)

lesson_position += 1
create_or_update_lesson(
  title: "Linting",
  title_url: "Linting".parameterize,
  description: "Linting",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js-in-the-real-world/linting.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Dynamic User Interface Interactions",
  title_url: "User Interface Interactions".parameterize,
  description: "UI Interactions",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js-in-the-real-world/ui-Interactions.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Forms",
  title_url: "Forms".parameterize,
  description: "Forms",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js-in-the-real-world/forms.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Webpack 2",
  title_url: "Webpack 2".parameterize,
  description: "Webpack 2",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js-in-the-real-world/webpack-2.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "ES?",
  title_url: "ES?".parameterize,
  description: "ES?",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js-in-the-real-world/es6-features.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Front End Frameworks",
  title_url: "front end frameworks".parameterize,
  course_id: course.id,
  position: section_position,
  description: "We'll take a brief look at the most popular JavaScript frameworks."
)

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to Frameworks",
  title_url: "frameworks introduction".parameterize,
  description: "intro",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/frameworks/frameworks-introduction.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Angular",
  title_url: "Angular".parameterize,
  description: "Angular",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/frameworks/angular.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "React",
  title_url: "React".parameterize,
  description: "React",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/frameworks/react-introduction.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Vue",
  title_url: "Vue".parameterize,
  description: "Vue",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/frameworks/vue.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Frameworks",
  title_url: "Frameworks".parameterize,
  description: "Project: Frameworks",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/frameworks/frameworks-project.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Asynchronous JavaScript and APIs",
  title_url: "Asynchronous JavaScript".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Asynchronous JavaScript"
)

lesson_position += 1
create_or_update_lesson(
  title: "JSON",
  title_url: "JSON".parameterize,
  description: "JSON",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/async-apis/json.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Async",
  title_url: "Async".parameterize,
  description: "Async",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/async-apis/promises-async.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Working with APIs",
  title_url: "Working with APIs".parameterize,
  description: "Working with APIs",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/async-apis/APIs.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Async and Await",
  title_url: "Async and Await".parameterize,
  description: "Async and Await",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/async-apis/async-await.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Weather App",
  title_url: "Weather App".parameterize,
  description: "Weather App",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/async-apis/project.md",
  repo: 'curriculum'
)

# +++++++++++
# section
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Testing JavaScript",
  title_url: "Testing JavaScript".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Test driven development is an important skill in today's dev world.  This section digs into the details of writing automated JavaScript tests."
)

lesson_position += 1
create_or_update_lesson(
  title: "Testing Basics",
  title_url: "Testing Basics".parameterize,
  description: "Testing Basics",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/testing/testing-1.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Testing Practice",
  title_url: "Testing Practice".parameterize,
  description: "Testing Practice",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/testing/testing-practice.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "More Testing",
  title_url: "More Testing".parameterize,
  description: "More Testing",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/testing/testing-2.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Battleship",
  title_url: "Battleship".parameterize,
  description: "Battleship",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/testing/battleship-project.md",
  repo: 'curriculum'
)
# +++++++++++
# section
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "JavaScript and Rails",
  title_url: "JavaScript and Rails".parameterize,
  course_id: course.id,
  position: section_position,
  description: "A real web app needs a back end in order to persist its data and do sensitive operations. Here you'll learn how to use ajax to send data requests to your Rails back end. You'll also get a chance to work with external APIs like Google Maps, which is something you'll probably find yourself doing quite frequently as you build your own projects in the future."
)

lesson_position += 1
create_or_update_lesson(
  title: "Using Ruby on Rails For Your Back End",
  title_url: "Using Ruby on Rails For Your Back End".parameterize,
  description: "You've got experience working with APIs, now it's time to treat your Rails app like one.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js-rails/rails_backend.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Where's Waldo (A Photo Tagging App)",
  title_url: "Where's Waldo (A Photo Tagging App)".parameterize,
  description: "Pull together everything you've learned so far to create a \"Where's Waldo?\" game.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/js-rails/project_rails_backend.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Finishing Up with Javascript",
  title_url: "Finishing Up with Javascript".parameterize,
  course_id: course.id,
  position: section_position,
  description: "You've learned everything you need and all that remains to do is apply that knowledge to a worthy task.  In this section, we'll briefly cover how to test Javascript using Jasmine and then get you started with your capstone project so you can show off your range of skills."
)

lesson_position += 1
create_or_update_lesson(
  title: "Final Project",
  title_url: "Final Project".parameterize,
  description: "Tie everything you've learned from every course so far into one project where you'll build your favorite website from scratch.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/javascript/finishing-up/project_final_js.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Well, that was easy, right?",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/javascript/finishing-up/conclusion.md",
  repo: 'curriculum'
)
