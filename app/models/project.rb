class Project < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :repo_url, format: { with: /\Ahttps?:\/\/github.com\//,
    message: 'must start with http://github.com/ or https://github.com/' }
end
