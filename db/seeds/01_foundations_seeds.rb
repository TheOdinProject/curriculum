# ************************************************
# CREATE FOUNDATIONS COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: Foundations *****"

# Set Course and section position here. Update file name appropriately.
course_position = 1
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: 'Foundations',
  description: "This is where it all begins! A hands-on introduction to all of the essential tools you'll need to build real, working websites. You'll learn what web developers actually do – the foundations you'll need for later courses.",
  position: course_position,
  identifier_uuid: '783e9b72-a447-4f49-a9b3-b62826d68e04',
)

# ++++++++++++++++++++
# SECTION - Introduction
# ++++++++++++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Introduction',
  course_id: course.id,
  position: section_position,
  description: "This section will cover the baseline knowledge you need before getting into the more 'programming' aspects of web development.",
  identifier_uuid: '472bf0bc-2667-4206-84ea-43498b1d67f9',
)

lesson_position += 1
create_or_update_lesson(
  title: 'How this Course Will Work',
  description: 'Before you dive in, get familiar with the lay of the land up ahead.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/how_this_course_will_work.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to Web Development',
  description: 'Learn a little about web development as a career.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/introduction_to_web_development.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Motivation and Mindset',
  description: 'Some advice about how to approach learning to program.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/motivation_and_mindset.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Join the Odin Community',
  description: "Find out how to join Odin's community of new and veteran learners and how to get help with coding problems.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/join_the_odin_community.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'How Does the Web Work?',
  description: "It's tough to program web sites without understanding how the web actually works!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/how_does_the_web_work.md',
)

# ++++++++++++++++++++
# SECTION - Installations
# ++++++++++++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Installations',
  course_id: course.id,
  position: section_position,
  description: 'In this section you will configure your development environment and install some software necessary for web development.',
  identifier_uuid: 'a6ff8570-b301-4275-8cb4-1847a8f8ae25',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Installation Overview',
  description: "There are some things you'll need to install before you start getting your hands dirty",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/installation_overview.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Prerequisites',
  description: 'Before we can install Ruby and Rails...',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/prerequisites.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Text Editors',
  description: 'The hottest debate in programming, VSCode or Sublime?',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/text_editors.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Command Line Basics',
  description: 'The command line: loved, hated, and feared... but no longer by you.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/command_line_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Setting Up Git',
  description: 'The Source Code Ambulance',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/setting_up_git.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Git Basics',
  course_id: course.id,
  position: section_position,
  description: 'In this section you will learn the basics of Git and how you can upload your future projects to GitHub so you can share your work and collaborate with others on projects easily.',
  identifier_uuid: '7fbf3991-88d4-4564-9982-dce53328f037',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to Git',
  description: "A high level overview of what Git is and why it's so useful",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/git_basics/introduction_to_git.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Git Basics',
  description: "Now that you know what Git is it's time to learn how to use it.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/git_basics/git_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Practicing Git Basics',
  description: 'In this tutorial you will see how Git is used on a small project.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/foundations/git_basics/project_practicing_git_basics.md',
  accepts_submission: false,
  has_live_preview: false
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'The Front End',
  course_id: course.id,
  position: section_position,
  description: "In this section you'll spend a good deal of time getting familiar with the major client-side (browser-based) languages like HTML, CSS, and JavaScript.  You'll get to build a webpage with HTML/CSS and learn some programming fundamentals with JavaScript.",
  identifier_uuid: '552d3718-14c6-4b0a-848d-2dcca271ac61',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to the Front End',
  description: "An overview of what exactly the 'Front End' is",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/the_front_end/introduction_to_the_front_end.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'HTML and CSS Basics',
  description: "You'll learn all about how to build and style webpages with HTML and CSS",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/the_front_end/html_css_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Developer Tools',
  description: "Learn all about your browser's developer tools.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/the_front_end/developer_tools.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Google Homepage',
  description: "It's time to put your knowledge to work in the Wild.  Go forth and build!",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/foundations/the_front_end/project_html_css.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'JavaScript Basics',
  course_id: course.id,
  position: section_position,
  description: 'Here we finally dig into JavaScript and learn how to make the web dynamic.',
  identifier_uuid: '331227f7-c939-4988-b8b9-e140d2ded362',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 1',
  description: "You'll get a chance to start picking up the programming fundamentals you need to make your webpages dynamic",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-1.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 2',
  description: 'Continues where Fundamentals 2 leaves off!',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-2.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Developer Tools 2',
  description: 'covers using the dev tools from the perspective of a JS developer',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/developer_tools_2.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 3',
  description: 'Part 3 of our JS fundamentals course.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-3.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Problem Solving',
  section_id: section.id,
  position: lesson_position,
  description: 'In this lesson we will explore how to approach solving programming problems.',
  url: '/foundations/javascript_basics/problem_solving.md',
  is_project: false
)

lesson_position += 1
create_or_update_lesson(
  title: 'Rock Paper Scissors',
  description: 'Rock Paper Scissors',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/foundations/javascript_basics/project_rock_paper_scissors.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Clean Code',
  description: 'tips for writing better looking and easier to maintain code.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/clean_code.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 4',
  description: 'Part 4 of our JS fundamentals course.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-4.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'DOM manipulation',
  description: 'Finally, lets learn how to make your webpages move!',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/DOM-manipulation.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Etch-a-Sketch',
  description: 'etch-a-sketch',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/foundations/javascript_basics/project_etch_a_sketch.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 5',
  description: 'Part 5 of our JS fundamentals course.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-5.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Calculator',
  description: 'Calculator',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/foundations/javascript_basics/project_calculator.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'The Back End',
  course_id: course.id,
  position: section_position,
  description: "Here you'll learn about the back end, where we'll demystify what goes on behind the scenes on a web server.",
  identifier_uuid: '1bda637d-2590-4e0e-b988-a74605d09a8a',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to the Back End',
  description: 'A brief introduction to the wonderful world of server-side programming',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/the_back_end/introduction_to_the_backend_lesson.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to Frameworks',
  description: "Let's figure out what all the hubbub is all about.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/the_back_end/introduction_to_frameworks.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Tying it All Together',
  course_id: course.id,
  position: section_position,
  description: "Now that you've had a healthy taste of all the major components in a web application, we'll take a step back and remember where they all fit into the bigger picture.",
  identifier_uuid: '22cbdd2f-785b-40c9-9c54-d21755974df7',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: "How far you've come already!  But this ride's only just begun...",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/tying_it_all_together/conclusion.md',
  choose_path_lesson: true
)
