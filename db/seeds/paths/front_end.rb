# CREATE PATH Frontend
# *********************************

path = create_or_update_path(
  title: 'Front End Only',
  description: "This path takes you through all of the front-end content in our curriculum. You'll learn HTML, CSS and JavaScript, but you will not encounter any Ruby or Rails.",
  position: 3,
  identifier_uuid: 'ea4b7790-cf7e-49eb-80c1-5fcb7d6df08d',
)

position = 0
courses_in_path = [
  { course_id: Course.find_by_title('JavaScript').id, position: position += 1 },
  { course_id: Course.find_by_title('HTML and CSS').id, position: position += 1 },
  { course_id: Course.find_by_title('Getting Hired').id, position: position + 1 }
]

path.path_prerequisites.find_or_create_by!(prerequisite_id: Path.find_by_title('Foundations').id)

courses_in_path.each do |course_attrs|
  next if path.path_courses.map(&:course_id).include? course_attrs[:course_id]

  path.path_courses.create!(course_attrs)
end
