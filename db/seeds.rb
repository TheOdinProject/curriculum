# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

generic_long_description = "The Odin Project is here to take you on a journey to becoming a web developer.  Maybe you have a creative spark that needs to get out, maybe you love the idea of having an in-demand skillset and maybe you just want to be able to build your startup yourself.  Regardless of why you're here, we've laid out a path that will guide you on your way to becoming a web developer.  We find the best resources out there so you don't have to waste time doing it yourself, and we give you projects to build as well so you can really learn the material and boost your portfolio."

generic_medium_description = "This section takes you through lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

generic_short_description = "This section takes you through lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

# Populate a handful of courses to include on the main page
courses = [
  {
    :title => "Introduction to Web Development", 
    :teaser => "Start Here!",
    :you_learn => ["What a web developer really does", "The tools of the trade","How to get hired as a web developer"],
    :you_build => ["Hold on, you'll be building soon!"],
  },
  {
    :title => "Web Development 101", 
    :teaser => "A Healthy Dose of Everything",
    :you_learn => ["How the web really works", "Basic HTML, CSS and Javascript","Basic Ruby, Rails, Databases and Git"],
    :you_build => ["Google's homepage in HTML/CSS", "A dynamic sketchpad with JS/jQuery", "A series of test-first Ruby challenges"]
  },
  {
    :title => "Ruby", 
    :teaser => "Become a True Rubyist",
    :you_learn => ["Organizing your code properly", "Working with files and scripts","Basic algorithms and data structures"],
    :you_build => ["TicTacToe, Mastermind and Hangman","A command line server and browser", "Chess!"]
  },
  {
    :title => "Ruby on Rails", 
    :teaser => "Build Real Websites",
    :you_learn => ["Organizing your code properly", "Working with files and scripts","Basic algorithms and data structures"],
    :you_build => ["TicTacToe, Mastermind and Hangman","A command line server and browser", "Chess!"]
  },
  {
    :title => "Javascript and jQuery", 
    :teaser => "Make Your Websites Really Dance",
    :you_learn => ["Organizing your code properly", "Working with files and scripts","Basic algorithms and data structures"],
    :you_build => ["TicTacToe, Mastermind and Hangman","A command line server and browser", "Chess!"]
  },
].each_with_index do |course, i|
  Course.create!(
    :title => course[:title],
    :title_url => course[:title].parameterize,
    :description => generic_medium_description,
    :brief_desc => generic_short_description,
    :teaser => course[:teaser],
    :position => i+1,
    :you_learn => course[:you_learn],
    :you_build => course[:you_build]
    )
end

# Set up the sections for our sample course, web dev 101
wd101_id = Course.where(:title => "Web Development 101").first.id
sections_array = []
sections = [
  { 
    :title => "The Basics", 
  },
  {
    :title => "The Front End",
  },
  {
    :title => "The Back End",
  },
  {
    :title => "The Other Stuff",
  }
]

sections.each_with_index do |section, i|
  sections_array << Section.create!(:title => section[:title], :title_url => section[:title].parameterize, :course_id => wd101_id, :position => i+1, :description => generic_short_description)
end

# Populate lessons for our sample course, web dev 101
lessons = [
    { :title => "How the Web Works",
      :is_project => false,
      :section_id_adder => 0,
      :url => "web_development_basics/how_does_the_web_work.md",
    },
    {
      :title => "How Your Computer Works",
      :is_project => false,
      :section_id_adder => 0,
      :url => "web_development_basics/how_does_your_computer_work.md"
    },
    {
      :title => "Terms to Know",
      :is_project => false,
      :section_id_adder => 0,
      :url => "web_development_basics/terms_to_know.md"
    },
    {
      :title => "Introduction to the Front End",
      :is_project => false,
      :section_id_adder => 1,
      :url => "web_development_basics/web_programming_basics/front_end_basics/index.md"
    },
    {
      :title => "HTML and CSS Basics",
      :is_project => false,
      :section_id_adder => 1,
      :url => "web_development_basics/web_programming_basics/front_end_basics/html_css_basics.md"
    },
    {
      :title => "HTML/CSS",
      :is_project => true,
      :section_id_adder => 1,
      :url => "web_development_basics/web_programming_basics/front_end_basics/project_html_css.md"
    },
    {
      :title => "Javascript Basics",
      :is_project => false,
      :section_id_adder => 1,
      :url => "web_development_basics/web_programming_basics/front_end_basics/js_jquery_basics.md"
    },
    {
      :title => "jQuery Basics",
      :is_project => false,
      :section_id_adder => 1,
      :url => "web_development_basics/web_programming_basics/front_end_basics/js_jquery_basics.md"
    },
    { 
      :title => "Javascript and jQuery",
      :is_project => true,
      :section_id_adder => 1,
      :url => "web_development_basics/web_programming_basics/front_end_basics/project_js_jquery.md"
    },
    {
      :title => "Ruby Basics",
      :is_project => false,
      :section_id_adder => 2,
      :url => "web_development_basics/web_programming_basics/back_end_basics/ruby_basics.md"
    },
    {
      :title => "Ruby",
      :is_project => true,
      :section_id_adder => 2,
      :url => "web_development_basics/web_programming_basics/back_end_basics/project_ruby.md"
    },
    {
      :title => "Database Basics",
      :is_project => false,
      :section_id_adder => 2,
      :url => "web_development_basics/web_programming_basics/database_basics.md"
    },
    { :title => "Finale",
      :is_project => false,
      :section_id_adder => 3,
      :url => "web_development_basics/finish.md"
    },
  ]

# Set up our sample lessons
lessons.each_with_index do |lesson, i|
  Lesson.create!(   
    :title => lesson[:title], 
    :title_url => lesson[:title].parameterize,
    :description => generic_short_description, 
    :position => i+1, 
    :section_id => sections_array.first.id + lesson[:section_id_adder], 
    :is_project => lesson[:is_project], 
    :url => lesson[:url])
end



