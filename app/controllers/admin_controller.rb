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

    # Retorna a quantidade de requisições de conhecimento pendentes
    @requisicoes_pendentes = conta_requisicoes_pendentes

	end

end