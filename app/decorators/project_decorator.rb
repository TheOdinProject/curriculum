class ProjectDecorator < ApplicationDecorator
  # Called by acts_as_votable gem under the hood
  def self.base_class
    Project
  end

  def owner_name
    user.username
  end
end
