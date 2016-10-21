class AdminFlash < ActiveRecord::Base

  validates :message, presence: true
  validates :expires, presence: true

  def self.unexpired_messages
    self.order('created_at desc').where('expires >= ?', Time.now)
  end

  def self.showable_messages(disabled_flash_ids)
    unexpired_messages.reject do |message|
      disabled_flash_ids.include?(message.id)
    end
  end
end
