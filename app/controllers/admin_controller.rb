class AdminController < ApplicationController

  # Requer login antes de acessar
	before_action :authenticate_user!

	def index

    # Se um membro acessar a página, ele é redirecionado para sua home
		if current_user.member?
			redirect_to member_path
		end

    # Retorna um array de todos os projetos
    @projetos_usuario = current_user.projects

    # Retorna um array de todas as requisições de conhecimento
    @requisicoes_conhecimento = KnowledgeRequest.all

	end

end