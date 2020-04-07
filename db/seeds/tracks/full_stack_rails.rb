# CREATE TRACK Full Stack Rails Course
# *********************************

track = create_or_update_track(
  title: "Full Stack Ruby on Rails",
  description: "This track takes you through our entire Ruby on Rails curriculum. You'll learn everything you need to know to create beautiful responsive websites from scratch. This is our default track. If you do not know where to start, select this track.",
  position: 1,
  default: true,
)

position = 0
courses_in_track = [
  { course_id: Course.find_by_title("Web Development 101").id, position: position += 1 },
  { course_id: Course.find_by_title("Ruby Programming").id, position: position += 1 },
  { course_id: Course.find_by_title("Databases").id, position: position += 1 },
  { course_id: Course.find_by_title("Ruby on Rails").id, position: position += 1 },
  { course_id: Course.find_by_title("HTML and CSS").id, position: position += 1 },
  { course_id: Course.find_by_title("Javascript").id, position: position += 1 },
  { course_id: Course.find_by_title("Getting Hired").id, position: position += 1 },
]

courses_in_track.each do |course_attrs|
  track.track_courses.create!(course_attrs) unless track.track_courses.map(&:course_id).include? course_attrs[:course_id] 
end
