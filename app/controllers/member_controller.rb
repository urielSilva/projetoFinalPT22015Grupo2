class MemberController < ApplicationController

  # Requer login antes de continuar
	before_action :authenticate_user!

	def index

    # Se um usuário que não for membro acessar a página, ele é redirecionado para a home de admin
		if !current_user.member?
			redirect_to admin_path
		end

    # Retorna um array de todos os projetos
    @projetos_usuario = current_user.projects
    
	end

end