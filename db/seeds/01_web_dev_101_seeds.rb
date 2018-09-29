# ************************************************
# CREATE WEB DEVELOPMENT 101 COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: Web Development 101 *****"

# Set Course and section position here. Update file name appropriately.
course_position = 1
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: "Web Development 101",
  title_url: "Web Development 101".parameterize,
  description: "This is where it all begins! A hands-on introduction to all of the essential tools you'll need to build real, working websites. You'll learn what web developers actually do – the foundations you'll need for later courses.",
  position: course_position,
)

# ++++++++++++++++++++
# SECTION - The Basics
# ++++++++++++++++++++

section_position += 1
section = create_or_update_section(
  title: "The Basics",
  title_url: "The Basics".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This section will cover the baseline knowledge you need before getting into the more 'programming' aspects of web development.  You'll also get a chance to install the necessary software on your computer."
)

lesson_position += 1
create_or_update_lesson(
  title: "How this Course Will Work",
  title_url: "How this Course Will Work".parameterize,
  description: "Before you dive in, get familiar with the lay of the land up ahead.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_basics/how_this_course_will_work.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to Web Development",
  title_url: "Introduction to Web Development".parameterize,
  description: "Learn a little about web development as a career.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_basics/introduction_to_web_development.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Gearing Up",
  title_url: "Gearing Up".parameterize,
  description: "Some advice about how to approach learning to program.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_basics/gearing_up.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Join the Odin Community",
  title_url: "Join the Odin Community".parameterize,
  description: "Find out how to join Odin's community of new and veteran learners and how to get help with coding problems.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_basics/join_the_odin_community.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "How Does the Web Work?",
  title_url: "How Does the Web Work?".parameterize,
  description: "It's tough to program web sites without understanding how the web actually works!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_basics/how_does_the_web_work.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Command Line Basics",
  title_url: "Command Line Basics".parameterize,
  description: "The command line: loved, hated, and feared... but no longer by you.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_basics/command_line_basics.md",
  repo: 'curriculum'
)

# ++++++++++++++++++++
# SECTION - Installations
# ++++++++++++++++++++

section_position += 1
section = create_or_update_section(
  title: "Installations",
  title_url: "Installations".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section you will configure your development environment, install Ruby and Rails, and launch your first rails application."
)

lesson_position += 1
create_or_update_lesson(
  title: "Installation Overview",
  title_url: "Installation Overview".parameterize,
  description: "There are some things you'll need to install before you start getting your hands dirty",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/installations/installation_overview.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Prerequisites",
  title_url: "Prerequisites".parameterize,
  description: "Before we can install Ruby and Rails...",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/installations/prerequisites.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Text Editors",
  title_url: "Text Editors".parameterize,
  description: "The hottest debate in programming, VSCode or Sublime?",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/installations/text_editors.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Your First Rails Application",
  title_url: "Your First Rails Application".parameterize,
  description: "Time to dig in by making your first Rails Application",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/installations/project_your_first_rails_app.md",
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

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to Git",
  title_url: "Introduction Git".parameterize,
  description: "A high level overview of what Git is and why it's so useful",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/git_basics/introduction_to_git.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Git Basics",
  title_url: "Git Basics".parameterize,
  description: "Now that you know what Git is it's time to learn how to use it.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/git_basics/git_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Practicing Git Basics",
  title_url: "Practicing Git Basics".parameterize,
  description: "In this tutorial you will see how Git is used on a small project.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/git_basics/project_practicing_git_basics.md",
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

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to the Front End",
  title_url: "Introduction to the Front End".parameterize,
  description: "An overview of what exactly the 'Front End' is",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_front_end/introduction_to_the_front_end.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "HTML and CSS Basics",
  title_url: "HTML and CSS Basics".parameterize,
  description: "You'll learn all about how to build and style webpages with HTML and CSS",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_front_end/html_css_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Developer Tools",
  title_url: "Developer Tools".parameterize,
  description: "Learn all about your browser's developer tools.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_front_end/developer_tools.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "HTML/CSS",
  title_url: "HTML/CSS".parameterize,
  description: "It's time to put your knowledge to work in the Wild.  Go forth and build!",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/the_front_end/project_html_css.md",
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

lesson_position += 1
create_or_update_lesson(
  title: "Fundamentals Part 1",
  title_url: "JavaScript Fundamentals 1".parameterize,
  description: "You'll get a chance to start picking up the programming fundamentals you need to make your webpages dynamic",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics/fundamentals-1.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Fundamentals Part 2",
  title_url: "JavaScript Fundamentals 2".parameterize,
  description: "Continues where Fundamentals 2 leaves off!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics/fundamentals-2.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Developer Tools 2",
  title_url: "Developer Tools 2".parameterize,
  description: "covers using the dev tools from the perspective of a JS developer",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics/developer_tools_2.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Fundamentals Part 3",
  title_url: "JavaScript Fundamentals Part 3".parameterize,
  description: "Part 3 of our JS fundamentals course.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics/fundamentals-3.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Rock Paper Scissors",
  title_url: "Rock Paper Scissors".parameterize,
  description: "Rock Paper Scissors",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/javascript_basics/project_rock_paper_scissors.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Clean Code",
  title_url: "Clean Code".parameterize,
  description: "tips for writing better looking and easier to maintain code.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics/clean_code.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Fundamentals Part 4",
  title_url: "JavaScript Fundamentals Part 4".parameterize,
  description: "Part 4 of our JS fundamentals course.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics/fundamentals-4.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "DOM manipulation",
  title_url: "DOM manipulation".parameterize,
  description: "Finally, lets learn how to make your webpages move!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics/DOM-manipulation.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Etch-a-Sketch",
  title_url: "etch-a-sketch".parameterize,
  description: "etch-a-sketch",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/javascript_basics/project_etch_a_sketch.md",
  repo: 'curriculum'
)
lesson_position += 1
create_or_update_lesson(
  title: "Fundamentals Part 5",
  title_url: "JavaScript Fundamentals Part 5".parameterize,
  description: "Part 5 of our JS fundamentals course.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/javascript_basics/fundamentals-5.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Calculator",
  title_url: "Calculator".parameterize,
  description: "Calculator",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/javascript_basics/project_calculator.md",
  repo: 'curriculum'
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

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to the Back End",
  title_url: "Introduction to the Back End".parameterize,
  description: "A brief introduction to the wonderful world of server-side programming",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_back_end/introduction_to_the_backend_lesson.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Ruby Basics",
  title_url: "Ruby Basics".parameterize,
  description: "A healthy dive into Ruby, where you'll spend a fair bit of time mastering the basics of this programmer-friendly language.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/the_back_end/ruby_basics_lesson.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Ruby",
  title_url: "Ruby".parameterize,
  description: "Time to apply what you've learned about Ruby by making the tests pass on a number of exercises that range from goofy to challenging",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/the_back_end/ruby_project.md",
  repo: 'curriculum'
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

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to Frameworks",
  title_url: "Introduction to Frameworks".parameterize,
  description: "Let's figure out what all the hubbub is all about.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/web_development_frameworks/introduction_to_frameworks.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Ruby on Rails Basics",
  title_url: "Ruby on Rails Basics".parameterize,
  description: "You'll learn the basics of the wildly popular framework that has made thousands of programmers highly productive and happy.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/web_development_frameworks/rails_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Ruby on Rails",
  title_url: "Ruby on Rails".parameterize,
  description: "You've learned the basics, now let's put them to work by building a basic application.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/web_development_frameworks/project_rails.md",
  repo: 'curriculum'
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

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to Pair Programming",
  title_url: "Introduction to Pair Programming".parameterize,
  description: "A little background about why to even pair up in the first place.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/pair_programming/introduction_to_pair_programming.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Preparing to Remote Pair",
  title_url: "Preparing to Remote Pair".parameterize,
  description: "Even if you don't know anybody in the same town, you can still pair program!",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/pair_programming/prepare_to_remote_pair.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Pairing Project",
  title_url: "Pairing Project".parameterize,
  description: "Now that you know how to pair and have found someone to work with, let's do a project together.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/web_development_101/pair_programming/project_pairing.md",
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

lesson_position += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "How far you've come already!  But this ride's only just begun...",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/web_development_101/tying_it_all_together/conclusion.md",
  repo: 'curriculum'
)
