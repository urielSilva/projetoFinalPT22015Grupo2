class Ability

  include CanCan::Ability

  def initialize(user)
    if user.admin?
        can :manage, :all
    else
        can :read, :all
        cannot :read, ProjectsUser
        cannot :read, ProjectHistory
        can [:update, :makemeadmin], User
    end
  end

end