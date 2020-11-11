class Vote < ApplicationRecord
  scope :created_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }
end
