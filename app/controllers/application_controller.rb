class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)

		if current_user.profile_id == 2
			admin_path
		else
			member_path
		end

	end
	
  rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = 'Você não tem autorização para tal ação.'
		redirect_to (request.referer || member_path)
  end
  
end