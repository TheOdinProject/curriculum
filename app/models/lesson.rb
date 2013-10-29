class Lesson < ActiveRecord::Base

  attr_accessible :course_id, :description, :is_project, :position, :section_id, :title, :url, :title_url

  belongs_to :section
  has_one :course, :through => :section

  def next_lesson
    lessons = self.course.lessons.order("position asc")
    if self.position >= lessons.first.position + lessons.size - 1
      return nil
    else
      return lessons.find_by_position(self.position + 1)
    end
  end

  def prev_lesson
    lessons = self.course.lessons.order("position asc")
    if self.position <= 1
      return nil
    else
      return lessons.find_by_position(self.position - 1)
    end
  end

end
