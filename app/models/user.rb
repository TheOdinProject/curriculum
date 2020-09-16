class User < ApplicationRecord
  after_create :send_welcome_email

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[github google]

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, length: { in: 2..100 }
  validates :learning_goal, length: { maximum: 1700 }

  has_many :lesson_completions, foreign_key: :student_id, dependent: :destroy
  has_many :completed_lessons, through: :lesson_completions, source: :lesson
  has_many :project_submissions, dependent: :destroy
  has_many :user_providers, dependent: :destroy
  belongs_to :track

  def progress_for(course)
    @progress ||= Hash.new { |hash, c| hash[c] = CourseProgress.new(c, self) }
    @progress[course]
  end

  def completed?(lesson)
    completed_lessons.exists?(lesson.id)
  end

  def latest_completed_lesson
    return if last_lesson_completed.nil?

    Lesson.find(last_lesson_completed.lesson_id)
  end

  def active_for_authentication?
    super && !banned?
  end

  def inactive_message
    !banned? ? super : :banned
  end

  private

  def last_lesson_completed
    lesson_completions.order(created_at: :asc).last
  end

  def send_welcome_email
    return if ENV['STAGING']

    UserMailer.send_welcome_email_to(self).deliver_now!
  end
end
