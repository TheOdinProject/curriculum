# CREATE TRACK Full Stack JavaScript
# *********************************

track = create_or_update_track(
  title: "Full Stack JavaScript",
  description: "This track takes you through our entire JavaScript curriculum.  You'll learn everything you need to know to create beautiful responsive websites from scratch using JavaScript and NodeJs.",
  position: 1,
)

position = 0
courses_in_track = [
  { course_id: Course.find_by_title('Web Development 101').id, position: position += 1 },
  { course_id: Course.find_by_title('Javascript').id, position: position += 1 },
  { course_id: Course.find_by_title('HTML and CSS').id, position: position += 1 },
  { course_id: Course.find_by_title('NodeJS').id, position: position += 1 },
  { course_id: Course.find_by_title('Getting Hired').id, position: position += 1 },
]

courses_in_track.each do |course_attrs|
  track.track_courses.create!(course_attrs) unless track.track_courses.map(&:course_id).include? course_attrs[:course_id] 
end
