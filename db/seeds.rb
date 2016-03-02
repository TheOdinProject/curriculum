# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

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
incrementer = 1000

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
    puts ">>>> Created new course: #{course_attrs[:title]}!"
  elsif course.attributes == course_attrs
    puts "No changes to existing course: #{course_attrs[:title]}"
  else
    course.update_attributes(course_attrs)
    puts "Updated existing << COURSE >>: #{course_attrs[:title]}"
  end

  course
end

def create_or_update_section(section_attrs)
  section = Section.where(title: section_attrs[:title], course_id: section_attrs[:course_id]).first

  if section.nil?
    section = Section.create!(section_attrs)
    puts ">>>> Created new SECTION: #{section_attrs[:title]}!"
  elsif section.attributes == section_attrs
    puts "No changes to existing section: #{section_attrs[:title]}"
  else
    section.update_attributes(section_attrs)
    puts "Updated existing SECTION: #{section_attrs[:title]}"
  end

  section
end

def create_or_update_lesson(lesson_attrs)
  lesson = Lesson.where(title: lesson_attrs[:title], section_id: lesson_attrs[:section_id]).first

  if lesson.nil?
    lesson = Lesson.create!(lesson_attrs)
    puts ">>>> Created new lesson: #{lesson_attrs[:title]}!"
  elsif lesson.attributes == lesson_attrs
    puts "No changes to existing lesson: #{lesson_attrs[:title]}"
  else
    lesson.update_attributes(lesson_attrs)
    puts "Updated existing lesson: #{lesson_attrs[:title]}"
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
# CREATE INTRO TO WEB DEVELOPMENT COURSE
# ************************************************
puts "\n\n***** STARTING COURSE: Introduction to Web Development *****"

course_position += 1

course = create_or_update_course(
  title: "Introduction to Web Development",
  title_url: "Introduction to Web Development".parameterize,
  teaser: "Start Here!",
  brief_desc: "This course will start from zero, answering the basic questions people have about the actual practice and career of web development.  You'll gain a much better understanding of what you're about to get into!",
  description: "This short course is about answering the basic questions people have about the actual practice and career of web development. Because, let's be honest, even if you've got a strong feeling that you like building things and web development is the right path for you, you still probably don't have a great idea of what developers actually do... and that's where everyone starts so it's okay.",
  position: course_position,
  you_learn: ["What a web developer really does", "The tools of the trade", "How to get hired as a web developer"],
  you_build: ["Hold on, you'll be building soon!"],
  is_active: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1

section = create_or_update_section(
  title: "About Web Developers",
  title_url: "About Web Developers".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Start from the beginning and learn about what a web developer really does and what the field of web development is really like."
)

lesson_counter += 1

create_or_update_lesson(
  title: "What a Web Developer Does",
  title_url: "What a Web Developer Does".parameterize,
  description: "From what a developer actually does to key distinctions like Front End vs Back End, Web Developers vs Web Designers, and Web Sites vs Web Applications",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/introduction_to_web_development/what_does_a_web_dev_do.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Web Development Jobs and Careers",
  title_url: "Web Development Jobs and Careers".parameterize,
  description: "Some brief examples of what developer roles are like in a variety of different organizations",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/introduction_to_web_development/web_dev_jobs.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Tools of the Trade",
  title_url: "Tools of the Trade".parameterize,
  description: "An overview of the different tools that web developers use to get their work done",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/introduction_to_web_development/tools_of_the_trade.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Web Development Communities",
  title_url: "Web Development Communities".parameterize,
  description: "Developers are a surprisingly social group, and here's how to find them both online and in-person",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/introduction_to_web_development/web_dev_communities.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "The Best Web Developers",
  title_url: "The Best Web Developers".parameterize,
  description: "Some tips on what makes a great web developer",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/introduction_to_web_development/the_best_web_devs.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Getting Hired as a Web Developer",
  title_url: "Getting Hired as a Web Developer".parameterize,
  description: "Briefly demystifying what employers are actually looking for in a web developer and what the process might look like for you to get hired",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/introduction_to_web_development/getting_hired_as_a_web_dev.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "A look ahead at your upcoming journey down the web development rabbit hole",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/introduction_to_web_development/conclusion.md"
)

# ************************************************
# CREATE WEB DEVELOPMENT 101 COURSE
# ************************************************
puts "\n\n***** STARTING COURSE: Web Development 101 *****"

course_position += 1
course = create_or_update_course(
  title: "Web Development 101",
  title_url: "Web Development 101".parameterize,
  teaser: "A Healthy Dose of Everything",
  brief_desc: "This course is for anyone who is either starting from scratch or who isn't entirely comfortable with their understanding of the command line, HTML, CSS, Javascript, Ruby, web frameworks, Git, or other foundational technologies of web development.  We cover a LOT of ground -- by the end of this comprehensive course, you'll be well prepared to take on our deep dive courses or explore further on your own.",
  description: "Now that you know what web developers do, it's time to start thinking about how they actually do it. In this course, you'll learn the foundational concepts of web programming. By the end, you will be able to build a simple webpage, style it, and add elements of interactivity while working comfortably from the command line.  You will be comfortable with basic scripting in Ruby and Javascript as well as more unfamiliar things like Git and databases.  We will cover a lot of knowledge and you'll be able to get your hands dirty with all the topics that we're going to learn in the deep-dive courses that follow.",
  position: course_position,
  you_learn: ["How the web really works","Basic HTML, CSS, and Javascript", "Basic Ruby, Rails, Databases and Git"],
  you_build: ["Google's homepage in HTML/CSS","A dynamic sketchpad with JS/jQuery","A series of test-first Ruby challenges"],
  is_active: true
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
  url: "/web_development_101/how_this_course_will_work.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "How Does the Web Work?",
  title_url: "How Does the Web Work?".parameterize,
  description: "It's tough to program web sites without understanding how the web actually works!",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/how_does_the_web_work.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "How Does Your Computer Work?",
  title_url: "How Does Your Computer Work?".parameterize,
  description: "The command line: loved, hated, and feared... but no longer by you.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/how_does_your_computer_work.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Terms to Know",
  title_url: "Terms to Know".parameterize,
  description: "A brief look at the terms you'll need to understand going forward",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/terms_to_know.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Installations",
  title_url: "Installations".parameterize,
  description: "There are some things you'll need to install before you start getting your hands dirty",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_installations.md"
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
  url: "/web_development_101/introduction_to_the_front_end.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "HTML and CSS Basics",
  title_url: "HTML and CSS Basics".parameterize,
  description: "You'll learn all about how to build and style webpages with HTML and CSS",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/html_css_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "HTML/CSS",
  title_url: "HTML/CSS".parameterize,
  description: "It's time to put your knowledge to work in the Wild.  Go forth and build!",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_html_css.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Javascript Basics",
  title_url: "Javascript Basics".parameterize,
  description: "You'll get a chance to start picking up the programming fundamentals you need to make your webpages dynamic",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "jQuery Basics",
  title_url: "jQuery Basics".parameterize,
  description: "You'll learn how to take your Javascript knowledge and seamlessly integrate it with webpages using the magic of jQuery",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/jquery_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Javascript and jQuery",
  title_url: "Javascript and jQuery".parameterize,
  description: "Think 'Etch-a-Sketch' with a bit of Funk.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_js_jquery.md"
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
  url: "/web_development_101/introduction_to_the_back_end.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby Basics",
  title_url: "Ruby Basics".parameterize,
  description: "A healthy dive into Ruby, where you'll spend a fair bit of time mastering the basics of this programmer-friendly language.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/ruby_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Testing Basics",
  title_url: "Testing Basics".parameterize,
  description: "A brief introduction to testing in general and RSpec, Ruby's testing language.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/testing_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby",
  title_url: "Ruby".parameterize,
  description: "Time to apply what you've learned about Ruby by making the tests pass on a number of exercises that range from goofy to challenging",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_ruby.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Databases",
  title_url: "Databases".parameterize,
  description: "The last foundational component is how to 'save' your data by using a database.  You'll learn the basics of SQL, the language used to talk to most relational databases.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/database_basics.md"
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
  url: "/web_development_101/introduction_to_frameworks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby on Rails Basics",
  title_url: "Ruby on Rails Basics".parameterize,
  description: "You'll learn the basics of the wildly popular framework that has made thousands of programmers highly productive and happy.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/rails_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby on Rails",
  title_url: "Ruby on Rails".parameterize,
  description: "You've learned the basics, now let's put them to work by building a basic application.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/project_rails.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Backbone.js",
  title_url: "Backbone.js".parameterize,
  description: "A brief introduction to get you introduced to Backbone.js, a popular front-end web development framework we'll be covering in a separate course later.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/backbone_basics.md"
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Additional Important Topics",
  title_url: "Additional Important Topics".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This section has a bunch of short lessons that will introduce you to a variety of essential supporting technologies for your journey into web development."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Git Basics",
  title_url: "Git Basics".parameterize,
  description: "Git is the version control system used by developers... like 'saving' meets 'time machine'",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/git_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "The Cloud, Hosting, and Software as a Service (SAAS)",
  title_url: "The Cloud, Hosting, and Software as a Service (SAAS)".parameterize,
  description: "It's time to bust through some of the buzzwords you've heard and see how they actually apply to you.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_cloud_hosting_and_saas.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Security, SSL, and Best Practices",
  title_url: "Security, SSL, and Best Practices".parameterize,
  description: "A brief introduction to security concepts and best practices.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/security_ssl_and_best_practices.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "FTP Basics",
  title_url: "FTP Basics".parameterize,
  description: "A very brief look at the File Transfer Protocol which is often used to upload files to your webserver.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/ftp_basics.md"
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
  title: "How are Websites Built in the Real World?",
  title_url: "How are Websites Built in the Real World?".parameterize,
  description: "A look at the macro level workflow from the client to the developer and then a closer look at what exactly the developer does.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/how_are_websites_built.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Principles of Good Programming",
  title_url: "Principles of Good Programming".parameterize,
  description: "A look at some of the guiding principles of being a good programmer.  Basically: Be lazy",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/principles_of_good_programming.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "How far you've come already!  But this ride's only just begun...",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/conclusion.md"
)

# ************************************************
# CREATE RUBY COURSE
# ************************************************
puts "\n\n***** STARTING COURSE: Ruby Programming *****"

course_position += 1
course = create_or_update_course(
  title: "Ruby Programming",
  title_url: "Ruby Programming".parameterize,
  teaser: "Become a True Rubyist",
  brief_desc: "Once you've completed Web Development 101, this course will take you deep into the wonderful world of Ruby.  You'll learn a combination of programming fundamentals and best practices and you will get the chance to build a variety of different projects along the way.",
  description: "In this course you will learn Ruby, the language designed specifically with programmer happiness in mind. By the end of it all, you'll have built some pretty sweet projects including Tic Tac Toe, Hangman, a real web server, and even Chess. You'll be able to put together a Twitter spambot (that really spams!), save and open files, test out your code, separate your spaghetti code into nice modular classes, and even reproduce some basic algorithms and data structures for solving complex problems. Basically, you're going to start feeling a whole lot more like a real programmer and that feeling will be justified.",
  position: course_position,
  you_learn: ["How to write clean, effective, modular code","Working with files and scripts", "Basic algorithms and data structures"],
  you_build: ["TicTacToe, Mastermind, and Hangman", "A command line server and browser","Chess (seriously)"],
  is_active: true,
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
  url: "/ruby/how_this_course_will_work.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby Building Blocks",
  title_url: "Ruby Building Blocks".parameterize,
  description: "A more in-depth look at the Ruby fundamentals like Variables, Data Types, Strings, and Methods.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby/building_blocks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Blocks",
  title_url: "Building Blocks".parameterize,
  description: "It's time to start getting used to building scripts without the training wheels on.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby/project_building_blocks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Ruby Building Blocks",
  title_url: "Advanced Ruby Building Blocks".parameterize,
  description: "We'll continue our journey into the fundamentals, this time with Control Flow, Looping, Arrays, Hashes, Blocks and Sorting.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby/advanced_building_blocks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Building Blocks",
  title_url: "Advanced Building Blocks".parameterize,
  description: "Now you'll get the chance to really apply what you've learned so far by building a simple cipher and rebuilding the Enumerable methods that you'll use all the time going forward.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby/project_advanced_building_blocks.md"
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
  url: "/ruby/oop.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "OOP",
  title_url: "OOP".parameterize,
  description: "It's time to flex those new muscles a bit by building Tic Tac Toe and Mastermind on the command line",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby/project_oop.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Files and Serialization",
  title_url: "Files and Serialization".parameterize,
  description: "What if you want to save the state of your program?  How about loading in a file?  Some basic operations like these will be covered here.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby/serialization.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "File I/O and Serialization",
  title_url: "File I/O and Serialization".parameterize,
  description: "You'll get a chance to scrub an existing dataset and then work with dictionaries by building Hangman.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby/project_file_io.md"
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Ruby on the Web",
  title_url: "Ruby on the Web".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This brief section will bridge the gap between what you've been doing on the command line and the wide world of the Internet... how do you send automated Tweets?  How about building a basic web server and browser of your own!"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Bringing Ruby Online",
  title_url: "Bringing Ruby Online".parameterize,
  description: "The intersection of Ruby with HTTP... superpowers sold separately.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby/bringing_ruby_online.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ruby on the Web",
  title_url: "Ruby on the Web".parameterize,
  description: "Ever wanted to SPAM your Twitter followers?  How about building your own basic web server?  There's no time like the present...",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby/project_web.md"
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
  url: "/ruby/a_very_brief_intro_to_cs.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Recursive Methods",
  title_url: "Recursive Methods".parameterize,
  description: "Learn how making a function call itself can be helpful for making big problems into smaller problems",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby/recursion.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Recursion",
  title_url: "Recursion".parameterize,
  description: "Take your newfound knowledge and apply it to a couple of classic recursive problems",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby/project_recursion.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Common Data Structures and Algorithms",
  title_url: "Common Data Structures and Algorithms".parameterize,
  description: "Learn why we use different data structures to handle our data and some classic algorithms for searching through them to help solve problems",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby/data_structures_algorithms.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Data Structures and Algorithms",
  title_url: "Data Structures and Algorithms".parameterize,
  description: "If you're scratching your head a bit on how to apply algorithmic thinking, here's are a couple of exercises that let you use the tools you've just developed.  This should also be helpful when thinking about Final Projects... hint hint...",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby/project_data_structures_algorithms.md"
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
  url: "/ruby/introduction_to_rspec.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Testing Ruby",
  title_url: "Testing Ruby".parameterize,
  description: "The real way to learn is by doing, so you'll jump in the time machine and write some tests for prior projects.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/ruby/project_testing.md"
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
  url: "/ruby/a_deeper_look_at_git.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using Git in the Real World",
  title_url: "Using Git in the Real World".parameterize,
  description: "We've just scratched the surface, so here's what to be aware of as you start developing more and more using Git.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby/using_git_in_the_real_world.md"
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
  url: "/ruby/project_final.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Woah! You made it! Let's take a minute to look back and put things in context for the next step ahead.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/ruby/conclusion.md"
)

# ************************************************
# CREATE RAILS COURSE
# ************************************************
puts "\n\n***** STARTING COURSE: Ruby on Rails *****"

course_position += 1
course = create_or_update_course(
  title: "Ruby on Rails",
  title_url: "Ruby on Rails".parameterize,
  teaser: "Build Real Websites",
  brief_desc: "Now that you've got a good grounding in Ruby, it's time to put that to work by learning how to rapidly develop websites using Ruby on Rails.  By the end of this course, you'll be able to build and deploy a real website with confidence.  In fact, you'll do it many times.",
  description: "In this course, you'll be doing a whole lot of building, each project a bit more advanced than the previous one.  You'll build about a dozen Rails projects from scratch, including one full-featured tutorial that we'll be following along with as we go and a full scale web application of your own.  More importantly, you'll learn how to deconstruct a website into its underlying data architecture and then build an application around that. By the end of it all, you'll have the confidence to put up a simple website in under an hour.",
  position: course_position,
  you_learn: ["How to build and deploy a web application from scratch","MVC like the back of your hand","Setting up the data architecture of a new site"],
  you_build: ["A full featured Twitter clone", "A flight booking application", "A dozen others, from simple CRUD apps to APIs and Facebook"],
  is_active: true,
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
  title: "How this Course Will Work",
  title_url: "How this Course Will Work".parameterize,
  description: "Let's get acquainted with what this will look like from here on out.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/introduction.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Getting Your Feet Wet",
  title_url: "Getting Your Feet Wet".parameterize,
  description: "This will give you the chance to build a full Rails app using some of the special tools Rails provides.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_feet_wet.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "A Railsy Web Refresher",
  title_url: "A Railsy Web Refresher".parameterize,
  description: "We're not just using the Web, we're living it.  This lesson will get you up to speed on how.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/web_refresher.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Deployment",
  title_url: "Deployment".parameterize,
  description: "There's nothing quite like seeing your application on a real website.  We'll show you how it's done.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/deployment.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Let's Get Building",
  title_url: "Let's Get Building".parameterize,
  description: "In this project, you'll get started with the core tutorial we'll be following throughout this course.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_lets_build.md"
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
  url: "/rails/routing.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Controllers",
  title_url: "Controllers".parameterize,
  description: "Controllers are the middle managers of the whole process -- they tell everyone else what to do and take all the credit.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/controller_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Views",
  title_url: "Views".parameterize,
  description: "When the controller has figured out which data needs to be displayed, it's the View's job to turn that into some half-decent HTML.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/views.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "The Asset Pipeline",
  title_url: "The Asset Pipeline".parameterize,
  description: "This lesson explains how Rails handles all the behind-the-scenes stuff to get your CSS, Javascript and Image files served quickly and efficiently and how you can use that process.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/asset_pipeline.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Basic Routes, Views and Controllers",
  title_url: "Basic Routes, Views and Controllers".parameterize,
  description: "You'll get to play with routing and build what you've learned in this section so far.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_basic_rvc.md"
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
  url: "/rails/databases.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "SQL",
  title_url: "SQL".parameterize,
  description: "The best way to learn is by practice, so this project will give you plenty of opportunity to apply your new SQL powers (for good).",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_databases.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Active Record Basics",
  title_url: "Active Record Basics".parameterize,
  description: "Active Record is the crown jewel of Rails because it turns all the bare metal database queries (like SQL) into nice clean Ruby methods.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/active_record_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building With Active Record",
  title_url: "Building With Active Record".parameterize,
  description: "You'll start getting practice thinking data first before building something that acts a lot like Reddit.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_ar_basics.md"
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
  url: "/rails/form_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Forms",
  title_url: "Forms".parameterize,
  description: "To understand the form, you must start from the beginning.  We'll start with HTML and then learn how Rails can really help you out.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_forms.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Sessions, Cookies, and Authentication",
  title_url: "Sessions, Cookies, and Authentication".parameterize,
  description: "Learn how to store data in the user's browser and how that is used to sign in the user and keep them signed in across requests.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/sessions_cookies_authentication.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Authentication",
  title_url: "Authentication".parameterize,
  description: "You'll build a closed community for sharing embarrassing gossip with the world.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_auth.md"
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
  url: "/rails/active_record_queries.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Active Record Associations",
  title_url: "Active Record Associations".parameterize,
  description: "Dive into some of the more interesting features of associations like special methods and polymorphism.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/active_record_associations.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Associations",
  title_url: "Associations".parameterize,
  description: "Build a system to manage signups for you and your friends' special events.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_associations.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Active Record Callbacks",
  title_url: "Active Record Callbacks".parameterize,
  description: "A brief look at the life-cycle of an Active Record object, from birth to destruction, and how you can hook into that for profit.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/active_record_callbacks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Associations",
  title_url: "Advanced Associations".parameterize,
  description: "Exercise those association muscles to finish up the tutorial like a pro.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_associations_2.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Forms",
  title_url: "Advanced Forms".parameterize,
  description: "Take what you know about forms and put rocket boosters on it.  Don't be afraid to make a form for anything.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/forms_advanced.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Advanced Forms",
  title_url: "Building Advanced Forms".parameterize,
  description: "Build an airline flight signup system, which is a nest of interesting complexities",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_forms_advanced.md"
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
  url: "/rails/api_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Working With External APIs",
  title_url: "Working With External APIs".parameterize,
  description: "Lots of the power of APIs comes from interfacing with third-party applications, which we'll cover in this lesson.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/api_interfacing.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "APIs",
  title_url: "APIs".parameterize,
  description: "In this project, you'll both build your own API and work with a third-party API.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_apis.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Mailers",
  title_url: "Mailers".parameterize,
  description: "You don't often think about where your email comes from.  Here you'll learn how to send it from your app.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/mailers.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Sending Confirmation Emails",
  title_url: "Sending Confirmation Emails".parameterize,
  description: "Add email functionality to an existing project.  Just don't SPAM, it's frowned upon.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_mailers.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Advanced Topics",
  title_url: "Advanced Topics".parameterize,
  description: "A mash-up of orphan topics like advanced routing, layouts, metaprogramming and design patterns.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/advanced_topics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Final Project",
  title_url: "Final Project".parameterize,
  description: "There's a pretty popular social networking app you should build.  They may have made a movie about it.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/rails/project_final.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Holy cow, you've gotten to the end of the road!  ...Sort of.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/rails/conclusion.md"
)

# ************************************************
# CREATE HTML5/CSS3 COURSE
# ************************************************
puts "\n\n***** STARTING COURSE: HTML/CSS *****"

course_position += 1
course = create_or_update_course(
  title: "HTML5 and CSS3",
  title_url: "HTML5 and CSS3".parameterize,
  teaser: "Make Your Sites Actually Look Good",
  brief_desc: "Now that you're a pro in building website back ends, it's time to take a good hard look at the front end so your sites will stop looking like ugly ducklings and you can really begin to understand the DOM.  This shorter course will give you the tools to stop fighting with your CSS and start building more logically designed sites.",
  description: "In this unit, you'll get over your fear of CSS and begin to understand some of the more fundamental tenets of good site design.  This isn't a full course on front end design, but it should give you the tools you need to deeply understand CSS frameworks and to put a good looking facade on your genius back end.",
  position: course_position,
  you_learn: ["All about styling with CSS", "How to effectively use a front end framework like Bootstrap", "Basic principles of site layout and design"],
  you_build: ["Several popular website visual front ends", "Your own front end framework", "A goodybag of CSS tricks and tactics"],
  is_active: true,
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
  url: "/html_css/introduction.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "HTML5 Basics",
  title_url: "HTML5 Basics".parameterize,
  description: "A brief refresher on the very basics of HTML.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/html5_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Linking Internal and External Pages",
  title_url: "Linking Internal and External Pages".parameterize,
  description: "When do you link to the relative URL versus the absolute?  How do you set up internal links?",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/links.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Working with Images, Video and Other Media",
  title_url: "Working with Images, Video and Other Media".parameterize,
  description: "Rich media experiences make your pages come alive but there are some things you'll need to know to avoid slow load times.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/images.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Embedding Images and Video",
  title_url: "Embedding Images and Video".parameterize,
  description: "To get some practice with everything you've picked up so far, you'll rebuild YouTube's video page.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_media.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "What's New in HTML5",
  title_url: "What's New in HTML5".parameterize,
  description: "The transition to HTML5 has opened up several new elements and best practices which will make your life easier.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/new_html5.md"
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
  url: "/html_css/tables.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Ordered and Unordered Lists",
  title_url: "Ordered and Unordered Lists".parameterize,
  description: "Lists are used everywhere and even in some unexpected places like navigation bars.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/lists.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Forms for Collecting Data",
  title_url: "Forms for Collecting Data".parameterize,
  description: "Forms allow the user to submit data to your application and represent one of the trickiest parts of setting up your HTML structure.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/html_forms.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "HTML Forms",
  title_url: "HTML Forms".parameterize,
  description: "Get some practice working with different form elements by building Mint.com's signup.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_html_forms.md"
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
  url: "/html_css/css_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "The Box Model",
  title_url: "The Box Model".parameterize,
  description: "Even experienced developers often have trouble with the details of the box model, which governs how elements are displayed on the page.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/box_model.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Floats and Positioning",
  title_url: "Floats and Positioning".parameterize,
  description: "Positioning elements on the page can give you fits, so learning how elements play together is well worth your time.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/floats_positioning.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Positioning and Floating Elements",
  title_url: "Positioning and Floating Elements".parameterize,
  description: "Long content pieces of yesteryear are being replaced with rich multimedia experiences and the Times has led the charge.  See if you can apply what you learned about positioning by cloning one of their articles.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_positioning.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Best Practices",
  title_url: "Best Practices".parameterize,
  description: "It's one thing to have the toolbox and a whole other to understand the best way to use it.  We'll explore some of these best practices in this section.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/best_practices.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Backgrounds and Gradients",
  title_url: "Backgrounds and Gradients".parameterize,
  description: "Here you'll learn about placing and positioning background images and working with gradients.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/backgrounds.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building with Backgrounds and Gradients",
  title_url: "Building with Backgrounds and Gradients".parameterize,
  description: "Apple is a design leader and their homepage can teach you a lot about working with images and gradients.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_backgrounds.md"
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
  url: "/html_css/design_ux.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Fonts and Typography",
  title_url: "Fonts and Typography".parameterize,
  description: "Understanding fonts and typography is far from a design geek's domain -- they greatly affect the ease of use for your pages.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/typography.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "CSS Grids",
  title_url: "CSS Grids".parameterize,
  description: "Content isn't just thrown onto the page without a care -- grid systems apply logic and order to the way information is displayed.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/css_grids.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Design Teardown",
  title_url: "Design Teardown".parameterize,
  description: "The first step to understanding design is to train yourself to *see* design, so you'll get a chance to break down one of the hallmark Design publications, Smashing Magazine.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_design.md"
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
  url: "/html_css/responsive_design.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building with Responsive Design",
  title_url: "Building with Responsive Design".parameterize,
  description: "It's time to put your newfound responsive superpowers to use by building The Next Web's responsive homepage.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_responsive.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "CSS Frameworks like Bootstrap and Foundation",
  title_url: "CSS Frameworks like Bootstrap and Foundation".parameterize,
  description: "Now that you've mastered the fundamentals of HTML and CSS, it's time to make your workflow a whole lot easier with CSS frameworks.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/css_frameworks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using Bootstrap",
  title_url: "Using Bootstrap".parameterize,
  description: "Test out working with the Bootstrap framework.  It may feel a bit odd at first but it makes your life MUCH easier once you figure out the gist of it. ",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_bootstrap.md"
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
  url: "/html_css/stylings.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using CSS Preprocessors to Save Time",
  title_url: "Using CSS Preprocessors to Save Time".parameterize,
  description: "Learn about preprocessors like SASS which can make your CSS act more like real code... which is a good thing because it'll save you time and gray hairs.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/preprocessors.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Design Your Own Grid-Based Framework",
  title_url: "Design Your Own Grid-Based Framework".parameterize,
  description: "This final project will require you to apply almost everything you've learned up until now since you'll be building your own version of a grid-based CSS framework.  Luckily you can use it on your projects from here on out!",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_css_frameworks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "You've found the light at the end of the tunnel.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/html_css/conclusion.md"
)

# ************************************************
# CREATE JAVASCRIPT/JQUERY COURSE
# ************************************************
puts "\n\n***** STARTING COURSE: Javascript *****"

course_position += 1
course = create_or_update_course(
  title: "Javascript and jQuery",
  title_url: "Javascript and jQuery".parameterize,
  teaser: "Make Your Websites Really Dance",
  brief_desc: "The last component in your web development arsenal is the ability to make your front ends dynamically react to the user.  In this course you'll learn how to use Javascript and jQuery to interact with the DOM and make things like dropdown menus, parallax scroll effects, single page applications, and even games.  It will tie together everything you've learned already into one awesome package.",
  description: "Javascript is taking over the world right now -- web applications are becoming more and more front-weighted.  While it used to be mostly a tool for animating drop down menus and validating form inputs, Javascript (with help from jQuery's magic) has grown into a way to produce full featured front end applications including single-page web apps.",
  position: course_position,
  you_learn: ["How to build interactive games using HTML5 canvas","How to use a full range of jQuery effects on the DOM", "How to organize your JS into modular pieces"],
  you_build: ["Javascript front ends for your Rails back ends", "A Javascript framework of your own","Snake, Missile Command and More"],
  is_active: true,
)
 
# :description: "Javascript is taking over the world right now -- web applications are becoming more and more front-weighted.  While it used to be mostly a tool for animating drop down menus and validating form inputs, Javascript (with help from jQuery's magic) has grown into a way to produce full featured front end applications including single-page web apps.  In this section, you'll connect the Rails back ends you're an expert at building to dynamic front ends, completing the cycle to becoming a full stack web developer.  You'll learn some really nifty tricks and build some fun games along the way, too.",

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "The Basics and the Browser",
  title_url: "The Basics and the Browser".parameterize,
  course_id: course.id,
  position: section_position,
  description: "We'll zoom through the basics of Javascript and how it's used in the browser with jQuery.  This where things get really fun, since you get to immediately see everything you're building in the browser.  By the end of this section, you'll actually know everything you need to build fun and interesting front-ends but, of course, it's really just the beginning."
)

lesson_counter += 1
create_or_update_lesson(
  title: "How This Course Will Work",
  title_url: "How This Course Will Work".parameterize,
  description: "Let's get you started on the right foot.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/introduction.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Javascript Basics",
  title_url: "Javascript Basics".parameterize,
  description: "A deep dive back into the basics to make sure you've got the proper foundation for what's coming next.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "On Screen Calculator",
  title_url: "On Screen Calculator".parameterize,
  description: "Get warmed up with some JS calisthenics and by building an on-screen calculator.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_js_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "jQuery Basics",
  title_url: "jQuery Basics".parameterize,
  description: "Another deep dive into the basics, this time focusing on using jQuery to manipulate elements on the page.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/jq_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Manipulating the DOM with jQuery",
  title_url: "Manipulating the DOM with jQuery".parameterize,
  description: "Create a single-page restaurant app completely using Javascript and jQuery.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_jq_basics.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Organizing Your Code and More",
  title_url: "Organizing Your Code and More".parameterize,
  description: "Here we'll cover everything from using best practices for organizing your code to helpful libraries and security.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/organizing_code.md"
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Events, Effects and Widgets",
  title_url: "Events, Effects and Widgets".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Events drive just about everything you'll do with Javascript in the browser. We'll take a closer look at how they work and the kinds of things that they allow you to do."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Working with Events and Effects",
  title_url: "Working with Events and Effects".parameterize,
  description: "Learn how to use events to drive your user experience.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/events_effects.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "jQuery and the DOM",
  title_url: "jQuery and the DOM".parameterize,
  description: "Build a Snake game, just like you probably played in 2-color on your first cell phone.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_events_effects.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using jQuery UI to Build Widgets",
  title_url: "Using jQuery UI to Build Widgets".parameterize,
  description: "See the fun side of jQuery by checking out some of the nifty widgets you can build with it.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/widgets.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Creating an Image Carousel/Slider",
  title_url: "Creating an Image Carousel/Slider".parameterize,
  description: "Get some practice building widgets of your own by creating an image carousel just like what you find on many websites in the wild.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_widgets.md"
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Deeper into Javascript",
  title_url: "Deeper into Javascript".parameterize,
  course_id: course.id,
  position: section_position,
  description: "You can do a lot with just basic Javascript, jQuery and a hacker mindset.  But this section will take you deeper into how Javascript is actually doing things and it will give you the tools to produce more advanced functionality for your sites.  Some of the previous projects have probably tested the boundaries of your understanding of Javascript, and here we'll fix that."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Objects, 'Classes', and Prototypes",
  title_url: "Objects, 'Classes', and Prototypes".parameterize,
  description: "Learn how to effectively use Javascript objects and DRY up your code with Prototypes.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/objects_prototypes.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Scope and Closures",
  title_url: "Scope and Closures".parameterize,
  description: "Scope gets a bit tricky in Javascript because functions are being passed around and called in many different contexts.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/scope_closures.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Tic Tac Toe",
  title_url: "Tic Tac Toe".parameterize,
  description: "Let's bring the classic Tic Tac Toe game to the browser.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_scopes_closures.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Comparing Javascript and Ruby: Going Functional",
  title_url: "Comparing Javascript and Ruby: Going Functional".parameterize,
  description: "A brief primer for translating your Ruby knowledge into Javascript ",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/comparing_to_ruby.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Really Understanding Functions in Javascript",
  title_url: "Really Understanding Functions in Javascript".parameterize,
  description: "Functions are first class citizens in Javascript, and here you'll see why.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/deep_dive_functions.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Minesweeper",
  title_url: "Minesweeper".parameterize,
  description: "It's time to get a bit more complex by bringing back minesweeper, the only decent game that used to come with Windows back in the day.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_functions.md"
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Advanced Browser Work",
  title_url: "Advanced Browser Work".parameterize,
  course_id: course.id,
  position: section_position,
  description: "There's a whole lot more to using Javascript in the browser than just manipulating simple DOM elements with jQuery.  If you want to grab data from external sites or your own back end, submit forms, or handle more complicated games, you'll need to dig deeper into how Javascript handles things like callbacks.  Here we'll also cover how to build games using HTML5's `<canvas>` element, which lets you use Javascript logic to draw shapes."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Loading Javascript in the Browser",
  title_url: "Loading Javascript in the Browser".parameterize,
  description: "A very quick look at how and when to load Javascript.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js_to_browser.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Callbacks: Living in an Event-Driven World",
  title_url: "Callbacks: Living in an Event-Driven World".parameterize,
  description: "This will connect what you know about events with a standard pattern for hooking into those events -- the callback.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/event_driven.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Callbacks",
  title_url: "Callbacks".parameterize,
  description: "A chance to apply what you've learned about callbacks by building another in-browser app.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_callbacks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using Canvas to Draw and More",
  title_url: "Using Canvas to Draw and More".parameterize,
  description: "Once you can use canvas, you're only limited by your creativity (and maybe your geometry skills).",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/canvas.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Games with Canvas",
  title_url: "Building Games with Canvas".parameterize,
  description: "You'll see how much fun it can be to build with canvas as we bring back the classics with Missile Command!",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_canvas.md"
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Better Forms with jQuery and AJAX",
  title_url: "Better Forms with jQuery and AJAX".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section you'll learn about AJAX, the technology which allows you to send data from the browser to your web application without needing to refresh the page.  It's commonly used with forms, but really represents a whole world of possibility for crafting performant user experiences."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Validating Form Inputs Using jQuery",
  title_url: "Validating Form Inputs Using jQuery".parameterize,
  description: "You're an expert in forms by now, but here we'll focus on using jQuery to hook into them.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/jquery_forms.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Validating a Form with jQuery",
  title_url: "Validating a Form with jQuery".parameterize,
  description: "A chance to use jQuery's Validate plugin and then roll your own form validation.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_forms.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Submitting a Form Without Reloading by Using AJAX",
  title_url: "Submitting a Form Without Reloading by Using AJAX".parameterize,
  description: "AJAX is the missing link between a seamless client-side experience and your server-side code.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/ajax.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Infinite Scroll and Submitting a Form with AJAX",
  title_url: "Infinite Scroll and Submitting a Form with AJAX".parameterize,
  description: "We'll play with using AJAX calls to an open API called the OMDB, creating a simple submission form and a movies display that never stops giving you movies when you scroll down.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_ajax_forms.md"
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Linking to APIs and Your Rails Back End",
  title_url: "Linking to APIs and Your Rails Back End".parameterize,
  course_id: course.id,
  position: section_position,
  description: "A real web app needs a back end in order to persist its data and do sensitive operations.  Here you'll learn how to handle use AJAX to send data requests to your Rails back end.  You'll also get a chance to work with external APIs like Google Maps, which is something you'll probably find yourself doing quite frequently as you build your own projects in the future."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Working with Javascript APIs",
  title_url: "Working with Javascript APIs".parameterize,
  description: "Working with external APIs from the client side can be a great way to easily add varied and dynamic functionality to your sites.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/javascript_apis.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Putting Google Maps Onto Your Site",
  title_url: "Putting Google Maps Onto Your Site".parameterize,
  description: "Just about every business has a contact page with a map pointing to their location.  Build one with the Google Maps API.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_apis.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using Ruby on Rails For Your Back End",
  title_url: "Using Ruby on Rails For Your Back End".parameterize,
  description: "You've got experience working with APIs, now it's time to treat your Rails app like one.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/rails_backend.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Where's Waldo (A Photo Tagging App)",
  title_url: "Where's Waldo (A Photo Tagging App)".parameterize,
  description: "Pull together everything you've learned so far to create a \"Where's Waldo?\" game.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_rails_backend.md"
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Server Side Javascript and Javascript Frameworks",
  title_url: "Server Side Javascript and Javascript Frameworks".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This is an **OPTIONAL** section where you will learn about using Javascript to run your server (instead of Ruby) and also about Javascript frameworks which let you build a full website as a single page run by Javascript to create blazing fast user experiences."
)

lesson_counter += 1
create_or_update_lesson(
  title: "Using Templates",
  title_url: "Using Templates".parameterize,
  description: "Templating brings the magical re-usability of layouts to the client side.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/templating.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Javascript MV* Frameworks Like Angular.js and Backbone.js",
  title_url: "Javascript MV* Frameworks Like Angular.js and Backbone.js".parameterize,
  description: "The new crop of Javascript frameworks will help organize your tangled mess of AJAX calls, templates, and jQuery updates and will turbo charge your ability to produce excellent front ends.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js_frameworks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Single Page Websites with Angular.js and Backbone.js",
  title_url: "Building Single Page Websites with Angular.js and Backbone.js".parameterize,
  description: "Take a framework of your choice for a test drive with these established tutorials.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_js_frameworks.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Node.js and Server-Side Javascript",
  title_url: "Node.js and Server-Side Javascript".parameterize,
  description: "These days you never have to leave your beloved Javascript behind because now it can run on the server side too with Node.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/server_side_js.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Node.js",
  title_url: "Node.js".parameterize,
  description: "Fire up a Node server and play around with it, because that's how we learn.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_node.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Workflow Tools, Tech Stacks and Dependency Management",
  title_url: "Workflow Tools, Tech Stacks and Dependency Management".parameterize,
  description: "A few tools that are meant to clean up your worfklows.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/workflow_tools.md"
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
  title: "Javascript Testing with Jasmine",
  title_url: "Javascript Testing with Jasmine".parameterize,
  description: "...because if you can't test it, you won't know when you've broken it.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/js_testing.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Final Project",
  title_url: "Final Project".parameterize,
  description: "Tie everything you've learned from every course so far into one project where you'll build your favorite website from scratch.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/javascript/project_final_js.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Well, that was easy, right?",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/javascript/conclusion.md"
)

# ************************************************
# CREATE GETTING HIRED COURSE
# ************************************************
puts "\n\n***** STARTING COURSE: Getting Hired *****"

course_position += 1
course = create_or_update_course(
  title: "Getting Hired as a Web Developer",
  title_url: "Getting Hired as a Web Developer".parameterize,
  teaser: "Get Paid to Keep Learning",
  brief_desc: "You've come extremely far and are now a capable web developer, but, as you've probably realized, the journey of discovery has only just begun.  Luckily, you're now useful enough that others will pay you to keep building and learning. . . and in this short course, we'll show you how to make that happen.",
  description: "You've still got a whole lot more to learn (it's really a lifetime journey) but now the best way to do that is by surrounding yourself with other great developers.  This course is all about that next step -- what else you'll need to know, where to find jobs, how to interview, and how to ultimately get that offer in hand.",
  position: course_position,
  you_learn: ["Where to find the appropriate job postings","How to market yourself effectively to employers", "How to ace the technical interview"],
  you_build: ["Your personal portfolio website","A base of knowledge in more complex problem solving skills", "A clear strategy for getting hired"],
  is_active: true,
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
  url: "/jobs_jobs_jobs/introduction.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Strategy",
  title_url: "Strategy".parameterize,
  description: "You will need to develop a coherent strategy for how you'll approach the process or risk wasting time.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/strategy.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "It Starts with YOU",
  title_url: "It Starts with YOU".parameterize,
  description: "You won't get hired anywhere you want to be unless you have an honest conversation with yourself.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/starts_with_you.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "What Companies Want",
  title_url: "What Companies Want".parameterize,
  description: "An important step to selling yourself is realizing what the companies doing the hiring really want.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/what_companies_want.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "What You Can Do To Prepare",
  title_url: "What You Can Do To Prepare".parameterize,
  description: "There are many things you can do ahead of time to prepare for your job hunt that will greatly help your odds of getting hired.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/preparation.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Your Personal Website",
  title_url: "Building Your Personal Website".parameterize,
  description: "Nothing shows off your work quite as effectively as a website you've built yourself. Just be careful not to go overboard with it.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/jobs_jobs_jobs/project_portfolio.md"
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
  url: "/jobs_jobs_jobs/collect_leads.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Qualifying Job Leads",
  title_url: "Qualifying Job Leads".parameterize,
  description: "You will need to have a rigorous process for evaluating leads or you will end up wasting your time.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/qualify_leads.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Building Your Resume",
  title_url: "Building Your Resume".parameterize,
  description: "Even in this day and age, the resume is still the primary way people get information about you.",
  position: lesson_counter,
  section_id: section.id,
  is_project: true,
  url: "/jobs_jobs_jobs/project_resume.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Applying for Web Development Jobs",
  title_url: "Applying for Web Development Jobs".parameterize,
  description: "Some tips for increasing your odds during the application process itself.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/applying.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Preparing to Interview and Interviewing",
  title_url: "Preparing to Interview and Interviewing".parameterize,
  description: "Interviewing is annoying and difficult but you'll have to do it.  We'll help point you to the best resources for preparing yourself.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/preparing_to_interview.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Handling a Job Offer",
  title_url: "Handling a Job Offer".parameterize,
  description: "Woohoo! Now what??",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/handling_an_offer.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Alternate Paths to a Web Development Job",
  title_url: "Alternate Paths to a Web Development Job".parameterize,
  description: "A look at several alternative ways you can find a web development job.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/alternatives.md"
)

lesson_counter += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Wrapping up The Odin Project and what you can do to have a strong career.",
  position: lesson_counter,
  section_id: section.id,
  is_project: false,
  url: "/jobs_jobs_jobs/conclusion.md"
)

# SANITY CHECKS

puts "\n\n\n\n\n##################   SANITY CHECKS   ##################\n\n"
puts "#{course_position} courses, #{section_position} sections and #{lesson_counter} lessons dealt with here."
puts"#{Course.count} courses, #{Section.count} sections and #{Lesson.count} lessons in the database.\n"
extra_courses = Course.where("position >= ?", incrementer)
extra_sections = Section.where("position >= ?", incrementer)
extra_lessons = Lesson.where("position >= ?", incrementer)

if extra_courses.count > 0 || extra_lessons.count > 0 || extra_sections.count > 0
  "\n\nWARNING: You have leftover courses, sections or lessons in the database.  Probably a title duplicate.  Recommend deleting all instances with position >= #{incrementer}.\n\n"
else
  puts "There appears to be no leftover stuff in the database.  Go about your day in peace."
end

if extra_courses.count > 0
  puts "\n WARNING: #{extra_courses.count} leftover courses!"
  extra_courses.each do |c|
    puts ">>> Extra course: #{c.inspect}"
  end
end

if extra_sections.count > 0
  puts "\n WARNING: #{extra_sections.count} leftover sections!"
  extra_sections.each do |s|
    puts ">>> Extra section: #{s.inspect}"
  end
end

if extra_lessons.count > 0
  puts "\n WARNING: #{extra_lessons.count} leftover lessons!"
  extra_lessons.each do |c|
    puts ">>> Extra lesson: #{c.inspect}"
  end
end

puts "\n#######################################################\n\n\n\n"
