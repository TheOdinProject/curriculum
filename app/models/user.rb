class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model

  validates_uniqueness_of :username,:email
  validates_presence_of :legal_agreement, :message => "Don't forget the legal stuff!", :on => :create
  validates :username, :length => { :in => 4..20 }
  # associates the user with the lessons he's completed so far
  has_many :lesson_completions, :foreign_key => :student_id
  has_many :completed_lessons, :through => :lesson_completions, :source => :lesson

  # Return all users sorted by who has completed a lesson
  # most recently
  # NOTE: The order clause will break if not on Postgres because
  # NULLS LAST is PG-specific apparently
  def self.by_latest_completion
    User.where.not(:last_sign_in_at => nil)
        .joins("LEFT OUTER JOIN lesson_completions ON lesson_completions.student_id = users.id")
        .select("max(lesson_completions.created_at) as latest_completion_date, users.*")
        .group("users.id")
        .order("latest_completion_date desc NULLS LAST")
  end

  def completed_lesson?(lesson)
    self.completed_lessons.include?(lesson)
  end

  def latest_completed_lesson
    lc = self.latest_lesson_completion
    Lesson.find(lc.lesson_id) unless lc.nil?
  end

  def lesson_completion_time(lesson)
   t = self.lesson_completions.where("lesson_id = %s ", lesson.id ).limit(1)
    t.first["created_at"]
  end

  def latest_lesson_completion
    self.lesson_completions.order(:created_at => :desc).first
  end

  # Create a completely new user from our auth package
  # Returns that user
  def self.from_omniauth(auth)
    self.where(auth.slice(:provider, :uid).to_hash).first_or_create({
      provider: auth[:provider],
      uid: auth[:uid],
      username: auth[:info][:name],
      email: auth[:info][:email]
    })
  end

  # Assumes an existing user does not have omniauth
  # Adds auth, saves, and returns the user
  def add_omniauth(auth)
    self.provider ||= auth['provider']
    self.uid ||= auth['uid']
    self.save
    self
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

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  # Overwrite Devise method to send welcome email to new users with confirmation token
  # Users who registered before confirmation was required receive normal confirmation email
  def send_confirmation_instructions
    unless @raw_confirmation_token
      generate_confirmation_token!
    end

    send_welcome_email(@raw_confirmation_token)
  end

  protected

    def send_welcome_email(token)
      @token = token
      UserMailer.send_welcome_email_to(self, token).deliver_now!
    rescue => error
      logger.error "Error sending welcome email: #{error}"
    end
end
