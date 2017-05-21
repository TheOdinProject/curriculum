require 'delegate'

class ProjectDecorator < SimpleDelegator

  def owner_name
    user.username
  end
end
