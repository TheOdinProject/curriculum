########################
# Course - HTML and CSS
########################
course = @path.add_course do |course|
  course.title = 'Intermediate HTML and CSS'
  course.description = "Let's learn a little more about what you can do with HTML and CSS."
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
    html_and_css_lessons.fetch('Grid vs. Flex'),
    html_and_css_lessons.fetch('Admin Dashboard'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
