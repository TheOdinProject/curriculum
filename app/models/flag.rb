class Flag < ApplicationRecord
  belongs_to :flagger, class_name: 'User'
  belongs_to :project_submission

  validates :reason, presence: true

  enum status: { active: 0, resolved: 1 }
  enum action_taken: { pending: 0, warning: 1, ban: 2 }
end
