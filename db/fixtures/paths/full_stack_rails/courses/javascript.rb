########################
# Course - JavaScript
########################
course = @path.add_course do |course|
  course.title = 'JavaScript'
  course.description = "Make your websites dynamic and interactive with JavaScript! You'll create features and stand-alone applications. This module includes projects where you will learn how to manipulate the DOM, use object-oriented programming principles, and build single page applications with React."
  course.identifier_uuid = 'be963a26-8c2a-4af9-ac19-d68b526b5bc5'
end

# ++++++++++++++++++++++
# SECTION - Introduction
# ++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Introduction'
  section.description = 'Welcome to the JavaScript course! Start here!'
  section.identifier_uuid = 'a96a48d1-4e38-4f47-a90d-e260569c9ab5'

  section.add_lessons(
    javascript_lessons.fetch('How this course will work'),
    javascript_lessons.fetch('A quick review'),
  )
end

# +++++++++++++++++++++++++++++++++++++++++
# SECTION - Organizing your JavaScript Code
# +++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Organizing your JavaScript Code'
  section.description = 'This series digs in to the things you need to write larger and larger applications with JavaScript. This is where it gets real!'
  section.identifier_uuid = 'd0be5e66-0acc-4c62-8993-8d50e5af15a0'

  section.add_lessons(
    javascript_lessons.fetch('Organizing your JavaScript Code Introduction'),
    javascript_lessons.fetch('Objects and Object Constructors'),
    javascript_lessons.fetch('Library'),
    javascript_lessons.fetch('Factory Functions and the Module Pattern'),
    javascript_lessons.fetch('Tic Tac Toe'),
    javascript_lessons.fetch('Classes'),
    javascript_lessons.fetch('ES6 Modules'),
    javascript_lessons.fetch('Webpack'),
    javascript_lessons.fetch('Restaurant Page'),
    javascript_lessons.fetch('OOP Principles'),
    javascript_lessons.fetch('Todo List'),
  )
end

# ++++++++++++++++++++++++++++++++++++++
# SECTION - JavaScript in the Real World
# ++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'JavaScript in the Real World'
  section.description = "Let's look at a few more practical applications of JavaScript and learn about a few useful tools that are widely used in the industry."
  section.identifier_uuid = '68a977d9-1ad5-4516-964b-c58703f19d50'

  section.add_lessons(
    javascript_lessons.fetch('Linting'),
    javascript_lessons.fetch('Dynamic User Interface Interactions'),
    javascript_lessons.fetch('Form Validation with JavaScript'),
    javascript_lessons.fetch('ES?'),
  )
end

# ++++++++++++++++++++++++++++++++++++++++++
# SECTION - Asynchronous JavaScript and APIs
# ++++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Asynchronous JavaScript and APIs'
  section.description = 'This section explores asynchronous JavaScript and event loops, and how it\'s useful in fetching data from web servers using APIs.'
  section.identifier_uuid = 'c26cc657-9d04-4d12-bc2e-1c8206696da7'

  section.add_lessons(
    javascript_lessons.fetch('JSON'),
    javascript_lessons.fetch('Asynchronous Code'),
    javascript_lessons.fetch('Working with APIs'),
    javascript_lessons.fetch('Async and Await'),
    javascript_lessons.fetch('Weather App'),
  )
end

# ++++++++++++++++++++++++++++
# SECTION - Testing JavaScript
# ++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Testing JavaScript'
  section.description = "Test driven development is an important skill in today's dev world. This section digs into the details of writing automated JavaScript tests."
  section.identifier_uuid = 'c8526cf6-d66c-40f8-b03e-97c1f086d8c1'

  section.add_lessons(
    javascript_lessons.fetch('Testing Basics'),
    javascript_lessons.fetch('Testing Practice'),
    javascript_lessons.fetch('More Testing'),
    javascript_lessons.fetch('Battleship'),
  )
end

# ++++++++++++++++++
# SECTION - React JS
# ++++++++++++++++++
course.add_section do |section|
  section.title = 'React JS'
  section.description = 'In this section you will learn the basics of the most popular frontend framework, React JS.'
  section.identifier_uuid = 'bf4a29d2-6420-40bd-8e45-8f7e704a4d39'

  section.add_lessons(
    react_lessons.fetch('React Introduction'),
    react_lessons.fetch('State and Props'),
    react_lessons.fetch('Handle Inputs and Render Lists'),
    react_lessons.fetch('CV Application'),
    react_lessons.fetch('Lifecycle Methods'),
    react_lessons.fetch('Hooks'),
    react_lessons.fetch('Memory Card'),
    react_lessons.fetch('Router'),
    react_lessons.fetch('React Testing Part 1'),
    react_lessons.fetch('React Testing Part 2'),
    react_lessons.fetch('Shopping Cart'),
    react_lessons.fetch('Advanced Concepts'),
  )
end

# ++++++++++++++++++++++++++++++++++++
# SECTION - JavaScript and the Backend
# ++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'JavaScript and the Backend'
  section.description = "A real web app needs a back end in order to persist its data and do sensitive operations. Here you'll learn how to use ajax to send data requests to your Rails back end."
  section.identifier_uuid = '490be3db-7c28-43d8-a530-328a0ba8188b'

  section.add_lessons(
    javascript_lessons.fetch('Using Ruby on Rails For Your Back End'),
    javascript_lessons.fetch("Where's Waldo (A Photo Tagging App)"),
  )
end

# ++++++++++++++++++++++++++++++++++++++
# SECTION - Finishing Up with JavaScript
# ++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Finishing Up with JavaScript'
  section.description = "You've learned everything you need and all that remains to do is apply that knowledge to a worthy task. In this section you will be working on your capstone project so you can show off your range of skills."
  section.identifier_uuid = 'd3a05406-615d-4645-85f2-0cba667f2749'

  section.add_lessons(
    javascript_lessons.fetch('JavaScript Final Project'),
    javascript_lessons.fetch('Conclusion'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
