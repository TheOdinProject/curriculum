class ProjectSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :flags, dependent: :delete_all

  validates :repo_url, url: true
  validates :live_preview_url, url: true
  validates :repo_url, :live_preview_url, presence: { message: 'Required' }

  scope :flagged, -> { joins(:flags).where(flags: { status: :active }) }
  scope :with_no_active_flags, -> { where.not(id: flagged.ids).order('created_at desc') }
  scope :viewable, -> { where(is_public: true, banned: false) }
end
