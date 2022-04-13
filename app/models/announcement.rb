class Announcement < ApplicationRecord
  validates :message, presence: true
  validates :expires, presence: true

  scope :unexpired_messages, -> { order('created_at desc').where('expires >= ?', Time.zone.now) }
  scope :showable_messages, lambda { |disabled_announcement_ids|
    unexpired_messages.where.not(id: disabled_announcement_ids)
  }
end
