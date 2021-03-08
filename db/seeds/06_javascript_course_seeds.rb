# ************************************************
# CREATE JAVASCRIPT COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: JavaScript *****"

# Set Course and section position here. Update file name appropriately.
course_position = 6
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: 'JavaScript',
  description: "Make your websites dynamic and interactive with JavaScript! You'll create features and stand-alone applications. This module includes projects where you will learn how to manipulate the DOM, use object-oriented programming principles, and build single page applications with React.",
  position: course_position,
  identifier_uuid: 'be963a26-8c2a-4af9-ac19-d68b526b5bc5',
)

# :description: "JavaScript is taking over the world right now -- web applications are becoming more and more front-weighted.  While it used to be mostly a tool for animating drop down menus and validating form inputs, JavaScript (with help from jQuery's magic) has grown into a way to produce full featured front end applications including single-page web apps.  In this section, you'll connect the Rails back ends you're an expert at building to dynamic front ends, completing the cycle to becoming a full stack web developer.  You'll learn some really nifty tricks and build some fun games along the way, too.",

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Introduction',
  course_id: course.id,
  position: section_position,
  description: 'Welcome to the JavaScript course!  Start here!'
)

lesson_position += 1
create_or_update_lesson(
  title: 'How this course will work',
  description: 'How this course will work',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/introduction/introduction.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'A quick review',
  description: 'A quick review',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/introduction/js101-review.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Organizing your JavaScript Code',
  course_id: course.id,
  position: section_position,
  description: 'This series digs in to the things you need to write larger and larger applications with JavaScript.  This is where it gets real!'
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction',
  description: 'introduction',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/organizing-introduction.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Objects and Object Constructors',
  description: 'Covers plain old JavaScript objects and object constructors',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/objects-constructors.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Library',
  description: 'Library',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/organizing-js/library-project.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Factory Functions and the Module Pattern',
  description: 'Factory Functions and the Module Pattern',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/factory-functions.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Tic Tac Toe',
  description: 'Tic Tac Toe',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/organizing-js/tic-tac-toe-project.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Classes',
  description: 'Classes',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/classes.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'ES6 Modules',
  description: 'ES6 Modules',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/es6-modules.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Restaurant Page',
  description: 'Restaurant Page',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/organizing-js/restaurant-project.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'OOP Principles',
  description: 'OOP Principles',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/oop-concepts.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Todo List',
  description: 'Todo List',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/organizing-js/todo-project.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'JavaScript in the Real World',
  course_id: course.id,
  position: section_position,
  description: "Let's look at a few more practical applications of JavaScript and learn about a few useful tools that are widely used in the industry."
)

lesson_position += 1
create_or_update_lesson(
  title: 'Linting',
  description: 'Linting',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/linting.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Dynamic User Interface Interactions',
  description: 'UI Interactions',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/ui-Interactions.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Forms',
  description: 'Forms',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/forms.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Webpack',
  description: 'Webpack',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/webpack.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'ES?',
  description: 'ES?',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/es6-features.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Asynchronous JavaScript and APIs',
  course_id: course.id,
  position: section_position,
  description: 'Asynchronous JavaScript'
)

lesson_position += 1
create_or_update_lesson(
  title: 'JSON',
  description: 'JSON',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/async-apis/json.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Async',
  description: 'Async',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/async-apis/promises-async.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Working with APIs',
  description: 'Working with APIs',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/async-apis/APIs.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Async and Await',
  description: 'Async and Await',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/async-apis/async-await.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Weather App',
  description: 'Weather App',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/async-apis/project.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'React JS',
  course_id: course.id,
  position: section_position,
  description: 'In this section you will learn the basics of the most popular frontend framework, React JS.'
)

lesson_position += 1
create_or_update_lesson(
  title: 'React Introduction',
  description: 'React Introduction',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/react-introduction.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'State and Props',
  description: 'State and Props',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/state-and-props.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Handle Inputs and Render Lists',
  description: 'Handle Inputs and Render Lists',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/inputs-and-lists.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'CV Application',
  description: 'CV Application',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/react-js/project-cv.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Lifecycle Methods',
  description: 'Lifecycle Methods',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/lifecycle-methods.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Hooks',
  description: 'Hooks',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/hooks.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Memory Card',
  description: 'Memory Card',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/react-js/project-memory-card.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Router',
  description: 'Router',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/router.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Shopping Cart',
  description: 'Shopping Cart',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/react-js/project-shopping-chart.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Advanced Concepts',
  description: 'Advanced Concepts',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/advanced-concepts.md',
)

# +++++++++++
# section
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Testing JavaScript',
  course_id: course.id,
  position: section_position,
  description: "Test driven development is an important skill in today's dev world.  This section digs into the details of writing automated JavaScript tests."
)

lesson_position += 1
create_or_update_lesson(
  title: 'Testing Basics',
  description: 'Testing Basics',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/testing/testing-1.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Testing Practice',
  description: 'Testing Practice',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/testing/testing-practice.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'More Testing',
  description: 'More Testing',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/testing/testing-2.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Battleship',
  description: 'Battleship',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/testing/battleship-project.md',
  accepts_submission: true,
  has_live_preview: true
)
# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'JavaScript and the Backend',
  course_id: course.id,
  position: section_position,
  description: "A real web app needs a back end in order to persist its data and do sensitive operations. Here you'll learn how to use ajax to send data requests to your Rails back end or how to outsource your backend to a Backend-as-a-Service company like Firebase."
)

lesson_position += 1
create_or_update_lesson(
  title: 'Using Ruby on Rails or BaaS For Your Back End',
  description: "You've got experience working with APIs, now it's time to treat your app like one.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-rails/rails_backend.md',
)

lesson_position += 1
create_or_update_lesson(
  title: "Where's Waldo (A Photo Tagging App)",
  description: "Pull together everything you've learned so far to create a \"Where's Waldo?\" game.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/js-rails/project_rails_backend.md',
  accepts_submission: true,
  has_live_preview: true,
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Finishing Up with JavaScript',
  course_id: course.id,
  position: section_position,
  description: "You've learned everything you need and all that remains to do is apply that knowledge to a worthy task. In this section you will be working on your capstone project so you can show off your range of skills."
)

lesson_position += 1
create_or_update_lesson(
  title: 'Final Project',
  description: "Tie everything you've learned from every course so far into one project where you'll build your favorite website from scratch.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/javascript/finishing-up/project_final_js.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: 'Well, that was easy, right?',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/finishing-up/conclusion.md',
)
