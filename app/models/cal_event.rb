class CalEvent < ActiveRecord::Base
  attr_accessible :summary, :start, :end, :description, :time_zone, :creator_id

  # IGNORING TIME ZONE SUPPORT FOR NOW
  validates_presence_of [:summary, :start, :end, :creator_id]  

  belongs_to :creator, :foreign_key => :creator_id, :class_name => "User"

end
