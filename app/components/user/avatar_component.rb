class User::AvatarComponent < ViewComponent::Base
  def initialize(current_user:, size_classes:)
    @current_user = current_user
    @size_classes = size_classes
  end

  private

  attr_reader :current_user, :size_classes
end
