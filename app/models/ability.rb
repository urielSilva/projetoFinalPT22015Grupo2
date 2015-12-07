class Ability

  include CanCan::Ability

  def initialize(user)

    if user.admin?

      # Líder de Desenvolvimento e Pesquisa
      can :manage, :all
      # permissões especiais

    elsif user.mod?

      can :manage, :all

    else

      can :read, :all
      can [:update], User
      can [:associar], Activity
      can [:create, :update, :destroy], ActivitiesUser
      cannot :read, [ProjectsUser, ProjectHistory]

    end
  end
end