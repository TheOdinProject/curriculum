class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Make sure we get the preference built after the user saves
  after_create :build_preferences, :send_welcome_email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :about, :github, :facebook, :twitter, :linkedin, :skype, :screenhero, :google_plus, :legal_agreement, :provider, :uid

  validates_uniqueness_of :email, :username
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

  # def self.find_for_github_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #   if user
  #     return user
  #   else
  #     registered_user = User.where(:email => auth.uid).first
  #     if registered_user
  #       return registered_user
  #     else
  #       user = User.create(name: auth.extra.raw_info.name, provider: auth.provider, uid: auth.uid, email: auth.email, password: Devise.friendly_token[0,20])
  #     end
  #   end
  # end

  include Authentication::ActiveRecordHelpers #check in domain/authentication/active_record_helpers.rb

  def apply_omniauth(omniauth)
    email = omniauth['info']['email'] if email.blank?
    username = omniauth['info']['nickname'] if username.blank?
    # binding.pry
    user = User.create(provider: omniauth['provider'], uid: omniauth['uid'], username: username, email: email)
  end

  def password_required? #only need password field if not already validated by github
    # binding.pry
    # omniauth = request.env["omniauth.auth"]
    # user = User.find_by(provider: omniauth['provider'], uid: omniauth['uid'])
    # if provider is empty or password is not blank, then password is required
    # if provider is not empty
    #binding.pry
      (self.provider.try(:empty?) || !password.blank?) && super
  end


  protected

    def build_preferences
      self.create_user_pref
    end

    def send_welcome_email
      begin
        UserMailer.send_welcome_email_to(self).deliver!
      rescue Exception => e
        puts "Error sending welcome email!"
        puts e.message
      end
    end

end
