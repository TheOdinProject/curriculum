class AdminFlash < ActiveRecord::Base
  attr_accessible :message, :expires
  
  validates :message, presence: true        
  validates :expires, presence: true  
 
#  If we were to use validates_timeliness gem :   
#  validates_datetime :start_date,
#    :after => :now,
#    :after_message => "Event cannot start in the past"


end