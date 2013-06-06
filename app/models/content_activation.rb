class ContentActivation < ActiveRecord::Base
  # This is the join table for users and the content they are 
  # currently looking to schedule pairing sessions for.

  attr_accessible :user, :content_bucket

  validates_presence_of [:user, :content_bucket]
  validates_uniqueness_of :user, :scope => :content_bucket

  belongs_to :user
  belongs_to :content_bucket

end
