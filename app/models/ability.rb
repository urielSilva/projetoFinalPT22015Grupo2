class Ability

  include CanCan::Ability

  def initialize(user)
    if user.profile_id == 2 # profile_id == 2 => "Administrador"
        can :manage, :all
    else
        can :read, :all
        can [:update], User
    end
  end

end