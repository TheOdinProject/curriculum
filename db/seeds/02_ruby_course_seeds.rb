# ************************************************
# CREATE RUBY COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: Ruby Programming *****"

# Set Course and section position here. Update file name appropriately.
course_position = 2
section_position = 0
lesson_position = 0

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

lesson_position += 1
create_or_update_lesson(
  title: "How this Course Will Work",
  title_url: "How this Course Will Work".parameterize,
  description: "It's time to get acquainted with what this will look like from here on out.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/lesson_how_this_course_will_work.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Ruby Building Blocks",
  title_url: "Ruby Building Blocks".parameterize,
  description: "A more in-depth look at the Ruby fundamentals like Variables, Data Types, Strings, and Methods.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/lesson_building_blocks.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Building Blocks",
  title_url: "Building Blocks".parameterize,
  description: "It's time to start getting used to building scripts without the training wheels on.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/basic_ruby/project_building_blocks.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Advanced Ruby Building Blocks",
  title_url: "Advanced Ruby Building Blocks".parameterize,
  description: "We'll continue our journey into the fundamentals, this time with Control Flow, Looping, Arrays, Hashes, Blocks and Sorting.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/lesson_advanced_building_blocks.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Advanced Building Blocks",
  title_url: "Advanced Building Blocks".parameterize,
  description: "Now you'll get the chance to really apply what you've learned so far by building a simple cipher and rebuilding the Enumerable methods that you'll use all the time going forward.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/basic_ruby/project_advanced_building_blocks.md",
  repo: 'curriculum'
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

lesson_position += 1
create_or_update_lesson(
  title: "Object Oriented Programming",
  title_url: "Object Oriented Programming".parameterize,
  description: "Fundamental concepts about object oriented programming that will help you with any programming language you learn from here on out.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/intermediate_ruby/lesson_oop.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "OOP",
  title_url: "OOP".parameterize,
  description: "It's time to flex those new muscles a bit by building Tic Tac Toe and Mastermind on the command line",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/intermediate_ruby/project_oop.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Files and Serialization",
  title_url: "Files and Serialization".parameterize,
  description: "What if you want to save the state of your program?  How about loading in a file?  Some basic operations like these will be covered here.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/intermediate_ruby/lesson_serialization.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Event Manager",
  title_url: "Event Manager".parameterize,
  description: "Learn File I/O while becoming civically active",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/intermediate_ruby/project_event_manager.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "File I/O and Serialization",
  title_url: "File I/O and Serialization".parameterize,
  description: "You'll get a chance to scrub an existing dataset and then work with dictionaries by building Hangman.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/intermediate_ruby/project_file_io.md",
  repo: 'curriculum'
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

lesson_position += 1
create_or_update_lesson(
  title: "A Very Brief Intro to CS",
  title_url: "A Very Brief Intro to CS".parameterize,
  description: "Get a taste of what's coming up ahead and what the bigger world of CS looks like beyond the scope of this course.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/computer_science/lesson_a_very_brief_intro_to_cs.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Recursive Methods",
  title_url: "Recursive Methods".parameterize,
  description: "Learn how making a function call itself can be helpful for making big problems into smaller problems",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/computer_science/lesson_recursion.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Recursion",
  title_url: "Recursion".parameterize,
  description: "Take your newfound knowledge and apply it to a couple of classic recursive problems",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/computer_science/project_recursion.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Common Data Structures and Algorithms",
  title_url: "Common Data Structures and Algorithms".parameterize,
  description: "Learn why we use different data structures to handle our data and some classic algorithms for searching through them to help solve problems",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/computer_science/lesson_common_data_structures_algorithms.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Linked Lists",
  title_url: 'Linked Lists'.parameterize,
  description: "Build one of the most fundamental data structures.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/computer_science/project_linked_lists.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Data Structures and Algorithms",
  title_url: "Data Structures and Algorithms".parameterize,
  description: "If you're scratching your head a bit on how to apply algorithmic thinking, here's a couple of exercises that let you use the tools you've just developed.  This should also be helpful when thinking about Final Projects... hint hint...",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/computer_science/project_data_structures_algorithms.md",
  repo: 'curriculum'
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

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to RSpec",
  title_url: "Introduction to RSpec".parameterize,
  description: "Many tech companies these days rely on test-heavy methods of development so it's time to get familiar with it.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/testing_with_rspec/lesson_intro_to_rspec.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Testing Your Ruby Code",
  title_url: "Testing Your Ruby Code".parameterize,
  description: "The real way to learn is by doing, so you'll jump in the time machine and write some tests for prior projects.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/testing_with_rspec/project_testing_your_ruby_code.md",
  repo: 'curriculum'
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

lesson_position += 1
create_or_update_lesson(
  title: "A Deeper Look at Git",
  title_url: "A Deeper Look at Git".parameterize,
  description: "Beyond just `$ git add` and `$ git commit`...",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/git/lesson_a_deeper_look_at_git.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Using Git in the Real World",
  title_url: "Using Git in the Real World".parameterize,
  description: "We've just scratched the surface, so here's what to be aware of as you start developing more and more using Git.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/git/lesson_using_git_in_the_real_world.md",
  repo: 'curriculum'
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

lesson_position += 1
create_or_update_lesson(
  title: "Ruby Final Project",
  title_url: "Ruby Final Project".parameterize,
  description: "Now would be a good time to refresh your memory on how to play Chess. Building it is actually more fun (and more rewarding)!",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/conclusion/project_ruby_final.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Woah! You made it! Let's take a minute to look back and put things in context for the next step ahead.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/conclusion/lesson_conclusion.md",
  repo: 'curriculum'
)
