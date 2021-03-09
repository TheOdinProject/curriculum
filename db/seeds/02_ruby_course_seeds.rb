# ************************************************
# CREATE RUBY COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: Ruby Programming *****"

# Set Course and section position here. Update file name appropriately.
course_position = 2
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: 'Ruby Programming',
  description: "Time to dive deep into Ruby, the language 'designed for programmer happiness.' You'll cover object-oriented design, testing, and data structures – essential knowledge for learning other programming languages, too!",
  position: course_position,
  identifier_uuid: '643bf355-19f1-4326-a4ad-8ec57f9ea254',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Introduction',
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll look at the path ahead and install ruby.",
  identifier_uuid: 'a5854f3d-8171-47d1-b53f-e325de67aca4',
)

lesson_position += 1
create_or_update_lesson(
  title: 'How this Course Will Work',
  description: "It's time to get acquainted with what this will look like from here on out.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/introduction/how_this_course_will_work.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Installing Ruby',
  description: "Let's get started with installing Ruby!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/introduction/installing_ruby.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Basic Ruby',
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll cover the basic building blocks of Ruby so you have them down cold. Everything else you'll learn in programming builds on these concepts, so you'll be in a great place to take on additional projects and languages in the future.",
  identifier_uuid: 'bd6d7a38-54d6-4859-b508-c4a2e1deba6b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Basic Data Types',
  description: 'In this lesson we will explore the basic data types at your disposal in Ruby.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/basic_data_types.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Variables',
  description: 'In this lesson we will explore how to use Variables in Ruby.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/variables.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Input and Output',
  description: 'In this lesson we will explore how to input and output data in your Ruby programs.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/input_and_output.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conditional Logic',
  description: 'In this lesson we will explore how to make decisions in Ruby so your programs can take different paths.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/conditional_logic.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Loops',
  description: "In this lesson we will explore how to utilize loops in Ruby so you don't have to repeat yourself quite as much.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/loops.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Arrays',
  description: 'In this lesson we will explore how to use arrays in Ruby and start using lists of data.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/arrays.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Hashes',
  description: 'In this lesson we will explore how to use hashes in Ruby and start using key, value pairs of data.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/hashes.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Methods',
  description: 'In this lesson we will explore how to make your code more modular with methods.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/methods.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Basic Enumerable Methods',
  description: 'In this lesson we will explore Rubys secret weapon, its enumerable methods.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/basic_enumerable_methods.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Predicate Enumerable Methods',
  description: 'In this lesson we will explore more enumerable methods that return true or false against a collection of data.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/predicate_enumerable_methods.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Debugging',
  description: 'In this lesson we will explore how to debug your code when things go wrong.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/debugging.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Basic Ruby Projects',
  course_id: course.id,
  position: section_position,
  description: 'In this section we will solidify your basic Ruby knowledge by practicing with a few small projects.',
  identifier_uuid: '866d62bc-4c5a-4d3f-946f-5ca2787d5bc8',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Caesar Cipher',
  description: "In this project you will build you're very own message encryption program.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/basic_ruby_projects/caesar_cipher.md',
  accepts_submission: true,
  has_live_preview: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'Sub Strings',
  description: 'In this project you will build a program which identifies all the sub-strings in a larger string.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/basic_ruby_projects/sub_strings.md',
  accepts_submission: true,
  has_live_preview: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'Stock Picker',
  description: 'In this project you will build a simple program that will tell its user the best day to buy stocks.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/basic_ruby_projects/stock_picker.md',
  accepts_submission: true,
  has_live_preview: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'Bubble Sort',
  description: 'In this project you will build a simple sorting algorithm.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/basic_ruby_projects/bubble_sort.md',
  accepts_submission: true,
  has_live_preview: false
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Object Oriented Programming Basics',
  course_id: course.id,
  position: section_position,
  description: "You've got tools in your Ruby tool box and now it's time to combine them into more meaningful programs. In this section, you'll learn how to turn your spaghetti code into properly organized methods and classes.",
  identifier_uuid: '0a7904f9-0824-4f32-b2b8-eedb2f47008d',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Object Oriented Programming',
  description: 'Fundamental concepts about object oriented programming that will help you with any programming language you learn from here on out.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/object_oriented_programming_basics/lesson_oop.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Tic Tac Toe',
  description: "It's time to flex those new muscles a bit by building Tic Tac Toe",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/object_oriented_programming_basics/project_tic_tac_toe.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Mastermind',
  description: 'In this project you will build the classic code breaking game Mastermind',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/object_oriented_programming_basics/project_mastermind.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Files and Serialization',
  course_id: course.id,
  position: section_position,
  description: "In this section you'll take your Ruby skills to the next level by discovering how to serialize code and save it into files.",
  identifier_uuid: '2222cd27-0168-4046-8b69-6921fff1764c',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Files and Serialization',
  description: 'What if you want to save the state of your program?  How about loading in a file?  Some basic operations like these will be covered here.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/files_and_serialization/lesson_serialization.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Event Manager',
  description: 'Learn File I/O while becoming civically active',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/files_and_serialization/project_event_manager.md',
  accepts_submission: true,
  has_live_preview: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'File I/O and Serialization',
  description: "You'll get a chance to scrub an existing dataset and then work with dictionaries by building Hangman.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/files_and_serialization/project_file_io.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'A Bit of Computer Science',
  course_id: course.id,
  position: section_position,
  description: "In this section, you'll learn some fundamental computer science concepts that will help you when solving problems with a bit more complexity than just simple web serving.  You get to try on your engineering hat and solve some pretty nifty problems.",
  identifier_uuid: '1dc1d088-73be-4590-9eaa-73309f614b7c',
)

lesson_position += 1
create_or_update_lesson(
  title: 'A Very Brief Intro to CS',
  description: "Get a taste of what's coming up ahead and what the bigger world of CS looks like beyond the scope of this course.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/computer_science/lesson_a_very_brief_intro_to_cs.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Recursive Methods',
  description: 'Learn how making a function call itself can be helpful for making big problems into smaller problems',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/computer_science/lesson_recursion.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Recursion',
  description: 'Take your newfound knowledge and apply it to a couple of classic recursive problems',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/computer_science/project_recursion.md',
  accepts_submission: true,
  has_live_preview: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'Common Data Structures and Algorithms',
  description: 'Learn why we use different data structures to handle our data and some classic algorithms for searching through them to help solve problems',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/computer_science/lesson_common_data_structures_algorithms.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Linked Lists',
  description: 'Build one of the most fundamental data structures.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/computer_science/project_linked_lists.md',
  accepts_submission: true,
  has_live_preview: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'Binary Search Trees',
  description: "In this project you'll get your hands dirty with one of the most common computer science problems, searching binary trees.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/computer_science/project_binary_search_trees.md',
  accepts_submission: true,
  has_live_preview: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'Knights Travails',
  description: 'Lets build Knights Travails',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/computer_science/project_knights_travails.md',
  accepts_submission: true,
  has_live_preview: false
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Testing Ruby with RSpec',
  course_id: course.id,
  position: section_position,
  description: "You've been briefly introduced to testing in Ruby a couple of times before in the Foundations course, but now you're going to really learn why testing can be hugely helpful and how to apply it to your own projects.",
  identifier_uuid: '1e8d5245-ed37-498e-a06e-be208aced01f',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Test Driven Development',
  description: "In this lesson you will learn about what TDD is and why it's important.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/testing_with_rspec/test_driven_development.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to RSpec',
  description: 'In this lesson you will learn the basics of RSpec, the most popular testing framework in the Ruby world.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/testing_with_rspec/introduction_to_rspec.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Testing Your Ruby Code',
  description: "The real way to learn is by doing, so you'll jump in the time machine and write some tests for prior projects.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/testing_with_rspec/project_testing_your_ruby_code.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Git',
  course_id: course.id,
  position: section_position,
  description: "You should be familiar with the basic Git workflow since you've been using it to save your projects along the way (right?!).  This section will start preparing you for for the more intermediate-level uses of Git that you'll find yourself doing.",
  identifier_uuid: '4e059547-a8fd-426d-b546-24c2222106c6',
)

lesson_position += 1
create_or_update_lesson(
  title: 'A Deeper Look at Git',
  description: 'Beyond just `$ git add` and `$ git commit`...',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/git/lesson_a_deeper_look_at_git.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Using Git in the Real World',
  description: "We've just scratched the surface, so here's what to be aware of as you start developing more and more using Git.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/git/lesson_using_git_in_the_real_world.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Conclusion',
  course_id: course.id,
  position: section_position,
  description: "You've come an exceptional distance already, now there's just the matter of wrapping it all together into one coherant package and creating something real.  This is your Final Exam and a major feather in your cap.  Once you've completed this section, you should have the confidence to tackle pretty much anything.",
  identifier_uuid: '42521d3c-c22e-481f-9885-9ef1156897c6',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Ruby Final Project',
  description: 'Now would be a good time to refresh your memory on how to play Chess. Building it is actually more fun (and more rewarding)!',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/ruby_programming/conclusion/project_ruby_final.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: "Woah! You made it! Let's take a minute to look back and put things in context for the next step ahead.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/conclusion/lesson_conclusion.md',
)
