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
  identifier_uuid: '3645e7c7-2845-4d85-9e8a-b83294f6cb68',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Installing Ruby',
  description: "Let's get started with installing Ruby!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/introduction/installing_ruby.md',
  identifier_uuid: '99b7fe68-6673-4b51-9bea-4c1c0aad59d9',
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
  identifier_uuid: '3cf9a92e-6781-4112-9e8e-d3135819806b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Variables',
  description: 'In this lesson we will explore how to use Variables in Ruby.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/variables.md',
  identifier_uuid: 'ca5132cc-fa76-4d66-bd12-5995739318c3',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Input and Output',
  description: 'In this lesson we will explore how to input and output data in your Ruby programs.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/input_and_output.md',
  identifier_uuid: '06fbb445-8756-4906-ae42-86f261d45f22',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conditional Logic',
  description: 'In this lesson we will explore how to make decisions in Ruby so your programs can take different paths.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/conditional_logic.md',
  identifier_uuid: '1804825f-4b45-4989-93bd-8303bd75d222',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Loops',
  description: "In this lesson we will explore how to utilize loops in Ruby so you don't have to repeat yourself quite as much.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/loops.md',
  identifier_uuid: 'cf049293-79c3-4b92-b2bd-f038d8e4fe65',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Arrays',
  description: 'In this lesson we will explore how to use arrays in Ruby and start using lists of data.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/arrays.md',
  identifier_uuid: '1a994fe7-6806-4e23-a902-8d64dcf6e9c9',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Hashes',
  description: 'In this lesson we will explore how to use hashes in Ruby and start using key, value pairs of data.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/hashes.md',
  identifier_uuid: '9d8d333c-d9c9-4512-8d15-764caaea4f30',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Methods',
  description: 'In this lesson we will explore how to make your code more modular with methods.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/methods.md',
  identifier_uuid: '0fb26819-dee9-463b-85a9-b6d5765244f8',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Basic Enumerable Methods',
  description: 'In this lesson we will explore Rubys secret weapon, its enumerable methods.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/basic_enumerable_methods.md',
  identifier_uuid: '9e7ed0df-8264-4e3f-bc71-c75a26bdf56a',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Predicate Enumerable Methods',
  description: 'In this lesson we will explore more enumerable methods that return true or false against a collection of data.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/predicate_enumerable_methods.md',
  identifier_uuid: 'a066340c-10aa-4260-abe7-995c0e32ea92',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Debugging',
  description: 'In this lesson we will explore how to debug your code when things go wrong.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/basic_ruby/debugging.md',
  identifier_uuid: '468410df-be1d-414c-a939-dfc90962b03d',
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
  has_live_preview: false,
  identifier_uuid: '47e7c8ab-0dc8-4d6b-bc23-d9674b174007',
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
  has_live_preview: false,
  identifier_uuid: '9445341e-1907-4269-b866-446a3a08d3b9',
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
  has_live_preview: false,
  identifier_uuid: '89096a08-7abf-481b-9464-a82a65872e8e',
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
  has_live_preview: false,
  identifier_uuid: '5b332db6-e7f7-4232-9531-a35096d61c81',
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
  identifier_uuid: '15924a5e-c72d-44f9-8546-78b05b903274',
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
  has_live_preview: true,
  identifier_uuid: '49bd96f3-f358-46f2-8e2a-c91d44c2cf85',
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
  has_live_preview: true,
  identifier_uuid: '0333fa64-534c-4b31-9a3e-8c89d84f7618',
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
  identifier_uuid: 'f68ab24d-a309-4a73-8fe1-1c03d889f514',
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
  has_live_preview: false,
  identifier_uuid: 'a47be9ab-7c78-44c2-b098-ec63d82af1cf',
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
  has_live_preview: true,
  identifier_uuid: '8a5dda78-b387-4a4e-b2af-aed0561ed633',
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
  identifier_uuid: '9325ba3d-2f93-4d94-b7ac-8bfa16f04780',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Recursive Methods',
  description: 'Learn how making a function call itself can be helpful for making big problems into smaller problems',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/computer_science/lesson_recursion.md',
  identifier_uuid: 'a8c01c2b-3421-4bdc-88c5-07b5ee1de9f9',
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
  has_live_preview: false,
  identifier_uuid: '062acc7a-b1b0-4c9d-a7e8-e08bae7a9c0d',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Common Data Structures and Algorithms',
  description: 'Learn why we use different data structures to handle our data and some classic algorithms for searching through them to help solve problems',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/computer_science/lesson_common_data_structures_algorithms.md',
  identifier_uuid: '5aeae574-0b2a-4899-b3e6-c6230fd8b6f5',
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
  has_live_preview: false,
  identifier_uuid: '93a87bae-96c3-47af-a106-62ded20f12c3',
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
  has_live_preview: false,
  identifier_uuid: '00c3096f-0ab0-49e2-9eef-54afc9182f80',
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
  has_live_preview: false,
  identifier_uuid: 'fb6c9850-7fc6-4cdb-bf62-804e706788de',
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
  identifier_uuid: '59cf167a-d1b0-4fd9-a964-1174efb4fdf9',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to RSpec',
  description: 'In this lesson you will learn the basics of RSpec, the most popular testing framework in the Ruby world.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/testing_with_rspec/introduction_to_rspec.md',
  identifier_uuid: '34eb5b73-29a8-4d5b-8747-a2ccad75806e',
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
  has_live_preview: true,
  identifier_uuid: '33440cca-8fbf-46fe-9265-67d938fe1d8c',
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
  identifier_uuid: '52b17564-0e1d-4c4f-adfa-acba53bf9126',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Using Git in the Real World',
  description: "We've just scratched the surface, so here's what to be aware of as you start developing more and more using Git.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/git/lesson_using_git_in_the_real_world.md',
  identifier_uuid: 'c8b7ccc1-8a16-4545-9d46-b9091d45c6b4',
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
  has_live_preview: true,
  identifier_uuid: 'acf6c3f1-915a-4878-8224-2c5f12b1e43b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: "Woah! You made it! Let's take a minute to look back and put things in context for the next step ahead.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/ruby_programming/conclusion/lesson_conclusion.md',
  identifier_uuid: '2f75b1ec-3b5f-4b21-9f97-acfe6578bfb1',
)
