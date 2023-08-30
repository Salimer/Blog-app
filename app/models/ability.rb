class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :delete, [Post, Comment], author_id: user.id
    end
  end
end
