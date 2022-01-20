# *****************************
# Path - Full Stack JavaScript
# *****************************
@path = Seeds::PathSeeder.create do |path|
  path.title = 'Full Stack JavaScript'
  path.description = "This path takes you through our entire JavaScript curriculum. The courses should be taken in the order that they are displayed. You'll learn everything you need to know to create beautiful responsive websites from scratch using JavaScript and NodeJs."
  path.identifier_uuid = '624d152c-b522-4f7a-86aa-8f2d9c84b951'
  path.position = 3
end

load './db/fixtures/paths/full_stack_javascript/courses/2_html_and_css.rb'
load './db/fixtures/paths/full_stack_javascript/courses/1_javascript.rb'
load './db/fixtures/paths/full_stack_javascript/courses/3_node_js.rb'
load './db/fixtures/paths/full_stack_javascript/courses/4_getting_hired.rb'

# create path prerequisites
@path.path.path_prerequisites.find_or_create_by!(prerequisite_id: Path.find_by(title: 'Foundations').id)

# clean up any removed courses
@path.delete_removed_courses
