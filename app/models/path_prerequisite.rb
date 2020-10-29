class PathPrerequisite < ApplicationRecord
  belongs_to :path
  belongs_to :prerequisite, class_name: 'Path'

  validates :prerequisite_id, uniqueness: { scope: :path_id }
end
