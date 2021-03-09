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
  description: 'Welcome to the JavaScript course! Start here!',
  identifier_uuid: 'a96a48d1-4e38-4f47-a90d-e260569c9ab5',
)

lesson_position += 1
create_or_update_lesson(
  title: 'How this course will work',
  description: 'How this course will work',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/introduction/introduction.md',
  identifier_uuid: '93d2a049-0f6c-4da8-b346-d477c1e7a000',
)

lesson_position += 1
create_or_update_lesson(
  title: 'A quick review',
  description: 'A quick review',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/introduction/js101-review.md',
  identifier_uuid: '428d54c7-3324-4ee2-afaf-08e1c373b314',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Organizing your JavaScript Code',
  course_id: course.id,
  position: section_position,
  description: 'This series digs in to the things you need to write larger and larger applications with JavaScript.  This is where it gets real!',
  identifier_uuid: 'd0be5e66-0acc-4c62-8993-8d50e5af15a0',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction',
  description: 'introduction',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/organizing-introduction.md',
  identifier_uuid: 'ecbc4a4c-d787-440f-a26b-bd4558a76869',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Objects and Object Constructors',
  description: 'Covers plain old JavaScript objects and object constructors',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/objects-constructors.md',
  identifier_uuid: '0b148848-4f2d-4425-837c-b64b72c741bd',
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
  has_live_preview: true,
  identifier_uuid: '67338e32-0121-44bd-98c2-2f8e6b299adf',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Factory Functions and the Module Pattern',
  description: 'Factory Functions and the Module Pattern',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/factory-functions.md',
  identifier_uuid: '7ff3da5b-44dd-457e-a216-527a007835bb',
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
  has_live_preview: true,
  identifier_uuid: '47798979-cdc8-4c86-a70d-05ffb51d5aac',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Classes',
  description: 'Classes',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/classes.md',
  identifier_uuid: '0583cd2d-4bff-4b36-9316-afc146c777f7',
)

lesson_position += 1
create_or_update_lesson(
  title: 'ES6 Modules',
  description: 'ES6 Modules',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/es6-modules.md',
  identifier_uuid: '0169e4d1-e381-49e0-897b-f9364ac10e51',
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
  has_live_preview: true,
  identifier_uuid: 'a1453e8f-d4e8-44ce-b30e-552c65162ac6',
)

lesson_position += 1
create_or_update_lesson(
  title: 'OOP Principles',
  description: 'OOP Principles',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/organizing-js/oop-concepts.md',
  identifier_uuid: 'eb45fbdb-c2ff-4aef-98bf-a85f5adac3af',
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
  has_live_preview: true,
  identifier_uuid: '5934b09a-ca38-4968-8df1-720456b7af9a'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'JavaScript in the Real World',
  course_id: course.id,
  position: section_position,
  description: "Let's look at a few more practical applications of JavaScript and learn about a few useful tools that are widely used in the industry.",
  identifier_uuid: '68a977d9-1ad5-4516-964b-c58703f19d50',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Linting',
  description: 'Linting',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/linting.md',
  identifier_uuid: 'a7ae0481-b9cc-40b3-a9dd-4c7227ce2d3d',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Dynamic User Interface Interactions',
  description: 'UI Interactions',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/ui-Interactions.md',
  identifier_uuid: 'd6a88ccb-9fdb-4544-a363-4d7f1054e36f',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Forms',
  description: 'Forms',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/forms.md',
  identifier_uuid: 'c95fe496-2223-4c96-bf3f-9d8e3796d233',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Webpack',
  description: 'Webpack',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/webpack.md',
  identifier_uuid: 'eedfa6c8-b041-497d-ab37-565708a1b075',
)

lesson_position += 1
create_or_update_lesson(
  title: 'ES?',
  description: 'ES?',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-in-the-real-world/es6-features.md',
  identifier_uuid: 'f5c4b108-adf8-41af-bf3b-a38dd409a67d',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Asynchronous JavaScript and APIs',
  course_id: course.id,
  position: section_position,
  description: 'Asynchronous JavaScript',
  identifier_uuid: 'c26cc657-9d04-4d12-bc2e-1c8206696da7',
)

lesson_position += 1
create_or_update_lesson(
  title: 'JSON',
  description: 'JSON',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/async-apis/json.md',
  identifier_uuid: 'ae0d44bf-60b7-4644-b61e-216a4a6b271b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Async',
  description: 'Async',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/async-apis/promises-async.md',
  identifier_uuid: '31ab5898-fd2b-48c4-9070-0e8b622b0805',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Working with APIs',
  description: 'Working with APIs',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/async-apis/APIs.md',
  identifier_uuid: '8ce12e98-3413-4d0a-a749-0701ae959f6a',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Async and Await',
  description: 'Async and Await',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/async-apis/async-await.md',
  identifier_uuid: '70e6bedf-98ce-47bb-80fd-5d8ecf6f9f8b',
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
  has_live_preview: true,
  identifier_uuid: '5212a020-85ed-4e43-84ec-6b583b57e8cb',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'React JS',
  course_id: course.id,
  position: section_position,
  description: 'In this section you will learn the basics of the most popular frontend framework, React JS.',
  identifier_uuid: 'bf4a29d2-6420-40bd-8e45-8f7e704a4d39',
)

lesson_position += 1
create_or_update_lesson(
  title: 'React Introduction',
  description: 'React Introduction',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/react-introduction.md',
  identifier_uuid: '147b4b39-9725-4ef0-94bb-be13de0907fb',
)

lesson_position += 1
create_or_update_lesson(
  title: 'State and Props',
  description: 'State and Props',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/state-and-props.md',
  identifier_uuid: '62dac0e1-2acc-4392-b5b5-a12e010f50e4',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Handle Inputs and Render Lists',
  description: 'Handle Inputs and Render Lists',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/inputs-and-lists.md',
  identifier_uuid: '4ad5f107-7f36-4606-bf87-59b07e2558c8',
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
  has_live_preview: true,
  identifier_uuid: 'f3b5cee3-a255-4c72-8022-942cbddf0b86',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Lifecycle Methods',
  description: 'Lifecycle Methods',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/lifecycle-methods.md',
  identifier_uuid: '64f06d1e-44a6-41f6-a34b-f9f713c76aab',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Hooks',
  description: 'Hooks',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/hooks.md',
  identifier_uuid: 'a427cd6c-e001-4c52-80f8-f538883ffc39',
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
  has_live_preview: true,
  identifier_uuid: '87bbed05-daf2-4c45-a549-fc9ecfa2657c',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Router',
  description: 'Router',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/router.md',
  identifier_uuid: 'f34f2b12-a3fd-41a1-9726-140a1ebde5f1',
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
  has_live_preview: true,
  identifier_uuid: '60bb8597-19db-4d6f-9eca-059743206de5',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Advanced Concepts',
  description: 'Advanced Concepts',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/react-js/advanced-concepts.md',
  identifier_uuid: 'e2a290b1-cc94-498b-ba32-a40ddfbf2a3a',
)

# +++++++++++
# section
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Testing JavaScript',
  course_id: course.id,
  position: section_position,
  description: "Test driven development is an important skill in today's dev world. This section digs into the details of writing automated JavaScript tests.",
  identifier_uuid: 'c8526cf6-d66c-40f8-b03e-97c1f086d8c1',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Testing Basics',
  description: 'Testing Basics',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/testing/testing-1.md',
  identifier_uuid: 'fcb8c8f9-7475-47bf-82a0-4df6a4afdf96',
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
  has_live_preview: true,
  identifier_uuid: '319ce38c-f68b-4bba-b9f7-25df452f0523',
)

lesson_position += 1
create_or_update_lesson(
  title: 'More Testing',
  description: 'More Testing',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/testing/testing-2.md',
  identifier_uuid: '82c12ec2-9a10-4177-8dfd-d87d34685983',
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
  has_live_preview: true,
  identifier_uuid: '62702165-7705-47ba-a308-dd39c561e057',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'JavaScript and the Backend',
  course_id: course.id,
  position: section_position,
  description: "A real web app needs a back end in order to persist its data and do sensitive operations. Here you'll learn how to use ajax to send data requests to your Rails back end or how to outsource your backend to a Backend-as-a-Service company like Firebase.",
  identifier_uuid: '490be3db-7c28-43d8-a530-328a0ba8188b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Using Ruby on Rails or BaaS For Your Back End',
  description: "You've got experience working with APIs, now it's time to treat your app like one.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/js-rails/rails_backend.md',
  identifier_uuid: '80eda4a3-02c9-489f-acef-bea2ba628e09',
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
  identifier_uuid: '386dd44a-31dc-45dc-a535-cd5508365c86',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Finishing Up with JavaScript',
  course_id: course.id,
  position: section_position,
  description: "You've learned everything you need and all that remains to do is apply that knowledge to a worthy task. In this section you will be working on your capstone project so you can show off your range of skills.",
  identifier_uuid: 'd3a05406-615d-4645-85f2-0cba667f2749',
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
  has_live_preview: true,
  identifier_uuid: '8edf8c0e-9197-4660-82c1-e035cdd4b30b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: 'Well, that was easy, right?',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/javascript/finishing-up/conclusion.md',
  identifier_uuid: '4b881c82-4cba-4090-a819-17aac12ccb46',
)
