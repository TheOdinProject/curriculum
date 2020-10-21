# CREATE PATH Web Development 101
# *********************************

path = create_or_update_path(
  title: 'Web Development 101',
  description: "This is where it all begins! A hands-on introduction to all of the essential tools you'll need to build real, working websites. You'll learn what web developers actually do – the foundations you'll need for later paths.",
  position: 1,
)

courses_in_path = [
  { course_id: Course.find_by_title('Web Development 101').id, position: 1 }
]

courses_in_path.each do |course_attrs|
  next if path.path_courses.map(&:course_id).include? course_attrs[:course_id]

  path.path_courses.create!(course_attrs)
end
