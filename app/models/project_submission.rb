class ProjectSubmission < ApplicationRecord
  include Discard::Model

  before_update do
    self.discard_at = nil if repo_url_changed? || live_preview_url_changed?
  end

  acts_as_votable
  paginates_per 15

  belongs_to :user
  belongs_to :lesson
  has_many :flags, dependent: :destroy

  validates :repo_url, url: true
  validates :live_preview_url, allow_blank: true, url: true
  validates :repo_url, presence: { message: 'Required' }

  scope :viewable, -> { where(is_public: true, banned: false, discarded_at: nil) }
  scope :created_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }
  scope :discardable, -> { viewable.where('discard_at <= ?', Time.zone.now) }
end
