class Lesson < ApplicationRecord
  extend FriendlyId

  friendly_id :slug_candidates, use: %i[slugged finders]

  belongs_to :section
  has_one :course, through: :section
  has_many :project_submissions
  has_many :lesson_completions, dependent: :destroy
  has_many :completing_users, through: :lesson_completions, source: :student

  validates :position, presence: true

  def type
    is_project? ? 'Project' : 'Lesson'
  end

  def position_in_section
    section_lessons.where('position <= ?', position).count
  end

  def import_content_from_github
    LessonContentImporter.for(self)
  end

  private

  def section_lessons
    section.lessons
  end

  def slug_candidates
    [
      :title,
      [:title, course_title]
    ]
  end

  def course_title
    course&.title
  end
end
