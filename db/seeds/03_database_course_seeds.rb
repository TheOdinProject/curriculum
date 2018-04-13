# ************************************************
# CREATE DATABASE COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: Databases *****"

course_position = 3
section_position = 0
lesson_position = 0


course = create_or_update_course(
  title: "Databases",
  title_url: "Databases".parameterize,
  description: " Databases are used to organize and capture large amounts of data, typically by inputting, storing, retrieving and managing the information. This course will focus on relational databases, which are widely used to store data and SQL, the language used to query the database.",
  position: course_position,
)

puts course.position

# +++++++++++
# SECTION
# +++++++++++
section_position += 1
section = create_or_update_section(
  title: "Databases",
  title_url: "Databases".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Rails does a lot of the heavy lifting with connecting and querying a database but there will be times you need to tweak a query to the database using raw SQL. Learning how to query efficiently will help your understanding of what Rails helps abstract away."
)

lesson_position += 1
create_or_update_lesson(
  title: "Databases",
  title_url: "Databases".parameterize,
  description: "Here you'll learn the basics of databases and how they store data.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/databases/database_basics_lesson.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Databases and SQL",
  title_url: "Databases and SQL".parameterize,
  description: "Data is the core of every major web app and here you'll learn how to speak SQL. Being able to properly query a database will go a long way to minimising any problems your website's users might encounter with slow response times.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/databases/databases.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "SQL",
  title_url: "SQL".parameterize,
  description: "The best way to learn is by practice, so this project will give you plenty of opportunity to apply your new SQL powers (for good).",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/databases/project_databases.md",
  repo: 'curriculum'
)
