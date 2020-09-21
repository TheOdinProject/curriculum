class ProjectSubmission < ApplicationRecord
  paginates_per 15

  belongs_to :user
  belongs_to :lesson
  has_many :flags, dependent: :destroy

  validates :repo_url, url: true
  validates :live_preview_url, url: true
  validates :repo_url, :live_preview_url, presence: { message: 'Required' }

  scope :viewable, -> { where(is_public: true, banned: false) }
end
