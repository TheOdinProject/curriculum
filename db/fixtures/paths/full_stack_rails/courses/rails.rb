########################
# Course - Ruby on Rails
########################
course = @path.add_course do |course|
  course.title = 'Ruby on Rails'
  course.description = "Take Ruby to the next level with the Ruby on Rails framework! Learn how to fully craft your site's backend using the Model-View-Controller design pattern. You'll gain the confidence to launch a website in under an hour."
  course.identifier_uuid = '100c8fbd-8cb0-4bdf-a809-66ecd69ec885'
end

# ++++++++++++++++++++++
# SECTION - Introduction
# ++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Introduction'
  section.description = 'In this section, we will install Rails.'
  section.identifier_uuid = 'e8d47281-55b2-4cc1-9679-a46d99fa2287'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('How this Course Will Work'),
    ruby_on_rails_lessons.fetch('Preparing for Deployment'),
    ruby_on_rails_lessons.fetch('Installing Rails'),
    ruby_on_rails_lessons.fetch('A Railsy Web Refresher')
  )
end

# ++++++++++++++++++++++
# SECTION - Rails Basics
# ++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Rails Basics'
  section.description = "It's time to start looking carefully into the foundational pieces of the Rails framework. We'll cover the path of an HTTP request from entering your application to returning as an HTML page to the browser."
  section.identifier_uuid = '8ffa853e-e5d0-44d8-a61c-4a620601c422'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('Routing'),
    ruby_on_rails_lessons.fetch('Controllers'),
    ruby_on_rails_lessons.fetch('Views'),
    ruby_on_rails_lessons.fetch('Deployment'),
    ruby_on_rails_lessons.fetch('Blog App'),
  )
end

# ++++++++++++++++++++++++++++++
# SECTION - Active Record Basics
# ++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Active Record Basics'
  section.description = "This section covers the back end of Rails, which is the most important part of the framework. You'll learn how to interface with databases using the fantastic Active Record gem."
  section.identifier_uuid = '0f07a836-ba21-472e-b2e5-82803862b1ae'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('Active Record Basics'),
    ruby_on_rails_lessons.fetch('Micro-Reddit'),
  )
end

# ++++++++++++++++++++++++++++
# SECTION - Assets and Navigation
# ++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Assets and Navigation'
  section.description = 'This section covers the how Rails serves your apps assets via The Asset Pipeline (Rails way of processing assets such as CSS, Javascript and Images.), and how it handles navigations within the app from links and form submissions.'
  section.identifier_uuid = 'db80ec29-a228-483c-b52b-c137c4ec0824'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('The Asset Pipeline'),
    ruby_on_rails_lessons.fetch('Importmaps'),
    ruby_on_rails_lessons.fetch('Turbo Drive'),
  )
end

# ++++++++++++++++++++++++++++++++++
# SECTION - Forms and Authentication
# ++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Forms and Authentication'
  section.description = "This section gets into some of the areas of web apps that are less glamorous than they are important.  Forms are your user's window to interact with your application. Authentication is critical for many applications, and you'll build a couple of auth systems from the ground up."
  section.identifier_uuid = '4cfbfcf7-f561-4e63-8bcd-050175684aba'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('Form Basics'),
    ruby_on_rails_lessons.fetch('Forms'),
    ruby_on_rails_lessons.fetch('Sessions, Cookies and Authentication'),
    ruby_on_rails_lessons.fetch('Members Only!'),
  )
end

# ++++++++++++++++++++++++++++++++++++++++++
# SECTION - Advanced Forms and Active Record
# ++++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Advanced Forms and Active Record'
  section.description = "Now it's starting to get fun! Learn how to do more than just find and show your users... you'll learn how to use relationships between models to greatly expand your abilities and how to build web forms with sufficient firepower to achieve your most ambitious goals."
  section.identifier_uuid = 'd391a4d0-8aa2-4eb0-bd58-2395ba3f837c'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('Active Record Queries'),
    ruby_on_rails_lessons.fetch('Active Record Associations'),
    ruby_on_rails_lessons.fetch('Private Events'),
    ruby_on_rails_lessons.fetch('Active Record Callbacks'),
    ruby_on_rails_lessons.fetch('Advanced Forms'),
    ruby_on_rails_lessons.fetch('Flight Booker'),
  )
end

# ++++++++++++++
# SECTION - APIs
# ++++++++++++++
course.add_section do |section|
  section.title = 'APIs'
  section.description = 'In this section we will explore harnessing the powers of other apps via their APIs and creating our own.'
  section.identifier_uuid = '0e7e7a73-8d9c-484f-8339-e63125ae89d3'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('APIs and Building Your Own'),
    ruby_on_rails_lessons.fetch('Working With External APIs'),
    ruby_on_rails_lessons.fetch('Kittens API'),
    ruby_on_rails_lessons.fetch('Flickr API'),
  )
end

# +++++++++++++++++++++++++
# SECTION - Rails Sprinkles
# +++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Rails Sprinkles'
  section.description = 'In this penultimate section we will explore how Rails sprinkles in additional features when the core stack is no longer suitable for your needs.'
  section.identifier_uuid = '16811b40-90cc-4e15-a81b-722d47cc6bc1'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('CSS Bundling'),
    ruby_on_rails_lessons.fetch('JS Bundling'),
    ruby_on_rails_lessons.fetch('Turbo'),
    ruby_on_rails_lessons.fetch('Stimulus'),
  )
end

# +++++++++++++++++++++++++++++++++++++
# SECTION - Mailers and Advanced Topics
# +++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Mailers and Advanced Topics'
  section.description = 'This final section will take you into some of the more interesting sides of the Rails ecosystem which will help you reach beyond your own app and into the lives of your users via email.'
  section.identifier_uuid = 'dc9c8e4c-f3e9-4536-81be-c4dc51f66dff'

  section.add_lessons(
    ruby_on_rails_lessons.fetch('Mailers'),
    ruby_on_rails_lessons.fetch('Sending Confirmation Emails'),
    ruby_on_rails_lessons.fetch('Advanced Topics'),
    ruby_on_rails_lessons.fetch('Websockets and Actioncable'),
    ruby_on_rails_lessons.fetch('Rails Final Project'),
    ruby_on_rails_lessons.fetch('Conclusion'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
