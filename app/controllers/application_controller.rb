class ApplicationController < ActionController::Base

  helper_method :clear_danger, :alocado
  protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
		if !current_user.member?
			admin_path
		else
			member_path
		end
	end
	
  rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = 'Você não tem autorização para tal ação.'
		redirect_to request.referer || member_path
  end

  def clear_danger
    flash[:danger] = nil
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:error] = 'Conteúdo não encontrado.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

end