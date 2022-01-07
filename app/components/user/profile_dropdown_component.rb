class User::ProfileDropdownComponent < ViewComponent::Base
  def initialize(current_user:)
    @current_user = current_user
  end

  private

  attr_reader :current_user
end
