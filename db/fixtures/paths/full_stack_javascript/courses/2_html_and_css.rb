########################
# Course - HTML and CSS
########################
course = @path.add_course do |course|
  course.title = 'HTML and CSS'
  course.description = "It's time to dig in and become the CSS expert you deserve to be. After this course you'll be equipped to create web projects that look beautiful on any device!"
  course.identifier_uuid = '70434eab-0ff2-4db5-9a4c-b78cebd010fe'
end

# +++++++++++++++++++++++++++++++++++
# SECTION - Intermediate HTML Concepts
# +++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Intermediate HTML Concepts'
  section.description = "In this section, we'll finish covering the whole range of HTML so you'll be completely comfortable with putting the right elements in the right places on a page."
  section.identifier_uuid = '5388096b-4926-47a7-8891-a1dfa53cf200'

  section.add_lessons(
    html_and_css_lessons.fetch('Introduction'),
    html_and_css_lessons.fetch('Emmet'),
    html_and_css_lessons.fetch('Form Basics'),
    html_and_css_lessons.fetch('Form Validation'),
    html_and_css_lessons.fetch('SVG'),
    html_and_css_lessons.fetch('Tables'),
  )
end

# +++++++++++++++++++++++++++++++++++++++
# SECTION - Intermediate CSS Concepts
# +++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Intermediate CSS Concepts'
  section.description = "Our Foundations course taught you the basics of CSS, but here we'll really dive into what you need to know to make your web projects look however you want."
  section.identifier_uuid = '92d15409-837a-44cb-9183-6a5fa5b7c5c2'

  section.add_lessons(
    html_and_css_lessons.fetch('Default Styles'),
    html_and_css_lessons.fetch('CSS Units'),
    html_and_css_lessons.fetch('More Text Styles'),
    html_and_css_lessons.fetch('More CSS Properties'),
    html_and_css_lessons.fetch('Advanced Selectors'),
    html_and_css_lessons.fetch('Positioning'),
    html_and_css_lessons.fetch('CSS Functions'),
    html_and_css_lessons.fetch('Custom Properties'),
    html_and_css_lessons.fetch('Browser Compatibility'),
    html_and_css_lessons.fetch('Frameworks and Preprocessors'),
    html_and_css_lessons.fetch('Sign-up Form'),
  )
end

# +++++++++++++
# SECTION - ANIMATION
# +++++++++++++
course.add_section do |section|
  section.title = 'Animation'
  section.description = "Let's learn how to make things MOVE."
  section.identifier_uuid = '7fb7fd1a-3817-49e0-95d0-b46ecf1d5d7f'

  section.add_lessons(
    html_and_css_lessons.fetch('Transforms'),
    html_and_css_lessons.fetch('Transitions'),
    html_and_css_lessons.fetch('Keyframes'),
  )
end

# +++++++++++++
# SECTION - GRID
# +++++++++++++
course.add_section do |section|
  section.title = 'Grid'
  section.description = 'Learn how to use the new CSS Grid syntax to build your layouts'
  section.identifier_uuid = 'd4614f98-b9d5-494f-b551-8842d4aa73f9'

  section.add_lessons(
    html_and_css_lessons.fetch('Introduction to Grid'),
    html_and_css_lessons.fetch('Creating a Grid'),
    html_and_css_lessons.fetch('Positioning Grid Elements'),
    html_and_css_lessons.fetch('Advanced Grid Properties'),
    html_and_css_lessons.fetch('Grid vs. Flex'),
    html_and_css_lessons.fetch('Admin Dashboard'),
  )
end

# +++++++++++++++++++++++
# SECTION - Accessibility
# +++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Accessibility'
  section.description = "The websites you create will be viewed by a wide range of users, including those who rely on various accessibility features due to any number of disabilities or limitations. As important as it is to make your site look good, it's just as important to make it usable by as many different users as possible."
  section.identifier_uuid = 'c4200ae6-e97d-4e7a-9cd6-18dfd443953e'

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
  section.identifier_uuid = '556d8b4d-6f91-469f-b8eb-288e8a7d7642'

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
