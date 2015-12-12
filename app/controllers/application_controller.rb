class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  helper_method :clear_danger,
                :recupera_atividades,
                :recupera_conhecimentos,
                :conta_requisicoes_pendentes,
                :recupera_historico_requisicoes

  # Este método redireciona o usuário após o login para sua home
	def after_sign_in_path_for(resource)
    home_path
	end
	
  # Caso o usuário não esteja autorizado a acessar um certo recurso, então ele é redirecionado
  # para a rota anterior ou para a home de membro
  rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = 'Você não tem autorização para tal ação.'
		redirect_to request.referer || home_path
  end

  # Caso um conteúdo não seja encontrado, o usuário é redirecionado para a raiz do sistema
  rescue_from ActiveRecord::RecordNotFound do
    flash[:error] = 'Conteúdo não encontrado.'
    redirect_back_or home_path
  end

  # Método que redireciona para a rota anterior
  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  # Método que limpa uma mensagem flash
  def clear_danger
    flash[:danger] = nil
  end

  # Método que conta o número de requisições de conhecimento pendentes
  def conta_requisicoes_pendentes
    requisicoes = KnowledgeRequest.all
    pendentes = 0

    requisicoes.each do |requisicao|
      if requisicao.em_analise?
        pendentes = pendentes + 1
      end
    end

    return pendentes
  end

  # Método que recupera todos os admins
  def recupera_admins
    admins = Array.new

    User.all.each do |user|
      if user.admin?
        admins << user
      end
    end

    return admins
  end

  # Método que recupera todos os históricos de requisição do usuário atual
  def recupera_historico_requisicoes
    historicos = Array.new

    RequestHistory.all.each do |request_history|
      if request_history.knowledge_request.user == current_user
        historicos << request_history
      end
    end

    return historicos
  end

  # Método que recupera todas as atividades do membro
  def recupera_atividades
    atividades = Array.new

    ActivitiesUser.all.each do |activity|
      if activity.user == current_user
        atividades << activity
      end
    end

    return atividades
  end

  # Método que recupera todos os conhecimentos do membro
  def recupera_conhecimentos
    conhecimentos = Array.new

    KnowledgesUser.all.each do |knowledge|
      if knowledge.user == current_user
        conhecimentos << knowledge
      end
    end

    return conhecimentos
  end

  # Método que recupera os históricos de projetos do usuário
  def recupera_historico_projetos
    historico = Array.new

    ProjectMemberHistory.all.each do |project_history|
      if project_history.user == current_user
        historico << project_history
      end
    end

    return historico
  end

end