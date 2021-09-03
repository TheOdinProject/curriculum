########################
# Course - HTML and CSS
########################
course = @path.add_course do |course|
  course.title = 'HTML and CSS'
  course.description = "Good web design doesn't happen by accident. Now that you've gained a strong foundation in programming, this course takes a deeper look at front-end design, expanding on what is covered in Foundations. You'll learn how to design websites that look great on any device and you'll be equipped to deeply understand and create your own responsive design framework!"
  course.identifier_uuid = '70434eab-0ff2-4db5-9a4c-b78cebd010fe'
end

# +++++++++++++++++++++++++++++++++++
# SECTION - Basic HTML Page Structure
# +++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Basic HTML Page Structure'
  section.description = "In this section, we'll cover the whole range of HTML so you'll be completely comfortable with putting the right elements in the right places on a page."
  section.identifier_uuid = '58154fbf-c671-4a2c-9c34-cc29bb8a9d96'

  section.add_lessons(
    html_and_css_lessons.fetch('How This Course Will Work'),
    html_and_css_lessons.fetch('HTML Basics'),
    html_and_css_lessons.fetch('Linking Internal and External Pages'),
    html_and_css_lessons.fetch('Working with Images, Video and Other Media'),
    html_and_css_lessons.fetch('Embedding Images and Video'),
    html_and_css_lessons.fetch("What's New in HTML5")
  )
end

# +++++++++++++++++++++++++++++++++++++++
# SECTION - Displaying and Inputting Data
# +++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Displaying and Inputting Data'
  section.description = "Displaying and inputting data are two of your chief duties as a web developer. We'll cover the tools at your disposal, including tables and lists for display and forms for input."
  section.identifier_uuid = '40f1001c-dd69-4d48-a895-7565f159c349'

  section.add_lessons(
    html_and_css_lessons.fetch('Tables in HTML'),
    html_and_css_lessons.fetch('Ordered and Unordered Lists'),
    html_and_css_lessons.fetch('Forms for Collecting Data'),
    html_and_css_lessons.fetch('HTML Forms'),
  )
end

# +++++++++++++
# SECTION - CSS
# +++++++++++++
course.add_section do |section|
  section.title = 'CSS'
  section.description = "Here we'll cover each of the foundational CSS concepts in greater depth than you probably have before."
  section.identifier_uuid = '62092e47-16a7-4687-aaa3-a7c7a53f1bba'

  section.add_lessons(
    html_and_css_lessons.fetch('CSS Basics'),
    html_and_css_lessons.fetch('The Box Model'),
    html_and_css_lessons.fetch('Floats and Positioning'),
    html_and_css_lessons.fetch('Flexbox'),
    html_and_css_lessons.fetch('Grid'),
    html_and_css_lessons.fetch('Positioning and Floating Elements'),
    html_and_css_lessons.fetch('Best Practices'),
    html_and_css_lessons.fetch('Backgrounds and Gradients'),
    html_and_css_lessons.fetch('Building with Backgrounds and Gradients'),
  )
end

# +++++++++++++++++++++++
# SECTION - Accessibility
# +++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Accessibility'
  section.description = "The websites you create will be viewed by a wide range of users, including those who rely on various accessibility features due to any number of disabilities or limitations. As important as it is to make your site look good, it's just as important to make it usable by as many different users as possible."
  section.identifier_uuid = '5867ba24-9322-4219-93dd-eaeb05017349'

  section.add_lessons(
    html_and_css_lessons.fetch('Introduction to Web Accessibility')
    html_and_css_lessons.fetch('The Web Content Accessibility Guidelines')
    html_and_css_lessons.fetch('Semantic HTML')
    html_and_css_lessons.fetch('Accessible Colors')
    html_and_css_lessons.fetch('Keyboard Navigation')
    html_and_css_lessons.fetch('Meaningful Text')
    html_and_css_lessons.fetch('WAI-ARIA')
    html_and_css_lessons.fetch('Accessibility Auditing')
  )

# +++++++++++++++++++++++
# SECTION - Design and UX
# +++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Design and UX'
  section.description = "If you want to make your websites stop looking like they came from the 1990's, you'll need to gain an understanding for at least the best practices of design and User Experience (UX).  Not knowing this stuff is like charging over the next hill without any idea of why you're doing it."
  section.identifier_uuid = '192a4ba8-a105-4a46-bd22-09438a1565af'

  section.add_lessons(
    html_and_css_lessons.fetch('Introduction to Design and UX'),
    html_and_css_lessons.fetch('Fonts and Typography'),
    html_and_css_lessons.fetch('Design Teardown'),
  )
end

# ++++++++++++++++++++++++++++++++++++++++++++++
# SECTION - Responsive Design and CSS Frameworks
# ++++++++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Responsive Design and CSS Frameworks'
  section.description = 'These days you need to make sure your pages display easily on multiple viewport sizes by using fluid layouts and media queries. Luckily there are CSS frameworks like Twitter Bootstrap that can save you a ton of time developing standard pages and which come with responsive functionality for free.'
  section.identifier_uuid = 'b1696716-b20d-4129-b30f-19c58d745597'

  section.add_lessons(
    html_and_css_lessons.fetch('Responsive Design'),
    html_and_css_lessons.fetch('Building with Responsive Design'),
    html_and_css_lessons.fetch('CSS Frameworks like Bootstrap and Foundation'),
  )
end

# ++++++++++++++++++++++
# SECTION - Advanced CSS
# ++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Advanced CSS'
  section.description = "We'll take you beyond the basics of CSS and into a variety of additional topics from how to add some stylistic flair to your elements to using tools like preprocessors to save time and reduce repetition in your code."
  section.identifier_uuid = '799d5d45-2452-471b-ba6a-a4280dbc688e'

  section.add_lessons(
    html_and_css_lessons.fetch('Animations, Subtle Effects and Compatibility'),
    html_and_css_lessons.fetch('Using CSS Preprocessors to Save Time'),
    html_and_css_lessons.fetch('Design Your Own Grid-Based Framework'),
    html_and_css_lessons.fetch('Conclusion'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
