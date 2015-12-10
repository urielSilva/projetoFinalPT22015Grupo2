class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  helper_method :clear_danger, 
                :conta_requisicoes_pendentes,
                :recupera_historico_requisicoes

  # Este método redireciona o usuário após o login
	def after_sign_in_path_for(resource)
		if current_user.member?
			member_path
		else
			admin_path
		end
	end
	
  # Caso o usuário não esteja autorizado a acessar um certo recurso, então ele é redirecionado
  # para a rota anterior ou para a home de membro
  rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = 'Você não tem autorização para tal ação.'
		redirect_to request.referer || member_path
  end

  # Caso um conteúdo não seja encontrado, o usuário é redirecionado para a raiz do sistema
  rescue_from ActiveRecord::RecordNotFound do
    flash[:error] = 'Conteúdo não encontrado.'
    redirect_back_or root_path
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
      if request_history.knowledge_request.user == current_user or !current_user.member?
        historicos << request_history
      end
    end

    return historicos
  end

end