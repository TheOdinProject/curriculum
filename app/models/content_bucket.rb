class ContentBucket < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name

  # associates content to the user who's looking to schedule
  # time to pair on it
  has_many :content_activations
  has_many :users, :through => :content_activations

end
