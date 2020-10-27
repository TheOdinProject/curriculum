# CREATE PATH FOUNDATIONS
# *********************************

path = create_or_update_path(
  title: 'Foundations',
  description: 'The Foundations Path is designed to be taken before all other paths. In this path you will learn the basic tools and technologies that every web developer needs to know.',
  position: 1,
  default_path: true
)

courses_in_path = [
  { course_id: Course.find_by_title('Foundations').id, position: 1 }
]

courses_in_path.each do |course_attrs|
  next if path.path_courses.map(&:course_id).include? course_attrs[:course_id]

  path.path_courses.create!(course_attrs)
end
