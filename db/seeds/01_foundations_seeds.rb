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
  identifier_uuid: '73a47505-5085-4c7b-82a4-3f0d842edf66',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to Web Development',
  description: 'Learn a little about web development as a career.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/introduction_to_web_development.md',
  identifier_uuid: '9db1e5c7-63ea-4ae0-8c88-8f5d1821413e',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Motivation and Mindset',
  description: 'Some advice about how to approach learning to program.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/motivation_and_mindset.md',
  identifier_uuid: '276366c4-881b-4673-8e29-8f9ce8f3ae1d',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Join the Odin Community',
  description: "Find out how to join Odin's community of new and veteran learners and how to get help with coding problems.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/join_the_odin_community.md',
  identifier_uuid: 'd950a6fe-8d04-4f36-a9d3-1def19e0f7a7',
)

lesson_position += 1
create_or_update_lesson(
  title: 'How Does the Web Work?',
  description: "It's tough to program web sites without understanding how the web actually works!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/introduction/how_does_the_web_work.md',
  identifier_uuid: '1218a4a0-c92e-465b-b7c5-322ca5731a5f',
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
  identifier_uuid: 'ef45c208-6ebf-4fff-ba92-1d7584d3a9f2',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Prerequisites',
  description: 'Before we can install Ruby and Rails...',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/prerequisites.md',
  identifier_uuid: '93dbf0e1-3c06-46a8-8640-1d537e2e723b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Text Editors',
  description: 'The hottest debate in programming, VSCode or Sublime?',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/text_editors.md',
  identifier_uuid: 'e65a3229-f1a2-4589-ba7f-c114d8e0c645',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Command Line Basics',
  description: 'The command line: loved, hated, and feared... but no longer by you.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/command_line_basics.md',
  identifier_uuid: '3136c43f-e64d-4f92-bcb7-c7ed193c91e9',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Setting Up Git',
  description: 'The Source Code Ambulance',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/installations/setting_up_git.md',
  identifier_uuid: '8a13a21d-453e-4492-8240-58a2c8d9596f',
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
  identifier_uuid: '12ba3e27-8391-4f98-917a-b34b7babc23b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Git Basics',
  description: "Now that you know what Git is it's time to learn how to use it.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/git_basics/git_basics.md',
  identifier_uuid: 'e48795b0-1df8-49c8-9c63-2072f31a36eb',
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
  has_live_preview: false,
  identifier_uuid: '1b9a7591-32ae-4dd6-a94f-07b212da8c6a',
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
  identifier_uuid: '74fcb4ea-d96b-4c41-b3ac-cfd46d8cda54',
)

lesson_position += 1
create_or_update_lesson(
  title: 'HTML and CSS Basics',
  description: "You'll learn all about how to build and style webpages with HTML and CSS",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/the_front_end/html_css_basics.md',
  identifier_uuid: '364f5544-89ad-44aa-a4c7-34c5d1abd266',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Developer Tools',
  description: "Learn all about your browser's developer tools.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/the_front_end/developer_tools.md',
  identifier_uuid: '3b2d3077-0706-44b1-b8a9-7bf8ae24ccbc',
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
  has_live_preview: true,
  identifier_uuid: 'aaecd394-a1c4-4503-8493-4bf1f7c61d81',
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
  identifier_uuid: '94b3cc9b-75f8-4738-aa5c-fc50fa51e335',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 2',
  description: 'Continues where Fundamentals 2 leaves off!',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-2.md',
  identifier_uuid: '06069c6b-8278-4023-be4f-336156621ba3',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Developer Tools 2',
  description: 'covers using the dev tools from the perspective of a JS developer',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/developer_tools_2.md',
  identifier_uuid: '60494609-9c68-4ddb-8b3b-96dc8afd876c',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 3',
  description: 'Part 3 of our JS fundamentals course.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-3.md',
  identifier_uuid: 'a5836067-c3c3-47fb-9cef-02de0d00fa3b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Problem Solving',
  section_id: section.id,
  position: lesson_position,
  description: 'In this lesson we will explore how to approach solving programming problems.',
  url: '/foundations/javascript_basics/problem_solving.md',
  is_project: false,
  identifier_uuid: 'c7d096d3-d0db-4f4a-80f9-f1fd79ee6c6b',
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
  has_live_preview: true,
  identifier_uuid: '5cc2b83d-8024-4e07-82a0-38687b75c300',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Clean Code',
  description: 'tips for writing better looking and easier to maintain code.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/clean_code.md',
  identifier_uuid: 'e341018d-424e-40ac-b6cf-59fcdd422446',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 4',
  description: 'Part 4 of our JS fundamentals course.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-4.md',
  identifier_uuid: '336b3336-c589-4e61-876f-1c0e60617da4',
)

lesson_position += 1
create_or_update_lesson(
  title: 'DOM manipulation',
  description: 'Finally, lets learn how to make your webpages move!',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/DOM-manipulation.md',
  identifier_uuid: '7718816d-45eb-477d-9443-a8f1de2db22c',
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
  has_live_preview: true,
  identifier_uuid: 'fa9a5eea-a42c-4f89-9d53-6e1b8634d6ff',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fundamentals Part 5',
  description: 'Part 5 of our JS fundamentals course.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/javascript_basics/fundamentals-5.md',
  identifier_uuid: 'd85b729e-237e-4850-a6a8-44d84ecc6f52',
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
  has_live_preview: true,
  identifier_uuid: '2aa09e04-cbfa-4b48-97a6-140a760eda08',
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
  identifier_uuid: '9dfc032b-1919-41f8-9445-1c53d7be599b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to Frameworks',
  description: "Let's figure out what all the hubbub is all about.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/foundations/the_back_end/introduction_to_frameworks.md',
  identifier_uuid: '18a063b0-c22c-4415-aba4-eb2865a27fc4',
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
  choose_path_lesson: true,
  identifier_uuid: '01f33d4a-46c5-42ab-9aa6-23e21b789f6c',
)
