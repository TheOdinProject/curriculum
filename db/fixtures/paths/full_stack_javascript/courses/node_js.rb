#######################
# Course - NodeJS
#######################
course = @path.add_course do |course|
  course.title = 'NodeJS'
  course.description = "Take your JavaScript skills to the server-side! Learn how to fully craft your site's backend using Express, the most popular back-end JavaScript framework! You will also learn how to use a non-relational database, MongoDB."
  course.identifier_uuid = '1a2c27d8-258a-4d9e-97a4-83a4c2a03b64'
end

# ++++++++++++++++++++++++++++++++
# SECTION = Introduction to NodeJS
# ++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Introduction to NodeJS'
  section.description = "In this section you'll learn what NodeJS is and get your first taste of writing server-side JavaScript."
  section.identifier_uuid = 'f8ec5b6e-5f36-4164-add9-a6b1ff60e7a2'

  section.add_lessons(
    node_js_lessons.fetch('Introduction: What is NodeJs'),
    node_js_lessons.fetch('Getting Started'),
    node_js_lessons.fetch('Debugging Node'),
    node_js_lessons.fetch('Basic Informational Site'),
  )
end

# ++++++++++++++++++++++++++++++++
# SECTION - MongoDB
# ++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'MongoDB'
  section.description = "In this section you'll learn about creating and querying a MongoDB database, as well as the differences between relational databases and a NoSQL option like MongoDB."
  section.identifier_uuid = '8cbb031e-1e58-11ec-9621-0242ac130002'

  section.add_lessons(
    node_js_lessons.fetch('Introduction to MongoDB'),
  )
end

# +++++++++++++++++++++++++++
# SECTION - Express & Mongoose
# +++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Express & Mongoose'
  section.description = 'Here we finally get to Express, the most popular back-end JavaScript framework, and learn to build applications with MongoDB using Mongoose.'
  section.identifier_uuid = '667788c1-67b9-4ed1-9b72-c5e8bc6f9009'

  section.add_lessons(
    node_js_lessons.fetch('Introduction to Express'),
    node_js_lessons.fetch('Express 101'),
    node_js_lessons.fetch('Express 102: CRUD and MVC'),
    node_js_lessons.fetch('Preparing for Deployment'),
    node_js_lessons.fetch('Mini Message Board'),
    node_js_lessons.fetch('Express 103: Routes and Controllers'),
    node_js_lessons.fetch('Express 104: View Templates'),
    node_js_lessons.fetch('Express 105: Forms and Deployment'),
    node_js_lessons.fetch('Inventory Application'),
  )
end

# ++++++++++++++++++++++++
# SECTION - Authentication
# ++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Authentication'
  section.description = 'We learn how to create authentication strategies that allow us to securely sign users into our applications.'
  section.identifier_uuid = '67438b44-9579-4d48-a495-ecf254479ffd'

  section.add_lessons(
    node_js_lessons.fetch('Authentication Basics'),
    node_js_lessons.fetch('Security Configuration'),
    node_js_lessons.fetch('Members Only'),
  )
end

# ++++++++++++++
# SECTION - APIs
# ++++++++++++++
course.add_section do |section|
  section.title = 'APIs'
  section.description = "We use what we've learned to create API-only backends that can serve JSON to any front-end we want."
  section.identifier_uuid = 'b94b517d-fd55-4fd2-9d54-38f6f709cfe5'

  section.add_lessons(
    node_js_lessons.fetch('API basics'),
    node_js_lessons.fetch('API Security'),
    node_js_lessons.fetch('Blog API'),
  )
end

# +++++++++++++++++++++++++
# SECTION - Testing Express
# +++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Testing Express'
  section.description = 'In this section we learn what it takes to write tests for our Express projects.'
  section.identifier_uuid = '684b4766-6b70-451b-baa1-05760c71349f'

  section.add_lessons(
    node_js_lessons.fetch('Testing Routes and Controllers'),
    node_js_lessons.fetch('Testing database operations'),
  )
end

# +++++++++++++++++++++++
# SECTION - FINAL PROJECT
# +++++++++++++++++++++++
course.add_section do |section|
  section.title = 'FINAL PROJECT'
  section.description = "This is it! Create your final project and prove to the world you're a node/express master."
  section.identifier_uuid = '941fbec9-aeca-4cad-96fb-da60035b4a27'

  section.add_lessons(
    node_js_lessons.fetch('Odin-Book'),
    node_js_lessons.fetch('Conclusion'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
