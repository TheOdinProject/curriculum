class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Make sure we get the preference built after the user saves
  after_create :build_preferences

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :about, :github, :facebook, :twitter, :linkedin, :skype, :screenhero, :google_plus, :legal_agreement, :provider, :uid

  validates_uniqueness_of :username,:email
  validates_presence_of :legal_agreement, :message => "Don't forget the legal stuff!", :on => :create
  validates :username, :length => { :in => 4..20 }

  # basic associations
  has_many :cal_events, :foreign_key => :creator_id
  has_one :user_pref
  # associates the user to the content he'd like to pair on
  has_many :content_activations, :dependent => :destroy
  has_many :content_buckets, :through => :content_activations
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

  def latest_lesson_completion
    self.lesson_completions.order(:created_at => :desc).first
  end

  include Authentication::ActiveRecordHelpers #check in domain/authentication/active_record_helpers.rb

  # Create a completely new user from our auth package
  # Returns that user
  def self.from_omniauth(auth)
    #puts "\n\n\n\n\n\n\n #{auth} \n\n\n\n\n\n\n\n"
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.username = auth['info']['nickname']
      user.email = auth['info']['email']
    end
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

  # Overwrite Devise method to allow users who registered before confirmation was required
  # to continue using the site without being forced to confirm their email.
  def active_for_authentication?
    super && (!confirmation_required? || confirmed? || confirmation_period_valid?) || reg_before_conf?
  end

  # Overwrite Devise method to send welcome email to new users with confirmation token
  # Users who registered before confirmation was required receive normal confirmation email
  def send_confirmation_instructions
    unless @raw_confirmation_token
      generate_confirmation_token!
    end
    if self.reg_before_conf == true
      opts = pending_reconfirmation? ? { to: unconfirmed_email } : { }
      send_devise_notification(:confirmation_instructions, @raw_confirmation_token, opts)
    else  # new user
      send_welcome_email(@raw_confirmation_token)
    end
  end


  protected

    def build_preferences
      self.create_user_pref
    end

    def send_welcome_email(token)
      begin
        @token = token
        UserMailer.send_welcome_email_to(self, token).deliver!
      rescue Exception => e
        puts "Error sending welcome email!"
        puts e.message
      end
    end
end
