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
  title: "Introduction",
  title_url: "Introduction".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll look at the path ahead and install ruby."
)

lesson_position += 1
create_or_update_lesson(
  title: "How this Course Will Work",
  title_url: "How this Course Will Work".parameterize,
  description: "It's time to get acquainted with what this will look like from here on out.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/introduction/how_this_course_will_work.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Installing Ruby",
  title_url: "Installing Ruby".parameterize,
  description: "Let's get started with installing Ruby!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/introduction/installing_ruby.md",
  repo: 'curriculum'
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
  description: "In this section, we'll cover the basic building blocks of Ruby so you have them down cold. Everything else you'll learn in programming builds on these concepts, so you'll be in a great place to take on additional projects and languages in the future."
)

lesson_position += 1
create_or_update_lesson(
  title: "Basic Data Types",
  title_url: "Basic Data Types".parameterize,
  description: "In this lesson we will explore the basic data types at your disposal in Ruby.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/basic_data_types.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Variables",
  title_url: "Variables".parameterize,
  description: "In this lesson we will explore how to use Variables in Ruby.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/variables.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Input and Output",
  title_url: "Input and Output".parameterize,
  description: "In this lesson we will explore how to input and output data in your Ruby programs.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/input_and_output.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Conditional Logic",
  title_url: "Conditional Logic".parameterize,
  description: "In this lesson we will explore how to make decisions in Ruby so your programs can take different paths.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/conditional_logic.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Loops",
  title_url: "Loops".parameterize,
  description: "In this lesson we will explore how to utilize loops in Ruby so you don't have to repeat yourself quite as much.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/loops.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Arrays",
  title_url: "Arrays".parameterize,
  description: "In this lesson we will explore how to use arrays in Ruby and start using lists of data.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/arrays.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Hashes",
  title_url: "Arrays".parameterize,
  description: "In this lesson we will explore how to use hashes in Ruby and start using key, value pairs of data.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/hashes.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Basic Enumerable Methods",
  title_url: "Basic Enumerable Methods".parameterize,
  description: "In this lesson we will explore Rubys secret weapon, its enumerable methods.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/basic_enumerable_methods.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Methods",
  title_url: "Methods".parameterize,
  description: "In this lesson we will explore how to make your code more modular with methods.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/methods.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Debugging",
  title_url: "Debugging".parameterize,
  description: "In this lesson we will explore how to debug your code when things go wrong.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/debugging.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Problem Solving",
  title_url: "Problem Solving".parameterize,
  description: "In this lesson we will explore how to approach solving programming problems.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/basic_ruby/problem_solving.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Basic Ruby Projects",
  title_url: "Basic Ruby Projects".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section we will solidify your basic Ruby knowledge by practicing with a few small projects."
)

lesson_position += 1
create_or_update_lesson(
  title: "Caesar Cipher",
  title_url: "Caesar Cipher".parameterize,
  description: "In this project you will build you're very own message encryption program.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/basic_ruby_projects/caesar_cipher.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Sub Strings",
  title_url: "Sub Strings".parameterize,
  description: "In this project you will build a program which identifies all the sub-strings in a larger string.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/basic_ruby_projects/sub_strings.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Stock Picker",
  title_url: "Stock Picker".parameterize,
  description: "In this project you will build a simple program that will tell its user the best day to buy stocks.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/basic_ruby_projects/stock_picker.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Bubble Sort",
  title_url: "Bubble Sort".parameterize,
  description: "In this project you will build a simple sorting algorithm.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/ruby_programming/basic_ruby_projects/bubble_sort.md",
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
  title: "Test Driven Development",
  title_url: "Test Driven Development".parameterize,
  description: "In this lesson you will learn about what TDD is and why it's important.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/testing_with_rspec/test_driven_development.md",
  repo: 'curriculum'
)


lesson_position += 1
create_or_update_lesson(
  title: "Introduction to RSpec",
  title_url: "Introduction to RSpec".parameterize,
  description: 'In this lesson you will learn the basics of RSpec, the most popular testing framework in the Ruby world.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/ruby_programming/testing_with_rspec/introduction_to_rspec.md",
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
