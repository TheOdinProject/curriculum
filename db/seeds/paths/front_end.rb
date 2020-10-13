# CREATE PATH Frontend
# *********************************

path = create_or_update_path(
  title: 'Front End Only',
  description: "This path takes you through all of the front-end content in our curriculum. You'll learn HTML, CSS and JavaScript, but you will not encounter any Ruby or Rails.",
  position: 1,
)

position = 0
courses_in_path = [
  { course_id: Course.find_by_title('Web Development 101').id, position: position += 1 },
  { course_id: Course.find_by_title('Javascript').id, position: position += 1 },
  { course_id: Course.find_by_title('HTML and CSS').id, position: position += 1 },
  { course_id: Course.find_by_title('Getting Hired').id, position: position + 1 }
]

courses_in_path.each do |course_attrs|
  next if path.path_courses.map(&:course_id).include? course_attrs[:course_id]

  path.path_courses.create!(course_attrs)
end
