# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# GENERATE SUCCESS STORY Content
load './db/seeds/success_stories.rb'

# ******* NOTE ********
# You will have problems if you try to change the titles of courses/sections/lessons, since that's currently what's used to uniquely identify them!
# *********************

# The Structure:
# Course Has Many Sections. Section Belongs To Course.
# Section Has Many Lessons. Lesson Belongs To Section.

# with these values it prevents a course, section or lesson being assigned the same value, avoiding conflict
course_position = 0
section_position = 0
lesson_counter = 0

# number just throw all the positions into the stratosphere to avoid the annoyance of having to not duplicate them when updating lessons
incrementer = 2000

# Public: Only run this update attributes if all have one or more records in the database
if Course.all.any? && Section.all.any? && Lesson.all.any?
  Course.all.each { |c| c.update_attribute(:position, c.position + incrementer)}
  Section.all.each { |s| s.update_attribute(:position, s.position + incrementer)}
  Lesson.all.each { |l| l.update_attribute(:position, l.position + incrementer)}
end

def create_or_update_course(course_attrs)
  course = Course.where(title: course_attrs[:title]).first

  if course.nil?
    course = Course.create!(course_attrs)
    Rails.logger.info ">>>> Created new course: #{course_attrs[:title]}!"
  elsif course.attributes == course_attrs
    Rails.logger.info "No changes to existing course: #{course_attrs[:title]}"
  else
    course.update_attributes(course_attrs)
    Rails.logger.info "Updated existing << COURSE >>: #{course_attrs[:title]}"
  end

  course
end

def create_or_update_section(section_attrs)
  section = Section.where(title: section_attrs[:title], course_id: section_attrs[:course_id]).first

  if section.nil?
    section = Section.create!(section_attrs)
    Rails.logger.info ">>>> Created new SECTION: #{section_attrs[:title]}!"
  elsif section.attributes == section_attrs
    Rails.logger.info "No changes to existing section: #{section_attrs[:title]}"
  else
    section.update_attributes(section_attrs)
    Rails.logger.info "Updated existing SECTION: #{section_attrs[:title]}"
  end

  section
end

def create_or_update_lesson(lesson_attrs)
  lesson = Lesson.where(title: lesson_attrs[:title], section_id: lesson_attrs[:section_id]).first

  if lesson.nil?
    lesson = Lesson.create!(lesson_attrs)
    Rails.logger.info ">>>> Created new lesson: #{lesson_attrs[:title]}!"
  elsif lesson.attributes == lesson_attrs
    Rails.logger.info "No changes to existing lesson: #{lesson_attrs[:title]}"
  else
    lesson.update_attributes(lesson_attrs)
    Rails.logger.info "Updated existing lesson: #{lesson_attrs[:title]}"
  end

  lesson
end

# Compare two attribute hashes (but ignoring unnecessary
# things like timestamps
def require_updates?(real_attrs, seed_attrs)
  # BUILD THIS FUNCTION LATER AND USE IT TO FIX THE
  # BROKEN IF/ELSE STATEMENTS SO IT DOESN'T ALWAYS
  # SAY "UPDATED" EVEN IF NOTHING CHANGED
end

# ************************************************
# CREATE WEB DEVELOPMENT 101 COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: Web Development 101 *****"

course_position += 1
course = create_or_update_course(
  title: "Web Development 101",
  title_url: "Web Development 101".parameterize,
  description: "This is where it all begins! A hands-on introduction to all of the essential tools you'll need to build real, working websites. You'll learn what web developers actually do – the foundations you'll need for later courses.",
  position: course_position,
)


# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "The Basics",
  title_url: "The Basics".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This section will cover the baseline knowledge you need before getting into the more 'programming' aspects of web development.  You'll also get a chance to install the necessary software on your computer."
)

lesson_counter += 1
create_or_update_lesson(
  title: "How this Course Will Work",
  title_url: "How this Course Will Work".parameterize,
  description: "Before you dive in, get familiar with the lay of the land up ahead.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/how_this_course_will_work.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction to Web Development",
  title_url: "Introduction to Web Development".parameterize,
  description: "Learn a little about web development as a career.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/introduction_to_web_development.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Gearing Up",
  title_url: "Gearing Up".parameterize,
  description: "Some advice about how to approach learning to program.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/gearing_up.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Join the Odin Community",
  title_url: "Join the Odin Community".parameterize,
  description: "Find out how to join Odin's community of new and veteran learners and how to get help with coding problems.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/join_the_odin_community.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "How Does the Web Work?",
  title_url: "How Does the Web Work?".parameterize,
  description: "It's tough to program web sites without understanding how the web actually works!",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/how_does_the_web_work.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Command Line Basics",
  title_url: "Command Line Basics".parameterize,
  description: "The command line: loved, hated, and feared... but no longer by you.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/command_line_basics.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Installations",
  title_url: "Installations".parameterize,
  description: "There are some things you'll need to install before you start getting your hands dirty",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_installations.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Git Basics",
  title_url: "Git Basics".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section you will learn the basics of Git and how you can upload your future projects to Github so you can share your work and collaborate with others on projects easily."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction to Git",
  title_url: "Introduction Git".parameterize,
  description: "A high level overview of what Git is and why it's so useful",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/git_intro.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Git Basics",
  title_url: "Git Basics".parameterize,
  description: "Now that you know what Git is it's time to learn how to use it.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/git_basics.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Practicing Git Basics",
  title_url: "Practicing Git Basics".parameterize,
  description: "In this tutorial you will see how Git is used on a small project.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_git_basics.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "The Front End",
  title_url: "The Front End".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section you'll spend a good deal of time getting familiar with the major client-side (browser-based) languages like HTML, CSS, and Javascript.  You'll get to build a webpage with HTML/CSS and learn some programming fundamentals with Javascript."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction to the Front End",
  title_url: "Introduction to the Front End".parameterize,
  description: "An overview of what exactly the 'Front End' is",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/introduction_to_the_front_end.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "HTML and CSS Basics",
  title_url: "HTML and CSS Basics".parameterize,
  description: "You'll learn all about how to build and style webpages with HTML and CSS",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/html_css_basics.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Developer Tools",
  title_url: "Developer Tools".parameterize,
  description: "Learn all about your browser's developer tools.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/developer_tools.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "HTML/CSS",
  title_url: "HTML/CSS".parameterize,
  description: "It's time to put your knowledge to work in the Wild.  Go forth and build!",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_html_css.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "JavaScript Basics",
  title_url: "JavaScript Basics".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Here we finally dig in to JavaScript and learn how to make the web dynamic."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Fundamentals Part 1",
  title_url: "JavaScript Fundamentals 1".parameterize,
  description: "You'll get a chance to start picking up the programming fundamentals you need to make your webpages dynamic",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/JS101/fundamentals/fundamentals-1.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Fundamentals Part 2",
  title_url: "JavaScript Fundamentals 2".parameterize,
  description: "Continues where Fundamentals 2 leaves off!",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/JS101/fundamentals/fundamentals-2.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Developer Tools 2",
  title_url: "Developer Tools 2".parameterize,
  description: "covers using the dev tools from the perspective of a JS developer",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/JS101/javascript-dev-tools.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Fundamentals Part 3",
  title_url: "JavaScript Fundamentals Part 3".parameterize,
  description: "Part 3 of our JS fundamentals course.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/JS101/fundamentals/fundamentals-3.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Rock Paper Scissors",
  title_url: "Rock Paper Scissors".parameterize,
  description: "Rock Paper Scissors",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/JS101/fundamentals/rock-paper-scissors-project.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Clean Code",
  title_url: "Clean Code".parameterize,
  description: "tips for writing better looking and easier to maintain code.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/JS101/code-structure.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Fundamentals Part 4",
  title_url: "JavaScript Fundamentals Part 4".parameterize,
  description: "Part 4 of our JS fundamentals course.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/JS101/fundamentals/fundamentals-4.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "DOM manipulation",
  title_url: "DOM manipulation".parameterize,
  description: "Finally, lets learn how to make your webpages move!",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/JS101/DOM-manipulation.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Etch-a-Sketch project",
  title_url: "etch-a-sketch-project".parameterize,
  description: "etch-a-sketch-project",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/JS101/etch-a-sketch-project.md",
  repo: 'javascript_curriculum'
)
lesson_counter += 1
create_or_update_lesson(
  title: "Fundamentals Part 5",
  title_url: "JavaScript Fundamentals Part 5".parameterize,
  description: "Part 5 of our JS fundamentals course.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/JS101/fundamentals/fundamentals-5.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Calculator",
  title_url: "Calculator".parameterize,
  description: "Calculator",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/JS101/final-project.md",
  repo: 'javascript_curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "The Back End",
  title_url: "The Back End".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Here you'll learn about the back end, where we'll demystify what goes on behind the scenes on a web server.  You'll get to take a crack at Ruby, the sublimely awesome language that runs Ruby on Rails."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction to the Back End",
  title_url: "Introduction to the Back End".parameterize,
  description: "A brief introduction to the wonderful world of server-side programming",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_backend/introduction_to_the_backend_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby Basics",
  title_url: "Ruby Basics".parameterize,
  description: "A healthy dive into Ruby, where you'll spend a fair bit of time mastering the basics of this programmer-friendly language.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_backend/ruby_basics_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby",
  title_url: "Ruby".parameterize,
  description: "Time to apply what you've learned about Ruby by making the tests pass on a number of exercises that range from goofy to challenging",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/the_backend/ruby_project.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Databases",
  title_url: "Databases".parameterize,
  description: "The last foundational component is how to 'save' your data by using a database.  You'll learn the basics of SQL, the language used to talk to most relational databases.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_backend/database_basics_lesson.md",
  repo: 'ruby_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Web Development Frameworks",
  title_url: "Web Development Frameworks".parameterize,
  course_id: course.id,
  position: section_position,
  description: "You've probably heard about 'Ruby on Rails' and 'Backbone.js' and other sleek-sounding development frameworks.  In this section, you'll learn what a framework is, why we use them, and get acquainted with the ones we'll be covering in future courses."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction to Frameworks",
  title_url: "Introduction to Frameworks".parameterize,
  description: "Let's figure out what all the hubbub is all about.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/web_development_frameworks/introduction_to_frameworks.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby on Rails Basics",
  title_url: "Ruby on Rails Basics".parameterize,
  description: "You'll learn the basics of the wildly popular framework that has made thousands of programmers highly productive and happy.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/web_development_frameworks/rails_basics.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby on Rails",
  title_url: "Ruby on Rails".parameterize,
  description: "You've learned the basics, now let's put them to work by building a basic application.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/web_development_frameworks/project_rails.md",
  repo: 'rails_course'
)
# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Pair Programming",
  title_url: "Pair Programming".parameterize,
  course_id: course.id,
  position: section_position,
  description: "So far, you've probably been working by yourself. Now it's time to learn how to team up with another person anywhere in the world."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction to Pair Programming",
  title_url: "Introduction to Pair Programming".parameterize,
  description: "A little background about why to even pair up in the first place.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/introduction_to_pair_programming.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Preparing to Remote Pair",
  title_url: "Preparing to Remote Pair".parameterize,
  description: "Even if you don't know anybody in the same town, you can still pair program!",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/prepare_to_remote_pair.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Pairing Project",
  title_url: "Pairing Project".parameterize,
  description: "Now that you know how to pair and have found someone to work with, let's do a project together.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_pairing.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Tying it All Together",
  title_url: "Tying it All Together".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Now that you've had a healthy taste of all the major components in a web application, we'll take a step back and remember where they all fit into the bigger picture."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "How far you've come already!  But this ride's only just begun...",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/conclusion.md",
  repo: 'curriculum'
)

# ************************************************
# CREATE RUBY COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: Ruby Programming *****"

course_position += 1
course = create_or_update_course(
  title: "Ruby Programming",
  title_url: "Ruby Programming".parameterize,
  description: "Time to dive deep into Ruby, the language 'designed for programmer happiness.' You'll cover object-oriented design, testing, and data structures – essential knowledge for learning other programming languages, too!",
  position: course_position,
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Basic Ruby",
  title_url: "Basic Ruby".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll cover the basic building blocks of Ruby so you have them down cold.  Everything else you'll learn in programming builds on these concepts, so you'll be in a great place to take on additional projects and languages in the future."
)

lesson_counter += 1
create_or_update_lesson(
  title: "How this Course Will Work",
  title_url: "How this Course Will Work".parameterize,
  description: "It's time to get acquainted with what this will look like from here on out.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/how_this_course_will_work_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby Building Blocks",
  title_url: "Ruby Building Blocks".parameterize,
  description: "A more in-depth look at the Ruby fundamentals like Variables, Data Types, Strings, and Methods.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/building_blocks_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Blocks",
  title_url: "Building Blocks".parameterize,
  description: "It's time to start getting used to building scripts without the training wheels on.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/basic_ruby/building_blocks_project.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Ruby Building Blocks",
  title_url: "Advanced Ruby Building Blocks".parameterize,
  description: "We'll continue our journey into the fundamentals, this time with Control Flow, Looping, Arrays, Hashes, Blocks and Sorting.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/advanced_building_blocks_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Building Blocks",
  title_url: "Advanced Building Blocks".parameterize,
  description: "Now you'll get the chance to really apply what you've learned so far by building a simple cipher and rebuilding the Enumerable methods that you'll use all the time going forward.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/basic_ruby/advanced_building_blocks_project.md",
  repo: 'ruby_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Intermediate Ruby",
  title_url: "Intermediate Ruby".parameterize,
  course_id: course.id,
  position: section_position,
  description: "You've got tools in your Ruby tool box and now it's time to combine them into more meaningful programs.  In this section, you'll learn how to turn your spaghetti code into properly organized methods and classes.  You'll also learn how to serialize code and save it into files."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Object Oriented Programming",
  title_url: "Object Oriented Programming".parameterize,
  description: "Fundamental concepts about object oriented programming that will help you with any programming language you learn from here on out.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/intermediate_ruby/oop_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "OOP",
  title_url: "OOP".parameterize,
  description: "It's time to flex those new muscles a bit by building Tic Tac Toe and Mastermind on the command line",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/intermediate_ruby/oop_project.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Files and Serialization",
  title_url: "Files and Serialization".parameterize,
  description: "What if you want to save the state of your program?  How about loading in a file?  Some basic operations like these will be covered here.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/intermediate_ruby/serialization_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Event Manager",
  title_url: "Event Manager".parameterize,
  description: "Learn File I/O while becoming civically active",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/intermediate_ruby/tutorial_event_manager.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "File I/O and Serialization",
  title_url: "File I/O and Serialization".parameterize,
  description: "You'll get a chance to scrub an existing dataset and then work with dictionaries by building Hangman.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/intermediate_ruby/file_io_project.md",
  repo: 'ruby_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "A Bit of Computer Science",
  title_url: "A Bit of Computer Science".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, you'll learn some fundamental computer science concepts that will help you when solving problems with a bit more complexity than just simple web serving.  You get to try on your engineering hat and solve some pretty nifty problems."
)

lesson_counter += 1
create_or_update_lesson(
  title: "A Very Brief Intro to CS",
  title_url: "A Very Brief Intro to CS".parameterize,
  description: "Get a taste of what's coming up ahead and what the bigger world of CS looks like beyond the scope of this course.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/computer_science/a_very_brief_intro_to_cs_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Recursive Methods",
  title_url: "Recursive Methods".parameterize,
  description: "Learn how making a function call itself can be helpful for making big problems into smaller problems",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/computer_science/recursion_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Recursion",
  title_url: "Recursion".parameterize,
  description: "Take your newfound knowledge and apply it to a couple of classic recursive problems",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/computer_science/recursion_project.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Common Data Structures and Algorithms",
  title_url: "Common Data Structures and Algorithms".parameterize,
  description: "Learn why we use different data structures to handle our data and some classic algorithms for searching through them to help solve problems",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/computer_science/data_structures_algorithms_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Linked Lists",
  title_url: 'Linked Lists'.parameterize,
  description: "Build one of the most fundamental data structures.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/computer_science/linked_lists_project.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Data Structures and Algorithms",
  title_url: "Data Structures and Algorithms".parameterize,
  description: "If you're scratching your head a bit on how to apply algorithmic thinking, here's a couple of exercises that let you use the tools you've just developed.  This should also be helpful when thinking about Final Projects... hint hint...",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/computer_science/data_structures_algorithms_project.md",
  repo: 'ruby_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Testing Ruby with RSpec",
  title_url: "Testing Ruby with RSpec".parameterize,
  course_id: course.id,
  position: section_position,
  description: "You've been briefly introduced to testing in Ruby a couple of times before in the Web Development 101 course, but now you're going to really learn why testing can be hugely helpful and how to apply it to your own projects."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction to RSpec",
  title_url: "Introduction to RSpec".parameterize,
  description: "Many tech companies these days rely on test-heavy methods of development so it's time to get familiar with it.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/testing_with_rspec/introduction_to_rspec_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Testing Ruby",
  title_url: "Testing Ruby".parameterize,
  description: "The real way to learn is by doing, so you'll jump in the time machine and write some tests for prior projects.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/testing_with_rspec/testing_project.md",
  repo: 'ruby_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Git",
  title_url: "Git".parameterize,
  course_id: course.id,
  position: section_position,
  description: "You should be familiar with the basic Git workflow since you've been using it to save your projects along the way (right?!).  This section will start preparing you for for the more intermediate-level uses of Git that you'll find yourself doing ."
)

lesson_counter += 1
create_or_update_lesson(
  title: "A Deeper Look at Git",
  title_url: "A Deeper Look at Git".parameterize,
  description: "Beyond just `$ git add` and `$ git commit`...",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/git/a_deeper_look_at_git_lesson.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using Git in the Real World",
  title_url: "Using Git in the Real World".parameterize,
  description: "We've just scratched the surface, so here's what to be aware of as you start developing more and more using Git.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/git/using_git_in_the_real_world_lesson.md",
  repo: 'ruby_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  course_id: course.id,
  position: section_position,
  description: "You've come an exceptional distance already, now there's just the matter of wrapping it all together into one coherant package and creating something real.  This is your Final Exam and a major feather in your cap.  Once you've completed this section, you should have the confidence to tackle pretty much anything."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby Final Project",
  title_url: "Ruby Final Project".parameterize,
  description: "Now would be a good time to refresh your memory on how to play Chess. Building it is actually more fun (and more rewarding)!",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/conclusion/final_project.md",
  repo: 'ruby_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Woah! You made it! Let's take a minute to look back and put things in context for the next step ahead.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/conclusion/conclusion_lesson.md",
  repo: 'ruby_course'
)

# ************************************************
# CREATE RAILS COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: Ruby on Rails *****"

course_position += 1
course = create_or_update_course(
  title: "Ruby on Rails",
  title_url: "Ruby on Rails".parameterize,
  description: "Take Ruby to the next level with the Ruby on Rails framework! Learn how to fully craft your site's backend using the Model-View-Controller design pattern. You'll gain the confidence to launch a website in under an hour.",
  position: course_position,
)

# +++++++++++
# SECTION
# +++++++++++
section_position += 1
section = create_or_update_section(
  title: "The Track ahead",
  title_url: "The Track ahead".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, have a look at the track ahead in this course."
)

lesson_counter += 1
create_or_update_lesson(
  title: "How this Course Will Work",
  title_url: "How this Course Will Work".parameterize,
  description: "Let's get acquainted with what this will look like from here on out.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/introduction.md",
  repo: 'rails_course'
)

# +++++++++++
# SECTION
# +++++++++++
section_position += 1
section = create_or_update_section(
  title: "Sinatra",
  title_url: "Sinatra".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section we will look at sinatra, a light weight Ruby web framework. Learning Sinatra before tackling rails will reduce the learning curve in this course significantly as sinatra will expose most of the things that rails does under the hood for you. This should give you a better understanding about how everything works with Rails."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Sinatra Basics",
  title_url: "Sinatra Basics".parameterize,
  description: "In this lesson you will learn the basics of Sinatra",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/sinatra/sinatra.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Sinatra Project",
  title_url: "Sinatra Project".parameterize,
  description: "In this project you will convert some of the projects you completed in Ruby Programming into web apps.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/sinatra/project_sinatra.md",
  repo: 'rails_course'
)

# +++++++++++
# SECTION
# +++++++++++
section_position += 1
section = create_or_update_section(
  title: "Introduction to Rails",
  title_url: "Introduction to Rails".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll dive right into Rails and get you building from the start so you have an idea of what (and how) you'll learn going forward.  We'll get your feet planted in the right spot and your head pointed the right direction."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Getting Your Feet Wet",
  title_url: "Getting Your Feet Wet".parameterize,
  description: "This will give you the chance to build a full Rails app using some of the special tools Rails provides.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/introduction_to_rails/project_feet_wet.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "A Railsy Web Refresher",
  title_url: "A Railsy Web Refresher".parameterize,
  description: "We're not just using the Web, we're living it.  This lesson will get you up to speed on how.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/introduction_to_rails/web_refresher.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Deployment",
  title_url: "Deployment".parameterize,
  description: "There's nothing quite like seeing your application on a real website.  We'll show you how it's done.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/introduction_to_rails/deployment.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Let's Get Building",
  title_url: "Let's Get Building".parameterize,
  description: "In this project, you'll get started with the core tutorial we'll be following throughout this course.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/introduction_to_rails/project_lets_build.md",
  repo: 'rails_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Routes, Views, Controllers and Assets",
  title_url: "Routes, Views, Controllers and Assets".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Now that you've gotten your feet wet, it's time to start looking carefully into the foundational pieces of the Rails framework.  We'll cover the path of an HTTP request from entering your application to returning as an HTML page to the browser."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Routing",
  title_url: "Routing".parameterize,
  description: "The router is the switchboard of your app, telling requests which controller action they're supposed to run. ",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/routes_views_controllers_assets/routing.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Controllers",
  title_url: "Controllers".parameterize,
  description: "Controllers are the middle managers of the whole process -- they tell everyone else what to do and take all the credit.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/routes_views_controllers_assets/controller_basics.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Views",
  title_url: "Views".parameterize,
  description: "When the controller has figured out which data needs to be displayed, it's the View's job to turn that into some half-decent HTML.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/routes_views_controllers_assets/views.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "The Asset Pipeline",
  title_url: "The Asset Pipeline".parameterize,
  description: "This lesson explains how Rails handles all the behind-the-scenes stuff to get your CSS, Javascript and Image files served quickly and efficiently and how you can use that process.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/routes_views_controllers_assets/asset_pipeline.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Basic Routes, Views and Controllers",
  title_url: "Basic Routes, Views and Controllers".parameterize,
  description: "You'll get to play with routing and build what you've learned in this section so far.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/routes_views_controllers_assets/project_basic_rvc.md",
  repo: 'rails_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Databases and Active Record",
  title_url: "Databases and Active Record".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This section covers the back end of Rails, which is the most important part of the framework.  You'll learn about databases and go deep into SQL before applying that knowledge to Rails' fantastic Active Record gem."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Databases and SQL",
  title_url: "Databases and SQL".parameterize,
  description: "Data is the core of every major web app and here you'll learn how to speak SQL.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/databases_and_activerecord/databases.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "SQL",
  title_url: "SQL".parameterize,
  description: "The best way to learn is by practice, so this project will give you plenty of opportunity to apply your new SQL powers (for good).",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/databases_and_activerecord/project_databases.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Active Record Basics",
  title_url: "Active Record Basics".parameterize,
  description: "Active Record is the crown jewel of Rails because it turns all the bare metal database queries (like SQL) into nice clean Ruby methods.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/databases_and_activerecord/active_record_basics.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building With Active Record",
  title_url: "Building With Active Record".parameterize,
  description: "You'll start getting practice thinking data first before building something that acts a lot like Reddit.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/databases_and_activerecord/project_ar_basics.md",
  repo: 'rails_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Forms and Authentication",
  title_url: "Forms and Authentication".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This section gets into some of the areas of web apps that are less glamorous than they are important.  Forms are your user's window to interact with your application. Authentication is critical for many applications, and you'll build a couple of auth systems from the ground up."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Form Basics",
  title_url: "Form Basics".parameterize,
  description: "Half refresher, half expanding your mind, this will bridge the gap between the lowly web form and your server side logic.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/forms_and_authentication/form_basics.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Forms",
  title_url: "Forms".parameterize,
  description: "To understand the form, you must start from the beginning.  We'll start with HTML and then learn how Rails can really help you out.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/forms_and_authentication/project_forms.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Sessions, Cookies, and Authentication",
  title_url: "Sessions, Cookies, and Authentication".parameterize,
  description: "Learn how to store data in the user's browser and how that is used to sign in the user and keep them signed in across requests.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/forms_and_authentication/sessions_cookies_authentication.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Authentication",
  title_url: "Authentication".parameterize,
  description: "You'll build a closed community for sharing embarrassing gossip with the world.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/forms_and_authentication/project_auth.md",
  repo: 'rails_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Advanced Forms and Active Record",
  title_url: "Advanced Forms and Active Record".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Now it's starting to get fun!  Learn how to do more than just find and show your users... you'll learn how to use relationships between models to greatly expand your abilities and how to build web forms with sufficient firepower to achieve your most ambitious goals."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Active Record Queries",
  title_url: "Active Record Queries".parameterize,
  description: "Learn how to take some of those advanced querying concepts you used in SQL and have Rails do them for you mathemagically.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/advanced_forms_and_activerecord/active_record_queries.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Active Record Associations",
  title_url: "Active Record Associations".parameterize,
  description: "Dive into some of the more interesting features of associations like special methods and polymorphism.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/advanced_forms_and_activerecord/active_record_associations.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Associations",
  title_url: "Associations".parameterize,
  description: "Build a system to manage signups for you and your friends' special events.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/advanced_forms_and_activerecord/project_associations.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Active Record Callbacks",
  title_url: "Active Record Callbacks".parameterize,
  description: "A brief look at the life-cycle of an Active Record object, from birth to destruction, and how you can hook into that for profit.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/advanced_forms_and_activerecord/active_record_callbacks.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Associations",
  title_url: "Advanced Associations".parameterize,
  description: "Exercise those association muscles to finish up the tutorial like a pro.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/advanced_forms_and_activerecord/project_associations_2.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Forms",
  title_url: "Advanced Forms".parameterize,
  description: "Take what you know about forms and put rocket boosters on it.  Don't be afraid to make a form for anything.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/advanced_forms_and_activerecord/forms_advanced.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Advanced Forms",
  title_url: "Building Advanced Forms".parameterize,
  description: "Build an airline flight signup system, which is a nest of interesting complexities",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/advanced_forms_and_activerecord/project_forms_advanced.md",
  repo: 'rails_course'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "APIs, Mailers and Advanced Topics",
  title_url: "APIs, Mailers and Advanced Topics".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This final section will take you into some of the more interesting sides of the Rails ecosystem which will help you reach beyond your own app and into the lives of your users via email or harness the powers of other apps via their APIs."
)

lesson_counter += 1
create_or_update_lesson(
  title: "APIs and Building Your Own",
  title_url: "APIs and Building Your Own".parameterize,
  description: "Rails is really just an API itself... learn about APIs and how to turn your app into one",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/api_basics.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Working With External APIs",
  title_url: "Working With External APIs".parameterize,
  description: "Lots of the power of APIs comes from interfacing with third-party applications, which we'll cover in this lesson.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/api_interfacing.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "APIs",
  title_url: "APIs".parameterize,
  description: "In this project, you'll both build your own API and work with a third-party API.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/apis_mailers_advanced_topics/project_apis.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Mailers",
  title_url: "Mailers".parameterize,
  description: "You don't often think about where your email comes from.  Here you'll learn how to send it from your app.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/mailers.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Sending Confirmation Emails",
  title_url: "Sending Confirmation Emails".parameterize,
  description: "Add email functionality to an existing project.  Just don't SPAM, it's frowned upon.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/apis_mailers_advanced_topics/project_mailers.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Topics",
  title_url: "Advanced Topics".parameterize,
  description: "A mash-up of orphan topics like advanced routing, layouts, metaprogramming and design patterns.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/advanced_topics.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Final Project",
  title_url: "Final Project".parameterize,
  description: "There's a pretty popular social networking app you should build.  They may have made a movie about it.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails_programming/apis_mailers_advanced_topics/project_final.md",
  repo: 'rails_course'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Holy cow, you've gotten to the end of the road!  ...Sort of.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails_programming/apis_mailers_advanced_topics/conclusion.md",
  repo: 'rails_course'
)

# ************************************************
# CREATE HTML5/CSS3 COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: HTML/CSS *****"

course_position += 1
course = create_or_update_course(
  title: "HTML5 and CSS3",
  title_url: "HTML5 and CSS3".parameterize,
  description: "Good web design doesn't happen by accident. Learn how to make all that work you've done on the backend look great in a web browser! You'll be equipped to deeply understand and create your own design frameworks.",
  position: course_position,
)

# :description: "The trouble with being a back end guru is that you can build an awesome site that has distilled a complex problem into a clean series of modular operations and fast server calls. . . but it still looks like something from 1995.  In this unit, you'll get over your fear of CSS and begin to understand some of the more fundamental tenets of good site design.  This isn't a full course on front end design, but it should give you the tools you need to deeply understand CSS frameworks and how to put a half-decent facade on your genius backside.",

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Basic HTML Page Structure",
  title_url: "Basic HTML Page Structure".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll cover the whole range of HTML5 so you'll be completely comfortable with putting the right elements in the right places on a page."
)


lesson_counter += 1
create_or_update_lesson(
  title: "How This Course Will Work",
  title_url: "How This Course Will Work".parameterize,
  description: "Let's get acquainted with what this will look like from here on out.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/introduction.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "HTML5 Basics",
  title_url: "HTML5 Basics".parameterize,
  description: "A brief refresher on the very basics of HTML.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/html5_basics.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Linking Internal and External Pages",
  title_url: "Linking Internal and External Pages".parameterize,
  description: "When do you link to the relative URL versus the absolute?  How do you set up internal links?",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/links.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Working with Images, Video and Other Media",
  title_url: "Working with Images, Video and Other Media".parameterize,
  description: "Rich media experiences make your pages come alive but there are some things you'll need to know to avoid slow load times.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/images.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Embedding Images and Video",
  title_url: "Embedding Images and Video".parameterize,
  description: "To get some practice with everything you've picked up so far, you'll rebuild YouTube's video page.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_media.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "What's New in HTML5",
  title_url: "What's New in HTML5".parameterize,
  description: "The transition to HTML5 has opened up several new elements and best practices which will make your life easier.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/new_html5.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Displaying and Inputting Data",
  title_url: "Displaying and Inputting Data".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Displaying and inputting data are two of your chief duties as a web developer. We'll cover the tools at your disposal, including tables and lists for display and forms for input."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Tables in HTML",
  title_url: "Tables in HTML".parameterize,
  description: "Tables aren't used as much as they once were but can still be a great way to display structured content.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/tables.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ordered and Unordered Lists",
  title_url: "Ordered and Unordered Lists".parameterize,
  description: "Lists are used everywhere and even in some unexpected places like navigation bars.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/lists.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Forms for Collecting Data",
  title_url: "Forms for Collecting Data".parameterize,
  description: "Forms allow the user to submit data to your application and represent one of the trickiest parts of setting up your HTML structure.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/html_forms.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "HTML Forms",
  title_url: "HTML Forms".parameterize,
  description: "Get some practice working with different form elements by building Mint.com's signup.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_html_forms.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "CSS3",
  title_url: "CSS3".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Here we'll cover each of the foundational CSS concepts in greater depth than you probably have before."
)

lesson_counter += 1
create_or_update_lesson(
  title: "CSS3 Basics",
  title_url: "CSS3 Basics".parameterize,
  description: "Even though you're already comfortable with CSS, it's worth revisiting the basics.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/css_basics.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "The Box Model",
  title_url: "The Box Model".parameterize,
  description: "Even experienced developers often have trouble with the details of the box model, which governs how elements are displayed on the page.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/box_model.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Floats and Positioning",
  title_url: "Floats and Positioning".parameterize,
  description: "Positioning elements on the page can give you fits, so learning how elements play together is well worth your time.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/floats_positioning.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Positioning and Floating Elements",
  title_url: "Positioning and Floating Elements".parameterize,
  description: "Long content pieces of yesteryear are being replaced with rich multimedia experiences and the Times has led the charge.  See if you can apply what you learned about positioning by cloning one of their articles.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_positioning.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Best Practices",
  title_url: "Best Practices".parameterize,
  description: "It's one thing to have the toolbox and a whole other to understand the best way to use it.  We'll explore some of these best practices in this section.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/best_practices.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Backgrounds and Gradients",
  title_url: "Backgrounds and Gradients".parameterize,
  description: "Here you'll learn about placing and positioning background images and working with gradients.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/backgrounds.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building with Backgrounds and Gradients",
  title_url: "Building with Backgrounds and Gradients".parameterize,
  description: "Apple is a design leader and their homepage can teach you a lot about working with images and gradients.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_backgrounds.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Design and UX",
  title_url: "Design and UX".parameterize,
  course_id: course.id,
  position: section_position,
  description: "If you want to make your websites stop looking like they came from the 1990's, you'll need to gain an understanding for at least the best practices of design and User Experience (UX).  Not knowing this stuff is like charging over the next hill without any idea of why you're doing it."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction to Design and UX",
  title_url: "Introduction to Design and UX".parameterize,
  description: "A grounding in some fundamental design definitions and tenets will go a long way.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/design_ux.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Fonts and Typography",
  title_url: "Fonts and Typography".parameterize,
  description: "Understanding fonts and typography is far from a design geek's domain -- they greatly affect the ease of use for your pages.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/typography.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "CSS Grids",
  title_url: "CSS Grids".parameterize,
  description: "Content isn't just thrown onto the page without a care -- grid systems apply logic and order to the way information is displayed.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/css_grids.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Design Teardown",
  title_url: "Design Teardown".parameterize,
  description: "The first step to understanding design is to train yourself to *see* design, so you'll get a chance to break down one of the hallmark Design publications, Smashing Magazine.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_design.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Responsive Design and CSS Frameworks",
  title_url: "Responsive Design and CSS Frameworks".parameterize,
  course_id: course.id,
  position: section_position,
  description: "These days you need to make sure your pages display easily on multiple viewport sizes by using fluid layouts and media queries.  Luckily there are CSS frameworks like Twitter Bootstrap that can save you a ton of time developing standard pages and which come with responsive functionality for free."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Responsive Design",
  title_url: "Responsive Design".parameterize,
  description: "Your websites will need to degrade gracefully as your users move from a full browser to an iPad to a mobile phone, and here you'll learn how.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/responsive_design.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building with Responsive Design",
  title_url: "Building with Responsive Design".parameterize,
  description: "It's time to put your newfound responsive superpowers to use by building The Next Web's responsive homepage.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_responsive.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "CSS Frameworks like Bootstrap and Foundation",
  title_url: "CSS Frameworks like Bootstrap and Foundation".parameterize,
  description: "Now that you've mastered the fundamentals of HTML and CSS, it's time to make your workflow a whole lot easier with CSS frameworks.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/css_frameworks.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using Bootstrap",
  title_url: "Using Bootstrap".parameterize,
  description: "Test out working with the Bootstrap framework.  It may feel a bit odd at first but it makes your life MUCH easier once you figure out the gist of it. ",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_bootstrap.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Advanced CSS3",
  title_url: "Advanced CSS3".parameterize,
  course_id: course.id,
  position: section_position,
  description: "We'll take you beyond the basics of CSS and into a variety of additional topics from how to add some stylistic flair to your elements to using tools like preprocessors to save time and reduce repetition in your code."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Animations, Subtle Effects and Compatibility",
  title_url: "Animations, Subtle Effects and Compatibility".parameterize,
  description: "Dive into some of the more interesting stylistic tools at your disposal like transitions and animations that use only CSS3.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/stylings.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using CSS Preprocessors to Save Time",
  title_url: "Using CSS Preprocessors to Save Time".parameterize,
  description: "Learn about preprocessors like SASS which can make your CSS act more like real code... which is a good thing because it'll save you time and gray hairs.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/preprocessors.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Design Your Own Grid-Based Framework",
  title_url: "Design Your Own Grid-Based Framework".parameterize,
  description: "This final project will require you to apply almost everything you've learned up until now since you'll be building your own version of a grid-based CSS framework.  Luckily you can use it on your projects from here on out!",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_css_frameworks.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "You've found the light at the end of the tunnel.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/conclusion.md",
  repo: 'curriculum'
)

# ************************************************
# CREATE JAVASCRIPT COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: Javascript *****"

course_position += 1
course = create_or_update_course(
  title: "Javascript",
  title_url: "Javascript".parameterize,
  description: "Make your websites dynamic and interactive with JavaScript! You'll create features and stand-alone applications. This course will wrap everything you've learned at The Odin Project into one, final capstone project.",
  position: course_position,
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

lesson_counter += 1
create_or_update_lesson(
  title: "How this course will work",
  title_url: "How this course will work".parameterize,
  description: "How this course will work",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/main-course-introduction/introduction.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "A quick review",
  title_url: "A quick review".parameterize,
  description: "A quick review",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/main-course-introduction/js101-review.md",
  repo: 'javascript_curriculum'
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

lesson_counter += 1
create_or_update_lesson(
  title: "Introduction",
  title_url: "organizing introduction".parameterize,
  description: "introduction",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/organizing-js/organizing-introduction.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Objects and Object Constructors",
  title_url: "Objects and Object Constructors".parameterize,
  description: "Covers plain old javascript objects and object constructors",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/organizing-js/objects-constructors.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Library",
  title_url: "Library".parameterize,
  description: "Library",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/organizing-js/library-project.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Factory Functions and the Module Pattern",
  title_url: "Factory Functions and the Module Pattern".parameterize,
  description: "Factory Functions and the Module Pattern",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/organizing-js/factory-functions.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Tic Tac Toe",
  title_url: "Tic Tac Toe".parameterize,
  description: "Tic Tac Toe",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/organizing-js/tic-tac-toe-project.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Classes",
  title_url: "JavaScript Classes".parameterize,
  description: "Classes",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/organizing-js/classes.md",
  repo: 'javascript_curriculum'
)


lesson_counter += 1
create_or_update_lesson(
  title: "ES6 Modules",
  title_url: "ES6 Modules".parameterize,
  description: "ES6 Modules",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/organizing-js/es6-modules.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Restaurant Page",
  title_url: "Restaurant Page".parameterize,
  description: "Restaurant Page",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/organizing-js/restaurant-project.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "OOP Principles",
  title_url: "OOP Principles".parameterize,
  description: "OOP Principles",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/organizing-js/oop-concepts.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Todo List",
  title_url: "Todo List".parameterize,
  description: "Todo List",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/organizing-js/project.md",
  repo: 'javascript_curriculum'
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

lesson_counter += 1
create_or_update_lesson(
  title: "Linting",
  title_url: "Linting".parameterize,
  description: "Linting",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/js-in-the-real-world/linting.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Dynamic User Interface Interactions",
  title_url: "User Interface Interactions".parameterize,
  description: "UI Interactions",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/js-in-the-real-world/ui-Interactions.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Forms",
  title_url: "Forms".parameterize,
  description: "Forms",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/js-in-the-real-world/forms.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Webpack 2",
  title_url: "Webpack 2".parameterize,
  description: "Webpack 2",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/js-in-the-real-world/webpack-2.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "ES?",
  title_url: "ES?".parameterize,
  description: "ES?",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/js-in-the-real-world/es6-features.md",
  repo: 'javascript_curriculum'
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

lesson_counter += 1
create_or_update_lesson(
  title: "JSON",
  title_url: "JSON".parameterize,
  description: "JSON",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/async-apis/json.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Async",
  title_url: "Async".parameterize,
  description: "Async",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/async-apis/promises-async.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Working with APIs",
  title_url: "Working with APIs".parameterize,
  description: "Working with APIs",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/async-apis/APIs.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Weather App",
  title_url: "Weather App".parameterize,
  description: "Weather App",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/async-apis/project.md",
  repo: 'javascript_curriculum'
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

lesson_counter += 1
create_or_update_lesson(
  title: "Testing Basics",
  title_url: "Testing Basics".parameterize,
  description: "Testing Basics",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/testing/testing-1.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Testing Practice",
  title_url: "Testing Practice".parameterize,
  description: "Testing Practice",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/testing/testing-practice.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "More Testing",
  title_url: "More Testing".parameterize,
  description: "More Testing",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/testing/testing-2.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Battleship",
  title_url: "Battleship".parameterize,
  description: "Battleship",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/testing/battleship-project.md",
  repo: 'javascript_curriculum'
)
# +++++++++++
# section
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "javascript and rails",
  title_url: "javascript and rails".parameterize,
  course_id: course.id,
  position: section_position,
  description: "a real web app needs a back end in order to persist its data and do sensitive operations.  here you'll learn how to handle use ajax to send data requests to your rails back end.  you'll also get a chance to work with external apis like google maps, which is something you'll probably find yourself doing quite frequently as you build your own projects in the future."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using Ruby on Rails For Your Back End",
  title_url: "Using Ruby on Rails For Your Back End".parameterize,
  description: "You've got experience working with APIs, now it's time to treat your Rails app like one.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/js-rails/rails_backend.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Where's Waldo (A Photo Tagging App)",
  title_url: "Where's Waldo (A Photo Tagging App)".parameterize,
  description: "Pull together everything you've learned so far to create a \"Where's Waldo?\" game.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/js-rails/project_rails_backend.md",
  repo: 'javascript_curriculum'
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

lesson_counter += 1
create_or_update_lesson(
  title: "Final Project",
  title_url: "Final Project".parameterize,
  description: "Tie everything you've learned from every course so far into one project where you'll build your favorite website from scratch.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/project_final_js.md",
  repo: 'javascript_curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Well, that was easy, right?",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/conclusion.md",
  repo: 'javascript_curriculum'
)

# ************************************************
# CREATE GETTING HIRED COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: Getting Hired *****"

course_position += 1
course = create_or_update_course(
  title: "Getting Hired",
  title_url: "Getting Hired".parameterize,
  description: "Web development is a lifelong journey of learning and growth. Continue that journey on a professional development team! You'll learn where to find jobs, how to do great interviews, and the best strategies to launch your career.",
  position: course_position,
)

# :description: "Learning on your own is a long hard road and you've come incredibly far.  Good work!  With that same level of focus and dedication, you should be able to polish off your skillsets, address your weak points, and get hired as a web developer.  Because you've still got a whole lot more to learn (it's really a lifetime journey) but now the best way to do that is by surrounding yourself with other great developers.  This course is all about that next step -- what else you'll need to know, where to find jobs, how to interview, and how to ultimately get that offer in hand.  It won't be easy, but you can do it!",

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Preparing for Your Job Search",
  title_url: "Preparing for Your Job Search".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Your job search begins long before you send out the first application, so be sure to adequately prepare by laying out a strategy and being honest with yourself about your goals, needs and expectations."
)

lesson_counter += 1
create_or_update_lesson(
  title: "How This Course Will Work",
  title_url: "How This Course Will Work".parameterize,
  description: "This course is a bit different than the others so it's worth getting acquainted with how it will work.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/introduction.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Strategy",
  title_url: "Strategy".parameterize,
  description: "You will need to develop a coherent strategy for how you'll approach the process or risk wasting time.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/strategy.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "It Starts with YOU",
  title_url: "It Starts with YOU".parameterize,
  description: "You won't get hired anywhere you want to be unless you have an honest conversation with yourself.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/starts_with_you.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "What Companies Want",
  title_url: "What Companies Want".parameterize,
  description: "An important step to selling yourself is realizing what the companies doing the hiring really want.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/what_companies_want.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "What You Can Do To Prepare",
  title_url: "What You Can Do To Prepare".parameterize,
  description: "There are many things you can do ahead of time to prepare for your job hunt that will greatly help your odds of getting hired.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/preparation.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Your Personal Website",
  title_url: "Building Your Personal Website".parameterize,
  description: "Nothing shows off your work quite as effectively as a website you've built yourself. Just be careful not to go overboard with it.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/jobs_jobs_jobs/project_portfolio.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Applying to and Interviewing for Jobs",
  title_url: "Applying to and Interviewing for Jobs".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This is an odds game, so you've got to structure your plan and focus on highest probability approaches and targets.  In this section we'll cover how the process typically works and the best way to increase your odds of success. Go get 'em."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Collecting Job Leads",
  title_url: "Collecting Job Leads".parameterize,
  description: "Your first step to finding that perfect job is knowing where to look and collecting good leads.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/collect_leads.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Qualifying Job Leads",
  title_url: "Qualifying Job Leads".parameterize,
  description: "You will need to have a rigorous process for evaluating leads or you will end up wasting your time.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/qualify_leads.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Your Resume",
  title_url: "Building Your Resume".parameterize,
  description: "Even in this day and age, the resume is still the primary way people get information about you.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/jobs_jobs_jobs/project_resume.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Applying for Web Development Jobs",
  title_url: "Applying for Web Development Jobs".parameterize,
  description: "Some tips for increasing your odds during the application process itself.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/applying.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Preparing to Interview and Interviewing",
  title_url: "Preparing to Interview and Interviewing".parameterize,
  description: "Interviewing is annoying and difficult but you'll have to do it.  We'll help point you to the best resources for preparing yourself.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/preparing_to_interview.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Handling a Job Offer",
  title_url: "Handling a Job Offer".parameterize,
  description: "Woohoo! Now what??",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/handling_an_offer.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Alternate Paths to a Web Development Job",
  title_url: "Alternate Paths to a Web Development Job".parameterize,
  description: "A look at several alternative ways you can find a web development job.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/alternatives.md",
  repo: 'curriculum'
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Wrapping up The Odin Project and what you can do to have a strong career.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/conclusion.md",
  repo: 'curriculum'
)

#create dummy users and projects for the google homepage project
# if Rails.env.development? || ENV['STAGING']
#   load './db/seeds/dummy_projects.rb'
# end

# SANITY CHECKS

Rails.logger.info "\n\n\n\n\n##################   SANITY CHECKS   ##################\n\n"
Rails.logger.info "#{course_position} courses, #{section_position} sections and #{lesson_counter} lessons dealt with here."
Rails.logger.info "#{Course.count} courses, #{Section.count} sections and #{Lesson.count} lessons in the database.\n"
extra_courses = Course.where("position >= ?", incrementer)
extra_sections = Section.where("position >= ?", incrementer)
extra_lessons = Lesson.where("position >= ?", incrementer)

if extra_courses.count > 0 || extra_lessons.count > 0 || extra_sections.count > 0
  "\n\nWARNING: You have leftover courses, sections or lessons in the database.  Probably a title duplicate.  Recommend deleting all instances with position >= #{incrementer}.\n\n"
else
  Rails.logger.info "There appears to be no leftover stuff in the database.  Go about your day in peace."
end

if extra_courses.count > 0
  Rails.logger.warn "\n WARNING: #{extra_courses.count} leftover courses!"
  extra_courses.each do |c|
    Rails.logger.info ">>> Extra course: #{c.inspect}"
  end
end

if extra_sections.count > 0
  Rails.logger.warn "\n WARNING: #{extra_sections.count} leftover sections!"
  extra_sections.each do |s|
    Rails.logger.info ">>> Extra section: #{s.inspect}"
  end
end

if extra_lessons.count > 0
  Rails.logger.warn "\n WARNING: #{extra_lessons.count} leftover lessons!"
  extra_lessons.each do |c|
    Rails.logger.info ">>> Extra lesson: #{c.inspect}"
  end
end

Rails.logger.info "\n#######################################################\n\n\n\n"
