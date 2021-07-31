# load all lessons
load './db/fixtures/lessons/foundation_lessons.rb'
load './db/fixtures/lessons/ruby_lessons.rb'
load './db/fixtures/lessons/database_lessons.rb'
load './db/fixtures/lessons/ruby_on_rails_lessons.rb'
load './db/fixtures/lessons/html_and_css_lessons.rb'
load './db/fixtures/lessons/javascript_lessons.rb'
load './db/fixtures/lessons/react_lessons.rb'
load './db/fixtures/lessons/getting_hired_lessons.rb'
load './db/fixtures/lessons/node_js_lessons.rb'

SeedFu.seed

# GENERATE SUCCESS STORY Content
load './db/seeds/success_stories.rb'

# GENERATE test projects
load './db/seeds/test_project_submissions.rb'

# GENERATE maintainer users for testing
load './db/seeds/maintainer_users.rb'
