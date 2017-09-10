class UserProvider < ApplicationRecord
  belongs_to :user

  def self.find_user(auth)
    OmniauthProviders::Finder.find(auth).user
  end
end
