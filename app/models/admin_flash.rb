class AdminFlash < ActiveRecord::Base
  attr_accessible :message, :expires
  
  validates :message, presence: true
end
