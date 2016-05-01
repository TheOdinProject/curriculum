class Lesson < ActiveRecord::Base

  belongs_to :section
  has_one :course, :through => :section
  has_many :lesson_completions, :dependent => :destroy
  has_many :completing_users, :through => :lesson_completions, :source => :student

  validates_uniqueness_of :position

  def next_lesson
    find_lesson(next_lesson_position) if !last_lesson?
  end

  def prev_lesson
    find_lesson(previous_lesson_position) if !first_lesson?
  end

  private

  def first_lesson?
    self.position <= 1
  end

  def lessons
    self.course.lessons.order("position asc")
  end

  def last_lesson?
    self.position >= lessons.first.position + lessons.size - 1
  end

  def find_lesson(lesson)
    lessons.find_by_position(lesson)
  end

  def next_lesson_position
    self.position + 1
  end

  def previous_lesson_position
    self.position - 1
  end
end
