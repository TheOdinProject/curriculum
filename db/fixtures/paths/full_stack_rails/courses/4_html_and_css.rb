########################
# Course - HTML and CSS
########################
course = @path.add_course do |course|
  course.title = 'HTML and CSS'
  course.description = "It's time to dig in and become the CSS expert you deserve to be. After this course you'll be equipped to create web projects that look beautiful on any device!"
  course.identifier_uuid = '6dee731e-4ef7-4986-9411-63ed9b2de9d9'
end

# +++++++++++++++++++++++++++++++++++
# SECTION - Intermediate HTML Concepts
# +++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Intermediate HTML Concepts'
  section.description = "In this section, we'll finish covering the whole range of HTML so you'll be completely comfortable with putting the right elements in the right places on a page."
  section.identifier_uuid = '8c29791f-af76-4344-a5d3-96cc93b34178'

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
  section.identifier_uuid = '1b1511bc-6373-4626-8d57-484ff7f78ee5'

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
  section.identifier_uuid = '818a7e0e-2275-4d35-85cf-051d77c8d20e'

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
  section.identifier_uuid = '36b2a55c-6fe4-447d-84a3-69a1644a63e6'

  section.add_lessons(
    html_and_css_lessons.fetch('Introduction to Grid'),
    html_and_css_lessons.fetch('Creating a Grid'),
    html_and_css_lessons.fetch('Positioning Grid Elements'),
    html_and_css_lessons.fetch('Advanced Grid Properties'),
    html_and_css_lessons.fetch('Grid Holy Grail'),
    html_and_css_lessons.fetch('Grid vs. Flex'),
  )
end

# +++++++++++++++++++++++
# SECTION - Accessibility
# +++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Accessibility'
  section.description = "The websites you create will be viewed by a wide range of users, including those who rely on various accessibility features due to any number of disabilities or limitations. As important as it is to make your site look good, it's just as important to make it usable by as many different users as possible."
  section.identifier_uuid = '029e39a5-7361-4327-be72-c967e01d7273'

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
  section.identifier_uuid = '5a3794b8-e05f-46b8-9b98-54e3c7decd40'

  section.add_lessons(
    html_and_css_lessons.fetch('Introduction to Responsive Design'),
    html_and_css_lessons.fetch('Natural Responsiveness'),
    html_and_css_lessons.fetch('Responsive Images'),
    html_and_css_lessons.fetch('Media Queries'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
