class ProjectDecorator < ApplicationDecorator
  def owner_name
    user.username
  end
end
