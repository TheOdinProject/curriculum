class User < ApplicationRecord
  after_create :send_welcome_email

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github, :google]

  acts_as_voter

  validates_uniqueness_of :email
  validates :username, length: { in: 2..40 }
  validates :learning_goal, length: { maximum: 1700 }

  has_many :lesson_completions, foreign_key: :student_id
  has_many :completed_lessons, through: :lesson_completions, source: :lesson
  has_many :projects, dependent: :destroy
  has_many :user_providers, dependent: :destroy

  def progress_for(course)
    @progress ||= Hash.new { |h, c| h[c] = CourseProgress.new(c, self) }
    @progress[course]
  end

  def has_completed?(lesson)
    completed_lessons.exists?(lesson.id)
  end

  def latest_completed_lesson
    return unless last_lesson_completed
    Lesson.find(last_lesson_completed.lesson_id)
  end

  def lesson_completion_time(lesson)
    lesson_completions.find_by(lesson_id: lesson.id).created_at
  end

  def last_lesson_completed
    ordered_lesson_completions.last
  end

  def update_avatar(avatar)
    self.update!(avatar: avatar)
  end

  def password_required?
    super && provider.blank?
  end

  private

  def ordered_lesson_completions
    lesson_completions.order(created_at: :asc)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def send_welcome_email
    UserMailer.send_welcome_email_to(self).deliver_now!
  rescue => error
    logger.error "Error sending welcome email: #{error}"
  end
end
