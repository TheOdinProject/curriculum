# CREATE PATH Full Stack JavaScript
# *********************************

path = create_or_update_path(
  title: 'Full Stack JavaScript',
  description: "This path takes you through our entire JavaScript curriculum. You'll learn everything you need to know to create beautiful responsive websites from scratch using JavaScript and NodeJs.",
  position: 4,
)

position = 0
courses_in_path = [
  { course_id: Course.find_by_title('Javascript').id, position: position += 1 },
  { course_id: Course.find_by_title('HTML and CSS').id, position: position += 1 },
  { course_id: Course.find_by_title('NodeJS').id, position: position += 1 },
  { course_id: Course.find_by_title('Getting Hired').id, position: position + 1 }
]

path.path_prerequisites.find_or_create_by!(prerequisite_id: Path.find_by_title('Foundations').id)

courses_in_path.each do |course_attrs|
  next if path.path_courses.map(&:course_id).include? course_attrs[:course_id]

  path.path_courses.create!(course_attrs)
end
