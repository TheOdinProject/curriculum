class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:github, :google]

  validates_uniqueness_of :username, :email
  validates :username, length: { in: 4..20 }

  has_many :lesson_completions, foreign_key: :student_id
  has_many :completed_lessons, through: :lesson_completions, source: :lesson
  has_many :projects

  def completion_status(lesson)
    has_completed?(lesson) ? 'Completed' : 'Incomplete'
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar = auth.info.image
      user.skip_confirmation!
    end
  end

  def update_avatar(github_avatar)
    self.update!(avatar: github_avatar)
  end

  def add_omniauth(auth)
    self.tap do |user|
      user.provider ||= auth['provider']
      user.uid ||= auth['uid']
      user.save
    end
  end

  def password_required?
    super && provider.blank?
  end

  def send_confirmation_instructions
    generate_confirmation_token! unless @raw_confirmation_token
    send_welcome_email(@raw_confirmation_token)
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

  def send_welcome_email(token)
    UserMailer.send_welcome_email_to(self, token).deliver_now!
  rescue => error
    logger.error "Error sending welcome email: #{error}"
  end
end
