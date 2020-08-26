class ProjectSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :flags

  validates :repo_url, url: true
  validates :live_preview_url, url: true
  validates :repo_url, :live_preview_url, presence: { message: 'Required' }

  scope :flagged, -> { joins(:flags).where(flags: { status: :active }) }
  scope :with_no_active_flags, -> { where.not(id: flagged.ids).order('created_at desc') }
  scope :for_public, -> { where(is_public: true) }
end
