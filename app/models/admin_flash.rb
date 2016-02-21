class AdminFlash < ActiveRecord::Base
  
  validates :message, presence: true
  validates :expires, presence: true

  def self.unexpired_messages
    self.order("created_at desc").where("expires >= ?", Time.now)
  end

  def self.showable_messages disabled_flash_ids
    unexpired_messages.select{ |msg| !disabled_flash_ids.include?(msg.id) }
  end
end
