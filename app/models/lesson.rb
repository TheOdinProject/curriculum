class Lesson < ApplicationRecord
  extend FriendlyId

  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :section
  has_one :course, through: :section
  has_many :projects
  has_many :lesson_completions, dependent: :destroy
  has_many :completing_users, through: :lesson_completions, source: :student

  validates :position, presence: true

  def self.projects_without_submissions
    [
      'Installations',
      'Practicing Git Basics',
      'Building Your Resume'
    ]
  end

  def type
    is_project? ? 'Project' : 'Lesson'
  end

  def position_in_section
    section_lessons.where('position <= ?', position).count
  end

  def import_content_from_github
    LessonContentImporter.for(self)
  end

  def has_submission?
    is_project? &&
    accepts_submission? &&
    is_not_a_ruby_project? # should be removed after revamping ruby lessons
  end

  def has_live_preview?
    has_submission? && is_not_a_ruby_project?
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

  def accepts_submission?
    !Lesson.projects_without_submissions.include?(title)
  end

  def is_not_a_ruby_project?
    title != 'Ruby' && course_title != 'Ruby Programming'
  end
end
