# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# RESET ALL CURRICULUM-RELATED TABLES
Lesson.destroy_all
Section.destroy_all
Course.destroy_all


# CREATE INTRO TO WEB DEVELOPMENT COURSE
course_position = 1
c1 = Course.create!(
  :title => "Introduction to Web Development",
  :title_url => "Introduction to Web Development".parameterize,
  :teaser => "Start Here!",
  :brief_desc => "This course will start from zero, answering the basic questions people have about the actual practice and career of web development.  You'll gain a much better understanding of what you're about to get into!",
  :description => "This short course is about answering the basic questions people have about the actual practice and career of web development. Because, let's be honest, even if you've got a strong feeling that you like building things and web development is the right path for you, you still probably don't have a great idea of what developers actually do... and that's where everyone starts so it's okay.",
  :position => course_position,
  :you_learn => ["What a web developer really does", "The tools of the trade", "How to get hired as a web developer"],
  :you_build => ["Hold on, you'll be building soon!"],
  :is_active => true,
  )

c1_s1_of_1 = Section.create!(
    :title => "About Web Developers", 
    :title_url => "About Web Developers".parameterize, 
    :course_id => c1.id, 
    :position => 1, 
    :description => "Start from the beginning and learn about what a web developer really does and what the field of web development is really like."
  )

lesson_counter = 1
Lesson.create!(   
    :title => "What a Web Developer Does", 
    :title_url => "What a Web Developer Does".parameterize,
    :description => "From what a developer actually does to key distinctions like Front End vs Back End, Web Developers vs Web Designers, and Web Sites vs Web Applications", 
    :position => lesson_counter, 
    :section_id => c1_s1_of_1.id, 
    :is_project => false, 
    :url => "introduction_to_web_development/what_does_a_web_dev_do.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Web Development Jobs and Careers", 
    :title_url => "Web Development Jobs and Careers".parameterize,
    :description => "Some brief examples of what developer roles are like in a variety of different organizations", 
    :position => lesson_counter, 
    :section_id => c1_s1_of_1.id, 
    :is_project => false, 
    :url => "introduction_to_web_development/web_dev_jobs.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Tools of the Trade", 
    :title_url => "Tools of the Trade".parameterize,
    :description => "An overview of the different tools that web developers use to get their work done", 
    :position => lesson_counter, 
    :section_id => c1_s1_of_1.id, 
    :is_project => false, 
    :url => "introduction_to_web_development/tools_of_the_trade.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Web Development Communities", 
    :title_url => "Web Development Communities".parameterize,
    :description => "Developers are a surprisingly social group, and here's how to find them both online and in-person", 
    :position => lesson_counter, 
    :section_id => c1_s1_of_1.id, 
    :is_project => false, 
    :url => "introduction_to_web_development/web_dev_communities.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "The Best Web Developers", 
    :title_url => "The Best Web Developers".parameterize,
    :description => "Some tips on what makes a great web developer", 
    :position => lesson_counter, 
    :section_id => c1_s1_of_1.id, 
    :is_project => false, 
    :url => "introduction_to_web_development/the_best_web_devs.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Getting Hired as a Web Developer", 
    :title_url => "Getting Hired as a Web Developer".parameterize,
    :description => "Briefly demystifying what employers are actually looking for in a web developer and what the process might look like for you to get hired", 
    :position => lesson_counter, 
    :section_id => c1_s1_of_1.id, 
    :is_project => false, 
    :url => "introduction_to_web_development/getting_hired_as_a_web_dev.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Conclusion", 
    :title_url => "Conclusion".parameterize,
    :description => "A look ahead at your upcoming journey down the web development rabbit hole", 
    :position => lesson_counter, 
    :section_id => c1_s1_of_1.id, 
    :is_project => false, 
    :url => "introduction_to_web_development/conclusion.md"
  )


# ************************************************
# CREATE WEB DEVELOPMENT 101 COURSE

course_position += 1
c2 = Course.create!(
  :title => "Web Development 101",
  :title_url => "Web Development 101".parameterize,
  :teaser => "A Healthy Dose of Everything",
  :brief_desc => "This course is for anyone who is either starting from scratch or who isn't entirely comfortable with their understanding of the command line, HTML, CSS, Javascript, Ruby, web frameworks, Git, or other foundational technologies of web development.  We cover a LOT of ground -- by the end of this comprehensive course, you'll be well prepared to take on our deep dive courses or explore further on your own.",
  :description => "Now that you know what web developers do, it's time to start thinking about how they actually do it. In this course, you'll learn the foundational concepts of web programming. By the end, you will be able to build a simple webpage, style it, and add elements of interactivity while working comfortably from the command line.  You will be comfortable with basic scripting in Ruby and Javascript as well as more unfamiliar things like Git and databases.  We will cover a lot of knowledge and you'll be able to get your hands dirty with all the topics that we're going to learn in the deep-dive courses that follow.",
  :position => course_position,
  :you_learn => ["How the web really works","Basic HTML, CSS, and Javascript", "Basic Ruby, Rails, Databses and Git"],
  :you_build => ["Google's homepage in HTML/CSS","A dynamic sketchpad with JS/jQuery","A series of test-first Ruby challenges"],
  :is_active => true,
  )

c2_s1_of_6 = Section.create!(
    :title => "The Basics", 
    :title_url => "The Basics".parameterize, 
    :course_id => c2.id, 
    :position => 1, 
    :description => "This section will cover the baseline knowledge you need before getting into the more 'programming' aspects of web development.  You'll also get a chance to install the necessary software on your computer."
  )
c2_s2_of_6 = Section.create!(
    :title => "The Front End", 
    :title_url => "The Front End".parameterize, 
    :course_id => c2.id, 
    :position => 2, 
    :description => "In this section you'll spend a good deal of time getting familiar with the major client-side (browser-based) languages like HTML, CSS, and Javascript.  You'll get to build a webpage with HTML/CSS and learn some programming fundamentals with Javascript."
  )
c2_s3_of_6 = Section.create!(
    :title => "The Back End", 
    :title_url => "The Back End".parameterize, 
    :course_id => c2.id, 
    :position => 3, 
    :description => "Here you'll learn about the back end, where we'll demystify what goes on behind the scenes on a web server.  You'll get to take a crack at Ruby, the sublimely awesome language that runs Ruby on Rails."
  )
c2_s4_of_6 = Section.create!(
    :title => "Web Development Frameworks", 
    :title_url => "Web Development Frameworks".parameterize, 
    :course_id => c2.id, 
    :position => 4, 
    :description => "You've probably heard about 'Ruby on Rails' and 'Backbone.js' and other sleek-sounding development frameworks.  In this section, you'll learn what a framework is, why we use them, and get acquainted with the ones we'll be covering in future courses."
  )
c2_s5_of_6 = Section.create!(
    :title => "Additional Imporant Topics", 
    :title_url => "Additional Imporant Topics".parameterize, 
    :course_id => c2.id, 
    :position => 5, 
    :description => "This section has a bunch of short lessons that will introduce you to a variety of essential supporting technologies for your journey into web development."
  )
c2_s6_of_6 = Section.create!(
    :title => "Tying it All Together", 
    :title_url => "Tying it All Together".parameterize, 
    :course_id => c2.id, 
    :position => 6, 
    :description => "Now that you've had a healthy taste of all the major components in a web application, we'll take a step back and remember where they all fit into the bigger picture."
  )

lesson_counter += 1
Lesson.create!(   
    :title => "How this Course Will Work", 
    :title_url => "How this Course Will Work".parameterize,
    :description => "Before you dive in, get familiar with the lay of the land up ahead.", 
    :position => lesson_counter, 
    :section_id => c2_s1_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/how_this_course_will_work.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "How Does the Web Work?", 
    :title_url => "How Does the Web Work?".parameterize,
    :description => "It's tough to program web sites without understanding how the web actually works!", 
    :position => lesson_counter, 
    :section_id => c2_s1_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/how_does_the_web_work.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "How Does Your Computer Work?", 
    :title_url => "How Does Your Computer Work?".parameterize,
    :description => "The command line: loved, hated, and feared... but no longer by you.", 
    :position => lesson_counter, 
    :section_id => c2_s1_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/how_does_your_computer_work.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Terms to Know", 
    :title_url => "Terms to Know".parameterize,
    :description => "A brief look at the terms you'll need to understand going forward", 
    :position => lesson_counter, 
    :section_id => c2_s1_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/terms_to_know.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Installations", 
    :title_url => "Installations".parameterize,
    :description => "There are some things you'll need to install before you start getting your hands dirty", 
    :position => lesson_counter, 
    :section_id => c2_s1_of_6.id, 
    :is_project => true, 
    :url => "web_development_101/project_installations.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Introduction to the Front End", 
    :title_url => "Introduction to the Front End".parameterize,
    :description => "An overview of what exactly the 'Front End' is", 
    :position => lesson_counter, 
    :section_id => c2_s2_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/introduction_to_the_front_end.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "HTML and CSS Basics", 
    :title_url => "HTML and CSS Basics".parameterize,
    :description => "You'll learn all about how to build and style webpages with HTML and CSS", 
    :position => lesson_counter, 
    :section_id => c2_s2_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/html_css_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "HTML/CSS", 
    :title_url => "HTML/CSS".parameterize,
    :description => "It's time to put your knowledge to work in the Wild.  Go forth and build!", 
    :position => lesson_counter, 
    :section_id => c2_s2_of_6.id, 
    :is_project => true, 
    :url => "web_development_101/project_html_css.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Javascript Basics", 
    :title_url => "Javascript Basics".parameterize,
    :description => "You'll get a chance to start picking up the programming fundamentals you need to make your webpages dynamic", 
    :position => lesson_counter, 
    :section_id => c2_s2_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/javascript_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "jQuery Basics", 
    :title_url => "jQuery Basics".parameterize,
    :description => "You'll learn how to take your Javascript knowledge and seamlessly integrate it with webpages using the magic of jQuery", 
    :position => lesson_counter, 
    :section_id => c2_s2_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/jquery_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Javascript and jQuery", 
    :title_url => "Javascript and jQuery".parameterize,
    :description => "Think 'Etch-a-Sketch' with a bit of Funk.", 
    :position => lesson_counter, 
    :section_id => c2_s2_of_6.id, 
    :is_project => true, 
    :url => "web_development_101/project_js_jquery.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Introduction to the Back End", 
    :title_url => "Introduction to the Back End".parameterize,
    :description => "A brief introduction to the wonderful world of server-side programming", 
    :position => lesson_counter, 
    :section_id => c2_s3_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/introduction_to_the_back_end.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Ruby Basics", 
    :title_url => "Ruby Basics".parameterize,
    :description => "A healthy dive into Ruby, where you'll spend a fair bit of time mastering the basics of this programmer-friendly language.", 
    :position => lesson_counter, 
    :section_id => c2_s3_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/ruby_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Ruby", 
    :title_url => "Ruby".parameterize,
    :description => "Time to apply what you've learned about Ruby by making the tests pass on a number of exercises that range from goofy to challenging", 
    :position => lesson_counter, 
    :section_id => c2_s3_of_6.id, 
    :is_project => true, 
    :url => "web_development_101/project_ruby.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Databases", 
    :title_url => "Databases".parameterize,
    :description => "The last foundational component is how to 'save' your data by using a database.  You'll learn the basics of SQL, the language used to talk to most relational databases.", 
    :position => lesson_counter, 
    :section_id => c2_s3_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/database_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Introduction to Frameworks", 
    :title_url => "Introduction to Frameworks".parameterize,
    :description => "Let's figure out what all the hubbub is all about.", 
    :position => lesson_counter, 
    :section_id => c2_s4_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/introduction_to_frameworks.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Ruby on Rails Basics", 
    :title_url => "Ruby on Rails Basics".parameterize,
    :description => "You'll learn the basics of the wildly popular framework that has made thousands of programmers highly productive and happy.", 
    :position => lesson_counter, 
    :section_id => c2_s4_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/rails_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Ruby on Rails", 
    :title_url => "Ruby on Rails".parameterize,
    :description => "You've learned the basics, now let's put them to work by building a basic application.", 
    :position => lesson_counter, 
    :section_id => c2_s4_of_6.id, 
    :is_project => true, 
    :url => "web_development_101/project_rails.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Backbone.js", 
    :title_url => "Backbone.js".parameterize,
    :description => "A brief introduction to get you introduced to Backbone.js, a popular front-end web development framework we'll be covering in a separate course later.", 
    :position => lesson_counter, 
    :section_id => c2_s4_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/backbone_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Git Basics", 
    :title_url => "Git Basics".parameterize,
    :description => "Git is the version control system used by developers... like 'saving' meets 'time machine'", 
    :position => lesson_counter, 
    :section_id => c2_s5_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/git_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Testing Basics", 
    :title_url => "Testing Basics".parameterize,
    :description => "A brief introduction to testing in general and RSpec, Ruby's testing language.", 
    :position => lesson_counter, 
    :section_id => c2_s5_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/testing_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "The Cloud, Hosting, and Software as a Service (SAAS)", 
    :title_url => "The Cloud, Hosting, and Software as a Service (SAAS)".parameterize,
    :description => "It's time to bust through some of the buzzwords you've heard and see how they actually apply to you.", 
    :position => lesson_counter, 
    :section_id => c2_s5_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/the_cloud_hosting_and_saas.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Security, SSL, and Best Practices", 
    :title_url => "Security, SSL, and Best Practices".parameterize,
    :description => "A brief introduction to security concepts and best practices.", 
    :position => lesson_counter, 
    :section_id => c2_s5_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/security_ssl_and_best_practices.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "FTP Basics", 
    :title_url => "FTP Basics".parameterize,
    :description => "A very brief look at the File Transfer Protocol which is often used to upload files to your webserver.", 
    :position => lesson_counter, 
    :section_id => c2_s5_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/ftp_basics.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "How are Websites Built in the Real World?", 
    :title_url => "How are Websites Built in the Real World?".parameterize,
    :description => "A look at the macro level workflow from the client to the developer and then a closer look at what exactly the developer does.", 
    :position => lesson_counter, 
    :section_id => c2_s6_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/how_are_websites_built.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Principles of Good Programming", 
    :title_url => "Principles of Good Programming".parameterize,
    :description => "A look at some of the guiding principles of being a good programmer.  Basically: Be lazy", 
    :position => lesson_counter, 
    :section_id => c2_s6_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/principles_of_good_programming.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Conclusion", 
    :title_url => "Conclusion".parameterize,
    :description => "How far you've come already!  But this ride's only just begun...", 
    :position => lesson_counter, 
    :section_id => c2_s6_of_6.id, 
    :is_project => false, 
    :url => "web_development_101/conclusion.md"
  )

# ************************************************
# CREATE RUBY COURSE

course_position += 1
c3 = Course.create!(
  :title => "Ruby Programming",
  :title_url => "Ruby Programming".parameterize,
  :teaser => "Become a True Rubyist",
  :brief_desc => "Once you've completed Web Development 101, this course will take you deep into the wonderful world of Ruby.  You'll learn a combination of programming fundamentals and best practices and you will get the chance to build a variety of different projects along the way.",
  :description => "In this course you will learn Ruby, the language designed specifically with programmer happiness in mind. By the end of it all, you'll have built some pretty sweet projects including Tic Tac Toe, Hangman, a real web server, and even Chess. You'll be able to put together a Twitter spambot (that really spams!), save and open files, test out your code, separate your spaghetti code into nice modular classes, and even reproduce some basic algorithms and data structures for solving complex problems. Basically, you're going to start feeling a whole lot more like a real programmer and that feeling will be justified.",
  :position => course_position,
  :you_learn => ["How to write clean, effective, modular code","Working with files and scripts", "Basic algorithms and data structures"],
  :you_build => ["TicTacToe, Mastermind, and Hangman", "A command line server and browser","Chess (seriously)"],
  :is_active => true,
  )

section_course_id = c3.id

section_position = 1
c3_s1_of_7 = Section.create!(
    :title => "Basic Ruby", 
    :title_url => "Basic Ruby".parameterize, 
    :course_id => section_course_id, 
    :position => section_position, 
    :description => "In this section, we'll cover the basic building blocks of Ruby so you have them down cold.  Everything else you'll learn in programming builds on these concepts, so you'll be in a great place to take on additional projects and languages in the future."
  )
section_position += 1
c3_s2_of_7 = Section.create!(
    :title => "Intermediate Ruby", 
    :title_url => "Intermediate Ruby".parameterize, 
    :course_id => section_course_id, 
    :position => section_position, 
    :description => "You've got tools in your Ruby tool box and now it's time to combine them into more meaningful programs.  In this section, you'll learn how to turn your spaghetti code into properly organized methods and classes.  You'll also learn how to serialize code and save it into files."
  )

section_position += 1
c3_s3_of_7 = Section.create!(
    :title => "Ruby on the Web", 
    :title_url => "Ruby on the Web".parameterize, 
    :course_id => section_course_id, 
    :position => section_position, 
    :description => "This brief section will bridge the gap between what you've been doing on the command line and the wide world of the Internet... how do you send automated Tweets?  How about building a basic web server and browser of your own!"
  )
section_position += 1
c3_s4_of_7 = Section.create!(
    :title => "A Bit of Computer Science", 
    :title_url => "A Bit of Computer Science".parameterize, 
    :course_id => section_course_id, 
    :position => section_position, 
    :description => "In this section, you'll learn some fundamental computer science concepts that will help you when solving problems with a bit more complexity than just simple web serving.  You get to try on your engineering hat and solve some pretty nifty problems."
  )
section_position += 1
c3_s5_of_7 = Section.create!(
    :title => "Testing Ruby with RSpec", 
    :title_url => "Testing Ruby with RSpec".parameterize, 
    :course_id => section_course_id, 
    :position => section_position, 
    :description => "You've been briefly introduced to testing in Ruby a couple of times before in the Web Development 101 course, but now you're going to really learn why testing can be hugely helpful and how to apply it to your own projects."
  )
section_position += 1
c3_s6_of_7 = Section.create!(
    :title => "Git", 
    :title_url => "Git".parameterize, 
    :course_id => section_course_id, 
    :position => section_position, 
    :description => "You should be familiar with the basic Git workflow since you've been using it to save your projects along the way (right?!).  This section will start preparing you for for the more intermediate-level uses of Git that you'll find yourself doing ."
  )
section_position += 1
c3_s7_of_7 = Section.create!(
    :title => "Conclusion", 
    :title_url => "Conclusion".parameterize, 
    :course_id => section_course_id, 
    :position => section_position, 
    :description => "You've come an exceptional distance already, now there's just the matter of wrapping it all together into one coherant package and creating something real.  This is your Final Exam and a major feather in your cap.  Once you've completed this section, you should have the confidence to tackle pretty much anything."
  )


lesson_counter += 1
Lesson.create!(   
    :title => "How this Course Will Work", 
    :title_url => "How this Course Will Work".parameterize,
    :description => "It's time to get acquainted with what this will look like from here on out.", 
    :position => lesson_counter, 
    :section_id => c3_s1_of_7.id, 
    :is_project => false, 
    :url => "ruby/how_this_course_will_work.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Ruby Building Blocks", 
    :title_url => "Ruby Building Blocks".parameterize,
    :description => "A more in-depth look at the Ruby fundamentals like Variables, Data Types, Strings, and Methods.", 
    :position => lesson_counter, 
    :section_id => c3_s1_of_7.id, 
    :is_project => false, 
    :url => "ruby/building_blocks.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Building Blocks", 
    :title_url => "Building Blocks".parameterize,
    :description => "It's time to start getting used to building scripts without the training wheels on.", 
    :position => lesson_counter, 
    :section_id => c3_s1_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_building_blocks.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Advanced Ruby Building Blocks", 
    :title_url => "Advanced Ruby Building Blocks".parameterize,
    :description => "We'll continue our journey into the fundamentals, this time with Control Flow, Looping, Arrays, Hashes, Blocks and Sorting.", 
    :position => lesson_counter, 
    :section_id => c3_s1_of_7.id, 
    :is_project => false, 
    :url => "ruby/advanced_building_blocks.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Advanced Building Blocks", 
    :title_url => "Advanced Building Blocks".parameterize,
    :description => "Now you'll get the chance to really apply what you've learned so far by building a simple cipher and rebuilding the Enumerable methods that you'll use all the time going forward.", 
    :position => lesson_counter, 
    :section_id => c3_s1_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_advanced_building_blocks.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Object Oriented Programming", 
    :title_url => "Object Oriented Programming".parameterize,
    :description => "Fundamental concepts about object oriented programming that will help you with any programming language you learn from here on out.", 
    :position => lesson_counter, 
    :section_id => c3_s2_of_7.id, 
    :is_project => false, 
    :url => "ruby/oop.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "OOP", 
    :title_url => "OOP".parameterize,
    :description => "It's time to flex those new muscles a bit by building Tic Tac Toe and Mastermind on the command line", 
    :position => lesson_counter, 
    :section_id => c3_s2_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_oop.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Files and Serialization", 
    :title_url => "Files and Serialization".parameterize,
    :description => "What if you want to save the state of your program?  How about loading in a file?  Some basic operations like these will be covered here.", 
    :position => lesson_counter, 
    :section_id => c3_s2_of_7.id, 
    :is_project => false, 
    :url => "ruby/serialization.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "File I/O and Serialization", 
    :title_url => "File I/O and Serialization".parameterize,
    :description => "You'll get a chance to scrub an existing dataset and then work with dictionaries by building Hangman.", 
    :position => lesson_counter, 
    :section_id => c3_s2_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_file_io.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Bringing Ruby Online", 
    :title_url => "Bringing Ruby Online".parameterize,
    :description => "The intersection of Ruby with HTTP... superpowers sold separately.", 
    :position => lesson_counter, 
    :section_id => c3_s3_of_7.id, 
    :is_project => false, 
    :url => "new_org/ruby/bringing_ruby_online.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Ruby on the Web", 
    :title_url => "Ruby on the Web".parameterize,
    :description => "Ever wanted to SPAM your Twitter followers?  How about building your own basic web server?  There's no time like the present...", 
    :position => lesson_counter, 
    :section_id => c3_s3_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_web.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "A Very Brief Intro to CS", 
    :title_url => "A Very Brief Intro to CS".parameterize,
    :description => "Get a taste of what's coming up ahead and what the bigger world of CS looks like beyond the scope of this course.", 
    :position => lesson_counter, 
    :section_id => c3_s4_of_7.id, 
    :is_project => false, 
    :url => "ruby/a_very_brief_intro_to_cs.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Recursive Methods", 
    :title_url => "Recursive Methods".parameterize,
    :description => "Learn how making a function call itself can be helpful for making big problems into smaller problems", 
    :position => lesson_counter, 
    :section_id => c3_s4_of_7.id, 
    :is_project => false, 
    :url => "ruby/recursion.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Recursion", 
    :title_url => "Recursion".parameterize,
    :description => "Take your newfound knowledge and apply it to a couple of classic recursive problems", 
    :position => lesson_counter, 
    :section_id => c3_s4_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_recursion.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Common Data Structures and Algorithms", 
    :title_url => "Common Data Structures and Algorithms".parameterize,
    :description => "Learn why we use different data structures to handle our data and some classic algorithms for searching through them to help solve problems", 
    :position => lesson_counter, 
    :section_id => c3_s4_of_7.id, 
    :is_project => false, 
    :url => "ruby/data_structures_algorithms.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Data Structures and Algorithms", 
    :title_url => "Data Structures and Algorithms".parameterize,
    :description => "If you're scratching your head a bit on how to apply algorithmic thinking, here's are a couple of exercises that let you use the tools you've just developed.  This should also be helpful when thinking about Final Projects... hint hint...", 
    :position => lesson_counter, 
    :section_id => c3_s4_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_data_structures_algorithms.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Introduction to RSpec", 
    :title_url => "Introduction to RSpec".parameterize,
    :description => "Many tech companies these days rely on test-heavy methods of development so it's time to get familiar with it.", 
    :position => lesson_counter, 
    :section_id => c3_s5_of_7.id, 
    :is_project => false, 
    :url => "ruby/introduction_to_rspec.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Testing Ruby", 
    :title_url => "Testing Ruby".parameterize,
    :description => "The real way to learn is by doing, so you'll jump in the time machine and write some tests for prior projects.", 
    :position => lesson_counter, 
    :section_id => c3_s5_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_testing.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "A Deeper Look at Git", 
    :title_url => "A Deeper Look at Git".parameterize,
    :description => "Beyond just `$ git add` and `$ git commit`...", 
    :position => lesson_counter, 
    :section_id => c3_s6_of_7.id, 
    :is_project => false, 
    :url => "ruby/a_deeper_look_at_git.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Using Git in the Real World", 
    :title_url => "Using Git in the Real World".parameterize,
    :description => "We've just scratched the surface, so here's what to be aware of as you start developing more and more using Git.", 
    :position => lesson_counter, 
    :section_id => c3_s6_of_7.id, 
    :is_project => false, 
    :url => "ruby/using_git_in_the_real_world.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Ruby Final Project", 
    :title_url => "Ruby Final Project".parameterize,
    :description => "Now would be a good time to refresh your memory on how to play Chess. Building it is actually more fun (and more rewarding)!", 
    :position => lesson_counter, 
    :section_id => c3_s7_of_7.id, 
    :is_project => true, 
    :url => "ruby/project_final.md"
  )
lesson_counter += 1
Lesson.create!(   
    :title => "Conclusion", 
    :title_url => "Conclusion".parameterize,
    :description => "Woah! You made it! Let's take a minute to look back and put things in context for the next step ahead.", 
    :position => lesson_counter, 
    :section_id => c3_s7_of_7.id, 
    :is_project => false, 
    :url => "ruby/conclusion.md"
  )

# ************************************************
# CREATE RAILS COURSE

course_position += 1
c4 = Course.create!(
  :title => "Ruby on Rails",
  :title_url => "Ruby on Rails".parameterize,
  :teaser => "Build Real Websites",
  :brief_desc => "Now that you've got a good grounding in Ruby, it's time to put that to work by learning how to rapidly develop websites using Ruby on Rails.  By the end of this course, you'll be able to build and deploy a real website with confidence.  In fact, you'll do it over a dozen times.",
  :description => "In this course, you'll be doing a whole lot of building, each project a bit more advanced than the previous one.  You'll build about a dozen Rails projects from scratch, including one full-featured tutorial that we'll be following along with as we go and a full scale web application of your own.  More importantly, you'll learn how to deconstruct a website into its underlying data architecture and then build an application around that. By the end of it all, you'll have the confidence to put up a simple website in under an hour.",
  :position => course_position,
  :you_learn => ["How to build and deploy a web application from scratch","MVC like the back of your hand","Setting up the data architecture of a new site"],
  :you_build => ["A full featured Twitter clone", "A Github gist application that saves in real time", "A dozen others, from simple CRUD apps to AJAX APIs"],
  :is_active => false,
  )

# ************************************************
# CREATE HTML5/CSS3 COURSE

course_position += 1
c7 = Course.create!(
  :title => "HTML5 and CSS3",
  :title_url => "HTML5 and CSS3".parameterize,
  :teaser => "Make Your Sites Actually Look Good",
  :brief_desc => "Now that you're a pro in building website back ends, it's time to take a good hard look at the front end so your sites will stop looking like ugly ducklings and you can really begin to understand the DOM.  This shorter course will give you the tools to stop fighting with your CSS and start building more logically designed sites.",
  :description => "The trouble with being a back end guru is that you can build an awesome site that has distilled a complex problem into a clean series of modular operations and fast server calls. . . but it still looks like something from 1995.  In this unit, you'll get over your fear of CSS and begin to understand some of the more fundamental tenets of good site design.  This isn't a full course on front end design, but it should give you the tools you need to deeply understand CSS frameworks and how to put a half-decent facade on your genius backside.",
  :position => course_position,
  :you_learn => ["All about styling with CSS", "How to effectively use a front end framework like Bootstrap", "Basic principles of site layout and design"],
  :you_build => ["Several popular website visual front ends", "Your own front end framework", "A goodybag of CSS tricks and tactics"],
  :is_active => false,
  )

# ************************************************
# CREATE JAVASCRIPT/JQUERY COURSE

course_position += 1
c6 = Course.create!(
  :title => "Javascript and jQuery",
  :title_url => "Javascript and jQuery".parameterize,
  :teaser => "Make Your Websites Really Dance",
  :brief_desc => "The last component in your web development arsenal is the ability to make your front ends dynamically react to the user.  In this course you'll learn how to use Javascript and jQuery to interact with the DOM and make things like dropdown menus, parallax scroll effects, single page applications, and even games.  It will tie together everything you've learned already into one awesome package.",
  :description => "Javascript is taking over the world right now -- web applications are becoming more and more front-weighted.  While it used to be mostly a tool for animating drop down menus and validating form inputs, Javascript (with help from jQuery's magic) has grown into a way to produce full featured front end applications including single-page web apps.  In this section, you'll connect the Rails back ends you're an expert at building to dynamic front ends, completing the cycle to becoming a full stack web developer.  You'll learn some really nifty tricks and build some fun games along the way, too.",
  :position => course_position,
  :you_learn => ["How to build interactive games using HTML5 canvas","How to use a full range of jQuery effects on the DOM", "How to organize your JS into modular pieces"],
  :you_build => ["Javascript front ends for your Rails back ends", "A Javascript framework of your own","Snake, Missile Command and More"],
  :is_active => false,
  )

# ************************************************
# CREATE GETTING HIRED COURSE

course_position += 1
c5 = Course.create!(
  :title => "Getting Hired",
  :title_url => "Getting Hired".parameterize,
  :teaser => "Get Paid to Keep Learning",
  :brief_desc => "You've come extremely far and are now a capable web developer, but, as you've probably realize, the journey of discovery has only just begun.  Luckily, you're now useful enough that others will pay you to keep building and learning. . . and in this short course, we'll show you how to make that happen.",
  :description => "Learning on your own is a long hard road and you've come incredibly far.  Good work!  With that same level of focus and dedication, you should be able to polish off your skillsets, address your weak points, and get hired as a web developer.  Because you've still got a whole lot more to learn (it's really a lifetime journey) but now the best way to do that is by surrounding yourself with other great developers.  This course is all about that next step -- what else you'll need to know, where to find jobs, how to interview, and how to ultimately get that offer in hand.  It won't be easy, but you can do it!",
  :position => course_position,
  :you_learn => ["Where to find the appropriate job postings","How to market yourself effectively to employers", "How to ace the technical interview"],
  :you_build => ["Your personal portfolio website","A base of knowledge in more complex problem solving skills", "A clear strategy for getting hired"],
  :is_active => false,
  )

# lesson_counter += 1
# Lesson.create!(   
#     :title => "", 
#     :title_url => "".parameterize,
#     :description => "", 
#     :position => lesson_counter, 
#     :section_id => c3_s1_of_7.id, 
#     :is_project => false, 
#     :url => ""
#   )
# c2_s1_of_6 = Section.create!(
#     :title => "", 
#     :title_url => "".parameterize, 
#     :course_id => c1.id, 
#     :position => 1, 
#     :description => ""
#   )

# generic_long_description = "The Odin Project is here to take you on a journey to becoming a web developer.  Maybe you have a creative spark that needs to get out, maybe you love the idea of having an in-demand skillset and maybe you just want to be able to build your startup yourself.  Regardless of why you're here, we've laid out a path that will guide you on your way to becoming a web developer.  We find the best resources out there so you don't have to waste time doing it yourself, and we give you projects to build as well so you can really learn the material and boost your portfolio."

# generic_medium_description = "This section takes you through lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

# generic_short_description = "This section takes you through lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

# # Populate a handful of courses to include on the main page
# courses = [
#   {
#     :title => "Intro to Web Development", 
#     :teaser => "Start Here!",
#     :you_learn => ["What a web developer really does", "The tools of the trade","How to get hired as a web developer"],
#     :you_build => ["Hold on, you'll be building soon!"],
#   },
#   {
#     :title => "Web Development 101", 
#     :teaser => "A Healthy Dose of Everything",
#     :you_learn => ["How the web really works", "Basic HTML, CSS and Javascript","Basic Ruby, Rails, Databases and Git"],
#     :you_build => ["Google's homepage in HTML/CSS", "A dynamic sketchpad with JS/jQuery", "A series of test-first Ruby challenges"]
#   },
#   {
#     :title => "Ruby", 
#     :teaser => "Become a True Rubyist",
#     :you_learn => ["Organizing your code properly", "Working with files and scripts","Basic algorithms and data structures"],
#     :you_build => ["TicTacToe, Mastermind and Hangman","A command line server and browser", "Chess!"]
#   },
#   {
#     :title => "Ruby on Rails", 
#     :teaser => "Build Real Websites",
#     :you_learn => ["Organizing your code properly", "Working with files and scripts","Basic algorithms and data structures"],
#     :you_build => ["TicTacToe, Mastermind and Hangman","A command line server and browser", "Chess!"]
#   },
#   {
#     :title => "Javascript and jQuery", 
#     :teaser => "Make Your Websites Really Dance",
#     :you_learn => ["Organizing your code properly", "Working with files and scripts","Basic algorithms and data structures"],
#     :you_build => ["TicTacToe, Mastermind and Hangman","A command line server and browser", "Chess!"]
#   },
# ].each_with_index do |course, i|
#   Course.create!(
#     :title => course[:title],
#     :title_url => course[:title].parameterize,
#     :description => generic_medium_description,
#     :brief_desc => generic_short_description,
#     :teaser => course[:teaser],
#     :position => i+1,
#     :you_learn => course[:you_learn],
#     :you_build => course[:you_build]
#     )
# end

# # Set up the sections for our sample course, web dev 101
# wd101_id = Course.where(:title => "Web Development 101").first.id
# sections_array = []
# sections = [
#   { 
#     :title => "The Basics", 
#   },
#   {
#     :title => "The Front End",
#   },
#   {
#     :title => "The Back End",
#   },
#   {
#     :title => "The Other Stuff",
#   }
# ]

# sections.each_with_index do |section, i|
#   sections_array << Section.create!(:title => section[:title], :title_url => section[:title].parameterize, :course_id => wd101_id, :position => i+1, :description => generic_short_description)
# end

# # Populate lessons for our sample course, web dev 101
# lessons = [
#     { :title => "How the Web Works",
#       :is_project => false,
#       :section_id_adder => 0,
#       :url => "web_development_basics/how_does_the_web_work.md",
#     },
#     {
#       :title => "How Your Computer Works",
#       :is_project => false,
#       :section_id_adder => 0,
#       :url => "web_development_basics/how_does_your_computer_work.md"
#     },
#     {
#       :title => "Terms to Know",
#       :is_project => false,
#       :section_id_adder => 0,
#       :url => "web_development_basics/terms_to_know.md"
#     },
#     {
#       :title => "Introduction to the Front End",
#       :is_project => false,
#       :section_id_adder => 1,
#       :url => "web_development_basics/web_programming_basics/front_end_basics/index.md"
#     },
#     {
#       :title => "HTML and CSS Basics",
#       :is_project => false,
#       :section_id_adder => 1,
#       :url => "web_development_basics/web_programming_basics/front_end_basics/html_css_basics.md"
#     },
#     {
#       :title => "HTML/CSS",
#       :is_project => true,
#       :section_id_adder => 1,
#       :url => "web_development_basics/web_programming_basics/front_end_basics/project_html_css.md"
#     },
#     {
#       :title => "Javascript Basics",
#       :is_project => false,
#       :section_id_adder => 1,
#       :url => "web_development_basics/web_programming_basics/front_end_basics/js_jquery_basics.md"
#     },
#     {
#       :title => "jQuery Basics",
#       :is_project => false,
#       :section_id_adder => 1,
#       :url => "web_development_basics/web_programming_basics/front_end_basics/js_jquery_basics.md"
#     },
#     { 
#       :title => "Javascript and jQuery",
#       :is_project => true,
#       :section_id_adder => 1,
#       :url => "web_development_basics/web_programming_basics/front_end_basics/project_js_jquery.md"
#     },
#     {
#       :title => "Ruby Basics",
#       :is_project => false,
#       :section_id_adder => 2,
#       :url => "web_development_basics/web_programming_basics/back_end_basics/ruby_basics.md"
#     },
#     {
#       :title => "Ruby",
#       :is_project => true,
#       :section_id_adder => 2,
#       :url => "web_development_basics/web_programming_basics/back_end_basics/project_ruby.md"
#     },
#     {
#       :title => "Database Basics",
#       :is_project => false,
#       :section_id_adder => 2,
#       :url => "web_development_basics/web_programming_basics/database_basics.md"
#     },
#     { :title => "Finale",
#       :is_project => false,
#       :section_id_adder => 3,
#       :url => "web_development_basics/finish.md"
#     },
#   ]

# # Set up our sample lessons
# lessons.each_with_index do |lesson, i|
#   Lesson.create!(   
#     :title => lesson[:title], 
#     :title_url => lesson[:title].parameterize,
#     :description => generic_short_description, 
#     :position => i+1, 
#     :section_id => sections_array.first.id + lesson[:section_id_adder], 
#     :is_project => lesson[:is_project], 
#     :url => lesson[:url])
# end



