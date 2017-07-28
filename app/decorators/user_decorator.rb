require 'delegate'

class UserDecorator < SimpleDelegator
  
  def has_projects?
    projects.exists?
  end
end
