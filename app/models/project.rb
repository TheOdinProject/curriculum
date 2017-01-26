class Project < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :repo_url, format: { with: /\Ahttps?:\/\/github.com\//,
    message: 'must start with http://github.com/ or https://github.com/' }

  default_scope { order('updated_at desc') }
  scope :all_submissions, ->(lesson_id) { where(lesson_id: lesson_id) }
end
