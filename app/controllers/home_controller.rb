class HomeController < ApplicationController

  before_action :authenticate_user!

  def index

    # Retorna um array de todos os projetos
    @projetos_usuario = current_user.projects
    @projects_user = ProjectsUser.where(user_id: current_user.id)

    # Retorna um array de todos os conhecimentos
    @conhecimentos_usuario = current_user.knowledges

    # Retorna um array de todas as atividades
    @atividades_usuario = current_user.activities
    @activities_user = ActivitiesUser.where(user_id: current_user.id)

    # Retorna um array de todas as requisicoes de conhecimento do usuário
    @historico_requisicoes_usuario = current_user.knowledge_requests

    # Retorna um array do histórico de projetos do usuário
    @historico_projetos_usuario = current_user.project_member_histories

    # Retorna a quantidade de requisições de conhecimento pendentes
    @requisicoes_pendentes = conta_requisicoes_pendentes

  end

end