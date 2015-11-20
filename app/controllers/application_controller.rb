class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		# index_path

		if current_user.profile_id == 2
			admin_index_path
		else
			member_index_path
		end
	end

  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
	flash[:error] = exception.message
	redirect_to root_url
  end

end