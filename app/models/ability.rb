class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :update, :all, id: user.id
  end
end
