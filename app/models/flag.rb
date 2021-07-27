class Flag < ApplicationRecord
  belongs_to :flagger, class_name: 'User'
  belongs_to :project_submission

  validates :reason, presence: true

  enum status: { active: 0, resolved: 1 }
  enum taken_action: { pending: 0, dismiss: 1, ban: 2, removed_project_submission: 3, notified_user: 4 }
end
