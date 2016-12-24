class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    abilities
  end

  def abilities
    common_abilities

    if @user.admin?
      admin_abilities
    else
      standard_user_abilities
    end
  end

  def common_abilities
    can :update, UserDecorator, id: @user.id
  end

  def admin_abilities
    can [:update, :destroy], Project
  end

  def standard_user_abilities
    can [:update, :destroy], Project do |project|
      project.user == @user
    end
  end
end
