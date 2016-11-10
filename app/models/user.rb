class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_uniqueness_of :username,:email
  validates_presence_of :legal_agreement, :message => "Don't forget the legal stuff!", :on => :create
  validates :username, :length => { :in => 4..20 }

  has_many :lesson_completions, :foreign_key => :student_id
  has_many :completed_lessons, :through => :lesson_completions, :source => :lesson

  def self.by_latest_completion
    User.includes(:lesson_completions).
      order('lesson_completions.created_at desc nulls last')
  end

  def completed_lesson?(lesson)
    self.completed_lessons.include?(lesson)
  end

  def latest_completed_lesson
    if last_lesson_completed
      Lesson.find(last_lesson_completed.lesson_id)
    end
  end

  def lesson_completion_time(lesson)
    self.lesson_completions.find_by(lesson_id: lesson.id).created_at
  end

  def last_lesson_completed
    ordered_lesson_completions.last
  end

  def self.from_omniauth(auth)
    self.where(auth.slice(:provider, :uid).to_hash).first_or_create({
      provider: auth[:provider],
      uid: auth[:uid],
      username: auth[:info][:name],
      email: auth[:info][:email]
    })
  end

  def add_omniauth(auth)
    self.provider ||= auth['provider']
    self.uid ||= auth['uid']
    self.save
    self
  end

  def password_required?
    super && provider.blank?
  end

  def send_confirmation_instructions
    send_welcome_email(raw_confirmation_token)
  end

  private

  def ordered_lesson_completions
    lesson_completions.order(created_at: :asc)
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def raw_confirmation_token
    @raw_confirmation_token ||= generate_confirmation_token!
  end

  def send_welcome_email(token)
    UserMailer.send_welcome_email_to(self, token).deliver_now!
    rescue => error
      logger.error "Error sending welcome email: #{error}"
    end
end
