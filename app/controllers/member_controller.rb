class MemberController < ApplicationController

	before_action :authenticate_user!

	def index
		if current_user.admin?
			redirect_to admin_path
		end

    # Retorna um array de todos os projetos
    @projetos_usuario = current_user.projects
    
	end

end