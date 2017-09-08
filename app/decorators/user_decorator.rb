class UserDecorator < ApplicationDecorator
  def has_projects?
    projects.exists?
  end
end
