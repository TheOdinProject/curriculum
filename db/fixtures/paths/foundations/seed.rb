# ************************
# Path - Foundations
# ************************
path = Seeds::PathSeeder.create do |path|
  path.title = 'Foundations'
  path.description = "This is where it all begins! A hands-on introduction to all of the essential tools you'll need to build real, working websites. You'll learn what web developers actually do – the foundations you'll need for later courses."
  path.identifier_uuid = '33d7d165-e564-4ccd-9ac5-99b3ada05cd3'
  path.position = 1
  path.default_path = true
end

#######################
# Course - Foundations
#######################

course = path.add_course do |course|
  course.title = 'Foundations'
  course.description = "This is where it all begins! A hands-on introduction to all of the essential tools you'll need to build real, working websites. You'll learn what web developers actually do – the foundations you'll need for later courses."
  course.identifier_uuid = '783e9b72-a447-4f49-a9b3-b62826d68e04'
end

# +++++++++++++++++++++++++++++++
# SECTION - Introduction
# +++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Introduction'
  section.description = "This section will cover the baseline knowledge you need before getting into the more 'programming' aspects of web development."
  section.identifier_uuid = '472bf0bc-2667-4206-84ea-43498b1d67f9'

  section.add_lessons(
    foundation_lessons.fetch('How this Course Will Work'),
    foundation_lessons.fetch('Introduction to Web Development'),
    foundation_lessons.fetch('Motivation and Mindset'),
    foundation_lessons.fetch('Join the Odin Community'),
    foundation_lessons.fetch('How Does the Web Work?'),
  )
end

# +++++++++++++++++++++++++++++++
# SECTION - Installations
# +++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Installations'
  section.description = 'In this section you will configure your development environment and install some software necessary for web development.'
  section.identifier_uuid = 'a6ff8570-b301-4275-8cb4-1847a8f8ae25'

  section.add_lessons(
    foundation_lessons.fetch('Installation Overview'),
    foundation_lessons.fetch('Prerequisites'),
    foundation_lessons.fetch('Text Editors'),
    foundation_lessons.fetch('Command Line Basics'),
    foundation_lessons.fetch('Setting Up Git'),
  )
end

# +++++++++++++++++++++++++++++++
# SECTION - Git Basics
# +++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Git Basics'
  section.description = 'In this section you will learn the basics of Git and how you can upload your future projects to GitHub so you can share your work and collaborate with others on projects easily.'
  section.identifier_uuid = '7fbf3991-88d4-4564-9982-dce53328f037'

  section.add_lessons(
    foundation_lessons.fetch('Introduction to Git'),
    foundation_lessons.fetch('Git Basics'),
    foundation_lessons.fetch('Practicing Git Basics'),
  )
end

# +++++++++++++++++++++++++++++++
# SECTION - The Front End
# +++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'The Front End'
  section.description = "In this section you'll spend a good deal of time getting familiar with the major client-side (browser-based) languages like HTML, CSS, and JavaScript. You'll get to build a webpage with HTML/CSS and learn some programming fundamentals with JavaScript."
  section.identifier_uuid = '552d3718-14c6-4b0a-848d-2dcca271ac61'

  section.add_lessons(
    foundation_lessons.fetch('Introduction to the Front End'),
    foundation_lessons.fetch('HTML and CSS Basics'),
    foundation_lessons.fetch('Developer Tools'),
    foundation_lessons.fetch('Google Homepage'),
  )
end

# +++++++++++++++++++++++++++++++
# SECTION - JavaScript Basics
# +++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'JavaScript Basics'
  section.description = 'Here we finally dig into JavaScript and learn how to make the web dynamic.'
  section.identifier_uuid = '331227f7-c939-4988-b8b9-e140d2ded362'

  section.add_lessons(
    foundation_lessons.fetch('Fundamentals Part 1'),
    foundation_lessons.fetch('Fundamentals Part 2'),
    foundation_lessons.fetch('Developer Tools 2'),
    foundation_lessons.fetch('Fundamentals Part 3'),
    foundation_lessons.fetch('Problem Solving'),
    foundation_lessons.fetch('Rock Paper Scissors'),
    foundation_lessons.fetch('Clean Code'),
    foundation_lessons.fetch('Fundamentals Part 4'),
    foundation_lessons.fetch('DOM manipulation'),
    foundation_lessons.fetch('Etch-a-Sketch'),
    foundation_lessons.fetch('Fundamentals Part 5'),
    foundation_lessons.fetch('Calculator'),
  )
end

# +++++++++++++++++++++++++++++++
# SECTION - The Back End
# +++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'The Back End'
  section.description = "Here you'll learn about the back end, where we'll demystify what goes on behind the scenes on a web server."
  section.identifier_uuid = '1bda637d-2590-4e0e-b988-a74605d09a8a'

  section.add_lessons(
    foundation_lessons.fetch('Introduction to the Back End'),
    foundation_lessons.fetch('Introduction to Frameworks'),
  )
end

# +++++++++++++++++++++++++++++++
# SECTION - Tying it All Together
# +++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Tying it All Together Maybe'
  section.description = "Now that you've had a healthy taste of all the major components in a web application, we'll take a step back and remember where they all fit into the bigger picture."
  section.identifier_uuid = '22cbdd2f-785b-40c9-9c54-d21755974df7'

  section.add_lessons(
    foundation_lessons.fetch('Choose Your Path Forward'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
path.delete_removed_courses
