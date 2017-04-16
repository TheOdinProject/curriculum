class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    alias_action :update, :destroy, to: :modify
    @user = user || User.new
    abilities
  end

  def abilities
    common_abilities

    if user.admin?
      admin_abilities
    else
      standard_user_abilities
    end
  end

  def common_abilities
    can :update, UserDecorator, id: user.id
  end

  def admin_abilities
    can :modify, Project
  end

  def standard_user_abilities
    can :modify, Project do |project|
      project.user == user
    end
  end
end
