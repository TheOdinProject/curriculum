# CREATE PATH FOUNDATIONS
# *********************************

path = create_or_update_path(
  title: 'Foundations',
  description: "This is where it all begins! A hands-on introduction to all of the essential tools you'll need to build real, working websites. You'll learn what web developers actually do – the foundations you'll need for later courses.",
  position: 1,
  default_path: true,
  identifier_uuid: '33d7d165-e564-4ccd-9ac5-99b3ada05cd3',
)

courses_in_path = [
  { course_id: Course.find_by_title('Foundations').id, position: 1 }
]

courses_in_path.each do |course_attrs|
  next if path.path_courses.map(&:course_id).include? course_attrs[:course_id]

  path.path_courses.create!(course_attrs)
end
