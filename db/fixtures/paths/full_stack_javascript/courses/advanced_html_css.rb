########################
# Course - HTML and CSS
########################
course = @path.add_course do |course|
  course.title = 'Advanced HTML and CSS'
  course.description = "It's time to dig in and become the CSS expert you deserve to be. After this course you'll be equipped to create web projects that look beautiful on any device!"
  course.identifier_uuid = 'd4e151c0-e31d-4ee0-baeb-16693c3c80d0'
end

# +++++++++++++
# SECTION - ANIMATION
# +++++++++++++
course.add_section do |section|
  section.title = 'Animation'
  section.description = "Let's learn how to make things MOVE."
  section.identifier_uuid = '3634621a-044c-40bd-9040-4672f84f7464'

  section.add_lessons(
    html_and_css_lessons.fetch('Transforms'),
    html_and_css_lessons.fetch('Transitions'),
    html_and_css_lessons.fetch('Keyframes'),
  )
end

# +++++++++++++++++++++++
# SECTION - Accessibility
# +++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Accessibility'
  section.description = "The websites you create will be viewed by a wide range of users, including those who rely on various accessibility features due to any number of disabilities or limitations. As important as it is to make your site look good, it's just as important to make it usable by as many different users as possible."
  section.identifier_uuid = 'a742e6f1-d6a4-4157-8db7-bfa0accefb03'

  section.add_lessons(
    html_and_css_lessons.fetch('Introduction to Web Accessibility'),
    html_and_css_lessons.fetch('The Web Content Accessibility Guidelines'),
    html_and_css_lessons.fetch('Semantic HTML'),
    html_and_css_lessons.fetch('Accessible Colors'),
    html_and_css_lessons.fetch('Keyboard Navigation'),
    html_and_css_lessons.fetch('Meaningful Text'),
    html_and_css_lessons.fetch('WAI-ARIA'),
    html_and_css_lessons.fetch('Accessibility Auditing')
  )
end

# ++++++++++++++++++++++++++++++++++++++++++++++
# SECTION - Responsive Design and CSS Frameworks
# ++++++++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Responsive Design'
  section.description = 'These days you need to make sure your pages display easily on multiple viewport sizes by using fluid layouts and media queries.'
  section.identifier_uuid = 'fc5521bc-c6f9-48a8-b1a9-23d2a0088fa9'

  section.add_lessons(
    html_and_css_lessons.fetch('Introduction to Responsive Design'),
    html_and_css_lessons.fetch('Natural Responsiveness'),
    html_and_css_lessons.fetch('Responsive Images'),
    html_and_css_lessons.fetch('Media Queries'),
    html_and_css_lessons.fetch('Personal Portfolio'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
