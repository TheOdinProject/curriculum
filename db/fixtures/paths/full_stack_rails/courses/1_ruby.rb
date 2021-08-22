#######################
# Course - Ruby
#######################
course = @path.add_course do |course|
  course.title = 'Ruby Programming'
  course.description = "Time to dive deep into Ruby, the language 'designed for programmer happiness.' You'll cover object-oriented design, testing, and data structures – essential knowledge for learning other programming languages, too!"
  course.identifier_uuid = '643bf355-19f1-4326-a4ad-8ec57f9ea254'
end

# +++++++++++++++++++++++++++++++
# SECTION - Introduction
# +++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Introduction'
  section.description = "In this section, we'll look at the path ahead and install Ruby."
  section.identifier_uuid = 'a5854f3d-8171-47d1-b53f-e325de67aca4'

  section.add_lessons(
    ruby_lessons.fetch('How this Course Will Work'),
    ruby_lessons.fetch('Installing Ruby'),
  )
end

# ++++++++++++++++++++
# SECTION - Basic Ruby
# ++++++++++++++++++++
course.add_section do |section|
  section.title = 'Basic Ruby'
  section.description = "In this section, we'll cover the basic building blocks of Ruby so you have them down cold. Everything else you'll learn in programming builds on these concepts, so you'll be in a great place to take on additional projects and languages in the future."
  section.identifier_uuid = 'bd6d7a38-54d6-4859-b508-c4a2e1deba6b'

  section.add_lessons(
    ruby_lessons.fetch('Basic Data Types'),
    ruby_lessons.fetch('Variables'),
    ruby_lessons.fetch('Input and Output'),
    ruby_lessons.fetch('Conditional Logic'),
    ruby_lessons.fetch('Loops'),
    ruby_lessons.fetch('Arrays'),
    ruby_lessons.fetch('Hashes'),
    ruby_lessons.fetch('Methods'),
    ruby_lessons.fetch('Basic Enumerable Methods'),
    ruby_lessons.fetch('Predicate Enumerable Methods'),
    ruby_lessons.fetch('Nested Collections'),
    ruby_lessons.fetch('Debugging'),
  )
end

# +++++++++++++++++++++++++++++
# SECTION - Basic Ruby Projects
# +++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Basic Ruby Projects'
  section.description = 'In this section we will solidify your basic Ruby knowledge by practicing with a few small projects.'
  section.identifier_uuid = '866d62bc-4c5a-4d3f-946f-5ca2787d5bc8'

  section.add_lessons(
    ruby_lessons.fetch('Caesar Cipher'),
    ruby_lessons.fetch('Sub Strings'),
    ruby_lessons.fetch('Stock Picker'),
    ruby_lessons.fetch('Bubble Sort'),
  )
end

# ++++++++++++++++++++++++++++++++++++++++++++
# SECTION - Object Oriented Programming Basics
# ++++++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Object Oriented Programming Basics'
  section.description = "You've got tools in your Ruby tool box and now it's time to combine them into more meaningful programs. In this section, you'll learn how to turn your spaghetti code into properly organized methods and classes."
  section.identifier_uuid = '0a7904f9-0824-4f32-b2b8-eedb2f47008d'

  section.add_lessons(
    ruby_lessons.fetch('Object Oriented Programming'),
    ruby_lessons.fetch('Tic Tac Toe'),
    ruby_lessons.fetch('Mastermind'),
  )
end

# +++++++++++++++++++++++++++++++++
# SECTION - Files and Serialization
# +++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Files and Serialization'
  section.description = 'What if you want to save the state of your program? How about loading in a file? Some basic operations like these will be covered here.'
  section.identifier_uuid = '2222cd27-0168-4046-8b69-6921fff1764c'

  section.add_lessons(
    ruby_lessons.fetch('Files and Serialization'),
    ruby_lessons.fetch('Event Manager'),
    ruby_lessons.fetch('Hangman'),
  )
end

# +++++++++++++++++++++++++++++++++++
# SECTION - Advanced Ruby
# +++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Advanced Ruby'
  section.description = "In this section you'll learn about some of Ruby's most powerful features and how using these techniques can simplify your code."
  section.identifier_uuid = 'bf5655dc-bd79-4cb4-b8c8-6f018f940f08'

  section.add_lessons(
    ruby_lessons.fetch('Blocks'),
    ruby_lessons.fetch('Pattern Matching'),
    ruby_lessons.fetch('Custom Enumerables'),
  )
end

# +++++++++++++++++++++++++++++++++++
# SECTION - A Bit of Computer Science
# +++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'A Bit of Computer Science'
  section.description = "In this section, you'll learn some fundamental computer science concepts that will help you when solving problems with a bit more complexity than just simple web serving.  You get to try on your engineering hat and solve some pretty nifty problems."
  section.identifier_uuid = '1dc1d088-73be-4590-9eaa-73309f614b7c'

  section.add_lessons(
    ruby_lessons.fetch('A Very Brief Intro to CS'),
    ruby_lessons.fetch('Recursive Methods'),
    ruby_lessons.fetch('Recursion'),
    ruby_lessons.fetch('Common Data Structures and Algorithms'),
    ruby_lessons.fetch('Linked Lists'),
    ruby_lessons.fetch('Binary Search Trees'),
    ruby_lessons.fetch('Knights Travails'),
  )
end

# +++++++++++++++++++++++++++++++++
# SECTION - Testing Ruby with RSpec
# +++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Testing Ruby with RSpec'
  section.description = "You've been briefly introduced to testing in Ruby a couple of times before in the Foundations course, but now you're going to really learn why testing can be hugely helpful and how to apply it to your own projects."
  section.identifier_uuid = '1e8d5245-ed37-498e-a06e-be208aced01f'

  section.add_lessons(
    ruby_lessons.fetch('Test Driven Development'),
    ruby_lessons.fetch('Introduction to RSpec'),
    ruby_lessons.fetch('Connect Four'),
  )
end

# +++++++++++++
# SECTION - GIT
# +++++++++++++
course.add_section do |section|
  section.title = 'GIT'
  section.description = "You should be familiar with the basic Git workflow since you've been using it to save your projects along the way (right?!). This section will start preparing you for for the more intermediate-level uses of Git that you'll find yourself doing."
  section.identifier_uuid = '4e059547-a8fd-426d-b546-24c2222106c6'

  section.add_lessons(
    ruby_lessons.fetch('A Deeper Look at Git'),
    ruby_lessons.fetch('Using Git in the Real World'),
  )
end

# ++++++++++++++++++++
# SECTION - Conclusion
# ++++++++++++++++++++
course.add_section do |section|
  section.title = 'Conclusion'
  section.description = "You've come an exceptional distance already, now there's just the matter of wrapping it all together into one coherant package and creating something real. This is your Final Exam and a major feather in your cap. Once you've completed this section, you should have the confidence to tackle pretty much anything."
  section.identifier_uuid = '42521d3c-c22e-481f-9885-9ef1156897c6'

  section.add_lessons(
    ruby_lessons.fetch('Ruby Final Project'),
    ruby_lessons.fetch('Conclusion'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
