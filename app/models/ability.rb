class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    alias_action :update, :destroy, to: :modify
    @user = user || User.new
    common_abilities
  end

  def common_abilities
    can :update, UserDecorator, id: user.id
  end
end
