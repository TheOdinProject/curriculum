# ***************************
# Path - Full Stack Rails
# ***************************
@path = Seeds::PathSeeder.create do |path|
  path.title = 'Full Stack Ruby on Rails'
  path.description = "This path takes you through our entire Ruby on Rails curriculum. The courses should be taken in the order that they are displayed. You'll learn everything you need to know to create beautiful responsive websites from scratch."
  path.identifier_uuid = '16109529-1526-4800-be11-0f655bcfb4cc'
  path.position = 2
end

load './db/fixtures/paths/full_stack_rails/courses/1_ruby.rb'
load './db/fixtures/paths/full_stack_rails/courses/2_databases.rb'
load './db/fixtures/paths/full_stack_rails/courses/3_rails.rb'
load './db/fixtures/paths/full_stack_rails/courses/4_html_and_css.rb'
load './db/fixtures/paths/full_stack_rails/courses/5_javascript.rb'
load './db/fixtures/paths/full_stack_rails/courses/6_getting_hired.rb'

# create path prerequisites
@path.path.path_prerequisites.find_or_create_by!(prerequisite_id: Path.find_by_title('Foundations').id)

# clean up any removed courses
@path.delete_removed_courses
