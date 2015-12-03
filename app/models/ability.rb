class Ability

  include CanCan::Ability

  def initialize(user)

    if user.admin?

      can :manage, :all

    else

      can :read, :all
      can [:update], User

      if user.lider_ndp?
        can [:index, :new, :create, :show, :update, :destroy], [Project, 
                                                                ProjectRole, 
                                                                ProjectStatus,
                                                                ProjectsUser, 
                                                                ProjectHistory, 
                                                                ProjectMemberHistory]
      else
        cannot :read, [ProjectsUser, ProjectHistory]
      end

    end
  end
end