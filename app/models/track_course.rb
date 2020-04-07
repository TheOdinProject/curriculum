class TrackCourse < ApplicationRecord
  belongs_to :track
  belongs_to :course

  validates :position, :course_id, :track_id, presence: true
end
