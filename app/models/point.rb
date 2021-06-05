class Point < ApplicationRecord
  validates :discord_id, presence: true, uniqueness: true

  def increment_points
    increment(:points)
  end
end
