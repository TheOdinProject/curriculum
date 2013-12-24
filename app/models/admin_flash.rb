class AdminFlash < ActiveRecord::Base
  attr_accessible :message, :expires
  
  
end
