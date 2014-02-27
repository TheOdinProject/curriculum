class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Make sure we get the preference built after the user saves
  after_create :build_preferences, :send_welcome_email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :about, :github, :facebook, :twitter, :linkedin, :skype, :screenhero, :google_plus, :legal_agreement

  validates_uniqueness_of :email, :username
  validates_presence_of :legal_agreement, :message => "You need to accept the agreements to create your account"
  validates :username, :length => { :in => 4..20 }

  has_many :cal_events, :foreign_key => :creator_id
  has_one :user_pref

  # associates the user to the content he'd like to pair on
  has_many :content_activations, :dependent => :destroy
  has_many :content_buckets, :through => :content_activations

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
