class PathCourse < ApplicationRecord
  belongs_to :path
  belongs_to :course

  validates :position, :course_id, :path_id, presence: true
end
