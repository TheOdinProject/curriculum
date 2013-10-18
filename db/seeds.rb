# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c = Course.create!(:title => "Web Dev 101", :description => "This is a rad course about web development!", :title_url => "Web Dev 101".parameterize)

sections = []
[ "The Basics", 
  "The Front End", 
  "The Back End", 
  "The Other Stuff"
].each_with_index do |title, i|
  sections << Section.create!(:title => title, :title_url => title.parameterize, :course_id => c.id, :position => i+1)
end

lessons = [
            { :title => "How the Web Works",
              :is_project => false,
              :url => "web_development_basics/how_does_the_web_work.md"
            },
            {
              :title => "How Your Computer Works",
              :is_project => false,
              :url => "web_development_basics/how_does_your_computer_work.md"
            },
            {
              :title => "Terms to Know",
              :is_project => false,
              :url => "web_development_basics/terms_to_know.md"
            },
            {
              :title => "Introduction to the Front End",
              :is_project => false,
              :url => "web_development_basics/web_programming_basics/front_end_basics/index.md"
            },
            {
              :title => "HTML and CSS Basics",
              :is_project => false,
              :url => "web_development_basics/web_programming_basics/front_end_basics/html_css_basics.md"
            },
            {
              :title => "HTML/CSS",
              :is_project => true,
              :url => "web_development_basics/web_programming_basics/front_end_basics/project_html_css.md"
            },
            {
              :title => "Javascript Basics",
              :is_project => false,
              :url => "web_development_basics/web_programming_basics/front_end_basics/js_jquery_basics.md"
            },
            {
              :title => "jQuery Basics",
              :is_project => false,
              :url => "web_development_basics/web_programming_basics/front_end_basics/js_jquery_basics.md"
            },
            { 
              :title => "Javascript and jQuery",
              :is_project => true,
              :url => "web_development_basics/web_programming_basics/front_end_basics/project_js_jquery.md"
            },
            {
              :title => "Ruby Basics",
              :is_project => false,
              :url => "web_development_basics/web_programming_basics/back_end_basics/ruby_basics.md"
            },
            {
              :title => "Ruby",
              :is_project => true,
              :url => "web_development_basics/web_programming_basics/back_end_basics/project_ruby.md"
            },
            {
              :title => "Database Basics",
              :is_project => false,
              :url => "web_development_basics/web_programming_basics/database_basics.md"
            },
            { :title => "Finale",
              :is_project => false,
              :url => "web_development_basics/finish.md"
            },
          ]

# Set up our sample lessons
lessons.each_with_index do |lesson, i|
  Lesson.create!(   :title => lesson[:title], 
                    :title_url => lesson[:title].parameterize,
                    :description => "You will learn #{lesson[:title]}!", 
                    :position => i+1, 
                    :section_id => sections[(i.to_f / lessons.size * 3.0).round(0)].id, 
                    :is_project => lesson[:is_project], 
                    :url => lesson[:url])
end



