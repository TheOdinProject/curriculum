class Project < ApplicationRecord
  URL_REGEX = /\A(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/

  belongs_to :user
  belongs_to :lesson
  has_many :reports

  acts_as_votable
  paginates_per 100

  validates :repo_url, format: { with: URL_REGEX, message: 'must be a url' }
  validates :live_preview_url, format: { with: URL_REGEX, message: 'must be a url' }
  validates :repo_url, :live_preview_url, presence: true

  scope :all_submissions, ->(lesson_id) { where(lesson_id: lesson_id) }
  scope :reported, -> { joins(:reports).where(reports: { status: :active }) }
  scope :with_no_active_reports, -> { where.not(id: reported.ids).order('created_at desc') }

  def upvote_for(user)
    vote_by(voter: user)
  end

  def remove_vote_for(user)
    unliked_by(user)
  end

  def total_votes
    votes_for.count
  end
end
