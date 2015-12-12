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
      can [:requisitar], Knowledge
      can [:create, :update, :destroy], ActivitiesUser
      cannot :read, [ActivitiesUser, KnowledgesUser, ProjectsUser, ProjectHistory, ProjectMemberHistory, KnowledgeRequest, RequestHistory, RequestStatus, KnowledgeRequest]

    end
  end
end