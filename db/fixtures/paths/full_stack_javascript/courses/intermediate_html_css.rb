########################
# Course - HTML and CSS
########################
course = @path.add_course do |course|
  course.title = 'Intermediate HTML and CSS'
  course.description = "Let's learn a little more about what you can do with HTML and CSS."
  course.identifier_uuid = '866f2d6b-30ec-461c-9c0d-dc9f3d6ce71f'
end

# +++++++++++++++++++++++++++++++++++
# SECTION - Intermediate HTML Concepts
# +++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Intermediate HTML Concepts'
  section.description = "In this section, we'll finish covering the whole range of HTML so you'll be completely comfortable with putting the right elements in the right places on a webpage."
  section.identifier_uuid = 'f39a1b48-54c8-49ee-adf0-cde244a40fa7'

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
  section.description = "Our Foundations course taught you the basics of CSS, but here we'll dive into CSS concepts that'll make your web projects shine."
  section.identifier_uuid = '0f2b3262-25b7-48d1-bc85-1a79df12e9e5'

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
  section.description = "In this section, you'll learn how to use the new CSS Grid syntax to build complex layouts."
  section.identifier_uuid = '8ec95c47-baf5-4116-ac61-0672f6a0ed09'

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
