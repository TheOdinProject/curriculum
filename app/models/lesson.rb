class Lesson < ActiveRecord::Base

  belongs_to :section
  has_one :course, :through => :section
  has_many :lesson_completions, :dependent => :destroy
  has_many :completing_users, :through => :lesson_completions, :source => :student

  validates_uniqueness_of :position
  validates :content, presence: true, on: :update

  def next_lesson
    find_lesson.next_lesson
  end

  def prev_lesson
    find_lesson.prev_lesson
  end

  def position_in_section
    section_lessons.where(
      "is_project = ? AND position <= ?", false, position
    ).count
  end

  def import_content
    response = Octokit.contents("theodinproject/curriculum", path: url)
    decoded = Base64.decode64(response[:content])
    update(content: decoded) if content != decoded
  end

  private

  def section_lessons
    section.lessons
  end

  def find_lesson
    FindLesson.new(self)
  end
end
