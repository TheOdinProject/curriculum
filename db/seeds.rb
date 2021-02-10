# This file should contain all the record creation needed to seed the database
# with its default values.

# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).

# ******* NOTE ********
# You will have problems if you try to change the titles of
# courses/sections/lessons, since that's currently what's used to uniquely
# identify them!

# rubocop:disable Metrics/AbcSize
def create_or_update_path(path_attrs)
  path = Path.where(title: path_attrs[:title]).first

  if path.nil?
    path = Path.create!(path_attrs)
    Rails.logger.info ">>>> Created new path: #{path_attrs[:title]}!"
  elsif path.attributes == path_attrs
    Rails.logger.info "No changes to existing path: #{path_attrs[:title]}"
  else
    path.update(path_attrs)
    Rails.logger.info "Updated existing << PATH >>: #{path_attrs[:title]}"
  end

  path
end

def create_or_update_course(course_attrs)
  course = Course.where(title: course_attrs[:title]).first

  if course.nil?
    course = Course.create!(course_attrs)
    Rails.logger.info ">>>> Created new course: #{course_attrs[:title]}!"
  elsif course.attributes == course_attrs
    Rails.logger.info "No changes to existing course: #{course_attrs[:title]}"
  else
    course.update!(course_attrs)
    Rails.logger.info "Updated existing << COURSE >>: #{course_attrs[:title]}"
  end

  course
end

def create_or_update_section(section_attrs)
  section = Section.where(title: section_attrs[:title], course_id: section_attrs[:course_id]).first

  if section.nil?
    section = Section.create!(section_attrs)
    Rails.logger.info ">>>> Created new SECTION: #{section_attrs[:title]}!"
  elsif section.attributes == section_attrs
    Rails.logger.info "No changes to existing section: #{section_attrs[:title]}"
  else
    section.update!(section_attrs)
    Rails.logger.info "Updated existing SECTION: #{section_attrs[:title]}"
  end

  section
end

def create_or_update_lesson(lesson_attrs)
  lesson = Lesson.where(title: lesson_attrs[:title], section_id: lesson_attrs[:section_id]).first

  if lesson.nil?
    lesson = Lesson.create!(lesson_attrs)
    Rails.logger.info ">>>> Created new lesson: #{lesson_attrs[:title]}!"
  elsif lesson.attributes == lesson_attrs
    Rails.logger.info "No changes to existing lesson: #{lesson_attrs[:title]}"
  else
    lesson.update!(lesson_attrs)
    Rails.logger.info "Updated existing lesson: #{lesson_attrs[:title]}"
  end

  lesson
end
# rubocop:enable Metrics/AbcSize

load './db/seeds/01_foundations_seeds.rb'
load './db/seeds/02_ruby_course_seeds.rb'
load './db/seeds/03_database_course_seeds.rb'
load './db/seeds/04_rails_course_seeds.rb'
load './db/seeds/05_html_css_course_seeds.rb'
load './db/seeds/06_javascript_course_seeds.rb'
load './db/seeds/07_getting_hired_course_seeds.rb'
load './db/seeds/08_node_js_course_seeds.rb'

Rails.logger.info "\n\n***** STARTING PATHS *****"

load './db/seeds/paths/foundations.rb'
load './db/seeds/paths/full_stack_rails.rb'
load './db/seeds/paths/full_stack_javascript.rb'
load './db/seeds/paths/front_end.rb'

# GENERATE SUCCESS STORY Content
load './db/seeds/success_stories.rb'

# GENERATE test projects
load './db/seeds/test_project_submissions.rb'

#################
# SANITY CHECKS #
#################

Rails.logger.info "\n\n\n\n\n##################   SANITY CHECKS   ##################\n\n"
Rails.logger.info "#{Path.count} paths, #{Course.count} courses, #{Section.count} sections and #{Lesson.count} lessons in the database.\n"
Rails.logger.info "\n#######################################################\n\n\n\n"
