class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Make sure we get the preference built after the user saves
  after_create :build_preferences, :send_welcome_email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :about, :github, :facebook, :twitter, :linkedin, :skype, :screenhero, :google_plus

  validates_uniqueness_of :email, :username
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

  def completed_lesson?(lesson)
    self.completed_lessons.include?(lesson)
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
