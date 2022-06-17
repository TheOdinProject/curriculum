#######################
# Course - Databases
#######################
course = @path.add_course do |course|
  course.title = 'Databases'
  course.description = 'Databases are used to organize and capture large amounts of data, typically by inputting, storing, retrieving and managing the information. This course will focus on relational databases, which are widely used to store data and SQL, the language used to query the database.'
  course.identifier_uuid = '5038bddf-c121-4e92-8c68-dd34008b7ca0'
end

# +++++++++++++++++++
# SECTION - Databases
# +++++++++++++++++++
course.add_section do |section|
  section.title = 'Databases'
  section.description = 'Rails does a lot of the heavy lifting with connecting and querying a database but there will be times you need to tweak a query to the database using raw SQL. Learning how to query efficiently will help your understanding of what Rails helps abstract away.'
  section.identifier_uuid = '2fd5cf3b-746e-442c-92b5-9871c1fc9fdb'

  section.add_lessons(
    database_lessons.fetch('Databases'),
    database_lessons.fetch('Databases and SQL'),
    database_lessons.fetch('SQL Zoo'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
