class Lesson < ActiveRecord::Base
  extend FriendlyId

  belongs_to :section
  has_one :course, :through => :section
  has_many :lesson_completions, :dependent => :destroy
  has_many :completing_users, :through => :lesson_completions, :source => :student

  validates_uniqueness_of :position
  validates :content, presence: true, on: :update

  friendly_id :slug_canidates, use: [:slugged, :finders]

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

  def import_content_from_github
      update(content: decoded_content) if content_needs_updated
    rescue Octokit::Error => errors
      failed_to_import_message
  end

  private

  def decoded_content
    @decoded_content ||= Base64.decode64(github_response[:content])
  end

  def github_response
    Octokit.contents("theodinproject/curriculum", path: url)
  end

  def content_needs_updated
    content != decoded_content
  end

  def failed_to_import_message
    logger.error "Failed to import \"#{title}\" content: #{errors}"
    false
  end

  def section_lessons
    section.lessons
  end

  def find_lesson
    FindLesson.new(self)
  end

  def slug_canidates
    [
      :title,
      [:title, course_title]
    ]
  end

  def course_title
    self.course.title
  end
end
