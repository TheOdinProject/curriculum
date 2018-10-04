# This file should contain all the record creation needed to seed the database
# with its default values.

# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).

# ******* NOTE ********
# You will have problems if you try to change the titles of
# courses/sections/lessons, since that's currently what's used to uniquely
# identify them!


# The Structure:
# Course Has Many Sections. Section Belongs To Course.
# Section Has Many Lessons. Lesson Belongs To Section.


# Public: Only run this update attributes if all have one or more records
# in thedatabase
def create_or_update_course(course_attrs)
  course = Course.where(title: course_attrs[:title]).first

  if course.nil?
    course = Course.create!(course_attrs)
    Rails.logger.info ">>>> Created new course: #{course_attrs[:title]}!"
  elsif course.attributes == course_attrs
    Rails.logger.info "No changes to existing course: #{course_attrs[:title]}"
  else
    course.update_attributes(course_attrs)
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
    section.update_attributes(section_attrs)
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
    lesson.update_attributes!(lesson_attrs)
    Rails.logger.info "Updated existing lesson: #{lesson_attrs[:title]}"
  end

  lesson
end

# Compare two attribute hashes (but ignoring unnecessary
# things like timestamps
def require_updates?(real_attrs, seed_attrs)
  # BUILD THIS FUNCTION LATER AND USE IT TO FIX THE
  # BROKEN IF/ELSE STATEMENTS SO IT DOESN'T ALWAYS
  # SAY "UPDATED" EVEN IF NOTHING CHANGED
end

load './db/seeds/01_web_dev_101_seeds.rb'
load './db/seeds/02_ruby_course_seeds.rb'
load './db/seeds/03_database_course_seeds.rb'
load './db/seeds/04_rails_course_seeds.rb'
load './db/seeds/05_html_css_course_seeds.rb'
load './db/seeds/06_javascript_course_seeds.rb'
load './db/seeds/07_getting_hired_course_seeds.rb'


# GENERATE SUCCESS STORY Content
# load './db/seeds/success_stories.rb'

#################
# SANITY CHECKS #
#################

Rails.logger.info "\n\n\n\n\n##################   SANITY CHECKS   ##################\n\n"
Rails.logger.info "#{Course.count} courses, #{Section.count} sections and #{Lesson.count} lessons in the database.\n"
Rails.logger.info "\n#######################################################\n\n\n\n"
