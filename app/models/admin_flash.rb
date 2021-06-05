class AdminFlash < ApplicationRecord
  validates :message, presence: true
  validates :expires, presence: true

  scope :unexpired_messages, -> { order('created_at desc').where('expires >= ?', Time.zone.now) }
  scope :showable_messages, ->(disabled_flash_ids) { unexpired_messages.where.not(id: disabled_flash_ids) }
end
